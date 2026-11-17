#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "ge_config.h"


/* Read in configuration file and populate config structure */
int read_config(int myid, int nproc, const char *cfgfile, ge_cfg_t *cfg)
{
  int i;
  int sz;
  ucvm_config_t *chead;
  ucvm_config_t *cptr;

  printf("Using config file %s\n", cfgfile);
  
  chead = ucvm_parse_config(cfgfile);
  if (chead == NULL) {
    fprintf(stderr, "Failed to parse config file %s\n", cfgfile);
    return(UCVM_CODE_ERROR);
  }
    
  cptr = ucvm_find_name(chead, "proj");
  if (cptr == NULL) {
    fprintf(stderr, "Failed to find proj in config\n");
    return(UCVM_CODE_ERROR);
  }
  sz= strlen(cptr->value);
  sz= sz > (UCVM_MAX_PROJ_LEN - 1) ? (UCVM_MAX_PROJ_LEN - 1) : sz;
  snprintf(cfg->projinfo.projstr, sz, "%s", cptr->value);
  
  /* Parse origin longitude */
  cptr = ucvm_find_name(chead, "lon_0");
  if (cptr == NULL) {
    fprintf(stderr, "Failed to find lon_0 in config\n");
    return(UCVM_CODE_ERROR);
  }
  if(sscanf(cptr->value, "%lf", &cfg->projinfo.corner.coord[0]) != 1) {
    fprintf(stderr, "Failed to parse lon_0 in config\n");
    return(UCVM_CODE_ERROR);
  }
    
  /* Parse origin latitude */
  cptr = ucvm_find_name(chead, "lat_0");
  if (cptr == NULL) {
    fprintf(stderr, "Failed to find lat_0 in config\n");
    return(UCVM_CODE_ERROR);
  }
  if(sscanf(cptr->value, "%lf", &cfg->projinfo.corner.coord[1]) != 1) {
    fprintf(stderr, "Failed to parse lat_0 in config\n");
    return(UCVM_CODE_ERROR);
  }
    
  /* Parse rotation angle */
  cptr = ucvm_find_name(chead, "rot");
  if (cptr == NULL) {
    fprintf(stderr, "Failed to find rot in config\n");
    return(UCVM_CODE_ERROR);
  }
  if(sscanf(cptr->value, "%lf", &cfg->projinfo.rot) != 1) {
    fprintf(stderr, "Failed to parse rot in config\n");
    return(UCVM_CODE_ERROR);
  }
  
  cptr = ucvm_find_name(chead, "x-size");
  if (cptr == NULL) {
    fprintf(stderr, "Failed to find x-size in config\n");
    return(UCVM_CODE_ERROR);
  }
  if(sscanf(cptr->value, "%lf", &(cfg->projinfo.dims.coord[0])) != 1) {
    fprintf(stderr, "Failed to find nx in config\n");
    return(UCVM_CODE_ERROR);
  }
  
  cptr = ucvm_find_name(chead, "y-size");
  if (cptr == NULL) {
    fprintf(stderr, "Failed to find y-size in config\n");
    return(UCVM_CODE_ERROR);
  }
  if(sscanf(cptr->value, "%lf", &(cfg->projinfo.dims.coord[1])) != 1){
    fprintf(stderr, "Failed to find y-size in config\n");
    return(UCVM_CODE_ERROR);
  }

  cptr = ucvm_find_name(chead, "spacing");
  if (cptr == NULL) {
    fprintf(stderr, "Failed to find spacing in config\n");
    return(UCVM_CODE_ERROR);
  }
  if(sscanf(cptr->value, "%lf", &(cfg->spacing)) != 1){
      fprintf(stderr, "Failed to find spacing in config\n");
      return(UCVM_CODE_ERROR);
  }
    
  cptr = ucvm_find_name(chead, "title");
  if (cptr == NULL) {
    fprintf(stderr, "Failed to find title in config\n");
    return(UCVM_CODE_ERROR);
  }
  sz= strlen(cptr->value);
  sz= sz > (UCVM_META_MAX_STRING_LEN - 1)?(UCVM_META_MAX_STRING_LEN - 1):sz;
  snprintf(cfg->ecfg.title, sz, "%s", cptr->value);

  cptr = ucvm_find_name(chead, "author");
  if (cptr == NULL) {
    fprintf(stderr, "Failed to find author in config\n");
    return(UCVM_CODE_ERROR);
  }
  sz= strlen(cptr->value);
  sz= sz > (UCVM_META_MAX_STRING_LEN - 1)?(UCVM_META_MAX_STRING_LEN - 1):sz;
  snprintf(cfg->ecfg.author, sz,"%s", cptr->value);
  
  cptr = ucvm_find_name(chead, "date");
  if (cptr == NULL) {
    fprintf(stderr, "Failed to find date in config\n");
    return(UCVM_CODE_ERROR);
  }
  sz= strlen(cptr->value);
  sz= sz > (UCVM_META_MAX_STRING_LEN - 1)?(UCVM_META_MAX_STRING_LEN - 1):sz;
  snprintf(cfg->ecfg.date, sz, "%s", cptr->value);

  cptr = ucvm_find_name(chead, "outputfile");
  if (cptr == NULL) {
    fprintf(stderr, "Failed to find outputfile in config\n");
    return(UCVM_CODE_ERROR);
  }
  sz= strlen(cptr->value);
  sz= sz > (UCVM_MAX_PATH_LEN - 1)?(UCVM_MAX_PATH_LEN - 1):sz;
  snprintf(cfg->ecfg.outputfile, sz, "%s", cptr->value);

  cptr = ucvm_find_name(chead, "elev_hr_dir");
  if (cptr == NULL) {
    fprintf(stderr, "Failed to find elev_hr_dir in config\n");
    return(UCVM_CODE_ERROR);
  }
  sz= strlen(cptr->value);
  sz= sz > (UCVM_MAX_PATH_LEN - 1)?(UCVM_MAX_PATH_LEN - 1):sz;
  snprintf(cfg->elev_hr_dir, sz,"%s", cptr->value);

  cptr = ucvm_find_name(chead, "elev_lr_dir");
  if (cptr == NULL) {
    fprintf(stderr, "Failed to find elev_lr_dir in config\n");
    return(UCVM_CODE_ERROR);
  }
  sz= strlen(cptr->value);
  sz= sz > (UCVM_MAX_PATH_LEN - 1)?(UCVM_MAX_PATH_LEN - 1):sz;
  snprintf(cfg->elev_lr_dir, sz,"%s", cptr->value);

  cptr = ucvm_find_name(chead, "vs30_hr_dir");
  if (cptr == NULL) {
    fprintf(stderr, "Failed to find vs30_hr_dir in config\n");
    return(UCVM_CODE_ERROR);
  }
  sz= strlen(cptr->value);
  sz= sz > (UCVM_MAX_PATH_LEN - 1)?(UCVM_MAX_PATH_LEN - 1):sz;
  snprintf(cfg->vs30_hr_dir, sz,"%s", cptr->value);

  cptr = ucvm_find_name(chead, "vs30_lr_dir");
  if (cptr == NULL) {
    fprintf(stderr, "Failed to find vs30_lr_dir in config\n");
    return(UCVM_CODE_ERROR);
  }
  sz= strlen(cptr->value);
  sz= sz > (UCVM_MAX_PATH_LEN - 1)?(UCVM_MAX_PATH_LEN - 1):sz;
  snprintf(cfg->vs30_lr_dir, sz,"%s", cptr->value);

  /* Setup projection */
  if (ucvm_proj_ucvm_init(cfg->projinfo.projstr, 
			  &(cfg->projinfo.corner), 
			  cfg->projinfo.rot,
			  &(cfg->projinfo.dims),
			  &(cfg->projinfo.proj)) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "Failed to setup proj %s.\n", 
	    cfg->projinfo.projstr);
    return(UCVM_CODE_ERROR);
  }

  /* Setup etree parameters */
  /* Determine length of longest side */
  if (cfg->projinfo.dims.coord[0] > cfg->projinfo.dims.coord[1]) {
    cfg->ecfg.max_length = cfg->projinfo.dims.coord[0];
  } else {
    cfg->ecfg.max_length = cfg->projinfo.dims.coord[1];
  }
  /* Setup tick size */
  cfg->ecfg.ticksize = cfg->ecfg.max_length / 
    (double)((etree_tick_t)1 << (ETREE_MAXLEVEL));

  /* Compute level based on grid spacing */
  cfg->ecfg.level = ceil(log(cfg->ecfg.max_length/
			     cfg->spacing) /log(2.0));
  
  /* Compute octant size */
  cfg->ecfg.octsize = cfg->ecfg.max_length/pow(2.0, cfg->ecfg.level);

  /* Update z dim to be one octant in length */
  cfg->projinfo.dims.coord[2] = cfg->ecfg.octsize;

  for (i = 0; i < 3; i++) {
    /* Determine max ticks in each dimension */
    cfg->ecfg.max_ticks[i] = (cfg->projinfo.dims.coord[i] / 
			      cfg->ecfg.max_length) * 
      (double)((etree_tick_t)1 << (ETREE_MAXLEVEL));

    /* Compute etree oct dimensions, rounding up to ensure
       that projected coordinates will always fall into an octant */
    cfg->ecfg.oct_dims.dim[i] = ceil(cfg->projinfo.dims.coord[i]/
				     cfg->ecfg.octsize);
  }

  
  return(UCVM_CODE_SUCCESS);
}


