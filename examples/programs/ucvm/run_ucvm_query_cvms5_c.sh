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
 -118.2851    34.0223      0.000     56.230    342.859      cvms5   1786.518    902.161   2057.181       none      0.000      0.000      0.000      crust   1786.518    902.161   2057.181
 -118.2851    34.0223    100.000     56.230    342.859      cvms5   1877.227    941.105   2076.003       none      0.000      0.000      0.000      crust   1877.227    941.105   2076.003
 -118.2851    34.0223   1000.000     56.230    342.859      cvms5   2453.579   1298.713   2209.976       none      0.000      0.000      0.000      crust   2453.579   1298.713   2209.976
 -118.2851    34.0223  10000.000     56.230    342.859      cvms5   6570.111   3702.746   2804.834       none      0.000      0.000      0.000      crust   6570.111   3702.746   2804.834
 -118.0642    34.2264      0.000   1702.420    732.543      cvms5   1432.789    839.239   2024.749       none      0.000      0.000      0.000      crust   1432.789    839.239   2024.749
 -118.0642    34.2264    100.000   1702.420    732.543      cvms5   2021.212   1131.715   2155.472       none      0.000      0.000      0.000      crust   2021.212   1131.715   2155.472
 -118.0642    34.2264   1000.000   1702.420    732.543      cvms5   4516.494   2413.833   2401.533       none      0.000      0.000      0.000      crust   4516.494   2413.833   2401.533
 -118.0642    34.2264  10000.000   1702.420    732.543      cvms5   7047.448   4105.768   3019.017       none      0.000      0.000      0.000      crust   7047.448   4105.768   3019.017
Using Geo Elevation coordinates as z mode.
 -118.2851    34.0223     56.230     56.230    342.859      cvms5   1786.518    902.161   2057.181       none      0.000      0.000      0.000      crust   1786.518    902.161   2057.181
 -118.2851    34.0223    -43.770     56.230    342.859      cvms5   1877.228    941.105   2076.003       none      0.000      0.000      0.000      crust   1877.228    941.105   2076.003
 -118.2851    34.0223   -943.770     56.230    342.859      cvms5   2453.579   1298.713   2209.976       none      0.000      0.000      0.000      crust   2453.579   1298.713   2209.976
 -118.2851    34.0223  -9943.770     56.230    342.859      cvms5   6570.111   3702.746   2804.834       none      0.000      0.000      0.000      crust   6570.111   3702.746   2804.834
 -118.0642    34.2264   1702.281   1702.420    732.543      cvms5   1433.605    839.644   2024.967       none      0.000      0.000      0.000      crust   1433.605    839.644   2024.967
 -118.0642    34.2264   1602.281   1702.420    732.543      cvms5   2022.028   1132.121   2155.620       none      0.000      0.000      0.000      crust   2022.028   1132.121   2155.620
 -118.0642    34.2264    702.281   1702.420    732.543      cvms5   4516.580   2413.903   2401.544       none      0.000      0.000      0.000      crust   4516.580   2413.903   2401.544
 -118.0642    34.2264  -8297.719   1702.420    732.543      cvms5   7047.434   4105.757   3019.011       none      0.000      0.000      0.000      crust   7047.434   4105.757   3019.011
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_cvms5_c"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

