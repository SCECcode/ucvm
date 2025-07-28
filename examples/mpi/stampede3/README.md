We installed and tested UCVM\_25\_7 on Stampede3 

== Modules used on Stampede3 ==
* Successful Build with these modules

```


login4.stampede3(1347)$ module list

Currently Loaded Modules:
  1) autotools/1.4   2) cmake/3.31.5   3) xalt/3.1.1   4) python/3.9.18   5) TACC   6) gcc/13.2.0   7) impi/21.11


```


This successful build required moving the cs248 .dat files from ucvm\_src/work/model/cs248 over to the install directory. After automated install, that directory only included the .gz files, and not the .dat files, so the model access tests were failing. This very large model will be removed from the install prompts because it exceed 350GB in size, unreasonable for most modelers.

* Failed Builds with these modules


```

login4.stampede3(1151)$ module list

Currently Loaded Modules:
  1) intel/24.0   2) impi/21.11   3) autotools/1.4   4) cmake/3.31.5   5) xalt/3.1.1   6) python/3.9.18   7) TACC

module load gcc/15.1.0

login4.stampede3(1200)$ module list

Currently Loaded Modules:
  1) autotools/1.4   2) cmake/3.31.5   3) xalt/3.1.1   4) python/3.9.18   5) TACC   6) gcc/15.1.0   7) impi/21.15


```


These compilers failed to include a method "powxxx" which is needed by ssh\_generate, so one of the acceptance tests was failing with these other compilers with "Starting pow3iso Segmentation fault (core dumped)"

== Define Install Parameters ==
# These need to be defined in your .bashrc during installation. After installation, they can be removed from the .bashrc because they will be defined at run-time when the ucvm\_env.sh is run

* export UCVM\_SRC\_PATH=$WORK/ucvm\_src/ucvm
* export UCVM\_INSTALL\_PATH=$WORK/ucvm\_257

== Automated Install of all models ==

```


# Unbuffer python log files so results are visible during build
export PYTHONUNBUFFERED=TRUE

#
#
# Automatically sets up UCVMC and alerts the user to potential complications.
#

./ucvm\_setup.py -a -d -p your-ucvm-install-path >& ucvm\_setup\_install.log  &

#	-s  --static       Use static linking.
#	-d  --dynamic      Use dynamic linking.
#	-a  --all          Use all available models.
#	-r  --restart      This is a restart of ucvm\_setup.py call.
#	-p  --path         use supplied installation path.
#	-h  --help         usage.
#UCVMC 25.7.0

```


== Run Tests ==


```

$ make check -- in build directory

or

$ ./run-testing - in install directory/tests


```


== Determine if MPI executable were built ==
After the ucvm\_env.sh is run, you can dtermine if mpi executable were built by running an mpi command:

* basin\_query\_mpi

If this has been build, the other mpi executable should also be built!

== GitHub UCVM Info Page ==
Update the link on github page from this to a replacement:
https://www.scec.org/research/ucvm

== Unit Test and Accept Test ==
% make check

== MPI Tests ==
* Simple basin\_query\_mpi Tests
The first two tests required the basin\_query\_mpi executable, and the cvms5 model. The tests extract some basin depth values from a model. It then compares the extracted data from expected data that is included in input file The command used is:

```

login1.stampede3(1761)$ basin\_query\_mpi -h
Usage: basin\_query\_mpi [-h] [-b outfile] [-m models<:ifunc>] [-f config] [-d max\_depth] [-i inter] [-v vs\_thresh] [-l lon,lat] [-s spacing] [-x num lon pts] [-y num lat pts]

where:
	-b Binary output to file.
	-h This help message
	-f Configuration file. Default is ./ucvm.conf.
	-i Interval between query points along z-axis (m, default is 20.0)
	-m Comma delimited list of crustal/GTL models to query in order
	-v Vs threshold (m/s, default is 1000.0).
	-l Bottom-left lat,lon separated by comma.
	-s Grid spacing.
	-x Number of longitude points.
	-y Number of latitude points.
Notes:
	- If running interactively, type Cntl-D to end input coord list.

Version: 25.7.


```


```

ibrun ${UCVM\_INSTALL\_PATH}/bin/basin\_query\_mpi -b ./${TEST}.simple \
  -f ${UCVM\_INSTALL\_PATH}/conf/ucvm.conf -m cvms5 -i 20 -v 2500 -l 35.0,-122.5 -s 0.1 -x 16 -y 11

These parameters mean:
-b output binary file
-m use model cvms5
-i interval between query points 20m
-v find depth to Vs2500
-l bottom left of region to search
-s grid spacing in degree
-x number of lat points
-y number of lon points

```

