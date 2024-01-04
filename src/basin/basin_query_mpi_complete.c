/**
 * basin_query_mpi.c - Query UCVM for basin depths in parallel.
 *
 * Created by David Gill <davidgil@usc.edu>
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>
#include <mpi.h>
#include "ucvm.h"
#include "ucvm_utils.h"

/* Constants */
#define MAX_RES_LEN 256
#define DEFAULT_ZRANGE_MIN 0.0
#define DEFAULT_ZRANGE_MAX 350.0
#define DEFAULT_MAX_DEPTH 15000.0
#define DEFAULT_NULL_DEPTH -1.0 
#define DEFAULT_ZERO_DEPTH 0.0 
#define DEFAULT_Z_INTERVAL 20.0
#define DEFAULT_VS_THRESH 1000.0
#define META_BASE_LEN 2000 


//#define BLOB_FMT "%5d %5d %10.4f %10.4f %10.3f %10.3f\n"
//#define DEFAULT_BLOB_LEN 56
#define BLOB_FMT "%10.4f %10.4f %3d %10.3f %10.3f %10.3f %10.3f\n"
#define DEFAULT_BLOB_LEN 70 

#define WORKERREADY 99
#define DIEOFF -1

#define DEFAULT_MAX_FILE_LEN 512
#define DEFAULT_MAX_FILELIST_LEN 1024
#define DEFAULT_FILES_DELIM ","
#define DEFAULT_MAX_FILES 5
        // holding 1st crossing points
        // holding 1st or 2nd crossing points 
        // holding last crossing points
        // holding just the 2nd-only crossing points (secondOnly)
        // holding just the 3+ crossing points (thirdMore)

// to hold 4 floats and couple of comma and CRLF

/* Get opt args */
extern char *optarg;
extern int optind, opterr, optopt;

/* Display usage information */
void usage() {
	printf("Usage: basin_query_mpi [-h] [-b outfile [,outfile ,outfile] ] [-o ascii_outfile[, meta_outfile] ]  [-m models<:ifunc>] [-f config] [-d max_depth] [-i inter] ");
	printf("[-v vs_thresh] [-l lat,lon] [-s spacing] [-x num lon pts] [-y num lat pts]\n\n");
	printf("where:\n");
	printf("\t-b Binary output to file.\n");
	printf("\t-o Ascii output to file.\n");
	printf("\t-h This help message\n");
	printf("\t-f Configuration file. Default is ./ucvm.conf.\n");
	printf("\t-i Interval between query points along z-axis (m, default is 20.0)\n");
	printf("\t-m Comma delimited list of crustal/GTL models to query in order\n");
	printf("\t-v Vs threshold (m/s, default is 1000.0).\n");
	printf("\t-l Bottom-left lat,lon separated by comma.\n");
	printf("\t-s Grid spacing.\n");
	printf("\t-x Number of longitude points.\n");
	printf("\t-y Number of latitude points.\n");
	printf("Notes:\n");
	printf("\t- If running interactively, type Cntl-D to end input coord list.\n\n");
	printf("Version: %s\n\n", VERSION);
	return;
}

/* Extract basin values for the specified point */
int extract_basin_mpi(ucvm_point_t *pnt, double *depths, double max_depth, double z_inter, double vs_thresh) {

	int j, numz, dnum, crossing_cnt;
	double vs_prev;

	numz = (int) (max_depth / z_inter);

	ucvm_point_t *qpnts = malloc(numz * sizeof(ucvm_point_t));
	ucvm_data_t *qprops = malloc(numz * sizeof(ucvm_data_t));
        if(qpnts == NULL || qprops == NULL) {
            fprintf(stderr," fail to qpnts or qprops..\n");
            exit(1);
        }

	for (j = 0; j < numz; j++) {
		qpnts[j].coord[0] = pnt[0].coord[0];
		qpnts[j].coord[1] = pnt[0].coord[1];
		qpnts[j].coord[2] = (double) j * z_inter;
	}

	/* Query the UCVM */
	if (ucvm_query(numz, qpnts, qprops) != UCVM_CODE_SUCCESS) {
		fprintf(stderr, "Query CVM failed\n");
		return (1);
	}

        double firstCrossing= DEFAULT_NULL_DEPTH;
        double firstOrSecondCrossing= DEFAULT_NULL_DEPTH;
        double lastCrossing= DEFAULT_NULL_DEPTH;
        double secondOnlyCrossing= DEFAULT_NULL_DEPTH;
        double thirdMoreLastCrossing= DEFAULT_NULL_DEPTH;

	dnum = 0;
        crossing_cnt = 0;
        depths[0] = DEFAULT_NULL_DEPTH;
        depths[1] = DEFAULT_NULL_DEPTH;
        depths[2] = DEFAULT_NULL_DEPTH;
        depths[3] = DEFAULT_NULL_DEPTH;

	vs_prev = DEFAULT_ZERO_DEPTH;
	for (j = 0; j < numz; j++) {
                // must be a valid depth
		if (qprops[j].cmb.vs > DEFAULT_ZERO_DEPTH) {
			if(vs_prev < vs_thresh &&
					(qprops[j].cmb.vs >= vs_thresh)) {
				// found a crossing point
				crossing_cnt++;
				depths[dnum] = (double) j * z_inter;
				if(dnum == 0) {
					lastCrossing=firstOrSecondCrossing = firstCrossing = depths[dnum];
					dnum++;
				} else if(dnum == 1) {
					lastCrossing=firstOrSecondCrossing=depths[dnum];
                                        secondOnlyCrossing = depths[dnum];
                                        dnum++;
//fprintf(stderr,"WooHoo 2nd.. %10.3f %10.3f\n", pnt[0].coord[0], pnt[0].coord[1]);
				} else if(dnum == 2) {
					lastCrossing = thirdMoreLastCrossing = depths[dnum];
                                        dnum++;
                                } else {

                                // dnum sticks to 3 
				lastCrossing = thirdMoreLastCrossing = depths[dnum];
//fprintf(stderr,"WooHoo last.. %10.3f %10.3f\n", pnt[0].coord[0], pnt[0].coord[1]);
                                }
			}
			vs_prev = qprops[j].cmb.vs;
		}
	}
        depths[4] = firstCrossing; 
        depths[5] = firstOrSecondCrossing;
        depths[6] = lastCrossing;
        depths[7] = secondOnlyCrossing;
        depths[8] = thirdMoreLastCrossing;

	free(qprops);
	free(qpnts);
	return(crossing_cnt);
}
/*   first
     first,second
     first,scecond,last
     ,second,last
     ,,last
     first,,last
*/
int parse_file_list(char *list, char **files) {
	char *curr = list;
	char *next;
	int length,cnt=0;

	if(list == 0 || strlen(list) == 0) {
		fprintf(stderr, "Did not specify result files\n");
		return(UCVM_CODE_ERROR);
	}

	while ((next = strchr(curr, ',')) != NULL) {
    		/* process curr to next-1 */
    		length= next - curr;
                files[cnt]=NULL;
		if( length > 0 ) {
    			files[cnt]=(char *)malloc (sizeof (char) * (length+1));
    			memcpy(files[cnt], curr, length);
                        files[cnt][length]='\0';
		}
		cnt++;
    		curr = next + 1;
	}
        // if there is a last bit
	length=strlen(curr);
	if(length > 0 ) {
		files[cnt]=(char *)malloc (sizeof (char) * (length+1));
		memcpy(files[cnt], curr, length);
                files[cnt][length]='\0';
		cnt++;
	}
/*
int i;
for(i=0; i< cnt; i++) {
   if(files[i]!=NULL) {
     int len=strlen(files[i]);
     printf("list %d is (%s)len(%d)\n", i, files[i],len);
     } else {
       printf("list %d is (NULL)\n", i);
*/
  return (0);
}

/* parse filename list */
/*   first.file
     first.file,
     ,last.file
     first.file,last.file
*/
int parse_file_list2(const char *list, char **files) {
  char filesstr[DEFAULT_MAX_FILELIST_LEN];
  char *token;
  int i;
  int num_files = 0;

  /* initialize the files. */
  for( i=0 ; i < DEFAULT_MAX_FILES ; i++) {
    files[i]=malloc(DEFAULT_MAX_FILE_LEN * sizeof(char));
    strcpy(files[i], "");
  }
  if(list == 0 || strlen(list) == 0) {
      fprintf(stderr, "Did not specify result files\n");
      return(UCVM_CODE_ERROR);
  }

  strcpy(filesstr, list);

  /* special case, when first file is empty */
  if(filesstr[0]==',') {
    num_files++;
  }

  token = strtok(filesstr, DEFAULT_FILES_DELIM);
  while (token != NULL) {
    if (num_files == DEFAULT_MAX_FILES) {
      fprintf(stderr, "Max number of output file reached\n");
      return(UCVM_CODE_ERROR);
    }

    if(token != 0 && strlen(token) != 0) {
      strcpy(files[num_files], token);
    }

    num_files++;
    token = strtok(NULL, DEFAULT_FILES_DELIM);
  }

  return (0);
}


