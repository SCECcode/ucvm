#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=wfcvm

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -c gd -m ${MODEL} -p ucvm_utah -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_wfcvm_gd.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -c ge -m ${MODEL} -p ucvm_utah -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_wfcvm_ge.txt  >> $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as z mode.
 -118.0000    34.0000      0.000      0.000      0.000      wfcvm   2871.000   1435.500   2318.331       none      0.000      0.000      0.000      crust   2871.000   1435.500   2318.331
 -111.8830    40.7500      0.000   1310.601    309.639      wfcvm   1297.435    161.582   2069.865       none      0.000      0.000      0.000      crust   1297.435    161.582   2069.865
 -111.8830    40.7500     50.000   1310.601    309.639      wfcvm   1524.665    357.470   2105.745       none      0.000      0.000      0.000      crust   1524.665    357.470   2105.745
 -111.8830    40.7500    100.000   1310.601    309.639      wfcvm   1633.396    451.145   2122.913       none      0.000      0.000      0.000      crust   1633.396    451.145   2122.913
 -111.8830    40.7500    500.000   1310.601    309.639      wfcvm   3204.440   1730.995   2370.981       none      0.000      0.000      0.000      crust   3204.440   1730.995   2370.981
 -111.8830    40.7500   1000.000   1310.601    309.639      wfcvm   3654.000   2100.000   2441.967       none      0.000      0.000      0.000      crust   3654.000   2100.000   2441.967
 -111.8830    40.7500   2000.000   1310.601    309.639      wfcvm   4172.050   2397.730   2523.767       none      0.000      0.000      0.000      crust   4172.050   2397.730   2523.767
Using Geo Elevation coordinates as z mode.
 -118.0000    34.0000      0.000      0.000      0.000      wfcvm   2871.000   1435.500   2318.331       none      0.000      0.000      0.000      crust   2871.000   1435.500   2318.331
 -111.8830    40.7500   1310.601   1310.601    309.639      wfcvm   1297.435    161.582   2069.865       none      0.000      0.000      0.000      crust   1297.435    161.582   2069.865
 -111.8830    40.7500   1260.601   1310.601    309.639      wfcvm   1524.665    357.470   2105.745       none      0.000      0.000      0.000      crust   1524.665    357.470   2105.745
 -111.8830    40.7500   1210.601   1310.601    309.639      wfcvm   1633.396    451.145   2122.913       none      0.000      0.000      0.000      crust   1633.396    451.145   2122.913
 -111.8830    40.7500    810.601   1310.601    309.639      wfcvm   3204.440   1730.995   2370.981       none      0.000      0.000      0.000      crust   3204.440   1730.995   2370.981
 -111.8830    40.7500    310.601   1310.601    309.639      wfcvm   3654.000   2100.000   2441.967       none      0.000      0.000      0.000      crust   3654.000   2100.000   2441.967
 -111.8830    40.7500   -689.399   1310.601    309.639      wfcvm   4172.050   2397.730   2523.767       none      0.000      0.000      0.000      crust   4172.050   2397.730   2523.767
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_wfcvm_c"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

### from wfcvm 3c
#Using Geo Depth coordinates as default mode.
# -111.8830    40.7500      0.000   1310.601    309.639      wfcvm   1340.385    198.608   2076.647       none      0.000      0.000      0.000      crust   1340.385    198.608   2076.647
# -111.8830    40.7500     50.000   1310.601    309.639      wfcvm   1533.288    364.903   2107.106       none      0.000      0.000      0.000      crust   1533.288    364.903   2107.106
# -111.8830    40.7500    100.000   1310.601    309.639      wfcvm   1633.396    451.145   2122.913       none      0.000      0.000      0.000      crust   1633.396    451.145   2122.913
# -111.8830    40.7500    500.000   1310.601    309.639      wfcvm   3204.440   1730.995   2370.981       none      0.000      0.000      0.000      crust   3204.440   1730.995   2370.981
# -111.8830    40.7500   1000.000   1310.601    309.639      wfcvm   3654.000   2100.000   2441.967       none      0.000      0.000      0.000      crust   3654.000   2100.000   2441.967
# -118.0000    34.0000      0.000      0.000      0.000      wfcvm   2871.000   1435.500   2318.331       none      0.000      0.000      0.000      crust   2871.000   1435.500   2318.331

