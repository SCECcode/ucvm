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
MODEL=muscal

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_muscal_gd.txt  > $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -116.9050    36.7250      0.000   1185.364    710.100     muscal   1676.731    583.742   1753.186       none      0.000      0.000      0.000      crust   1676.731    583.742   1753.186
 -116.9050    36.7250    500.000   1185.364    710.100     muscal   4854.413   2742.464   2509.610       none      0.000      0.000      0.000      crust   4854.413   2742.464   2509.610
 -116.9050    36.7250   1000.000   1185.364    710.100     muscal   5222.892   3098.306   2559.885       none      0.000      0.000      0.000      crust   5222.892   3098.306   2559.885
 -116.9050    36.7250   2000.000   1185.364    710.100     muscal   5401.417   3179.707   2586.476       none      0.000      0.000      0.000      crust   5401.417   3179.707   2586.476
 -116.9050    36.7250   3000.000   1185.364    710.100     muscal   5514.726   3195.584   2591.813       none      0.000      0.000      0.000      crust   5514.726   3195.584   2591.813
 -116.9050    36.7250   5000.000   1185.364    710.100     muscal   5683.785   3187.503   2588.802       none      0.000      0.000      0.000      crust   5683.785   3187.503   2588.802
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_muscal"
if $DIFF $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