int main(int argc, char **argv) {
	int opt;
	char modellist[UCVM_MAX_MODELLIST_LEN];
	char configfile[UCVM_MAX_PATH_LEN];
	double max_depth;
	double z_inter;
	double vs_thresh;
	double latlon[2];
	int nx = 0;
	int ny = 0;
	int currentline = 0;	// Current line we're working on.
	double spacing = 0;

	ucvm_ctype_t cmode;
	int have_model = 0;
	int have_map = 0;

	char map_label[UCVM_MAX_LABEL_LEN];

        char *binary_outfiles[DEFAULT_MAX_FILES];
        char *track_outfiles[2];
        char *ascii_outfile;
        char *ascii_meta_outfile;

        int i;
        // mpi related variables
	int numprocs, rank;
        const int charsperblob=DEFAULT_BLOB_LEN; // 70

	MPI_Init(&argc, &argv);
	MPI_Comm_size(MPI_COMM_WORLD, &numprocs);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);

        MPI_Datatype blob_as_string;
        MPI_Type_contiguous(charsperblob, MPI_CHAR, &blob_as_string);
        MPI_Type_commit(&blob_as_string);

	cmode = UCVM_COORD_GEO_DEPTH;
	snprintf(configfile, UCVM_MAX_PATH_LEN, "%s", "./ucvm.conf");
	snprintf(modellist, UCVM_MAX_MODELLIST_LEN, "%s", "1d");
	snprintf(map_label, UCVM_MAX_LABEL_LEN, "%s", UCVM_MAP_UCVM);
	max_depth = DEFAULT_MAX_DEPTH;
	z_inter = DEFAULT_Z_INTERVAL;
	vs_thresh = DEFAULT_VS_THRESH;
        // initialize the result file names to null strings
	for( i=0 ; i < DEFAULT_MAX_FILES ; i++ ) {
          binary_outfiles[i] = "";
        }
        ascii_outfile = "";
        ascii_meta_outfile = "";
        track_outfiles[0] = ""; // result ascii file
        track_outfiles[1] = ""; // result ascii meta file

	/* Parse options */
	while ((opt = getopt(argc, argv, "hb:o:m:f:d:i:v:l:s:x:y:")) != -1) {
		switch (opt) {
		case 'h':
			usage();
			exit(0);
			break;
		case 'b':
                        parse_file_list(optarg,binary_outfiles);
			break;
		case 'o':
                        parse_file_list(optarg,track_outfiles);
                        ascii_outfile = track_outfiles[0];
                        ascii_meta_outfile = track_outfiles[1];
			break;
		case 'm':
			if (strlen(optarg) >= UCVM_MAX_MODELLIST_LEN - 1) {
				fprintf(stderr, "Model list is too long.\n");
				usage();
				exit(1);
			} else {
				snprintf(modellist, UCVM_MAX_MODELLIST_LEN, "%s", optarg);
				have_model = 1;
			}
			break;
		case 'f':
			if (strlen(optarg) < UCVM_MAX_PATH_LEN) {
				snprintf(configfile, UCVM_MAX_PATH_LEN, "%s", optarg);
			} else {
				fprintf(stderr, "Invalid config file specified: %s.\n", optarg);
				usage();
				exit(1);
			}
			break;
		case 'd':
			max_depth = (double) atof(optarg);
			if (max_depth <= DEFAULT_ZERO_DEPTH) {
				fprintf(stderr, "Invalid max depth %s.\n", optarg);
				usage();
				exit(1);
			}
			break;
		case 'i':
			z_inter = (double) atof(optarg);
			if (z_inter <= 0.0) {
				fprintf(stderr, "Invalid z interval %s.\n", optarg);
				usage();
				exit(1);
			}
			break;
		case 'v':
			vs_thresh = (double) atof(optarg);
			if (vs_thresh <= DEFAULT_ZERO_DEPTH) {
				fprintf(stderr, "Invalid vs threshold %s.\n", optarg);
				usage();
				exit(1);
			}
			break;
		case 'l':
			if (list_parse(optarg, UCVM_MAX_PATH_LEN,
					       latlon, 2) != UCVM_CODE_SUCCESS) {
				fprintf(stderr, "Invalid lat, lon range specified: %s.\n", optarg);
				usage();
				exit(1);
			}
			break;
		case 's':
			spacing = (double) atof(optarg);
			if (spacing <= 0.0) {
				fprintf(stderr, "Invalid spacing %s", optarg);
				usage();
				exit(1);
			}
			break;
		case 'x':
			nx = (int) atoi(optarg);
			if (nx <= 0) {
				fprintf(stderr, "Invalid number of x points %s", optarg);
				usage();
				exit(1);
			}
			break;
		case 'y':
			ny = (int) atoi(optarg);
			if (ny <= 0) {
				fprintf(stderr, "Invalid number of x points %s", optarg);
				usage();
				exit(1);
			}
			break;
		default: /* '?' */
			usage();
			exit(1);
		}
	}

	/* Initialize interface */
	if (ucvm_init(configfile) != UCVM_CODE_SUCCESS) {
		fprintf(stderr, "Failed to initialize UCVM API\n");
		return (1);
	}

	/* Add models */
	if (have_model == 0) {
		/* Add default model if none specified */
		fprintf(stderr, "Using 1D as default model.\n");
	}
	if (ucvm_add_model_list(modellist) != UCVM_CODE_SUCCESS) {
		fprintf(stderr, "Failed to enable model list %s\n", modellist);
		return (1);
	}

	/* Set user map if necessary */
	if (have_map == 1) {
		if (ucvm_use_map(map_label) != UCVM_CODE_SUCCESS) {
			fprintf(stderr, "Failed to set user map %s\n", map_label);
			return (1);
		}
	}

	/* Set z mode for depth*/
	if (ucvm_setparam(UCVM_MODEL_PARAM_QUERY_MODE, cmode) != UCVM_CODE_SUCCESS) {
		fprintf(stderr, "Failed to set z mode\n");
		return (1);
	}

	MPI_Barrier(MPI_COMM_WORLD);

        MPI_File bfh[DEFAULT_MAX_FILES];
        MPI_File afh = NULL; // ascii result file (raw crossing data file)
        MPI_File mfh = NULL; // ascii meta file (in json)

        /* display the config data */
	if(rank == 0) {
		printf("Metadata:\n"); 
		float lat1 = latlon[0];
		float lat2 = (ny * spacing) + lat1;
                float lon1 = latlon[1];
                float lon2 = (nx * spacing) + lon1;
                // spacing
                printf("x:%d\n", nx);
                printf("y:%d\n", ny);
                printf("lat1:%f\n", lat1);
                printf("lat2: %f\n", lat2);
                printf("lon1: %f\n", lon1);
                printf("lon2: %f\n", lon2);
                printf("spacing: %f\n", spacing);
                printf("cvm_selected: %s\n", modellist);
                printf("\nparams: -b %f,%f -u %f,%f -c %s -s %f -x %d -y %d\n",
                         lat1,lon1,lat2,lon2,modellist,spacing,nx,ny);

                /* produce the meta data in json.. */

                // 10 chars per float, 1 for comma, 1 for decimal point, 1 for sign
                char *lonlist= (char *)malloc(nx * (13)+10);
                char *latlist= (char *)malloc(ny * (13)+10);
                if(latlist == NULL || lonlist == NULL) {
                    fprintf(stderr," fail to latlist or lonlist..\n");
                    exit(1);
                }
                latlist[0]='\0';
                lonlist[0]='\0';
                int ii;
                // pnts.coord's format is coord[0] is the lon, ccord[1] is the lat
		for (ii = 0; ii < ny; ii++) {
                   double tlat= (double) (ii * spacing) + latlon[0];
                   if(ii==0) {
                       sprintf(latlist,"%10.4f",tlat);
                       } else {
                           sprintf(latlist,"%s,%10.4f",latlist,tlat);
                   }
                }
		for (ii = 0; ii < nx; ii++) {
                   double tlon= (double) (ii * spacing) + latlon[1];
                   
                   if(ii==0) {
                       sprintf(lonlist,"%10.4f",tlon);
                       } else {
                           sprintf(lonlist,"%s,%10.4f",lonlist,tlon);
                   }
                }
                
                if(ascii_meta_outfile != 0 && strlen(ascii_meta_outfile) > 0) { 
                // a guess of how big the blob is..
                    int meta_sz=(int) strlen(latlist)+(int)strlen(lonlist)+ META_BASE_LEN;
		    char *meta_blob=(char *)malloc(meta_sz*sizeof(char));
                    if (meta_blob == NULL ) {
                        fprintf(stderr,"failed to reesrve meta blob \n");
                        exit(1);
                    }
		    sprintf(meta_blob,"{\"spacing\":%10.4f,\
			\"bottom-left lat\":%10.4f,\"bottom-left lon\":%10.4f,\
			\"upper-right lat\":%10.4f,\"upper-right lon\":%10.4f,\
			\"cvm_selected\":\"%s\",\"config\": \"%s\",\
			\"max depth\":%10.4f,\"vs threshold\":%10.4f,\
			\"nx\":%4d,\"ny\":%4d, \"lat_list\":[%s],\"lon_list\":[%s]}\n",
                    spacing,
                    lat1,lon1,
                    lat2,lon2,
                    modellist,configfile,
                    max_depth,vs_thresh,
                    nx,ny,latlist,lonlist);

		    MPI_File_open(MPI_COMM_SELF, ascii_meta_outfile, MPI_MODE_CREATE | MPI_MODE_WRONLY, MPI_INFO_NULL, &mfh);
		    MPI_File_write(mfh, meta_blob, (int)strlen(meta_blob) * sizeof(char), MPI_CHAR, MPI_STATUS_IGNORE);
                    free(meta_blob);
                    free(latlist);
                    free(lonlist);
		    } else {
			mfh=NULL;
	        }
	}

        /* setup result file handler */
	for( i=0 ; i < DEFAULT_MAX_FILES ; i++ ) {
		if(binary_outfiles[i] != 0 && strlen(binary_outfiles[i]) > 0) { 
			MPI_File_open(MPI_COMM_SELF, binary_outfiles[i], MPI_MODE_CREATE | MPI_MODE_WRONLY, MPI_INFO_NULL, &bfh[i]);
			} else {
				bfh[i]=NULL;
		}
	}
        if(ascii_outfile !=0 && strlen(ascii_outfile) > 0) { 
		MPI_File_open(MPI_COMM_SELF, ascii_outfile, MPI_MODE_CREATE | MPI_MODE_WRONLY, MPI_INFO_NULL, &afh);
		} else {
			afh=NULL;
	}

	// We divide the job up in terms of lines (i.e. ny).
	currentline = rank;

	while (currentline < ny) {
		ucvm_point_t *pnts = malloc(sizeof(ucvm_point_t));
                if(pnts == NULL) {
                    fprintf(stderr," fail to pnts..\n");
                    exit(1);
                }
		double tempDepths[9];
		float *retDepths = malloc(nx * sizeof(float));
		float *retSecondDepths = malloc(nx * sizeof(float));
		float *retLastDepths = malloc(nx * sizeof(float));
		float *retSecondOnlyDepths = malloc(nx * sizeof(float));
		float *retThirdLastDepths = malloc(nx * sizeof(float));
                char *retLiteral= malloc(((DEFAULT_BLOB_LEN * nx)+1) * sizeof(char));
                if(retLiteral == NULL) {
                    fprintf(stderr," fail to reserve big data for retLiteral..\n");
                    exit(1);
                }

		printf("Current line: %d. Progress: %.2f%%\n", currentline, 
(float) currentline / (float)ny  * 100.0f);

		for (i = 0; i < nx; i++) {
                        // pnts.coord's format is coord[0] is the lon, ccord[1] is the lat
			pnts[0].coord[1] = (currentline * spacing) + latlon[0];
			pnts[0].coord[0] = (i * spacing) + latlon[1];

			int cross_cnt=extract_basin_mpi(pnts, tempDepths, max_depth, z_inter, vs_thresh);
			retDepths[i] = (float)tempDepths[4];
			retSecondDepths[i] = (float)tempDepths[5];
			retLastDepths[i] = (float)tempDepths[6];
			retSecondOnlyDepths[i] = (float)tempDepths[7];
			retThirdLastDepths[i] = (float)tempDepths[8];
			if(afh != NULL) {
                                int idx=i*charsperblob;
				sprintf(&retLiteral[idx], BLOB_FMT, pnts[0].coord[0], pnts[0].coord[1], 
                                        cross_cnt, (float)tempDepths[0], (float)tempDepths[1],
                                        (float)tempDepths[2], (float)tempDepths[3]);
			}
		}

                if(bfh[0] != NULL) {
		  MPI_File_set_view(bfh[0], currentline * nx * sizeof(float), MPI_FLOAT, MPI_FLOAT, "native", MPI_INFO_NULL);
		  MPI_File_write(bfh[0], /*currentline * nx * sizeof(float),*/ retDepths, nx, MPI_FLOAT, MPI_STATUS_IGNORE);
                }
                if(bfh[1] != NULL) {
		  MPI_File_set_view(bfh[1], currentline * nx * sizeof(float), MPI_FLOAT, MPI_FLOAT, "native", MPI_INFO_NULL);
		  MPI_File_write(bfh[1], /*currentline * nx * sizeof(float),*/ retSecondDepths, nx, MPI_FLOAT, MPI_STATUS_IGNORE);
                }
                if(bfh[2] != NULL) {
		  MPI_File_set_view(bfh[2], currentline * nx * sizeof(float), MPI_FLOAT, MPI_FLOAT, "native", MPI_INFO_NULL);
		  MPI_File_write(bfh[2], /*currentline * nx * sizeof(float),*/ retLastDepths, nx, MPI_FLOAT, MPI_STATUS_IGNORE);
                }
                if(bfh[3] != NULL) {
		  MPI_File_set_view(bfh[3], currentline * nx * sizeof(float), MPI_FLOAT, MPI_FLOAT, "native", MPI_INFO_NULL);
		  MPI_File_write(bfh[3], /*currentline * nx * sizeof(float),*/ retSecondOnlyDepths, nx, MPI_FLOAT, MPI_STATUS_IGNORE);
                }
                if(bfh[4] != NULL) {
		  MPI_File_set_view(bfh[4], currentline * nx * sizeof(float), MPI_FLOAT, MPI_FLOAT, "native", MPI_INFO_NULL);
		  MPI_File_write(bfh[4], /*currentline * nx * sizeof(float),*/ retThirdLastDepths, nx, MPI_FLOAT, MPI_STATUS_IGNORE);
                }
// XXX write out ascii 
		if(afh != NULL) {
			//create ftype for our segment
                        MPI_Datatype localarray;
			int startrow=currentline*nx;
			int globalsizes[2] = {nx*ny, 1};
			int localsizes [2] = {nx, 1};
			int starts[2]      = {startrow, 0};
			int order          = MPI_ORDER_C;

			MPI_Type_create_subarray(2, globalsizes, localsizes, starts, order, blob_as_string, &localarray);
			MPI_Type_commit(&localarray);

			MPI_File_set_view(afh, 0,  MPI_CHAR, localarray,
                           "native", MPI_INFO_NULL);

			MPI_File_write(afh, retLiteral, nx, blob_as_string, MPI_STATUS_IGNORE);
 		        int ferror=MPI_Type_free(&localarray);
			if (ferror != MPI_SUCCESS) {
      				fprintf(stderr, "Fail to free localarray properly\n");
			}
		}

		free(pnts);
		free(retDepths);
		free(retLastDepths);
		free(retSecondDepths);
                free(retLiteral);

		currentline += numprocs;

	}

	ucvm_finalize();

	MPI_Barrier(MPI_COMM_WORLD);

	if(bfh[0] != NULL) {
		MPI_File_close(&bfh[0]);
	}
	if(bfh[1] != NULL) {
		MPI_File_close(&bfh[1]);
	}
	if(bfh[2] != NULL) {
		MPI_File_close(&bfh[2]);
	}
	if(bfh[3] != NULL) {
		MPI_File_close(&bfh[3]);
	}
	if(bfh[4] != NULL) {
		MPI_File_close(&bfh[4]);
	}
        if(afh != NULL) {
		MPI_File_close(&afh);
	}
        if(mfh != NULL) {
		MPI_File_close(&mfh);
	}
	MPI_Type_free(&blob_as_string);
    
	MPI_Finalize();

	return (0);
}
