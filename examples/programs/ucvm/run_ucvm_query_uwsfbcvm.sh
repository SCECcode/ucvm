#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=uwsfbcvm

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_uwsfbcvm_gd.txt  >> $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -118.0000    34.0000      0.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000     50.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000    100.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000    500.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000   1000.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
Using Geo Depth coordinates as default mode.
 -122.0870    37.8179      0.000    287.734    475.350   uwsfbcvm   3420.000   2016.000   2304.877       none      0.000      0.000      0.000      crust   3420.000   2016.000   2304.877
 -122.0870    37.8179    100.000    287.734    475.350   uwsfbcvm   3420.000   2016.000   2304.877       none      0.000      0.000      0.000      crust   3420.000   2016.000   2304.877
 -122.0870    37.8179    287.734    287.734    475.350   uwsfbcvm   3420.000   2016.000   2304.877       none      0.000      0.000      0.000      crust   3420.000   2016.000   2304.877
 -122.0870    37.8179    500.000    287.734    475.350   uwsfbcvm   3420.000   2016.000   2304.877       none      0.000      0.000      0.000      crust   3420.000   2016.000   2304.877
 -122.0870    37.8179   1000.000    287.734    475.350   uwsfbcvm   4732.000   2634.000   2494.909       none      0.000      0.000      0.000      crust   4732.000   2634.000   2494.909
 -122.0870    37.8179   2000.000    287.734    475.350   uwsfbcvm   4950.000   2641.000   2527.106       none      0.000      0.000      0.000      crust   4950.000   2641.000   2527.106
 -122.0870    37.8179   5000.000    287.734    475.350   uwsfbcvm   5338.000   3050.000   2589.559       none      0.000      0.000      0.000      crust   5338.000   3050.000   2589.559
 -121.5435    37.5720      0.000    790.849    733.400   uwsfbcvm   2702.000   1660.000   2151.588       none      0.000      0.000      0.000      crust   2702.000   1660.000   2151.588
 -121.5435    37.5720    500.000    790.849    733.400   uwsfbcvm   2702.000   1660.000   2151.588       none      0.000      0.000      0.000      crust   2702.000   1660.000   2151.588
 -121.5435    37.5720    790.849    790.849    733.400   uwsfbcvm   2702.000   1660.000   2151.588       none      0.000      0.000      0.000      crust   2702.000   1660.000   2151.588
 -121.5435    37.5720   1000.000    790.849    733.400   uwsfbcvm   3891.000   2389.000   2377.914       none      0.000      0.000      0.000      crust   3891.000   2389.000   2377.914
 -121.5435    37.5720   2000.000    790.849    733.400   uwsfbcvm   4108.000   2501.000   2408.353       none      0.000      0.000      0.000      crust   4108.000   2501.000   2408.353
 -121.5435    37.5720   5000.000    790.849    733.400   uwsfbcvm   5284.000   2859.000   2580.402       none      0.000      0.000      0.000      crust   5284.000   2859.000   2580.402
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_uwsfbcvm"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

