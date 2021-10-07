/**
 * @file ucvm_map.h
 * @brief Include file for any map which supports the ucvm_map interface
 * @version 1.0
 *
 * @section DESCRIPTION
 *
 * Header file for the ui for all new MAPs.
 *
 */

#ifndef UCVM_MAP_H
#define UCVM_MAP_H

// Includes
#include "ucvm_dtypes.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "etree.h"
#include "ucvm_utils.h"
#include "ucvm_meta_etree.h"
#include "ucvm_proj_ucvm.h"

/* Etree buffer size in MB */
#define UCVM_MAP_BUF_SIZE 64

typedef struct ucvm_map_t {
/* Map information */
   int map_is_initialized;
   char map_label_str[UCVM_MAX_LABEL_LEN];
   etree_t *map_ep;
   ucvm_meta_map_t map_meta;
   ucvm_proj_t map_proj;
   int map_level;
   double map_max_len;
   etree_tick_t map_edgetics;
   double map_edgesize;
} ucvm_map_t;

ucvm_map_t *get_map_by_label(const char *);
int ucvm_map_init(const char *label, const char *conf);
int ucvm_map_finalize();
int ucvm_map_version(char *ver, int len);
int ucvm_map_label(char *label, int len);
int ucvm_map_query(ucvm_ctype_t cmode, int n, ucvm_point_t *pnt, ucvm_data_t *data);


#endif
