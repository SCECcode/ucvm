#!/bin/bash
## 
## Script for running on OLCF Frontier
##
#
echo "Starting UCVM MPI Basin Query CVMS5 test"
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh
BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST=basin_query_mpi_cvms5
${BIN_DIR}/basin_query_mpi -b ${TEST}.simple -f ${CONF_DIR}/ucvm.conf -m cvms5 -i 20 -v 2500 -l 35.0,-122.5 -s 0.1 -x 16 -y 11
echo "Completed UCVM MPI Basin Query CVMS5 test"
