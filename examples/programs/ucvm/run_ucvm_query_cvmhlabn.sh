#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=cvmhlabn

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons.txt  > $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -118.0000    34.0000      0.000    281.668    468.400       cvmh   2484.388    969.300   2088.316       none      0.000      0.000      0.000      crust   2484.388    969.300   2088.316
 -118.0000    34.0000     50.000    281.668    468.400       cvmh   2484.388    969.300   2088.316       none      0.000      0.000      0.000      crust   2484.388    969.300   2088.316
 -118.0000    34.0000    100.000    281.668    468.400       cvmh   2488.457    972.807   2089.593       none      0.000      0.000      0.000      crust   2488.457    972.807   2089.593
 -118.0000    34.0000    500.000    281.668    468.400       cvmh   2540.009   1017.249   2105.449       none      0.000      0.000      0.000      crust   2540.009   1017.249   2105.449
 -118.0000    34.0000   1000.000    281.668    468.400       cvmh   2634.464   1098.676   2133.005       none      0.000      0.000      0.000      crust   2634.464   1098.676   2133.005
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_cvmhlabn"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

