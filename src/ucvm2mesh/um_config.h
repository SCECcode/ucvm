#ifndef UM_CONFIG_H
#define UM_CONFIG_H

/* Read in configuration file and populate config structure */
int read_config(int myid, int nproc, const char *cfgfile, mesh_config_t *cfg, int old_style);

int get_nrank(mesh_config_t *cfg);
int get_nrank_layer(mesh_config_t *cfg);
int get_nlayer(mesh_config_t *cfg);

/* Dump config to stdout */
int disp_config(mesh_config_t *cfg);

int broadcast_config_lists(int myid, int nproc, mesh_config_t *cfg);

#endif

