[![ucvm-ci Actions Status](https://github.com/SCECcode/ucvm/workflows/ucvm-ci/badge.svg)](https://github.com/SCECcode/ucvm/actions)

# UCVM

## Current UCVM Software Release v19.4
The current UCVM software version is [UCVM v19.4.0](http://github.com/SCECcode/UCVMC/wiki) which was released in June 2019. We recommend that new users work with that version of the software because it contains improvements not found in earlier versions.

## Preliminary UCVM Software Release v21.10
We have continued to integrate new velocity models and new capabilities into UCVM and have developed a preliminary version of a new UCVM v21.10. These changes are available on the target branch in this github repository. This preliminary version has not been released as an official UCVM release. 

## Web-based UCVM Documentation
Over and technical information about UCVM is posted in the online UCVM github wiki: [UCVM Wiki-based documentation](https://github.com/sceccode/ucvm/wiki)

## Overview of SCEC UCVM

The SCEC Unified Community Velocity Model (UCVM) software is used to access information, including estimated Vp and Vs seismic wave velocities and density, about the earth's crust. 

UCVM provides seismic velocity information for several California regions. Seismic velocities of rocks and sediments at shallow depths determine how strongly an area will shake. By assigning velocities to rock types in the 3-D geologic model, geologists can gain an understanding of the extent of areas of low shear velocity that are most likely to experience localized strong shaking and future earthquake damage. An important application for the models accessible through UCVM is for use in computer simulations of California earthquakes.

The Unified Community Velocity Model (UCVM) software framework is a collection of software tools designed to provide a standard interface to multiple, alternative, California velocity models. UCVM development is an interdisciplinary research collaboration involving geoscientists, computer scientists, and software developers. UCVM is used in high resolution 3D wave propagation simulations for California.

UCVM software repository contains a software codebase developed by  Patrick Small, Mei-Hui Su, Philip Maechling, David Gill, and others at SCEC. UCVM is released as open-source scientific software under an open-source BSD 3-Clause License. The underlying velocity models may be released under their own open-source license.

UCVM was developed with support from National Science Foundation (NSF), US Geological Survey (USGS), and other sources.

## Modular UCVM
To simplify UCVM software development, we have separated the UCVM v19.4 software distribution into a collection of compatible software packages. 
- This UCVM github repository is for the [UCVM core package](https://github.com/SCECcode/ucvm.git) that provides the UCVM query interface. 
- The velocity models are managed in their own github repositories (e.g. [CVM-S4](https://github.com/SCECcode/cvms), [CVM-H v15.1](https://github.com/SCECcode/cvmh), [CVM-S4.26](https://github.com/SCECcode/cvms5), [CVM-S4.26.M01](https://github.com/SCECcode/cvmsi)). 
- UCVM plotting scripts are now located in the [UCVM plotting package](https://github.com/SCECcode/ucvm_plotting) github repository.

UCVM is distributed as open-source scientific software. It can be installed compiled and run on most Linux-based computer systems if the system includes software development tools including Python, C, and Fortran compilers, and other software tools.

## Documentation
Online UCVM documentation is available at:
*  https://github.com/SCECcode/ucvm/wiki

Additional documentation advanced features and previous versions of UCVM are posted at:
*  http://scec.usc.edu/scecpedia/UCVM
 
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
