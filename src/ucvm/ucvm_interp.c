#include <stdio.h>
#include <string.h>
#include <math.h>
#include "ucvm_utils.h"
#include "ucvm_interp.h"

/* Ely interp coefficients */
double ucvm_interp_ely_a = 0.5;
double ucvm_interp_ely_b = 0.66666666666;
double ucvm_interp_ely_c = 1.5;


/* Ely interpolation method */
int ucvm_interp_ely(double zmin, double zmax, ucvm_ctype_t cmode,
		    ucvm_point_t *pnt, ucvm_data_t *data)
{
  double z, f, g;

  switch (cmode) {
  case UCVM_COORD_GEO_DEPTH:
  case UCVM_COORD_GEO_ELEV:
    break;
  default:
    fprintf(stderr, "Unsupported coord type\n");
    return(UCVM_CODE_ERROR);
    break;
  }

  if (data->depth < 0.0) {
    return(UCVM_CODE_NODATA);
  }

  if (data->depth < zmin) {
    /* Point lies fully in GTL */
    /* Check that gtl vs is defined */
    if (data->gtl.vs <= 0.0) {
      return(UCVM_CODE_NODATA);
    }
    /* Apply a coefficient to convert vs30 to vs */
    data->cmb.vs = ucvm_interp_ely_a * data->gtl.vs;
    data->cmb.vp = ucvm_interp_ely_a * ucvm_brocher_vp(data->gtl.vs);
    data->cmb.rho = ucvm_nafe_drake_rho(data->cmb.vp);
    data->cmb.source = UCVM_SOURCE_GTL;
  } else if (data->depth >= zmax) {
    /* Point lies fully in crustal */
    data->cmb.vp = data->crust.vp;
    data->cmb.vs = data->crust.vs;
    data->cmb.rho = data->crust.rho;
    data->cmb.source = UCVM_SOURCE_CRUST;
  } else {
    /* Point lies in gtl/crustal interpolation zone */
    data->cmb.source = data->gtl.source;

    /* Check that all crust properties and gtl vs are defined */
    if ((data->crust.vp <= 0.0) || (data->crust.vs <= 0.0) || 
	(data->crust.rho <= 0.0) || (data->gtl.vs <= 0.0)) {
      return(UCVM_CODE_NODATA);
    }

    z = (data->depth - zmin) / (zmax - zmin);
    f = z - pow(z, 2.0);
    g = pow(z, 2.0) + 2*pow(z, 0.5) - 3*z;
    data->cmb.vs = (z + ucvm_interp_ely_b*f)*(data->crust.vs) + 
      (ucvm_interp_ely_a - ucvm_interp_ely_a*z + 
       ucvm_interp_ely_c*g)*data->gtl.vs;
    data->cmb.vp = (z + ucvm_interp_ely_b*f)*(data->crust.vp) + 
      (ucvm_interp_ely_a - ucvm_interp_ely_a*z + 
       ucvm_interp_ely_c*g)*ucvm_brocher_vp(data->gtl.vs);
    data->cmb.rho = ucvm_nafe_drake_rho(data->cmb.vp);
  }

  return(UCVM_CODE_SUCCESS);
}


