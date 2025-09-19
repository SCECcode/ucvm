// latlon2ucvm.c
// convert latlon to utm
//         or
//         utm to latlon

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <math.h>

#include "proj.h"

/** Proj coordinate transformation objects. can go from geo <-> utm */
PJ *_geo2utm = NULL;

/*** transform to UTM zone 32, then back to geographical 
         https://proj.org/en/9.3/development/quickstart.html
14    P = proj_create_crs_to_crs(
15        C, "EPSG:4326", "+proj=utm +zone=32 +datum=WGS84", 
16        NULL);

41    b = proj_trans(P, PJ_FWD, a);
42    printf("easting: %.3f, northing: %.3f\n", b.enu.e, b.enu.n);
43
44    b = proj_trans(P, PJ_INV, b);
45    printf("longitude: %g, latitude: %g\n", b.lp.lam, b.lp.phi);

and
    PJ_COORD c_in;
33    c_in.lpzt.z = 0.0;
34    c_in.lpzt.t = HUGE_VAL; // important only for time-dependent projections
35    c_in.lp.lam = lon;
36    c_in.lp.phi = lat;
37

and

typedef union {
    double v[4];
    PJ_XYZT xyzt;
    PJ_UVWT uvwt;
    PJ_LPZT lpzt;
    PJ_GEOD geod;
    PJ_OPK opk;
    PJ_ENU enu;
    PJ_XYZ  xyz;
    PJ_UVW  uvw;
    PJ_LPZ  lpz;
    PJ_XY   xy;
    PJ_UV   uv;
    PJ_LP   lp;
} PJ_COORD ;

examples:
https://proj.org/en/5.0/development/migration.html

*/

static int to_utm(double lon, double lat, double *point_u, double *point_v) {
    PJ_COORD xyzSrc = proj_coord(lat, lon, 0.0, HUGE_VAL);
    PJ_COORD xyzDest = proj_trans(_geo2utm, PJ_FWD, xyzSrc);
    int err = proj_context_errno(PJ_DEFAULT_CTX);
    if (err) {
       fprintf(stderr, "Error occurred while transforming latitude=%.4f, longitude=%.4f to UTM.\n",
              lat, lon);
        fprintf(stderr, "Proj error: %s\n", proj_context_errno_string(PJ_DEFAULT_CTX, err));
        return 1;
    }
    *point_u = xyzDest.xyzt.x;
    *point_v = xyzDest.xyzt.y;
    return err;
}

static int to_geo(double point_u, double point_v, double *lon, double *lat) {
    PJ_COORD xyzSrc;
    xyzSrc.xyzt.x=point_u;
    xyzSrc.xyzt.y=point_v;
    PJ_COORD xyzDest = proj_trans(_geo2utm, PJ_INV, xyzSrc);
    
    int err = proj_context_errno(PJ_DEFAULT_CTX);
    if (err) {
       fprintf(stderr, "Error occurred while transforming u=%.4f, v=%.4f to Geo.\n",
              point_u, point_v);
        fprintf(stderr, "Proj error: %s\n", proj_context_errno_string(PJ_DEFAULT_CTX, err));
        return 1;
    }
    *lat=xyzDest.lp.lam;
    *lon=xyzDest.lp.phi;
    return err;
}

/* Usage information */
void usage(char *arg)
{
  printf("Usage: %s zone < data_in\n",arg);
  printf("where:\n");
  printf("\tzone: utm zone to use\n\n");
  printf("\tdata_in format: \n");
  printf("\t\t0 lon lat\n");
  printf("\t\t1 utm_e utm_n\n");
}

int main(int argc, char **argv) {
    char _projstr[64];

    if(argc != 2) {
      usage(argv[0]);
      exit(1);
    }

    int zone=atoi(argv[1]);

    snprintf(_projstr, 64, "+proj=utm +ellps=clrk66 +zone=%d +datum=NAD27 +units=m +no_defs", zone);
    if (!(_geo2utm = proj_create_crs_to_crs(PJ_DEFAULT_CTX, "EPSG:4326", _projstr, NULL))) {
        fprintf(stderr,"%s\n",(char  *)proj_context_errno_string(PJ_DEFAULT_CTX, proj_context_errno(PJ_DEFAULT_CTX)));
        return (1);
    }

    char line[1024]; // 1024
    int type;
    double val1, val2=0.0;
    while (fgets(line, 1024, stdin) != NULL) {
      if(line[0]=='#') continue;  // a comment line
      if (sscanf(line,"%d %lf %lf",
               &type,
               &val1,
               &val2) == 3) {
        if(type == 0) { // type=0, lon, lat
	    double point_u=0.0, point_v=0.0; 
	    to_utm(val1, val2, &point_u, &point_v);
            fprintf(stderr,"lon(%lf)lat(%lf) => utm_e(%lf),utm_n(%lf)\n", val1, val2, point_u, point_v); 
        }		   
        if(type == 1) { // type=1, utm_e, utm_n
	    double lon=0.0, lat=0.0; 
	    to_geo(val1, val2, &lon, &lat);
            fprintf(stderr,"utm_e(%lf)utm_n(%lf) => lon(%lf),lat(%lf)\n", val1, val2, lon, lat); 
        }
      }
    }
    return 0;
}
