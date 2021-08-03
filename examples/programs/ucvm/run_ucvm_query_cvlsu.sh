#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=cvlsu

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvlsu.txt  > $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -116.4000    33.6000      0.000   1090.858    710.100      cvlsu   5118.300   3084.361   2553.281       none      0.000      0.000      0.000      crust   5118.300   3084.361   2553.281
 -116.4000    33.6000   4000.000   1090.858    710.100      cvlsu   5857.700   3482.312   2686.855       none      0.000      0.000      0.000      crust   5857.700   3482.312   2686.855
 -116.4000    33.6000   8000.000   1090.858    710.100      cvlsu   6107.700   3598.775   2740.174       none      0.000      0.000      0.000      crust   6107.700   3598.775   2740.174
 -116.2400    33.7000      0.000      2.390    293.500       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -116.2400    33.7000   4000.000      2.390    293.500       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -116.2400    33.7000   8000.000      2.390    293.500      cvlsu   5951.900   3526.979   2706.422       none      0.000      0.000      0.000      crust   5951.900   3526.979   2706.422
 -116.1400    33.8000      0.000    534.590    710.100       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -116.1400    33.8000   4000.000    534.590    710.100      cvlsu   5555.800   3331.023   2628.234       none      0.000      0.000      0.000      crust   5555.800   3331.023   2628.234
 -116.1400    33.8000   8000.000    534.590    710.100      cvlsu   5966.700   3533.904   2709.554       none      0.000      0.000      0.000      crust   5966.700   3533.904   2709.554
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_cvlsu"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit
