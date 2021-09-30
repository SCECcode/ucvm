# Project name:
The Southern California Earthquake Center (SCEC) Unified Community Velocity Model (UCVM) Software

# Description: 
The SCEC Unified Community Velocity Model (UCVM) software framework is a collection of software tools that provide a standard query interface to seismic velocity models. Once a seismic velocity model is registered into UCVM, it can be queried and combined with other velocity models through the UCVM software interface.

UCVM was developed as an interdisciplinary research collaboration involving geoscientists and computer scientists. UCVM geoscience research includes identification and assembly of existing California velocity models into a state-wide model and improvements to existing velocity models. UCVM computer science research includes definition of a easy-to-use CVM query interface, integration of regional 3D and geotechnical models, and automated CVM evaluation processing capabilities.

UCVM is open-source scientific software designed to support earth scientists, civil engineers, and other groups interested in detailed information about earth properties. UCVM is primarily used by scientists to work with earth material properties on regional scales. One important use of UCVM is to create simulation meshes used in high resolution 3D wave propagation simulations for California.

# Table of Contents:
* [README.md](https://github.com/pjmaechling/ucvm/blob/main/README.md)
* [UCVM Software Documentation](https://github.com/pjmaechling/ucvm/wiki)

# Installation:
UCVM was developed to support seismic simulations run on high-performance computing systems, so it is designed to compile and run on Linux-based computers. There are serveral ways to get access to UCVM without installing the software on your own Linux computer. Below we outline several of the options:

* Query UCVM velocity models, without installing UCVM, using the UCVM website:
[https://scec.org/research/ucvm]

* Run UCVM in Docker on you laptop
Users can install free Docker software on most computers (e.g. Linux, MacOS, Windows) then run an UCVM Docker image in a terminal window on their computer.

* Install UCVM on Linux system
Advanced users that want to install many of the UCVM models, or that want to run large parallel queries of the CVM models, should install the UCVM software on a Linux system. UCVM software is developed on USC Center for Advanced Research Computing (CARC) Linux cluster which provide MPI libraries. The UCVM software framework has several MPI-based executables. These executables are built using the automake system if the required MPI libraries are found in the installation computing environment.

# Usage: 
The next section is usage, in which you instruct other people on how to use your project after they’ve installed it. This would also be a good place to include screenshots of your project in action.

# Support:
Support for UCVM is provided by that Southern California Earthquake Center (SCEC) Research Computing Group. This small group supports several research software distributions including UCVM. For questions or issues, contact the UCVM developers through the git issues system, or by email:
Issue Tracking:
* GitHub: https://github.com/pjmaechling/ucvm/issues

Email:
* Contact: software@scec.usc.edu

# Contributing:
We welcome contributions to the UCVM software framework. Geoscientists can register their seismic velocity models into UCVM and software developers can improve and extend the UCVM software. An overview of the process for contributing seismic models or software updates to the UCVM Project is provided in the UCVM [contribution guidelines](https://github.com/pjmaechling/ucvm/blob/main/CONTRIBUTING.md).

# Credits:
Include a section for credits in order to highlight and link to the authors of your project.

# License:
The UCVM software is released under a BSD 3-Clause open-source license. Please see the [LICENSE file](https://github.com/pjmaechling/ucvm/blob/main/LICENSE.md) for distribution license and disclaimers.

## Preferred Reference
If you use the UCVM software in your research, please include a reference to the following publication in your research publications. References help us obtain continued financial support for the development of the software. The preferred reference for the UCVM software is:

* Small, P., Gill, D., Maechling, P. J., Taborda, R., Callaghan, S., Jordan, T. H., Ely, G. P., Olsen, K. B., & Goulet, C. A. (2017). The SCEC Unified Community Velocity Model Software Framework. Seismological Research Letters, 88(5). doi:10.1785/0220170082.

# UCVM

[![ucvm-ci Actions Status](https://github.com/pjmaechling/ucvm/workflows/ucvm-ci/badge.svg)](https://github.com/pjmaechling/ucvm/actions)

## Current UCVM Software Release
The current UCVM software version is [UCVM v21.10.0](http://github.com/SCECcode/ucvm/wiki) scheduled for release in October 2021. We recommend that new users work with this version of the software because it contains improvements not found in earlier versions.

Since UCVM v19.4.0 was released, we have continued to integrate new velocity models and new capabilities into UCVM. These recent changes are available on a UCVM development branch in this github repository, but these updates have not been included in an official UCVM release. To simplify UCVM software development, we are separating the next UCVM software distribution into a collection of inter-operable software packages. This is the UCVM github repository for the [UCVM core package](https://github.com/SCECcode/ucvm.git) that provides the UCVM query interface. The velocity models are managed in their own github repositories (e.g. [CVM-S4](https://github.com/SCECcode/cvms), [CVM-H v15.1](https://github.com/SCECcode/cvmh), [CVM-S4.26](https://github.com/SCECcode/cvms5), [CVM-S4.26.M01](https://github.com/SCECcode/cvmsi)). Specialized UCVM plotting tools can be retrieved from the [UCVM plotting package](https://github.com/SCECcode/ucvm_plotting) github repository if needed. We expect to release this multi-package version of UCVM in mid-2021.

UCVM is distributed as open-source scientific software. It can be installed compiled and run on most Linux-based computer systems if the system includes software development tools including Python, C, and Fortran compilers, and other software tools.

## Web-based UCVM Documentation
Over and technical information about UCVM is posted in the online UCVM github wiki:
- [UCVM Wiki-based documentation](https://github.com/sceccode/ucvm/wiki)

## Overview of SCEC UCVM
The SCEC Unified Community Velocity Model (UCVM) software is used to access information, including estimated Vp and Vs seismic wave velocities and density, about the earth's crust. 

UCVM provides seismic velocity information for several California regions. Seismic velocities of rocks and sediments at shallow depths determine how strongly an area will shake. By assigning velocities to rock types in the 3-D geologic model, geologists can gain an understanding of the extent of areas of low shear velocity that are most likely to experience localized strong shaking and future earthquake damage. An important application for the models accessible through UCVM is for use in computer simulations of California earthquakes.

The Unified Community Velocity Model (UCVM) software framework is a collection of software tools designed to provide a standard interface to multiple, alternative, California velocity models. UCVM development is an interdisciplinary research collaboration involving geoscientists, computer scientists, and software developers. UCVM is used in high resolution 3D wave propagation simulations for California.

UCVM software repository contains a software codebase developed by  Patrick Small, Mei-Hui Su, Philip Maechling, David Gill, and others at SCEC. UCVM is released as open-source scientific software under an open-source BSD 3-Clause License. The underlying velocity models may be released under their own open-source license.

UCVM was developed with support from National Science Foundation (NSF), US Geological Survey (USGS), and other sources.

## Creating a more Modular UCVM
To simplify UCVM software development, we have separated the UCVM v19.4 software distribution into a collection of compatible software packages. 
- This UCVM github repository is for the [UCVM core package](https://github.com/SCECcode/ucvm.git) that provides the UCVM query interface. 
- The velocity models are managed in their own github repositories (e.g. [CVM-S4](https://github.com/SCECcode/cvms), [CVM-H v15.1](https://github.com/SCECcode/cvmh), [CVM-S4.26](https://github.com/SCECcode/cvms5), [CVM-S4.26.M01](https://github.com/SCECcode/cvmsi)). 
- UCVM plotting scripts are now located in the [UCVM plotting package](https://github.com/SCECcode/ucvm_plotting) github repository.

## System and Software Requirements

Testing UCVM on all possible combinations of operating sysetms and software stacks requires more software developer resources than currently available. So, we have defined a UCVM reference software stack that we use to develop and test the software. This UCVM distrbution has been shown to work on the following reference software stack. It may work on other software stacks, also, but this is the supported software environment.

*  Linux operating system (e.g. CentOS 8 Linux) x86_64-linux 
*  GNU gcc/gfortran compilers version 8.3.5
*  Python 3 (Anaconda)
*  Autotools build software for Linux
*  Automake, Autoconf build tools for Linux
*  Git client

External Libraries installed by UCVM

*  Euclid Etree library: http://www.cs.cmu.edu/~euclid/ (provided during installation)
*  Proj.5 projection library: http://trac.osgeo.org/proj/ (provided during installation)

Optional Software for building MPI binaries:
*  openmpi 2.0.2
*  module load specifics used for development on USC CARC system in MODULES.md

## Installation
Once the target computer has the required software tools installed, the basic install of UCVM is:
*  git clone https://github.com/SCECcode/UCVM.git
*  cd ucvm/largefiles
*  ./get_large_files.py
*  ./check_largefiles_md5.py
*  ./stage_large_files.py
*  cd ..
*  ./ucvm_setup.py

The get_large_files.py and ucvm_setup.py scripts run in a terminal window and print text questions to the user.  The user types answers to the questions in the terminal window. The retrieval script asks the user which velocity model they would like to stage into the local system and the install script asks the user which velocity models they would like to install from retrieved model list: ( 
CVM-H v15.1, CVM-S4, CVM-S4.26, CVM-S4.26.M01, CCA06, CS17.3, CS17.3-H, Albacore, IVLSU, CVLSU, WFCVM, and USGS CenCal). 
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

UCVM is distributed as open-source scientific software. It can be installed compiled and run on most Linux-based computer systems if the system includes software development tools including Python, C, and Fortran compilers, and other software tools.

## Documentation
Online UCVM documentation is available at:
*  https://github.com/SCECcode/ucvm/wiki

Additional documentation advanced features and previous versions of UCVM are posted at:
*  http://scec.usc.edu/scecpedia/UCVM
 
More Installation instruction:

* [Additional guidelines for building UCVM](documentation/Installation.md)

## Software and User Support
Issue Tracking:
* GitHub: https://github.com/SCECcode/ucvm/issues
Email:
* Contact: software@scec.usc.edu

## Preferred UCVM Software Reference
If you use the UCVM software in your research, please include a reference to the following publication in your research publications. References help us obtain continued financial support for the development of the software. The preferred reference for the UCVM software is:

Small, P., Gill, D., Maechling, P. J., Taborda, R., Callaghan, S., Jordan, T. H., Ely, G. P., Olsen, K. B., & Goulet, C. A. (2017). The SCEC Unified Community Velocity Model Software Framework. Seismological Research Letters, 88(5). doi:10.1785/0220170082.

## License
The UCVM software is released using a BSD-3 open-source license. Please see the LICENSE file for distribution license and disclaimers.
