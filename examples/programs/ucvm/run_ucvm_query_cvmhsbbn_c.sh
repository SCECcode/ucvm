#!/bin/bash
#
#  ucvm_query_cvmhsbbn_c
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
MODEL=cvmhsbbn

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -c gd -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvmhsbbn_gd.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -c ge -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvmhsbbn_ge.txt  >> $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as z mode.
 -117.2770    34.0693      0.000    308.119    286.172   cvmhsbbn   1474.805    120.690   1618.744       none      0.000      0.000      0.000      crust   1474.805    120.690   1618.744
 -117.2770    34.0693    300.000    308.119    286.172   cvmhsbbn   2323.976    831.014   2034.802       none      0.000      0.000      0.000      crust   2323.976    831.014   2034.802
 -117.2770    34.0693    308.536    308.119    286.172   cvmhsbbn   2323.976    831.014   2034.802       none      0.000      0.000      0.000      crust   2323.976    831.014   2034.802
 -117.2770    34.0693    308.887    308.119    286.172   cvmhsbbn   2323.976    831.014   2034.802       none      0.000      0.000      0.000      crust   2323.976    831.014   2034.802
 -117.2770    34.0693    500.000    308.119    286.172   cvmhsbbn   2525.487   1004.731   2101.043       none      0.000      0.000      0.000      crust   2525.487   1004.731   2101.043
 -117.2770    34.0693   1000.000    308.119    286.172   cvmhsbbn   2789.023   1231.917   2174.254       none      0.000      0.000      0.000      crust   2789.023   1231.917   2174.254
 -117.2770    34.0693   1500.000    308.119    286.172   cvmhsbbn   2999.261   1413.141   2223.696       none      0.000      0.000      0.000      crust   2999.261   1413.141   2223.696
Using Geo Elevation coordinates as z mode.
 -117.2770    34.0693    308.536    308.119    286.172   cvmhsbbn   1474.805    120.690   1618.744       none      0.000      0.000      0.000      crust   1474.805    120.690   1618.744
 -117.2770    34.0693      8.536    308.119    286.172   cvmhsbbn   2323.976    831.014   2034.802       none      0.000      0.000      0.000      crust   2323.976    831.014   2034.802
 -117.2770    34.0693      0.000    308.119    286.172   cvmhsbbn   2323.976    831.014   2034.802       none      0.000      0.000      0.000      crust   2323.976    831.014   2034.802
 -117.2770    34.0693     -0.351    308.119    286.172   cvmhsbbn   2323.976    831.014   2034.802       none      0.000      0.000      0.000      crust   2323.976    831.014   2034.802
 -117.2770    34.0693   -191.464    308.119    286.172   cvmhsbbn   2525.487   1004.731   2101.043       none      0.000      0.000      0.000      crust   2525.487   1004.731   2101.043
 -117.2770    34.0693   -691.464    308.119    286.172   cvmhsbbn   2789.023   1231.917   2174.254       none      0.000      0.000      0.000      crust   2789.023   1231.917   2174.254
 -117.2770    34.0693  -1191.464    308.119    286.172   cvmhsbbn   2999.261   1413.141   2223.696       none      0.000      0.000      0.000      crust   2999.261   1413.141   2223.696
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_cvmhsbbn_c"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

