#!/bin/bash
#SBATCH -A geo112
#SBATCH -J ucvm_one_node_mpi_basin_test
#SBATCH -o %x-%j.out
#SBATCH -t 0:10:00
#SBATCH -p batch
#SBATCH -N 1
#SBATCH --threads-per-core=1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=maechlin@usc.edu
cd $MEMBERWORK/geo112/ucvm
cp $PROJWORK/geo112/pmaech/test_ucvm/test_ucvm_basin_mpi.sh ./test_ucvm_basin_mpi.sh
srun -N1 -n2 -c1 --cpu-bind=threads --threads-per-core=1 block:cyclic ./test_ucvm_basin_mpi.sh
cp basin_query_mpi_cvms5.simple $PROJWORK/pmaech/test_ucvm/basin_query_mpi_cvms5.simple
