
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "ucvm.h"
#include "ucvm_crossing.h"
#include "ucvm_interp.h"

//  test_svm data.in
int main(int argc, char **argv)
{
  int i;
  int nn;

  ucvm_point_t *pnt1;
  ucvm_data_t *prop1;
//ucvm_crossings is in ucvm.c   
  
  FILE *fptr;
  int numread = 0;
  char *data_in;
  char data_out[20]; 
  char str[100];

  if(argc != 3) {
     printf("Usage:  test_svm cnt data_file");
     return(1);
  }
  sscanf(argv[1],"%d", &nn);

  data_in=argv[2];
  sprintf(data_out,"%s_out",data_in);

  fptr=fopen(data_in, "r");
  if(fptr == NULL) {
     printf("Can not open %s\n", argv[1]);
     return(1);
  }

  pnt1 = malloc(nn * sizeof(ucvm_point_t));
  prop1 = malloc(nn * sizeof(ucvm_data_t));

  ucvm_crossings = malloc(nn * sizeof(ucvm_data_t));
  for(i=0; i< nn; i++)
     ucvm_crossings[i]=DEFAULT_NULL_DEPTH;

  char gtl_label[UCVM_MAX_LABEL_LEN];
  char cr_label[UCVM_MAX_LABEL_LEN];

  for(i=0; i< 100; i++)
     str[i]=' ';
  
  while(fgets(str,100,fptr)!=NULL) {
    printf("got -> %s",str);
    if (sscanf(str,"%lf %lf %lf",
               &(pnt1[numread].coord[0]),
               &(pnt1[numread].coord[1]),
               &(pnt1[numread].coord[2])) == 3) {

      /* Check for scan failure */
      if ((pnt1[numread].coord[0] == 0.0) ||
          (pnt1[numread].coord[1] == 0.0)) {
        continue;
      }

      numread++;
    }
  }
  fclose(fptr);
    
  printf("Init\n");
  if (ucvm_init("../../conf/ucvm.conf") != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "Init failed\n");
    return(1);
  }
  
  printf("set Query Mode\n");
  ucvm_ctype_t cmode = UCVM_COORD_GEO_DEPTH; 
  if (ucvm_setparam(UCVM_PARAM_QUERY_MODE, cmode) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "Failed to set z mode\n");
    return(1);
  }

#ifdef _UCVM_ENABLE_CVMS5
  fprintf(stdout,"adding cvms5\n");
  if (ucvm_add_model("cvms5") != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "Retrieval of CVMS5 failed\n");
    return(1);
  }
#endif
  
  printf("Query Models\n");
  if (ucvm_query(nn, pnt1, prop1) != UCVM_CODE_SUCCESS) {
    fprintf(stderr, "Query CVM failed\n");
    return(1);
  }
 

