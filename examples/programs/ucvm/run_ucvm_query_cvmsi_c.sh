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
 -118.2851    34.0223      0.000     56.230    293.500      cvmsi    404.747    184.715   1928.910       none      0.000      0.000      0.000      crust    404.747    184.715   1928.910
 -118.2851    34.0223    100.000     56.230    293.500      cvmsi   1298.416    450.375   2070.020       none      0.000      0.000      0.000      crust   1298.416    450.375   2070.020
 -118.2851    34.0223   1000.000     56.230    293.500      cvmsi   2495.407   1338.076   2279.962       none      0.000      0.000      0.000      crust   2495.407   1338.076   2279.962
 -118.2851    34.0223  10000.000     56.230    293.500      cvmsi   6660.217   3769.434   2833.787       none      0.000      0.000      0.000      crust   6660.217   3769.434   2833.787
 -118.0642    34.2264      0.000   1702.281    710.100      cvmsi   4776.933   2610.611   2755.626       none      0.000      0.000      0.000      crust   4776.933   2610.611   2755.626
 -118.0642    34.2264    100.000   1702.281    710.100      cvmsi   4705.449   2569.431   2755.626       none      0.000      0.000      0.000      crust   4705.449   2569.431   2755.626
 -118.0642    34.2264   1000.000   1702.281    710.100      cvmsi   4585.534   2532.588   2755.631       none      0.000      0.000      0.000      crust   4585.534   2532.588   2755.631
 -118.0642    34.2264  10000.000   1702.281    710.100      cvmsi   6986.031   4006.347   2867.908       none      0.000      0.000      0.000      crust   6986.031   4006.347   2867.908
Using Geo Elevation coordinates as z mode.
 -118.2851    34.0223      0.000     56.230    293.500      cvmsi   1313.348    389.594   2072.378       none      0.000      0.000      0.000      crust   1313.348    389.594   2072.378
 -118.2851    34.0223    100.000     56.230    293.500       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.2851    34.0223   1000.000     56.230    293.500       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.2851    34.0223  10000.000     56.230    293.500       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0642    34.2264      0.000   1702.281    710.100      cvmsi   4936.188   2826.918   2769.037       none      0.000      0.000      0.000      crust   4936.188   2826.918   2769.037
 -118.0642    34.2264    100.000   1702.281    710.100      cvmsi   4907.375   2799.860   2767.128       none      0.000      0.000      0.000      crust   4907.375   2799.860   2767.128
 -118.0642    34.2264   1000.000   1702.281    710.100      cvmsi   4486.667   2456.424   2755.626       none      0.000      0.000      0.000      crust   4486.667   2456.424   2755.626
 -118.0642    34.2264  10000.000   1702.281    710.100       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_cvmsi_c"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

