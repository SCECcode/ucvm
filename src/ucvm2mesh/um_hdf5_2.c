/**
 * um_hdf5.c
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
#include "um_hdf5.h"


/* Read config file*/
int read_hdf5_config(int myid, int nproc, const char *cfgfile, hdf5_config_t *cfg)
{
  ucvm_config_t *chead;
  ucvm_config_t *cptr;

  /* Initialize variables */
  cfg->rank = myid;

  /* Parse config file */
    
  printf("[%d] Using hdf5 config file %s\n", myid, cfgfile);
  chead = ucvm_parse_config(cfgfile);
  if (chead == NULL) {
    fprintf(stderr, "[%d] Failed to parse config file %s\n", 
         myid, cfgfile);
    return(1);
  }

  cptr = ucvm_find_name(chead, "outfile");
  if (cptr == NULL) {
    fprintf(stderr, "[%d] Failed to find outfile in hdf5 config\n", myid);
    return(1);
  }
  sprintf(cfg->outfile, "%s", cptr->value);
  cptr = ucvm_find_name(chead, "title");
  if (cptr == NULL ) {
     fprintf(stderr, "[%d] Failed to find title in hdf5 config\n", myid);
     return(1); 
  }
  sprintf(cfg->title, "%s", cptr->value);
  cptr = ucvm_find_name(chead, "description");
  if (cptr == NULL ) {
     fprintf(stderr, "[%d] Failed to find description in hdf5 config\n", myid);
     return(1); 
  }
  sprintf(cfg->description, "%s", cptr->value);
  cptr = ucvm_find_name(chead, "keywords");
  if (cptr == NULL ) {
     fprintf(stderr, "[%d] Failed to find keywords in hdf5 config\n", myid);
     return(1); 
  }
  sprintf(cfg->keywords, "%s", cptr->value);
  cptr = ucvm_find_name(chead, "history");
  if (cptr == NULL ) {
     fprintf(stderr, "[%d] Failed to find history in hdf5 config\n", myid);
     return(1); 
  }
  sprintf(cfg->history, "%s", cptr->value);
  cptr = ucvm_find_name(chead, "comment");
  if (cptr == NULL ) {
     fprintf(stderr, "[%d] Failed to find comment in hdf5 config\n", myid);
     return(1); 
  }
  sprintf(cfg->comment, "%s", cptr->value);
  cptr = ucvm_find_name(chead, "version");
  if (cptr == NULL ) {
     fprintf(stderr, "[%d] Failed to find version in hdf5 config\n", myid);
     return(1); 
  }
  sprintf(cfg->version, "%s", cptr->value);
  cptr = ucvm_find_name(chead, "creator_name");
  if (cptr == NULL ) {
     fprintf(stderr, "[%d] Failed to find creator_name in hdf5 config\n", myid);
     return(1); 
  }
  sprintf(cfg->creator_name, "%s", cptr->value);
  cptr = ucvm_find_name(chead, "creator_email");
  if (cptr == NULL ) {
     fprintf(stderr, "[%d] Failed to find creator_email in hdf5 config\n", myid);
     return(1); 
  }
  sprintf(cfg->creator_email, "%s", cptr->value);
  cptr = ucvm_find_name(chead, "creator_institution");
  if (cptr == NULL ) {
     fprintf(stderr, "[%d] Failed to find creator_institution in hdf5 config\n", myid);
     return(1); 
  }
  sprintf(cfg->creator_institution, "%s", cptr->value);
  cptr = ucvm_find_name(chead, "authors");
  if (cptr == NULL ) {
     fprintf(stderr, "[%d] Failed to find authors in hdf5 config\n", myid);
     return(1); 
  }
  sprintf(cfg->authors, "%s", cptr->value);
  cptr = ucvm_find_name(chead, "acknowledgement");
  if (cptr == NULL ) {
     fprintf(stderr, "[%d] Failed to find acknowledgement in hdf5 config\n", myid);
     return(1); 
  }
  sprintf(cfg->acknowledgement, "%s", cptr->value);
  cptr = ucvm_find_name(chead, "references");
  if (cptr == NULL ) {
     fprintf(stderr, "[%d] Failed to find references in hdf5 config\n", myid);
     return(1); 
  }
  sprintf(cfg->references, "%s", cptr->value);
  cptr = ucvm_find_name(chead, "license");
  if (cptr == NULL ) {
     fprintf(stderr, "[%d] Failed to find license in hdf5 config\n", myid);
     return(1); 
  }
  sprintf(cfg->license, "%s", cptr->value);

  ucvm_free_config(chead);
  return(0);
}

/* Dump config to stdout */
int disp_hdf5_config(hdf5_config_t *cfg) {

  printf("[%d] HDF5 Configuration:\n", cfg->rank);
  printf("\t[%d] File: %s\n", cfg->rank, cfg->outfile);
  printf("\t[%d] Title: %s\n", cfg->rank, cfg->title);
  printf("\t[%d] Description: %s\n", cfg->rank, cfg->description);
  printf("\t[%d] Keywords: %s\n", cfg->rank, cfg->keywords);
  printf("\t[%d] History: %s\n", cfg->rank, cfg->history);
  printf("\t[%d] Comment: %s\n", cfg->rank, cfg->comment);
  printf("\t[%d] Version: %s\n", cfg->rank, cfg->version);
  printf("\t[%d] Creator Name: %s\n", cfg->rank, cfg->creator_name);
  printf("\t[%d] Creator Email: %s\n", cfg->rank, cfg->creator_email);
  printf("\t[%d] Creator Institution: %s\n", cfg->rank, cfg->creator_institution);
  printf("\t[%d] Authors: %s\n", cfg->rank, cfg->authors);
  printf("\t[%d] Acknowledgement: %s\n", cfg->rank, cfg->acknowledgement);
  printf("\t[%d] References: %s\n", cfg->rank, cfg->references);
  printf("\t[%d] License: %s\n", cfg->rank, cfg->license);

  return(0);
}



