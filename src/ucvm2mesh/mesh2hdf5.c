/**
   mesh2hdf5.c

**/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ucvm.h"
#include "um_mesh.h"
#include "ucvm_config.h"
#include "um_dtypes.h"
#include "um_config.h"
#include "um_utils.h"

#include "um_hdf5.h"

/* Valid ranges for properties */
#define MIN_VP_VALUE -9000
#define MAX_VP_VALUE 9000
#define MIN_VS_VALUE -7500
#define MAX_VS_VALUE 7500
#define MIN_RHO_VALUE -6000
#define MAX_RHO_VALUE 6000

/* Rank (number of dimensions) for each variable */
#define RANK_depth 1
#define RANK_longitude 2
#define RANK_latitude 2
#define RANK_Vp 3
#define RANK_Vs 3
#define RANK_density 3

/* Usage */
//  printf("Usage: %s inmesh ingrid format spacing nx ny nz outfile\n\n", arg);
void usage(char *arg)
{
  printf("Usage: %s -f ucvm2mesh.conf -m mesh2hdf5.conf\n\n", arg);
  printf("Version: %s\n\n", VERSION);
}

/* Read in grid points from grid file */
int get_grid(char *file, size_t nx, size_t ny, ucvm_point_t *grid)
{
  size_t num_grid;
  FILE *ifp;
  size_t retval;

  num_grid = nx * ny;
  ifp = fopen(file, "rb");
  if (ifp == NULL) {
    fprintf(stderr, "Failed to open grid file\n");
    return(1);
  }
  retval = fread(grid, sizeof(ucvm_point_t), num_grid, ifp);
  fclose(ifp);

  if (retval != num_grid) {
    fprintf(stderr, "Failed to read grid file %ld and %ld\n",retval, num_grid);
    return(1);
  }

  return(0);
}


/* Read in material properties from mesh, supports a variety
   of formats. Somewhat inefficient for non IJK-12 formats.  */
int get_props(char *file, mesh_format_t format, 
	      size_t nx, size_t ny, size_t nz, 
	      mesh_ijk12_t *props)
{
  size_t i;
  size_t num_grid;
  FILE *ifp1, *ifp2, *ifp3;
  char tmpfile[256];
  size_t retval;
  mesh_sord_t prop_sord_vp, prop_sord_vs, prop_sord_rho;
  mesh_ijk20_t prop_ijk20;
  mesh_ijk32_t prop_ijk32;

  num_grid = nx * ny * nz;

  /* Read mesh according to format */
  switch (format) {
  case MESH_FORMAT_IJK12:
    ifp1 = fopen(file, "rb");
    if (ifp1 == NULL) {
      fprintf(stderr, "Failed to open mesh file\n");
      return(1);
    }
    retval = fread(props, sizeof(mesh_ijk12_t), num_grid, ifp1);
    fclose(ifp1);
    if (retval != num_grid) {
      fprintf(stderr, "Failed to read mesh file\n");
      return(1);
    }
    break;
  case MESH_FORMAT_IJK20:
    ifp1 = fopen(file, "rb");
    if (ifp1 == NULL) {
      fprintf(stderr, "Failed to open mesh file\n");
      return(1);
    }
    for (i = 0; i < num_grid; i++) {
      if (fread(&prop_ijk20, sizeof(mesh_ijk20_t), 1, ifp1) != 1) {
	fprintf(stderr, "Failed to read mesh file\n");
	fclose(ifp1);
	return(1);
      }
      props[i].vp = prop_ijk20.vp;
      props[i].vs = prop_ijk20.vs;
      props[i].rho = prop_ijk20.rho;
    }
    fclose(ifp1);
    break;
  case MESH_FORMAT_IJK32:
    ifp1 = fopen(file, "rb");
    if (ifp1 == NULL) {
      fprintf(stderr, "Failed to open mesh file\n");
      return(1);
    }
    for (i = 0; i < num_grid; i++) {
      if (fread(&prop_ijk32, sizeof(mesh_ijk32_t), 1, ifp1) != 1) {
	fprintf(stderr, "Failed to read mesh file\n");
	fclose(ifp1);
	return(1);
      }
      props[i].vp = prop_ijk32.vp;
      props[i].vs = prop_ijk32.vs;
      props[i].rho = prop_ijk32.rho;
    }
    fclose(ifp1);
    break;
  case MESH_FORMAT_SORD:
    sprintf(tmpfile, "%s_vp", file);
    ifp1 = fopen(tmpfile, "rb");
    sprintf(tmpfile, "%s_vs", file);
    ifp2 = fopen(tmpfile, "rb");
    sprintf(tmpfile, "%s_rho", file);
    ifp3 = fopen(tmpfile, "rb");
    if ((ifp1 == NULL) || (ifp2 == NULL) || (ifp3 == NULL)) {
      fprintf(stderr, "Failed to open mesh file\n");
      return(1);
    }
    for (i = 0; i < num_grid; i++) {
      if (fread(&prop_sord_vp, sizeof(mesh_sord_t), 1, ifp1) != 1) {
	fprintf(stderr, "Failed to read vp mesh file\n");
	fclose(ifp1);
	fclose(ifp2);
	fclose(ifp3);
	return(1);
      }
      props[i].vp = prop_sord_vp.val;
      if (fread(&prop_sord_vs, sizeof(mesh_sord_t), 1, ifp2) != 1) {
	fprintf(stderr, "Failed to read vs mesh file\n");
	fclose(ifp1);
	fclose(ifp2);
	fclose(ifp3);
	return(1);
      }
      props[i].vs = prop_sord_vs.val;
      if (fread(&prop_sord_rho, sizeof(mesh_sord_t), 1, ifp3) != 1) {
	fprintf(stderr, "Failed to read rho mesh file\n");
	fclose(ifp1);
	fclose(ifp2);
	fclose(ifp3);
	return(1);
      }
      props[i].rho = prop_sord_rho.val;
    }
    fclose(ifp1);
    fclose(ifp2);
    fclose(ifp3);
    break;
  default:
    fprintf(stderr, "Invalid mesh format\n");
    return(1);
  }

  return(0);
}


