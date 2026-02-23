#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=uwpkfcvm

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_uwpkfcvm_gd.txt  >> $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -120.6295    35.8431      0.000    391.599    446.958   uwpkfcvm   1200.000   7260.000   1420.912       none      0.000      0.000      0.000      crust   1200.000   7260.000   1420.912
 -120.6295    35.8431    500.000    391.599    446.958   uwpkfcvm   1200.000   7260.000   1420.912       none      0.000      0.000      0.000      crust   1200.000   7260.000   1420.912
 -120.6295    35.8431   1000.000    391.599    446.958   uwpkfcvm   1200.000   7260.000   1420.912       none      0.000      0.000      0.000      crust   1200.000   7260.000   1420.912
 -120.6295    35.8431   3000.000    391.599    446.958   uwpkfcvm   2400.000      0.000   2060.951       none      0.000      0.000      0.000      crust   2400.000      0.000   2060.951
 -120.0239    35.9312      0.000    192.672    351.900   uwpkfcvm   1280.000   7300.000   1482.388       none      0.000      0.000      0.000      crust   1280.000   7300.000   1482.388
 -120.0239    35.9312    500.000    192.672    351.900   uwpkfcvm   1280.000   7300.000   1482.388       none      0.000      0.000      0.000      crust   1280.000   7300.000   1482.388
 -120.0239    35.9312   1000.000    192.672    351.900   uwpkfcvm   1280.000   7300.000   1482.388       none      0.000      0.000      0.000      crust   1280.000   7300.000   1482.388
 -120.0239    35.9312   3000.000    192.672    351.900   uwpkfcvm   1930.000   2566.774   1873.153       none      0.000      0.000      0.000      crust   1930.000   2566.774   1873.153
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_uwpkfcvm"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

