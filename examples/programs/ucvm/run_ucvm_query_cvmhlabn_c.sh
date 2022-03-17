#!/bin/bash
#
#  ucvm_query_cvmhlabn_c
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
MODEL=cvmhlabn

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -c gd -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvmhlabn_gd.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -c ge -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvmhlabn_ge.txt  >> $result 2>&1


cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as z mode.
 -118.1000    34.0000      0.000     55.837    293.500   cvmhlabn   1610.418    215.878   1703.332       none      0.000      0.000      0.000      crust   1610.418    215.878   1703.332
 -118.1000    34.0000     10.000     55.837    293.500   cvmhlabn   1610.418    215.878   1703.332       none      0.000      0.000      0.000      crust   1610.418    215.878   1703.332
 -118.1000    34.0000     49.990     55.837    293.500   cvmhlabn   1610.418    215.878   1703.332       none      0.000      0.000      0.000      crust   1610.418    215.878   1703.332
 -118.1000    34.0000     55.830     55.837    293.500   cvmhlabn   1610.418    215.878   1703.332       none      0.000      0.000      0.000      crust   1610.418    215.878   1703.332
 -118.1000    34.0000    100.000     55.837    293.500   cvmhlabn   1797.586    377.229   1807.492       none      0.000      0.000      0.000      crust   1797.586    377.229   1807.492
 -118.1000    34.0000    500.000     55.837    293.500   cvmhlabn   2360.782    862.743   2047.645       none      0.000      0.000      0.000      crust   2360.782    862.743   2047.645
 -118.1000    34.0000   1000.000     55.837    293.500   cvmhlabn   2730.553   1181.511   2159.179       none      0.000      0.000      0.000      crust   2730.553   1181.511   2159.179
Using Geo Elevation coordinates as z mode.
 -118.1000    34.0000     55.827     55.837    293.500   cvmhlabn   1610.418    215.878   1703.332       none      0.000      0.000      0.000      crust   1610.418    215.878   1703.332
 -118.1000    34.0000     45.837     55.837    293.500   cvmhlabn   1610.418    215.878   1703.332       none      0.000      0.000      0.000      crust   1610.418    215.878   1703.332
 -118.1000    34.0000      6.837     55.837    293.500   cvmhlabn   1610.418    215.878   1703.332       none      0.000      0.000      0.000      crust   1610.418    215.878   1703.332
 -118.1000    34.0000      0.000     55.837    293.500   cvmhlabn   1610.418    215.878   1703.332       none      0.000      0.000      0.000      crust   1610.418    215.878   1703.332
 -118.1000    34.0000    -44.173     55.837    293.500   cvmhlabn   1797.586    377.229   1807.492       none      0.000      0.000      0.000      crust   1797.586    377.229   1807.492
 -118.1000    34.0000   -444.173     55.837    293.500   cvmhlabn   2360.782    862.743   2047.645       none      0.000      0.000      0.000      crust   2360.782    862.743   2047.645
 -118.1000    34.0000   -944.173     55.837    293.500   cvmhlabn   2730.553   1181.511   2159.179       none      0.000      0.000      0.000      crust   2730.553   1181.511   2159.179
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_cvmhlabn_c"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

