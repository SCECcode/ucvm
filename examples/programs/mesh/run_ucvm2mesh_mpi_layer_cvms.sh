#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
SCRATCH=./scratch
TEST=ucvm2mesh_mpi_layer_cvms

rm -rf la_habra_cvms.grid la_habra_cvms.media la_habra_cvms.conf ucvm2mesh_mpi_layer ucvm.conf

cp ${BIN_DIR}/ucvm2mesh_mpi_layer .
cp ${CONF_DIR}/ucvm.conf .

sed 's ${CONF_DIR} '$CONF_DIR' ' la_habra_cvms.conf_template | sed 's ${SCRATCH} '$SCRATCH' '  > la_habra_cvms.conf

salloc ${UCVM_SALLOC_ENV} -Q --nodes=2 --ntasks=4 --time=00:30:00 srun -Q -o ${TEST}_1.srun.out ./ucvm2mesh_mpi_layer -f la_habra_cvms.conf -l 1 -c 3
salloc ${UCVM_SALLOC_ENV} -Q --nodes=1 --ntasks=4 --time=00:30:00 srun -Q -o ${TEST}_2.srun.out ./ucvm2mesh_mpi_layer -f la_habra_cvms.conf -l 4 -c 3 
salloc ${UCVM_SALLOC_ENV} -Q --nodes=1 --ntasks=4 --time=00:30:00 srun -Q -o ${TEST}_3.srun.out ./ucvm2mesh_mpi_layer -f la_habra_cvms.conf -l 7 -c 4 

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

od -N 100 la_habra_cvms.media_vs |head -10 | sed 's/ //g' > $result 2>& 1

cat > $expect << EOF_EXPECTED_RESULT
EOF_EXPECTED_RESULT

cp $expect ee

echo "Running examples_programs_mesh" ${TEST}
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit
