#!/bin/bash

## do not include any additional model

tmp=`uname -s`

#sudo apt-get install gfortran

if [ $tmp == 'Darwin' ]; then
## make sure have automake/aclocal
  brew install libtool
  brew install automake
  brew reinstall gcc
fi

mkdir $UCVM_INSTALL_PATH

## ["cvms5", "cca", "cs173", "cs173h", "cvms", "cvmsi", "cencal", 
##  "cvmh", "albacore", "cvlsu", "ivlsu", "wfcvm","cvmhlabn"]

## "cvms5", "cca", "cs173", "cs173h", "cvms", "cvmsi", "cencal", 
## "cvmh", "albacore", "cvlsu", "ivlsu", "wfcvm", "cvmhlabn"

cd $UCVM_SRC_PATH/largefiles
./get_largefiles.py << EOF
n
n
n
n
n
n
n
n
n
n
EOF

if [ $tmp != 'Darwin' ]; then
  cd $UCVM_SRC_PATH/largefiles; ./check_largefiles_md5.py
fi
cd $UCVM_SRC_PATH/largefiles; ./stage_largefiles.py

cd $UCVM_SRC_PATH
./ucvm_setup.py -d -a << EOF &> ucvm_setup_install.log
$UCVM_INSTALL_PATH
EOF

#more ucvm_setup_install.log

