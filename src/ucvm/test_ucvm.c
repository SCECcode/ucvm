
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "ucvm.h"
#include "ucvm_model_1d.h"

#ifdef _UCVM_ENABLE_CENCAL
#include "ucvm_model_cencal.h"
#endif
#ifdef _UCVM_ENABLE_CVMH
#include "ucvm_model_cvmh.h"
#endif
#ifdef _UCVM_ENABLE_CVMS
#include "ucvm_model_cvms.h"
#endif

#define NUM_POINTS 5 


int main(int argc, char **argv)
{
  int i;
  int nn = NUM_POINTS;
  ucvm_point_t *pnt1;
  ucvm_data_t *prop1;
    
  pnt1 = malloc(NUM_POINTS * sizeof(ucvm_point_t));
  prop1 = malloc(NUM_POINTS * sizeof(ucvm_data_t));
  char gtl_label[UCVM_MAX_LABEL_LEN];
  char cr_label[UCVM_MAX_LABEL_LEN];
  
  printf("Init\n");
  if (ucvm_init("../conf/ucvm.conf") != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "Init failed\n");
    return(1);
  }
  
  printf("set Query Mode\n");
  ucvm_ctype_t cmode = UCVM_COORD_GEO_DEPTH; 
  if (ucvm_setparam(UCVM_MODEL_PARAM_QUERY_MODE, cmode) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "Failed to set z mode\n");
    return(1);
  }

/*
  printf("Get Models\n");
#ifdef _UCVM_ENABLE_CVMS
  fprintf(stdout,"adding cvms");
  if (ucvm_add_model("cvms") != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "Retrieval of CVM-S failed\n");
//    return(1);
  }
#endif
*/

#ifdef _UCVM_ENABLE_CVMH
  fprintf(stdout,"adding cvmh\n");
  if (ucvm_add_model("cvmh") != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "Retrieval of CVM-H failed\n");
//    return(1);
  }
#endif
#ifdef _UCVM_ENABLE_CENCAL
  fprintf(stdout,"adding cencal\n");
  if (ucvm_add_model("cencal") != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "Retrieval of CenCal failed\n");
 //   return(1);
  }
#endif

  fprintf(stdout,"adding 1d\n");
  if (ucvm_add_model("1d") != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "Retrieval of 1D failed\n");
//    return(1);
  }
  
  printf("Create points\n");
  for (i = 0; i < NUM_POINTS; i++) {
    pnt1[i].coord[0] = -118.0;
    pnt1[i].coord[1] = 34.0;
    pnt1[i].coord[2] = i * 1000.0;
    //pnt1[i].coord[0] = -122.0;
    //pnt1[i].coord[1] = 38.0;
    //pnt1[i].coord[2] = 2000.0;
  }

  printf("Query Models\n");
  if (ucvm_query(nn, pnt1, prop1) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "Query CVM failed\n");
    return(1);
  }
 
  printf("Results\n");
  for (i = 0; i < NUM_POINTS; i++) {
    ucvm_model_label(prop1[i].crust.source,
                           cr_label, UCVM_MAX_LABEL_LEN);
    ucvm_model_label(prop1[i].gtl.source,
                           gtl_label, UCVM_MAX_LABEL_LEN);
    printf("%d: model=%s, gtl=%s, vp=%lf, vs=%lf, rho=%lf\n", i, 
	   cr_label, gtl_label, prop1[i].cmb.vp, prop1[i].cmb.vs, prop1[i].cmb.rho);
  }

  ucvm_finalize();
  free(pnt1);
  free(prop1);

  return(0);
}
