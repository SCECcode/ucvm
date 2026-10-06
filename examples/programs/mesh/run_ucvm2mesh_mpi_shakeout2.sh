#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

rm -rf ucvm2mesh_mpi ucvm.conf shakeout2.conf shakeout2.grid shakeout2.mesh*

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
SCRATCH=./scratch
TEST=ucvm2mesh_mpi_shakeout2

cp ${BIN_DIR}/ucvm2mesh_mpi .
cp ${CONF_DIR}/ucvm.conf .

sed 's ${CONF_DIR} '$CONF_DIR' ' shakeout2.conf_template | sed 's ${SCRATCH} '$SCRATCH' ' > shakeout2.conf

salloc ${UCVM_SALLOC_ENV} -Q  --nodes=2 --ntasks=16 --time=00:30:00 srun -Q -o ${TEST}.srun.out ${BIN_DIR}/ucvm2mesh_mpi -f shakeout2.conf


expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

od -N 100 shakeout2.media_vs |head -10 | sed 's/ //g' > $result 2>& 1

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

