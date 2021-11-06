[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
![GitHub repo size](https://img.shields.io/github/repo-size/sceccode/ucvm)
[![ucvm-ci Actions Status](https://github.com/SCECcode/ucvm/workflows/ucvm-ci/badge.svg)](https://github.com/SCECcode/ucvm/actions)

# The Unified Community Velocity Model (UCVM) Software

<a href="http://www.scec.org/research"><img src="https://github.com/sceccode/ucvm/wiki/images/ucvm_logo.png" width="300"></a>

## Description 
The SCEC Unified Community Velocity Model (UCVM) software framework is a collection of software tools that provide a 
standard query interface to seismic velocity models. Once a seismic velocity model is registered into UCVM, it can 
be queried and combined with other velocity models through the UCVM software interface.

UCVM was developed as an interdisciplinary research collaboration involving geoscientists and 
computer scientists. UCVM geoscience research includes identification and assembly of existing California velocity 
models into a state-wide model and improvements to existing velocity models. UCVM computer science research includes 
definition of a easy-to-use CVM query interface, integration of regional 3D and geotechnical models, 
and automated CVM evaluation processing capabilities.

UCVM is open-source scientific software designed to support earth scientists, civil engineers, 
and other groups interested in detailed information about earth properties. 
UCVM is primarily used by scientists to work with earth material properties on regional scales. 
One important use of UCVM is to create simulation meshes used in high resolution 3D wave propagation simulations.

## Table of Contents
1. [Software Documentation](https://github.com/SCECcode/ucvm/wiki)
2. [Installation](#installation)
3. [Usage](#usage)
4. [Support](#support)
5. [Contributing](#contributing)
6. [Credits](#credits)
7. [License](#license)

## Installation
UCVM was developed to support seismic simulations run on high-performance computing systems, so it is designed to compile and run on Linux-based computers. Before installing UCVM, they should be aware that there are several ways to get access to UCVM without installing the software on your own Linux computer. Below we outline several of the options:
1. [SCEC UCVM Web viewer](http://moho.scec.org/UCVM_web/web/viewer.php) Users can query UCVM velocity models, without installing UCVM, using the UCVM website. 
2. [UCVM Docker Images](https://github.com/sceccode/ucvm_docker) Users can run UCVM in Docker on their local computers including laptops. Users can install free Docker software on most computers (e.g. Linux, MacOS, Windows) then run an UCVM Docker image in a terminal window on their computer. 
3. [Installation Instructions for Linux Systems](https://github.com/SCECcode/ucvm/wiki/How-to-Guides) User can install UCVM on Linux system. Advanced users that want to install many of the UCVM models, or that want to run large parallel queries of the CVM models, should install the UCVM software on a Linux system. UCVM software is developed on USC Center for Advanced Research Computing (CARC) Linux cluster which provide MPI libraries. The UCVM software framework has several MPI-based executables. These executables are built using the automake system if the required MPI libraries are found in the installation computing environment. 

## Usage 
Once installed, UCVM provides an executable program, called ucvm_query, that implements a query interface to multiple seismic velocity models.

### ucvm_query
'ucvm_query' is the basic UCVM interface that queries velocity model of interest.

<pre>
$ ucvm_query -f /usr/local/opt/ucvm/conf/ucvm.conf -m cvmh -l 33.84007,-117.95683,0.0
</pre>
returns
<pre>
 -117.9568    33.8401      0.000     34.438    293.500       cvmh   1238.170    120.690   1450.659       none      0.000      0.000      0.000      crust   1238.170    120.690   1450.65
</pre>

The results are in a column oriented format. Abbreviations are like this:
<pre>
Output format is:
   0   1  2  3    4     5       6     7     8     9   10      11    12       13     14      15     16
  lon lat Z surf vs30 crustal cr_vp cr_vs cr_rho gtl gtl_vp gtl_vs gtl_rho cmb_algo cmb_vp cmb_vs cmb_rho
</pre>

The first three colums are the input values of lon (decimal degrees), lat (decimal degrees), and depth (meters). The other columns that are returned are information about the velocity model used provide the material properties. Crustal models, and Geotechnical Models can be stored and used seperately in UCVM. The contributions of each model are shown in columns 5-8 and 10-12, but the combined results returned in 14-16 are typically used by modelers.
<pre>
 -118.0000    34.0000      0.000    280.896    390.000      cvmsi    696.491    213.000   1974.976       none      0.000      0.000      0.000      crust    696.491    213.000   1974.976
 -118.0000    34.0000     50.000    280.896    390.000      cvmsi   1669.540    548.000   2128.620       none      0.000      0.000      0.000      crust   1669.540    548.000   2128.620
 -118.0000    34.0000    100.000    280.896    390.000      cvmsi   1683.174    603.470   2130.773       none      0.000      0.000      0.000      crust   1683.174    603.470   2130.773
 -118.0000    34.0000    500.000    280.896    390.000      cvmsi   2701.217   1475.609   2354.105       none      0.000      0.000      0.000      crust   2701.217   1475.609   2354.105
 -118.0000    34.0000   1000.000    280.896    390.000      cvmsi   3330.909   1945.594   2443.042       none      0.000      0.000      0.000      crust   3330.909   1945.594   2443.042
</pre>

## Support
Support for UCVM is provided by that Southern California Earthquake Center (SCEC) Research Computing Group. This group supports several research software distributions including UCVM. Users can report issues and feature requests using UCVM's github-based issue tracking link below. Developers will also respond to emails sent to the SCEC software contact listed below.
1. [UCVM Github Issue Tracker](https://github.com/SCECcode/ucvm/issues)
2. Email Contact: software@scec.usc.edu

## Contributing
We welcome contributions to the UCVM software framework. 
Geoscientists can register their seismic velocity models into UCVM and software developers can 
improve and extend the UCVM software. An overview of the process for contributing seismic models or 
software updates to the UCVM Project is provided in the UCVM [contribution guidelines](CONTRIBUTING.md). 
UCVM contributors agree to abide by the code of conduct found in our [Code of Conduct](CODE_OF_CONDUCT.md) guidelines.

## Credits
Development of UCVM is a group effort. A list of developers that have contributed to the UCVM Software framework 
are listed in the [Credits.md](CREDITS.md) file in this repository.

## License
The UCVM software is distributed under the BSD 3-Clause open-source license. 
Please see the [LICENSE.txt](LICENSE.txt) file for more information.
