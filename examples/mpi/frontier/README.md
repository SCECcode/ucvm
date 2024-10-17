Configure frontier environment with this .bashrc file
<pre>
# This is the .bashrc. This runs on non-interactive sessions. Define
#  paths and others here. The interactive shell calls this one.
#
#
#export PATH=$PATH:.
source ~/.bash_profile
#module purge
module load PrgEnv-gnu
#module load python
#module load fftw
#module swap xl gcc
#We keep hanging on MPI_Finalize with darshan
module unload darshan-runtime

#export FFTW_INCDIR=/gpfs/alpine/geo112/proj-shared/pmaech/bbp_test/include
#export FFTW_LIBDIR=/gpfs/alpine/geo112/proj-shared/pmaech/bbp_test/lib

#export BBP_DIR=/gpfs/alpine/geo112/proj-shared/pmaech/bbp_test/bbp/bbp
#export BBP_GF_DIR=/gpfs/alpine/geo112/proj-shared/pmaech/bbp_test/bbp_gf
#export BBP_VAL_DIR=/gpfs/alpine/geo112/proj-shared/pmaech/bbp_test/bbp_val
#export PYTHONPATH=/gpfs/alpine/geo112/proj-shared/pmaech/bbp_test/bbp/bbp/comps:/gpfs/alpine/geo112/proj-shared/pmaech/bbp_test/bbp
/bbp/comps/PySeismoSoil:
#export BBP_DATA_DIR=/gpfs/alpine/geo112/proj-shared/pmaech/bbp_test/bbp_data
#export PATH=/gpfs/alpine/geo112/proj-shared/pmaech/bbp_test/bbp/bbp/comps:/gpfs/alpine/geo112/proj-shared/pmaech/bbp_test/bbp/bbp/u
tils/batch:$PATH
#ulimit -s unlimited
export PATH="/lustre/orion/geo112/proj-shared/pmaech/miniconda_frontier/bin:$PATH"
source /lustre/orion/geo112/proj-shared/pmaech/ucvm227/conf/ucvm_env.sh
</pre>

Resulting module list
<pre>
[pmaech@login09.frontier ~]$ module list

Currently Loaded Modules:
  1) craype-x86-trento        5) xpmem/2.6.2-2.5_2.22__gd067c3f.shasta   9) cray-dsmml/0.2.2       13) hsi/default
  2) libfabric/1.15.2.0       6) cray-pmi/6.1.8                         10) cray-mpich/8.1.23      14) DefApps/default
  3) craype-network-ofi       7) gcc/12.2.0                             11) cray-libsci/22.12.1.1
  4) perftools-base/22.12.0   8) craype/2.7.19                          12) PrgEnv-gnu/8.3.3
  
</pre>
