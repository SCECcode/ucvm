#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=albacore

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_albacore.txt  > $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -121.9472    32.7000      0.000      0.000      0.000   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -121.9472    32.7000     50.000      0.000      0.000   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -121.9472    32.7000    100.000      0.000      0.000   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -121.9472    32.7000    500.000      0.000      0.000   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -121.9472    32.7000   1000.000      0.000      0.000   albacore   5859.139      0.000   2687.149       none      0.000      0.000      0.000      crust   5859.139      0.000   2687.149
 -121.9472    32.7000   2000.000      0.000      0.000   albacore   5991.222      0.000   2714.776       none      0.000      0.000      0.000      crust   5991.222      0.000   2714.776
 -124.6000    33.0000      0.000      0.000      0.000   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -124.6472    33.0000  15000.000      0.000      0.000   albacore   7293.158   4577.700   3055.686       none      0.000      0.000      0.000      crust   7293.158   4577.700   3055.686
 -124.4720    33.0000  15000.000      0.000      0.000   albacore   7847.532   4481.100   3237.542       none      0.000      0.000      0.000      crust   7847.532   4481.100   3237.542
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_albacore"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

