#include <stdio.h>
#include <string.h>
#include <math.h>
#include "ucvm_utils.h"
#include "ucvm_proj_ucvm.h"

#if !defined(M_PI)
#define M_PI 3.14159265358979323846
#endif
#define DEG_TO_RAD M_PI / 180.0;

/* Initialize projection */
int
ucvm_proj_ucvm_init(const char* pstr,
                    const ucvm_point_t *o,
                    double r,
                    ucvm_point_t *s,
                    ucvm_proj_t *p) {
    int err = UCVM_CODE_SUCCESS;
    if (p == NULL) {
        return (UCVM_CODE_ERROR);
    }

    /* Setup projection */
    p->geo2xy = proj_create_crs_to_crs(PJ_DEFAULT_CTX, UCVM_PROJ_GEO, pstr, NULL);
    if (!p->geo2xy) {
        fprintf(stderr, "Failed to create Proj coordinate system transformation object.\n");
        fprintf(stderr, "Source coordinate system: %s\n", UCVM_PROJ_GEO);
        fprintf(stderr, "Destination coordinate system: %s\n", pstr);
        fprintf(stderr, "Proj Error: %s\n", proj_context_errno_string(PJ_DEFAULT_CTX, proj_context_errno(PJ_DEFAULT_CTX)));
    }

    memcpy(&(p->p1), o, sizeof(ucvm_point_t));
    p->rot = r * DEG_TO_RAD;
    memcpy(&(p->size), s, sizeof(ucvm_point_t));
    memcpy(&(p->offset), o, sizeof(ucvm_point_t));

    /* Compute origin in proj coords */
    PJ_COORD xyzSrc = proj_coord(p->offset.coord[0], p->offset.coord[1], 0.0, HUGE_VAL);
    PJ_COORD xyzDest = proj_trans(p->geo2xy, PJ_FWD, xyzSrc);
    err = proj_context_errno(PJ_DEFAULT_CTX);
    if (err) {
        fprintf(stderr, "Error occurred while transforming coordinates: %.6e, %.6e.\n",
                xyzSrc.xyzt.x, xyzSrc.xyzt.y);
        fprintf(stderr, "Proj error: %s\n", proj_context_errno_string(PJ_DEFAULT_CTX, err));
        return UCVM_CODE_ERROR;
    }
    p->offset.coord[0] = xyzDest.xyzt.x;
    p->offset.coord[1] = xyzDest.xyzt.y;

    return (UCVM_CODE_SUCCESS);
}


/* Finalize projection */
int
ucvm_proj_ucvm_finalize(ucvm_proj_t *p) {
    if (p == NULL) {
        return (UCVM_CODE_ERROR);
    }

    if (p->geo2xy) {
        proj_destroy(p->geo2xy);
        p->geo2xy = NULL;
    }

    return (UCVM_CODE_SUCCESS);
}


/* Convert lon,lat to x,y */
int
ucvm_proj_ucvm_geo2xy(ucvm_proj_t *p,
                      ucvm_point_t *geo,
                      ucvm_point_t *xy) {
    int err = UCVM_CODE_SUCCESS;

    if (!geo || !xy || !p) {
        return (UCVM_CODE_ERROR);
    }

    PJ_COORD xyzSrc = proj_coord(geo->coord[0], geo->coord[1], geo->coord[2], HUGE_VAL);
    PJ_COORD xyzDest = proj_trans(p->geo2xy, PJ_FWD, xyzSrc);
    err = proj_context_errno(PJ_DEFAULT_CTX);
    if (err) {
        fprintf(stderr, "Error occurred while transforming coordinates: %.6e, %.6e.\n",
                xyzSrc.xyzt.x, xyzSrc.xyzt.y);
        fprintf(stderr, "Proj error: %s\n", proj_context_errno_string(PJ_DEFAULT_CTX, err));
        return UCVM_CODE_ERROR;
    }
    xy->coord[0] = xyzDest.xyzt.x - p->offset.coord[0];
    xy->coord[1] = xyzDest.xyzt.y - p->offset.coord[1];
    xy->coord[2] = xyzDest.xyzt.z;

    rot_point_2d(xy, p->rot);

    if ((xy->coord[0] < 0.0) || (xy->coord[1] < 0.0) ||
        (xy->coord[0] > p->size.coord[0]) ||
        (xy->coord[1] > p->size.coord[1])) {
        return (UCVM_CODE_ERROR);
    }

    return (UCVM_CODE_SUCCESS);
}


/* Convert x,y to lon,lat */
int
ucvm_proj_ucvm_xy2geo(ucvm_proj_t *p,
                      ucvm_point_t *xy,
                      ucvm_point_t *geo) {
    int err = UCVM_CODE_SUCCESS;

    if (!geo || !xy || !p) {
        return (UCVM_CODE_ERROR);
    }

    PJ_COORD xyzSrc = proj_coord(xy->coord[0] + p->offset.coord[0],
                                 xy->coord[1] + p->offset.coord[1],
                                 xy->coord[2],
                                 HUGE_VAL);
    PJ_COORD xyzDest = proj_trans(p->geo2xy, PJ_INV, xyzSrc);
    err = proj_context_errno(PJ_DEFAULT_CTX);
    if (err) {
        fprintf(stderr, "Error occurred while transforming coordinates: %.6e, %.6e.\n",
                xyzSrc.xyzt.x, xyzSrc.xyzt.y);
        fprintf(stderr, "Proj error: %s\n", proj_context_errno_string(PJ_DEFAULT_CTX, err));
        return UCVM_CODE_ERROR;
    }
    geo->coord[0] = xyzDest.xyzt.x - p->offset.coord[0];
    geo->coord[1] = xyzDest.xyzt.y - p->offset.coord[1];
    geo->coord[2] = xyzDest.xyzt.z;

    return (UCVM_CODE_SUCCESS);
}
