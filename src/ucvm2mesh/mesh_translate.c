/**
 * mesh_translate.c - Perform origin tranlate operation on a mesh,
 * north-west to south-west
 *   fast-Y
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <math.h>
#include "um_dtypes.h"
#include "um_mesh.h"


#define MAX_NODES 10000

/* Usage information */
void usage(char *arg)
{
  printf("Usage: %s type seek-type nx ny nz imesh\n\n",arg);
  printf("where:\n");
  printf("\ttype: data type, material properties or doubles\n");
  printf("\tseek-type: which axis to seek : fast-Y or fast-X\n");
  printf("\tnx: nx matching ucvm2mesh call\n");
  printf("\tny: ny matching ucvm2mesh call\n");
  printf("\tnz: nz matching ucvm2mesh call\n");
}


int main(int argc, char **argv)
{
  int type, seek_type;
  char seek_type_str[20];
  char mesh[40];
  int nx,ny,nz;
  
  /* Parse args */
  if(argc != 7) {
    usage(argv[0]);
    exit(1);
  }

  type=atoi(argv[1]);
  strcpy(seek_type_str, argv[2]);
  nx=atoi(argv[3]);
  ny=atoi(argv[4]);
  nz=atoi(argv[5]);
  strcpy(mesh, argv[6]);

  if (strcmp(seek_type_str, "fast-Y") == 0) {
    seek_type = 0;
    } else {
      seek_type = 1;
  }

  ucvm_grid_translate_data_file(type, seek_type, nx,ny,nz, mesh);

  return 0;
}
