#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
SCRATCH=./scratch

sed 's ${CONF_DIR} '$CONF_DIR' ' small_cvmh.conf_template | sed 's ${SCRATCH} '$SCRATCH' ' > small_cvmh.conf

${BIN_DIR}/ucvm2mesh -f small_cvmh.conf > small_cvmh.out 2>& 1 

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

od small_cvmh.media_vs | sed 's/ //g' > $result 2>& 1

cat > $expect << EOF_EXPECTED_RESULT
0000000066006042464066006042464066006042464066006042464
*
0002440066006042464066006042464
0002450
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm2mesh ucvm2mesh_cvmh"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit


