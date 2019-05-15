#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <unistd.h>
#include "test_defs.h"
#include "unittest_suite_lib.h"
#include "ucvm.h"


int test_lib_init()
{
  printf("Test: UCVM lib initialization\n");

  /* Setup UCVM */
  if (ucvm_init("../conf/ucvm.conf") != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to initialize UCVM API\n");
    return(1);
  }

  /* Finalize UCVM */
  ucvm_finalize();

  printf("PASS\n");
  return(0);
}

int test_lib_add_model_1d()
{
  printf("Test: UCVM lib add model 1D\n");

  /* Setup UCVM */
  if (ucvm_init("../conf/ucvm.conf") != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to initialize UCVM API\n");
    return(1);
  }

  /* Add model */
  if (ucvm_add_model(UCVM_MODEL_1D) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to enable model %s\n", UCVM_MODEL_1D);
    ucvm_finalize();
    return(1);
  }

  /* Finalize UCVM */
  ucvm_finalize();

  printf("PASS\n");
  return(0);
}

int test_lib_query_1d()
{
  int nn = 1;
  ucvm_point_t pnts;
  ucvm_data_t data;

  printf("Test: UCVM lib query 1D\n");

  /* Setup UCVM */
  if (ucvm_init("../conf/ucvm.conf") != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to initialize UCVM API\n");
    return(1);
  }

  /* Add model */
  if (ucvm_add_model(UCVM_MODEL_1D) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to enable model %s\n", UCVM_MODEL_1D);
    ucvm_finalize();
    return(1);
  }

  /* Query a point */
  pnts.coord[0] = -118.0;
  pnts.coord[1] = 34.0;
  pnts.coord[2] = 0.0;

  if (ucvm_query(nn, &pnts, &data) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to query 1d\n");
    ucvm_finalize();
    return(1);
  }

  /* Check values */
  if (test_assert_double(data.cmb.vp, 5000.0) != 0) {
    ucvm_finalize();
    return(1);
  }
  if (test_assert_double(data.cmb.vs, 2886.751346) != 0) {
    ucvm_finalize();
    return(1);
  }
  if (test_assert_double(data.cmb.rho, 2654.5) != 0) {
    ucvm_finalize();
    return(1);
  }

  /* Finalize UCVM */
  ucvm_finalize();

  printf("PASS\n");
  return(0);
}


int test_lib_get_model_label_1d()
{
  int nn = 1;
  ucvm_point_t pnts;
  ucvm_data_t data;
  char cr_label[UCVM_MAX_LABEL_LEN];

  printf("Test: UCVM lib get model label 1D\n");

  /* Setup UCVM */
  if (ucvm_init("../conf/ucvm.conf") != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to initialize UCVM API\n");
    return(1);
  }

  /* Add model */
  if (ucvm_add_model(UCVM_MODEL_1D) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to enable model %s\n", UCVM_MODEL_1D);
    ucvm_finalize();
    return(1);
  }

  /* Query a point */
  pnts.coord[0] = -118.0;
  pnts.coord[1] = 34.0;
  pnts.coord[2] = 0.0;

  if (ucvm_query(nn, &pnts, &data) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to query 1d\n");
    ucvm_finalize();
    return(1);
  }

  /* Get label */
  strcpy(cr_label, "");
  ucvm_model_label(data.crust.source, 
                   cr_label, UCVM_MAX_LABEL_LEN);

  if (strlen(cr_label) == 0) {
    fprintf(stderr, "FAIL: Label string is empty\n");
    ucvm_finalize();
    return(1);
  }

  if (test_assert_string(cr_label, UCVM_MODEL_1D) != 0) {
    ucvm_finalize();
    return(1);
  }

  /* Finalize UCVM */
  ucvm_finalize();

  printf("PASS\n");
  return(0);
}


int test_lib_setparam_querymode_gd_1d()
{
  printf("Test: UCVM lib setparam querymode geo-depth 1D\n");

  /* Setup UCVM */
  if (ucvm_init("../conf/ucvm.conf") != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to initialize UCVM API\n");
    return(1);
  }

  /* Add model */
  if (ucvm_add_model(UCVM_MODEL_1D) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to enable model %s\n", UCVM_MODEL_1D);
    ucvm_finalize();
    return(1);
  }

  /* Set query model */
  if (ucvm_setparam(UCVM_PARAM_QUERY_MODE, 
		    UCVM_COORD_GEO_DEPTH) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to set query mode to geo depth\n");
    ucvm_finalize();
    return(1);
  }

  /* Finalize UCVM */
  ucvm_finalize();

  printf("PASS\n");
  return(0);
}


int test_lib_setparam_querymode_ge_1d()
{
  printf("Test: UCVM lib setparam querymode geo-elev 1D\n");

  /* Setup UCVM */
  if (ucvm_init("../conf/ucvm.conf") != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to initialize UCVM API\n");
    return(1);
  }

  /* Add model */
  if (ucvm_add_model(UCVM_MODEL_1D) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to enable model %s\n", UCVM_MODEL_1D);
    ucvm_finalize();
    return(1);
  }

  /* Set query model */
  if (ucvm_setparam(UCVM_PARAM_QUERY_MODE, 
		    UCVM_COORD_GEO_ELEV) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to set query mode to geo elev\n");
    ucvm_finalize();
    return(1);
  }

  /* Finalize UCVM */
  ucvm_finalize();

  printf("PASS\n");
  return(0);
}


int test_lib_model_version_1d()
{
  int nn = 1;
  ucvm_point_t pnts;
  ucvm_data_t data;
  char ver[UCVM_MAX_VERSION_LEN];

  printf("Test: UCVM lib model version 1D\n");

  /* Setup UCVM */
  if (ucvm_init("../conf/ucvm.conf") != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to initialize UCVM API\n");
    return(1);
  }

  /* Add model */
  if (ucvm_add_model(UCVM_MODEL_1D) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to enable model %s\n", UCVM_MODEL_1D);
    ucvm_finalize();
    return(1);
  }

  /* Query a point */
  pnts.coord[0] = -118.0;
  pnts.coord[1] = 34.0;
  pnts.coord[2] = 0.0;

  if (ucvm_query(nn, &pnts, &data) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to query 1d\n");
    ucvm_finalize();
    return(1);
  }

  /* Get model version */
  strcpy(ver, "");
  if (ucvm_model_version(data.crust.source, ver, 
			 UCVM_MAX_VERSION_LEN) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to retrieve 1d model version\n");
    ucvm_finalize();
    return(1);
  }

  if (strlen(ver) == 0) {
    fprintf(stderr, "FAIL: Version string is empty\n");
    ucvm_finalize();
    return(1);
  }

  if (test_assert_string(ver, "Hadley-Kanamori 1D (CVM-S)") != 0) {
    ucvm_finalize();
    return(1);
  }

  /* Finalize UCVM */
  ucvm_finalize();

  printf("PASS\n");
  return(0);
}

int test_lib_add_model_cencal()
{
  printf("Test: UCVM lib add model USGS CenCal\n");

  /* Setup UCVM */
  if (ucvm_init("../conf/ucvm.conf") != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to initialize UCVM API\n");
    return(1);
  }

  /* Add model */
  if (ucvm_add_model(UCVM_MODEL_CENCAL) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to enable model %s\n", 
	    UCVM_MODEL_CENCAL);
    ucvm_finalize();
    return(1);
  }

  /* Finalize UCVM */
  ucvm_finalize();

  printf("PASS\n");
  return(0);
}


int test_lib_add_model_cvmh()
{
  printf("Test: UCVM lib add model SCEC CVM-H\n");

  /* Setup UCVM */
  if (ucvm_init("../conf/ucvm.conf") != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to initialize UCVM API\n");
    return(1);
  }

  /* Add model */
  if (ucvm_add_model(UCVM_MODEL_CVMH) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to enable model %s\n", 
	    UCVM_MODEL_CVMH);
    ucvm_finalize();
    return(1);
  }

  /* Finalize UCVM */
  ucvm_finalize();

  printf("PASS\n");
  return(0);
}


int test_lib_add_model_cvms()
{
  printf("Test: UCVM lib add model SCEC CVM-S\n");

  /* Setup UCVM */
  if (ucvm_init("../conf/ucvm.conf") != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to initialize UCVM API\n");
    return(1);
  }

  /* Add model */
  if (ucvm_add_model(UCVM_MODEL_CVMS) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to enable model %s\n", 
	    UCVM_MODEL_CVMS);
    ucvm_finalize();
    return(1);
  }

  /* Finalize UCVM */
  ucvm_finalize();

  printf("PASS\n");
  return(0);
}


