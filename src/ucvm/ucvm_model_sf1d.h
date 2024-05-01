#ifndef UCVM_MODEL_SF1D_H
#define UCVM_MODEL_SF1D_H

#include <stdarg.h>
#include "ucvm_dtypes.h"


/* Init SF 1D */
int ucvm_sf1d_model_init(int id, ucvm_modelconf_t *conf);


/* Finalize SF 1D */
int ucvm_sf1d_model_finalize();


/* Version SF 1D */
int ucvm_sf1d_model_version(int id, char *ver, int len);


/* Label SF 1D */
int ucvm_sf1d_model_label(int id, char *lab, int len);


/* Setparam SF 1D */
int ucvm_sf1d_model_setparam(int id, int param, ...);


/* Query SF 1D */
int ucvm_sf1d_model_query(int id, ucvm_ctype_t cmode,
			int n, ucvm_point_t *pnt, ucvm_data_t *data);


/* Fill model structure with SF 1D */
int ucvm_sf1d_get_model(ucvm_model_t *m);

typedef enum { sf1d_NONE = 0, sf1d_LINEAR = 1 } ucvm_sf1d_interpolation_t;

#endif
