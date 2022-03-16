#!/bin/bash

tmp=`uname -s`

#sudo apt-get install gfortran

if [ $tmp == 'Darwin' ]; then
## make sure have automake/aclocal
  brew install automake
fi

mkdir $UCVM_INSTALL_PATH

##["cvms5", "cca", "cs173", "cs173h", "cvms", "cvmsi", "cencal", "cvmh", "albacore", "cvlsu", "ivlsu"]

cd $UCVM_SRC_PATH/largefiles
./get_largefiles.py << EOF
n
n
n
n
n
n
n
y
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

cd $UCVM_SRC_PATH
make &> make.log

more make.log
#more ucvm_setup_install.log

