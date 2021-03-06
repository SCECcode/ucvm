#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=cvmsi

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -c gd -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvmsi_gd.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -c ge -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvmsi_ge.txt  >> $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as z mode.
 -118.2851    34.0223      0.000     56.230    342.859      cvmsi    404.747    184.715   1928.910       none      0.000      0.000      0.000      crust    404.747    184.715   1928.910
 -118.2851    34.0223    100.000     56.230    342.859      cvmsi   1298.416    450.375   2070.020       none      0.000      0.000      0.000      crust   1298.416    450.375   2070.020
 -118.2851    34.0223   1000.000     56.230    342.859      cvmsi   2495.407   1338.076   2279.962       none      0.000      0.000      0.000      crust   2495.407   1338.076   2279.962
 -118.2851    34.0223  10000.000     56.230    342.859      cvmsi   6660.217   3769.434   2833.787       none      0.000      0.000      0.000      crust   6660.217   3769.434   2833.787
 -118.0642    34.2264      0.000   1702.420    732.543      cvmsi   4776.933   2610.611   2755.626       none      0.000      0.000      0.000      crust   4776.933   2610.611   2755.626
 -118.0642    34.2264    100.000   1702.420    732.543      cvmsi   4705.449   2569.431   2755.626       none      0.000      0.000      0.000      crust   4705.449   2569.431   2755.626
 -118.0642    34.2264   1000.000   1702.420    732.543      cvmsi   4585.534   2532.588   2755.631       none      0.000      0.000      0.000      crust   4585.534   2532.588   2755.631
 -118.0642    34.2264  10000.000   1702.420    732.543      cvmsi   6986.031   4006.347   2867.908       none      0.000      0.000      0.000      crust   6986.031   4006.347   2867.908
Using Geo Elevation coordinates as z mode.
 -118.2851    34.0223     56.230     56.230    342.859      cvmsi    404.747    184.715   1928.910       none      0.000      0.000      0.000      crust    404.747    184.715   1928.910
 -118.2851    34.0223    -43.770     56.230    342.859      cvmsi   1298.416    450.375   2070.020       none      0.000      0.000      0.000      crust   1298.416    450.375   2070.020
 -118.2851    34.0223   -943.770     56.230    342.859      cvmsi   2495.408   1338.076   2279.962       none      0.000      0.000      0.000      crust   2495.408   1338.076   2279.962
 -118.2851    34.0223  -9943.770     56.230    342.859      cvmsi   6660.217   3769.434   2833.787       none      0.000      0.000      0.000      crust   6660.217   3769.434   2833.787
 -118.0642    34.2264   1702.281   1702.420    732.543      cvmsi   4776.833   2610.554   2755.626       none      0.000      0.000      0.000      crust   4776.833   2610.554   2755.626
 -118.0642    34.2264   1602.281   1702.420    732.543      cvmsi   4705.350   2569.374   2755.626       none      0.000      0.000      0.000      crust   4705.350   2569.374   2755.626
 -118.0642    34.2264    702.281   1702.420    732.543      cvmsi   4585.616   2532.654   2755.633       none      0.000      0.000      0.000      crust   4585.616   2532.654   2755.633
 -118.0642    34.2264  -8297.719   1702.420    732.543      cvmsi   6986.022   4006.341   2867.909       none      0.000      0.000      0.000      crust   6986.022   4006.341   2867.909
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_cvmsi_c"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

