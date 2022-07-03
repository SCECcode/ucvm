#!/bin/bash

tmp=`uname -s`

MODEL=$1

if [ "$MODEL" == "" ]; then
   echo "FAIL: needs to supply a model name .."
   exit 1
fi

if [ $tmp == 'Darwin' ]; then
## make sure have automake/aclocal
  brew install automake
  brew reinstall gcc
fi

mkdir $UCVM_INSTALL_PATH

cd $UCVM_SRC_PATH/largefiles
./get_largefiles.py -m $MODEL

if [ $tmp != 'Darwin' ]; then
  cd $UCVM_SRC_PATH/largefiles; ./check_largefiles_md5.py
fi
cd $UCVM_SRC_PATH/largefiles; ./stage_largefiles.py

cd $UCVM_SRC_PATH
./ucvm_setup.py -d -a -p $UCVM_INSTALL_PATH  &> ucvm_setup_install.log

#more ucvm_setup_install.log

