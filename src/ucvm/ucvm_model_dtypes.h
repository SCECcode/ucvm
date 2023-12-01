#ifndef UCVM_MODEL_DTYPES_H
#define UCVM_MODEL_DTYPES_H

// ucvm model specific dtypes.h

// from ucvm's src/ucvm/ucvm_dtypes.h
/* Supported error codes  */
typedef enum { UCVM_MODEL_CODE_SUCCESS = 0,
               UCVM_MODEL_CODE_ERROR = 1,
               UCVM_MODEL_CODE_NODATA = 2 } ucvm_model_code_t;

/* Supported UCVM parameters visible to user. Argument list:
UCVM_PARAM_QUERY_MODE    : ucvm_ctype_t qmode
UCVM_PARAM_IFUNC_ZRANGE  : double min, double max (meters)
UCVM_PARAM_MODEL_CONF    : char *mlabel, char *param, char *value
  CVM-H:
    "USE_1D_BKG": "True"/"False"
indexing takes in account for ucvm_model_mparam_t
*/

typedef enum { UCVM_MODEL_PARAM_QUERY_MODE = 1,
               UCVM_MODEL_PARAM_IFUNC_ZRANGE = 2,
               UCVM_MODEL_PARAM_MODEL_CONF = 3,
               UCVM_MODEL_PARAM_FORCE_DEPTH_ABOVE_SURF = 4,
               UCVM_MODEL_PARAM_PLUGIN_MODE = 5 } ucvm_model_param_t;

/* Supported model parameters. Used internally by UCVM
UCVM_MODEL_PARAM_FORCE_DEPTH_ABOVE_SURF : Force elevation points to be
  treated as offset relative to regional model surface when it is
  above the ucvm dem surface. Removes discontinuities between model
  surface and GTL.
UCVM_MODEL_PARAM_PLUGIN_MODE : Tell the backend model that it is being
  invoked as plugin module and is always expected to be 'query by depth'

*/

/* Supported coordinate query modes */
typedef enum { UCVM_MODEL_COORD_GEO_DEPTH = 0,
               UCVM_MODEL_COORD_GEO_ELEV = 1 } ucvm_model_ctype_t;

#endif


