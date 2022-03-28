#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=cvmhsgbn

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvmhsgbn_gd.txt  >> $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -118.0000    34.0000      0.000    281.668    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000     50.000    281.668    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000    100.000    281.668    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000    500.000    281.668    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000   1000.000    281.668    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
Using Geo Depth coordinates as default mode.
 -118.0000    34.1000      0.000    104.143    302.225   cvmhsgbn   1746.854    333.495   1780.623       none      0.000      0.000      0.000      crust   1746.854    333.495   1780.623
 -118.0000    34.1000     50.000    104.143    302.225   cvmhsgbn   1746.854    333.495   1780.623       none      0.000      0.000      0.000      crust   1746.854    333.495   1780.623
 -118.0000    34.1000    104.143    104.143    302.225   cvmhsgbn   1890.558    457.378   1854.250       none      0.000      0.000      0.000      crust   1890.558    457.378   1854.250
 -118.0000    34.1000    200.000    104.143    302.225   cvmhsgbn   2026.609    574.663   1917.221       none      0.000      0.000      0.000      crust   2026.609    574.663   1917.221
 -118.0000    34.1000   1000.000    104.143    302.225   cvmhsgbn   2780.831   1224.854   2172.179       none      0.000      0.000      0.000      crust   2780.831   1224.854   2172.179
 -118.0000    34.1000   2000.000    104.143    302.225   cvmhsgbn   2827.529   1265.111   2183.850       none      0.000      0.000      0.000      crust   2827.529   1265.111   2183.850
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_cvmhsgbn"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

