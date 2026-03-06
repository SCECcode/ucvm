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
 -120.3810    37.3890      0.000    103.571    468.400      sjqbn   1764.853    349.011   1790.268       none      0.000      0.000      0.000      crust   1764.853    349.011   1790.268
 -120.3810    37.3890    100.000    103.571    468.400      sjqbn   2179.009    706.042   1980.692       none      0.000      0.000      0.000      crust   2179.009    706.042   1980.692
 -120.3810    37.3890    200.000    103.571    468.400      sjqbn   2179.009    706.042   1980.692       none      0.000      0.000      0.000      crust   2179.009    706.042   1980.692
 -120.3810    37.3890    300.000    103.571    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -120.3810    37.3890    500.000    103.571    468.400       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -120.6907    37.5413      0.000     63.597    424.345      sjqbn   1828.721    404.069   1823.502       none      0.000      0.000      0.000      crust   1828.721    404.069   1823.502
 -120.6907    37.5413     50.000     63.597    424.345      sjqbn   1828.721    404.069   1823.502       none      0.000      0.000      0.000      crust   1828.721    404.069   1823.502
 -120.6907    37.5413    100.000     63.597    424.345      sjqbn   1886.497    453.877   1852.273       none      0.000      0.000      0.000      crust   1886.497    453.877   1852.273
 -120.6907    37.5413    500.000     63.597    424.345       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -120.6907    37.5413   1000.000     63.597    424.345       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -119.4389    35.6961      0.000     73.868    228.200      sjqbn   1829.077    404.377   1823.683       none      0.000      0.000      0.000      crust   1829.077    404.377   1823.683
 -119.4389    35.6961   1000.000     73.868    228.200      sjqbn   2536.047   1013.833   2104.252       none      0.000      0.000      0.000      crust   2536.047   1013.833   2104.252
 -119.4389    35.6961   2000.000     73.868    228.200      sjqbn   2911.347   1337.368   2203.876       none      0.000      0.000      0.000      crust   2911.347   1337.368   2203.876
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

