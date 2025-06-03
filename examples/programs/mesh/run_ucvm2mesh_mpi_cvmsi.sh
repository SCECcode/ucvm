#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

rm -rf ucvm2mesh_mpi ucvm.conf small-cvmsi.conf small_cvmsi.grid small_cvmsi.media*

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
SCRATCH=./scratch
TEST=ucvm2mesh_mpi_cvmsi

cp ${BIN_DIR}/ucvm2mesh_mpi .
cp ${CONF_DIR}/ucvm.conf .

sed 's ${CONF_DIR} '$CONF_DIR' ' small_cvmsi.conf_template | sed 's ${SCRATCH} '$SCRATCH' ' > small_cvmsi.conf

salloc ${UCVM_SALLOC_ENV} -Q  --nodes=2 --ntasks=8 --time=00:30:00 srun -Q -o ${TEST}.srun.out ${BIN_DIR}/ucvm2mesh_mpi -f small_cvmsi.conf


expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

od -N 100 small_cvmsi.media_vs |head -10 | sed 's/ //g' > $result 2>& 1

cat > $expect << EOF_EXPECTED_RESULT
0000000015341041533015341041533015341041533017270041434
0000020017270041434017270041434017270041434017270041434
*
0000060017270041434017270041434051463041430051463041430
0000100051463041430051463041430051463041430051463041430
*
0000140051463041430
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

