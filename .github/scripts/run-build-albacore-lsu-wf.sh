#!/bin/bash

#sudo apt-get install gfortran
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
n
y
y
y
EOF

if [ $tmp != 'Darwin' ]; then
  cd $UCVM_SRC_PATH/largefiles; ./check_largefiles_md5.py
fi
cd $UCVM_SRC_PATH/largefiles; ./stage_largefiles.py

cd $UCVM_SRC_PATH
./ucvm_setup.py -d -a << EOF &> ucvm_setup_install.log
$UCVM_INSTALL_PATH
EOF

