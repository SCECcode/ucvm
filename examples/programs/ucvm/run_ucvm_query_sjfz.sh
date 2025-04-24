#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=sjfz

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_sjfz_gd.txt  >> $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -118.0000    34.0000      0.000    284.191    580.043       sjfz   5350.000   2990.000   2591.617       none      0.000      0.000      0.000      crust   5350.000   2990.000   2591.617
 -118.0000    34.0000     50.000    284.191    580.043       sjfz   5350.000   2990.000   2591.617       none      0.000      0.000      0.000      crust   5350.000   2990.000   2591.617
 -118.0000    34.0000    100.000    284.191    580.043       sjfz   5350.000   2990.000   2591.617       none      0.000      0.000      0.000      crust   5350.000   2990.000   2591.617
 -118.0000    34.0000    500.000    284.191    580.043       sjfz   5350.000   2990.000   2591.617       none      0.000      0.000      0.000      crust   5350.000   2990.000   2591.617
 -118.0000    34.0000   1000.000    284.191    580.043       sjfz   5380.000   3010.000   2596.797       none      0.000      0.000      0.000      crust   5380.000   3010.000   2596.797
Using Geo Depth coordinates as default mode.
 -115.8559    33.1597      0.000    -42.267    293.500       sjfz   4600.000   2450.000   2476.144       none      0.000      0.000      0.000      crust   4600.000   2450.000   2476.144
 -115.8559    33.1597     42.267    -42.267    293.500       sjfz   4600.000   2450.000   2476.144       none      0.000      0.000      0.000      crust   4600.000   2450.000   2476.144
 -115.8559    33.1597     50.000    -42.267    293.500       sjfz   4600.000   2450.000   2476.144       none      0.000      0.000      0.000      crust   4600.000   2450.000   2476.144
 -115.8559    33.1597   1000.000    -42.267    293.500       sjfz   4610.000   2450.000   2477.551       none      0.000      0.000      0.000      crust   4610.000   2450.000   2477.551
 -115.8559    33.1597   2000.000    -42.267    293.500       sjfz   4630.000   2460.000   2480.370       none      0.000      0.000      0.000      crust   4630.000   2460.000   2480.370
 -115.8559    33.1597   5000.000    -42.267    293.500       sjfz   4830.000   2590.000   2509.173       none      0.000      0.000      0.000      crust   4830.000   2590.000   2509.173
 -117.5029    33.6961      0.000    956.211    709.792       sjfz   5470.000   3100.000   2612.655       none      0.000      0.000      0.000      crust   5470.000   3100.000   2612.655
 -117.5029    33.6961    500.000    956.211    709.792       sjfz   5470.000   3100.000   2612.655       none      0.000      0.000      0.000      crust   5470.000   3100.000   2612.655
 -117.5029    33.6961    956.211    956.211    709.792       sjfz   5470.000   3100.000   2612.655       none      0.000      0.000      0.000      crust   5470.000   3100.000   2612.655
 -117.5029    33.6961   1000.000    956.211    709.792       sjfz   5510.000   3130.000   2619.861       none      0.000      0.000      0.000      crust   5510.000   3130.000   2619.861
 -117.5029    33.6961   2000.000    956.211    709.792       sjfz   5550.000   3150.000   2627.166       none      0.000      0.000      0.000      crust   5550.000   3150.000   2627.166
 -117.5029    33.6961   5000.000    956.211    709.792       sjfz   5680.000   3230.000   2651.615       none      0.000      0.000      0.000      crust   5680.000   3230.000   2651.615
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_sjfz"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

