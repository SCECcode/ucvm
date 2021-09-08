The USC CARC system uses a module load system. We have installed UCVM using the following settings:

In addition, because of the use of Anaconda, we found it necessary to add a command to unset
unset PROJ_LIB

This needs to get unset after the UCVM environment and conda envs are defined. We add this to the end of the conda init in our .bashrc file.

This fixes an error initializing UCVM based on of the environment variable by both proj5 and ucvm.


(base) [maechlin@discovery1 ucvm]$ more ~/.bashrc
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# CARC Module Load system
# Load in this order to make fftw work
module purge
module load gcc/8.3.0
module load openmpi/4.0.2
module load pmix/3.1.3
export LD_PRELOAD=/spack/apps/gcc/8.3.0/lib64/libstdc++.so.6
source /project/scec_608/maechlin/ucvm_bin/conf/ucvm_env.sh 
# LD_LIBRARY_PATH=$LD_LIBRARY_PATH
#export FFTW_INCDIR=/project/scec_608/fsilva/fftw-3.3.8/include
#export FFTW_LIBDIR=/project/scec_608/fsilva/fftw-3.3.8/lib

# Setup BBP Environment
export BBP_DIR=/project/scec_608/maechlin/scecbbp/bbp/bbp
export BBP_GF_DIR=/project/scec_608/maechlin/scecbbp/bbp_gf
export BBP_VAL_DIR=/project/scec_608/maechlin/scecbbp/bbp_val
export BBP_DATA_DIR=/project/scec_608/maechlin/scecbbp/bbp_data
alias bbp="cd /project/scec_608/maechlin/scecbbp"

export PYTHONPATH=/project/scec_608/maechlin/scecbbp/bbp/bbp/comps:/project/scec_608/maechlin/scecbbp/bbp/bbp/comps/PySeismoSoil:$PYTHONPATH
export PATH=/project/scec_608/maechlin/scecbbp/bbp/bbp/comps:/project/scec_608/maechlin/scecbbp/bbp/bbp/utils/batch:$PATH
ulimit -s unlimited
export PATH

# UCVM specific aliases and functions
LD_LIBRARY_PATH=/project/scec_608/maechlin/ucvm_bin/lib/euclid3/lib:$LD_LIBRARY_PATH
LD_LIBRARY_PATH=/project/scec_608/maechlin/ucvm_bin/lib/proj-5/lib:$LD_LIBRARY_PATH
LD_LIBRARY_PATH=/project/scec_608/maechlin/ucvm_bin/model/cvms426/lib:$LD_LIBRARY_PATH
LD_LIBRARY_PATH=/project/scec_608/maechlin/ucvm_bin/model/cencal/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH
UCVM_INSTALL_PATH=/project/scec_608/maechlin/ucvm_bin
export UCVM_INSTALL_PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/project/scec_608/maechlin/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/project/scec_608/maechlin/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/project/scec_608/maechlin/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/project/scec_608/maechlin/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
unset PROJ_LIB
