
/**** 
    ucvm_grid.c 
    (Brad)
***/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "ucvm_dtypes.h"
#include "ucvm_grid.h"
#include "ucvm_proj_bilinear.h"
#include "ucvm_utils.h"
#include "proj.h"

int ucvm_grid_debug=1;

/* Maximum grid points to buffer from files */
#define UCVM_GRID_MAX_POINTS 2048

#if !defined(M_PI)
#define M_PI 3.14159265358979323846
#endif
#define DEG_TO_RAD M_PI / 180.0

/* CMU projection parameters */
double cmu_xi[4] = { -121.0, -118.951292, -113.943965, -116.032285 };
double cmu_yi[4] = {   34.5,   36.621696,   33.122341,   31.082920 };
double cmu_dims[2] = {600000.0, 300000.0};


/* Private: Generate grid from projection and dimensions */
int
ucvm_grid_gen_private(ucvm_projdef_t *iproj,
                      ucvm_trans_t *trans,
                      ucvm_projdef_t *oproj,
                      ucvm_dim_t *dims,
                      double spacing,
                      ucvm_point_t *pnts,
                      const char *filename) {
    int i, j, c;
    double x, y, z, x_offset, y_offset, theta, gridding;
    FILE *ofp;
    ucvm_point_t pbuf[UCVM_GRID_MAX_POINTS];
    PJ *cs_transformer = NULL;
    int err = UCVM_CODE_SUCCESS;

    if ((pnts == NULL) && (filename == NULL)) {
        return (UCVM_CODE_ERROR);
    }

    theta = trans->rotate * DEG_TO_RAD;
    if (trans->gtype == UCVM_GRID_CELL_CENTER) {
        gridding = 0.5;
    } else {
        gridding = 0.0;
    }

    /* Determine origin point within projection */
    if (strcasecmp(oproj->proj, "cmu") == 0) {
        x_offset = trans->origin[0] + trans->translate[0];
        y_offset = trans->origin[1] + trans->translate[1];
    } else {
        cs_transformer = proj_create_crs_to_crs(PJ_DEFAULT_CTX, iproj->proj, oproj->proj, NULL);
        if (!cs_transformer) {
            fprintf(stderr, "Failed to create Proj coordinate system transformation object.\n");
            fprintf(stderr, "Source coordinate system: %s\n", iproj->proj);
            fprintf(stderr, "Destination coordinate system: %s\n", oproj->proj);
            fprintf(stderr, "Proj Error: %s\n", proj_context_errno_string(PJ_DEFAULT_CTX, proj_context_errno(PJ_DEFAULT_CTX)));
        }
        PJ_COORD xyzSrc = proj_coord(trans->origin[0], trans->origin[1], 0.0, HUGE_VAL);
        PJ_COORD xyzDest = proj_trans(cs_transformer, PJ_FWD, xyzSrc);
        err = proj_context_errno(PJ_DEFAULT_CTX);
        if (err) {
            fprintf(stderr, "Error occurred while transforming coordinates: %.6e, %.6e.\n",
                    xyzSrc.xyzt.x, xyzSrc.xyzt.y);
            fprintf(stderr, "Proj error: %s\n", proj_context_errno_string(PJ_DEFAULT_CTX, err));
            return UCVM_CODE_ERROR;
        }
        x_offset = xyzDest.xyzt.x + trans->translate[0];
        y_offset = xyzDest.xyzt.y + trans->translate[1];

        proj_destroy(cs_transformer);
    }

    if (pnts != NULL) {
        /* Generate grid with rotation */
        for (j = 0; j < dims->dim[1]; j++) {
            for (i = 0; i < dims->dim[0]; i++) {
                x = ((i + gridding) * spacing);
                y = ((j + gridding) * spacing);
                z = 0.0;

                pnts[j*dims->dim[0]+i].coord[0] = x_offset + x * cos(theta) - y * sin(theta);
                pnts[j*dims->dim[0]+i].coord[1] = y_offset + x * sin(theta) + y * cos(theta);
                pnts[j*dims->dim[0]+i].coord[2] = z;
            }
        }
    }

int num_grid=0;
    if (filename != NULL) {
        /* Open file */
        ofp = fopen(filename, "wb");
        if (ofp == NULL) {
            fprintf(stderr, "Failed to open gridfile %s\n", filename);
            return (UCVM_CODE_ERROR);
        }

        /* Generate grid with rotation */
        c = 0;
        for (j = 0; j < dims->dim[1]; j++) {
            for (i = 0; i < dims->dim[0]; i++) {
                x = ((i + gridding) * spacing);
                y = ((j + gridding) * spacing);
                z = 0.0;

                pbuf[c].coord[0] = x_offset + x * cos(theta) - y * sin(theta);
                pbuf[c].coord[1] = y_offset + x * sin(theta) + y * cos(theta);
                pbuf[c].coord[2] = z;
                c++;

                if (c == UCVM_GRID_MAX_POINTS) {
                    fwrite(pbuf, sizeof(ucvm_point_t), c, ofp);
                    num_grid=num_grid+c;
                    c = 0;
                }
            }
        }
        if (c > 0) {
            fwrite(pbuf, sizeof(ucvm_point_t), c, ofp);
            num_grid=num_grid+c;
        }

{
printf("ucvm_grid: Grid 4 corners:\n");

int dimx=dims->dim[0];
// first one
printf("  %lf %lf (%d)\n",pbuf[0].coord[0],pbuf[0].coord[1],0);
// x-1
printf("  %lf %lf (%d)\n",pbuf[dimx-1].coord[0],pbuf[dimx-1].coord[1],dimx-1);
// num_grid - x
printf("  %lf %lf (%d)\n",pbuf[num_grid-dimx].coord[0],pbuf[num_grid-dimx].coord[1],num_grid-dimx);
// num_grid - 1
printf("  %lf %lf (%d)\n",pbuf[num_grid-1].coord[0],pbuf[num_grid-1].coord[1],num_grid-1);

if(ucvm_grid_debug) {
    printf("grid size %d, %d, %d\n", dims->dim[0], dims->dim[1], dims->dim[2]);
    printf("indexing at 0->%d->%d->%d\n",dimx-1, num_grid-dimx, num_grid-1);
    printf("Xaxis row:\n");
    for(int i=0; i<dimx; i++) {
      printf("  %lf %lf\n",pbuf[i].coord[0],pbuf[i].coord[1]);
    }
}
}

        /* Close file */
        fclose(ofp);
    }

    return (UCVM_CODE_SUCCESS);
}


