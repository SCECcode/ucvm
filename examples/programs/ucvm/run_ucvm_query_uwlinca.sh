#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=uwlinca

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_uwlinca_gd.txt  >> $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -118.0000    34.0000      0.000    284.191    580.043    uwlinca   3370.000   1740.772   2296.217       none      0.000      0.000      0.000      crust   3370.000   1740.772   2296.217
 -118.0000    34.0000     50.000    284.191    580.043    uwlinca   3370.000   1740.772   2296.217       none      0.000      0.000      0.000      crust   3370.000   1740.772   2296.217
 -118.0000    34.0000    100.000    284.191    580.043    uwlinca   3370.000   1740.772   2296.217       none      0.000      0.000      0.000      crust   3370.000   1740.772   2296.217
 -118.0000    34.0000    500.000    284.191    580.043    uwlinca   3370.000   1740.772   2296.217       none      0.000      0.000      0.000      crust   3370.000   1740.772   2296.217
 -118.0000    34.0000   1000.000    284.191    580.043    uwlinca   3370.000   1740.772   2296.217       none      0.000      0.000      0.000      crust   3370.000   1740.772   2296.217
Using Geo Depth coordinates as default mode.
 -122.0870    37.8179      0.000    287.734    475.350    uwlinca   4256.000   2486.593   2428.674       none      0.000      0.000      0.000      crust   4256.000   2486.593   2428.674
 -122.0870    37.8179    100.000    287.734    475.350    uwlinca   4256.000   2486.593   2428.674       none      0.000      0.000      0.000      crust   4256.000   2486.593   2428.674
 -122.0870    37.8179    287.734    287.734    475.350    uwlinca   4256.000   2486.593   2428.674       none      0.000      0.000      0.000      crust   4256.000   2486.593   2428.674
 -122.0870    37.8179    500.000    287.734    475.350    uwlinca   4256.000   2486.593   2428.674       none      0.000      0.000      0.000      crust   4256.000   2486.593   2428.674
 -122.0870    37.8179   1000.000    287.734    475.350    uwlinca   4256.000   2486.593   2428.674       none      0.000      0.000      0.000      crust   4256.000   2486.593   2428.674
 -122.0870    37.8179   2000.000    287.734    475.350    uwlinca   5208.000   3137.889   2567.784       none      0.000      0.000      0.000      crust   5208.000   3137.889   2567.784
 -122.0870    37.8179   5000.000    287.734    475.350    uwlinca   5603.000   3355.591   2637.002       none      0.000      0.000      0.000      crust   5603.000   3355.591   2637.002
 -121.5435    37.5720      0.000    790.849    733.400    uwlinca   4479.000   2655.442   2459.286       none      0.000      0.000      0.000      crust   4479.000   2655.442   2459.286
 -121.5435    37.5720    500.000    790.849    733.400    uwlinca   4479.000   2655.442   2459.286       none      0.000      0.000      0.000      crust   4479.000   2655.442   2459.286
 -121.5435    37.5720    790.849    790.849    733.400    uwlinca   4479.000   2655.442   2459.286       none      0.000      0.000      0.000      crust   4479.000   2655.442   2459.286
 -121.5435    37.5720   1000.000    790.849    733.400    uwlinca   4479.000   2655.442   2459.286       none      0.000      0.000      0.000      crust   4479.000   2655.442   2459.286
 -121.5435    37.5720   2000.000    790.849    733.400    uwlinca   5335.000   3210.996   2589.046       none      0.000      0.000      0.000      crust   5335.000   3210.996   2589.046
 -121.5435    37.5720   5000.000    790.849    733.400    uwlinca   5632.000   3370.507   2642.460       none      0.000      0.000      0.000      crust   5632.000   3370.507   2642.460
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_uwlinca"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

