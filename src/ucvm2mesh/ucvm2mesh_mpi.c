/**
 * ucvm2mesh_mpi.c - Query UCVM to produce a 3D mesh on a regular grid
 *
 * Created by Patrick Small <patrices@usc.edu>
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

int ucvm2mesh_mpi_debug=0;
int ucvm2mesh_mpi_debug_detail=0;
FILE *stderrfp=NULL;


/* Display usage information */
void usage(char *arg)
{
  printf("Usage: %s [-h] [-o dir] -f configfile\n\n", arg);

  printf("where:\n");
  printf("\t-h: help message\n");
  printf("\t-o: final stage out directory for mesh files\n");
  printf("\t-f: config file containing mesh params\n\n");
  printf("Config file format:\n");
  printf("\tucvmlist: comma-delimited list of CVMs to query (as supported by UCVM)\n");
  printf("\tucvmconf: UCVM API config file\n");
  printf("\tgridtype: location of x-y gridded points: VERTEX, or CENTER\n");
  printf("\tquerymode: query mode, DEPTH, or ELEVATION\n");
  printf("\tspacing: grid spacing (units appropriate for proj)\n");
  printf("\tx_spacing: (optional) grid x_spacing\n");
  printf("\ty_spacing: (optional) grid y_spacing\n");
  printf("\tz_spacing: (optional) grid z_spacing\n");
  printf("\tx_file: (optional) x list file\n");
  printf("\ty_file: (optional) y list file\n");
  printf("\tz_file: (optional) z list file\n");
  printf("\tvs_floor: (optional) interp vs floor\n");
  printf("\tvp_floor: (optional) interp vp floor\n");
  printf("\tdensity_floor: (optional) interp density floor\n");
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
  if (read_config(myid, nproc, cfgfile, cfg, 1) != 0) {
    fprintf(stderr, "[%d] Failed to parse config file %s\n", myid, cfgfile);
    return(1);
  }

  if (myid == 0) {
    disp_config(cfg);
  }

  return(0);
}


