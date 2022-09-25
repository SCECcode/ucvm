/**
 ** ucvm_crossing.c - Query UCVM for basin depths with threshold
 **
 ** based on basin_query.c
 **
 **/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ucvm.h"
#include "ucvm_utils.h"
#include "ucvm_crossing.h"

/* GTL crossing values */
double *ucvm_crossings = NULL;

// skipping looking at crossing.
int _skip_crossing = 0; 

// has -Z option
double _zthreshold = -1;
ucvm_ctype_t _cmode = UCVM_COORD_GEO_DEPTH;

void ucvm_setup_zthreshold(double val, ucvm_ctype_t val2) {
  _zthreshold = val;
  _cmode = val2;
}

int ucvm_has_zthreshold() {
  if(_zthreshold != -1) {
     return 1;
  }
  return 0;
}
double ucvm_zthreshold() {
  return _zthreshold;
}

void ucvm_enable_zthreshold(int val) {
    _zthreshold = val;
}

void ucvm_enable_skip_crossing() {
    _skip_crossing = 0;
}
void ucvm_disable_skip_crossing() {
    _skip_crossing = 1;
}

int ucvm_skip_crossing() {
    return _skip_crossing;
}

void ucvm_free_crossings() {
    free(ucvm_crossings);
    ucvm_crossings = NULL;
}

void ucvm_clear_crossings(double num) {
    int i;
    for(i=0; i< num; i++) {
      ucvm_crossings[i] = DEFAULT_NULL_DEPTH;
    }
}

void ucvm_setup_crossings(double num, ucvm_point_t *pnts, double zthreshold) {
    int i;

    if(ucvm_crossings != NULL) {
       ucvm_free_crossings();
    } 
    ucvm_crossings = malloc(num * sizeof(double));
    ucvm_clear_crossings(num);

    // fill in th crossing needed
    for(i=0; i < num; i++) {
       ucvm_disable_skip_crossing();
       ucvm_crossings[i] = ucvm_first_crossing(&(pnts[i]), _cmode, zthreshold);
//printf("###   %lf,%lf,%lf,%lf\n", pnts[i].coord[0], pnts[i].coord[1], pnts[i].coord[2],ucvm_crossings[i]);
       ucvm_enable_skip_crossing();

/* for big set of data, the comparison might take too much time 
       int z;
       for(z=0; z < i; z++ ) { 
         if(pnts[z].coord[0] == pnts[i].coord[0] &&
                 (pnts[z].coord[1] == pnts[i].coord[1]) && ucvm_crossings[z] != DEFAULT_NULL_DEPTH) {
           ucvm_crossings[i]=ucvm_crossings[z];
printf("###   %lf,%lf,%lf,%lf\n", pnts[i].coord[0], pnts[i].coord[1], pnts[i].coord[2],ucvm_crossings[i]);
           break;
         }
       }
       if (z == i) { // did not find one, using locally defined _cmode
         ucvm_disable_skip_crossing();
         ucvm_crossings[i] = ucvm_first_crossing(&(pnts[i]), _cmode, zthreshold);
printf("###   %lf,%lf,%lf,%lf\n", pnts[i].coord[0], pnts[i].coord[1], pnts[i].coord[2],ucvm_crossings[i]);
         ucvm_enable_skip_crossing();
       }
*/
    }
}

/**************************************************************************/

/* Extract basin values for the specified points */
double ucvm_extract_basins(int n, ucvm_point_t *pnts,
		   ucvm_point_t *qpnts, ucvm_data_t *qprops,
		   double max_depth, double z_inter, double vs_thresh,
                   ucvm_ctype_t cmode)
{
  int i, p, dnum, numz;
  double vs_prev;
  double depths[3];
  depths[0] = DEFAULT_NULL_DEPTH;
  depths[1] = DEFAULT_NULL_DEPTH;
  depths[2] = DEFAULT_NULL_DEPTH;
  
  numz = (int)(max_depth / z_inter);
  for (p = 0; p < n; p++) {
    /* Setup query points */
    for (i = 0; i < numz; i++) {
      qpnts[i].coord[0] = pnts[p].coord[0];
      qpnts[i].coord[1] = pnts[p].coord[1];
      // this is for 'depth'
      if(cmode == UCVM_COORD_GEO_DEPTH) {
              qpnts[i].coord[2] = (double)i * z_inter;
          } else {
//??? would thought that this should be elevation - 'depth' but ucvm.c seems
// to show the surf - depth and surf is initialize to 0
              qpnts[i].coord[2] = 0 - ((double)(i) * z_inter);
      }
    }
    /* Query the UCVM */
    if (ucvm_query(numz, qpnts, qprops) != UCVM_CODE_SUCCESS) {
      fprintf(stderr, "Query CVM failed\n");
      return(1);
    }
  
    /* Check for threshold crossing */
    vs_prev = DEFAULT_ZERO_DEPTH;
    dnum = 0;
    depths[0] = DEFAULT_NULL_DEPTH;
    depths[1] = DEFAULT_NULL_DEPTH;
    depths[2] = DEFAULT_NULL_DEPTH;
    for (i = 0; i < numz; i++) {
      /* Compare the Vs if it is valid */
      if (qprops[i].cmb.vs > DEFAULT_ZERO_DEPTH) {
	  if ((vs_prev < vs_thresh) && (qprops[i].cmb.vs >= vs_thresh)) {
	    depths[dnum] = (double)i * z_inter;
	    if (dnum == 0) {
	      depths[2] = depths[1] = depths[0];
	      dnum++;
	      } else {
                if(dnum == 1) {
                   depths[2] = depths[1];
                   dnum++;
                }
            }
      
	  }

	  /* Save current vs value */
          vs_prev = qprops[i].cmb.vs;
      }
    }

  /* Display output */
//    printf("# from extract basin %10.4lf %10.4lf %10.3lf %10.3lf %10.3lf\n" , pnts[p].coord[0], pnts[p].coord[1], depths[0], depths[1], depths[2]);

    }
  
    if (depths[0] == DEFAULT_NULL_DEPTH) {
      return (-1);
    }
    return depths[0];
}


double ucvm_first_crossing(ucvm_point_t *pnts, ucvm_ctype_t cmode, double vs_thresh) {

// variable, all locally defined
  ucvm_point_t *lqpnts;
  ucvm_data_t *lqprops;

  double max_depth = DEFAULT_MAX_DEPTH;
  double z_inter = DEFAULT_Z_INTERVAL;
  int num=(int)(max_depth/z_inter+1);

  /* Allocate buffers */
  lqpnts = malloc( num*sizeof(ucvm_point_t));
  lqprops = malloc( num*sizeof(ucvm_data_t));

  double crossing=ucvm_extract_basins(1, pnts, lqpnts, lqprops, 
			   max_depth, z_inter, vs_thresh, cmode);

  free(lqpnts);
  free(lqprops);

  if( crossing == DEFAULT_NULL_DEPTH ) {
      fprintf(stderr, "Crossing retrieval failed\n");
      return(0);
  }
  return crossing;
}
