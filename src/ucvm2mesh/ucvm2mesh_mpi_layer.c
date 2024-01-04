/**
 * ucvm2mesh_mpi_layer.c - Query UCVM to produce a 3D mesh on a regular grid
 *
 * This is a special version that allows a large mesh be created in a piecemeal 
 * fashion, in layers. From the mesh configuration file, (px * py * pz) is the 
 * total rank process unit. (px * py) is a set of ranks that are clustered as 
 * a layer, and pz is the number of layers defined on the mesh
 *
 * on blue waters, if the mesh is big try to stripe the result directory like
 * this:
 *    cd /path/to/working/directory
 *    lfs setstripe -c 4 ./
 *    lfs getstripe ./
 *
 * or use MPI IO hints : (haven't tried this)
 *    MPICH_MPIIO_CB_ALIGN=2
 *    MPICH_MPIIO_HINTS=striping_factor=32
 *  
 * Based on ucvm2mesh_mapi.c, updated by mei@usc.edu
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <getopt.h>
#include <mpi.h>
#include <unistd.h>
#include "um_dtypes.h"
#include "um_mpi.h"
#include "um_utils.h"
#include "um_stat.h"
#include "um_config.h"


/* Get opt args */
extern char *optarg;
extern int optind, opterr, optopt;

/* MPI Statistic vars */
MPI_Datatype MPI_STAT_T;
int num_fields_stat;

/* Display usage information */
void usage(char *arg)
{
  printf("Usage: %s [-h] [-o dir] -f configfile [-l layer] [-c count]\n\n", arg);

  printf("where:\n");
  printf("\t-h: help message\n");
  printf("\t-f: config file containing mesh params\n\n");
  printf("\t-l: which rank layer to start process\n\n");
  printf("\t-c: how many rank layer to process\n\n");
  printf("Config file format:\n");
  printf("\tucvmlist: comma-delimited list of CVMs to query (as supported by UCVM)\n");
  printf("\tucvmconf: UCVM API config file\n");
  printf("\tgridtype: location of x-y gridded points: VERTEX, or CENTER\n");
  printf("\tquerymode: query mode, DEPTH, or ELEVATION\n");
  printf("\tspacing: grid spacing (units appropriate for proj)\n");
  printf("\tproj: Proj.4 projection specification, or 'cmu' for TeraShake\n");
  printf("\trot: proj rotation angle in degrees, (+ is counter-clockwise)\n");
  printf("\tx0: longitude of origin (deg), or x offset in cmu proj (m)\n");
  printf("\ty0: latitude of origin (deg), or y offset in cmu proj (m)\n");
  printf("\tz0: depth of origin (m, typically 0.0)\n");
  printf("\tnx: number of points along x-axis\n");
  printf("\tny: number of points along y-axis\n");
  printf("\tnz: number of points along z-axis (depth positive)\n");
  printf("\tpx: number of procs along x-axis\n");
  printf("\tpy: number of procs along y-axis\n");
  printf("\tpz: number of procs along z-axis\n");
  printf("\tvp_min: vp minimum (m/s), enforced on vs_min conditions\n");
  printf("\tvs_min: vs minimum (m/s)\n");
  printf("\tmeshfile: path and basename to output mesh files\n");
  printf("\tgridfile: path and filename to output grid filesfiles\n");
  printf("\tmeshtype: mesh format: IJK-12, IJK-20, IJK-32, or SORD\n");
  printf("\tscratch: path to scratch space\n\n");

  printf("Version: %s\n\n", VERSION);
  return;
}


/* Initializer */
int init_app(int myid, int nproc, const char *cfgfile, mesh_config_t *cfg)
{
  /* Read in config */
  if (read_config(myid, nproc, cfgfile, cfg, 0) != 0) {
    fprintf(stderr, "[%d] Failed to parse config file %s\n", myid, cfgfile);
    return(1);
  }

  if (myid == 0) {
    disp_config(cfg);
  }

  return(0);
}


