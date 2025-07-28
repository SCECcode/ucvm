#!/bin/bash

#SBATCH -t 00:30:00
#SBATCH -N 1
#SBATCH -n 40
#SBATCH --partition=skx-dev
#SBATCH --account=DS-Cybershake
#SBATCH --output=tiny_ucvm-%x.%j.out
#SBATCH --error=tiny_ucvm-%x.%j.err
#SBATCH --mail-user=maechlin@usc.edu
#SBATCH --mail-type=ALL
#SBATCH --export=ALL

####################
## Configuration ##
####################

source /work2/00329/tg456034/stampede3/ucvm_257/conf/ucvm_env.sh
cp ${UCVM_INSTALL_PATH}/bin/ucvm2mesh_mpi .
echo "Starting Mesh"
ibrun ./ucvm2mesh_mpi -f ./lahabra_200m.conf
date +"%s"
echo "Simulation complete. Exit code: $RET"

