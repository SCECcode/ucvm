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

UCVM software repository contains a software codebase developed by Philip Maechling, Mei-Hui Su, David Gill, Patrick Small, and others at SCEC. UCVM is released as open-source scientific software under an open-source BSD 3-Clause License.

UCVM was developed with support from National Science Foundation (NSF), US Geological Survey (USGS), and other sources.

## Developing a Modular UCVM
To simplify UCVM software development, we are separating the next UCVM software distribution into a collection of inter-operable software packages. This is the UCVM github repository for the [UCVM core package](https://github.com/SCECcode/ucvm.git) that provides the UCVM query interface. The velocity models are managed in their own github repositories (e.g. [CVM-S4](https://github.com/SCECcode/cvms), [CVM-H v15.1](https://github.com/SCECcode/cvmh), [CVM-S4.26](https://github.com/SCECcode/cvms5), [CVM-S4.26.M01](https://github.com/SCECcode/cvmsi)). Specialized UCVM plotting tools can be retrieved from the [UCVM plotting package](https://github.com/SCECcode/ucvm_plotting) github repository if needed. We expect to release this multi-package version of UCVM in mid-2021.

UCVM is distributed as open-source scientific software. It can be installed compiled and run on most Linux-based computer systems if the system includes software development tools including Python, C, and Fortran compilers, and other software tools.

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
*  https://github.com/SCECcode/ucvm/wiki

Additional documentation advanced features and previous versions of UCVM are posted at:
*  http://scec.usc.edu/scecpedia/UCVM
 
More Installation instruction:

* [Additional guidelines for building UCVM](documentation/Installation.md)

## Support

Issue Tracking:

* GitHub: https://github.com/SCECcode/ucvm/issues

Email:

* Contact: software@scec.usc.edu

## Preferred Reference
If you use the UCVM software in your research, please include a reference to the following publication in your research publications. References help us obtain continued financial support for the development of the software. The preferred reference for the UCVM software is:

Small, P., Gill, D., Maechling, P. J., Taborda, R., Callaghan, S., Jordan, T. H., Ely, G. P., Olsen, K. B., & Goulet, C. A. (2017). The SCEC Unified Community Velocity Model Software Framework. Seismological Research Letters, 88(5). doi:10.1785/0220170082.

## License
The UCVM software is released using a BSD-3 open-source license. Please see the LICENSE file for distribution license and disclaimers.
