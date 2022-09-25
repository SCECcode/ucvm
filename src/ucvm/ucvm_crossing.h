
/* Constants */

#define DEFAULT_Z_INTERVAL 20.0
#define DEFAULT_VS_THRESH 1000.0
#define DEFAULT_NULL_DEPTH -1.0
#define DEFAULT_ZERO_DEPTH 0.0
#define DEFAULT_MAX_DEPTH 5000.0

extern double *ucvm_crossings;

/* manage ucvm_zthreshold */
void ucvm_setup_zthreshold(double val, ucvm_ctype_t cmode);
int ucvm_has_zthreshold();
double ucvm_zthreshold();

/* tracking _skip_crossing */
void ucvm_enable_crossing();
void ucvm_disable_crossing();
int ucvm_skip_crossing();

/* manage ucvm_crossings */
void ucvm_clear_crossings(double num);
void ucvm_free_crossings();
void ucvm_setup_crossings(double num, ucvm_point_t *pnts, double vs_thresh);

/* extract first crossing */
double ucvm_first_crossing(ucvm_point_t *pnts, ucvm_ctype_t cmode, double vs_thresh);

