#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

tmp=`uname -s`

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf

PWD_DIR=`pwd`
## build etreeinfo if not avail
if [ ! -x etreeinfo ]; then
   cd ${UCVM_SRC_PATH}/work/lib/euclid3/tools; \
	make etreeinfo; \
	cd ${PWD_DIR}; \
	ln -s ${UCVM_SRC_PATH}/work/lib/euclid3/tools/etreeinfo .; \
	ln -s ${UCVM_SRC_PATH}/work/lib/euclid3/libsrc ../.;
fi

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)
expect_meta=$(mktemp) || (trap 'rm -f "$expect" "result"'; exit 1)
result_meta=$(mktemp) || (trap 'rm -f "$expect" "result" "expect_meta" '; exit 1)

sed 's ${CONF_DIR} '$CONF_DIR' ' garnervalley_cvmh.conf_template > garnervalley_cvmh.conf

${BIN_DIR}/ucvm2etree -f ./garnervalley_cvmh.conf > garnervalley_cvmh.out

grep "Saving metadata" garnervalley_cvmh.out > $result_meta 

#head -1 garnervalley_cvmh_nogtl_0.5hz_10pts_1000ms.e |od |head -20 | sed 's/ //g' > $result
./etreeinfo garnervalley_cvmh_nogtl_0.5hz_10pts_1000ms.e | sed 's/Status of etree.*garnervalley/Status of etree garnervalley/g' > $result

cat > $expect_meta << EOF_EXPECTED_META
Saving metadata: Title:GarnerValley_0.5hz_10pts_1000ms Author:Elnza Date:02/27/2019 3 Vp(float);Vs(float);density(float) 33.640300 -116.859300 26250.000000 35000.000000 0.000000 4375.000000 1610612736 2147483648 268435456
EOF_EXPECTED_META

cat > $expect << EOF_EXPECTED_RESULT

Status of etree garnervalley_cvmh_nogtl_0.5hz_10pts_1000ms.e

Dimension:	3
Payload size:	12
Schema:	float Vp; float Vs; float density;
Application metadata:	Title:GarnerValley_0.5hz_10pts_1000ms Author:Elnza Date:02/27/2019 3 Vp(float);Vs(float);density(float) 33.640300 -116.859300 26250.000000 35000.000000 0.000000 4375.000000 1610612736 2147483648 268435456
Has interior nodes: no
Is empty: no
Total node count: 61312
Maximum leaf level 8
Minimum leaf level 6
Average leaf level 6.743215
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm2etree ucvm2etree_cvmh"
if diff $result_meta $expect_meta > /dev/null 2>&1
then
  echo [SUCCESS meta]
else
  echo [FAILURE meta]
fi

if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

if [ -x etreeinfo ]; then
    rm etreeinfo; rm ../libsrc;
fi
trap 'rm -f "$expect" "$result" "$expect_meta" "result_meta"' exit

