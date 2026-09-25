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
 -120.6295    35.8431      0.000    391.599    446.958   uwpkfcvm   1860.000   1110.000   1839.227       none      0.000      0.000      0.000      crust   1860.000   1110.000   1839.227
 -120.6295    35.8431    500.000    391.599    446.958   uwpkfcvm   1860.000   1110.000   1839.227       none      0.000      0.000      0.000      crust   1860.000   1110.000   1839.227
 -120.6295    35.8431   1000.000    391.599    446.958   uwpkfcvm   3840.000   2230.000   2370.564       none      0.000      0.000      0.000      crust   3840.000   2230.000   2370.564
 -120.6295    35.8431   3000.000    391.599    446.958   uwpkfcvm   6110.000   3190.000   2740.685       none      0.000      0.000      0.000      crust   6110.000   3190.000   2740.685
 -120.0239    35.9312      0.000    192.672    351.900   uwpkfcvm   2310.000   1220.000   2029.834       none      0.000      0.000      0.000      crust   2310.000   1220.000   2029.834
 -120.0239    35.9312    500.000    192.672    351.900   uwpkfcvm   2310.000   1220.000   2029.834       none      0.000      0.000      0.000      crust   2310.000   1220.000   2029.834
 -120.0239    35.9312   1000.000    192.672    351.900   uwpkfcvm   3260.000   1790.000   2276.329       none      0.000      0.000      0.000      crust   3260.000   1790.000   2276.329
 -120.0239    35.9312   3000.000    192.672    351.900   uwpkfcvm   4080.000   2370.000   2404.482       none      0.000      0.000      0.000      crust   4080.000   2370.000   2404.482
 -120.5741    35.1491      0.000     86.068    385.100   uwpkfcvm   3310.000   1430.000   2285.518       none      0.000      0.000      0.000      crust   3310.000   1430.000   2285.518
 -120.5741    35.1491   4000.000     86.068    385.100   uwpkfcvm   5400.000   3320.000   2600.279       none      0.000      0.000      0.000      crust   5400.000   3320.000   2600.279
 -120.5702    35.1581      0.000    154.743    385.100   uwpkfcvm   3400.000   1450.000   2301.439       none      0.000      0.000      0.000      crust   3400.000   1450.000   2301.439
 -120.5702    35.1581   4000.000    154.743    385.100   uwpkfcvm   5400.000   3320.000   2600.279       none      0.000      0.000      0.000      crust   5400.000   3320.000   2600.279
 -120.5702    35.1581  10000.000    154.743    385.100   uwpkfcvm   5780.000   3550.000   2671.181       none      0.000      0.000      0.000      crust   5780.000   3550.000   2671.181
 -120.5778    35.1336      0.000     68.501    385.100   uwpkfcvm   3210.000   1410.000   2266.873       none      0.000      0.000      0.000      crust   3210.000   1410.000   2266.873
 -119.9342    35.5739      0.000    278.321    293.500   uwpkfcvm   2720.000   1440.000   2156.392       none      0.000      0.000      0.000      crust   2720.000   1440.000   2156.392
 -120.5050    35.9600      0.000    788.719    408.488   uwpkfcvm   2660.000   1440.000   2140.137       none      0.000      0.000      0.000      crust   2660.000   1440.000   2140.137
 -120.3026    36.6621      0.000     49.441    228.200   uwpkfcvm   2400.000   1260.000   2060.951       none      0.000      0.000      0.000      crust   2400.000   1260.000   2060.951
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

