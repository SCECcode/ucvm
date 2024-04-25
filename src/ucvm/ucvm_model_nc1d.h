#ifndef UCVM_MODEL_NC1D_H
#define UCVM_MODEL_NC1D_H

#include <stdarg.h>
#include "ucvm_dtypes.h"


/* Init NC 1D */
int ucvm_nc1d_model_init(int id, ucvm_modelconf_t *conf);


/* Finalize NC 1D */
int ucvm_nc1d_model_finalize();


/* Version NC 1D */
int ucvm_nc1d_model_version(int id, char *ver, int len);


/* Label NC 1D */
int ucvm_nc1d_model_label(int id, char *lab, int len);


/* Setparam NC 1D */
int ucvm_nc1d_model_setparam(int id, int param, ...);


/* Query NC 1D */
int ucvm_nc1d_model_query(int id, ucvm_ctype_t cmode,
			int n, ucvm_point_t *pnt, ucvm_data_t *data);


/* Fill model structure with NC 1D */
int ucvm_nc1d_get_model(ucvm_model_t *m);

typedef enum { nc1d_NONE = 0, nc1d_LINEAR = 1 } ucvm_nc1d_interpolation_t;

#endif
