#ifndef UM_DTYPES_H
#define UM_DTYPES_H

#include "ucvm.h"
#include "ucvm_grid.h"
#include "um_mesh.h"


/* Mesh Config */
typedef struct mesh_config_t 
{
  int rank;
  char ucvmstr[UCVM_MAX_LABEL_LEN];
  double ucvm_zrange[2];
  double ucvm_floor[3];
  char ucvmconf[UCVM_MAX_PATH_LEN];
  ucvm_gtype_t gridtype;
  ucvm_ctype_t querymode;

  double min_zrange; /* optional */
  double max_zrange; /* optional */
  double vs_floor; /* optional */
  double vp_floor; /* optional */
  double density_floor; /* optional */

  double spacing; /* optional unified x/y/z spacing */
  double x_spacing; /* optional */
  double y_spacing; /* optional */
  double z_spacing; /* optional */

/* optional, to hold user specified input filename */
  char *x_file; /* optional */ 
  int user_x; /* if xlist were supplied by user */
  char *y_file; /* optional */
  int user_y; /* if ylist were supplied by user */
  char *z_file; /* optional */
  int user_z; /* if zlist were supplied by user */

  double *z_list; // internal z_list 
  int z_list_num; 

  double *x_list; // internal x_list
  int x_list_num;

  double *y_list; // internal y_list
  int y_list_num;

  char proj[UCVM_MAX_PROJ_LEN];
  double rot;
  ucvm_point_t origin;
  ucvm_dim_t dims;
  ucvm_dim_t proc_dims;
  double vs_min, vp_min;
  char meshfile[UCVM_MAX_PATH_LEN];
  char gridfile[UCVM_MAX_PATH_LEN];
  mesh_format_t meshtype;
  char scratch[UCVM_MAX_PATH_LEN];
} mesh_config_t;


#endif
