#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
DIFF=${UCVM_INSTALL_PATH}/utilities/ucvm_query_diff.sh
MODEL=sjqbn

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_sjqbn_gd.txt  > $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -120.3810    37.3890      0.000    103.571    468.400      sjqbn   1766.737    350.635   1791.090       none      0.000      0.000      0.000      crust   1766.737    350.635   1791.090
 -120.3810    37.3890    100.000    103.571    468.400      sjqbn   2000.405    552.073   1898.615       none      0.000      0.000      0.000      crust   2000.405    552.073   1898.615
 -120.3810    37.3890    200.000    103.571    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -120.3810    37.3890    300.000    103.571    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -120.3810    37.3890    500.000    103.571    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -120.6907    37.5413      0.000     63.597    424.345      sjqbn   1834.067    408.678   1826.182       none      0.000      0.000      0.000      crust   1834.067    408.678   1826.182
 -120.6907    37.5413     50.000     63.597    424.345      sjqbn   1849.115    421.651   1833.670       none      0.000      0.000      0.000      crust   1849.115    421.651   1833.670
 -120.6907    37.5413    100.000     63.597    424.345      sjqbn   1864.163    434.623   1841.157       none      0.000      0.000      0.000      crust   1864.163    434.623   1841.157
 -120.6907    37.5413    500.000     63.597    424.345       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -120.6907    37.5413   1000.000     63.597    424.345       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -119.4389    35.6961      0.000     73.868    228.200      sjqbn   1829.517    404.756   1823.907       none      0.000      0.000      0.000      crust   1829.517    404.756   1823.907
 -119.4389    35.6961   1000.000     73.868    228.200      sjqbn   2512.489    993.525   2096.898       none      0.000      0.000      0.000      crust   2512.489    993.525   2096.898
 -119.4389    35.6961   2000.000     73.868    228.200      sjqbn   2929.489   1353.008   2208.029       none      0.000      0.000      0.000      crust   2929.489   1353.008   2208.029
 -119.4389    35.6961   5000.000     73.868    228.200       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.7500    34.8500      0.000  -1402.006    180.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.7500    38.3500      0.000      5.430    315.637       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.5400    38.3500      0.000   1699.238    305.776       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.5400    34.8500      0.000    942.825    396.582       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_sjqbn"
if $DIFF $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