/* Output format is:
 * 	lon lat Z surf vs30 crustal cr_vp cr_vs cr_rho gtl gtl_vp gtl_vs gtl_rho cmb_algo cmb_vp cmb_vs cmb_rho
*/

  printf("base Results\n");
  for (i = 0; i < numread; i++) {
    ucvm_model_label(prop1[i].crust.source,
                           cr_label, UCVM_MAX_LABEL_LEN);
    ucvm_model_label(prop1[i].gtl.source,
                           gtl_label, UCVM_MAX_LABEL_LEN);
    printf("%d: model=%s, gtl=%s, depth=%lf, vs30=%lf, vp=%lf, vs=%lf, rho=%lf\n", i, 
	   cr_label, gtl_label,
           prop1[i].depth, prop1[i].vs30,
           prop1[i].cmb.vp, prop1[i].cmb.vs, prop1[i].cmb.rho);
  }


  // setup crossing..
  //
  int z;
  int zthreshold=1000.0;

  for(i=0; i< numread; i++) {
    for(z=0;z<i; z++) {
       if(pnt1[z].coord[0] == pnt1[i].coord[0] &&
          (pnt1[z].coord[1] == pnt1[i].coord[1]) && ucvm_crossings[z] != DEFAULT_NULL_DEPTH) {
           ucvm_crossings[i]=ucvm_crossings[z];
           break;
       }
    }
    if (z == i) { // did not find one
       double crossing = ucvm_first_crossing(&(pnt1[i]), cmode, zthreshold);
       ucvm_crossings[z]=crossing;
    }
  }
  printf("Query SVM interp\n");
  for (i = 0; i < numread; i++) {
      int max=ucvm_crossings[i];
      if( ucvm_interp_svm(0, max, UCVM_COORD_GEO_DEPTH,
         &(pnt1[i]), &(prop1[i])) != UCVM_CODE_SUCCESS) {
        fprintf(stderr, "Query CVM svm failed\n");
        return(1);
      }
  }

  printf("base svm Results\n");
  for (i = 0; i < numread; i++) {
    ucvm_model_label(prop1[i].crust.source,
                           cr_label, UCVM_MAX_LABEL_LEN);
    ucvm_model_label(prop1[i].gtl.source,
                           gtl_label, UCVM_MAX_LABEL_LEN);
    printf("%d: model=%s, gtl=%s, depth=%lf, vs30=%lf, vp=%lf, vs=%lf, rho=%lf\n", i, 
	   cr_label, gtl_label,
           prop1[i].depth, prop1[i].vs30,
           prop1[i].cmb.vp, prop1[i].cmb.vs, prop1[i].cmb.rho);
  }
  ucvm_finalize();
  free(pnt1);
  free(prop1);

  return(0);
}


