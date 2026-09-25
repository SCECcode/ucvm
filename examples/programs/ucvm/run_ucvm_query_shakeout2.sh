#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
DIFF=${UCVM_INSTALL_PATH}/utilities/ucvm_query_diff.sh
MODEL=shakeout2

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_shakeout2_gd.txt  > $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -116.9050    36.7250      0.000   1185.364    710.100  shakeout2    849.241    211.126   1109.184       none      0.000      0.000      0.000      crust    849.241    211.126   1109.184
 -116.9050    36.7250    500.000   1185.364    710.100  shakeout2   4692.402   2699.951   2489.237       none      0.000      0.000      0.000      crust   4692.402   2699.951   2489.237
 -116.9050    36.7250   1000.000   1185.364    710.100  shakeout2   5098.623   3078.865   2726.226       none      0.000      0.000      0.000      crust   5098.623   3078.865   2726.226
 -116.9050    36.7250   2000.000   1185.364    710.100  shakeout2   5305.517   3173.575   2744.105       none      0.000      0.000      0.000      crust   5305.517   3173.575   2744.105
 -116.9050    36.7250   3000.000   1185.364    710.100  shakeout2   5453.005   3214.267   2761.985       none      0.000      0.000      0.000      crust   5453.005   3214.267   2761.985
 -116.9050    36.7250   5000.000   1185.364    710.100  shakeout2   5752.819   3317.160   2797.746       none      0.000      0.000      0.000      crust   5752.819   3317.160   2797.746
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_shakeout2"
if $DIFF $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

