#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

rm -rf ucvm2mesh_mpi ucvm.conf la_habra_cvmsi.conf la_habra_cvmsi.grid la_habra_cvmsi.media*

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
SCRATCH=./scratch
PZ=2
TEST=ucvm2mesh_mpi_la_habra_cvmsi

cp ${BIN_DIR}/ucvm2mesh_mpi .
cp ${CONF_DIR}/ucvm.conf .

sed 's ${CONF_DIR} '$CONF_DIR' ' la_habra_cvmsi.conf_template | sed 's ${PZ} '${PZ}' ' | sed 's ${SCRATCH} '$SCRATCH' ' > la_habra_cvmsi.conf 

salloc ${UCVM_SALLOC_ENV} -Q  --nodes=2 --ntasks=8 --time=00:30:00 srun -e ${TEST}.srun.err -o ${TEST}.srun.out ${BIN_DIR}/ucvm2mesh_mpi -f la_habra_cvmsi.conf

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

## put a pollig wait
MAX_WAIT=30
ELAPSED=0
FILE="small_cvmsi.media_vs"
while [ ! -f "$FILE" ]; do
  if [ "$ELAPSED" -ge "$MAX_WAIT" ]; then
    echo "[ERROR] Timed out waiting for '${FILE}' after ${MAX_WAIT} seconds. Aborting."
    exit 1
  fi
  sleep 1
  ((ELAPSED++))
done

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

