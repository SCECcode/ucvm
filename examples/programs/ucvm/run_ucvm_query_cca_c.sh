#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=cca

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -c gd -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cca_gd.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -c ge -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cca_ge.txt  >> $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as z mode.
 -118.7950    36.4140      0.000   1798.774    710.100        cca   5374.303   3053.654   2544.007       none      0.000      0.000      0.000      crust   5374.303   3053.654   2544.007
 -118.7950    36.4140    500.000   1798.774    710.100        cca   5367.673   3049.543   2542.755       none      0.000      0.000      0.000      crust   5367.673   3049.543   2542.755
 -118.7950    36.4140   1000.000   1798.774    710.100        cca   5343.324   3034.676   2538.271       none      0.000      0.000      0.000      crust   5343.324   3034.676   2538.271
 -118.7950    36.4140   3000.000   1798.774    710.100        cca   5544.159   3171.007   2581.869       none      0.000      0.000      0.000      crust   5544.159   3171.007   2581.869
 -118.7950    36.4140   5000.000   1798.774    710.100        cca   5951.625   3467.630   2696.170       none      0.000      0.000      0.000      crust   5951.625   3467.630   2696.170
 -120.0850    37.2060      0.000    122.967    517.530        cca   4284.075   2472.753   2411.092       none      0.000      0.000      0.000      crust   4284.075   2472.753   2411.092
 -120.0850    37.2060    500.000    122.967    517.530        cca   4806.075   2792.233   2473.988       none      0.000      0.000      0.000      crust   4806.075   2792.233   2473.988
 -120.0850    37.2060   1000.000    122.967    517.530        cca   5104.055   2979.978   2522.348       none      0.000      0.000      0.000      crust   5104.055   2979.978   2522.348
 -120.0850    37.2060   3000.000    122.967    517.530        cca   5463.962   3128.765   2567.770       none      0.000      0.000      0.000      crust   5463.962   3128.765   2567.770
 -120.0850    37.2060   5000.000    122.967    517.530        cca   5524.818   3155.166   2576.524       none      0.000      0.000      0.000      crust   5524.818   3155.166   2576.524
 -121.4440    36.2370      0.000    239.454    385.100        cca   2728.506   1533.761   2267.914       none      0.000      0.000      0.000      crust   2728.506   1533.761   2267.914
 -121.4440    36.2370    500.000    239.454    385.100        cca   4109.579   2266.308   2379.668       none      0.000      0.000      0.000      crust   4109.579   2266.308   2379.668
 -121.4440    36.2370   1000.000    239.454    385.100        cca   4834.095   2869.375   2492.675       none      0.000      0.000      0.000      crust   4834.095   2869.375   2492.675
 -121.4440    36.2370   3000.000    239.454    385.100        cca   5827.523   3487.871   2704.919       none      0.000      0.000      0.000      crust   5827.523   3487.871   2704.919
 -121.4440    36.2370   5000.000    239.454    385.100        cca   5957.999   3561.834   2737.911       none      0.000      0.000      0.000      crust   5957.999   3561.834   2737.911
 -120.4870    34.2220      0.000   -252.000    180.000        cca   5102.440   2870.915   2493.066       none      0.000      0.000      0.000      crust   5102.440   2870.915   2493.066
 -120.4870    34.2220    500.000   -252.000    180.000        cca   5102.726   2870.835   2493.046       none      0.000      0.000      0.000      crust   5102.726   2870.835   2493.046
 -120.4870    34.2220   1000.000   -252.000    180.000        cca   5116.871   2878.825   2495.078       none      0.000      0.000      0.000      crust   5116.871   2878.825   2495.078
 -120.4870    34.2220   3000.000   -252.000    180.000        cca   5372.349   3039.409   2539.691       none      0.000      0.000      0.000      crust   5372.349   3039.409   2539.691
 -120.4870    34.2220   5000.000   -252.000    180.000        cca   5623.723   3172.936   2582.522       none      0.000      0.000      0.000      crust   5623.723   3172.936   2582.522
 -121.8143    36.6509      0.000     43.756    313.533        cca   2482.278   1417.920   2241.739       none      0.000      0.000      0.000      crust   2482.278   1417.920   2241.739
 -121.8143    36.6509    500.000     43.756    313.533        cca   2903.587   1658.217   2291.858       none      0.000      0.000      0.000      crust   2903.587   1658.217   2291.858
 -121.8143    36.6509   1000.000     43.756    313.533        cca   3489.203   2012.901   2345.362       none      0.000      0.000      0.000      crust   3489.203   2012.901   2345.362
 -121.8143    36.6509   3000.000     43.756    313.533        cca   5640.649   3387.413   2662.637       none      0.000      0.000      0.000      crust   5640.649   3387.413   2662.637
 -121.8143    36.6509   5000.000     43.756    313.533        cca   5890.742   3531.134   2724.029       none      0.000      0.000      0.000      crust   5890.742   3531.134   2724.029
