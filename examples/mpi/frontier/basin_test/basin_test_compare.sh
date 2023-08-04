#!/bin/bash
## 
## Test case to run on Frontier
## This script od's the binary basin file, then diffs the two files, and
### prints an error if the diff file is non-zero
##

od ./basin_test.simple > ./basin_test_results.txt 2>&1

cat > ./basin_test_expected.txt << EOF_EXPECTED_RESULT
0000000 000000 137600 000000 137600 000000 137600 000000 000000
0000020 000000 000000 000000 000000 000000 000000 000000 000000
*
0000100 000000 137600 000000 137600 000000 137600 000000 137600
0000120 000000 000000 000000 000000 000000 000000 000000 000000
*
0000200 000000 137600 000000 137600 000000 137600 000000 137600
0000220 000000 137600 000000 000000 000000 000000 000000 000000
0000240 000000 000000 000000 000000 000000 000000 000000 000000
*
0000300 000000 137600 000000 137600 000000 137600 000000 137600
0000320 000000 137600 000000 137600 000000 000000 000000 000000
0000340 000000 000000 000000 000000 000000 000000 000000 000000
*
0000400 000000 137600 000000 137600 000000 137600 000000 137600
0000420 000000 137600 000000 137600 000000 137600 000000 000000
0000440 000000 000000 000000 000000 000000 000000 000000 000000
*
0000500 000000 137600 000000 137600 000000 137600 000000 137600
*
0000540 000000 000000 000000 000000 000000 000000 000000 000000
*
0000600 000000 137600 000000 137600 000000 137600 000000 137600
*
0000640 000000 137600 000000 000000 000000 000000 000000 000000
0000660 000000 000000 000000 000000 000000 000000 000000 000000
0000700 000000 137600 000000 137600 000000 137600 000000 137600
*
0000740 000000 137600 000000 137600 000000 000000 000000 000000
0000760 000000 000000 000000 000000 000000 000000 000000 000000
0001000 000000 137600 000000 137600 000000 137600 000000 137600
*
0001040 000000 137600 000000 137600 000000 137600 000000 000000
0001060 000000 000000 000000 000000 000000 000000 000000 000000
0001100 000000 137600 000000 137600 000000 137600 000000 137600
*
0001160 000000 000000 000000 000000 000000 000000 000000 000000
0001200 000000 137600 000000 137600 000000 137600 000000 137600
*
0001260 000000 137600 000000 000000 000000 000000 000000 000000
0001300
EOF_EXPECTED_RESULT

echo "Running frontier basin test basin_test for cvms5"
if diff basin_test_expected.txt basin_test_results.txt > /dev/null 2>&1
then
  echo [SUCCESS]
  echo "0"
else
  echo [FAILURE]
  echo "-1"
fi

trap 'rm -f "basin_test_expected.txt" "basin_test_results.txt"' exit