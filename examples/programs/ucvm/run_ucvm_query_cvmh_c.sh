#!/bin/bash
#
#  ucvm_query_cvmh_c
#
#    -c ge : query by elevation
#    -c gd : query by depth
#

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=cvmh

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -c gd -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvmh_gd.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -c ge -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvmh_ge.txt  >> $result 2>&1


cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as z mode.
 -118.1000    34.0000      0.000     55.777    293.858       cvmh   1648.540    248.741   1725.690       none      0.000      0.000      0.000      crust   1648.540    248.741   1725.690
 -118.1000    34.0000     10.000     55.777    293.858       cvmh   1648.540    248.741   1725.690       none      0.000      0.000      0.000      crust   1648.540    248.741   1725.690
 -118.1000    34.0000     49.990     55.777    293.858       cvmh   1648.540    248.741   1725.690       none      0.000      0.000      0.000      crust   1648.540    248.741   1725.690
 -118.1000    34.0000     55.830     55.777    293.858       cvmh   1648.540    248.741   1725.690       none      0.000      0.000      0.000      crust   1648.540    248.741   1725.690
 -118.1000    34.0000    100.000     55.777    293.858       cvmh   1732.408    321.041   1772.792       none      0.000      0.000      0.000      crust   1732.408    321.041   1772.792
 -118.1000    34.0000    500.000     55.777    293.858       cvmh   2143.339    675.292   1966.467       none      0.000      0.000      0.000      crust   2143.339    675.292   1966.467
 -118.1000    34.0000   1000.000     55.777    293.858       cvmh   2561.237   1035.549   2111.808       none      0.000      0.000      0.000      crust   2561.237   1035.549   2111.808
Using Geo Elevation coordinates as z mode.
 -118.1000    34.0000     49.990     55.777    293.858       cvmh   1648.540    248.741   1725.690       none      0.000      0.000      0.000      crust   1648.540    248.741   1725.690
 -118.1000    34.0000     39.990     55.777    293.858       cvmh   1648.540    248.741   1725.690       none      0.000      0.000      0.000      crust   1648.540    248.741   1725.690
 -118.1000    34.0000      0.000     55.777    293.858       cvmh   1648.540    248.741   1725.690       none      0.000      0.000      0.000      crust   1648.540    248.741   1725.690
 -118.1000    34.0000     -5.840     55.777    293.858       cvmh   1648.540    248.741   1725.690       none      0.000      0.000      0.000      crust   1648.540    248.741   1725.690
 -118.1000    34.0000    -10.000     55.777    293.858       cvmh   1648.540    248.741   1725.690       none      0.000      0.000      0.000      crust   1648.540    248.741   1725.690
 -118.1000    34.0000    -50.009     55.777    293.858       cvmh   1732.408    321.041   1772.792       none      0.000      0.000      0.000      crust   1732.408    321.041   1772.792
 -118.1000    34.0000   -450.009     55.777    293.858       cvmh   2143.339    675.292   1966.467       none      0.000      0.000      0.000      crust   2143.339    675.292   1966.467
 -118.1000    34.0000   -950.009     55.777    293.858       cvmh   2561.237   1035.549   2111.808       none      0.000      0.000      0.000      crust   2561.237   1035.549   2111.808
EOF_EXPECTED_RESULT


echo "Running examples_programs_ucvm ucvm_query_cvmh_c"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

