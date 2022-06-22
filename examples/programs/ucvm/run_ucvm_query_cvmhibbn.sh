#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=cvmhibbn

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvmhibbn_gd.txt  >> $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -118.0000    34.0000      0.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000     50.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000    100.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000    500.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000   1000.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
Using Geo Depth coordinates as default mode.
 -117.3752    32.7948      0.000   -153.000    180.000   cvmhibbn   1596.660    204.017   1695.114       none      0.000      0.000      0.000      crust   1596.660    204.017   1695.114
 -117.3752    32.7948    100.000   -153.000    180.000   cvmhibbn   1675.668    272.127   1741.235       none      0.000      0.000      0.000      crust   1675.668    272.127   1741.235
 -117.3752    32.7948    500.000   -153.000    180.000   cvmhibbn   1947.460    506.431   1881.349       none      0.000      0.000      0.000      crust   1947.460    506.431   1881.349
 -117.3752    32.7948   1000.000   -153.000    180.000   cvmhibbn   2408.194    903.615   2063.683       none      0.000      0.000      0.000      crust   2408.194    903.615   2063.683
 -117.3752    32.7948   2000.000   -153.000    180.000   cvmhibbn   2987.860   1403.328   2221.191       none      0.000      0.000      0.000      crust   2987.860   1403.328   2221.191
 -117.3752    32.7948   5000.000   -153.000    180.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -117.3752    32.7948  10000.000   -153.000    180.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -117.5043    33.2186      0.000   -130.000    180.000   cvmhibbn   1710.151    301.853   1760.565       none      0.000      0.000      0.000      crust   1710.151    301.853   1760.565
 -117.5043    33.2186    100.000   -130.000    180.000   cvmhibbn   1805.008    383.628   1811.342       none      0.000      0.000      0.000      crust   1805.008    383.628   1811.342
 -117.5043    33.2186    500.000   -130.000    180.000   cvmhibbn   2199.636    723.824   1988.749       none      0.000      0.000      0.000      crust   2199.636    723.824   1988.749
 -117.5043    33.2186   1000.000   -130.000    180.000   cvmhibbn   2710.267   1164.023   2153.802       none      0.000      0.000      0.000      crust   2710.267   1164.023   2153.802
 -117.5043    33.2186   2000.000   -130.000    180.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -117.5043    33.2186   5000.000   -130.000    180.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -117.5043    33.2186  10000.000   -130.000    180.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
EOF_EXPECTED_RESULT


echo "Running examples_programs_ucvm ucvm_query_cvmhibbn"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

