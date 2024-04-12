#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=sfcvm

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_sfcvm_gd.txt  >> $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -118.0000    34.0000      0.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000     50.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000    100.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000    500.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000   1000.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
Using Geo Depth coordinates as default mode.
 -122.2878    37.8661      0.000     21.814    290.260      sfcvm    738.580     80.687   1609.046       none      0.000      0.000      0.000      crust    738.580     80.687   1609.046
 -122.2878    37.8661    500.000     21.814    290.260      sfcvm   3530.445   1882.093   2656.129       none      0.000      0.000      0.000      crust   3530.445   1882.093   2656.129
 -122.2878    37.8661   1000.000     21.814    290.260      sfcvm   4530.200   2692.856   2656.129       none      0.000      0.000      0.000      crust   4530.200   2692.856   2656.129
 -122.2878    37.8661   3000.000     21.814    290.260      sfcvm   5430.078   3263.745   2656.139       none      0.000      0.000      0.000      crust   5430.078   3263.745   2656.139
 -122.2878    37.8661   5000.000     21.814    290.260      sfcvm   5547.732   3326.787   2670.411       none      0.000      0.000      0.000      crust   5547.732   3326.787   2670.411
 -122.1535    37.5291      0.000     -1.000    180.000      sfcvm   1431.260    143.094   1902.983       none      0.000      0.000      0.000      crust   1431.260    143.094   1902.983
 -122.1535    37.5291    500.000     -1.000    180.000      sfcvm   3530.072   1881.752   2656.129       none      0.000      0.000      0.000      crust   3530.072   1881.752   2656.129
 -122.1535    37.5291   1000.000     -1.000    180.000      sfcvm   4527.325   2690.766   2656.129       none      0.000      0.000      0.000      crust   4527.325   2690.766   2656.129
 -122.1535    37.5291   3000.000     -1.000    180.000      sfcvm   5429.323   3263.332   2656.141       none      0.000      0.000      0.000      crust   5429.323   3263.332   2656.141
 -122.1535    37.5291   5000.000     -1.000    180.000      sfcvm   5547.592   3326.714   2670.394       none      0.000      0.000      0.000      crust   5547.592   3326.714   2670.394
 -121.4809    36.2370      0.000    252.237    385.100      sfcvm   1506.041    340.593   2669.734       none      0.000      0.000      0.000      crust   1506.041    340.593   2669.734
 -121.4809    36.2370    500.000    252.237    385.100      sfcvm   4006.390   2287.042   2669.734       none      0.000      0.000      0.000      crust   4006.390   2287.042   2669.734
 -121.4809    36.2370   1000.000    252.237    385.100      sfcvm   4662.780   2787.297   2669.734       none      0.000      0.000      0.000      crust   4662.780   2787.297   2669.734
 -121.4809    36.2370   3000.000    252.237    385.100      sfcvm   5642.359   3375.803   2670.110       none      0.000      0.000      0.000      crust   5642.359   3375.803   2670.110
 -121.4809    36.2370   5000.000    252.237    385.100      sfcvm   5802.949   3455.845   2696.286       none      0.000      0.000      0.000      crust   5802.949   3455.845   2696.286
 -120.0850    37.2060      0.000    122.967    517.530      sfcvm   4200.194   2442.900   2756.835       none      0.000      0.000      0.000      crust   4200.194   2442.900   2756.835
 -120.0850    37.2060    500.000    122.967    517.530      sfcvm   4296.774   2518.162   2764.185       none      0.000      0.000      0.000      crust   4296.774   2518.162   2764.185
 -120.0850    37.2060   1000.000    122.967    517.530      sfcvm   4393.548   2591.856   2771.549       none      0.000      0.000      0.000      crust   4393.548   2591.856   2771.549
 -120.0850    37.2060   3000.000    122.967    517.530      sfcvm   4780.645   2868.252   2801.007       none      0.000      0.000      0.000      crust   4780.645   2868.252   2801.007
 -120.0850    37.2060   5000.000    122.967    517.530      sfcvm   5167.742   3114.062   2830.465       none      0.000      0.000      0.000      crust   5167.742   3114.062   2830.465
 -121.8143    36.6509      0.000     43.756    313.533      sfcvm    738.589     80.694   1609.049       none      0.000      0.000      0.000      crust    738.589     80.694   1609.049
 -121.8143    36.6509    500.000     43.756    313.533      sfcvm   2400.544    903.223   2165.842       none      0.000      0.000      0.000      crust   2400.544    903.223   2165.842
 -121.8143    36.6509   1000.000     43.756    313.533      sfcvm   2849.795   1280.535   2260.751       none      0.000      0.000      0.000      crust   2849.795   1280.535   2260.751
 -121.8143    36.6509   3000.000     43.756    313.533      sfcvm   5640.219   3374.711   2669.769       none      0.000      0.000      0.000      crust   5640.219   3374.711   2669.769
 -121.8143    36.6509   5000.000     43.756    313.533      sfcvm   5800.279   3454.544   2695.841       none      0.000      0.000      0.000      crust   5800.279   3454.544   2695.841
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_sfcvm"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

