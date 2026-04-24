#ifndef UCVM_MODEL_MUSCAL1D_H
#define UCVM_MODEL_MUSCAL1D_H

#include <stdarg.h>
#include "ucvm_dtypes.h"


/* Init MUSCAL 1D */
int ucvm_muscal1d_model_init(int id, ucvm_modelconf_t *conf);


/* Finalize MUSCAL 1D */
int ucvm_muscal1d_model_finalize();


/* Version MUSCAL 1D */
int ucvm_muscal1d_model_version(int id, char *ver, int len);


/* Label MUSCAL 1D */
int ucvm_muscal1d_model_label(int id, char *lab, int len);


/* Setparam MUSCAL 1D */
int ucvm_muscal1d_model_setparam(int id, int param, ...);


/* Query MUSCAL 1D */
int ucvm_muscal1d_model_query(int id, ucvm_ctype_t cmode,
			int n, ucvm_point_t *pnt, ucvm_data_t *data);


/* Fill model structure with MUSCAL 1D */
int ucvm_muscal1d_get_model(ucvm_model_t *m);

typedef enum { muscal1d_NONE = 0, muscal1d_LINEAR = 1 } ucvm_muscal1d_interpolation_t;

#endif
