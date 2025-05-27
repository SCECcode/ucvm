#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
SCRATCH=./scratch

sed 's ${CONF_DIR} '$CONF_DIR' ' small_cvms5.conf_template | sed 's ${SCRATCH} '$SCRATCH' ' > small_cvms5.conf

${BIN_DIR}/ucvm2mesh -f small_cvms5.conf > small_cvms5.out 2>& 1 

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

od -N 100 small_cvms5.media_vs |head -10 | sed 's/ //g' > $result 2>& 1

cat > $expect << EOF_EXPECTED_RESULT
0000000153636042506167074042506002327042507015557042507
0000020031003042507045131042507013017042507026037042507
0000040041053042507054064042507067072042507102757042507
0000060052123042507064735042507077543042507112347042507
0000100125150042507140605042507111232042507123636042507
0000120136237042507150635042507163230042507176435042507
0000140150343042507
0000144
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm2mesh ucvm2mesh_cvms5"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit


