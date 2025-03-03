#!/bin/bash
## 
## example of running on usc/hpc cluster
##

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST=basin_query_mpi_sfcvm_cvmsi

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

salloc ${UCVM_SALLOC_ENV} -Q --nodes=1 --ntasks=2 --time=00:10:00 srun -Q -o ${TEST}.srun.out ${BIN_DIR}/basin_query_mpi -b ${TEST}.simple -f ${CONF_DIR}/ucvm.conf -m sfcvm,cvmsi -i 20 -v 2500 -l 35.0,-122.5 -s 0.1 -x 16 -y 11

od ${TEST}.simple > $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
EOF_EXPECTED_RESULT

echo "Running examples_programs_basin basin_query_mpi_sfcvm_cvmsi"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi
                               
trap 'rm -f "$expect" "$result"' exit



