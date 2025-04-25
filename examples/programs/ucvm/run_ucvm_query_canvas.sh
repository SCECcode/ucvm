#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=canvas

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_canvas_gd.txt  >> $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -118.0000    34.0000      0.000    284.191    580.043     canvas   5941.584   3420.215   2721.681       none      0.000      0.000      0.000      crust   5941.584   3420.215   2721.681
 -118.0000    34.0000     50.000    284.191    580.043     canvas   5941.584   3420.215   2721.681       none      0.000      0.000      0.000      crust   5941.584   3420.215   2721.681
 -118.0000    34.0000    100.000    284.191    580.043     canvas   5941.584   3420.215   2721.681       none      0.000      0.000      0.000      crust   5941.584   3420.215   2721.681
 -118.0000    34.0000    500.000    284.191    580.043     canvas   5941.584   3420.215   2721.681       none      0.000      0.000      0.000      crust   5941.584   3420.215   2721.681
 -118.0000    34.0000   1000.000    284.191    580.043     canvas   5951.789   3423.544   2722.849       none      0.000      0.000      0.000      crust   5951.789   3423.544   2722.849
Using Geo Depth coordinates as default mode.
 -114.1000    43.0000      0.000      0.000      0.000     canvas   6300.782   3590.176   2761.915       none      0.000      0.000      0.000      crust   6300.782   3590.176   2761.915
 -114.1000    43.0000   1000.000      0.000      0.000     canvas   6305.593   3600.328   2762.442       none      0.000      0.000      0.000      crust   6305.593   3600.328   2762.442
 -114.1000    43.0000   2000.000      0.000      0.000     canvas   6310.723   3610.361   2763.004       none      0.000      0.000      0.000      crust   6310.723   3610.361   2763.004
 -114.1000    43.0000   5000.000      0.000      0.000     canvas   6328.022   3639.750   2764.895       none      0.000      0.000      0.000      crust   6328.022   3639.750   2764.895
 -114.1000    39.0000      0.000      0.000      0.000     canvas   5827.400   3522.556   2708.510       none      0.000      0.000      0.000      crust   5827.400   3522.556   2708.510
 -114.1000    39.0000   1500.000      0.000      0.000     canvas   5842.706   3529.450   2710.287       none      0.000      0.000      0.000      crust   5842.706   3529.450   2710.287
 -114.1000    39.0000   1716.000      0.000      0.000     canvas   5842.706   3529.450   2710.287       none      0.000      0.000      0.000      crust   5842.706   3529.450   2710.287
 -114.1000    39.0000   2000.000      0.000      0.000     canvas   5859.097   3535.793   2712.185       none      0.000      0.000      0.000      crust   5859.097   3535.793   2712.185
 -114.1000    39.0000   5000.000      0.000      0.000     canvas   5914.798   3551.532   2718.609       none      0.000      0.000      0.000      crust   5914.798   3551.532   2718.609
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_canvas"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

