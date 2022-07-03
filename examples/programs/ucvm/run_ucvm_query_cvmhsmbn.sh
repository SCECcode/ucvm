#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=cvmhsmbn

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvmhsmbn_gd.txt  >> $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -118.0000    34.0000      0.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000     50.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000    100.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000    500.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000   1000.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
Using Geo Depth coordinates as default mode.
 -120.4184    34.7746      0.000    168.314    458.296   cvmhsmbn   1672.777    269.635   1739.592       none      0.000      0.000      0.000      crust   1672.777    269.635   1739.592
 -120.4184    34.7746    100.000    168.314    458.296   cvmhsmbn   1943.030    502.612   1879.280       none      0.000      0.000      0.000      crust   1943.030    502.612   1879.280
 -120.4184    34.7746    130.020    168.314    458.296   cvmhsmbn   1943.030    502.612   1879.280       none      0.000      0.000      0.000      crust   1943.030    502.612   1879.280
 -120.4184    34.7746    168.351    168.314    458.296   cvmhsmbn   1943.030    502.612   1879.280       none      0.000      0.000      0.000      crust   1943.030    502.612   1879.280
 -120.4184    34.7746    500.000    168.314    458.296   cvmhsmbn   2096.947    635.299   1947.400       none      0.000      0.000      0.000      crust   2096.947    635.299   1947.400
 -120.4184    34.7746   1000.000    168.314    458.296   cvmhsmbn   2660.671   1121.268   2140.323       none      0.000      0.000      0.000      crust   2660.671   1121.268   2140.323
 -120.4184    34.7746   1500.000    168.314    458.296   cvmhsmbn   2690.273   1146.787   2148.425       none      0.000      0.000      0.000      crust   2690.273   1146.787   2148.425
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_cvmhsmbn"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

