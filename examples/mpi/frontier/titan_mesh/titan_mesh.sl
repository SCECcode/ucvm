#!/bin/bash
#SBATCH -A geo112
#SBATCH -J titan_mesh
#SBATCH -o %x-%j.out
#SBATCH -t 0:10:00
#SBATCH -p batch
#SBATCH -N 2
#SBATCH --threads-per-core=1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=maechlin@usc.edu
cd $MEMBERWORK/geo112/ucvm
cp $PROJWORK/geo112/pmaech/test_ucvm/titan_mesh.conf ./titan_mesh.conf
srun -N 2 -n 20 -c 1 --cpu-bind=threads --threads-per-core=1 $PROJWORK/geo112/pmaech/ucvm227/bin/ucvm2mesh_mpi -f ./titan_mesh.conf
cp mesh_cvmsi_sord_2000m_mpi.media $PROJWORK/geo112/pmaech/test_ucvm/mesh_cvmsi_sord_2000m_mpi.media
cp mesh_cvmsi_sord_2000m_mpi.grid  $PROJWORK/geo112/pmaech/test_ucvm/mesh_cvmsi_sord_2000m_mpi.grid