/* Perform extraction from UCVM */
int extract(int myid, int nproc, mesh_config_t *cfg) 
{
  /* Statistics */
  stat_t stats[STAT_MAX_STATS];

  /* Performance measurements */
  struct timeval start, end;
  double elapsed;

  /* MPI Statistic vars */
  MPI_Datatype MPI_STAT_T;
  int num_fields_stat;
  stat_t *rbuf;

  /* Buffers */
  int num_grid, num_points;
  ucvm_point_t *pntbuf;
  ucvm_data_t *propbuf;
  mesh_ijk32_t *node_buf;

  int part_dims[3];
  int i, j, k, i_start, i_end, j_start, j_end, k_start, k_end, n;
  size_t grid_offset, pnt_offset;
  double z;
  FILE *ifp;

  /* Compute partition dims */
  part_dims[0] = cfg->dims.dim[0]/cfg->proc_dims.dim[0];
  part_dims[1] = cfg->dims.dim[1]/cfg->proc_dims.dim[1];
  part_dims[2] = cfg->dims.dim[2]/cfg->proc_dims.dim[2];

  /* Initialize statistics */
  memset(&stats[0], 0, STAT_MAX_STATS*sizeof(stat_t));
  stats[STAT_MIN_VP].val = 100000.0;
  stats[STAT_MIN_VS].val = 100000.0;
  stats[STAT_MIN_RHO].val = 100000.0;
  stats[STAT_MIN_RATIO].val = 100000.0;

  /* Register new mesh data types */
  mpi_register_stat_4(&MPI_STAT_T, &num_fields_stat);

  /* Compute number of nodes in my partition of x-y grid  */
  num_grid = ((cfg->dims.dim[0]/cfg->proc_dims.dim[0]) * 
	       (cfg->dims.dim[1]/cfg->proc_dims.dim[1]));

  /* Open output mesh file */
  if (myid == 0) {
    fprintf(stdout, "[%d] Opening output mesh file %s\n", 
	    myid, cfg->meshfile);
  }
  if (mesh_open_mpi(myid, nproc, \
		       &(cfg->dims), &(cfg->proc_dims),
		       cfg->meshfile, cfg->meshtype, num_grid) != 0) {
    fprintf(stderr, "[%d] Error: mesh_open_mpi reported failure\n", myid);
    return(1);
  }

  /* Allocate buffers */
  fprintf(stdout, "[%d] Allocating %d grid points\n", myid, num_grid);
  pntbuf = malloc(num_grid * sizeof(ucvm_point_t));
  propbuf = malloc(num_grid * sizeof(ucvm_data_t));
  node_buf = malloc(num_grid * sizeof(mesh_ijk32_t));
  if ((pntbuf == NULL) || (propbuf == NULL) || (node_buf == NULL)) {
    fprintf(stderr, "[%d] Failed to allocate buffers\n", myid);
    return(1);
  }

  /* Compute rank's local i,j,k range */
  k_start = ((int)(myid / (cfg->proc_dims.dim[0] * cfg->proc_dims.dim[1]))
	     * part_dims[2]);
  k_end = k_start + part_dims[2];
  j_start = ((myid % (cfg->proc_dims.dim[0] * cfg->proc_dims.dim[1])) 
	     / cfg->proc_dims.dim[0]) * part_dims[1];
  j_end = j_start + part_dims[1];
  i_start = ((myid % (cfg->proc_dims.dim[0] * cfg->proc_dims.dim[1])) 
	     % cfg->proc_dims.dim[0]) * part_dims[0];
  i_end = i_start + part_dims[0];

  printf("[%d] Partition dimensions: %d x %d x %d\n", myid,
	 part_dims[0], part_dims[1], part_dims[2]);
  printf("[%d] I,J,K start: %d, %d, %d\n", myid, i_start, j_start, k_start);
  printf("[%d] I,J,K end: %d, %d, %d\n", myid, i_end, j_end, k_end);
  fflush(stdout);

  /* Open the grid file */
  ifp = fopen(cfg->gridfile, "rb");
  if (ifp == NULL) {
    fprintf(stderr, "[%d] Failed to open gridfile %s for reading\n", 
	    myid, cfg->gridfile);
    return(1);
  }

  /* Read grid partition for this rank */
  for (j = j_start; j < j_end; j++) {
    grid_offset = (j * cfg->dims.dim[0] + i_start) *sizeof(ucvm_point_t);
    pnt_offset = (j-j_start) * part_dims[0];
    fseek(ifp, grid_offset, SEEK_SET);
    if (fread(&(pntbuf[pnt_offset]), sizeof(ucvm_point_t), 
	      i_end-i_start, ifp) != i_end-i_start) {
      fprintf(stderr, "[%d] Failed to read grid partition at j=%d\n", myid, j);
      return(1);
    }
  }

  /* Close grid file */
  fclose(ifp);

  /* For each k in k range, query UCVM */
  if (myid == 0) {
    fprintf(stdout, "[%d] Starting extraction\n", myid);
  }
  num_points = 0;

  for (k = k_start; k < k_end; k++) {
    gettimeofday(&start,NULL);
    z=cfg->z_list[k];

    for (n = 0; n < num_grid; n++) {
      pntbuf[n].coord[2] = z;
    }

    /* Query UCVM at this k */
    if (ucvm_query(num_grid, pntbuf, propbuf) != UCVM_CODE_SUCCESS) {
      fprintf(stderr, "[%d] Query UCVM failed\n", myid);
      return(1);
    }

    /* Convert the data points to a mesh node list */
    int icnt;
    icnt = mesh_data_to_node(0, i_start, i_end, j_start, j_end,
			  k, pntbuf, propbuf, node_buf, cfg->vp_min,
			  cfg->vs_min);
    /* it is possible to have 'invalid' mesh node for UCVM_COORD_GEO_ELEVATION */
    if(icnt != 0) {
      if (cfg->querymode == UCVM_COORD_GEO_DEPTH) {
        return(1);
      }
    }

    /* Calculate statistics */
    calc_stats_list(i_start, i_end, j_start, j_end, k, 
		    node_buf, &stats[0]);
    
    if (n != num_grid) {
      fprintf(stderr, "[%d] Number of nodes mismatch\n", 
	      myid);
      return(1);
    }

    /* Calculate extraction elapsed time */
    gettimeofday(&end,NULL);
    elapsed = (end.tv_sec - start.tv_sec) * 1000.0 +
      (end.tv_usec - start.tv_usec) / 1000.0;
    if (myid == 0) {
      fprintf(stdout,
	      "[%d] Extracted slice %d (%d pnts) in %.2f ms, %f pps\n",
	      myid, k, num_grid, elapsed, 
	      (float)(num_grid/(elapsed/1000.0)));
      fflush(stdout);
    }
    gettimeofday(&start,NULL);

    /* Write this buffer */
    if (mesh_write_mpi(&(node_buf[0]), num_grid) != 0) {
      fprintf(stderr, "[%d] Failed to write nodes to mesh file\n", 
	      myid);
      return(1);
    }
    num_points = num_points + num_grid;

    /* Calculate write elapsed time */
    gettimeofday(&end,NULL);
    elapsed = (end.tv_sec - start.tv_sec) * 1000.0 +
      (end.tv_usec - start.tv_usec) / 1000.0;
    if (myid == 0) {
      fprintf(stdout,
	      "[%d] Wrote slice %d (%d pnts) in %.2f ms, %f pps\n",
	      myid, k, num_grid, elapsed, 
	      (float)(num_grid/(elapsed/1000.0)));
      fflush(stdout);
    }
  }

  fprintf(stdout, "[%d] Extracted %d points\n", myid, num_points);
  fflush(stdout);

  /* Close the mesh writer */
  mesh_close_mpi();

  /* Free buffers */
  free(pntbuf);
  free(propbuf);
  free(node_buf);

  mpi_barrier();

  /* Allocate statistics buffer */
  rbuf = (stat_t *)malloc(nproc*STAT_MAX_STATS*sizeof(stat_t)); 
  
  /* Gather stats */
  MPI_Gather( &stats[0], STAT_MAX_STATS, MPI_STAT_T, rbuf, STAT_MAX_STATS, 
	      MPI_STAT_T, 0, MPI_COMM_WORLD); 
  if (myid == 0) { 
    for (i = 0; i < nproc*STAT_MAX_STATS; i++) {
      switch (i % STAT_MAX_STATS) {
      case STAT_MAX_VP:
	if (rbuf[i].val > stats[STAT_MAX_VP].val) {
	  memcpy(&stats[STAT_MAX_VP], &rbuf[i], sizeof(stat_t));
	}
	break;
      case STAT_MAX_VS:
	if (rbuf[i].val > stats[STAT_MAX_VS].val) {
	  memcpy(&stats[STAT_MAX_VS], &rbuf[i], sizeof(stat_t));
	}
	break;
      case STAT_MAX_RHO:
	if (rbuf[i].val > stats[STAT_MAX_RHO].val) {
	  memcpy(&stats[STAT_MAX_RHO], &rbuf[i], sizeof(stat_t));
	}
	break;
      case STAT_MIN_VP:
	if (rbuf[i].val < stats[STAT_MIN_VP].val) {
	  memcpy(&stats[STAT_MIN_VP], &rbuf[i], sizeof(stat_t));
	}
	break;
      case STAT_MIN_VS:
	if (rbuf[i].val < stats[STAT_MIN_VS].val) {
	  memcpy(&stats[STAT_MIN_VS], &rbuf[i], sizeof(stat_t));
	}
	break;
      case STAT_MIN_RHO:
	if (rbuf[i].val < stats[STAT_MIN_RHO].val) {
	  memcpy(&stats[STAT_MIN_RHO], &rbuf[i], sizeof(stat_t));
	}
      case STAT_MIN_RATIO:
	if (rbuf[i].val < stats[STAT_MIN_RATIO].val) {
	  memcpy(&stats[STAT_MIN_RATIO], &rbuf[i], sizeof(stat_t));
	}
	break;
      default:
	fprintf(stderr, "[%d] Unexpected stat type %d", myid,
		i % STAT_MAX_STATS);
	return(1);
      }
    }
    for (j = 0; j < STAT_MAX_STATS; j++) {
      printf("[%d] %s: %f at\n", myid, stat_get_label(j), stats[j].val);
      printf("[%d]\ti,j,k : %d, %d, %d\n", myid, 
	     stats[j].i, stats[j].j, stats[j].k);
      fflush(stdout);
    }
  }

  /* Free statistics buffer */
  free(rbuf);

  return(0);
}

