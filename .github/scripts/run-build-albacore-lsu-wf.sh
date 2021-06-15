#!/bin/bash

#sudo apt-get install gfortran
mkdir $UCVM_INSTALL_PATH

##["cvms5", "cca", "cs173", "cs173h", "cvms", "cvmsi", "cencal", "cvmh", "albacore", "cvlsu", "ivlsu", "wfcvm"]

cd $UCVM_SRC_PATH/largefiles
./get_large_files.py << EOF
n
n
n
n
n
n
n
n
y
y
y
y
EOF
cd $UCVM_SRC_PATH/largefiles; ./check_largefiles_md5.py
cd $UCVM_SRC_PATH/largefiles; ./stage_large_files.py

cd $UCVM_SRC_PATH
./ucvm_setup.py -d -a << EOF &> ucvm_setup_install.log
$UCVM_INSTALL_PATH
EOF

