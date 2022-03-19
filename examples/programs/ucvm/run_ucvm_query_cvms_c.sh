#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=cvms

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -c gd -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvms_gd.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -c ge -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvms_ge.txt  >> $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as z mode.
 -118.2851    34.0223      0.000     56.230    293.500       cvms    404.747    184.715   1928.910       none      0.000      0.000      0.000      crust    404.747    184.715   1928.910
 -118.2851    34.0223    100.000     56.230    293.500       cvms   1298.416    450.375   2070.020       none      0.000      0.000      0.000      crust   1298.416    450.375   2070.020
 -118.2851    34.0223   1000.000     56.230    293.500       cvms   2589.844   1312.885   2273.936       none      0.000      0.000      0.000      crust   2589.844   1312.885   2273.936
 -118.2851    34.0223  10000.000     56.230    293.500       cvms   6135.449   3428.955   2833.787       none      0.000      0.000      0.000      crust   6135.449   3428.955   2833.787
 -118.0642    34.2264      0.000   1702.281    710.100       cvms   5640.444   2919.274   2755.626       none      0.000      0.000      0.000      crust   5640.444   2919.274   2755.626
 -118.0642    34.2264    100.000   1702.281    710.100       cvms   5640.444   2919.274   2755.626       none      0.000      0.000      0.000      crust   5640.444   2919.274   2755.626
 -118.0642    34.2264   1000.000   1702.281    710.100       cvms   5640.473   2919.327   2755.631       none      0.000      0.000      0.000      crust   5640.473   2919.327   2755.631
 -118.0642    34.2264  10000.000   1702.281    710.100       cvms   6351.540   3639.384   2867.908       none      0.000      0.000      0.000      crust   6351.540   3639.384   2867.908
Using Geo Elevation coordinates as z mode.
 -118.2851    34.0223     56.230     56.230    293.500       cvms    404.747    184.715   1928.910       none      0.000      0.000      0.000      crust    404.747    184.715   1928.910
 -118.2851    34.0223    -43.770     56.230    293.500       cvms   1298.416    450.375   2070.020       none      0.000      0.000      0.000      crust   1298.416    450.375   2070.020
 -118.2851    34.0223   -943.770     56.230    293.500       cvms   2589.845   1312.886   2273.937       none      0.000      0.000      0.000      crust   2589.845   1312.886   2273.937
 -118.2851    34.0223  -9943.770     56.230    293.500       cvms   6135.449   3428.955   2833.787       none      0.000      0.000      0.000      crust   6135.449   3428.955   2833.787
 -118.0642    34.2264   1702.281   1702.281    710.100       cvms   5640.444   2919.274   2755.626       none      0.000      0.000      0.000      crust   5640.444   2919.274   2755.626
 -118.0642    34.2264   1602.281   1702.281    710.100       cvms   5640.444   2919.274   2755.626       none      0.000      0.000      0.000      crust   5640.444   2919.274   2755.626
 -118.0642    34.2264    702.281   1702.281    710.100       cvms   5640.474   2919.327   2755.631       none      0.000      0.000      0.000      crust   5640.474   2919.327   2755.631
 -118.0642    34.2264  -8297.719   1702.281    710.100       cvms   6351.540   3639.384   2867.908       none      0.000      0.000      0.000      crust   6351.540   3639.384   2867.908
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_cvms_c"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

