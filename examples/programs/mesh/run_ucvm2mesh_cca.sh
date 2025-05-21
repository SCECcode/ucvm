#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
SCRATCH=./scratch

sed 's ${CONF_DIR} '$CONF_DIR' ' southbay_cca.conf_template | sed 's ${SCRATCH} '$SCRATCH' ' > southbay_cca.conf

${BIN_DIR}/ucvm2mesh -f southbay_cca.conf > southbay_cca.out 2>& 1 

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)


od -N 100 southbay_cca.media_vs |head -10 | sed 's/ //g' > $result 2>& 1

cat > $expect << EOF_EXPECTED_RESULT
0000000067652042244066363042244065075042244063607042244
0000020062321042244061033042244057546042244056261042244
0000040054774042244053510042244052224042244050740042244
0000060047454042244046170042244044705042244043333042244
0000100041635042244040137042244036441042244034742042244
0000120033244042244031545042244030045042244026346042244
0000140024646042244
0000144
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm2mesh ucvm2mesh_cca"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit


