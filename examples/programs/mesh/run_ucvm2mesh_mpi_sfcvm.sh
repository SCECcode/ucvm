#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
SCRATCH=./scratch
TEST=ucvm2mesh_mpi_sfcvm

rm -rf ucvm2mesh_mpi ucvm.conf southbay_sfcvm.conf southbay_sfcvm.grid southbay_sfcvm.media_*
rm -rf ${TEST}.srun.out ${TEST}.srun.err
rm -rf ${TEST}.timing

cp ${BIN_DIR}/ucvm2mesh_mpi .
cp ${CONF_DIR}/ucvm.conf .

sed 's ${CONF_DIR} '$CONF_DIR' ' southbay_sfcvm.conf_template | sed 's ${TYPE} '' ' | sed 's ${SCRATCH} '$SCRATCH' ' > southbay_sfcvm.conf

echo "start --${TEST}" `date` > ${TEST}.timing 

salloc ${UCVM_SALLOC_ENV} --job-name=${TEST} --comment=${TEST} --nodes=1 --ntasks=8 --time=00:40:00 srun -e ${TEST}.srun.err -o ${TEST}.srun.out ./ucvm2mesh_mpi -f ./southbay_sfcvm.conf

echo "done --${TEST}" `date` >> ${TEST}.timing

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