/* Perform extraction from UCVM */
int extract(int myid, int myrank, int nrank, mesh_config_t *cfg) 
{
  /* Buffers */
  int num_grid, num_points;
  ucvm_point_t *pntbuf;
  ucvm_data_t *propbuf;
  mesh_ijk32_t *node_buf;

  int part_dims[3];
  int j, k, i_start, i_end, j_start, j_end, k_start, k_end, n;
  size_t grid_offset, pnt_offset;
  double z;
  FILE *ifp;

  /* Compute partition dims */
  part_dims[0] = cfg->dims.dim[0]/cfg->proc_dims.dim[0];
  part_dims[1] = cfg->dims.dim[1]/cfg->proc_dims.dim[1];
  part_dims[2] = cfg->dims.dim[2]/cfg->proc_dims.dim[2];

  /* Compute number of nodes in my partition of x-y grid  */
  num_grid = ((cfg->dims.dim[0]/cfg->proc_dims.dim[0]) * 
	       (cfg->dims.dim[1]/cfg->proc_dims.dim[1]));

  /* Open output mesh file */
  if (mesh_open_mpi(myrank, nrank, \
		       &(cfg->dims), &(cfg->proc_dims),
		       cfg->meshfile, cfg->meshtype, num_grid) != 0) {
    fprintf(stderr, "[%d:%d] Error: mesh_open_mpi reported failure\n", myid,myrank);
    return(1);
  }

  /* Allocate buffers */
  pntbuf = malloc(num_grid * sizeof(ucvm_point_t));
  propbuf = malloc(num_grid * sizeof(ucvm_data_t));
  node_buf = malloc(num_grid * sizeof(mesh_ijk32_t));
  if ((pntbuf == NULL) || (propbuf == NULL) || (node_buf == NULL)) {
    fprintf(stderr, "[%d:%d] Failed to allocate buffers\n", myid,myrank);
    return(1);
  }

  /* Compute rank's local i,j,k range */
  k_start = ((int)(myrank / (cfg->proc_dims.dim[0] * cfg->proc_dims.dim[1]))
	     * part_dims[2]);
  k_end = k_start + part_dims[2];
  j_start = ((myrank % (cfg->proc_dims.dim[0] * cfg->proc_dims.dim[1])) 
	     / cfg->proc_dims.dim[0]) * part_dims[1];
  j_end = j_start + part_dims[1];
  i_start = ((myrank % (cfg->proc_dims.dim[0] * cfg->proc_dims.dim[1])) 
	     % cfg->proc_dims.dim[0]) * part_dims[0];
  i_end = i_start + part_dims[0];

//  fprintf(stdout,"[%d:%d] Partition dimensions: %d x %d x %d\n", myid, myrank,part_dims[0], part_dims[1], part_dims[2]);
//  fprintf(stdout,"[%d:%d] I,J,K start: %d, %d, %d\n", myid, myrank, i_start, j_start, k_start);
//  fprintf(stdout,"[%d:%d] I,J,K end: %d, %d, %d\n", myid, myrank, i_end, j_end, k_end);
//  fflush(stdout);

  /* Open the grid file */
  ifp = fopen(cfg->gridfile, "rb");
  if (ifp == NULL) {
    fprintf(stderr, "[%d:%d] Failed to open gridfile %s for reading\n", 
	    myid, myrank, cfg->gridfile);
    return(1);
  }

  /* Read grid partition for this rank */
  for (j = j_start; j < j_end; j++) {
    grid_offset = (j * cfg->dims.dim[0] + i_start) *sizeof(ucvm_point_t);
    pnt_offset = (j-j_start) * part_dims[0];
    fseek(ifp, grid_offset, SEEK_SET);
    if (fread(&(pntbuf[pnt_offset]), sizeof(ucvm_point_t), 
	      i_end-i_start, ifp) != i_end-i_start) {
      fprintf(stderr, "[%d:%d] Failed to read grid partition at j=%d\n", myid, myrank, j);
      return(1);
    }
  }

  /* Close grid file */
  fclose(ifp);

  /* For each k in k range, query UCVM */
//  fprintf(stdout, "[%d:%d] Starting extraction\n", myid, myrank);

  num_points = 0;
  for (k = k_start; k < k_end; k++) {
    
    /* Set z coordinate */
    if(cfg->querymode == UCVM_COORD_GEO_DEPTH) {
      z = cfg->origin.coord[2] + (k * cfg->spacing);
      } else {
        z = cfg->origin.coord[2] - (k * cfg->spacing);
    }
    for (n = 0; n < num_grid; n++) {
      pntbuf[n].coord[2] = z;
    }

    /* Query UCVM at this k */
    if (ucvm_query(num_grid, pntbuf, propbuf) != UCVM_CODE_SUCCESS) {
      fprintf(stderr, "[%d:%d] Query UCVM failed\n", myid, myrank);
      return(1);
    }

    /* Convert the data points to a mesh node list */
    int icnt;
    icnt= mesh_data_to_node(0, i_start, i_end, j_start, j_end,
			  k, pntbuf, propbuf, node_buf, cfg->vp_min,
			  cfg->vs_min);
    /* it is possible to have 'invalid' mesh node for UCVM_COORD_GEO_ELEVATION */
    if(icnt != 0) {
      if (cfg->querymode == UCVM_COORD_GEO_DEPTH) {
        return(1);
      }
    }

    if (n != num_grid) {
      fprintf(stderr, "[%d] Number of nodes mismatch\n", 
	      myid);
      return(1);
    }

    /* Write this buffer */
    if (mesh_write_mpi(&(node_buf[0]), num_grid) != 0) {
      fprintf(stderr, "[%d:%d] Failed to write nodes to mesh file\n", 
	      myid, myrank);
      return(1);
    }
    num_points = num_points + num_grid;

  }
//  fprintf(stdout, "[%d:%d] Extracted total %d points\n", myid, myrank,num_points);
//  fflush(stdout);

  mesh_close_mpi();

  /* Free buffers */
  free(pntbuf);
  free(propbuf);
  free(node_buf);

  return(0);
}


