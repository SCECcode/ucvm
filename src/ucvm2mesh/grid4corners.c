/**
 * grid4corners.c - Extract 4 latlon corners from a regular grid
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ucvm.h"

int grid_debug=0;

/* Usage */
void usage(char *arg)
{
  printf("Usage: %s ingrid nx ny\n\n", arg);
  printf("where:\n");
  printf("\tingrid: input grid file\n");
  printf("\tnx,ny: grid dimensions\n\n");

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
    fprintf(stderr, "Failed to read grid file\n");
    return(1);
  }

  return(0);
}

int main(int argc, char **argv) {
  /* dimension ids */
  int nlon_dim;
  int nlat_dim;
  
  /* grid variables */
  ucvm_point_t *grid = NULL;

  /* Arguments */
  char ingrid[256];
  int nx, ny, num_grid;

  /* Parse args */
  if(argc != 3) {
    usage(argv[0]);
    exit(1);
  }

  strcpy(ingrid, argv[1]);
  nx = atoi(argv[2]);
  ny = atoi(argv[3]);
  num_grid = nx * ny;

  /* Check arguments */
  if ((nx <= 0) || (ny <= 0)) {
    fprintf(stderr, "Invalid grid dims %ld,%ld\n", nx, ny);
    exit(1);
  }

  /* Allocate buffers */
  grid = malloc(nx * ny * sizeof(ucvm_point_t));
  if (grid == NULL) {
    fprintf(stderr, "Failed to allocate grid buffers\n");
    return(1);
  }

  /* Get grid points */
  if (get_grid(ingrid, nx, ny, grid) != 0) {
    fprintf(stderr, "Failed to get grid\n");
    return(1);
  }

  printf("Grid 4 corners:\n");
  // first one
  printf("  %lf %lf (%d)\n",grid[0].coord[0],grid[0].coord[1],0);
  // x-1
  printf("  %lf %lf (%d)\n",grid[nx-1].coord[0],grid[nx-1].coord[1],nx-1);
  // num_grid - x
  printf("  %lf %lf (%d)\n",grid[num_grid-nx].coord[0],grid[num_grid-nx].coord[1],num_grid-nx);
  // num_grid - 1
  printf("  %lf %lf (%d)\n",grid[num_grid-1].coord[0],grid[num_grid-1].coord[1],num_grid-1);
  if(grid_debug) {
      printf("grid size %d, %d\n", nx, ny);
      printf("indexing at 0->%d->%d->%d\n",nx-1, num_grid-nx, num_grid-1);
      printf("Xaxis row:\n");
      for(int i=0; i<nx; i++) {
        printf("  %lf %lf\n",grid[i].coord[0],grid[i].coord[1]);
      }
  }

  
  free(grid);
  return 0;
}

