#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
SCRATCH=./scratch

sed 's ${CONF_DIR} '$CONF_DIR' ' southbay_sfcvm.conf_template | sed 's ${SCRATCH} '$SCRATCH' ' > southbay_sfcvm.conf

${BIN_DIR}/ucvm2mesh -f southbay_sfcvm.conf > southbay_sfcvm.out 2>& 1 

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

od -N 100 southbay_sfcvm.media_vs |head -10 | sed 's/ //g' > $result 2>& 1

cat > $expect << EOF_EXPECTED_RESULT
0000000047666042225047666042225047666042225047666042225
*
0000140047666042225
0000144
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm2mesh ucvm2mesh_sfcvm"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit


