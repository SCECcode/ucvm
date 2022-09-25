#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "ucvm_utils.h"
#include "ucvm_model_svm.h"

/* Init flag */
int ucvm_svm_init_flag = 0;

/* Version string */
const char *ucvm_svm_version_id = "Asimaki, D., Shi, J., & Taborda, R. (2017, 08).";

/* Model ID */
int ucvm_svm_id = UCVM_SOURCE_NONE;

/* Model conf */
ucvm_modelconf_t ucvm_svm_conf;


/* Init SVM */
int ucvm_svm_model_init(int m, ucvm_modelconf_t *conf)
{
  if (ucvm_svm_init_flag) {
    fprintf(stderr, "Model %s is already initialized\n", conf->label);
    return(UCVM_CODE_ERROR);
  }

  ucvm_svm_id = m;

  /* Save model conf */
  memcpy(&ucvm_svm_conf, conf, sizeof(ucvm_modelconf_t));

  ucvm_svm_init_flag = 1;
  return(UCVM_CODE_SUCCESS);
}


/* Finalize SVM */
int ucvm_svm_model_finalize()
{
  ucvm_svm_init_flag = 0;
  return(UCVM_CODE_SUCCESS);
}


/* Version SVM */
int ucvm_svm_model_version(int id, char *ver, int len)
{
  if (id != ucvm_svm_id) {
    fprintf(stderr, "Invalid model id\n");
    return(UCVM_CODE_ERROR);
  }

  ucvm_strcpy(ver, ucvm_svm_version_id, len);
  return(UCVM_CODE_SUCCESS);
}


/* Label SVM */
int ucvm_svm_model_label(int id, char *lab, int len)
{
  if (id != ucvm_svm_id) {
    fprintf(stderr, "Invalid model id\n");
    return(UCVM_CODE_ERROR);
  }

  ucvm_strcpy(lab, ucvm_svm_conf.label, len);
  return(UCVM_CODE_SUCCESS);
}


/* Setparam SVM */
int ucvm_svm_model_setparam(int id, int param, ...)
{
  va_list ap;

  if (id != ucvm_svm_id) {
    fprintf(stderr, "Invalid model id\n");
    return(UCVM_CODE_ERROR);
  }

  va_start(ap, param);
  switch (param) {
  default:
    break;
  }

  va_end(ap);

  return(UCVM_CODE_SUCCESS);
}


int ucvm_svm_get_vals(double vs30, ucvm_prop_t *prop)
{
  if (vs30 <= 0.0) {
    return(UCVM_CODE_ERROR);
  }

  prop->source = ucvm_svm_id;
  prop->vs = vs30;
  prop->vp = 0.0;
  prop->rho = 0.0;

  return(UCVM_CODE_SUCCESS);
}


/* Query SVM */
int ucvm_svm_model_query(int id, ucvm_ctype_t cmode,
			 int n, ucvm_point_t *pnt, 
			 ucvm_data_t *data)
{
  int i;
  double depth;
  int datagap = 0;

  if (id != ucvm_svm_id) {
    fprintf(stderr, "Invalid model id\n");
    return(UCVM_CODE_ERROR);
  }

  /* Check query mode */
  switch (cmode) {
  case UCVM_COORD_GEO_DEPTH:
  case UCVM_COORD_GEO_ELEV:
    break;
  default:
    fprintf(stderr, "Unsupported coord type\n");
    return(UCVM_CODE_ERROR);
    break;
  }

  for (i = 0; i < n; i++) {
    if ((data[i].gtl.source == UCVM_SOURCE_NONE) && 
	((data[i].domain == UCVM_DOMAIN_INTERP) || 
	 (data[i].domain == UCVM_DOMAIN_GTL))) {

      /* Modify pre-computed depth to account for GTL interp range */
      depth = data[i].depth + data[i].shift_gtl;

      if (depth >= 0.0) {
	/* GTL is 2D, so precise depth is irrelevant */
	if (ucvm_svm_get_vals(data[i].vs30, 
			      &(data[i].gtl)) != UCVM_CODE_SUCCESS) {
	  datagap = 1;
	}
      } else {
	datagap = 1;
      }
    } else {
      if (data[i].gtl.source == UCVM_SOURCE_NONE) {
	datagap = 1;
      }
    }
  }

  if (datagap) {
    return(UCVM_CODE_DATAGAP);
  }

  return(UCVM_CODE_SUCCESS);
}


/* Fill model structure with svm */
int ucvm_svm_get_model(ucvm_model_t *m)
{
  m->mtype = UCVM_MODEL_GTL;
  m->init = ucvm_svm_model_init;
  m->finalize = ucvm_svm_model_finalize;
  m->setparam = ucvm_svm_model_setparam;
  m->getversion = ucvm_svm_model_version;
  m->getlabel = ucvm_svm_model_label;
  m->query = ucvm_svm_model_query;

  return(UCVM_CODE_SUCCESS);
}

