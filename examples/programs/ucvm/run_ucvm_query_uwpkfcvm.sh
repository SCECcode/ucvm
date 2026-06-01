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
MODEL=uwpkfcvm

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_uwpkfcvm_gd.txt  >> $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -118.0000    34.0000      0.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000     50.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000    100.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000    500.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000   1000.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
Using Geo Depth coordinates as default mode.
 -120.6295    35.8431      0.000    391.599    446.958   uwpkfcvm   2230.000   1220.000   2000.388       none      0.000      0.000      0.000      crust   2230.000   1220.000   2000.388
 -120.6295    35.8431    500.000    391.599    446.958   uwpkfcvm   2230.000   1220.000   2000.388       none      0.000      0.000      0.000      crust   2230.000   1220.000   2000.388
 -120.6295    35.8431   1000.000    391.599    446.958   uwpkfcvm   5270.000   2580.000   2578.054       none      0.000      0.000      0.000      crust   5270.000   2580.000   2578.054
 -120.6295    35.8431   3000.000    391.599    446.958   uwpkfcvm   6240.000   3570.000   2770.222       none      0.000      0.000      0.000      crust   6240.000   3570.000   2770.222
 -120.0239    35.9312      0.000    192.672    351.900   uwpkfcvm   2290.000   1210.000   2022.635       none      0.000      0.000      0.000      crust   2290.000   1210.000   2022.635
 -120.0239    35.9312    500.000    192.672    351.900   uwpkfcvm   2290.000   1210.000   2022.635       none      0.000      0.000      0.000      crust   2290.000   1210.000   2022.635
 -120.0239    35.9312   1000.000    192.672    351.900   uwpkfcvm   3290.000   1810.000   2281.874       none      0.000      0.000      0.000      crust   3290.000   1810.000   2281.874
 -120.0239    35.9312   3000.000    192.672    351.900   uwpkfcvm   4160.000   2420.000   2415.514       none      0.000      0.000      0.000      crust   4160.000   2420.000   2415.514
 -120.5741    35.1491      0.000     86.068    385.100   uwpkfcvm   3280.000   1430.000   2280.036       none      0.000      0.000      0.000      crust   3280.000   1430.000   2280.036
 -120.5741    35.1491   4000.000     86.068    385.100   uwpkfcvm   5320.000   3390.000   2586.489       none      0.000      0.000      0.000      crust   5320.000   3390.000   2586.489
 -120.5702    35.1581      0.000    154.743    385.100   uwpkfcvm   3280.000   1430.000   2280.036       none      0.000      0.000      0.000      crust   3280.000   1430.000   2280.036
 -120.5702    35.1581   4000.000    154.743    385.100   uwpkfcvm   5320.000   3390.000   2586.489       none      0.000      0.000      0.000      crust   5320.000   3390.000   2586.489
 -120.5702    35.1581  10000.000    154.743    385.100   uwpkfcvm   5790.000   3560.000   2673.175       none      0.000      0.000      0.000      crust   5790.000   3560.000   2673.175
 -120.5778    35.1336      0.000     68.501    385.100   uwpkfcvm   3170.000   1410.000   2259.105       none      0.000      0.000      0.000      crust   3170.000   1410.000   2259.105
 -119.9342    35.5739      0.000    278.321    293.500   uwpkfcvm   2720.000   1430.000   2156.392       none      0.000      0.000      0.000      crust   2720.000   1430.000   2156.392
 -120.5050    35.9600      0.000    788.719    408.488   uwpkfcvm   3110.000   1350.000   2247.094       none      0.000      0.000      0.000      crust   3110.000   1350.000   2247.094
 -120.3026    36.6621      0.000     49.441    228.200   uwpkfcvm   2370.000   1250.000   2050.807       none      0.000      0.000      0.000      crust   2370.000   1250.000   2050.807
 -120.3026    36.6621  28000.000     49.441    228.200   uwpkfcvm   7350.000   4190.000   3073.382       none      0.000      0.000      0.000      crust   7350.000   4190.000   3073.382
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_uwpkfcvm"
if $DIFF $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

