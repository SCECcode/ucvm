#!/bin/bash

tmp=`uname -s`

MODEL=$1
BRANCH=$2

cd $UCVM_SRC_PATH/largefiles


# ignore for now
#if [ "$BRANCH" != "" ]; then
#   git checkout -b $BRANCH
#fi


if [ "$MODEL" == "" ]; then
   echo "FAIL: needs to supply a model name .."
   exit 1
fi

if [ $tmp == 'Darwin' ]; then
## make sure have automake/aclocal/libtool
  brew install libtool
  brew install automake
  brew install pipx
  brew reinstall gcc
  export PATH="/opt/homebrew/opt/libtool/libexec/gnubin:$PATH"
## needed by muscalnc
  python3 -m venv .venv
  source .venv/bin/activate
  python3 -m pip install --upgrade pip
  python3 -m pip install netCDF4
fi

mkdir $UCVM_INSTALL_PATH

cd $UCVM_SRC_PATH/largefiles
./get_largefiles.py -m $MODEL

if [ $tmp != 'Darwin' ]; then
  cd $UCVM_SRC_PATH/largefiles; ./check_largefiles_md5.py
fi
cd $UCVM_SRC_PATH/largefiles; ./stage_largefiles.py

cd $UCVM_SRC_PATH

export PYTHONUNBUFFERED=TRUE
./ucvm_setup.py -d -a -p $UCVM_INSTALL_PATH  &> ucvm_setup_install.log

more ucvm_setup_install.log