int main(int argc, char **argv)
{
  /* MPI stuff and distributed computation variables */
  int myid, nproc, pnlen;
  char procname[128];
  int i;

  /* Config params */
  mesh_config_t cfg;
  size_t slice_size;

  /* Grid params */
  ucvm_projdef_t iproj, oproj;
  ucvm_trans_t trans;

  /* Options */
  int opt;
  char configfile[UCVM_MAX_PATH_LEN];

  /* Init MPI */
  mpi_init(&argc, &argv, &nproc, &myid, procname, &pnlen);

// for remote debug/attaching
//  char hostname[256];
//  gethostname(hostname, sizeof(hostname));
//  fprintf(stdout,"PID %d on %s ready for attach\n", getpid(), hostname);
//  fflush(stdout);

  /* Register new mesh data types */
  mpi_register_stat_4(&MPI_STAT_T, &num_fields_stat);

  if (myid == 0) {
    printf("[%d] %s Version: %s\n", myid, argv[0],
	   VERSION);
    printf("[%d] Running on %d cores\n", myid, nproc);
    fflush(stdout);
  }

  /* Parse options */
  strcpy(configfile, "");
  int layer = 1;
  int layer_count = 0;
  while ((opt = getopt(argc, argv, "hf:l:c:")) != -1) {
    switch (opt) {
    case 'f':
      strcpy(configfile, optarg);
      break;
    case 'l':
      layer = atoi(optarg);
      break;
    case 'c':
      layer_count = atoi(optarg);
      break;
    case 'h':
      usage(argv[0]);
      exit(0);
      break;
    default: /* '?' */
      fprintf(stderr, "[%d] Unrecognized option %c\n", myid, opt);
      usage(argv[0]);
      return(1);
    }
  }

  if (strcmp(configfile, "") == 0) {
    fprintf(stderr, "[%d] No config file specified\n", myid);
    return(1);
  }

  /* Application init */
  if (init_app(myid, nproc, configfile, &cfg) != 0) {
    fprintf(stderr, "[%d] Initialization failed\n", myid);
    return(1);
  }

  if (myid == 0) {

    printf("[%d] Initialization complete\n", myid);
    fflush(stdout);
    
    /* Delete output mesh file if present */
    //deleteFile(cfg.meshfile);
    //deleteFile(cfg.gridfile);

    if(!fileExists(cfg.gridfile)) {

      /* Generate the 2D grid only if no gridfile exists */
      sprintf(iproj.proj, "%s", UCVM_PROJ_GEO);
      sprintf(oproj.proj, "%s", cfg.proj);
      trans.rotate = cfg.rot;
      for (i = 0; i < 3; i++) {
        trans.origin[i] = cfg.origin.coord[i];
        trans.translate[i] = 0.0;
      }
      trans.gtype = cfg.gridtype;
      
      if (ucvm_grid_gen_file(&iproj, &trans, &oproj, &(cfg.dims), 
			     cfg.spacing, cfg.gridfile) != UCVM_CODE_SUCCESS) {
        fprintf(stderr, "[%d] Failed to create gridfile %s\n", 
	        myid, cfg.gridfile);
        return(1);
      }
  
      /* Convert grid from Proj.4 projection to latlong */
      printf("[%d] Converting grid to latlong\n", myid);
      fflush(stdout);
      slice_size = (size_t)cfg.dims.dim[0] * (size_t)cfg.dims.dim[1];
      if (ucvm_grid_convert_file(&oproj, &iproj, slice_size, 
			         cfg.gridfile) != UCVM_CODE_SUCCESS) {
        fprintf(stderr, "[%d] Failed to convert gridfile %s\n", 
	        myid, cfg.gridfile);
        return(1);
      }

      printf("[%d] Grid generation complete\n", myid);
      fflush(stdout);
    }
  }

  /* Stagger each rank */
  mpi_barrier();
  sleep(myid % 120);

  if (myid == 0) {
    printf("[%d] Configuring UCVM\n", myid);
    fflush(stdout);
  }

  /* Setup UCVM */
  if (ucvm_init(cfg.ucvmconf) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "[%d] Failed to initialize UCVM\n", myid);
    return(1);
  }

  /* Add models */
  if (ucvm_add_model_list(cfg.ucvmstr) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "[%d] Failed to enable model list %s\n", myid,
	    cfg.ucvmstr);
    return(1);
  }

  /* Set depth query mode */
  if (ucvm_setparam(UCVM_MODEL_PARAM_QUERY_MODE, cfg.querymode) 
      != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "[%d] Set query mode failed\n", myid);
    return(1);
  }

  /* Set interpolation z range */
  if (ucvm_setparam(UCVM_MODEL_PARAM_IFUNC_ZRANGE, 
		    cfg.ucvm_zrange[0], 
		    cfg.ucvm_zrange[1]) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "[%d] Failed to set interpolation z range\n", myid);
    return(1);
  }

  /* Perform extractions */
  int myrank=myid;
  int nrank = get_nrank(&cfg);
  int layer_rank = get_nrank_layer(&cfg);
  if(layer < 1) {
    layer = 1;
  }
  int start_rank = (layer - 1 ) * layer_rank;
  if(layer_count == 0) {
     layer_count = get_nlayer(&cfg);
  }
  int end_rank = start_rank + (layer_rank * layer_count) - 1;

  while (myrank < nrank) {
   
if( myrank >=start_rank && myrank <= end_rank ) {
//    fprintf(stdout," >>>> START >> %d:%d\n",myid, myrank);
//    fflush(stdout);
    if (extract(myid, myrank, nrank, &cfg) != 0) {
      return(1);
    }
//    fprintf(stdout," >>>> DONE >> %d:%d\n",myid, myrank);
//    fflush(stdout);
}

    myrank = myrank + nproc;
  }

  ucvm_finalize();

  /* Final sync */
  mpi_barrier();
  mpi_final("MPI Done");

  return(0);
}
