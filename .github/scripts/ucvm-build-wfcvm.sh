#!/bin/bash

tmp=`uname -s`

if [ $tmp == 'Darwin' ]; then
## make sure have automake/aclocal
  brew install automake
fi

mkdir $UCVM_INSTALL_PATH

##["cvms5", "cca", "cs173", "cs173h", "cvms", "cvmsi", "cencal", "cvmh", "albacore", "cvlsu", "ivlsu", "wfcvm","cvmhlabn"]

cd $UCVM_SRC_PATH/largefiles
./get_largefiles.py -m wfcvm

if [ $tmp != 'Darwin' ]; then
  cd $UCVM_SRC_PATH/largefiles; ./check_largefiles_md5.py
fi
cd $UCVM_SRC_PATH/largefiles; ./stage_largefiles.py

cd $UCVM_SRC_PATH
./ucvm_setup.py -d -a -p $UCVM_INSTALL_PATH  &> ucvm_setup_install.log

#more ucvm_setup_install.log

