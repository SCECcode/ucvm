#!/bin/bash
## 
## example of running on usc/hpc cluster
##

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST=basin_query_mpi_cvmsi_taper

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

salloc ${UCVM_SALLOC_ENV} -Q --nodes=1 --ntasks=2 --time=00:10:00 srun -Q -o ${TEST}.srun.out ${BIN_DIR}/basin_query_mpi -b ${TEST}.simple -f ${CONF_DIR}/ucvm.conf -m cvmsi,elygtl:taper -i 20 -v 2500 -l 33.25,-119.38 -s 0.1 -x 16 -y 11

od ${TEST}.simple > $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
0000000 000000 041602 000000 041602 000000 041534 000000 041602
0000020 000000 041614 000000 041614 000000 041652 000000 042377
0000040 000000 042207 000000 041640 000000 041652 000000 042226
0000060 100000 042242 000000 042076 000000 041614 000000 041626
0000100 000000 041602 000000 041534 000000 041560 000000 041614
0000120 000000 041614 000000 041626 000000 042110 000000 042160
0000140 000000 041640 000000 041560 000000 041602 100000 042223
0000160 000000 042360 100000 042254 000000 042040 000000 041652
0000200 000000 041560 000000 041602 000000 041640 000000 041652
0000220 000000 042021 000000 042014 000000 041640 000000 041626
0000240 000000 041534 000000 041510 000000 041614 000000 042146
0000260 000000 042327 040000 042403 100000 042305 100000 042235
0000300 000000 041614 000000 041652 000000 042226 140000 042612
0000320 100000 042261 000000 042172 000000 041652 000000 041614
0000340 000000 041602 000000 041614 000000 042021 100000 042211
0000360 100000 042312 140000 042443 100000 042447 000000 042353
0000400 000000 041652 000000 042177 000000 041664 000000 041652
0000420 100000 042235 000000 042177 000000 041640 000000 041626
0000440 000000 042071 000000 042264 100000 042261 000000 042233
0000460 140000 042455 040000 042530 100000 042543 000000 042515
0000500 000000 042221 020000 042617 000000 041640 000000 041602
0000520 000000 041640 000000 042177 000000 042160 000000 042127
0000540 000000 042177 000000 042264 000000 042276 000000 042407
0000560 100000 042454 100000 042473 160000 042615 040000 042427
0000600 000000 042264 000000 042633 000000 042640 000000 042221
0000620 100000 042216 000000 042310 100000 042300 000000 042214
0000640 000000 042221 000000 042052 100000 042411 100000 042466
0000660 140000 042532 020000 042631 040000 042477 100000 042574
0000700 000000 041664 040000 042627 060000 042601 040000 042410
0000720 000000 042310 000000 042310 100000 042331 000000 042226
0000740 000000 042134 000000 042346 000000 042452 120000 042626
0000760 140000 042655 000000 042541 100000 042473 100000 042416
0001000 000000 041614 000000 041626 000000 041640 000000 041640
0001020 140000 042424 140000 042400 000000 041626 000000 041626
0001040 000000 041614 000000 042064 000000 042452 000000 042377
0001060 000000 042414 100000 042411 040000 042573 000000 042346
0001100 000000 041664 000000 041626 040000 042516 000000 041640
0001120 000000 041640 000000 041640 000000 041640 100000 042430
0001140 000000 042327 000000 042226 000000 042172 000000 041640
0001160 000000 041640 100000 042273 000000 042310 000000 042252
0001200 100000 042647 120000 042676 120000 042614 100000 042411
0001220 000000 041640 040000 042410 000000 042141 000000 041640
0001240 100000 042411 040000 042542 100000 042324 000000 041640
0001260 000000 041640 000000 042103 000000 042207 000000 041652
0001300
EOF_EXPECTED_RESULT

echo "Running examples_programs_basin basin_query_mpi_cvmsi_taper"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi
                               
trap 'rm -f "$expect" "$result"' exit