/* Private: Convert point list from one projection to another */
int
ucvm_grid_convert_private(ucvm_projdef_t *iproj,
                          ucvm_projdef_t *oproj,
                          size_t n,
                          ucvm_point_t *pnts,
                          const char *filename) {
    int i;
    ucvm_point_t xy;
    ucvm_bilinear_t cmu;
    FILE *fp;
    ucvm_point_t pbuf[UCVM_GRID_MAX_POINTS];
    char ipdesc[UCVM_MAX_PROJ_LEN];
    char opdesc[UCVM_MAX_PROJ_LEN];
    size_t num_read;
    size_t num_buffered;
    PJ *cs_transformer = NULL;
    int err = UCVM_CODE_SUCCESS;

    /* Init CMU proj */
    for (i = 0; i < 4; i++) {
        cmu.xi[i] = cmu_xi[i];
        cmu.yi[i] = cmu_yi[i];
    }
    cmu.dims[0] = cmu_dims[0];
    cmu.dims[1] = cmu_dims[1];

    /* If input or output projections are CMU, change them to latlong
     * and then perform an initial cmu->latlong and/or additional
     * latlong->cmu conversion */

    /* Create appropriate input projection */
    if (strcasecmp(iproj->proj, "cmu") == 0) {
        /* Convert from CMU to GEO */

        if (pnts != NULL) {
            for (i = 0; i < n; i++) {
                ucvm_bilinear_xy2geo(&cmu, &(pnts[i]), &xy);
                pnts[i].coord[0] = xy.coord[0];
                pnts[i].coord[1] = xy.coord[1];
            }
        }

        if (filename != NULL) {
            /* Open file */
            fp = fopen(filename, "rb+");
            if (fp == NULL) {
                fprintf(stderr, "Failed to open gridfile %s\n", filename);
                return (UCVM_CODE_ERROR);
            }

            num_read = 0;
            while (!feof(fp)) {
                num_buffered = fread(&pbuf, sizeof(ucvm_point_t),
                                     UCVM_GRID_MAX_POINTS, fp);

                if (num_buffered > 0) {
                    for (i = 0; i < num_buffered; i++) {
                        /* Translate point */
                        ucvm_bilinear_xy2geo(&cmu, &(pbuf[i]), &xy);
                        pbuf[i].coord[0] = xy.coord[0];
                        pbuf[i].coord[1] = xy.coord[1];
                    }

                    /* Write points */
                    fseek(fp, num_read * sizeof(ucvm_point_t), SEEK_SET);
                    fwrite(&pbuf, sizeof(ucvm_point_t), num_buffered, fp);
                    fflush(fp);
                    num_read = num_read + num_buffered;
                }
            }
            if (n != num_read) {
                fprintf(stderr, "Gridfile generated size (%zu) and n mismatch (%zu)\n", num_read, n);
                fclose(fp);
                return (UCVM_CODE_ERROR);
            }

            fclose(fp);
        }
        ucvm_strcpy(ipdesc, UCVM_PROJ_GEO, UCVM_MAX_PROJ_LEN);
    } else {
        ucvm_strcpy(ipdesc, iproj->proj, UCVM_MAX_PROJ_LEN);
    }

    /* Create appropriate output projection */
    if (strcmp(oproj->proj, "cmu") == 0) {
        ucvm_strcpy(opdesc, UCVM_PROJ_GEO, UCVM_MAX_PROJ_LEN);
    } else {
        ucvm_strcpy(opdesc, oproj->proj, UCVM_MAX_PROJ_LEN);
    }

    cs_transformer = proj_create_crs_to_crs(PJ_DEFAULT_CTX, ipdesc, opdesc, NULL);
    if (!cs_transformer) {
        fprintf(stderr, "Failed to create Proj coordinate system transformation object.\n");
        fprintf(stderr, "Source coordinate system: %s\n", ipdesc);
        fprintf(stderr, "Destination coordinate system: %s\n", opdesc);
        fprintf(stderr, "Proj Error: %s\n", proj_context_errno_string(PJ_DEFAULT_CTX, proj_context_errno(PJ_DEFAULT_CTX)));
        return (UCVM_CODE_ERROR);
    }

    /* Convert point list */
    if (pnts != NULL) {
        for (i = 0; i < n; i++) {

            PJ_COORD xyzSrc = proj_coord(pnts[i].coord[0], pnts[i].coord[1], 0.0, HUGE_VAL);
            PJ_COORD xyzDest = proj_trans(cs_transformer, PJ_FWD, xyzSrc);
            err = proj_context_errno(PJ_DEFAULT_CTX);
            if (err) {
                fprintf(stderr, "Error occurred while transforming coordinates: %.6e, %.6e.\n",
                        xyzSrc.xyzt.x, xyzSrc.xyzt.y);
                fprintf(stderr, "Proj error: %s\n", proj_context_errno_string(PJ_DEFAULT_CTX, err));
                return UCVM_CODE_ERROR;
            }
            pnts[i].coord[0] = xyzDest.xyzt.x;
            pnts[i].coord[1] = xyzDest.xyzt.y;

            if (strcmp(oproj->proj, "cmu") == 0) {
                ucvm_bilinear_geo2xy(&cmu, &(pnts[i]), &xy);
                pnts[i].coord[0] = xy.coord[0];
                pnts[i].coord[1] = xy.coord[1];
            }

        }
    }

    if (filename != NULL) {
        /* Open file */
        fp = fopen(filename, "r+");
        if (fp == NULL) {
            fprintf(stderr, "Failed to open gridfile %s\n", filename);
            return (UCVM_CODE_ERROR);
        }

        num_read = 0;
        while (!feof(fp)) {
            num_buffered = fread(&pbuf, sizeof(ucvm_point_t),
                                 UCVM_GRID_MAX_POINTS, fp);

            if (num_buffered > 0) {
                for (i = 0; i < num_buffered; i++) {
                    PJ_COORD xyzSrc = proj_coord(pbuf[i].coord[0], pbuf[i].coord[1], 0.0, HUGE_VAL);
                    PJ_COORD xyzDest = proj_trans(cs_transformer, PJ_FWD, xyzSrc);
                    err = proj_context_errno(PJ_DEFAULT_CTX);
                    if (err) {
                        fprintf(stderr, "Error occurred while transforming coordinates: %.6e, %.6e.\n",
                                xyzSrc.xyzt.x, xyzSrc.xyzt.y);
                        fprintf(stderr, "Proj error: %s\n", proj_context_errno_string(PJ_DEFAULT_CTX, err));
                        return UCVM_CODE_ERROR;
                    }
                    pbuf[i].coord[0] = xyzDest.xyzt.x;
                    pbuf[i].coord[1] = xyzDest.xyzt.y;

                    if (strcmp(oproj->proj, "cmu") == 0) {
                        ucvm_bilinear_geo2xy(&cmu, &(pbuf[i]), &xy);
                        pbuf[i].coord[0] = xy.coord[0];
                        pbuf[i].coord[1] = xy.coord[1];
                    }
                }

                /* Write points */
                fseek(fp, num_read * sizeof(ucvm_point_t), SEEK_SET);
                fwrite(&pbuf, sizeof(ucvm_point_t), num_buffered, fp);
                fflush(fp);
                num_read = num_read + num_buffered;
            }
        }

        if (n != num_read) {
            fprintf(stderr, "Gridfile converted size (%zu) and n mismatch (%zu)\n",
                    num_read, n);
            fclose(fp);
            return (UCVM_CODE_ERROR);
        }

        fclose(fp);
    }

    proj_destroy(cs_transformer);

    return (UCVM_CODE_SUCCESS);
}


