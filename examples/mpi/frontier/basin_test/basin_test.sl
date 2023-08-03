#!/bin/bash
#SBATCH -A geo112
#SBATCH -J basin_test
#SBATCH -o %x-%j.out
#SBATCH -t 0:10:00
#SBATCH -p batch
#SBATCH -N 1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=maechlin@usc.edu
cd $MEMBERWORK/geo112/ucvm
cp $PROJWORK/geo112/pmaech/test_ucvm/basin_test_compare.sh ./basin_test_compare.sh
srun  -N1 -n 2 $PROJWORK/geo112/pmaech/ucvm227/bin/basin_query_mpi -f $PROJWORK/geo112/pmaech/ucvm227/conf/ucvm.conf -m cvms5 -i 20 
-v 2500 -l 35.0,-122.5 -s 0.1 -x 16 -y 11 -b basin_test.simple
#cp basin_test.simple $PROJWORK/geo112/pmaech/test_ucvm/basin_test.simple
srun -N1 -n1 ./basin_test_compare.sh
