#!/bin/bash
#SBATCH -A geo112
#SBATCH -J lahabra_20m_mesh
#SBATCH -o %x-%j.out
#SBATCH -t 2:00:00
#SBATCH -p batch
#SBATCH -N 125
#SBATCH --threads-per-core=1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=maechlin@usc.edu
echo "start"
date +"%s"
cd $MEMBERWORK/geo112/ucvm
cp $PROJWORK/geo112/pmaech/test_ucvm/lahabra_20m.conf ./lahabra_20m.conf
srun -N 125 -n 6250 -c 1 --cpu-bind=threads --threads-per-core=1 $PROJWORK/geo112/pmaech/ucvm227/bin/ucvm2mesh_mpi -f ./lahabra_20m.
conf
echo "mesh complete"
date +"%s"
cp mesh_cvmsi_lahabra_20m_mpi.media $PROJWORK/geo112/pmaech/test_ucvm/mesh_cvmsi_lahabra_20m_mpi.media
cp mesh_cvmsi_lahabra_20m_mpi.grid  $PROJWORK/geo112/pmaech/test_ucvm/mesh_cvmsi_lahabra_20m_mpi.grid
echo "mesh copied"
date +"%s"
