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

${BIN_DIR}/ucvm_query -c gd -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_gd.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -c ge -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvmh_ge.txt  >> $result 2>&1


cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -118.0000    34.0000      0.000    281.668    468.400   cvmhlabn   1926.272    488.166   1871.390       none      0.000      0.000      0.000      crust   1926.272    488.166   1871.390
 -118.0000    34.0000     50.000    281.668    468.400   cvmhlabn   1926.272    488.166   1871.390       none      0.000      0.000      0.000      crust   1926.272    488.166   1871.390
 -118.0000    34.0000    100.000    281.668    468.400   cvmhlabn   1906.161    470.829   1861.793       none      0.000      0.000      0.000      crust   1906.161    470.829   1861.793
 -118.0000    34.0000    500.000    281.668    468.400   cvmhlabn   2244.063    762.123   2005.690       none      0.000      0.000      0.000      crust   2244.063    762.123   2005.690
 -118.0000    34.0000   1000.000    281.668    468.400   cvmhlabn   2780.796   1224.824   2172.170       none      0.000      0.000      0.000      crust   2780.796   1224.824   2172.170
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_cvmh_c"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

