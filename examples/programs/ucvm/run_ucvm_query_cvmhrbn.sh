#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=cvmhrbn

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvmhrbn_gd.txt  >> $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -118.0000    34.0000      0.000    281.668    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000     50.000    281.668    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000    100.000    281.668    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000    500.000    281.668    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000   1000.000    281.668    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
Using Geo Depth coordinates as default mode.
 -118.8041    34.7863      0.000   1149.129    646.534    cvmhrbn   1865.575    435.840   1841.993       none      0.000      0.000      0.000      crust   1865.575    435.840   1841.993
 -118.8041    34.7863   1000.000   1149.129    646.534    cvmhrbn   2598.843   1067.968   2122.834       none      0.000      0.000      0.000      crust   2598.843   1067.968   2122.834
 -118.8041    34.7863   1149.129   1149.129    646.534    cvmhrbn   2750.201   1198.449   2164.314       none      0.000      0.000      0.000      crust   2750.201   1198.449   2164.314
 -118.8041    34.7863   1197.503   1149.129    646.534    cvmhrbn   2750.201   1198.449   2164.314       none      0.000      0.000      0.000      crust   2750.201   1198.449   2164.314
 -118.8041    34.7863   1500.000   1149.129    646.534    cvmhrbn   2827.212   1264.838   2183.772       none      0.000      0.000      0.000      crust   2827.212   1264.838   2183.772
 -118.8041    34.7863   2000.000   1149.129    646.534    cvmhrbn   3057.077   1462.997   2236.119       none      0.000      0.000      0.000      crust   3057.077   1462.997   2236.119
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_cvmhrbn"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

