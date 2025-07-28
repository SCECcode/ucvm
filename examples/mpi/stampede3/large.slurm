#!/bin/bash

#SBATCH -t 10:00:00
#SBATCH -N 250
#SBATCH -n 6250
#SBATCH --partition=skx
#SBATCH --account=DS-Cybershake
#SBATCH --output=large_mesh-%x.%j.out
#SBATCH --error=large_mesh-%x.%j.err
#SBATCH --mail-user=maechlin@usc.edu
#SBATCH --mail-type=ALL
#SBATCH --export=ALL

####################
## Configuration ##
####################

source /work2/00329/tg456034/stampede3/ucvm_257/conf/ucvm_env.sh
cp ${UCVM_INSTALL_PATH}/bin/ucvm2mesh_mpi .
date +"%s"
ibrun ./ucvm2mesh_mpi -f ./lahabra_20m.conf
date +"%s"
echo "Simulation complete. Exit code: $RET"
