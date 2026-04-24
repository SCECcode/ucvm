/**
   ucm_model_muscal1d.c

   MUSCAL 1D Velocity Model with canvas as starting base

   with top 350m with tapering based on vs30
**/


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "ucvm_model_muscal1d.h"
#include "ucvm_utils.h"
#include "ucvm_config.h"

/* Init flag */
int ucvm_muscal1d_init_flag = 0;

/* Model dimensions */
#define UCVM_MUSCAL1D_MAX_Z_DIM 64
int ucvm_muscal1d_z_dim = 0;
char ucvm_muscal1d_version_id[UCVM_MAX_VERSION_LEN];
double ucvm_muscal1d_layer_depths[UCVM_MUSCAL1D_MAX_Z_DIM];
double ucvm_muscal1d_layer_vp[UCVM_MUSCAL1D_MAX_Z_DIM];
double ucvm_muscal1d_layer_vs[UCVM_MUSCAL1D_MAX_Z_DIM];
double ucvm_muscal1d_layer_rho[UCVM_MUSCAL1D_MAX_Z_DIM];

/* Model ID */
int ucvm_muscal1d_id = UCVM_SOURCE_NONE;

/* Model conf */
ucvm_modelconf_t ucvm_muscal1d_conf;

/* Model config */
ucvm_config_t *ucvm_muscal1d_cfg = NULL;


ucvm_muscal1d_interpolation_t ucvm_muscal1d_interptype;

double ucvm_muscal1d_vp(double depth) {
	int i;
	double vp;
	double depth_ratio;
	double vp_range;
	double cumulativeDepth;

	vp = 0.0;
	cumulativeDepth = 0.0;

	// Convert from m to km
	depth = depth / 1000.0;

	// Find out which layer we're in.
	for (i = 0; i < ucvm_muscal1d_z_dim; i++) {
		if (cumulativeDepth + ucvm_muscal1d_layer_depths[i] > depth) {
			if (ucvm_muscal1d_interptype == muscal1d_NONE || i == 0) {
				vp = ucvm_muscal1d_layer_vp[i];
			} else {
		        depth_ratio = (depth - cumulativeDepth) / ucvm_muscal1d_layer_depths[i];
		        vp_range = ucvm_muscal1d_layer_vp[i] - ucvm_muscal1d_layer_vp[i - 1];
		        vp = ((vp_range * depth_ratio) + ucvm_muscal1d_layer_vp[i - 1]);
			}
			break;
		} else {
			cumulativeDepth += ucvm_muscal1d_layer_depths[i];
		}
	}

	if (i == ucvm_muscal1d_z_dim - 1) {
		vp = ucvm_muscal1d_layer_vp[ucvm_muscal1d_z_dim - 1];
	}

	vp = vp * 1000.0;

	return vp;
}

double ucvm_muscal1d_vs(double depth) {
	int i;
	double vs;
	double depth_ratio;
	double vs_range;
	double cumulativeDepth;

	vs = 0.0;
	cumulativeDepth = 0.0;

	// Convert from m to km
	depth = depth / 1000.0;

	// Find out which layer we're in.
	for (i = 0; i < ucvm_muscal1d_z_dim; i++) {
		if (cumulativeDepth + ucvm_muscal1d_layer_depths[i] > depth) {
			if (ucvm_muscal1d_interptype == muscal1d_NONE || i == 0) {
				vs = ucvm_muscal1d_layer_vs[i];
			} else {
		        depth_ratio = (depth - cumulativeDepth) / ucvm_muscal1d_layer_depths[i];
		        vs_range = ucvm_muscal1d_layer_vs[i] - ucvm_muscal1d_layer_vs[i - 1];
		        vs = ((vs_range * depth_ratio) + ucvm_muscal1d_layer_vs[i - 1]);
			}
			break;
		} else {
			cumulativeDepth += ucvm_muscal1d_layer_depths[i];
		}
	}

	if (i == ucvm_muscal1d_z_dim - 1) {
		vs = ucvm_muscal1d_layer_vs[ucvm_muscal1d_z_dim - 1];
	}

	vs = vs * 1000.0;

	return vs;
}

double ucvm_muscal1d_rho(double depth) {
	int i;
	double rho;
	double depth_ratio;
	double rho_range;
	double cumulativeDepth;

	rho = 0.0;
	cumulativeDepth = 0.0;

	// Convert from m to km
	depth = depth / 1000.0;

	// Find out which layer we're in.
	for (i = 0; i < ucvm_muscal1d_z_dim; i++) {
		if (cumulativeDepth + ucvm_muscal1d_layer_depths[i] > depth) {
			if (ucvm_muscal1d_interptype == muscal1d_NONE || i == 0) {
				rho = ucvm_muscal1d_layer_rho[i];
			} else {
		        depth_ratio = (depth - cumulativeDepth) / ucvm_muscal1d_layer_depths[i];
		        rho_range = ucvm_muscal1d_layer_rho[i] - ucvm_muscal1d_layer_rho[i - 1];
		        rho = ((rho_range * depth_ratio) + ucvm_muscal1d_layer_rho[i - 1]);
			}
			break;
		} else {
			cumulativeDepth += ucvm_muscal1d_layer_depths[i];
		}
	}

	if (i == ucvm_muscal1d_z_dim - 1) {
		rho = ucvm_muscal1d_layer_rho[ucvm_muscal1d_z_dim - 1];
	}

	rho = rho * 1000.0;

	return rho;
}

/* Init MUSCAL1D */
int ucvm_muscal1d_model_init(int m, ucvm_modelconf_t *conf)
{
  int len;
  ucvm_config_t *chead;
  ucvm_config_t *cptr;
  FILE *fp;
  char line[256];
  char *remainingChars;
  int readingModel = 0;
  int counter = 0;

  if (ucvm_muscal1d_init_flag) {
    fprintf(stderr, "Model %s is already initialized\n", conf->label);
    return(UCVM_CODE_ERROR);
  }

  if ((conf == NULL) || (conf->config[0] == '\0')) {
    fprintf(stderr, "No config path defined for model %s\n", conf->label);
    return(UCVM_CODE_ERROR);
  }

  if (!ucvm_is_file(conf->config)) {
    fprintf(stderr, "MUSCAL1D conf file %s is not a valid file\n", conf->config);
    return(UCVM_CODE_ERROR);
  }

  /* Save model conf */
  memcpy(&ucvm_muscal1d_conf, conf, sizeof(ucvm_modelconf_t));

  /* Read conf file */
  chead = ucvm_parse_config(conf->config);
  if (chead == NULL) {
    fprintf(stderr, "Failed to parse config file %s\n", conf->config);
    return(UCVM_CODE_ERROR);
  }

  cptr = ucvm_find_name(chead, "version");
  if (cptr == NULL) {
    fprintf(stderr, "Failed to find version in config\n");
    return(UCVM_CODE_ERROR);
  }
  len = strlen(cptr->value);
  if(len <= UCVM_MAX_VERSION_LEN) {
    len=UCVM_MAX_VERSION_LEN-1;
  }
  snprintf(ucvm_muscal1d_version_id, len, "%s", cptr->value);

  cptr = ucvm_find_name(chead, "num_z");
  if (cptr == NULL) {
    fprintf(stderr, "Failed to find num_z key\n");
    return(1);
  }
  ucvm_muscal1d_z_dim = atoi(cptr->value);
  if ((ucvm_muscal1d_z_dim <= 0) || (ucvm_muscal1d_z_dim > UCVM_MUSCAL1D_MAX_Z_DIM)) {
    fprintf(stderr, "Invalid MUSCAL1D Z dimension size\n");
    return(UCVM_CODE_ERROR);
  }

  cptr = ucvm_find_name(chead, "interpolation");
  if (cptr == NULL) {
    fprintf(stderr, "Failed to find interpolation key\n");
    return(1);
  }

  if (strcmp(cptr->value, "none") == 0) {
	  ucvm_muscal1d_interptype = muscal1d_NONE;
  } else if (strcmp(cptr->value, "linear") == 0) {
	  ucvm_muscal1d_interptype = muscal1d_LINEAR;
  } else {
	  fprintf(stderr, "Invalid interpolation method defined\n");
	  return 1;
  }

  // Now read in the model itself.
  fp = fopen(conf->config, "r");
  if (fp == NULL) {
	  fprintf(stderr, "Error re-opening configuration file.\n");
	  return 1;
  }

  while(fgets(line, 256, fp) != NULL) {
	  if (strcmp(line, "--MODEL--\n") == 0) {
		  readingModel = 1;
	  }

	  if (strcmp(line, "\n") != 0 && readingModel == 1) {
		  if (counter < ucvm_muscal1d_z_dim) {
			  ucvm_muscal1d_layer_depths[counter] = strtod(line, &remainingChars);
			  if (ucvm_muscal1d_layer_depths[counter] == 0) continue;
			  ucvm_muscal1d_layer_vp[counter] = strtod(remainingChars, &remainingChars);
			  ucvm_muscal1d_layer_vs[counter] = strtod(remainingChars, &remainingChars);
			  ucvm_muscal1d_layer_rho[counter] = strtod(remainingChars, &remainingChars);
			  counter++;
		  }
	  }
  }

  fclose(fp);

  ucvm_muscal1d_id = m;
  ucvm_muscal1d_init_flag = 1;
  ucvm_muscal1d_cfg = chead;

  return(UCVM_CODE_SUCCESS);
}


