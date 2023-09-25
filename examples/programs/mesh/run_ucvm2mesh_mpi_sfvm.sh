#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

rm -rf ucvm2mesh_mpi ucvm.conf southbay_sfcvm.conf southbay_sfcvm.grid southbay_sfcvm.media

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
SCRATCH=./scratch
TEST=ucvm2mesh_mpi_sfcvm

cp ${BIN_DIR}/ucvm2mesh_mpi .
cp ${CONF_DIR}/ucvm.conf .

sed 's ${CONF_DIR} '$CONF_DIR' ' southbay_sfcvm.conf_template | sed 's ${SCRATCH} '$SCRATCH' ' > southbay_sfcvm.conf

salloc ${UCVM_SALLOC_ENV} -Q  --nodes=2 --ntasks=8 --time=00:30:00 srun -Q -o ${TEST}.srun.out ${BIN_DIR}/ucvm2mesh_mpi -f southbay_sfcvm.conf


expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

od southbay_sfcvm.grid | head -20 > $result 2>& 1

cat > $expect << EOF_EXPECTED_RESULT
EOF_EXPECTED_RESULT

cp $result result

echo "Running examples_programs_mesh" ${TEST}
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

