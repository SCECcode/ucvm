/**
    mesh2csv.c

**/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ucvm.h"
#include "um_mesh.h"

/* Usage */
void usage(char *arg)
{
  printf("Usage: %s inmesh ingrid format spacing nx ny nz outfile\n\n", arg);
  printf("where:\n");
  printf("\tinmesh: input mesh file\n");
  printf("\tingrid: input grid file\n");
  printf("\tformat: format of file, IJK-12, IJK-20, IJK-32, or SORD\n");
  printf("\tspacing: mesh spacing\n");
  printf("\tnx,ny,nz: mesh dimensions\n");
  printf("\toutfile: output mesh csv file\n\n");

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


int main(int argc, char **argv) {
  int i, j, k;
  
  /* mesh, grid variables */
  ucvm_point_t *grid = NULL;
  mesh_ijk12_t *props = NULL;

  /* variable data */
  float *depth_data, *longitude_data, *latitude_data;
  float *Vp_data, *Vs_data, *density_data;

  /* Arguments */
  char inmesh[256], ingrid[256], outfile[256], formatstr[256];
  int spacing;
  size_t nx, ny, nz;
  mesh_format_t format;

  /* Parse args */
  if(argc != 9) {
    usage(argv[0]);
    exit(1);
  }

  format = MESH_FORMAT_UNKNOWN;
  strcpy(inmesh, argv[1]);
  strcpy(ingrid, argv[2]);
  strcpy(formatstr, argv[3]);
  spacing = atoi(argv[4]);
  nx = atoi(argv[5]);
  ny = atoi(argv[6]);
  nz = atoi(argv[7]);
  strcpy(outfile, argv[8]);

  /* Check arguments */
  for (i = 0; i < MAX_MESH_FORMATS; i++) {
    if (strcmp(formatstr, MESH_FORMAT_NAMES[i]) == 0) {
      format = i;
      break;
    }
  }
  if (format == MESH_FORMAT_UNKNOWN) {
    fprintf(stderr, "Unsupported mesh format %s\n", formatstr);
    exit(1);
  }
  if ((nx <= 0) || (ny <= 0) || (nz <= 0)) {
    fprintf(stderr, "Invalid mesh dims %lud,%lud,%lud\n", nx, ny, nz);
    exit(1);
  }
  if (spacing <= 0) {
    fprintf(stderr, "Invalid spacing %d\n", spacing);
    exit(1);
  }

  FILE *ofp = fopen(outfile, "w+");
  if (ofp == NULL) {
    fprintf(stderr, "Failed to open csv mesh file\n");
    return(1);
  }

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
  
  /* Store longitude */
  int long_cnt=0;
  for (i = 0; i < nx; i++) {
    longitude_data[i] = grid[i].coord[0];
    long_cnt++;
  }
//  fprintf(stderr,"long_cnt is %ld\n",long_cnt);
  size_t longitude_startset[1] = {longitude_data[0]} ;
  size_t longitude_countset[1] = {nx} ;
  
  /* Store latitudes */
  int lat_cnt=0;
  for (j = 0; j < ny; j++) {
    latitude_data[j] = grid[j*nx].coord[1];
    lat_cnt++;
  }
//  fprintf(stderr,"lat_cnt is %ld\n",lat_cnt);
  size_t latitude_startset[1] = {latitude_data[0]} ;
  size_t latitude_countset[2] = {ny} ;
  
  /* Store Vp */
  int total_cnt=0;
  for (k = 0; k < nz; k++) {
    for (j = 0; j < ny; j++) {
      for (i = 0; i < nx; i++) {
	Vp_data[k*(nx*ny)+j*(nx)+i] = 
	  props[k*(nx*ny)+j*(nx)+i].vp;
	total_cnt++;
      }
    }
  }
  fprintf(stderr,"total_cnt is %ld\n",total_cnt);
  size_t Vp_startset[3] = {0, 0, 0} ;
  size_t Vp_countset[3] = {nz, ny, nx} ;
  
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

  for (k = 0; k < nz; k++) {
    for (j = 0; j < ny; j++) {
      for (i = 0; i < nx; i++) {
        density_data[k*(nx*ny)+j*(nx)+i] =
          props[k*(nx*ny)+j*(nx)+i].rho;
        fprintf(ofp,"%d %d %d %lf %lf %lf\n",
            j,i,k,
            density_data[k*(nx*ny)+j*(nx)+i],
            Vp_data[k*(nx*ny)+j*(nx)+i],
            Vs_data[k*(nx*ny)+j*(nx)+i]);
      }
    }
  }
  fclose(ofp);


  int ll;
  fprintf(stdout,"x_coordinates = [\n");
  for(ll=0;ll< nx; ll++) {
     fprintf(stdout,"%lf, ", longitude_data[ll]);
  }
  fprintf(stdout,"]\n");

  fprintf(stdout,"y_coordinates = [\n");
  for(ll=0;ll< ny; ll++) {
     fprintf(stdout,"%lf, ", latitude_data[ll]);
  }
  fprintf(stdout,"]\n");

  fprintf(stdout,"z_coordinates = [\n");
  for(ll=0;ll< nz; ll++) {
     fprintf(stdout,"%lf, ", depth_data[ll]);
  }
  fprintf(stdout,"]\n");

  /* Free memory */
  free(depth_data);
  free(longitude_data);
  free(latitude_data);
  free(Vp_data);
  free(Vs_data);
  free(density_data);
  free(grid);
  free(props);
  
  return 0;
}

