/**
 * um_config.c -- Read ucvm2mesh configuration
 *
 * Created by Patrick Small <patrices@usc.edu>
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifdef UM_ENABLE_MPI
#include <mpi.h>
#endif
#include "ucvm_config.h"
#include "um_dtypes.h"
#include "um_mesh.h"


/* Read config file*/
int read_config(int myid, int nproc, const char *cfgfile, mesh_config_t *cfg, int old_style)
{
  ucvm_config_t *chead;
  ucvm_config_t *cptr;

  /* Misc */
  int i;

  /* Initialize variables */
  cfg->meshtype = MESH_FORMAT_UNKNOWN;
  cfg->rank = myid;

  /* Set defaults for optional variables */
  cfg->z_spacing = -1.0;
  cfg->z_file = NULL;
  cfg->z_list = NULL;
  cfg->z_list_num = 0;
  cfg->ucvm_zrange[0] = 0.0;
  cfg->ucvm_zrange[1] = 350.0;
  cfg->ucvm_floor[0] = 500.0;
  cfg->ucvm_floor[1] = 1700.0;
  cfg->ucvm_floor[2] = 1700.0;

  /* Parse config file */
  if (myid == 0) {
    
    printf("[%d] Using config file %s\n", myid, cfgfile);
    chead = ucvm_parse_config(cfgfile);

    if (chead == NULL) {
      fprintf(stderr, "[%d] Failed to parse config file %s\n", 
	      myid, cfgfile);
      return(1);
    }

    cptr = ucvm_find_name(chead, "ucvmlist");
    if (cptr == NULL) {
      fprintf(stderr, "[%d] Failed to find ucvmlist in config\n", myid);
	return(1);
    }
    sprintf(cfg->ucvmstr, "%s", cptr->value);
    
    cptr = ucvm_find_name(chead, "ucvmconf");
    if (cptr == NULL) {
      fprintf(stderr, "[%d] Failed to find ucvmconf in config\n", myid);
      return(1);
    }
    sprintf(cfg->ucvmconf, "%s", cptr->value);

    cptr = ucvm_find_name(chead, "gridtype");
    if (cptr == NULL) {
	fprintf(stderr, "[%d] Failed to find gridtype in config\n", myid);
	return(1);
    }
    if (strcmp(cptr->value, "CENTER") == 0) {
      cfg->gridtype = UCVM_GRID_CELL_CENTER;
    } else if (strcmp(cptr->value, "VERTEX") == 0) {
      cfg->gridtype = UCVM_GRID_CELL_VERTEX;
    } else {
      fprintf(stderr, "[%d] Failed to find gridtype in config\n", myid);
      return(1);
    }

    cptr = ucvm_find_name(chead, "querymode");
    cfg->querymode = UCVM_COORD_GEO_DEPTH;
    if( cptr != NULL) {
      if (strcmp(cptr->value, "ELEVATION") == 0) {
        cfg->querymode = UCVM_COORD_GEO_ELEV;
      }
    }

    cptr = ucvm_find_name(chead, "spacing");
    if (cptr == NULL) {
      fprintf(stderr, "[%d] Failed to find spacing in config\n", myid);
      return(1);
    }
    if(sscanf(cptr->value, "%lf", &cfg->spacing) != 1) {
      fprintf(stderr, "[%d] Failed to find spacing in config\n", myid);
      return(1);
    }

    /* optional */
    cptr = ucvm_find_name(chead, "min_zrange");
    if (cptr != NULL) {
      if(sscanf(cptr->value, "%lf", &cfg->min_zrange) != 1) {
        fprintf(stderr, "[%d] Failed set find min_zrange in config\n", myid);
        return(1);
      }
    }
    /* optional */
    cptr = ucvm_find_name(chead, "max_zrange");
    if (cptr != NULL) {
      if(sscanf(cptr->value, "%lf", &cfg->max_zrange) != 1) {
        fprintf(stderr, "[%d] Failed set find max_zrange in config\n", myid);
        return(1);
      }
    }

    /* optional */
    cptr = ucvm_find_name(chead, "vs_floor");
    if (cptr != NULL) {
      if(sscanf(cptr->value, "%lf", &cfg->vs_floor) != 1) {
        fprintf(stderr, "[%d] Failed set find vs_floor in config\n", myid);
        return(1);
      }
    }
    /* optional */
    cptr = ucvm_find_name(chead, "vp_floor");
    if (cptr != NULL) {
      if(sscanf(cptr->value, "%lf", &cfg->vp_floor) != 1) {
        fprintf(stderr, "[%d] Failed set find vp_floor in config\n", myid);
        return(1);
      }
    }
    /* optional */
    cptr = ucvm_find_name(chead, "density_floor");
    if (cptr != NULL) {
      if(sscanf(cptr->value, "%lf", &cfg->density_floor) != 1) {
        fprintf(stderr, "[%d] Failed set find density_floor in config\n", myid);
        return(1);
      }
    }

    /* optional */
    cptr = ucvm_find_name(chead, "z_spacing");
    if (cptr != NULL) {
      if(sscanf(cptr->value, "%lf", &cfg->z_spacing) != 1) {
        fprintf(stderr, "[%d] Failed to find z_spacing in config\n", myid);
        return(1);
      }
    }
    /* optional */
    cptr = ucvm_find_name(chead, "z_file");
    if (cptr != NULL) {
      int len=strlen(cptr->value);
      cfg->z_file=(char *) malloc(sizeof(char) * (len+1));
      if(sscanf(cptr->value, "%s", cfg->z_file) != 1) {
        fprintf(stderr, "[%d] Failed to find z_file in config\n", myid);
        return(1);
      }
    }
    
    cptr = ucvm_find_name(chead, "proj");
    if (cptr == NULL) {
	fprintf(stderr, "[%d] Failed to find proj in config\n", myid);
	return(1);
    }
    sprintf(cfg->proj, "%s", cptr->value);

    cptr = ucvm_find_name(chead, "rot");
    if (cptr == NULL) {
      fprintf(stderr, "[%d] Failed to find rot in config\n", myid);
      return(1);
    }
    if(sscanf(cptr->value, "%lf", &cfg->rot) != 1){
      fprintf(stderr, "[%d] Failed to find rot in config\n", myid);
      return(1);
    }
    
    cptr = ucvm_find_name(chead, "x0");
    if (cptr == NULL) {
      fprintf(stderr, "[%d] Failed to find x0 in config\n", myid);
      return(1);
    }
    if(sscanf(cptr->value, "%lf", &(cfg->origin.coord[0])) != 1) {
      fprintf(stderr, "[%d] Failed to find lon in config\n", myid);
      return(1);
    }
    
    cptr = ucvm_find_name(chead, "y0");
    if (cptr == NULL) {
      fprintf(stderr, "[%d] Failed to find y0 in config\n", myid);
      return(1);
    }
    if(sscanf(cptr->value, "%lf", &(cfg->origin.coord[1])) != 1){
      fprintf(stderr, "[%d] Failed to find y0 in config\n", myid);
      return(1);
    }
    
    cptr = ucvm_find_name(chead, "z0");
    if (cptr == NULL) {
      fprintf(stderr, "[%d] Failed to find z0 in config\n", myid);
      return(1);
    }
    if(sscanf(cptr->value, "%lf", &(cfg->origin.coord[2])) != 1){
      fprintf(stderr, "[%d] Failed to find z0 in config\n", myid);
      return(1);
    }
    
    cptr = ucvm_find_name(chead, "nx");
    if (cptr == NULL) {
      fprintf(stderr, "[%d] Failed to find nx in config\n", myid);
      return(1);
    }
    if(sscanf(cptr->value, "%d", &(cfg->dims.dim[0])) != 1) {
      fprintf(stderr, "[%d] Failed to find nx in config\n", myid);
      return(1);
    }
    
    cptr = ucvm_find_name(chead, "ny");
    if (cptr == NULL) {
      fprintf(stderr, "[%d] Failed to find ny in config\n", myid);
      return(1);
    }
    if(sscanf(cptr->value, "%d", &(cfg->dims.dim[1])) != 1){
      fprintf(stderr, "[%d] Failed to find ny in config\n", myid);
      return(1);
    }
    
    cptr = ucvm_find_name(chead, "nz");
    if (cptr == NULL) {
      fprintf(stderr, "[%d] Failed to find nz in config\n", myid);
      return(1);
    }
    if(sscanf(cptr->value, "%d", &(cfg->dims.dim[2])) != 1){
      fprintf(stderr, "[%d] Failed to find nz in config\n", myid);
      return(1);
    }

    cptr = ucvm_find_name(chead, "px");
    if (cptr == NULL) {
      fprintf(stderr, "[%d] Failed to find px in config\n", myid);
      return(1);
    }
    if(sscanf(cptr->value, "%d", &(cfg->proc_dims.dim[0])) != 1) {
      fprintf(stderr, "[%d] Failed to find px in config\n", myid);
      return(1);
    }
    
    cptr = ucvm_find_name(chead, "py");
    if (cptr == NULL) {
      fprintf(stderr, "[%d] Failed to find py in config\n", myid);
      return(1);
    }
    if(sscanf(cptr->value, "%d", &(cfg->proc_dims.dim[1])) != 1){
      fprintf(stderr, "[%d] Failed to find py in config\n", myid);
      return(1);
    }
    
    cptr = ucvm_find_name(chead, "pz");
    if (cptr == NULL) {
      fprintf(stderr, "[%d] Failed to find pz in config\n", myid);
      return(1);
    }
    if(sscanf(cptr->value, "%d", &(cfg->proc_dims.dim[2])) != 1){
      fprintf(stderr, "[%d] Failed to find pz in config\n", myid);
      return(1);
    }
    
    cptr = ucvm_find_name(chead, "vp_min");
    if (cptr == NULL) {
      fprintf(stderr, "[%d] Failed to find vp_min in config\n", myid);
      return(1);
    }
    if(sscanf(cptr->value, "%lf", &cfg->vp_min) != 1){
      fprintf(stderr, "[%d] Failed to find vp_min in config\n", myid);
      return(1);
    }
    
    cptr = ucvm_find_name(chead, "vs_min");
    if (cptr == NULL) {
      fprintf(stderr, "[%d] Failed to find vs_min in config\n", myid);
      return(1);
    }
    if(sscanf(cptr->value, "%lf", &cfg->vs_min) != 1){
      fprintf(stderr, "[%d] Failed to find vs_min in config\n", myid);
      return(1);
    }
    
    cptr = ucvm_find_name(chead, "meshfile");
    if (cptr == NULL) {
      fprintf(stderr, "[%d] Failed to find meshfile in config\n", myid);
      return(1);
    }
    sprintf(cfg->meshfile, "%s", cptr->value);

    cptr = ucvm_find_name(chead, "gridfile");
    if (cptr == NULL) {
      fprintf(stderr, "[%d] Failed to find gridfile in config\n", myid);
      return(1);
    }
    sprintf(cfg->gridfile, "%s", cptr->value);
    
    cptr = ucvm_find_name(chead, "meshtype");
    if (cptr == NULL) {
      fprintf(stderr, "[%d] Failed to find meshtype in config\n", myid);
      return(1);
    }
    for (i = 1; i < MAX_MESH_FORMATS; i++) {
      if (strcmp(cptr->value, MESH_FORMAT_NAMES[i]) == 0) {
	cfg->meshtype = (mesh_format_t)i;
	break;
      }
    }
    if (cfg->meshtype == MESH_FORMAT_UNKNOWN) {
      fprintf(stderr, "[%d] Failed to find meshtype in config\n", myid);
      return(1);
    }
    
    cptr = ucvm_find_name(chead, "scratch");
    if (cptr == NULL) {
      fprintf(stderr, "[%d] Failed to find scratch in config\n", myid);
      return(1);
    }
    sprintf(cfg->scratch, "%s", cptr->value);

    ucvm_free_config(chead);

// Done with config file processing..
// Do wrap up validation and post-processing

    /* Check config */
    for (i = 0; i < 3; i++) {
      if (cfg->dims.dim[0] <= 0) {
	fprintf(stderr, "[%d] Mesh dim index %d must be positive\n", myid, i);
	return(1);
      }
      if (cfg->proc_dims.dim[0] <= 0) {
	fprintf(stderr, "[%d] Proc dim index %d must be positive\n", myid, i);
	return(1);
      }
    }

    if (cfg->spacing <= 0.0) {
      fprintf(stderr, "[%d] Spacing must be positive\n", myid);
      return(1);
    }

    /* compose ucvm_zrange and ucvm_floor */
    cfg->ucvm_zrange[0] = cfg->min_zrange; 
    cfg->ucvm_zrange[1] = cfg->max_zrange; 

    cfg->ucvm_floor[0] = cfg->vs_floor;
    cfg->ucvm_floor[1] = cfg->vp_floor; 
    cfg->ucvm_floor[2] = cfg->density_floor; 

/* compose z_list */
    if( cfg->z_file != NULL) {
      /* open the z_file and bring in a list of floats */
      int cap=30;
      double val;
      int cnt=0;
      double *z_list= NULL;

      FILE *fp = fopen(cfg->z_file, "r");
      if (fp == NULL) {
        fprintf(stderr, "Failed to open %s\n", cfg->z_file);
        return UCVM_CODE_ERROR;
      }

      z_list = (double *)malloc(cap * sizeof(double));
      if (z_list == NULL) {
        fclose(fp);
        fprintf(stderr, "Failed to malloc\n");
        return UCVM_CODE_ERROR;
      }

      char line[UCVM_MAX_LINE_LEN];
      while (fgets(line, UCVM_MAX_LINE_LEN, fp) != NULL) {
        if(line[0]=='#') continue; // a comment line
        if(sscanf(line,"%lf", &val) == 1) {
          if (cnt >= cap) {
            cap *= 2;
            double *tmp = realloc(z_list, cap * sizeof(double));
            if (tmp == NULL) {
              free(z_list);
              fclose(fp);
              return UCVM_CODE_ERROR;
            }
            z_list = tmp;
          }
          z_list[cnt++] = val;
        }
      }
      fclose(fp);

/* save in config structure */
      cfg->z_list_num = cnt;
      cfg->z_list = z_list;
      } else {
        cfg->z_list=(double *)malloc (sizeof(double) * 1);
        cfg->z_list_num=1;
        if (cfg->z_spacing != -1.0) {
          cfg->z_list[0]= cfg->z_spacing;
          } else {
            cfg->z_list[0]= cfg->spacing;
        }
    }

#ifdef UM_ENABLE_MPI
    /* Check MPI related config items */
    if (nproc > 0) {
      if ((cfg->dims.dim[0] % cfg->proc_dims.dim[0] != 0) || 
	  (cfg->dims.dim[1] % cfg->proc_dims.dim[1] != 0) ||
	  (cfg->dims.dim[2] % cfg->proc_dims.dim[2] != 0)) {
	fprintf(stderr, "[%d] Mesh dims must be divisible by proc dims\n", 
		myid);
	return(1);
      }
      
      int tproc= cfg->proc_dims.dim[0]*cfg->proc_dims.dim[1]*cfg->proc_dims.dim[2];
      int rem = tproc % nproc;
      if (old_style && rem != 0) {
	fprintf(stderr, "[%d] Proc space does not equal or match MPI core count\n", 
		myid);
	fprintf(stderr, "[%d]   expected %d(processes) divisible by %d(core count)\n",myid,tproc,nproc);
	return(1);
      }

/* ...no need to be restrictive about this
      if (nproc != cfg->proc_dims.dim[0]*cfg->proc_dims.dim[1]*cfg->proc_dims.dim[2]) {
	fprintf(stderr, "[%d] Proc space does not equal MPI core count\n", 
		myid);
        int tproc= cfg->proc_dims.dim[0]*cfg->proc_dims.dim[1]*cfg->proc_dims.dim[2];
	fprintf(stderr, "[%d]   expected %d but got %d\n",myid,tproc,nproc);
	return(1);
      }
*/
    }
#endif
  }

#ifdef UM_ENABLE_MPI
  if (nproc > 0) {
    int gridtype_i;
    
    /* Broadcast config to all ranks */
    if (MPI_Bcast(&(cfg->ucvmstr[0]), UCVM_MAX_LABEL_LEN, MPI_CHAR, 
		  0, MPI_COMM_WORLD) != MPI_SUCCESS) {
      fprintf(stderr, "[%d] Failed to broadcast ucvmstr\n", myid);
      return(1);
    }
    
    if (MPI_Bcast(&(cfg->ucvmconf[0]), UCVM_MAX_PATH_LEN, MPI_CHAR, 
		  0, MPI_COMM_WORLD) != MPI_SUCCESS) {
      fprintf(stderr, "[%d] Failed to broadcast ucvmconf\n", myid);
      return(1);
    }
    
    gridtype_i = (int)(cfg->gridtype);
    if (MPI_Bcast(&gridtype_i, 1, MPI_INT, 0, 
		  MPI_COMM_WORLD) != MPI_SUCCESS) {
      fprintf(stderr, "[%d] Failed to broadcast gridtype\n", myid);
      return(1);
    }

    if (MPI_Bcast(&cfg->querymode, 1, MPI_INT, 0, 
		  MPI_COMM_WORLD) != MPI_SUCCESS) {
      fprintf(stderr, "[%d] Failed to broadcast querymode\n", myid);
      return(1);
    }
    
    if (MPI_Bcast(&cfg->spacing, 1, MPI_DOUBLE, 0, 
		  MPI_COMM_WORLD) != MPI_SUCCESS) {
      fprintf(stderr, "[%d] Failed to broadcast spacing\n", myid);
      return(1);
    }

    // optional
    if(cfg->z_spacing != 0.0) {
      if (MPI_Bcast(&cfg->z_spacing, 1, MPI_DOUBLE, 0, 
		  MPI_COMM_WORLD) != MPI_SUCCESS) {
        fprintf(stderr, "[%d] Failed to broadcast z_spacing\n", myid);
        return(1);
      }
    }

    if (MPI_Bcast(&cfg->z_list_num, 1, MPI_INT, 0, 
		  MPI_COMM_WORLD) != MPI_SUCCESS) {
        fprintf(stderr, "[%d] Failed to broadcast z_list_num\n", myid);
        return(1);
    }

/* only can sent some of it */
    if (MPI_Bcast(&cfg->z_list, cfg->z_list_num, MPI_DOUBLE, 0, 
		  MPI_COMM_WORLD) != MPI_SUCCESS) {
        fprintf(stderr, "[%d] Failed to broadcast z_list\n", myid);
        return(1);
    }
    
    if (MPI_Bcast(&(cfg->proj[0]), 256, MPI_CHAR, 
		  0, MPI_COMM_WORLD) != MPI_SUCCESS) {
      fprintf(stderr, "[%d] Failed to broadcast proj\n", myid);
      return(1);
    }
    
    if (MPI_Bcast(&cfg->rot, 1, MPI_DOUBLE, 0, 
		  MPI_COMM_WORLD) != MPI_SUCCESS) {
      fprintf(stderr, "[%d] Failed to broadcast rot\n", myid);
      return(1);
    }
    
    if (MPI_Bcast(&cfg->origin, 3, MPI_DOUBLE, 0, 
		  MPI_COMM_WORLD) != MPI_SUCCESS) {
      fprintf(stderr, "[%d] Failed to broadcast origin\n", myid);
      return(1);
    }
    
    if (MPI_Bcast(&cfg->dims, 3, MPI_INT, 0, 
		  MPI_COMM_WORLD) != MPI_SUCCESS) {
      fprintf(stderr, "[%d] Failed to broadcast dims\n", myid);
      return(1);
    }
    
    if (MPI_Bcast(&cfg->proc_dims, 3, MPI_INT, 0, 
		  MPI_COMM_WORLD) != MPI_SUCCESS) {
      fprintf(stderr, "[%d] Failed to broadcast proc_dims\n", myid);
      return(1);
    }
    
    if (MPI_Bcast(&cfg->vp_min, 1, MPI_DOUBLE, 0, 
		  MPI_COMM_WORLD) != MPI_SUCCESS) {
      fprintf(stderr, "[%d] Failed to broadcast vp_min\n", myid);
      return(1);
    }
    
    if (MPI_Bcast(&cfg->vs_min, 1, MPI_DOUBLE, 0, 
		  MPI_COMM_WORLD) != MPI_SUCCESS) {
      fprintf(stderr, "[%d] Failed to broadcast vs_min\n", myid);
      return(1);
    }
    
    if (MPI_Bcast(&(cfg->meshfile[0]), UCVM_MAX_PATH_LEN, MPI_CHAR, 
		  0, MPI_COMM_WORLD) != MPI_SUCCESS) {
      fprintf(stderr, "[%d] Failed to broadcast meshfile\n", myid);
      return(1);
    }
    
    if (MPI_Bcast(&(cfg->gridfile[0]), UCVM_MAX_PATH_LEN, MPI_CHAR, 
		  0, MPI_COMM_WORLD) != MPI_SUCCESS) {
      fprintf(stderr, "[%d] Failed to broadcast gridfile\n", myid);
      return(1);
    }
    
    if (MPI_Bcast(&cfg->meshtype, 1, MPI_INT, 0, 
		  MPI_COMM_WORLD) != MPI_SUCCESS) {
      fprintf(stderr, "[%d] Failed to broadcast meshtype\n", myid);
      return(1);
    }
    
    if (MPI_Bcast(&(cfg->scratch[0]), UCVM_MAX_PATH_LEN, MPI_CHAR, 
		  0, MPI_COMM_WORLD) != MPI_SUCCESS) {
      fprintf(stderr, "[%d] Failed to broadcast scratch\n", myid);
      return(1);
    }
    
    if (MPI_Bcast(&(cfg->ucvm_zrange[0]), 2, MPI_DOUBLE, 0, 
		  MPI_COMM_WORLD) != MPI_SUCCESS) {
      fprintf(stderr, "[%d] Failed to broadcast zrange\n", myid);
      return(1);
    }

    if (MPI_Bcast(&(cfg->ucvm_floor[0]), 3, MPI_DOUBLE, 0, 
		  MPI_COMM_WORLD) != MPI_SUCCESS) {
      fprintf(stderr, "[%d] Failed to broadcast floor\n", myid);
      return(1);
    }
  }
  }