Using Geo Elevation coordinates as z mode.
 -118.7950    36.4140   1806.117   1798.774    710.100       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.7950    36.4140   1806.000   1798.774    710.100       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.7950    36.4140   1306.117   1798.774    710.100        cca   5367.771   3049.603   2542.774       none      0.000      0.000      0.000      crust   5367.771   3049.603   2542.774
 -118.7950    36.4140    806.117   1798.774    710.100        cca   5343.682   3034.894   2538.337       none      0.000      0.000      0.000      crust   5343.682   3034.894   2538.337
 -118.7950    36.4140  -1193.883   1798.774    710.100        cca   5543.032   3170.180   2581.595       none      0.000      0.000      0.000      crust   5543.032   3170.180   2581.595
 -118.7950    36.4140  -3193.883   1798.774    710.100        cca   5949.935   3466.417   2695.663       none      0.000      0.000      0.000      crust   5949.935   3466.417   2695.663
 -120.0850    37.2060    112.967    122.967    517.530        cca   4294.516   2479.143   2412.350       none      0.000      0.000      0.000      crust   4294.516   2479.143   2412.350
 -120.0850    37.2060   -377.033    122.967    517.530        cca   4806.075   2792.233   2473.988       none      0.000      0.000      0.000      crust   4806.075   2792.233   2473.988
 -120.0850    37.2060   -877.033    122.967    517.530        cca   5104.055   2979.978   2522.348       none      0.000      0.000      0.000      crust   5104.055   2979.978   2522.348
 -120.0850    37.2060  -2877.033    122.967    517.530        cca   5463.962   3128.765   2567.770       none      0.000      0.000      0.000      crust   5463.962   3128.765   2567.770
 -120.0850    37.2060  -4877.033    122.967    517.530        cca   5524.818   3155.166   2576.524       none      0.000      0.000      0.000      crust   5524.818   3155.166   2576.524
 -121.4440    36.2370    232.856    239.454    385.100        cca   2746.732   1543.429   2269.389       none      0.000      0.000      0.000      crust   2746.732   1543.429   2269.389
 -121.4440    36.2370    232.756    239.454    385.100        cca   2747.008   1543.575   2269.411       none      0.000      0.000      0.000      crust   2747.008   1543.575   2269.411
 -121.4440    36.2370   -267.144    239.454    385.100        cca   4119.141   2274.266   2381.159       none      0.000      0.000      0.000      crust   4119.141   2274.266   2381.159
 -121.4440    36.2370   -767.144    239.454    385.100        cca   4840.869   2873.883   2494.034       none      0.000      0.000      0.000      crust   4840.869   2873.883   2494.034
 -121.4440    36.2370  -2767.144    239.454    385.100        cca   5827.831   3488.061   2705.002       none      0.000      0.000      0.000      crust   5827.831   3488.061   2705.002
 -121.4440    36.2370  -4767.144    239.454    385.100        cca   5958.368   3562.062   2738.016       none      0.000      0.000      0.000      crust   5958.368   3562.062   2738.016
 -120.4870    34.2220   -253.000   -252.000    180.000        cca   5102.441   2870.915   2493.066       none      0.000      0.000      0.000      crust   5102.441   2870.915   2493.066
 -120.4870    34.2220   -252.500   -252.000    180.000        cca   5102.440   2870.915   2493.066       none      0.000      0.000      0.000      crust   5102.440   2870.915   2493.066
 -120.4870    34.2220   -752.000   -252.000    180.000        cca   5102.726   2870.835   2493.046       none      0.000      0.000      0.000      crust   5102.726   2870.835   2493.046
 -120.4870    34.2220  -1252.000   -252.000    180.000        cca   5116.871   2878.825   2495.078       none      0.000      0.000      0.000      crust   5116.871   2878.825   2495.078
 -120.4870    34.2220  -3252.000   -252.000    180.000        cca   5372.349   3039.409   2539.691       none      0.000      0.000      0.000      crust   5372.349   3039.409   2539.691
 -120.4870    34.2220  -5252.000   -252.000    180.000        cca   5623.723   3172.936   2582.522       none      0.000      0.000      0.000      crust   5623.723   3172.936   2582.522
 -121.8143    36.6509     43.731     43.756    313.533        cca   2482.299   1417.932   2241.741       none      0.000      0.000      0.000      crust   2482.299   1417.932   2241.741
 -121.8143    36.6509   -496.269     43.756    313.533        cca   2950.465   1686.610   2296.141       none      0.000      0.000      0.000      crust   2950.465   1686.610   2296.141
 -121.8143    36.6509   -956.269     43.756    313.533        cca   3489.240   2012.922   2345.365       none      0.000      0.000      0.000      crust   3489.240   2012.922   2345.365
 -121.8143    36.6509  -2956.269     43.756    313.533        cca   5640.653   3387.415   2662.637       none      0.000      0.000      0.000      crust   5640.653   3387.415   2662.637
 -121.8143    36.6509  -4956.269     43.756    313.533        cca   5890.744   3531.135   2724.029       none      0.000      0.000      0.000      crust   5890.744   3531.135   2724.029
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_cca_c"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

