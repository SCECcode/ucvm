#!/bin/bash
#
#  ucvm_query_cvmhsgbn_c
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
MODEL=cvmhsgbn

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -c gd -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvmhsgbn_gd.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -c ge -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvmhsgbn_ge.txt  >> $result 2>&1


cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as z mode.
 -118.0000    34.1000      0.000    104.143    302.225   cvmhsgbn   1746.854    333.495   1780.623       none      0.000      0.000      0.000      crust   1746.854    333.495   1780.623
 -118.0000    34.1000     54.254    104.143    302.225   cvmhsgbn   1746.854    333.495   1780.623       none      0.000      0.000      0.000      crust   1746.854    333.495   1780.623
 -118.0000    34.1000    104.143    104.143    302.225   cvmhsgbn   1890.558    457.378   1854.250       none      0.000      0.000      0.000      crust   1890.558    457.378   1854.250
 -118.0000    34.1000    500.000    104.143    302.225   cvmhsgbn   2344.030    848.302   2041.843       none      0.000      0.000      0.000      crust   2344.030    848.302   2041.843
 -118.0000    34.1000   1000.000    104.143    302.225   cvmhsgbn   2780.831   1224.854   2172.179       none      0.000      0.000      0.000      crust   2780.831   1224.854   2172.179
 -118.0000    34.1000   2000.000    104.143    302.225   cvmhsgbn   2827.529   1265.111   2183.850       none      0.000      0.000      0.000      crust   2827.529   1265.111   2183.850
 -118.0000    34.1000   2100.000    104.143    302.225   cvmhsgbn   2815.720   1254.931   2180.935       none      0.000      0.000      0.000      crust   2815.720   1254.931   2180.935
Using Geo Elevation coordinates as z mode.
 -118.0000    34.1000    104.143    104.143    302.225   cvmhsgbn   1746.854    333.495   1780.623       none      0.000      0.000      0.000      crust   1746.854    333.495   1780.623
 -118.0000    34.1000     49.990    104.143    302.225   cvmhsgbn   1746.854    333.495   1780.623       none      0.000      0.000      0.000      crust   1746.854    333.495   1780.623
 -118.0000    34.1000      0.000    104.143    302.225   cvmhsgbn   1890.558    457.378   1854.250       none      0.000      0.000      0.000      crust   1890.558    457.378   1854.250
 -118.0000    34.1000   -395.857    104.143    302.225   cvmhsgbn   2344.030    848.302   2041.843       none      0.000      0.000      0.000      crust   2344.030    848.302   2041.843
 -118.0000    34.1000   -895.857    104.143    302.225   cvmhsgbn   2780.831   1224.854   2172.179       none      0.000      0.000      0.000      crust   2780.831   1224.854   2172.179
 -118.0000    34.1000  -1895.857    104.143    302.225   cvmhsgbn   2827.529   1265.111   2183.850       none      0.000      0.000      0.000      crust   2827.529   1265.111   2183.850
 -118.0000    34.1000  -1995.857    104.143    302.225   cvmhsgbn   2815.720   1254.931   2180.935       none      0.000      0.000      0.000      crust   2815.720   1254.931   2180.935
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_cvmhsgbn_c"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

