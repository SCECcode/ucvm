
[![ucvm-ci Actions Status](https://github.com/SCECcode/UCVM/workflows/ucvm-ci/badge.svg)](https://github.com/SCECcode/UCVM/actions)


# UCVM

## Current UCVM Software Release
The current UCVM software version is UCVM v21.X.0. We recommend that new users work with this most recent version.

UCVM is distributed as open-source scientific software. It can be installed compiled and run on most Linux-based computer systems if the system includes software development tools including Python, C, and Fortran compilers, and other software tools. The UCVM v21.X.0 source code is distributed using a github repository. On Github, users can find the source code, installation directions for Linux, and a wiki that provide examples and the expected results from UCVM.

## Background

The SCEC Unified Community Velocity Model (UCVM) software is used to access information, including estimated Vp and Vs seismic wave velocities and density, about the earth's crust. 

UCVM provides seismic velocity information for several California regions. Seismic velocities of rocks and sediments at shallow depths determine how strongly an area will shake. By assigning velocities to rock types in the 3-D geologic model, geologists can gain an understanding of the extent of areas of low shear velocity that are most likely to experience localized strong shaking and future earthquake damage. An important application for the models accessible through UCVM is for use in computer simulations of California earthquakes.

The Unified Community Velocity Model (UCVM) software framework is a collection of software tools designed to provide a standard interface to multiple, alternative, California velocity models. UCVM development is an interdisciplinary research collaboration involving geoscientists, computer scientists, and software developers. UCVM is used in high resolution 3D wave propagation simulations for California. 

The map below shows the coverage regions for currently supported California velocity models that are accessible through UCVM. Each of the models shown is considered a regional velocity model. Typically the models return values down to about 50km or 100km, but most models are undefined below 100km. For earth material properties below 100km, global seismic velocity models, such as the Preliminary Earth Reference Model (PREM), are possible alternative models.


<img src="documentation/coverage.png" width="80%">

Map shows coverage region for California CVMs registered into UCVM.
Coverage region for UCVM 2D maps (yellow) overlayed upon regions of various California 3D velocity models 
(
CVM-S4: red,
CVM-S4 geotechnical regions: red polygons, 
CVM-H high resolution: small light blue square,
CVM-H low resolution: larger light blue square,
USGS High Resolution Bay Area: small white rectangle,
USGS Low Resolution Bay Area: large white rectangle,
CVM-S4.26, CVM-S4.26M01: green, 
CCA 06: small yellow, 
CS17.3, CS17.3-H: large orange rectangle,
Havard San Joaquin Basin Model: small orange rectangle,
Havard Santa Maria Basin Model: orange square, 
CS18.5 Cypershake Study's Tiled Velocity Model: blue
) : [Coverage.kml](documentation/coverage.kml)

UCVM software repository contains a software codebase developed by Philip Maechling, Mei-Hui Su, David Gill, Patrick Small, and others at SCEC. UCVM is released as open-source scientific software under an Apache 2 software license.

UCVM was developed with support from National Science Foundation (NSF), US Geological Survey (USGS), and other sources.


## System and Software Requirements

Testing UCVM on all possible combinations of operating sysetms and software stacks requires more software developer resources than currently available. So, we have defined a UCVM reference software stack that we use to develop and test the software. This UCVM distrbution has been shown to work on the following reference software stack. It may work on other software stacks, also, but this is the supported software environment.

*  Linux operating system (e.g. CentOS 7 Linux) x86_64-linux 
*  GNU gcc/gfortran compilers version 4.8.5
*  Python 2 or 3 (Anaconda)
*  Autotools build software for Linux
*  Automake, Autoconf build tools for Linux
*  Git client

External Libraries installed by UCVM

*  Euclid Etree library: http://www.cs.cmu.edu/~euclid/ (provided during installation)
*  Proj.5 projection library: http://trac.osgeo.org/proj/ (provided during installation)

Optional Software for building MPI binaries:

*  openmpi 1.8.8??

## Installation
Once the target computer has the required software tools installed, the basic install of UCVM is:
*  git clone https://github.com/SCECcode/UCVM.git
*  cd UCVM/largefiles
*  ./get_large_files.py
*  ./check_largefiles_md5.py
*  ./stage_large_files.py
*  cd ..
*  ./ucvm_setup.py

The get_large_files.py and ucvm_setup.py scripts run in a terminal window and print text questions to the user.  The user types answers to the questions in the terminal window. The retrieval script asks the user which velocity model they would like to stage into the local system and the install script asks the user which velocity models they would like to install from retrieved model list: ( 
CVM-H v15.1, CVM-S4, CVM-S4.26, CVM-S4.26.M01, CCA06, CS17.3, CS17.3-H, Albacore, IVLSU, CVLSU, and USGS CenCal). 
Several models are very large. CCA06, CS17.3 and CS17.3-H are 9.2G, 72G and 72G respectively. We recommend that the user only retrieve needed models and install all retrieved models.

The script will then automatically compile, build, and install the selected models.

Important! Do not move the UCVM installation to a place different from the target location specified during build time. This will render the autogenerated ucvm.conf and ucvm_bash.conf with useless paths.

## MPI Compilers and UCVM Programs

If a GNU-based MPI compiler is detected, the MPI version of several utilities are created, including ucvm2mesh_mpi, ucvm2mesh_mpi_layer, ucvm2etree_mpi, and basin_query_mpi are built. Otherwise, only the serial versions for these programs are built.

## Configuration
The main UCVM configuration file is ${UCVM_INSTALL_DIR}/conf/ucvm.conf. 
This file defines the paths to some configured models and maps, and it defines selected model flags, such as CVM-H USE_GTL. The UCVM installer sets up this ucvm.conf file automatically.

In most cases, the user does not need to edit the UCVM/conf/ucvm.conf. However, in some circumstances, such as changing the behavior of the CVM-H model, the user  might want to edit the ucvm.conf file. Please see the User Guide for more details on how to edit the UCVM/conf/ucvm.conf configuration file.

## Standard Models and Maps
The following California velocity models packages are included as part of a standard UCVM installation.  Each model is assigned an abbreviation, and these abbreviations are used to specify the models when making UCVM queries. The model abbreviations used by UCVM are defined in following tables:

Model Name | Description | UCVM Abbreviation | Size
-----------|-------------|-------------------|------
CVM-H v15.1     | Southern California Velocity Model developed by Harvard Structural Geology Group with optional geotechnical layer | cvmh | 1.6G 
CVM-S4     | Southern California Velocity Model developed by SCEC, Caltech, USGS Group with geotechnical layer | cvms | 326M
CVM-S4.26  | Tomography improved version of CVM-S4 with optional geotechnical layer(Ely-Jordan GTL, default is off)| cvms5 | 1.2G
CVM-S4.26.M01 | CVM-S4.26 with added geotechnical layer | cvmsi | 1.6G
CCA06 | Central California Velocity Model with optional geotechnical layer (Ely-Jordan GTL, default is off) | cca | 9.2G
CS17.3 | Cypershake study 17.3 Central California Velocity Model and optional geotechincal layer (Ely-Jordan GTL, default is off) | cs173 | 72G
CS17.3-H | Cypershake study 17.3 Central California Velocity Model with San Joaquin and Santa Maria Basins data from Havard's group and optional geoptechnical layer (Ely-Jordan GTL, default is off) | cs173h |72G
USGS Bay Area Velocity Model 0.8.3| USGS developed San Francisco and Central California velocity model | cencal | 17G
Albacore | Albacore California off-shore Velocity Model | albacore | 2.3M
IVLSU | SSIP Imperial Valley Velocity Model developed by LSU | ivlsu | 1M
CVLSU | SSIP Coachella Valley Velocity Model developed by LSU | ivlsu | 1M
WFCVM | Wasatch Front Community Velocity Model | wfcvm | 50M
Southern California 1D  | Modified Hadley Kanamori 1D model based on Hadley-Kanamori model | 1d | 8k
Northridge Region 1D | Los Angeles Region 1D model used in SCEC Broadband Platform | bbp1d | -

A state-wide California standard topography map is distribued with UCVM. This is a statewide
topography map, that also includes statewide Vs30 values, combined into an etree structure.

Toopgrahy and Vs30 Map Name | Description | UCVM Abbreviation
----------------------------|-------------|------------------
USGS NED DEM and Wills-Wald Vs30, 2015| California elevation and Vs30 data in etree format | ucvm
USGS NED DEM and Wills-Wald Vs30, 2006 | Utah elevation and Vs30 data in etree format | ucvm_utah

## Documentation
Online UCVM documentation is available at:
*  https://github.com/SCECcode/UCVM/wiki

Additional documentation advanced features and previous versions of UCVM are posted at:
*  http://scec.usc.edu/scecpedia/UCVM
 
More Installation instruction:

* [Additional guidelines for building UCVM](documentation/Installation.md)

## Support

Issue Tracking:

* GitHub: https://github.com/SCECcode/UCVM/issues

Email:

* Contact: software@scec.usc.edu

## Preferred Reference
If you use the UCVM software in your research, please include a reference to the following publication in your research publications. References help us obtain continued financial support for the development of the software. The preferred reference for the UCVM software is:

Small, P., Gill, D., Maechling, P. J., Taborda, R., Callaghan, S., Jordan, T. H., Ely, G. P., Olsen, K. B., & Goulet, C. A. (2017). The SCEC Unified Community Velocity Model Software Framework. Seismological Research Letters, 88(5). doi:10.1785/0220170082.

## License
UCVM is released under the Apache 2.0 license. Please see the LICENSE file for distribution license and disclaimers.
