#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=cvmhstbn

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvmhstbn_gd.txt  >> $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -118.0000    34.0000      0.000    281.668    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000     50.000    281.668    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000    100.000    281.668    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000    500.000    281.668    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000   1000.000    281.668    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
Using Geo Depth coordinates as default mode.
 -114.9664    32.1088      0.000     32.220    309.451   cvmhstbn   1603.060    209.535   1698.947       none      0.000      0.000      0.000      crust   1603.060    209.535   1698.947
 -114.9664    32.1088     20.000     32.220    309.451   cvmhstbn   1603.060    209.535   1698.947       none      0.000      0.000      0.000      crust   1603.060    209.535   1698.947
 -114.9664    32.1088     25.801     32.220    309.451   cvmhstbn   1603.060    209.535   1698.947       none      0.000      0.000      0.000      crust   1603.060    209.535   1698.947
 -114.9664    32.1088     32.220     32.220    309.451   cvmhstbn   1603.060    209.535   1698.947       none      0.000      0.000      0.000      crust   1603.060    209.535   1698.947
 -114.9664    32.1088    100.000     32.220    309.451   cvmhstbn   1600.000    206.897   1697.117       none      0.000      0.000      0.000      crust   1600.000    206.897   1697.117
 -114.9664    32.1088    500.000     32.220    309.451   cvmhstbn   1644.919    245.620   1723.592       none      0.000      0.000      0.000      crust   1644.919    245.620   1723.592
 -114.9664    32.1088   1000.000     32.220    309.451   cvmhstbn   2102.690    640.250   1949.795       none      0.000      0.000      0.000      crust   2102.690    640.250   1949.795
 -114.9664    32.1088   1500.000     32.220    309.451   cvmhstbn   2615.085   1081.970   2127.504       none      0.000      0.000      0.000      crust   2615.085   1081.970   2127.504
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_cvmhstbn"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