#endif

  return(0);
}

/* Return total number of ranks */
int get_nrank(mesh_config_t *cfg) {
  int t=cfg->proc_dims.dim[0]*cfg->proc_dims.dim[1]*cfg->proc_dims.dim[2];
  return t;
}

/* Return number of ranks in a layer */
int get_nrank_layer(mesh_config_t *cfg) {
  int t=cfg->proc_dims.dim[0]*cfg->proc_dims.dim[1];
  return t;
}

/* return number of layers in */
int get_nlayer(mesh_config_t *cfg) {
  int t=cfg->proc_dims.dim[2];
  return t;
}

/* Dump config to stdout */
int disp_config(mesh_config_t *cfg) {

  printf("[%d] Configuration:\n", cfg->rank);
  printf("\t[%d] UCVM Model List: %s\n", cfg->rank, cfg->ucvmstr);
  printf("\t[%d] UCVM Conf file: %s\n", cfg->rank, cfg->ucvmconf);
  printf("\t[%d] Gridtype: %d\n", cfg->rank, (int)cfg->gridtype);
  printf("\t[%d] Querymode: %d\n", cfg->rank, (int)cfg->querymode);
  printf("\t[%d] Spacing: %lf\n", cfg->rank, cfg->spacing);
  printf("\t[%d] Z Spacing: %lf\n", cfg->rank, cfg->z_spacing);
  printf("\t[%d] Z file: %s\n", cfg->rank, cfg->z_file);
  printf("\t[%d] Min zrange: %lf\n", cfg->rank, cfg->min_zrange);
  printf("\t[%d] Max zrange: %lf\n", cfg->rank, cfg->max_zrange);
  printf("\t[%d] Vs floor: %lf\n", cfg->rank, cfg->vs_floor);
  printf("\t[%d] Vp floor: %lf\n", cfg->rank, cfg->vp_floor);
  printf("\t[%d] Density floor: %lf\n", cfg->rank, cfg->density_floor);
  printf("\t[%d] Projection: %s\n", cfg->rank, cfg->proj);
  printf("\t\t[%d] Rotation Angle: %lf\n", cfg->rank, cfg->rot);
  printf("\t\t[%d] Origin x0,y0,z0: %lf, %lf, %lf\n", 
	 cfg->rank, cfg->origin.coord[0], cfg->origin.coord[1], 
	 cfg->origin.coord[2]);
  printf("\t\t[%d] Dimensions: %d, %d, %d\n", 
	 cfg->rank, cfg->dims.dim[0], cfg->dims.dim[1], cfg->dims.dim[2]);
  printf("\t[%d] Proc Dimensions: %d, %d, %d\n", 
	 cfg->rank, cfg->proc_dims.dim[0], cfg->proc_dims.dim[1], 
	 cfg->proc_dims.dim[2]);
  printf("\t[%d] Vp Min: %lf, Vs Min: %lf\n", 
	 cfg->rank, cfg->vp_min, cfg->vs_min);
  printf("\t[%d] Mesh File: %s\n", cfg->rank, cfg->meshfile);
  printf("\t[%d] Grid File: %s\n", cfg->rank, cfg->gridfile);
  printf("\t[%d] Mesh Type: %d\n", cfg->rank, cfg->meshtype);
  printf("\t[%d] Scratch Dir: %s\n", cfg->rank, cfg->scratch);

  return(0);
}



