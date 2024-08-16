/**  
*
*   um_hdf5.c
**/

#include "um_hdf5.h"

/*
typedef struct hdf5_config_t
{
  int rank;
  char outfile[UCVM_MAX_PATH_LEN];
  char title[UCVM_MAX_LINE_LEN];
  char description[UCVM_MAX_LINE_LEN];
  char keywords[UCVM_MAX_LINE_LEN];
  char history[UCVM_MAX_LINE_LEN];
  char comment[UCVM_MAX_LINE_LEN];
  char version[UCVM_MAX_LINE_LEN];
  char creator_name[UCVM_MAX_LINE_LEN];
  char creator_email[UCVM_MAX_LINE_LEN];
  char creator_institution[UCVM_MAX_LINE_LEN];
  char authors[UCVM_MAX_LINE_LEN];
  char acknowledgement[UCVM_MAX_LINE_LEN];
  char references[UCVM_MAX_LINE_LEN];
  char license[UCVM_MAX_LINE_LEN];
} hdf5_config_t;

*/

/* Read in configuration file and populate hdf5 config structure */
int read_hdf5_config(int myid, int nproc, const char *cfgfile,hdf5_config_t *cfg) {
  return 0;
};

/* Dump config to stdout */
int disp_hdf5_config(hdf5_config_t *cfg) {
  return 0
};


