#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=cvmhsbcbn

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvmhsbcbn_gd.txt  >> $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -118.0000    34.0000      0.000    281.668    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000     50.000    281.668    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000    100.000    281.668    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000    500.000    281.668    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000   1000.000    281.668    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
Using Geo Depth coordinates as default mode.
 -120.1108    34.2723      0.000   -572.000    180.000  cvmhsbcbn   1882.420    450.368   1850.282       none      0.000      0.000      0.000      crust   1882.420    450.368   1850.282
 -120.1108    34.2723    100.000   -572.000    180.000  cvmhsbcbn   1831.030    406.060   1824.675       none      0.000      0.000      0.000      crust   1831.030    406.060   1824.675
 -120.1108    34.2723    500.000   -572.000    180.000  cvmhsbcbn   1933.923    494.761   1875.004       none      0.000      0.000      0.000      crust   1933.923    494.761   1875.004
 -120.1108    34.2723   1000.000   -572.000    180.000  cvmhsbcbn   2190.633    716.063   1985.247       none      0.000      0.000      0.000      crust   2190.633    716.063   1985.247
 -120.1108    34.2723   2000.000   -572.000    180.000  cvmhsbcbn   2852.824   1286.918   2190.016       none      0.000      0.000      0.000      crust   2852.824   1286.918   2190.016
 -120.1108    34.2723  10000.000   -572.000    180.000  cvmhsbcbn   4805.236   2884.782   2505.538       none      0.000      0.000      0.000      crust   4805.236   2884.782   2505.538
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_cvmhsbcbn"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

