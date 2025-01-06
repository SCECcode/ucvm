These configurations were used to create a 25m mesh for Daniel Roten and Yifeng Cui's latest hero run on TACC Frontera.j

-rw-r--r-- 1 callag callag    1580544000 Aug  7 13:28 cvmsi+elygtl.grid
-rw-r--r-- 1 callag callag 2528870400000 Aug  7 13:28 cvmsi+elygtl.media
-rw-rw-r-- 1 callag callag           693 Aug  7 13:28 cvmsi25.conf
-rw-rw-r-- 1 callag callag             0 Aug  7 13:28 cvmsi25Mesh.e
-rw-rw-r-- 1 callag callag       1085571 Aug  7 13:28 cvmsi25Mesh.o
-rw-rw-r-- 1 callag callag           311 Aug  7 13:28 ucvm.lsf



Tue Apr 11 00:58:30 EDT 2023
[0] /gpfs/alpine/proj-shared/geo112/CyberShake/software/UCVM/ucvm-22.7.0/bin/ucvm2mesh_mpi Version: 22.7.0
[0] Running on 5600 cores
[0] Using config file cvmsi25.conf
[0] Configuration:
	[0] UCVM Model List: cvmsi,elygtl:ely
	[0] UCVM Conf file: /gpfs/alpine/proj-shared/geo112/CyberShake/software/UCVM/ucvm-22.7.0/conf/ucvm.conf
	[0] Gridtype: 0
	[0] Querymode: 0
	[0] Spacing: 25.000000
	[0] Projection: +proj=utm +datum=NAD27 +zone=11
		[0] Rotation Angle: -27.508299
		[0] Origin x0,y0,z0: -119.261301, 33.834327, 0.000000
		[0] Dimensions: 12000, 5488, 3200
	[0] Proc Dimensions: 40, 14, 10
	[0] Vp Min: 710.000000, Vs Min: 500.000000
	[0] Mesh File: cvmsi+elygtl.media
	[0] Grid File: cvmsi+elygtl.grid
	[0] Mesh Type: 1
	[0] Scratch Dir: /gpfs/alpine/scratch/callag/geo112/ucvm_for_yifeng_25m
[0] Initialization complete
[0] Converting grid to latlong
[0] Grid generation complete
[0] Configuring UCVM
[121] Allocating 117600 grid points
[121] Partition dimensions: 300 x 392 x 320
[121] I,J,K start: 300, 1176, 0
[121] I,J,K end: 600, 1568, 320
[48] Allocating 117600 grid points
[48] Partition dimensions: 300 x 392 x 320
[48] I,J,K start: 2400, 392, 0
[48] I,J,K end: 2700, 784, 320
[2520] Allocating 117600 grid points
[2520] Partition dimensions: 300 x 392 x 32


1925] Extracted 37632000 points
[1935] Extracted 37632000 points
[1923] Extracted 37632000 points
[1922] Extracted 37632000 points
[1921] Extracted 37632000 points
[1920] Extracted 37632000 points
[1883] Extracted 37632000 points
[1882] Extracted 37632000 points
[1881] Extracted 37632000 points
[1400] Extracted 37632000 points
[1880] Extracted 37632000 points
[0] Max Vp: 8518.331055 at
[0]	i,j,k : 2988, 578, 880
[0] Max Vs: 5117.019531 at
[0]	i,j,k : 1412, 5236, 1280
[0] Max Rho: 3156.616211 at
[0]	i,j,k : 6610, 4869, 2800
[0] Min Vp: 710.000000 at
[0]	i,j,k : 0, 0, 0
[0] Min Vs: 500.000000 at
[0]	i,j,k : 0, 0, 0
[0] Min Rho: 1000.000000 at
[0]	i,j,k : 0, 0, 0
[0] Min Ratio: 1.416512 at
[0]	i,j,k : 29, 2198, 65
Tue Apr 11 02:41:45 EDT 2023

------------------------------------------------------------
Sender: LSF System <lsfadmin@batch4>
Subject: Job 2861211: <cvmsi25Mesh> in cluster <summit> Done

Job <cvmsi25Mesh> was submitted from host <login2> by user <callag> in cluster <summit> at Tue Apr 11 00:52:49 2023
Job was executed on host(s) <1*batch4>, in queue <batch>, as user <callag> in cluster <summit> at Tue Apr 11 00:58:01 2023
</ccs/home/callag> was used as the home directory.
</gpfs/alpine/scratch/callag/geo112/ucvm_for_yifeng_25m> was used as the working directory.
Started at Tue Apr 11 00:58:01 2023
Terminated at Tue Apr 11 02:41:47 2023
Results reported at Tue Apr 11 02:41:47 2023

The output (if any) is above this job summary.



PS:

Read file <cvmsi25Mesh.e> for stderr output of this job.
