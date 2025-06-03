#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
SCRATCH=./scratch
TEST=ucvm2mesh_mpi_layer_sfcvm

rm -rf southbay_sfcvm_layer.grid southbay_sfcvm.media_* southbay_sfcvm_layer.conf ucvm2mesh_mpi_layer ucvm.conf 

cp ${BIN_DIR}/ucvm2mesh_mpi_layer .
cp ${CONF_DIR}/ucvm.conf .

sed 's ${CONF_DIR} '$CONF_DIR' ' southbay_sfcvm.conf_template | sed 's ${TYPE} '_layer' ' | sed 's ${SCRATCH} '$SCRATCH' ' > southbay_sfcvm_layer.conf

salloc ${UCVM_SALLOC_ENV} -Q --nodes=2 --ntasks=4 --ntasks=4 --time=00:30:00 srun -Q -o ${TEST}_1.srun.out ./ucvm2mesh_mpi_layer -f southbay_sfcvm_layer.conf -l 1 -c 3
salloc ${UCVM_SALLOC_ENV} -Q --nodes=1 --ntasks=4 --time=00:30:00 srun -Q -o ${TEST}_2.srun.out ./ucvm2mesh_mpi_layer -f southbay_sfcvm_layer.conf -l 4 -c 3 
salloc ${UCVM_SALLOC_ENV} -Q --nodes=1 --ntasks=4 --time=00:30:00 srun -Q -o ${TEST}_3.srun.out ./ucvm2mesh_mpi_layer -f southbay_sfcvm_layer.conf -l 7 -c 4 

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

od -N 100 southbay_sfcvm.media_vs |head -10 | sed 's/ //g' > $result 2>& 1

cat > $expect << EOF_EXPECTED_RESULT
0000000047666042225047666042225047666042225047666042225
*
0000140047666042225
0000144
EOF_EXPECTED_RESULT

echo "Running examples_programs_mesh" ${TEST}
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