* twotasks\_onenode.slurm - Test on 1 node with two tasks on one node
* twotasks\_twonodes.slurm - Test on 2 nodes with one task per node for a total of two tasks

== ucvm2mesh\_mpi numerical considerations ==
To figure our how to divide your ucvm2mesh\_mpi job onto multiple processors, first calculate the total mesh points. We will use the following example, which defines a 1760800 mesh point mesh.

# Number of cells along each dim
nx=384
ny=248
nz=25

To divide the ucvm queries among several processors, we need to specify the length, width, and depth of our simulation volume. The length of the volume is defined as nx * spacing, the width is ny * spacing, and the depth is nz * spacing.

For the MPI version of ucvm2mesh-mpi, we need to specify the number of processors to dedicate to each axis. The total number of processors required is px * py * pz. For this example, we would need 20 cores dedicated to this task. Using our example above, we can divide the nx mesh points by 2, the number of ny mesh points by 2, and the number of nz mesh points by 5. So the number of processors in each direction can be used:

Then we divide the mesh points onto a number of processors, in each direction. An important constraint is that the number of mesh points must evenly by the number of processors. The guideline for the processors are that px * py * pz = num processors in the job. So for each x, y, and z, nx / px, ny / py, nz / pz, must be whole numbers. So if nx is 1000, px cannot be 3 but px can be 5. If you have a prime number of mesh points in a direction, you must use 1, or the prime number of processors.

# Partitioning of grid among processors
px=2
py=2
pz=5

For ucvm2mesh-mpi, we need to specify the number of processors to dedicate to each axis. The total number of processors required is px * py * pz. For this example, we would need 20 cores dedicated to this task.
Seismological parameters

== Simple ucvm2mesh\_mpi tests ==
These tests call the ucvm2mesh\_mpi and ucvm2mesh\_mpi\_layer to generate a small mesh file. It's not clear if the stampede3 system will do variable substitution, so we put absoluate path names into this file instead of environment variables defined on stamped3 including $WORK and $SCRATCH
the 20x20x50 mesh points are 20,000 pts total. The model used is cvmsi. The input configuration file is:

```

# List of CVMs to query
ucvmlist=cvmsi

# UCVM conf file
ucvmconf=/work2/00329/tg456034/stampede3/ucvm\_257/conf/ucvm.conf

# Gridding cell centered or vertex
gridtype=CENTER

# Spacing of cells
spacing=20.0

# Projection
proj=+proj=utm +datum=WGS84 +zone=11
rot=-39.9
x0=-118.20819
y0=33.85173
z0=0.0

# Number of cells along each dim
nx=20
ny=20
nz=50

# Partitioning of grid among cores
px=2
py=2
pz=10

# Vs/Vp minimum
vp\_min=0
vs\_min=0


# Mesh and grid files, format
meshfile=la\_habra\_cvmsi.media
gridfile=la\_habra\_cvmsi.grid
meshtype=IJK-12

# Location of scratch dir
scratch=/scratch/00329/tg456034

```


* ucvm2mesh\_mpi
This slurm script is called: ucvm\_mpi.slurm
It appears that the ibrun pre-processing has problems parsing the *.conf file without spaces between the +datum value. We currently resolve this issue by copying the executable to the local directory, then running the script. The slurm script looks like this:

