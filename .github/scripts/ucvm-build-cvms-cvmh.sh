#!/bin/bash

#sudo apt-get install gfortran
mkdir $UCVM_INSTALL_PATH

##["cvms5", "cca", "cs173", "cs173h", "cvms4", "cvms426", "cencal080", "cvmh-15.1.1", "albacore", "cvlsu", "ivlsu"]

cd $UCVM_SRC_PATH/largefiles
./get_large_files.py << EOF
n
n
n
n
y
n
n
y
n
n
n
EOF
cd $UCVM_SRC_PATH/largefiles; ./check_largefiles_md5.py
cd $UCVM_SRC_PATH/largefiles; ./stage_large_files.py

cd $UCVM_SRC_PATH
./ucvm_setup.py -d -a << EOF &> ucvm_setup_install.log
$UCVM_INSTALL_PATH
EOF