int test_lib_add_model_cvmsi()
{
  printf("Test: UCVM lib add model SCEC CVM-SI\n");

  /* Setup UCVM */
  if (ucvm_init("../conf/ucvm.conf") != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to initialize UCVM API\n");
    return(1);
  }

  /* Add model */
  if (ucvm_add_model(UCVM_MODEL_CVMSI) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to enable model %s\n", 
	    UCVM_MODEL_CVMSI);
    ucvm_finalize();
    return(1);
  }

  /* Finalize UCVM */
  ucvm_finalize();

  printf("PASS\n");
  return(0);
}

int test_lib_add_model_cvms5()
{
  printf("Test: UCVM lib add model CVMS5\n");

  /* Setup UCVM */
  if (ucvm_init("../conf/ucvm.conf") != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to initialize UCVM API\n");
    return(1);
  }

  /* Add model */
  if (ucvm_add_model(UCVM_MODEL_CVMS5) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to enable model %s\n", 
	    UCVM_MODEL_CVMS5);
    ucvm_finalize();
    return(1);
  }

  /* Finalize UCVM */
  ucvm_finalize();

  printf("PASS\n");
  return(0);
}

int test_lib_add_model_cca()
{
  printf("Test: UCVM lib add model CCA\n");

  /* Setup UCVM */
  if (ucvm_init("../conf/ucvm.conf") != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to initialize UCVM API\n");
    return(1);
  }

  /* Add model */
  if (ucvm_add_model(UCVM_MODEL_CCA) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to enable model %s\n", 
	    UCVM_MODEL_CCA);
    ucvm_finalize();
    return(1);
  }

  /* Finalize UCVM */
  ucvm_finalize();

  printf("PASS\n");
  return(0);
}

int test_lib_add_model_cs173()
{
  printf("Test: UCVM lib add model CS173\n");

  /* Setup UCVM */
  if (ucvm_init("../conf/ucvm.conf") != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to initialize UCVM API\n");
    return(1);
  }

  /* Add model */
  if (ucvm_add_model(UCVM_MODEL_CS173) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to enable model %s\n", 
	    UCVM_MODEL_CS173);
    ucvm_finalize();
    return(1);
  }

  /* Finalize UCVM */
  ucvm_finalize();

  printf("PASS\n");
  return(0);
}

int test_lib_add_model_cs173h()
{
  printf("Test: UCVM lib add model CS173H\n");

  /* Setup UCVM */
  if (ucvm_init("../conf/ucvm.conf") != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to initialize UCVM API\n");
    return(1);
  }

  /* Add model */
  if (ucvm_add_model(UCVM_MODEL_CS173H) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "FAIL: Failed to enable model %s\n", 
	    UCVM_MODEL_CS173H);
    ucvm_finalize();
    return(1);
  }

  /* Finalize UCVM */
  ucvm_finalize();

  printf("PASS\n");
  return(0);
}

