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

od southbay_sfcvm.media_vs |head -10 | sed 's/ //g' > $result 2>& 1

cat > $expect << EOF_EXPECTED_RESULT
0000000047666042225047666042225047666042225047666042225
*
0000240047666042225047667042225047667042225047667042225
0000260047667042225047667042225047667042225047667042225
0000300047667042225047667042225047667042225171504042236
0000320106024042250150735042254142241042253062137042245
0000340175024042266110362042350176032042413127145042430
0000360127145042430127145042430127145042430127145042430
*
0001060047666042225047666042225047666042225047666042225
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm2mesh ucvm2mesh_sfcvm"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit


