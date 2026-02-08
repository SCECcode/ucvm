#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=mscal

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_mscal_gd.txt  > $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -116.9050    36.7250      0.000   1185.364    710.100      mscal   1631.996    550.910   1728.361       none      0.000      0.000      0.000      crust   1631.996    550.910   1728.361
 -116.9050    36.7250    500.000   1185.364    710.100      mscal   4828.786   2721.866   2506.248       none      0.000      0.000      0.000      crust   4828.786   2721.866   2506.248
 -116.9050    36.7250   1000.000   1185.364    710.100      mscal   5225.291   3103.188   2560.938       none      0.000      0.000      0.000      crust   5225.291   3103.188   2560.938
 -116.9050    36.7250   2000.000   1185.364    710.100      mscal   5403.293   3183.980   2587.518       none      0.000      0.000      0.000      crust   5403.293   3183.980   2587.518
 -116.9050    36.7250   3000.000   1185.364    710.100      mscal   5516.125   3197.979   2592.256       none      0.000      0.000      0.000      crust   5516.125   3197.979   2592.256
 -116.9050    36.7250   5000.000   1185.364    710.100      mscal   5679.873   3184.140   2587.300       none      0.000      0.000      0.000      crust   5679.873   3184.140   2587.300
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_mscal"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

