/**
 * @file ucvm_model_plugin.h
 * @brief Include file for any model which supports the plugin architecture.
 * @author David Gill - SCEC <davidgil@usc.edu>
 * @version 1.0
 *
 * @section DESCRIPTION
 *
 * Header file for the new plugin architecture for all new CVMs. Reduces
 * the necessity to compile the models with UCVM. All models must take
 * input latitudes and longitudes in WGS84 format and return material
 * properties.
 *
 */

#ifndef UCVM_MODEL_PLUGIN_H
#define UCVM_MODEL_PLUGIN_H

// Includes
#include "ucvm_dtypes.h"

// Defines
#define MODEL_POINT_BUFFER	1000

// Structures
typedef struct basic_point_t {
	double longitude;
	double latitude;
	double depth;
} basic_point_t;

typedef struct basic_properties_t {
	double vp;
	double vs;
	double rho;
	double qp;
	double qs;
} basic_properties_t;

typedef struct ucvm_plugin_model_t {
/** Used to store the model ID. */
int ucvm_plugin_model_id;
/** Store the configuration data. */
ucvm_modelconf_t ucvm_plugin_model_conf;
int (*model_init)(const char *dir, const char *label);
int (*model_query)(basic_point_t *points, basic_properties_t *data, int numpoints);
int (*model_finalize)();
int (*model_version)(char *ver, int len);
int (*model_config)(char **conf, int *sz);
int (*model_setparam)(int id, int param, ...);
} ucvm_plugin_model_t;

ucvm_plugin_model_t *get_plugin_by_label(char *);
ucvm_plugin_model_t *get_plugin_by_id(int);
ucvm_plugin_model_t *get_plugin_by_order(int);

typedef int (*MIPTR())(const char *, const char *);
typedef int (*MQPTR())(basic_point_t *, basic_properties_t *, int);
typedef int (*MFPTR())();
typedef int (*MVPTR())(char *, int);
typedef int (*MCPTR())(char **, int*);
typedef int (*MSPTR())(int, int, ...);

// UCVM API Required Functions
int ucvm_plugin_model_init(int id, ucvm_modelconf_t *conf);	/** Initializes the model. */
int ucvm_plugin_model_finalize();				/** Cleans up memory, closes model. */
int ucvm_plugin_model_version(int id, char *ver, int len);	/** Retrieves the version of model that we are using. */
int ucvm_plugin_model_config(int id, char **config, int *sz);	        /** Retrieves the config of model that we are using. */
int ucvm_plugin_model_label(int id, char *lab, int len);	/** Retrieves the label for model. */
int ucvm_plugin_model_setparam(int id, int param, ...);		/** Sets optional parameters. */
int ucvm_plugin_model_query(int id, ucvm_ctype_t cmode,		/** Actually queries the model. */
			  int n, ucvm_point_t *pnt,
			  ucvm_data_t *data);
int ucvm_plugin_get_model(const char *dir, const char *label,
			  ucvm_model_t *m);			/** Fills the UCVM model structure. */

#endif