/* grid_offset= 0, dimx-1, num_grid-dimx, num_grid-1 */
int extract_gridpoint(FILE *ifp, size_t grid_offset, int myid, ucvm_point_t *tmp_pntbuf) {

    size_t byte_offset=grid_offset * sizeof(ucvm_point_t);

    fseek(ifp, byte_offset, SEEK_SET);
    if (fread(tmp_pntbuf, sizeof(ucvm_point_t), 1, ifp) != 1) {
      fprintf(stderr, "Failed to a read points from grid file (at %ld)\n", grid_offset);
      return(1);
    }
    rewind(ifp);
    return(0);
}



int main(int argc, char **argv)
{
  /* MPI stuff and distributed computation variables */
  int myid, nproc, pnlen;
  char procname[128];

  /* Config params */
  mesh_config_t cfg;
  size_t slice_size;

  /* Grid params */
  ucvm_projdef_t iproj, oproj;
  ucvm_trans_t trans;

  /* Filesytem IO */
  int i;
  char tmp[UCVM_MAX_PATH_LEN+3], tmp2[UCVM_MAX_PATH_LEN+1];

  /* Options */
  int opt;
  char configfile[UCVM_MAX_PATH_LEN], stageoutdir[UCVM_MAX_PATH_LEN];


  /* Init MPI */
  mpi_init(&argc, &argv, &nproc, &myid, procname, &pnlen);

  if (myid == 0) {
    printf("[%d] %s Version: %s\n", myid, argv[0],
	   VERSION);
    printf("[%d] Running on %d cores\n", myid, nproc);
    fflush(stdout);
  }

  /* Parse options */
  strcpy(stageoutdir, "");
  strcpy(configfile, "");
  while ((opt = getopt(argc, argv, "o:hf:")) != -1) {
    switch (opt) {
    case 'o':
      strcpy(stageoutdir, optarg);
      break;
    case 'f':
      strcpy(configfile, optarg);
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

    if(ucvm2mesh_mpi_debug) {
      stderrfp = fopen("ucvm2mesh_mpi_debug.log", "a");
      fprintf(stderrfp,"--- OPEN ---\n");
    }

    printf("[%d] Initialization complete\n", myid);
    fflush(stdout);
    
    /* Delete output mesh file if present */
    deleteFile(cfg.meshfile);
    deleteFile(cfg.gridfile);

// XXX TODO: eventually need add case for accepting user supplied grid and
// skip the grid generation call

    /* Generate the 2D grid */
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

    int dimx=cfg.dims.dim[0];
    int dimy=cfg.dims.dim[1];
    int dimz=cfg.dims.dim[2];
    int num_grid = dimx * dimy;

/* Open the grid file */
    printf("[%d] Grid dims %d %d %d (%d) \n", myid,dimx,dimy,dimz, num_grid);
    printf("[%d] Grid 4 corners:\n", myid);

    FILE *ifp = fopen(cfg.gridfile, "rb");
    if (ifp == NULL) {
      fprintf(stderr, "Failed to open gridfile %s for reading\n",
              cfg.gridfile);
       return(1);
    }

    /* Read 4 grid points */
    /* grid_offset= 0, dimx-1, num_grid-dimx, num_grid-1 */
    //extract_all(ifp, dimx, dimy, myid);
    ucvm_point_t tmp_pntbuf;
    size_t grid_offset=0;
    extract_gridpoint(ifp, grid_offset, myid, &tmp_pntbuf);
    printf("[%d] %lf %lf (%ld)\n", myid,tmp_pntbuf.coord[0],tmp_pntbuf.coord[1],grid_offset);
    grid_offset=dimx-1;
    extract_gridpoint(ifp, grid_offset, myid, &tmp_pntbuf);
    printf("[%d] %lf %lf (%ld)\n", myid,tmp_pntbuf.coord[0],tmp_pntbuf.coord[1],grid_offset);
    grid_offset=num_grid-dimx;
    extract_gridpoint(ifp, grid_offset, myid, &tmp_pntbuf);
    printf("[%d] %lf %lf (%ld)\n", myid,tmp_pntbuf.coord[0],tmp_pntbuf.coord[1],grid_offset);
    grid_offset=num_grid-1;
    extract_gridpoint(ifp, grid_offset, myid, &tmp_pntbuf);
    printf("[%d] %lf %lf (%ld)\n", myid,tmp_pntbuf.coord[0],tmp_pntbuf.coord[1],grid_offset);

// set lists and output to external files 
    int i;
    char fname[UCVM_MAX_PATH_LEN+10];
    snprintf(fname,sizeof(fname),"%s_xlist_mpi",cfg.meshfile);
    FILE *mesh_xfp = fopen(fname, "w+");
    if(!cfg.user_x) { // eventually need to skip grid generation and use the supplied list directly
      for(i=0; i<dimx; i++) {
        grid_offset=i;
        extract_gridpoint(ifp, grid_offset, myid, &tmp_pntbuf);
        cfg.x_list[i]=tmp_pntbuf.coord[0];
        fprintf(mesh_xfp, "%lf\n", cfg.x_list[i]);
      }
    }
    fclose(mesh_xfp);
    snprintf(fname,sizeof(fname),"%s_ylist_mpi",cfg.meshfile);
    FILE *mesh_yfp = fopen(fname, "w+");
    if(!cfg.user_y) {
      for(i=0; i<dimy; i++) {
        grid_offset=(i * dimx);
        extract_gridpoint(ifp, grid_offset, myid, &tmp_pntbuf);
        cfg.y_list[i]=tmp_pntbuf.coord[1];
        fprintf(mesh_yfp, "%lf\n", cfg.y_list[i]);
      } 
    }
    fclose(mesh_yfp);
    snprintf(fname,sizeof(fname),"%s_zlist_mpi",cfg.meshfile);
    FILE *mesh_zfp = fopen(fname, "w+");
    if(!cfg.user_z) {
      double z;
      for(int k=0; k<dimz; k++) {
        if(cfg.querymode == UCVM_COORD_GEO_DEPTH) {
          z = cfg.origin.coord[2] + (k * cfg.z_spacing);
          } else {
            z = cfg.origin.coord[2] - (k * cfg.z_spacing);
        }
        cfg.z_list[k]=z;
        fprintf(mesh_zfp, "%lf\n", cfg.z_list[k]);
      }
    }
    fclose(mesh_zfp);

    fclose(ifp);

    printf("[%d] Grid generation complete\n", myid);
    fflush(stdout);
  }

#ifdef UM_ENABLE_MPI
  if (broadcast_config_lists(myid, nproc, &cfg) != 0) {
    fprintf(stderr, "[%d] Failed to broadcast list parameters\n", myid);
    return(1);
  }
#endif

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

  /* Set interpolation floors */
  ucvm_setfloor(cfg.ucvm_floor);

  /* Perform extractions */
  if (extract(myid, nproc, &cfg) != 0) {
    return(1);
  }

  /* Stage out mesh file(s) */
  if ((myid == 0) && (strlen(stageoutdir) > 0)) {
    printf("[%d] Staging out mesh file(s)\n", myid);
    if (cfg.meshtype == MESH_FORMAT_SORD) {
      snprintf(tmp, sizeof(tmp)-1, "%s_*", cfg.meshfile);
      snprintf(tmp2, sizeof(tmp2)-1, "%s", stageoutdir);
      printf("[%d] Copying %s to %s\n", myid, tmp, tmp2);
      if (copyFile(tmp, tmp2) != 0) {
	fprintf(stderr, 
		"[%d] Failed to copy vp/vs/rho mesh to stage out dir\n", 
		myid);
	return(1);
      }
    } else {
      printf("[%d] Copying %s to %s\n", myid, cfg.meshfile, stageoutdir);
      if (copyFile(cfg.meshfile, stageoutdir) != 0) {
	fprintf(stderr, "[%d] Failed to copy mesh to stage out dir\n", 
		myid);
	return(1);
      }
    }
    printf("[%d] Copying %s to %s\n", myid, cfg.gridfile, stageoutdir);
    if (copyFile(cfg.gridfile, stageoutdir) != 0) {
      fprintf(stderr, "[%d] Failed to copy mesh to stage out dir\n", 
	      myid);
      return(1);
    }
  }

  /* Final sync */
  mpi_barrier();

  if (myid == 0) {
    if(ucvm2mesh_mpi_debug) {
      fclose(stderrfp);
    }
  }

  mpi_final("MPI Done");

  return(0);
}