/***************************/
int main(int argc, char **argv) {

  int i, j, k;

  /* Config params */
  mesh_config_t cfg_um;
  hdf5_config_t cfg_mh;

  /* dimension ids */
  int nlon_dim;
  int nlat_dim;
  int depth_dim;
  
  /* variable ids */
  int depth_id;
  int longitude_id;
  int latitude_id;
  int Vp_id;
  int Vs_id;
  int density_id;
  
  /* variable shapes */
  int depth_dims[RANK_depth];
  int longitude_dims[RANK_longitude];
  int latitude_dims[RANK_latitude];
  int Vp_dims[RANK_Vp];
  int Vs_dims[RANK_Vs];
  int density_dims[RANK_density];

  /* mesh, grid variables */
  ucvm_point_t *grid = NULL;
  mesh_ijk12_t *props = NULL;

  /* variable data */
  float *depth_data, *longitude_data, *latitude_data;
  float *Vp_data, *Vs_data, *density_data;

  /* ucvm2mesh */
  char *inmesh, *ingrid;
  char *proj, *rot;
  int spacing;
  size_t nx, ny, nz;
  float x0, y0, z0;
  mesh_format_t format;
 
  /* mesh2hdf5 */
  char *outfile=NULL;
  char *title=NULL;
  char *id=NULL;
  char *description=NULL;
  char *keywords=NULL;
  char *history=NULL;
  char *comment=NULL;
  char *version=NULL;
  char *creator_name=NULL;
  char *creator_email=NULL;
  char *creator_institution=NULL;
  char *authors=NULL;
  char *acknowledgement=NULL;
  char *references=NULL;
  char *license=NULL;

  /* Parse args */
  if(argc != 2) {
    usage(argv[0]);
    exit(1);
  }

  /* Options */
  int opt;
  char configfile_um[UCVM_MAX_PATH_LEN]; // ucvm2mesh
  char configfile_mh[UCVM_MAX_PATH_LEN]; // mesh2hdf5
  /* Parse options */
  strcpy(configfile_um, "");
  strcpy(configfile_mh, "");

  /* Parse options */
  while ((opt = getopt(argc, argv, "hf:m:")) != -1) {
    switch (opt) {
    case 'f':
      strcpy(configfile_um, optarg);
      break;
    case 'm':
      strcpy(configfile_mh, optarg);
      break;
    case 'h':
      usage(argv[0]);
      exit(0);
      break;
    default: /* '?' */
      fprintf(stderr, "Unrecognized option %c\n", opt);
      usage(argv[0]);
      return(1);
    }
  }

  /* Read in config_um */
  if (read_config(0, -1, configfile_um, cfg_um, 1 /* old-style */) != 0) {
    return(1);
  }
  disp_config(cfg_um);
  inmesh=cfg_um.meshfile;
  ingrid=cfg_um.gridfile;
  format=cfg_um.meshtype;
  proj=cfg_um.proj;
  rot=cfg_um.rot;
  spacing = atoi(cfg_um.spacing);
  x0 = cfg_um.origin.coord[0];
  y0 = cfg_um.origin.coord[1];
  z0 = cfg_um.origin.coord[2];
  nx = cfg_um.dims.dim[0];
  ny = cfg_um.dims.dim[1];
  nz = cfg_um.dims.dim[2];

  /* Read in config_mh */
  if (read_hdf5_config(0, -1, configfile_mh, cfg_mh) != 0) {
    return(1);
  }
  disp_hdf5_config(cfg_mh);
  outfile=cfg_mh.outfile;
  title=cfg_mh.title;
  description=cfg_mh.description;
  keywords=cfg_mh.keywords;
  history=cfg_mh.history;
  comment=cfg_mh.comment;
  version=cfg_mh.version;
  creator_name=cfg_mh.creator_name;
  creator_email=cfg_mh.creator_email;
  creator_institution=cfg_mh.creator_institution;
  authors=cfg_mh.authors;
  acknowledgement=cfg_mh.acknowledgement;
  references=cfg_mh.references;
  license=cfg_mh.license;


// HDF5 --
  hid_t file_id; // file handles
  herr_t status;

  // Create a new file
  file_id = H5Fcreate(outfile, H5F_ACC_TRUNC, H5P_DEFAULT, H5P_DEFAULT);

  /* define dimensions */
  stat = nc_def_dim(ncid, "nlon", nx, &nlon_dim);
  stat = nc_def_dim(ncid, "nlat", ny, &nlat_dim);
  stat = nc_def_dim(ncid, "depth", nz, &depth_dim);

  /* define variables */
  depth_dims[0] = depth_dim;
  stat = nc_def_var(ncid, "depth", NC_FLOAT, RANK_depth, 
		    depth_dims, &depth_id);

  longitude_dims[0] = nlat_dim;
  longitude_dims[1] = nlon_dim;
  stat = nc_def_var(ncid, "longitude", NC_FLOAT, RANK_longitude, 
		    longitude_dims, &longitude_id);
  
  latitude_dims[0] = nlat_dim;
  latitude_dims[1] = nlon_dim;
  stat = nc_def_var(ncid, "latitude", NC_FLOAT, RANK_latitude, 
		    latitude_dims, &latitude_id);
  
  Vp_dims[0] = depth_dim;
  Vp_dims[1] = nlat_dim;
  Vp_dims[2] = nlon_dim;
  stat = nc_def_var(ncid, "Vp", NC_FLOAT, RANK_Vp, Vp_dims, &Vp_id);

  Vs_dims[0] = depth_dim;
  Vs_dims[1] = nlat_dim;
  Vs_dims[2] = nlon_dim;
  stat = nc_def_var(ncid, "Vs", NC_FLOAT, RANK_Vs, Vs_dims, &Vs_id);

  density_dims[0] = depth_dim;
  density_dims[1] = nlat_dim;
  density_dims[2] = nlon_dim;
  stat = nc_def_var(ncid, "density", NC_FLOAT, RANK_density, 
		    density_dims, &density_id);

  /* assign per-variable attributes */

  /* units */
  stat = nc_put_att_text(ncid, depth_id, "units", 5, "meter");

  /* positive */
  stat = nc_put_att_text(ncid, depth_id, "positive", 4, "down");

  /* long_name */
  stat = nc_put_att_text(ncid, longitude_id, "long_name", 24, 
			 "Longitude, positive East");

  /* units */
  stat = nc_put_att_text(ncid, longitude_id, "units", 12, 
			 "degrees_east");

  /* standard_name */
  stat = nc_put_att_text(ncid, longitude_id, "standard_name", 9, 
			 "longitude");

  /* long_name */
  stat = nc_put_att_text(ncid, latitude_id, "long_name", 24, 
			 "Latitude, positive north");

  /* units */
  stat = nc_put_att_text(ncid, latitude_id, "units", 13, 
			 "degrees_north");

  /* standard_name */
  stat = nc_put_att_text(ncid, latitude_id, "standard_name", 8, 
			 "latitude");

  /* long_name */
  stat = nc_put_att_text(ncid, Vp_id, "long_name", 15, 
			 "P wave velocity");

  /* valid_range */
  static const float Vp_valid_range_att[2] = {MIN_VP_VALUE, MAX_VP_VALUE} ;
  stat = nc_put_att_float(ncid, Vp_id, "valid_range", NC_FLOAT, 2, 
			  Vp_valid_range_att);

  /* units */
  stat = nc_put_att_text(ncid, Vp_id, "units", 12, "meter sec^-1");

  /* coordinates */
  stat = nc_put_att_text(ncid, Vp_id, "coordinates", 24, 
			 "longitude latitude depth");

  /* long_name */
  stat = nc_put_att_text(ncid, Vs_id, "long_name", 15, 
			 "S wave velocity");

  /* valid_range */
  static const float Vs_valid_range_att[2] = {MIN_VS_VALUE, MAX_VS_VALUE} ;
  stat = nc_put_att_float(ncid, Vs_id, "valid_range", NC_FLOAT, 2, 
			  Vs_valid_range_att);

  /* units */
  stat = nc_put_att_text(ncid, Vs_id, "units", 12, "meter sec^-1");

  /* coordinates */
  stat = nc_put_att_text(ncid, Vs_id, "coordinates", 24, 
			 "longitude latitude depth");

  /* long_name */
  stat = nc_put_att_text(ncid, density_id, "long_name", 7, 
			 "density");

  /* valid_range */
  static const float density_valid_range_att[2] = 
    {MIN_RHO_VALUE, MAX_RHO_VALUE} ;
  stat = nc_put_att_float(ncid, density_id, "valid_range", NC_FLOAT, 2, 
			  density_valid_range_att);

  /* units */
  stat = nc_put_att_text(ncid, density_id, "units", 17, 
			 "kilogram meter^-3");

  /* coordinates */
  stat = nc_put_att_text(ncid, density_id, "coordinates", 24, 
			 "longitude latitude depth");
  
  /* leave define mode */
  stat = nc_enddef (ncid);
    
  /* Allocate buffers */
  grid = malloc(nx * ny * sizeof(ucvm_point_t));
  props = malloc(nx * ny * nz * sizeof(mesh_ijk12_t));
  if ((grid == NULL) || (props == NULL)) {
    fprintf(stderr, "Failed to allocate mesh buffers\n");
    return(1);
  }

  latitude_data = malloc(nx * ny * sizeof(float));
  longitude_data = malloc(nx * ny * sizeof(float));
  depth_data = malloc(nz * sizeof(float));
  Vp_data = malloc(nx * ny * nz * sizeof(float));
  Vs_data = malloc(nx * ny * nz * sizeof(float));  
  density_data = malloc(nx * ny * nz * sizeof(float));
  
  /* Get grid points */
  if (get_grid(ingrid, nx, ny, grid) != 0) {
    fprintf(stderr, "Failed to get grid\n");
    return(1);
  }
  
  /* Get mesh values */
  if (get_props(inmesh, format, nx, ny, nz, props) != 0) {
    fprintf(stderr, "Failed to get mesh\n");
      return(1);
  }

  /* assign variable data */

  /* Store depth */
  for (i = 0; i < nz; i++) {
    depth_data[i] = i * spacing;
  }
  size_t depth_startset[1] = {0} ;
  size_t depth_countset[1] = {nz} ;
  stat = nc_put_vara(ncid, depth_id, depth_startset, depth_countset, 
		     depth_data);
  stat = nc_put_vara(ncid, depth_id, depth_startset, depth_countset, 
		     depth_data);
  
  /* Store longitude */
  for (j = 0; j < ny; j++) {
    for (i = 0; i < nx; i++) {
      longitude_data[j*nx+i] = grid[j*nx+i].coord[0];
    }
  }
  size_t longitude_startset[2] = {0, 0} ;
  size_t longitude_countset[2] = {ny, nx} ;
  stat = nc_put_vara(ncid, longitude_id, longitude_startset, 
		     longitude_countset, longitude_data);
  stat = nc_put_vara(ncid, longitude_id, longitude_startset, 
		     longitude_countset, longitude_data);
  
  /* Store latitudes */
  for (j = 0; j < ny; j++) {
    for (i = 0; i < nx; i++) {
      latitude_data[j*nx+i] = grid[j*nx+i].coord[1];
    }
  }
  size_t latitude_startset[2] = {0, 0} ;
  size_t latitude_countset[2] = {ny, nx} ;
  stat = nc_put_vara(ncid, latitude_id, latitude_startset, 
		     latitude_countset, latitude_data);
  stat = nc_put_vara(ncid, latitude_id, latitude_startset, 
		     latitude_countset, latitude_data);
  
  /* Store Vp */
  for (k = 0; k < nz; k++) {
    for (j = 0; j < ny; j++) {
      for (i = 0; i < nx; i++) {
	Vp_data[k*(nx*ny)+j*(nx)+i] = 
	  props[k*(nx*ny)+j*(nx)+i].vp;
      }
    }
  }
  size_t Vp_startset[3] = {0, 0, 0} ;
  size_t Vp_countset[3] = {nz, ny, nx} ;
  stat = nc_put_vara(ncid, Vp_id, Vp_startset, Vp_countset, Vp_data);
  stat = nc_put_vara(ncid, Vp_id, Vp_startset, Vp_countset, Vp_data);
  
  /* Store Vs */
  for (k = 0; k < nz; k++) {
    for (j = 0; j < ny; j++) {
      for (i = 0; i < nx; i++) {
	Vs_data[k*(nx*ny)+j*(nx)+i] = 
	  props[k*(nx*ny)+j*(nx)+i].vs;
      }
    }
  }
  size_t Vs_startset[3] = {0, 0, 0} ;
  size_t Vs_countset[3] = {nz, ny, nx} ;
  stat = nc_put_vara(ncid, Vs_id, Vs_startset, Vs_countset, Vs_data);
  stat = nc_put_vara(ncid, Vs_id, Vs_startset, Vs_countset, Vs_data);

  /* Store density */
  for (k = 0; k < nz; k++) {
    for (j = 0; j < ny; j++) {
      for (i = 0; i < nx; i++) {
	density_data[k*(nx*ny)+j*(nx)+i] = 
	  props[k*(nx*ny)+j*(nx)+i].rho;
      }
    }
  }
  size_t density_startset[3] = {0, 0, 0} ;
  size_t density_countset[3] = {nz, ny, nx} ;
  stat = nc_put_vara(ncid, density_id, density_startset, 
		     density_countset, density_data);
  stat = nc_put_vara(ncid, density_id, density_startset, 
		     density_countset, density_data);
  
  /* Free memory */
  free(depth_data);
  free(longitude_data);
  free(latitude_data);
  free(Vp_data);
  free(Vs_data);
  free(density_data);
  free(grid);
  free(props);
  
  stat = nc_close(ncid);
  check_err(stat,__LINE__,__FILE__);
  return 0;
}

