#!/usr/bin/sh

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi

## setup mpi environment
source /usr/usc/openmpi/default/setup.sh

rm -rf ucvm2mesh-mpi ucvm.conf small-cvmsi.conf small_cvmsi.grid small_cvmsi.media

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
SCRATCH=./scratch

cp ${BIN_DIR}/ucvm2mesh-mpi .
cp ${CONF_DIR}/ucvm.conf .

sed 's ${SCRATCH} '$SCRATCH' ' small_cvmsi.conf_template > small_cvmsi.conf

salloc -N 4 --ntasks=8 --time=00:30:00 srun --ntasks=8 -v --mpi=pmi2 ${BIN_DIR}/ucvm2mesh-mpi -f small_cvmsi.conf


