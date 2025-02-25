#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=cvms5

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -c gd -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvms5_gd.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -c ge -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvms5_ge.txt  >> $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as z mode.
 -118.2851    34.0223      0.000     56.230    342.859      cvms5   1787.330    902.787   2057.491       none      0.000      0.000      0.000      crust   1787.330    902.787   2057.491
 -118.2851    34.0223    100.000     56.230    342.859      cvms5   1878.273    941.860   2076.359       none      0.000      0.000      0.000      crust   1878.273    941.860   2076.359
 -118.2851    34.0223   1000.000     56.230    342.859      cvms5   2456.188   1300.301   2210.436       none      0.000      0.000      0.000      crust   2456.188   1300.301   2210.436
 -118.2851    34.0223  10000.000     56.230    342.859      cvms5   6572.767   3704.526   2805.711       none      0.000      0.000      0.000      crust   6572.767   3704.526   2805.711
 -118.0642    34.2264      0.000   1702.420    732.543      cvms5   1431.677    839.208   2024.733       none      0.000      0.000      0.000      crust   1431.677    839.208   2024.733
 -118.0642    34.2264    100.000   1702.420    732.543      cvms5   2019.981   1131.289   2155.316       none      0.000      0.000      0.000      crust   2019.981   1131.289   2155.316
 -118.0642    34.2264   1000.000   1702.420    732.543      cvms5   4514.697   2411.498   2401.167       none      0.000      0.000      0.000      crust   4514.697   2411.498   2401.167
 -118.0642    34.2264  10000.000   1702.420    732.543      cvms5   7047.123   4105.466   3018.849       none      0.000      0.000      0.000      crust   7047.123   4105.466   3018.849
Using Geo Elevation coordinates as z mode.
 -118.2851    34.0223     56.230     56.230    342.859      cvms5   1787.330    902.787   2057.491       none      0.000      0.000      0.000      crust   1787.330    902.787   2057.491
 -118.2851    34.0223    -43.770     56.230    342.859      cvms5   1878.273    941.860   2076.359       none      0.000      0.000      0.000      crust   1878.273    941.860   2076.359
 -118.2851    34.0223   -943.770     56.230    342.859      cvms5   2456.188   1300.301   2210.436       none      0.000      0.000      0.000      crust   2456.188   1300.301   2210.436
 -118.2851    34.0223  -9943.770     56.230    342.859      cvms5   6572.767   3704.526   2805.711       none      0.000      0.000      0.000      crust   6572.767   3704.526   2805.711
 -118.0642    34.2264   1702.281   1702.420    732.543      cvms5   1432.493    839.613   2024.950       none      0.000      0.000      0.000      crust   1432.493    839.613   2024.950
 -118.0642    34.2264   1602.281   1702.420    732.543      cvms5   2020.797   1131.694   2155.464       none      0.000      0.000      0.000      crust   2020.797   1131.694   2155.464
 -118.0642    34.2264    702.281   1702.420    732.543      cvms5   4514.783   2411.567   2401.178       none      0.000      0.000      0.000      crust   4514.783   2411.567   2401.178
 -118.0642    34.2264  -8297.719   1702.420    732.543      cvms5   7047.109   4105.454   3018.842       none      0.000      0.000      0.000      crust   7047.109   4105.454   3018.842
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_cvms5_c"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