/* Generate grid from projection and dimensions */
int
ucvm_grid_gen(ucvm_projdef_t *iproj,
              ucvm_trans_t *trans,
              ucvm_projdef_t *oproj,
              ucvm_dim_t *dims,
              double spacing,
              ucvm_point_t *pnts) {
    return (ucvm_grid_gen_private(iproj, trans, oproj,
                                  dims, spacing, pnts, NULL));
}


/* Generate grid from projection and dimensions */
int
ucvm_grid_gen_file(ucvm_projdef_t *iproj,
                   ucvm_trans_t *trans,
                   ucvm_projdef_t *oproj,
                   ucvm_dim_t *dims,
                   double spacing,
                   const char *filename) {
    return (ucvm_grid_gen_private(iproj, trans, oproj,
                                  dims, spacing, NULL, filename));
}


/* Convert point list from one projection to another */
int
ucvm_grid_convert(ucvm_projdef_t *iproj,
                  ucvm_projdef_t *oproj,
                  size_t n,
                  ucvm_point_t *pnts) {
    return (ucvm_grid_convert_private(iproj, oproj, n, pnts, NULL));
}


/* Convert point list from one projection to another */
int
ucvm_grid_convert_file(ucvm_projdef_t *iproj,
                       ucvm_projdef_t *oproj,
                       size_t n,
                       const char *filename) {
    return (ucvm_grid_convert_private(iproj, oproj, n, NULL, filename));
}