/* Finalize MUSCAL1D */
int ucvm_muscal1d_model_finalize()
{
  ucvm_muscal1d_z_dim = 0;
  ucvm_muscal1d_init_flag = 0;

  /* Free config file parser resources */
  if (ucvm_muscal1d_cfg != NULL) {
    ucvm_free_config(ucvm_muscal1d_cfg);
    ucvm_muscal1d_cfg = NULL;
  }
  return(UCVM_CODE_SUCCESS);
}


/* Version MUSCAL1D */
int ucvm_muscal1d_model_version(int id, char *ver, int len)
{
  if (id != ucvm_muscal1d_id) {
    fprintf(stderr, "Invalid model id\n");
    return(UCVM_CODE_ERROR);
  }

  ucvm_strcpy(ver, ucvm_muscal1d_version_id, len);
  return(UCVM_CODE_SUCCESS);
}


/* Label MUSCAL1D */
int ucvm_muscal1d_model_label(int id, char *lab, int len)
{
  if (id != ucvm_muscal1d_id) {
    fprintf(stderr, "Invalid model id\n");
    return(UCVM_CODE_ERROR);
  }

  ucvm_strcpy(lab, ucvm_muscal1d_conf.label, len);
  return(UCVM_CODE_SUCCESS);
}


/* Setparam MUSCAL1D */
int ucvm_muscal1d_model_setparam(int id, int param, ...)
{
  va_list ap;

  if (id != ucvm_muscal1d_id) {
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


/* Query MUSCAL1D */
int ucvm_muscal1d_model_query(int id, ucvm_ctype_t cmode,
			int n, ucvm_point_t *pnt, ucvm_data_t *data)
{
  int i;
  double depth;
  int datagap = 0;

  if (id != ucvm_muscal1d_id) {
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
    if ((data[i].crust.source == UCVM_SOURCE_NONE) && 
	((data[i].domain == UCVM_DOMAIN_INTERP) || 
	 (data[i].domain == UCVM_DOMAIN_CRUST))) {

      /* Modify pre-computed depth to account for GTL interp range */
      depth = data[i].depth + data[i].shift_cr;

      /* MUSCAL1D extends from free surface on down */
      if (depth >= 0.0) {
    	  data[i].crust.vp = ucvm_muscal1d_vp(depth);
    	  data[i].crust.rho = ucvm_muscal1d_rho(depth);
    	  data[i].crust.vs = ucvm_muscal1d_vs(depth);
    	  data[i].crust.source = ucvm_muscal1d_id;
      } else {
	datagap = 1;
      }
    } else {
      if (data[i].crust.source == UCVM_SOURCE_NONE) {
        datagap = 1;
      }
    }
  }

  if (datagap) {
    return(UCVM_CODE_DATAGAP);
  }

  return(UCVM_CODE_SUCCESS);
}


/* Fill model structure with MUSCAL1D */
int ucvm_muscal1d_get_model(ucvm_model_t *m)
{
  m->mtype = UCVM_MODEL_CRUSTAL;
  m->init = ucvm_muscal1d_model_init;
  m->finalize = ucvm_muscal1d_model_finalize;
  m->setparam = ucvm_muscal1d_model_setparam;
  m->getversion = ucvm_muscal1d_model_version;
  m->getconfig = NULL;
  m->getlabel = ucvm_muscal1d_model_label;
  m->query = ucvm_muscal1d_model_query;

  return(UCVM_CODE_SUCCESS);
}