int suite_lib(const char *xmldir)
{
  int numfixed;
  test_suite_t suite;
  char logfile[256];
  FILE *lf = NULL;

  /* Setup test suite */
  numfixed = 7;
  strcpy(suite.suite_name, "suite_grid");
  suite.num_tests = numfixed;
#ifdef _UCVM_ENABLE_CENCAL
  suite.num_tests++;
#endif
#ifdef _UCVM_ENABLE_CVMH
  suite.num_tests++;
#endif
#ifdef _UCVM_ENABLE_CVMS
  suite.num_tests++;
#endif
#ifdef _UCVM_ENABLE_CVMSI
  suite.num_tests++;
#endif
#ifdef _UCVM_ENABLE_CVMS5
  suite.num_tests++;
#endif
#ifdef _UCVM_ENABLE_CCA
  suite.num_tests++;
#endif
#ifdef _UCVM_ENABLE_CS173
  suite.num_tests++;
#endif
#ifdef _UCVM_ENABLE_CS173H
  suite.num_tests++;
#endif

  suite.tests = malloc(suite.num_tests * sizeof(test_info_t));
  if (suite.tests == NULL) {
    fprintf(stderr, "Failed to alloc test structure\n");
    return(1);
  }
  test_get_time(&suite.exec_time);

  /* Setup test cases */
  suite.num_tests = numfixed;
  strcpy(suite.tests[0].test_name, "test_lib_init");
  suite.tests[0].test_func = &test_lib_init;
  suite.tests[0].elapsed_time = 0.0;

  strcpy(suite.tests[1].test_name, 
  	 "test_lib_add_model_1d");
  suite.tests[1].test_func = &test_lib_add_model_1d;
  suite.tests[1].elapsed_time = 0.0;

  strcpy(suite.tests[2].test_name, 
  	 "test_lib_query_1d");
  suite.tests[2].test_func = &test_lib_query_1d;
  suite.tests[2].elapsed_time = 0.0;

  strcpy(suite.tests[3].test_name, 
  	 "test_lib_get_model_label_1d");
  suite.tests[3].test_func = &test_lib_get_model_label_1d;
  suite.tests[3].elapsed_time = 0.0;

  strcpy(suite.tests[4].test_name, 
  	 "test_lib_setparam_querymode_gd_1d");
  suite.tests[4].test_func = &test_lib_setparam_querymode_gd_1d;
  suite.tests[4].elapsed_time = 0.0;

  strcpy(suite.tests[5].test_name, 
  	 "test_lib_setparam_querymode_ge_1d");
  suite.tests[5].test_func = &test_lib_setparam_querymode_ge_1d;
  suite.tests[5].elapsed_time = 0.0;

  strcpy(suite.tests[6].test_name, 
  	 "test_lib_model_version_1d");
  suite.tests[6].test_func = &test_lib_model_version_1d;
  suite.tests[6].elapsed_time = 0.0;

#ifdef _UCVM_ENABLE_CENCAL
  strcpy(suite.tests[suite.num_tests].test_name, 
  	 "test_lib_add_model_cencal");
  suite.tests[suite.num_tests].test_func = &test_lib_add_model_cencal;
  suite.tests[suite.num_tests].elapsed_time = 0.0;
  suite.num_tests++;
#endif

#ifdef _UCVM_ENABLE_CVMH
  strcpy(suite.tests[suite.num_tests].test_name, 
  	 "test_lib_add_model_cvmh");
  suite.tests[suite.num_tests].test_func = &test_lib_add_model_cvmh;
  suite.tests[suite.num_tests].elapsed_time = 0.0;
  suite.num_tests++;
#endif

#ifdef _UCVM_ENABLE_CVMS
  strcpy(suite.tests[suite.num_tests].test_name, 
  	 "test_lib_add_model_cvms");
  suite.tests[suite.num_tests].test_func = &test_lib_add_model_cvms;
  suite.tests[suite.num_tests].elapsed_time = 0.0;
  suite.num_tests++;
#endif

#ifdef _UCVM_ENABLE_CVMSI
  strcpy(suite.tests[suite.num_tests].test_name, 
  	 "test_lib_add_model_cvmsi");
  suite.tests[suite.num_tests].test_func = &test_lib_add_model_cvmsi;
  suite.tests[suite.num_tests].elapsed_time = 0.0;
  suite.num_tests++;
#endif

#ifdef _UCVM_ENABLE_CVMS5
  strcpy(suite.tests[suite.num_tests].test_name, 
  	 "test_lib_add_model_cvms5");
  suite.tests[suite.num_tests].test_func = &test_lib_add_model_cvms5;
  suite.tests[suite.num_tests].elapsed_time = 0.0;
  suite.num_tests++;
#endif

#ifdef _UCVM_ENABLE_CCA
  strcpy(suite.tests[suite.num_tests].test_name, 
  	 "test_lib_add_model_cca");
  suite.tests[suite.num_tests].test_func = &test_lib_add_model_cca;
  suite.tests[suite.num_tests].elapsed_time = 0.0;
  suite.num_tests++;
#endif

#ifdef _UCVM_ENABLE_CS173
  strcpy(suite.tests[suite.num_tests].test_name, 
  	 "test_lib_add_model_cs173");
  suite.tests[suite.num_tests].test_func = &test_lib_add_model_cs173;
  suite.tests[suite.num_tests].elapsed_time = 0.0;
  suite.num_tests++;
#endif

#ifdef _UCVM_ENABLE_CS173H
  strcpy(suite.tests[suite.num_tests].test_name, 
  	 "test_lib_add_model_cs173h");
  suite.tests[suite.num_tests].test_func = &test_lib_add_model_cs173h;
  suite.tests[suite.num_tests].elapsed_time = 0.0;
  suite.num_tests++;
#endif

  if (test_run_suite(&suite) != 0) {
    fprintf(stderr, "Failed to execute tests\n");
    return(1);
  }

  if (xmldir != NULL) {
    sprintf(logfile, "%s/%s.xml", xmldir, suite.suite_name);
    lf = init_log(logfile);
    if (lf == NULL) {
      fprintf(stderr, "Failed to initialize logfile\n");
      return(1);
    }
    
    if (write_log(lf, &suite) != 0) {
      fprintf(stderr, "Failed to write test log\n");
      return(1);
    }
    
    close_log(lf);
  }

  free(suite.tests);

  return 0;
}
