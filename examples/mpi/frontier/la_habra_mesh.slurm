#!/bin/bash

#SBATCH -J la_habra           # Job name
#SBATCH -o la_habra.o%j       # Name of stdout output file
#SBATCH -e la_habra.e%j       # Name of stderr error file
#SBATCH -N 2                  # Total # of nodes 
#SBATCH -n 12 
#SBATCH -t 00:30:00           # Run time (hh:mm:ss)
#SBATCH --mail-user=mei@usc.edu
#SBATCH --mail-type=all
#SBATCH -A GEO156
#SBATCH -q debug
#SBATCH --open-mode=truncate

source /ccs/home/mei/scratch/TARGET_UCVM_SFCVM/ucvm_install/conf/ucvm_env.sh
cp ${UCVM_INSTALL_PATH}/bin/ucvm2mesh_mpi_layer .

srun -n 4  ./ucvm2mesh_mpi_layer -f la_habra_cvmsi.conf -l 1 -c 3 &
srun -n 4  ./ucvm2mesh_mpi_layer -f la_habra_cvmsi.conf -l 4 -c 3 &
srun -n 4  ./ucvm2mesh_mpi_layer -f la_habra_cvmsi.conf -l 7 -c 4 &
wait