/********************************************
taking in Jian Shi's csv data..

zmax, depth, vs30, cmb.vs, cvmb.vp, rho

75,0,200,164.4168,-1,-1
75,1,200,164.4168,-1,-1
75,2,200,164.4168,-1,-1
75,3,200,166.9257,-1,-1



#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

// zmax would be the Z1.0 if there is one and vs30
// in data->gtl.vs

double _calc_z1_from_Vs30(double vs30) {
  double z1 = 140.511*exp(-0.00303*vs30); // [m]
  return z1;
}

double _calc_rho (double vs, double z) {
  if (z == 0.0) {
    z = 0.0001;
  }
  double lb = 1.65; //lower bound  [g/cm^3]
  double other= 1.0 + 1.0/ (0.614 + 58.7 * (log(z) + 1.095) / vs); 
  double rho  = 1000.0 *  (lb>other? lb: other); //[kg/m^3]
  return rho;
}

int interp_svm(int idx,double zmax_i, double depth_i, double vs30_i, double vs_i) {

  // result
  double cmb_vp;
  double cmb_vs;
  double cmb_rho;

  //
  double p1 = -2.1688E-04;
  double p2 =  0.5182    ;
  double p3 = 69.452     ;

  double r1 = -59.67     ;
  double r2 = -0.2722    ;
  double r3 = 11.132     ;

  double s1 =  4.110     ;
  double s2 = -1.0521E-04;
  double s3 = -10.827    ;
  double s4 = -7.6187E-03;

  double zstar = 2.5 ; // [m]
  double z1    = zmax_i; // z at which vs = 1000
  double vz1;
  double z     = depth_i; // interpolation depth

  double vs, k, n, vs0; // vs profiling parameters

  double vscap = 1000.0;
  double eta   = 0.9   ;
  double zeta, veta    ;

  double vs30   = vs30_i;

  double nu = 0.3; // poisson ratio
  double vp_vs  = sqrt(2.0*(1.0-nu)/(1.0-2.0*nu));

  if (z < 0.0) {
    return(1);
  }

  // if no z1 data, compute empirically
  if (z1 == 0.0 || z1 == -1.0) {
    z1 = _calc_z1_from_Vs30(vs30);
  }

  // query in crustal properties
  if (z >= z1) {
 //   printf("    Need crustal info..z is %lf, z1 is %lf\n",z, z1);
    cmb_vs = vs_i;
    printf("%d,%1.1lf,%1.1lf,%lf,%lf\n",idx,depth_i,zmax_i, cmb_vs, vs_i);
    return(0);
  }

  // z is between 0 and z1: query in SVM model
    vs0 = p1*pow(vs30,2.0) + p2*vs30 + p3;

  if (z1<=zstar) {
    vs  = (vs0<vscap?vs0:vscap);
  }
  else { // z1 > zstar

//???  k_ = np.exp(r1 * Vs30**r2 + r3)  # updated on 2018/1/2
    k   = exp(r1*pow(vs30,r2) + r3);
    double o = s1*exp(s2*vs30) + s3*exp(s4*vs30);
    n   = (1.0>o ? 1.0: o);
    vz1 = vs0*pow(1.0+k*(z1-zstar),1.0/n); // vs @ z1

    if (vz1 <= vscap) { // no need to cap the model
      if (z<=zstar) {
        vs = vs0;
      }
      else {
        vs = vs0*pow(1.0+k*(z-zstar),1.0/n);
      }
    }
    else { // vz1 > vscap -> need to cap the model with linear interpolation from zeta to z1
      veta = eta*vscap;
      zeta = (1.0/k)*(pow(veta/vs0,n)-1.0)+zstar; // depth at which vs = eta*vscap
      if (z <= zeta) {
        if (z<=zstar) {
          vs = vs0;
        }
        else {
          vs = vs0*pow(1.0+k*(z-zstar),1.0/n);
        }
      }
      else { // z>zeta -> linear interpolation
        vs   = veta + ((vscap-veta)/(z1-zeta))*(z-zeta);
      }
    }
  }

  cmb_vs     = vs;
  cmb_vp     = vp_vs * vs;
  cmb_rho    =  _calc_rho(vs,z);
//  printf("result ->  %lf %lf %lf\n", cmb_vs, cmb_vp, cmb_rho);
  printf("%d,%1.1lf,%1.1lf,%lf,%lf\n",idx,depth_i,zmax_i, cmb_vs, vs_i);
  return(0);
}


double *ucvm_vs;
double *ucvm_vs30;
double *ucvm_depth;
double *ucvm_crossing;
//  svm n data.csv
int main(int argc, char **argv)
{
  int i;
  int nn;

  FILE *fptr;
  int numread = 0;
  char *data_in;
  char str[100];

  if(argc != 3) {
     printf("Usage:  test_svm cnt data_file");
     return(1);
  }
  sscanf(argv[1],"%d", &nn);

  data_in=argv[2];

  fptr=fopen(data_in, "r");
  if(fptr == NULL) {
     printf("Can not open %s\n", argv[1]);
     return(1);
  }

  ucvm_vs30 = malloc(nn * sizeof(double));
  ucvm_vs = malloc(nn * sizeof(double));
  ucvm_depth = malloc(nn * sizeof(double));
  ucvm_crossing = malloc(nn * sizeof(double));

  for(i=0; i< nn; i++) {
     ucvm_vs30[i]=0;
     ucvm_vs[i]=0;
     ucvm_depth[i]=0;
     ucvm_crossing[i]=-1;
  }
    
  for(i=0; i< 100; i++)
     str[i]=' ';
  
  numread=0;
  while(fgets(str,100,fptr)!=NULL) {
    double crossing;
    double depth;
    double vs30;
    double vs;
    if (sscanf(str,"%lf,%lf,%lf,%lf",
               &crossing,
               &depth,
               &vs30,
               &vs) != 4) {
      fprintf(stderr,"bad data in..at %d\n", i);
      return(1);
    }
    ucvm_crossing[numread]=crossing;
    ucvm_depth[numread]=depth;
    ucvm_vs30[numread]=vs30;
    ucvm_vs[numread]=vs;
    numread++;
  }
  fclose(fptr);
    
  for (i = 0; i < numread; i++) {
      if( interp_svm(i,ucvm_crossing[i], ucvm_depth[i], ucvm_vs30[i], ucvm_vs[i]) != 0) {
        fprintf(stderr, "Query SVM failed\n");
        return(1);
      }
  }

  free(ucvm_vs30);
  free(ucvm_vs);
  free(ucvm_depth);
  free(ucvm_crossing);

  return(0);
}

********************************************/