/* Linear interpolation method */
int ucvm_interp_linear(double zmin, double zmax, ucvm_ctype_t cmode,
		       ucvm_point_t *pnt, ucvm_data_t *data)
{
  double zratio;

  switch (cmode) {
  case UCVM_COORD_GEO_DEPTH:
  case UCVM_COORD_GEO_ELEV:
    break;
  default:
    fprintf(stderr, "Unsupported coord type\n");
    return(UCVM_CODE_ERROR);
    break;
  }

  if (data->depth < 0.0) {
    return(UCVM_CODE_NODATA);
  }

  if (data->depth < zmin) {
    data->cmb.vs = data->gtl.vs;
    data->cmb.vp = data->gtl.vp;
    data->cmb.rho = data->gtl.rho;
    data->cmb.source = UCVM_SOURCE_GTL;
  } else if ((data->depth >= zmin) && (data->depth < zmax)) {
    /* Point lies in gtl/crustal interpolation zone */
    data->cmb.source = data->gtl.source;

    /** MEI
    if ((data->crust.vp <= 0.0) || (data->crust.vs <= 0.0) || 
	(data->crust.rho <= 0.0) || (data->gtl.vp <= 0.0) || 
	(data->gtl.vs <= 0.0) || (data->gtl.rho <= 0.0)) {
      return(UCVM_CODE_NODATA);
    }
    **/

    zratio = (data->depth - zmin) / (zmax - zmin);
    if(data->gtl.vp > 0.0 && data->crust.vp > 0.0) {
      data->cmb.vp = interpolate_linear(data->gtl.vp, 
				      data->crust.vp, zratio);
    }
    if(data->gtl.vs > 0.0 && data->crust.vs > 0.0) {
      data->cmb.vs = interpolate_linear(data->gtl.vs, 
				      data->crust.vs, zratio);
    }
    if(data->gtl.rho > 0.0 && data->crust.rho > 0.0) {
      data->cmb.rho = interpolate_linear(data->gtl.rho, 
				       data->crust.rho, zratio);
    } 
  } else {
    data->cmb.vp = data->crust.vp;
    data->cmb.vs = data->crust.vs;
    data->cmb.rho = data->crust.rho;
    data->cmb.source = UCVM_SOURCE_CRUST;
  }

  return(UCVM_CODE_SUCCESS);
}


/* Crustal pass-through method */
int ucvm_interp_crustal(double zmin, double zmax, ucvm_ctype_t cmode,
			ucvm_point_t *pnt, ucvm_data_t *data)
{
  data->cmb.vp = data->crust.vp;
  data->cmb.vs = data->crust.vs;
  data->cmb.rho = data->crust.rho;
  data->cmb.source = UCVM_SOURCE_CRUST;

  return(UCVM_CODE_SUCCESS);
}

/* SVM interpolation method */

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

int ucvm_interp_svm(double zmin, double zmax, ucvm_ctype_t cmode, 
ucvm_point_t *pnt, ucvm_data_t *data) {

  // curve fitting parameters for SVM model

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
  double z1    = zmax; // z at which vs = 1000
  double vz1;
  double z     = data->depth; // interpolation depth

  double vs, k, n, vs0; // vs profiling parameters

  double vscap = 1000.0;
  double eta   = 0.9   ;
  double zeta, veta    ;

  double vs30   = data->gtl.vs;

  double nu = 0.3; // poisson ratio
  double vp_vs  = sqrt(2.0*(1.0-nu)/(1.0-2.0*nu));

  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  switch (cmode) {
    case UCVM_COORD_GEO_DEPTH:
    case UCVM_COORD_GEO_ELEV:
    break;
    default:
    fprintf(stderr, "Unsupported coord type\n");
    return(UCVM_CODE_ERROR);
    break;
  }

  if (z < 0.0) {
    return(UCVM_CODE_NODATA);
  }

  // if no z1 data, compute empirically
  if (z1 == 0.0 || z1 == -1.0) {
    z1 = _calc_z1_from_Vs30(vs30);
//printf("### in interp, was 0 and now %lf vs30(%lf) %lf %lf %lf \n",z1,vs30,pnt->coord[0],pnt->coord[1],pnt->coord[2]);
  }


  // query in crustal properties
  if (z >= z1) {
    data->cmb.vp     = data->crust.vp;
    data->cmb.vs     = data->crust.vs;
    data->cmb.rho    = data->crust.rho;
    data->cmb.source = UCVM_SOURCE_CRUST;
    return(UCVM_CODE_SUCCESS);
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

  data->cmb.vs     = vs;
  data->cmb.vp     = vp_vs * vs;
  data->cmb.rho    =  _calc_rho(vs,z);
  data->cmb.source = data->gtl.source;
  return(UCVM_CODE_SUCCESS);
}

