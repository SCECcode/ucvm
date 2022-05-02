#!/bin/bash
#
#  ucvm_query_cvmhvbn_c
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
MODEL=cvmhvbn

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -c gd -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvmhvbn_gd.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -c ge -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cvmhvbn_ge.txt  >> $result 2>&1


cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as z mode.
 -119.3850    34.4911      0.000    901.049    385.100    cvmhvbn   2116.271    651.958   1955.421       none      0.000      0.000      0.000      crust   2116.271    651.958   1955.421
 -119.3850    34.4911    500.000    901.049    385.100    cvmhvbn   2274.516    788.376   2016.987       none      0.000      0.000      0.000      crust   2274.516    788.376   2016.987
 -119.3850    34.4911    799.300    901.049    385.100    cvmhvbn   2479.527    965.110   2086.785       none      0.000      0.000      0.000      crust   2479.527    965.110   2086.785
 -119.3850    34.4911    901.049    901.049    385.100    cvmhvbn   2545.394   1021.892   2107.072       none      0.000      0.000      0.000      crust   2545.394   1021.892   2107.072
 -119.3850    34.4911   1000.000    901.049    385.100    cvmhvbn   2607.062   1075.053   2125.204       none      0.000      0.000      0.000      crust   2607.062   1075.053   2125.204
 -119.3850    34.4911   2000.000    901.049    385.100    cvmhvbn   3186.107   1574.230   2262.256       none      0.000      0.000      0.000      crust   3186.107   1574.230   2262.256
 -119.3850    34.4911   3000.000    901.049    385.100    cvmhvbn   3682.218   2001.912   2347.119       none      0.000      0.000      0.000      crust   3682.218   2001.912   2347.119
Using Geo Elevation coordinates as z mode.
 -119.3850    34.4911    901.049    901.049    385.100    cvmhvbn   2116.271    651.958   1955.421       none      0.000      0.000      0.000      crust   2116.271    651.958   1955.421
 -119.3850    34.4911    401.049    901.049    385.100    cvmhvbn   2274.516    788.376   2016.987       none      0.000      0.000      0.000      crust   2274.516    788.376   2016.987
 -119.3850    34.4911    101.749    901.049    385.100    cvmhvbn   2479.527    965.110   2086.785       none      0.000      0.000      0.000      crust   2479.527    965.110   2086.785
 -119.3850    34.4911      0.000    901.049    385.100    cvmhvbn   2545.394   1021.892   2107.072       none      0.000      0.000      0.000      crust   2545.394   1021.892   2107.072
 -119.3850    34.4911    -98.951    901.049    385.100    cvmhvbn   2607.062   1075.053   2125.204       none      0.000      0.000      0.000      crust   2607.062   1075.053   2125.204
 -119.3850    34.4911  -1098.951    901.049    385.100    cvmhvbn   3186.107   1574.230   2262.256       none      0.000      0.000      0.000      crust   3186.107   1574.230   2262.256
 -119.3850    34.4911  -2098.951    901.049    385.100    cvmhvbn   3682.218   2001.912   2347.119       none      0.000      0.000      0.000      crust   3682.218   2001.912   2347.119
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_cvmhvbn_c"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

