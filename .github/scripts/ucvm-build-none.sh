#!/bin/bash

## do not include any additional model

tmp=`uname -s`

#sudo apt-get install gfortran

if [ $tmp == 'Darwin' ]; then
## make sure have automake/aclocal
  brew install libtool
  brew install pipx
  brew install automake
  brew reinstall gcc
  export PATH="/opt/homebrew/opt/libtool/libexec/gnubin:$PATH"
fi

mkdir $UCVM_INSTALL_PATH

cd $UCVM_SRC_PATH/largefiles
./get_largefiles.py -m none

if [ $tmp != 'Darwin' ]; then
  cd $UCVM_SRC_PATH/largefiles; ./check_largefiles_md5.py
fi
cd $UCVM_SRC_PATH/largefiles; ./stage_largefiles.py

cd $UCVM_SRC_PATH
./ucvm_setup.py -d -a << EOF &> ucvm_setup_install.log
$UCVM_INSTALL_PATH
EOF

#more ucvm_setup_install.log

