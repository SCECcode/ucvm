#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=cs248

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cs248_gd.txt  >> $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -118.0000    34.0000      0.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000     50.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000    100.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000    500.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000   1000.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
Using Geo Depth coordinates as default mode.
 -121.0000    37.0000      0.000    177.166    373.072      cs248   1711.022    502.288   1761.048       none      0.000      0.000      0.000      crust   1711.022    502.288   1761.048
 -121.0000    37.0000    177.166    177.166    373.072      cs248   2593.728    790.091   2498.311       none      0.000      0.000      0.000      crust   2593.728    790.091   2498.311
 -121.0000    37.0000   1000.000    177.166    373.072      cs248   3062.363   1739.887   2498.311       none      0.000      0.000      0.000      crust   3062.363   1739.887   2498.311
 -121.0000    37.0000   2000.000    177.166    373.072      cs248   3671.588   2069.625   2498.311       none      0.000      0.000      0.000      crust   3671.588   2069.625   2498.311
 -121.0000    37.0000   5000.000    177.166    373.072      cs248   5486.488   3294.270   2663.010       none      0.000      0.000      0.000      crust   5486.488   3294.270   2663.010
 -121.6200    36.6000      0.000     20.592    340.662      cs248   1600.000    400.000   1849.096       none      0.000      0.000      0.000      crust   1600.000    400.000   1849.096
 -121.6200    36.6000     20.000     20.592    340.662      cs248   1600.000    400.000   1849.096       none      0.000      0.000      0.000      crust   1600.000    400.000   1849.096
 -121.6200    36.6000    100.000     20.592    340.662      cs248   1807.309    419.637   1812.531       none      0.000      0.000      0.000      crust   1807.309    419.637   1812.531
 -121.6200    36.6000   1000.000     20.592    340.662      cs248   2825.649   1259.505   2255.943       none      0.000      0.000      0.000      crust   2825.649   1259.505   2255.943
 -121.6200    36.6000   2000.000     20.592    340.662      cs248   3446.831   1808.633   2370.851       none      0.000      0.000      0.000      crust   3446.831   1808.633   2370.851
 -121.6200    36.6000   5000.000     20.592    340.662      cs248   5796.984   3452.936   2695.293       none      0.000      0.000      0.000      crust   5796.984   3452.936   2695.293
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_cs248"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

