#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
SCRATCH=./scratch
TEST=ucvm2mesh_mpi_layer_sfcvm

rm -rf southbay_sfcvm_layer.grid southbay_sfcvm_layer.media southbay_sfcvm_layer.conf ucvm2mesh_mpi_layer ucvm.conf 

cp ${BIN_DIR}/ucvm2mesh_mpi_layer .
cp ${CONF_DIR}/ucvm.conf .

sed 's ${CONF_DIR} '$CONF_DIR' ' southbay_sfcvm.conf_template | sed 's ${TYPE} '_layer' ' | sed 's ${SCRATCH} '$SCRATCH' ' > southbay_sfcvm_layer.conf

salloc ${UCVM_SALLOC_ENV} -Q --nodes=2 --ntasks=4 --ntasks=4 --time=00:30:00 srun -Q -o ${TEST}_1.srun.out ./ucvm2mesh_mpi_layer -f southbay_sfcvm_layer.conf -l 1 -c 3
salloc ${UCVM_SALLOC_ENV} -Q --nodes=1 --ntasks=4 --time=00:30:00 srun -Q -o ${TEST}_2.srun.out ./ucvm2mesh_mpi_layer -f southbay_sfcvm_layer.conf -l 4 -c 3 
salloc ${UCVM_SALLOC_ENV} -Q --nodes=1 --ntasks=4 --time=00:30:00 srun -Q -o ${TEST}_3.srun.out ./ucvm2mesh_mpi_layer -f southbay_sfcvm_layer.conf -l 7 -c 4 

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

od southbay_sfcvm_layer.grid |head -20 > $result 2>& 1

cat > $expect << EOF_EXPECTED_RESULT
0000000 016333 141650 072645 140136 073774 133602 120154 040102
0000020 000000 000000 000000 000000 161634 150623 072642 140136
0000040 043563 026044 120151 040102 000000 000000 000000 000000
0000060 032263 157600 072637 140136 065550 120305 120145 040102
0000100 000000 000000 000000 000000 010041 166555 072634 140136
0000120 161736 012545 120142 040102 000000 000000 000000 000000
0000140 072746 175532 072631 140136 130324 105005 120136 040102
0000160 000000 000000 000000 000000 063003 004510 072627 140136
0000200 151110 177244 120132 040102 000000 000000 000000 000000
0000220 160164 013466 072624 140136 044072 071503 120127 040102
0000240 000000 000000 000000 000000 162475 022445 072621 140136
0000260 011260 163741 120123 040102 000000 000000 000000 000000
0000300 072135 031425 072616 140136 030646 056176 120120 040102
0000320 000000 000000 000000 000000 106722 040405 072613 140136
0000340 122437 150432 120114 040102 000000 000000 000000 000000
0000360 030634 047366 072610 140136 066431 042666 120111 040102
0000400 000000 000000 000000 000000 057676 056347 072605 140136
0000420 104626 135121 120105 040102 000000 000000 000000 000000
0000440 014066 065331 072602 140136 175225 027353 120102 040102
0000460 000000 000000 000000 000000 055402 074313 072577 140136
EOF_EXPECTED_RESULT

cp $result result-sfcvm-layer
cp $expect expect-sfcvm-layer

echo "Running examples_programs_mesh" ${TEST}
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