Based on the Stamped3 documentation, they recommend defining -N (number of nodes) and -n (total number of cores (aka tasks), the letting the ibrun figure out how to distribut them. As a result, we remove additional command line params from the ibrun command.

In this case, we are saying run on one node, and use twenty cores.

There is a restriction that the number of cores (as calculated from the .conf file 2 * 2 * 10 = 40) must be evently divisible by the number of cores requested (which is 20).

```

ucvm\_mpi.slurm
::::::::::::::
#!/bin/bash

#SBATCH -t 00:30:00
#SBATCH -N 1
#SBATCH -n 20
#SBATCH --partition=skx
#SBATCH --account=DS-Cybershake
#SBATCH --output=ucvm\_mpi-%x.%j.out
#SBATCH --error=ucvm\_mpi-%x.%j.err
#SBATCH --mail-user=maechlin@usc.edu
#SBATCH --mail-type=ALL
#SBATCH --export=ALL

####################
## Configuration ##
####################

source /work2/00329/tg456034/stampede3/ucvm\_257/conf/ucvm\_env.sh
cp ${UCVM\_INSTALL\_PATH}/bin/ucvm2mesh\_mpi .

ibrun ./ucvm2mesh\_mpi -f ./la\_habra\_cvmsi.conf

```


the manual page for the ucvm2mesh\_mpi comamand is:

```

login1.stampede3(1777)$ ucvm2mesh\_mpi -h
[0] ucvm2mesh\_mpi Version: 25.7.0
[0] Running on 1 cores
Usage: ucvm2mesh\_mpi [-h] [-o dir] -f configfile

where:
	-h: help message
	-o: final stage out directory for mesh files
	-f: config file containing mesh params

Config file format:
	ucvmlist: comma-delimited list of CVMs to query (as supported by UCVM)
	ucvmconf: UCVM API config file
	gridtype: location of x-y gridded points: VERTEX, or CENTER
	querymode: query mode, DEPTH, or ELEVATION
	spacing: grid spacing (units appropriate for proj)
	proj: Proj.4 projection specification, or 'cmu' for TeraShake
	rot: proj rotation angle in degrees, (+ is counter-clockwise)
	x0: longitude of origin (deg), or x offset in cmu proj (m)
	y0: latitude of origin (deg), or y offset in cmu proj (m)
	z0: depth of origin (m, typically 0.0)
	nx: number of points along x-axis
	ny: number of points along y-axis
	nz: number of points along z-axis (depth positive)
	px: number of procs along x-axis
	py: number of procs along y-axis
	pz: number of procs along z-axis
	vp\_min: vp minimum (m/s), enforced on vs\_min conditions
	vs\_min: vs minimum (m/s)
	meshfile: path and basename to output mesh files
	gridfile: path and filename to output grid filesfiles
	meshtype: mesh format: IJK-12, IJK-20, IJK-32, or SORD
	scratch: path to scratch space

Version: 25.7.0

```


The second test is also a small mesh, but it is extracted in layers. This calls three 

```

#!/bin/bash

#SBATCH -t 00:30:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --partition=skx
#SBATCH --account=DS-Cybershake
#SBATCH --output=skx\_etas-%x.%j.out
#SBATCH --error=skx\_etas-%x.%j.err
#SBATCH --mail-user=maechlin@usc.edu
#SBATCH --mail-type=ALL
#SBATCH --export=ALL

####################
## Configuration ##
####################

source /work2/00329/tg456034/stampede3/ucvm\_257/conf/ucvm\_env.sh
cp ${UCVM\_INSTALL\_PATH}/bin/ucvm2mesh\_mpi\_layer .

ibrun -n 4 ./ucvm2mesh\_mpi\_layer -f la\_habra\_cvmsi.conf -l 1 -c 3 &
ibrun -n 4 ./ucvm2mesh\_mpi\_layer -f la\_habra\_cvmsi.conf -l 4 -c 3 &
ibrun -n 4 ./ucvm2mesh\_mpi\_layer -f la\_habra\_cvmsi.conf -l 7 -c 4 &

wait
echo "Simulation complete. Exit code: $RET"
date

```


the man pages for this command are:

```

login1.stampede3(1780)$ ucvm2mesh\_mpi\_layer -h
[0] ucvm2mesh\_mpi\_layer Version: 25.7.0
[0] Running on 1 cores
Usage: ucvm2mesh\_mpi\_layer [-h] [-o dir] -f configfile [-l layer] [-c count]

where:
	-h: help message
	-f: config file containing mesh params

	-l: which rank layer to start process

	-c: how many rank layer to process

Config file format:
	ucvmlist: comma-delimited list of CVMs to query (as supported by UCVM)
	ucvmconf: UCVM API config file
	gridtype: location of x-y gridded points: VERTEX, or CENTER
	querymode: query mode, DEPTH, or ELEVATION
	spacing: grid spacing (units appropriate for proj)
	proj: Proj.4 projection specification, or 'cmu' for TeraShake
	rot: proj rotation angle in degrees, (+ is counter-clockwise)
	x0: longitude of origin (deg), or x offset in cmu proj (m)
	y0: latitude of origin (deg), or y offset in cmu proj (m)
	z0: depth of origin (m, typically 0.0)
	nx: number of points along x-axis
	ny: number of points along y-axis
	nz: number of points along z-axis (depth positive)
	px: number of procs along x-axis
	py: number of procs along y-axis
	pz: number of procs along z-axis
	vp\_min: vp minimum (m/s), enforced on vs\_min conditions
	vs\_min: vs minimum (m/s)
	meshfile: path and basename to output mesh files
	gridfile: path and filename to output grid filesfiles
	meshtype: mesh format: IJK-12, IJK-20, IJK-32, or SORD
	scratch: path to scratch space

Version: 25.7.0

```


== large mesh generation ==
This creates three meshes using ucvm2mesh\_mpi. The first two are small examples to show the configuration is usable and executable okay. The third is a large mesh, 20m used for La Habra simulation with over 1B points. This is a fairly large stress test for the software and the system.
* The first two scripts called:
**tiny.slurm

```

#SBATCH -t 00:30:00
#SBATCH -N 1
#SBATCH -n 20
#SBATCH --partition=skx
#SBATCH --account=DS-Cybershake
#SBATCH --output=tiny\_ucvm-%x.%j.out
#SBATCH --error=tiny\_ucvm-%x.%j.err
#SBATCH --mail-user=maechlin@usc.edu
#SBATCH --mail-type=ALL
#SBATCH --export=ALL

source /work2/00329/tg456034/stampede3/ucvm\_257/conf/ucvm\_env.sh
cp ${UCVM\_INSTALL\_PATH}/bin/ucvm2mesh\_mpi .
ibrun ./ucvm2mesh\_mpi -f ./lahabra\_200m.conf
date +"%s"
echo "Simulation complete. Exit code: $RET"



```

We then use a lahabra\_200m.conf configuration file. This limits the number of requested processor so that we can test the configuraiton and slurm files, before running full scale. This sizes the job at 40 cores, so the requested core of 20 evenly divides this count

```

login1.stampede3(1788)$ more lahabra\_200m.conf
# List of CVMs to query
ucvmlist=cvmsi

# UCVM conf file
ucvmconf=/work2/00329/tg456034/stampede3/ucvm\_257/conf/ucvm.conf

# Gridding cell centered or vertex
gridtype=CENTER

# Spacing of cells
spacing=20.0

# Projection
proj=+proj=utm +datum=WGS84 +zone=11
rot=-39.9
x0=-118.20819
y0=33.85173
z0=0.0

# Number of cells along each dim
nx=20
ny=20
nz=50

# Partitioning of grid among cores
px=2
py=2
pz=10

# Vs/Vp minimum
vp\_min=0
vs\_min=0


# Mesh and grid files, format
meshfile=la\_habra\_cvmsi.media
gridfile=la\_habra\_cvmsi.grid
meshtype=IJK-12

# Location of scratch dir
scratch=/scratch/00329/tg45603

```


We then test the full scale configuration file with test small.slurm. The cores in the .conf are 25 x 25 x10 or 6250.
We confirm that this is evenly divisible by the requested number of 

```

#!/bin/bash

#SBATCH -t 00:30:00
#SBATCH -N 25
#SBATCH -n 6250 
#SBATCH --partition=skx
#SBATCH --account=DS-Cybershake
#SBATCH --output=small\_ucvm-%x.%j.out
#SBATCH --error=small\_ucvm-%x.%j.err
#SBATCH --mail-user=maechlin@usc.edu
#SBATCH --mail-type=ALL
#SBATCH --export=ALL

####################
## Configuration ##
####################

source /work2/00329/tg456034/stampede3/ucvm\_257/conf/ucvm\_env.sh
cp ${UCVM\_INSTALL\_PATH}/bin/ucvm2mesh\_mpi .
echo "start"
date +"%s"
ibrun ./ucvm2mesh\_mpi -f ./lahabra\_20m.conf
date +"%s"
echo "Simulation complete. Exit code: $RET"

```


The input config file looks like this:

```

login1.stampede3(1793)$ more lahabra\_20m.conf
# List of CVMs to query
ucvmlist=cvmsi

# UCVM conf file
ucvmconf=/work2/00329/tg456034/stampede3/ucvm\_257/conf/ucvm.conf

# Gridding cell centered or vertex (CENTER, VERTEX)
gridtype=CENTER

# Spacing of cells
spacing=20.0

# Projection
proj=+proj=utm +datum=WGS84 +zone=11
rot=-39.9
x0=-118.20819
y0=33.85173
z0=0.0

# Number of cells along each dim
nx=1400
ny=1400
nz=600

# Partitioning of grid among processors (request px*py*pz processes in mpi submit)
px=25
py=25
pz=10

# Vs/Vp minimum
vp\_min=0
vs\_min=0

# Mesh and grid files. Meshtype must be one of valid formats (IJK-12, IJK-20, IJK-32, SORD)
meshfile=/scratch/00329/tg456034/mesh\_cvmsi\_lahabra\_20m\_mpi.media
gridfile=/scratch/00329/tg456034/mesh\_cvmsi\_lahabra\_20m\_mpi.grid
meshtype=IJK-32

# Location of scratch dir
scratch=/scratch/00329/tg456034

```
