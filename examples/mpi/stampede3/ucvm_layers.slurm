#!/bin/bash

#SBATCH -t 00:30:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --partition=skx
#SBATCH --account=DS-Cybershake
#SBATCH --output=skx_etas-%x.%j.out
#SBATCH --error=skx_etas-%x.%j.err
#SBATCH --mail-user=maechlin@usc.edu
#SBATCH --mail-type=ALL
#SBATCH --export=ALL

####################
## Configuration ##
####################

source /work2/00329/tg456034/stampede3/ucvm_257/conf/ucvm_env.sh
cp ${UCVM_INSTALL_PATH}/bin/ucvm2mesh_mpi_layer .

ibrun -n 4 ./ucvm2mesh_mpi_layer -f la_habra_cvmsi.conf -l 1 -c 3 &
ibrun -n 4 ./ucvm2mesh_mpi_layer -f la_habra_cvmsi.conf -l 4 -c 3 &
ibrun -n 4 ./ucvm2mesh_mpi_layer -f la_habra_cvmsi.conf -l 7 -c 4 &

wait
echo "Simulation complete. Exit code: $RET"
date

