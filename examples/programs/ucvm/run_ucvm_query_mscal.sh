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
 -116.9050    36.7250      0.000   1185.364    710.100      mscal   5254.287   3112.362   2574.641       none      0.000      0.000      0.000      crust   5254.287   3112.362   2574.641
 -116.9050    36.7250    500.000   1185.364    710.100      mscal   5264.078   3119.203   2576.494       none      0.000      0.000      0.000      crust   5264.078   3119.203   2576.494
 -116.9050    36.7250   1000.000   1185.364    710.100      mscal   5312.495   3150.845   2586.053       none      0.000      0.000      0.000      crust   5312.495   3150.845   2586.053
 -116.9050    36.7250   2000.000   1185.364    710.100      mscal   5460.318   3219.169   2607.883       none      0.000      0.000      0.000      crust   5460.318   3219.169   2607.883
 -116.9050    36.7250   3000.000   1185.364    710.100      mscal   5556.603   3235.426   2612.789       none      0.000      0.000      0.000      crust   5556.603   3235.426   2612.789
 -116.9050    36.7250   5000.000   1185.364    710.100      mscal   5704.692   3237.023   2611.861       none      0.000      0.000      0.000      crust   5704.692   3237.023   2611.861
EOF_EXPECTED_RESULT


echo "Running examples_programs_ucvm ucvm_query_mscal"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