/* Dump config to stdout */
int disp_config(ge_cfg_t *cfg) 
{
  printf("Configuration:\n");
  printf("\tProjection: %s\n", cfg->projinfo.projstr);
  printf("\t\tOrigin: %lf deg, %lf deg\n", 
	 cfg->projinfo.corner.coord[0],
	 cfg->projinfo.corner.coord[1]);
  printf("\t\tRot Angle: %lf deg\n", cfg->projinfo.rot);
  printf("\tRegion Dims: %lf m, %lf m, %lf m\n", 
  	 cfg->projinfo.dims.coord[0], 
  	 cfg->projinfo.dims.coord[1],
  	 cfg->projinfo.dims.coord[2]); 

  printf("\tSpacing: %lf m\n", cfg->spacing);  
  printf("\tAuthor: %s\n", cfg->ecfg.author);
  printf("\tTitle: %s\n", cfg->ecfg.title);
  printf("\tDate: %s\n", cfg->ecfg.date);
  printf("\tOutput File: %s\n\n", cfg->ecfg.outputfile);
  printf("Calculated for %lf m:\n", cfg->spacing);
  printf("\tLevel: %d\n", cfg->ecfg.level);
  printf("\tOct Size: %lf m\n", cfg->ecfg.octsize);  
  printf("\tEtree Oct Dims: %d, %d, %d\n", 
	 cfg->ecfg.oct_dims.dim[0],
	 cfg->ecfg.oct_dims.dim[1],
	 cfg->ecfg.oct_dims.dim[2]);
  
  return(UCVM_CODE_SUCCESS);
}
