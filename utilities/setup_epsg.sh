#!/bin/bash
#
# This is to make sure epsg is available in proj location
#    $UCVM_INSTALL_PATH/lib/proj/share/proj/epsg
#

if [ -z "$PROJ_LIB" ]; then
  if [ -z "$UCVM_INSTALL_PATH" ]; then
     echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/}
     exit
  else 
     ucvm_path=$UCVM_INSTALL_PATH
     proj_path=$ucvm_path"/lib/proj/share/proj"

  fi
else
  proj_path=$PROJ_LIB
fi

echo $proj_path

if [ -n  $proj_path/epsg ]; then
  cat << EOF > $proj_path"/epsg"
<metadata> +version=9.2.0 +origin=EPSG +lastupdate=2017-12-17
# HD1909
<3819> +proj=longlat +ellps=bessel +towgs84=595.48,121.69,515.35,4.115,-2.9383,0.853,-3.408 +no_defs  <>
# TWD67
<3821> +proj=longlat +ellps=aust_SA +no_defs  <>
# TWD97
<3824> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# IGRS
<3889> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# MGI 1901
<3906> +proj=longlat +ellps=bessel +towgs84=682,-203,480,0,0,0,0 +no_defs  <>
# Unknown datum based upon the Airy 1830 ellipsoid
<4001> +proj=longlat +ellps=airy +no_defs  <>
# Unknown datum based upon the Airy Modified 1849 ellipsoid
<4002> +proj=longlat +ellps=mod_airy +no_defs  <>
# Unknown datum based upon the Australian National Spheroid
<4003> +proj=longlat +ellps=aust_SA +no_defs  <>
# Unknown datum based upon the Bessel 1841 ellipsoid
<4004> +proj=longlat +ellps=bessel +no_defs  <>
# Unknown datum based upon the Bessel Modified ellipsoid
<4005> +proj=longlat +a=6377492.018 +b=6356173.508712696 +no_defs  <>
# Unknown datum based upon the Bessel Namibia ellipsoid
<4006> +proj=longlat +ellps=bess_nam +no_defs  <>
# Unknown datum based upon the Clarke 1858 ellipsoid
<4007> +proj=longlat +a=6378293.645208759 +b=6356617.987679838 +no_defs  <>
# Unknown datum based upon the Clarke 1866 ellipsoid
<4008> +proj=longlat +ellps=clrk66 +no_defs  <>
# Unknown datum based upon the Clarke 1866 Michigan ellipsoid
<4009> +proj=longlat +a=6378450.047548896 +b=6356826.621488444 +no_defs  <>
# Unknown datum based upon the Clarke 1880 (Benoit) ellipsoid
<4010> +proj=longlat +a=6378300.789 +b=6356566.435 +no_defs  <>
# Unknown datum based upon the Clarke 1880 (IGN) ellipsoid
<4011> +proj=longlat +a=6378249.2 +b=6356515 +no_defs  <>
# Unknown datum based upon the Clarke 1880 (RGS) ellipsoid
<4012> +proj=longlat +ellps=clrk80 +no_defs  <>
# Unknown datum based upon the Clarke 1880 (Arc) ellipsoid
<4013> +proj=longlat +a=6378249.145 +b=6356514.966398753 +no_defs  <>
# Unknown datum based upon the Clarke 1880 (SGA 1922) ellipsoid
<4014> +proj=longlat +a=6378249.2 +b=6356514.996941779 +no_defs  <>
# Unknown datum based upon the Everest 1830 (1937 Adjustment) ellipsoid
<4015> +proj=longlat +a=6377276.345 +b=6356075.41314024 +no_defs  <>
# Unknown datum based upon the Everest 1830 (1967 Definition) ellipsoid
<4016> +proj=longlat +ellps=evrstSS +no_defs  <>
# Unknown datum based upon the Everest 1830 Modified ellipsoid
<4018> +proj=longlat +a=6377304.063 +b=6356103.038993155 +no_defs  <>
# Unknown datum based upon the GRS 1980 ellipsoid
<4019> +proj=longlat +ellps=GRS80 +no_defs  <>
# Unknown datum based upon the Helmert 1906 ellipsoid
<4020> +proj=longlat +ellps=helmert +no_defs  <>
# Unknown datum based upon the Indonesian National Spheroid
<4021> +proj=longlat +a=6378160 +b=6356774.50408554 +no_defs  <>
# Unknown datum based upon the International 1924 ellipsoid
<4022> +proj=longlat +ellps=intl +no_defs  <>
# MOLDREF99
<4023> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Unknown datum based upon the Krassowsky 1940 ellipsoid
<4024> +proj=longlat +ellps=krass +no_defs  <>
# Unknown datum based upon the NWL 9D ellipsoid
<4025> +proj=longlat +ellps=WGS66 +no_defs  <>
# Unknown datum based upon the Plessis 1817 ellipsoid
<4027> +proj=longlat +a=6376523 +b=6355862.933255573 +no_defs  <>
# Unknown datum based upon the Struve 1860 ellipsoid
<4028> +proj=longlat +a=6378298.3 +b=6356657.142669561 +no_defs  <>
# Unknown datum based upon the War Office ellipsoid
<4029> +proj=longlat +a=6378300 +b=6356751.689189189 +no_defs  <>
# Unknown datum based upon the WGS 84 ellipsoid
<4030> +proj=longlat +ellps=WGS84 +no_defs  <>
# Unknown datum based upon the GEM 10C ellipsoid
<4031> +proj=longlat +ellps=WGS84 +no_defs  <>
# Unknown datum based upon the OSU86F ellipsoid
<4032> +proj=longlat +a=6378136.2 +b=6356751.516927429 +no_defs  <>
# Unknown datum based upon the OSU91A ellipsoid
<4033> +proj=longlat +a=6378136.3 +b=6356751.616592146 +no_defs  <>
# Unknown datum based upon the Clarke 1880 ellipsoid
<4034> +proj=longlat +a=6378249.144808011 +b=6356514.966204134 +no_defs  <>
# Unknown datum based upon the Authalic Sphere
<4035> +proj=longlat +a=6371000 +b=6371000 +no_defs  <>
# Unknown datum based upon the GRS 1967 ellipsoid
<4036> +proj=longlat +ellps=GRS67 +no_defs  <>
# Unknown datum based upon the Average Terrestrial System 1977 ellipsoid
<4041> +proj=longlat +a=6378135 +b=6356750.304921594 +no_defs  <>
# Unknown datum based upon the Everest (1830 Definition) ellipsoid
<4042> +proj=longlat +a=6377299.36559538 +b=6356098.359005156 +no_defs  <>
# Unknown datum based upon the WGS 72 ellipsoid
<4043> +proj=longlat +ellps=WGS72 +no_defs  <>
# Unknown datum based upon the Everest 1830 (1962 Definition) ellipsoid
<4044> +proj=longlat +a=6377301.243 +b=6356100.230165384 +no_defs  <>
# Unknown datum based upon the Everest 1830 (1975 Definition) ellipsoid
<4045> +proj=longlat +a=6377299.151 +b=6356098.145120132 +no_defs  <>
# RGRDC 2005
<4046> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Unspecified datum based upon the GRS 1980 Authalic Sphere
<4047> +proj=longlat +a=6371007 +b=6371007 +no_defs  <>
# Unspecified datum based upon the Clarke 1866 Authalic Sphere
<4052> +proj=longlat +a=6370997 +b=6370997 +no_defs  <>
# Unspecified datum based upon the International 1924 Authalic Sphere
<4053> +proj=longlat +a=6371228 +b=6371228 +no_defs  <>
# Unspecified datum based upon the Hughes 1980 ellipsoid
<4054> +proj=longlat +a=6378273 +b=6356889.449 +no_defs  <>
# Popular Visualisation CRS
<4055> +proj=longlat +a=6378137 +b=6378137 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# SREF98
<4075> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# REGCAN95
<4081> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Greek
<4120> +proj=longlat +ellps=bessel +no_defs  <>
# GGRS87
<4121> +proj=longlat +datum=GGRS87 +no_defs  <>
# ATS77
<4122> +proj=longlat +a=6378135 +b=6356750.304921594 +no_defs  <>
# KKJ
<4123> +proj=longlat +ellps=intl +towgs84=-96.062,-82.428,-121.753,4.801,0.345,-1.376,1.496 +no_defs  <>
# RT90
<4124> +proj=longlat +ellps=bessel +towgs84=414.1,41.3,603.1,-0.855,2.141,-7.023,0 +no_defs  <>
# Samboja
<4125> +proj=longlat +ellps=bessel +towgs84=-404.78,685.68,45.47,0,0,0,0 +no_defs  <>
# LKS94 (ETRS89)
<4126> +proj=longlat +ellps=GRS80 +no_defs  <>
# Tete
<4127> +proj=longlat +ellps=clrk66 +towgs84=-80,-100,-228,0,0,0,0 +no_defs  <>
# Madzansua
<4128> +proj=longlat +ellps=clrk66 +no_defs  <>
# Observatario
<4129> +proj=longlat +ellps=clrk66 +towgs84=-132,-110,-335,0,0,0,0 +no_defs  <>
# Moznet
<4130> +proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Indian 1960
<4131> +proj=longlat +a=6377276.345 +b=6356075.41314024 +towgs84=198,881,317,0,0,0,0 +no_defs  <>
# FD58
<4132> +proj=longlat +ellps=clrk80 +towgs84=-241.54,-163.64,396.06,0,0,0,0 +no_defs  <>
# EST92
<4133> +proj=longlat +ellps=GRS80 +towgs84=0.055,-0.541,-0.185,0.0183,-0.0003,-0.007,-0.014 +no_defs  <>
# PSD93
<4134> +proj=longlat +ellps=clrk80 +towgs84=-180.624,-225.516,173.919,-0.81,-1.898,8.336,16.71006 +no_defs  <>
# Old Hawaiian
<4135> +proj=longlat +ellps=clrk66 +towgs84=61,-285,-181,0,0,0,0 +no_defs  <>
# St. Lawrence Island
<4136> +proj=longlat +ellps=clrk66 +no_defs  <>
# St. Paul Island
<4137> +proj=longlat +ellps=clrk66 +no_defs  <>
# St. George Island
<4138> +proj=longlat +ellps=clrk66 +no_defs  <>
# Puerto Rico
<4139> +proj=longlat +ellps=clrk66 +towgs84=11,72,-101,0,0,0,0 +no_defs  <>
# NAD83(CSRS98)
<4140> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Israel 1993
<4141> +proj=longlat +ellps=GRS80 +towgs84=-48,55,52,0,0,0,0 +no_defs  <>
# Locodjo 1965
<4142> +proj=longlat +ellps=clrk80 +towgs84=-125,53,467,0,0,0,0 +no_defs  <>
# Abidjan 1987
<4143> +proj=longlat +ellps=clrk80 +towgs84=-124.76,53,466.79,0,0,0,0 +no_defs  <>
# Kalianpur 1937
<4144> +proj=longlat +a=6377276.345 +b=6356075.41314024 +towgs84=214,804,268,0,0,0,0 +no_defs  <>
# Kalianpur 1962
<4145> +proj=longlat +a=6377301.243 +b=6356100.230165384 +towgs84=283,682,231,0,0,0,0 +no_defs  <>
# Kalianpur 1975
<4146> +proj=longlat +a=6377299.151 +b=6356098.145120132 +towgs84=295,736,257,0,0,0,0 +no_defs  <>
# Hanoi 1972
<4147> +proj=longlat +ellps=krass +towgs84=-17.51,-108.32,-62.39,0,0,0,0 +no_defs  <>
# Hartebeesthoek94
<4148> +proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# CH1903
<4149> +proj=longlat +ellps=bessel +towgs84=674.374,15.056,405.346,0,0,0,0 +no_defs  <>
# CH1903+
<4150> +proj=longlat +ellps=bessel +towgs84=674.374,15.056,405.346,0,0,0,0 +no_defs  <>
# CHTRF95
<4151> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# NAD83(HARN)
<4152> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Rassadiran
<4153> +proj=longlat +ellps=intl +towgs84=-133.63,-157.5,-158.62,0,0,0,0 +no_defs  <>
# ED50(ED77)
<4154> +proj=longlat +ellps=intl +towgs84=-117,-132,-164,0,0,0,0 +no_defs  <>
# Dabola 1981
<4155> +proj=longlat +a=6378249.2 +b=6356515 +towgs84=-83,37,124,0,0,0,0 +no_defs  <>
# S-JTSK
<4156> +proj=longlat +ellps=bessel +towgs84=589,76,480,0,0,0,0 +no_defs  <>
# Mount Dillon
<4157> +proj=longlat +a=6378293.645208759 +b=6356617.987679838 +no_defs  <>
# Naparima 1955
<4158> +proj=longlat +ellps=intl +towgs84=-0.465,372.095,171.736,0,0,0,0 +no_defs  <>
# ELD79
<4159> +proj=longlat +ellps=intl +towgs84=-115.8543,-99.0583,-152.4616,0,0,0,0 +no_defs  <>
# Chos Malal 1914
<4160> +proj=longlat +ellps=intl +no_defs  <>
# Pampa del Castillo
<4161> +proj=longlat +ellps=intl +towgs84=27.5,14,186.4,0,0,0,0 +no_defs  <>
# Korean 1985
<4162> +proj=longlat +ellps=bessel +no_defs  <>
# Yemen NGN96
<4163> +proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# South Yemen
<4164> +proj=longlat +ellps=krass +towgs84=-76,-138,67,0,0,0,0 +no_defs  <>
# Bissau
<4165> +proj=longlat +ellps=intl +towgs84=-173,253,27,0,0,0,0 +no_defs  <>
# Korean 1995
<4166> +proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# NZGD2000
<4167> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Accra
<4168> +proj=longlat +a=6378300 +b=6356751.689189189 +towgs84=-199,32,322,0,0,0,0 +no_defs  <>
# American Samoa 1962
<4169> +proj=longlat +ellps=clrk66 +towgs84=-115,118,426,0,0,0,0 +no_defs  <>
# SIRGAS 1995
<4170> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# RGF93
<4171> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# POSGAR
<4172> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# IRENET95
<4173> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Sierra Leone 1924
<4174> +proj=longlat +a=6378300 +b=6356751.689189189 +no_defs  <>
# Sierra Leone 1968
<4175> +proj=longlat +ellps=clrk80 +towgs84=-88,4,101,0,0,0,0 +no_defs  <>
# Australian Antarctic
<4176> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Pulkovo 1942(83)
<4178> +proj=longlat +ellps=krass +towgs84=26,-121,-78,0,0,0,0 +no_defs  <>
# Pulkovo 1942(58)
<4179> +proj=longlat +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +no_defs  <>
# EST97
<4180> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Luxembourg 1930
<4181> +proj=longlat +ellps=intl +towgs84=-189.6806,18.3463,-42.7695,-0.33746,-3.09264,2.53861,0.4598 +no_defs  <>
# Azores Occidental 1939
<4182> +proj=longlat +ellps=intl +towgs84=-425,-169,81,0,0,0,0 +no_defs  <>
# Azores Central 1948
<4183> +proj=longlat +ellps=intl +towgs84=-104,167,-38,0,0,0,0 +no_defs  <>
# Azores Oriental 1940
<4184> +proj=longlat +ellps=intl +towgs84=-203,141,53,0,0,0,0 +no_defs  <>
# Madeira 1936
<4185> +proj=longlat +ellps=intl +no_defs  <>
# OSNI 1952
<4188> +proj=longlat +ellps=airy +towgs84=482.5,-130.6,564.6,-1.042,-0.214,-0.631,8.15 +no_defs  <>
# REGVEN
<4189> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# POSGAR 98
<4190> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Albanian 1987
<4191> +proj=longlat +ellps=krass +towgs84=-44.183,-0.58,-38.489,2.3867,2.7072,-3.5196,-8.2703 +no_defs  <>
# Douala 1948
<4192> +proj=longlat +ellps=intl +towgs84=-206.1,-174.7,-87.7,0,0,0,0 +no_defs  <>
# Manoca 1962
<4193> +proj=longlat +a=6378249.2 +b=6356515 +towgs84=-70.9,-151.8,-41.4,0,0,0,0 +no_defs  <>
# Qornoq 1927
<4194> +proj=longlat +ellps=intl +towgs84=164,138,-189,0,0,0,0 +no_defs  <>
# Scoresbysund 1952
<4195> +proj=longlat +ellps=intl +towgs84=105,326,-102.5,0,0,0.814,-0.6 +no_defs  <>
# Ammassalik 1958
<4196> +proj=longlat +ellps=intl +towgs84=-45,417,-3.5,0,0,0.814,-0.6 +no_defs  <>
# Garoua
<4197> +proj=longlat +ellps=clrk80 +no_defs  <>
# Kousseri
<4198> +proj=longlat +ellps=clrk80 +no_defs  <>
# Egypt 1930
<4199> +proj=longlat +ellps=intl +no_defs  <>
# Pulkovo 1995
<4200> +proj=longlat +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +no_defs  <>
# Adindan
<4201> +proj=longlat +ellps=clrk80 +towgs84=-166,-15,204,0,0,0,0 +no_defs  <>
# AGD66
<4202> +proj=longlat +ellps=aust_SA +towgs84=-117.808,-51.536,137.784,0.303,0.446,0.234,-0.29 +no_defs  <>
# AGD84
<4203> +proj=longlat +ellps=aust_SA +towgs84=-134,-48,149,0,0,0,0 +no_defs  <>
# Ain el Abd
<4204> +proj=longlat +ellps=intl +towgs84=-143,-236,7,0,0,0,0 +no_defs  <>
# Afgooye
<4205> +proj=longlat +ellps=krass +towgs84=-43,-163,45,0,0,0,0 +no_defs  <>
# Agadez
<4206> +proj=longlat +a=6378249.2 +b=6356515 +no_defs  <>
# Lisbon
<4207> +proj=longlat +ellps=intl +towgs84=-304.046,-60.576,103.64,0,0,0,0 +no_defs  <>
# Aratu
<4208> +proj=longlat +ellps=intl +towgs84=-151.99,287.04,-147.45,0,0,0,0 +no_defs  <>
# Arc 1950
<4209> +proj=longlat +a=6378249.145 +b=6356514.966398753 +towgs84=-143,-90,-294,0,0,0,0 +no_defs  <>
# Arc 1960
<4210> +proj=longlat +ellps=clrk80 +towgs84=-160,-6,-302,0,0,0,0 +no_defs  <>
# Batavia
<4211> +proj=longlat +ellps=bessel +towgs84=-377,681,-50,0,0,0,0 +no_defs  <>
# Barbados 1938
<4212> +proj=longlat +ellps=clrk80 +towgs84=31.95,300.99,419.19,0,0,0,0 +no_defs  <>
# Beduaram
<4213> +proj=longlat +a=6378249.2 +b=6356515 +towgs84=-106,-87,188,0,0,0,0 +no_defs  <>
# Beijing 1954
<4214> +proj=longlat +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +no_defs  <>
# Belge 1950
<4215> +proj=longlat +ellps=intl +no_defs  <>
# Bermuda 1957
<4216> +proj=longlat +ellps=clrk66 +towgs84=-73,213,296,0,0,0,0 +no_defs  <>
# Bogota 1975
<4218> +proj=longlat +ellps=intl +towgs84=307,304,-318,0,0,0,0 +no_defs  <>
# Bukit Rimpah
<4219> +proj=longlat +ellps=bessel +towgs84=-384,664,-48,0,0,0,0 +no_defs  <>
# Camacupa
<4220> +proj=longlat +ellps=clrk80 +towgs84=-50.9,-347.6,-231,0,0,0,0 +no_defs  <>
# Campo Inchauspe
<4221> +proj=longlat +ellps=intl +towgs84=-148,136,90,0,0,0,0 +no_defs  <>
# Cape
<4222> +proj=longlat +a=6378249.145 +b=6356514.966398753 +towgs84=-136,-108,-292,0,0,0,0 +no_defs  <>
# Carthage
<4223> +proj=longlat +datum=carthage +no_defs  <>
# Chua
<4224> +proj=longlat +ellps=intl +towgs84=-143.87,243.37,-33.52,0,0,0,0 +no_defs  <>
# Corrego Alegre 1970-72
<4225> +proj=longlat +ellps=intl +towgs84=-205.57,168.77,-4.12,0,0,0,0 +no_defs  <>
# Cote d'Ivoire
<4226> +proj=longlat +a=6378249.2 +b=6356515 +no_defs  <>
# Deir ez Zor
<4227> +proj=longlat +a=6378249.2 +b=6356515 +towgs84=-190.421,8.532,238.69,0,0,0,0 +no_defs  <>
# Douala
<4228> +proj=longlat +a=6378249.2 +b=6356515 +no_defs  <>
# Egypt 1907
<4229> +proj=longlat +ellps=helmert +towgs84=-130,110,-13,0,0,0,0 +no_defs  <>
# ED50
<4230> +proj=longlat +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +no_defs  <>
# ED87
<4231> +proj=longlat +ellps=intl +towgs84=-83.11,-97.38,-117.22,0.005693,-0.044698,0.044285,0.1218 +no_defs  <>
# Fahud
<4232> +proj=longlat +ellps=clrk80 +towgs84=-333.102,-11.02,230.69,0,0,0.554,0.219 +no_defs  <>
# Gandajika 1970
<4233> +proj=longlat +ellps=intl +towgs84=-133,-321,50,0,0,0,0 +no_defs  <>
# Garoua
<4234> +proj=longlat +a=6378249.2 +b=6356515 +no_defs  <>
# Guyane Francaise
<4235> +proj=longlat +ellps=intl +no_defs  <>
# Hu Tzu Shan 1950
<4236> +proj=longlat +ellps=intl +towgs84=-637,-549,-203,0,0,0,0 +no_defs  <>
# HD72
<4237> +proj=longlat +ellps=GRS67 +towgs84=52.17,-71.82,-14.9,0,0,0,0 +no_defs  <>
# ID74
<4238> +proj=longlat +a=6378160 +b=6356774.50408554 +towgs84=-24,-15,5,0,0,0,0 +no_defs  <>
# Indian 1954
<4239> +proj=longlat +a=6377276.345 +b=6356075.41314024 +towgs84=217,823,299,0,0,0,0 +no_defs  <>
# Indian 1975
<4240> +proj=longlat +a=6377276.345 +b=6356075.41314024 +towgs84=210,814,289,0,0,0,0 +no_defs  <>
# Jamaica 1875
<4241> +proj=longlat +a=6378249.144808011 +b=6356514.966204134 +no_defs  <>
# JAD69
<4242> +proj=longlat +ellps=clrk66 +towgs84=70,207,389.5,0,0,0,0 +no_defs  <>
# Kalianpur 1880
<4243> +proj=longlat +a=6377299.36559538 +b=6356098.359005156 +no_defs  <>
# Kandawala
<4244> +proj=longlat +a=6377276.345 +b=6356075.41314024 +towgs84=-97,787,86,0,0,0,0 +no_defs  <>
# Kertau 1968
<4245> +proj=longlat +a=6377304.063 +b=6356103.038993155 +towgs84=-11,851,5,0,0,0,0 +no_defs  <>
# KOC
<4246> +proj=longlat +ellps=clrk80 +towgs84=-294.7,-200.1,525.5,0,0,0,0 +no_defs  <>
# La Canoa
<4247> +proj=longlat +ellps=intl +towgs84=-273.5,110.6,-357.9,0,0,0,0 +no_defs  <>
# PSAD56
<4248> +proj=longlat +ellps=intl +towgs84=-288,175,-376,0,0,0,0 +no_defs  <>
# Lake
<4249> +proj=longlat +ellps=intl +no_defs  <>
# Leigon
<4250> +proj=longlat +ellps=clrk80 +towgs84=-130,29,364,0,0,0,0 +no_defs  <>
# Liberia 1964
<4251> +proj=longlat +ellps=clrk80 +towgs84=-90,40,88,0,0,0,0 +no_defs  <>
# Lome
<4252> +proj=longlat +a=6378249.2 +b=6356515 +no_defs  <>
# Luzon 1911
<4253> +proj=longlat +ellps=clrk66 +towgs84=-133,-77,-51,0,0,0,0 +no_defs  <>
# Hito XVIII 1963
<4254> +proj=longlat +ellps=intl +towgs84=16,196,93,0,0,0,0 +no_defs  <>
# Herat North
<4255> +proj=longlat +ellps=intl +towgs84=-333,-222,114,0,0,0,0 +no_defs  <>
# Mahe 1971
<4256> +proj=longlat +ellps=clrk80 +towgs84=41,-220,-134,0,0,0,0 +no_defs  <>
# Makassar
<4257> +proj=longlat +ellps=bessel +towgs84=-587.8,519.75,145.76,0,0,0,0 +no_defs  <>
# ETRS89
<4258> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Malongo 1987
<4259> +proj=longlat +ellps=intl +towgs84=-254.1,-5.36,-100.29,0,0,0,0 +no_defs  <>
# Manoca
<4260> +proj=longlat +ellps=clrk80 +towgs84=-70.9,-151.8,-41.4,0,0,0,0 +no_defs  <>
# Merchich
<4261> +proj=longlat +a=6378249.2 +b=6356515 +towgs84=31,146,47,0,0,0,0 +no_defs  <>
# Massawa
<4262> +proj=longlat +ellps=bessel +towgs84=639,405,60,0,0,0,0 +no_defs  <>
# Minna
<4263> +proj=longlat +ellps=clrk80 +towgs84=-92,-93,122,0,0,0,0 +no_defs  <>
# Mhast
<4264> +proj=longlat +ellps=intl +towgs84=-252.95,-4.11,-96.38,0,0,0,0 +no_defs  <>
# Monte Mario
<4265> +proj=longlat +ellps=intl +towgs84=-104.1,-49.1,-9.9,0.971,-2.917,0.714,-11.68 +no_defs  <>
# M'poraloko
<4266> +proj=longlat +a=6378249.2 +b=6356515 +towgs84=-74,-130,42,0,0,0,0 +no_defs  <>
# NAD27
<4267> +proj=longlat +datum=NAD27 +no_defs  <>
# NAD27 Michigan
<4268> +proj=longlat +a=6378450.047548896 +b=6356826.621488444 +no_defs  <>
# NAD83
<4269> +proj=longlat +datum=NAD83 +no_defs  <>
# Nahrwan 1967
<4270> +proj=longlat +ellps=clrk80 +towgs84=-249,-156,381,0,0,0,0 +no_defs  <>
# Naparima 1972
<4271> +proj=longlat +ellps=intl +towgs84=-10,375,165,0,0,0,0 +no_defs  <>
# NZGD49
<4272> +proj=longlat +datum=nzgd49 +no_defs  <>
# NGO 1948
<4273> +proj=longlat +a=6377492.018 +b=6356173.508712696 +towgs84=278.3,93,474.5,7.889,0.05,-6.61,6.21 +no_defs  <>
# Datum 73
<4274> +proj=longlat +ellps=intl +towgs84=-223.237,110.193,36.649,0,0,0,0 +no_defs  <>
# NTF
<4275> +proj=longlat +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +no_defs  <>
# NSWC 9Z-2
<4276> +proj=longlat +ellps=WGS66 +no_defs  <>
# OSGB 1936
<4277> +proj=longlat +datum=OSGB36 +no_defs  <>
# OSGB70
<4278> +proj=longlat +ellps=airy +no_defs  <>
# OS(SN)80
<4279> +proj=longlat +ellps=airy +no_defs  <>
# Padang
<4280> +proj=longlat +ellps=bessel +no_defs  <>
# Palestine 1923
<4281> +proj=longlat +a=6378300.789 +b=6356566.435 +towgs84=-275.7224,94.7824,340.8944,-8.001,-4.42,-11.821,1 +no_defs  <>
# Pointe Noire
<4282> +proj=longlat +a=6378249.2 +b=6356515 +towgs84=-148,51,-291,0,0,0,0 +no_defs  <>
# GDA94
<4283> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Pulkovo 1942
<4284> +proj=longlat +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +no_defs  <>
# Qatar 1974
<4285> +proj=longlat +ellps=intl +towgs84=-128.16,-282.42,21.93,0,0,0,0 +no_defs  <>
# Qatar 1948
<4286> +proj=longlat +ellps=helmert +no_defs  <>
# Qornoq
<4287> +proj=longlat +ellps=intl +towgs84=164,138,-189,0,0,0,0 +no_defs  <>
# Loma Quintana
<4288> +proj=longlat +ellps=intl +no_defs  <>
# Amersfoort
<4289> +proj=longlat +ellps=bessel +towgs84=565.2369,50.0087,465.658,-0.406857,0.350733,-1.87035,4.0812 +no_defs  <>
# SAD69
<4291> +proj=longlat +ellps=GRS67 +towgs84=-57,1,-41,0,0,0,0 +no_defs  <>
# Sapper Hill 1943
<4292> +proj=longlat +ellps=intl +towgs84=-355,21,72,0,0,0,0 +no_defs  <>
# Schwarzeck
<4293> +proj=longlat +ellps=bess_nam +towgs84=616,97,-251,0,0,0,0 +no_defs  <>
# Segora
<4294> +proj=longlat +ellps=bessel +towgs84=-403,684,41,0,0,0,0 +no_defs  <>
# Serindung
<4295> +proj=longlat +ellps=bessel +no_defs  <>
# Sudan
<4296> +proj=longlat +a=6378249.2 +b=6356515 +no_defs  <>
# Tananarive
<4297> +proj=longlat +ellps=intl +towgs84=-189,-242,-91,0,0,0,0 +no_defs  <>
# Timbalai 1948
<4298> +proj=longlat +ellps=evrstSS +towgs84=-679,669,-48,0,0,0,0 +no_defs  <>
# TM65
<4299> +proj=longlat +datum=ire65 +no_defs  <>
# TM75
<4300> +proj=longlat +ellps=mod_airy +towgs84=482.5,-130.6,564.6,-1.042,-0.214,-0.631,8.15 +no_defs  <>
# Tokyo
<4301> +proj=longlat +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +no_defs  <>
# Trinidad 1903
<4302> +proj=longlat +a=6378293.645208759 +b=6356617.987679838 +towgs84=-61.702,284.488,472.052,0,0,0,0 +no_defs  <>
# TC(1948)
<4303> +proj=longlat +ellps=helmert +no_defs  <>
# Voirol 1875
<4304> +proj=longlat +a=6378249.2 +b=6356515 +towgs84=-73,-247,227,0,0,0,0 +no_defs  <>
# Bern 1938
<4306> +proj=longlat +ellps=bessel +no_defs  <>
# Nord Sahara 1959
<4307> +proj=longlat +ellps=clrk80 +towgs84=-209.3622,-87.8162,404.6198,0.0046,3.4784,0.5805,-1.4547 +no_defs  <>
# RT38
<4308> +proj=longlat +ellps=bessel +no_defs  <>
# Yacare
<4309> +proj=longlat +ellps=intl +towgs84=-155,171,37,0,0,0,0 +no_defs  <>
# Yoff
<4310> +proj=longlat +a=6378249.2 +b=6356515 +towgs84=-30,190,89,0,0,0,0 +no_defs  <>
# Zanderij
<4311> +proj=longlat +ellps=intl +towgs84=-265,120,-358,0,0,0,0 +no_defs  <>
# MGI
<4312> +proj=longlat +datum=hermannskogel +no_defs  <>
# Belge 1972
<4313> +proj=longlat +ellps=intl +towgs84=-106.8686,52.2978,-103.7239,0.3366,-0.457,1.8422,-1.2747 +no_defs  <>
# DHDN
<4314> +proj=longlat +datum=potsdam +no_defs  <>
# Conakry 1905
<4315> +proj=longlat +a=6378249.2 +b=6356515 +towgs84=-23,259,-9,0,0,0,0 +no_defs  <>
# Dealul Piscului 1930
<4316> +proj=longlat +ellps=intl +towgs84=103.25,-100.4,-307.19,0,0,0,0 +no_defs  <>
# Dealul Piscului 1970
<4317> +proj=longlat +ellps=krass +towgs84=28,-121,-77,0,0,0,0 +no_defs  <>
# NGN
<4318> +proj=longlat +ellps=WGS84 +towgs84=-3.2,-5.7,2.8,0,0,0,0 +no_defs  <>
# KUDAMS
<4319> +proj=longlat +ellps=GRS80 +towgs84=-20.8,11.3,2.4,0,0,0,0 +no_defs  <>
# WGS 72
<4322> +proj=longlat +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +no_defs  <>
# WGS 72BE
<4324> +proj=longlat +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +no_defs  <>
# WGS 84
<4326> +proj=longlat +datum=WGS84 +no_defs  <>
# RGSPM06
<4463> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# RGM04
<4470> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Cadastre 1997
<4475> +proj=longlat +ellps=intl +towgs84=-381.788,-57.501,-256.673,0,0,0,0 +no_defs  <>
# Mexico ITRF92
<4483> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# China Geodetic Coordinate System 2000
<4490> +proj=longlat +ellps=GRS80 +no_defs  <>
# New Beijing
<4555> +proj=longlat +ellps=krass +no_defs  <>
# RRAF 1991
<4558> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Anguilla 1957
<4600> +proj=longlat +ellps=clrk80 +no_defs  <>
# Antigua 1943
<4601> +proj=longlat +ellps=clrk80 +towgs84=-255,-15,71,0,0,0,0 +no_defs  <>
# Dominica 1945
<4602> +proj=longlat +ellps=clrk80 +towgs84=725,685,536,0,0,0,0 +no_defs  <>
# Grenada 1953
<4603> +proj=longlat +ellps=clrk80 +towgs84=72,213.7,93,0,0,0,0 +no_defs  <>
# Montserrat 1958
<4604> +proj=longlat +ellps=clrk80 +towgs84=174,359,365,0,0,0,0 +no_defs  <>
# St. Kitts 1955
<4605> +proj=longlat +ellps=clrk80 +towgs84=9,183,236,0,0,0,0 +no_defs  <>
# St. Lucia 1955
<4606> +proj=longlat +ellps=clrk80 +towgs84=-149,128,296,0,0,0,0 +no_defs  <>
# St. Vincent 1945
<4607> +proj=longlat +ellps=clrk80 +towgs84=195.671,332.517,274.607,0,0,0,0 +no_defs  <>
# NAD27(76)
<4608> +proj=longlat +ellps=clrk66 +no_defs  <>
# NAD27(CGQ77)
<4609> +proj=longlat +ellps=clrk66 +no_defs  <>
# Xian 1980
<4610> +proj=longlat +a=6378140 +b=6356755.288157528 +no_defs  <>
# Hong Kong 1980
<4611> +proj=longlat +ellps=intl +towgs84=-162.619,-276.959,-161.764,0.067753,-2.243649,-1.158827,-1.094246 +no_defs  <>
# JGD2000
<4612> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Segara
<4613> +proj=longlat +ellps=bessel +towgs84=-403,684,41,0,0,0,0 +no_defs  <>
# QND95
<4614> +proj=longlat +ellps=intl +towgs84=-119.4248,-303.65872,-11.00061,1.164298,0.174458,1.096259,3.657065 +no_defs  <>
# Porto Santo
<4615> +proj=longlat +ellps=intl +towgs84=-499,-249,314,0,0,0,0 +no_defs  <>
# Selvagem Grande
<4616> +proj=longlat +ellps=intl +towgs84=-289,-124,60,0,0,0,0 +no_defs  <>
# NAD83(CSRS)
<4617> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# SAD69
<4618> +proj=longlat +ellps=aust_SA +towgs84=-66.87,4.37,-38.52,0,0,0,0 +no_defs  <>
# SWEREF99
<4619> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Point 58
<4620> +proj=longlat +ellps=clrk80 +towgs84=-106,-129,165,0,0,0,0 +no_defs  <>
# Fort Marigot
<4621> +proj=longlat +ellps=intl +towgs84=137,248,-430,0,0,0,0 +no_defs  <>
# Guadeloupe 1948
<4622> +proj=longlat +ellps=intl +towgs84=-467,-16,-300,0,0,0,0 +no_defs  <>
# CSG67
<4623> +proj=longlat +ellps=intl +towgs84=-186,230,110,0,0,0,0 +no_defs  <>
# RGFG95
<4624> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Martinique 1938
<4625> +proj=longlat +ellps=intl +towgs84=186,482,151,0,0,0,0 +no_defs  <>
# Reunion 1947
<4626> +proj=longlat +ellps=intl +towgs84=94,-948,-1262,0,0,0,0 +no_defs  <>
# RGR92
<4627> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Tahiti 52
<4628> +proj=longlat +ellps=intl +towgs84=162,117,154,0,0,0,0 +no_defs  <>
# Tahaa 54
<4629> +proj=longlat +ellps=intl +towgs84=72.438,345.918,79.486,1.6045,0.8823,0.5565,1.3746 +no_defs  <>
# IGN72 Nuku Hiva
<4630> +proj=longlat +ellps=intl +towgs84=84,274,65,0,0,0,0 +no_defs  <>
# K0 1949
<4631> +proj=longlat +ellps=intl +towgs84=145,-187,103,0,0,0,0 +no_defs  <>
# Combani 1950
<4632> +proj=longlat +ellps=intl +towgs84=-382,-59,-262,0,0,0,0 +no_defs  <>
# IGN56 Lifou
<4633> +proj=longlat +ellps=intl +towgs84=335.47,222.58,-230.94,0,0,0,0 +no_defs  <>
# IGN72 Grand Terre
<4634> +proj=longlat +ellps=intl +towgs84=-13,-348,292,0,0,0,0 +no_defs  <>
# ST87 Ouvea
<4635> +proj=longlat +ellps=intl +towgs84=-122.383,-188.696,103.344,3.5107,-4.9668,-5.7047,4.4798 +no_defs  <>
# Petrels 1972
<4636> +proj=longlat +ellps=intl +towgs84=365,194,166,0,0,0,0 +no_defs  <>
# Perroud 1950
<4637> +proj=longlat +ellps=intl +towgs84=325,154,172,0,0,0,0 +no_defs  <>
# Saint Pierre et Miquelon 1950
<4638> +proj=longlat +ellps=clrk66 +towgs84=11.363,424.148,373.13,0,0,0,0 +no_defs  <>
# MOP78
<4639> +proj=longlat +ellps=intl +towgs84=253,-132,-127,0,0,0,0 +no_defs  <>
# RRAF 1991
<4640> +proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# IGN53 Mare
<4641> +proj=longlat +ellps=intl +towgs84=287.58,177.78,-135.41,0,0,0,0 +no_defs  <>
# ST84 Ile des Pins
<4642> +proj=longlat +ellps=intl +towgs84=-13,-348,292,0,0,0,0 +no_defs  <>
# ST71 Belep
<4643> +proj=longlat +ellps=intl +towgs84=-480.26,-438.32,-643.429,16.3119,20.1721,-4.0349,-111.7002 +no_defs  <>
# NEA74 Noumea
<4644> +proj=longlat +ellps=intl +towgs84=-10.18,-350.43,291.37,0,0,0,0 +no_defs  <>
# RGNC 1991
<4645> +proj=longlat +ellps=intl +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Grand Comoros
<4646> +proj=longlat +ellps=intl +towgs84=-963,510,-359,0,0,0,0 +no_defs  <>
# Reykjavik 1900
<4657> +proj=longlat +a=6377019.27 +b=6355762.5391 +towgs84=-28,199,5,0,0,0,0 +no_defs  <>
# Hjorsey 1955
<4658> +proj=longlat +ellps=intl +towgs84=-73,47,-83,0,0,0,0 +no_defs  <>
# ISN93
<4659> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Helle 1954
<4660> +proj=longlat +ellps=intl +towgs84=982.6087,552.753,-540.873,6.6816266,-31.6114924,-19.84816,16.805 +no_defs  <>
# LKS92
<4661> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# IGN72 Grande Terre
<4662> +proj=longlat +ellps=intl +towgs84=-11.64,-348.6,291.98,0,0,0,0 +no_defs  <>
# Porto Santo 1995
<4663> +proj=longlat +ellps=intl +towgs84=-502.862,-247.438,312.724,0,0,0,0 +no_defs  <>
# Azores Oriental 1995
<4664> +proj=longlat +ellps=intl +towgs84=-204.619,140.176,55.226,0,0,0,0 +no_defs  <>
# Azores Central 1995
<4665> +proj=longlat +ellps=intl +towgs84=-106.226,166.366,-37.893,0,0,0,0 +no_defs  <>
# Lisbon 1890
<4666> +proj=longlat +ellps=bessel +towgs84=508.088,-191.042,565.223,0,0,0,0 +no_defs  <>
# IKBD-92
<4667> +proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# ED79
<4668> +proj=longlat +ellps=intl +towgs84=-86,-98,-119,0,0,0,0 +no_defs  <>
# LKS94
<4669> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# IGM95
<4670> +proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Voirol 1879
<4671> +proj=longlat +a=6378249.2 +b=6356515 +no_defs  <>
# Chatham Islands 1971
<4672> +proj=longlat +ellps=intl +towgs84=175,-38,113,0,0,0,0 +no_defs  <>
# Chatham Islands 1979
<4673> +proj=longlat +ellps=intl +towgs84=174.05,-25.49,112.57,0,0,0.554,0.2263 +no_defs  <>
# SIRGAS 2000
<4674> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Guam 1963
<4675> +proj=longlat +ellps=clrk66 +towgs84=-100,-248,259,0,0,0,0 +no_defs  <>
# Vientiane 1982
<4676> +proj=longlat +ellps=krass +no_defs  <>
# Lao 1993
<4677> +proj=longlat +ellps=krass +no_defs  <>
# Lao 1997
<4678> +proj=longlat +ellps=krass +towgs84=44.585,-131.212,-39.544,0,0,0,0 +no_defs  <>
# Jouik 1961
<4679> +proj=longlat +ellps=clrk80 +towgs84=-80.01,253.26,291.19,0,0,0,0 +no_defs  <>
# Nouakchott 1965
<4680> +proj=longlat +ellps=clrk80 +towgs84=124.5,-63.5,-281,0,0,0,0 +no_defs  <>
# Mauritania 1999
<4681> +proj=longlat +ellps=clrk80 +no_defs  <>
# Gulshan 303
<4682> +proj=longlat +a=6377276.345 +b=6356075.41314024 +towgs84=283.7,735.9,261.1,0,0,0,0 +no_defs  <>
# PRS92
<4683> +proj=longlat +ellps=clrk66 +towgs84=-127.62,-67.24,-47.04,-3.068,4.903,1.578,-1.06 +no_defs  <>
# Gan 1970
<4684> +proj=longlat +ellps=intl +towgs84=-133,-321,50,0,0,0,0 +no_defs  <>
# Gandajika
<4685> +proj=longlat +ellps=intl +no_defs  <>
# MAGNA-SIRGAS
<4686> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# RGPF
<4687> +proj=longlat +ellps=GRS80 +towgs84=0.072,-0.507,-0.245,-0.0183,0.0003,-0.007,-0.0093 +no_defs  <>
# Fatu Iva 72
<4688> +proj=longlat +ellps=intl +towgs84=347.103,1078.125,2623.922,-33.8875,70.6773,-9.3943,186.074 +no_defs  <>
# IGN63 Hiva Oa
<4689> +proj=longlat +ellps=intl +towgs84=410.721,55.049,80.746,2.5779,2.3514,0.6664,17.3311 +no_defs  <>
# Tahiti 79
<4690> +proj=longlat +ellps=intl +towgs84=221.525,152.948,176.768,-2.3847,-1.3896,-0.877,11.4741 +no_defs  <>
# Moorea 87
<4691> +proj=longlat +ellps=intl +towgs84=215.525,149.593,176.229,-3.2624,-1.692,-1.1571,10.4773 +no_defs  <>
# Maupiti 83
<4692> +proj=longlat +ellps=intl +towgs84=217.037,86.959,23.956,0,0,0,0 +no_defs  <>
# Nakhl-e Ghanem
<4693> +proj=longlat +ellps=WGS84 +towgs84=0,-0.15,0.68,0,0,0,0 +no_defs  <>
# POSGAR 94
<4694> +proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Katanga 1955
<4695> +proj=longlat +ellps=clrk66 +towgs84=-103.746,-9.614,-255.95,0,0,0,0 +no_defs  <>
# Kasai 1953
<4696> +proj=longlat +ellps=clrk80 +no_defs  <>
# IGC 1962 6th Parallel South
<4697> +proj=longlat +ellps=clrk80 +no_defs  <>
# IGN 1962 Kerguelen
<4698> +proj=longlat +ellps=intl +towgs84=145,-187,103,0,0,0,0 +no_defs  <>
# Le Pouce 1934
<4699> +proj=longlat +ellps=clrk80 +towgs84=-770.1,158.4,-498.2,0,0,0,0 +no_defs  <>
# IGN Astro 1960
<4700> +proj=longlat +ellps=clrk80 +no_defs  <>
# IGCB 1955
<4701> +proj=longlat +ellps=clrk80 +towgs84=-79.9,-158,-168.9,0,0,0,0 +no_defs  <>
# Mauritania 1999
<4702> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Mhast 1951
<4703> +proj=longlat +ellps=clrk80 +no_defs  <>
# Mhast (onshore)
<4704> +proj=longlat +ellps=intl +no_defs  <>
# Mhast (offshore)
<4705> +proj=longlat +ellps=intl +no_defs  <>
# Egypt Gulf of Suez S-650 TL
<4706> +proj=longlat +ellps=helmert +towgs84=-146.21,112.63,4.05,0,0,0,0 +no_defs  <>
# Tern Island 1961
<4707> +proj=longlat +ellps=intl +towgs84=114,-116,-333,0,0,0,0 +no_defs  <>
# Cocos Islands 1965
<4708> +proj=longlat +ellps=aust_SA +towgs84=-491,-22,435,0,0,0,0 +no_defs  <>
# Iwo Jima 1945
<4709> +proj=longlat +ellps=intl +towgs84=145,75,-272,0,0,0,0 +no_defs  <>
# Astro DOS 71
<4710> +proj=longlat +ellps=intl +towgs84=-320,550,-494,0,0,0,0 +no_defs  <>
# Marcus Island 1952
<4711> +proj=longlat +ellps=intl +towgs84=124,-234,-25,0,0,0,0 +no_defs  <>
# Ascension Island 1958
<4712> +proj=longlat +ellps=intl +towgs84=-205,107,53,0,0,0,0 +no_defs  <>
# Ayabelle Lighthouse
<4713> +proj=longlat +ellps=clrk80 +towgs84=-77,-128,142,0,0,0,0 +no_defs  <>
# Bellevue
<4714> +proj=longlat +ellps=intl +towgs84=-127,-769,472,0,0,0,0 +no_defs  <>
# Camp Area Astro
<4715> +proj=longlat +ellps=intl +towgs84=-104,-129,239,0,0,0,0 +no_defs  <>
# Phoenix Islands 1966
<4716> +proj=longlat +ellps=intl +towgs84=298,-304,-375,0,0,0,0 +no_defs  <>
# Cape Canaveral
<4717> +proj=longlat +ellps=clrk66 +towgs84=-2,151,181,0,0,0,0 +no_defs  <>
# Solomon 1968
<4718> +proj=longlat +ellps=intl +towgs84=230,-199,-752,0,0,0,0 +no_defs  <>
# Easter Island 1967
<4719> +proj=longlat +ellps=intl +towgs84=211,147,111,0,0,0,0 +no_defs  <>
# Fiji 1986
<4720> +proj=longlat +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +no_defs  <>
# Fiji 1956
<4721> +proj=longlat +ellps=intl +towgs84=265.025,384.929,-194.046,0,0,0,0 +no_defs  <>
# South Georgia 1968
<4722> +proj=longlat +ellps=intl +towgs84=-794,119,-298,0,0,0,0 +no_defs  <>
# GCGD59
<4723> +proj=longlat +ellps=clrk66 +towgs84=-179.483,-69.379,-27.584,-7.862,8.163,6.042,-13.925 +no_defs  <>
# Diego Garcia 1969
<4724> +proj=longlat +ellps=intl +towgs84=208,-435,-229,0,0,0,0 +no_defs  <>
# Johnston Island 1961
<4725> +proj=longlat +ellps=intl +towgs84=189,-79,-202,0,0,0,0 +no_defs  <>
# SIGD61
<4726> +proj=longlat +ellps=clrk66 +towgs84=8.853,-52.644,180.304,-0.393,-2.323,2.96,-24.081 +no_defs  <>
# Midway 1961
<4727> +proj=longlat +ellps=intl +towgs84=403,-81,277,0,0,0,0 +no_defs  <>
# Pico de las Nieves 1984
<4728> +proj=longlat +ellps=intl +towgs84=-307,-92,127,0,0,0,0 +no_defs  <>
# Pitcairn 1967
<4729> +proj=longlat +ellps=intl +towgs84=185,165,42,0,0,0,0 +no_defs  <>
# Santo 1965
<4730> +proj=longlat +ellps=intl +towgs84=170,42,84,0,0,0,0 +no_defs  <>
# Viti Levu 1916
<4731> +proj=longlat +ellps=clrk80 +towgs84=51,391,-36,0,0,0,0 +no_defs  <>
# Marshall Islands 1960
<4732> +proj=longlat +a=6378270 +b=6356794.343434343 +towgs84=102,52,-38,0,0,0,0 +no_defs  <>
# Wake Island 1952
<4733> +proj=longlat +ellps=intl +towgs84=276,-57,149,0,0,0,0 +no_defs  <>
# Tristan 1968
<4734> +proj=longlat +ellps=intl +towgs84=-632,438,-609,0,0,0,0 +no_defs  <>
# Kusaie 1951
<4735> +proj=longlat +ellps=intl +towgs84=647,1777,-1124,0,0,0,0 +no_defs  <>
# Deception Island
<4736> +proj=longlat +ellps=clrk80 +towgs84=260,12,-147,0,0,0,0 +no_defs  <>
# Korea 2000
<4737> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Hong Kong 1963
<4738> +proj=longlat +a=6378293.645208759 +b=6356617.987679838 +no_defs  <>
# Hong Kong 1963(67)
<4739> +proj=longlat +ellps=intl +towgs84=-156,-271,-189,0,0,0,0 +no_defs  <>
# PZ-90
<4740> +proj=longlat +a=6378136 +b=6356751.361745712 +towgs84=0,0,1.5,0,0,0.076,0 +no_defs  <>
# FD54
<4741> +proj=longlat +ellps=intl +no_defs  <>
# GDM2000
<4742> +proj=longlat +ellps=GRS80 +no_defs  <>
# Karbala 1979
<4743> +proj=longlat +ellps=clrk80 +towgs84=70.995,-335.916,262.898,0,0,0,0 +no_defs  <>
# Nahrwan 1934
<4744> +proj=longlat +ellps=clrk80 +towgs84=-242.2,-144.9,370.3,0,0,0,0 +no_defs  <>
# RD/83
<4745> +proj=longlat +ellps=bessel +no_defs  <>
# PD/83
<4746> +proj=longlat +ellps=bessel +no_defs  <>
# GR96
<4747> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Vanua Levu 1915
<4748> +proj=longlat +a=6378306.3696 +b=6356571.996 +towgs84=51,391,-36,0,0,0,0 +no_defs  <>
# RGNC91-93
<4749> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# ST87 Ouvea
<4750> +proj=longlat +ellps=WGS84 +towgs84=-56.263,16.136,-22.856,0,0,0,0 +no_defs  <>
# Kertau (RSO)
<4751> +proj=longlat +a=6377295.664 +b=6356094.667915204 +no_defs  <>
# Viti Levu 1912
<4752> +proj=longlat +a=6378306.3696 +b=6356571.996 +towgs84=98,390,-22,0,0,0,0 +no_defs  <>
# fk89
<4753> +proj=longlat +ellps=intl +no_defs  <>
# LGD2006
<4754> +proj=longlat +ellps=intl +towgs84=-208.4058,-109.8777,-2.5764,0,0,0,0 +no_defs  <>
# DGN95
<4755> +proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# VN-2000
<4756> +proj=longlat +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,0.00928836,-0.01975479,0.00427372,0.252906278 +no_defs  <>
# SVY21
<4757> +proj=longlat +ellps=WGS84 +no_defs  <>
# JAD2001
<4758> +proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# NAD83(NSRS2007)
<4759> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# WGS 66
<4760> +proj=longlat +ellps=WGS66 +no_defs  <>
# HTRS96
<4761> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# BDA2000
<4762> +proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Pitcairn 2006
<4763> +proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# RSRGD2000
<4764> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Slovenia 1996
<4765> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Bern 1898 (Bern)
<4801> +proj=longlat +ellps=bessel +towgs84=674.374,15.056,405.346,0,0,0,0 +pm=bern +no_defs  <>
# Bogota 1975 (Bogota)
<4802> +proj=longlat +ellps=intl +towgs84=307,304,-318,0,0,0,0 +pm=bogota +no_defs  <>
# Lisbon (Lisbon)
<4803> +proj=longlat +ellps=intl +towgs84=-304.046,-60.576,103.64,0,0,0,0 +pm=lisbon +no_defs  <>
# Makassar (Jakarta)
<4804> +proj=longlat +ellps=bessel +towgs84=-587.8,519.75,145.76,0,0,0,0 +pm=jakarta +no_defs  <>
# MGI (Ferro)
<4805> +proj=longlat +ellps=bessel +towgs84=682,-203,480,0,0,0,0 +pm=ferro +no_defs  <>
# Monte Mario (Rome)
<4806> +proj=longlat +ellps=intl +towgs84=-104.1,-49.1,-9.9,0.971,-2.917,0.714,-11.68 +pm=rome +no_defs  <>
# NTF (Paris)
<4807> +proj=longlat +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +no_defs  <>
# Padang (Jakarta)
<4808> +proj=longlat +ellps=bessel +pm=jakarta +no_defs  <>
# Belge 1950 (Brussels)
<4809> +proj=longlat +ellps=intl +pm=brussels +no_defs  <>
# Tananarive (Paris)
<4810> +proj=longlat +ellps=intl +towgs84=-189,-242,-91,0,0,0,0 +pm=paris +no_defs  <>
# Voirol 1875 (Paris)
<4811> +proj=longlat +a=6378249.2 +b=6356515 +towgs84=-73,-247,227,0,0,0,0 +pm=paris +no_defs  <>
# Batavia (Jakarta)
<4813> +proj=longlat +ellps=bessel +towgs84=-377,681,-50,0,0,0,0 +pm=jakarta +no_defs  <>
# RT38 (Stockholm)
<4814> +proj=longlat +ellps=bessel +pm=stockholm +no_defs  <>
# Greek (Athens)
<4815> +proj=longlat +ellps=bessel +pm=athens +no_defs  <>
# Carthage (Paris)
<4816> +proj=longlat +a=6378249.2 +b=6356515 +towgs84=-263,6,431,0,0,0,0 +pm=paris +no_defs  <>
# NGO 1948 (Oslo)
<4817> +proj=longlat +a=6377492.018 +b=6356173.508712696 +towgs84=278.3,93,474.5,7.889,0.05,-6.61,6.21 +pm=oslo +no_defs  <>
# S-JTSK (Ferro)
<4818> +proj=longlat +ellps=bessel +towgs84=589,76,480,0,0,0,0 +pm=ferro +no_defs  <>
# Nord Sahara 1959 (Paris)
<4819> +proj=longlat +ellps=clrk80 +towgs84=-209.3622,-87.8162,404.6198,0.0046,3.4784,0.5805,-1.4547 +pm=paris +no_defs  <>
# Segara (Jakarta)
<4820> +proj=longlat +ellps=bessel +towgs84=-403,684,41,0,0,0,0 +pm=jakarta +no_defs  <>
# Voirol 1879 (Paris)
<4821> +proj=longlat +a=6378249.2 +b=6356515 +pm=paris +no_defs  <>
# Sao Tome
<4823> +proj=longlat +ellps=intl +no_defs  <>
# Principe
<4824> +proj=longlat +ellps=intl +no_defs  <>
# ATF (Paris)
<4901> +proj=longlat +a=6376523 +b=6355862.933255573 +pm=2.337208333333333 +no_defs  <>
# NDG (Paris)
<4902> +proj=longlat +a=6376523 +b=6355862.933255573 +pm=paris +no_defs  <>
# Madrid 1870 (Madrid)
<4903> +proj=longlat +a=6378298.3 +b=6356657.142669561 +pm=madrid +no_defs  <>
# Lisbon 1890 (Lisbon)
<4904> +proj=longlat +ellps=bessel +towgs84=508.088,-191.042,565.223,0,0,0,0 +pm=lisbon +no_defs  <>
# PTRA08
<5013> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Tokyo 1892
<5132> +proj=longlat +ellps=bessel +no_defs  <>
# S-JTSK/05
<5228> +proj=longlat +ellps=bessel +towgs84=572.213,85.334,461.94,4.9732,1.529,5.2484,3.5378 +no_defs  <>
# S-JTSK/05 (Ferro)
<5229> +proj=longlat +ellps=bessel +towgs84=572.213,85.334,461.94,4.9732,1.529,5.2484,3.5378 +pm=ferro +no_defs  <>
# SLD99
<5233> +proj=longlat +a=6377276.345 +b=6356075.41314024 +towgs84=-0.293,766.95,87.713,0.195704,1.695068,3.473016,-0.039338 +no_defs  <>
# GDBD2009
<5246> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# TUREF
<5252> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# DRUKREF 03
<5264> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# ISN2004
<5324> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# POSGAR 2007
<5340> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# MARGEN
<5354> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# SIRGAS-Chile
<5360> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# CR05
<5365> +proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# MACARIO SOLIS
<5371> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Peru96
<5373> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# SIRGAS-ROU98
<5381> +proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# SIRGAS_ES2007.8
<5393> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Ocotepeque 1935
<5451> +proj=longlat +ellps=clrk66 +towgs84=205,96,-98,0,0,0,0 +no_defs  <>
# Sibun Gorge 1922
<5464> +proj=longlat +a=6378293.645208759 +b=6356617.987679838 +no_defs  <>
# Panama-Colon 1911
<5467> +proj=longlat +ellps=clrk66 +no_defs  <>
# RGAF09
<5489> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Corrego Alegre 1961
<5524> +proj=longlat +ellps=intl +no_defs  <>
# SAD69(96)
<5527> +proj=longlat +ellps=aust_SA +towgs84=-67.35,3.88,-38.22,0,0,0,0 +no_defs  <>
# PNG94
<5546> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# UCS-2000
<5561> +proj=longlat +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +no_defs  <>
# FEH2010
<5593> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# DB_REF
<5681> +proj=longlat +ellps=bessel +no_defs  <>
# TGD2005
<5886> +proj=longlat +ellps=GRS80 +no_defs  <>
# CIGD11
<6135> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Nepal 1981
<6207> +proj=longlat +a=6377276.345 +b=6356075.41314024 +towgs84=293.17,726.18,245.36,0,0,0,0 +no_defs  <>
# CGRS93
<6311> +proj=longlat +ellps=WGS84 +towgs84=8.846,-4.394,-1.122,-0.00237,-0.146528,0.130428,0.783926 +no_defs  <>
# NAD83(2011)
<6318> +proj=longlat +ellps=GRS80 +no_defs  <>
# NAD83(PA11)
<6322> +proj=longlat +ellps=GRS80 +no_defs  <>
# NAD83(MA11)
<6325> +proj=longlat +ellps=GRS80 +no_defs  <>
# Mexico ITRF2008
<6365> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# JGD2011
<6668> +proj=longlat +ellps=GRS80 +no_defs  <>
# RDN2008
<6706> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# NAD83(CORS96)
<6783> +proj=longlat +ellps=GRS80 +no_defs  <>
# Aden 1925
<6881> +proj=longlat +ellps=clrk80 +towgs84=-24,-203,268,0,0,0,0 +no_defs  <>
# Bekaa Valley 1920
<6882> +proj=longlat +ellps=clrk80 +towgs84=-183,-15,273,0,0,0,0 +no_defs  <>
# Bioko
<6883> +proj=longlat +ellps=intl +towgs84=-235,-110,393,0,0,0,0 +no_defs  <>
# South East Island 1943
<6892> +proj=longlat +ellps=clrk80 +towgs84=-43.685,-179.785,-267.721,0,0,0,0 +no_defs  <>
# Gambia
<6894> +proj=longlat +ellps=clrk80 +towgs84=-63,176,185,0,0,0,0 +no_defs  <>
# IGD05
<6980> +proj=longlat +ellps=GRS80 +no_defs  <>
# IG05 Intermediate CRS
<6983> +proj=longlat +ellps=GRS80 +no_defs  <>
# IGD05/12
<6987> +proj=longlat +ellps=GRS80 +no_defs  <>
# IG05/12 Intermediate CRS
<6990> +proj=longlat +ellps=GRS80 +no_defs  <>
# RGSPM06 (lon-lat)
<7035> +proj=longlat +ellps=GRS80 +no_defs  <>
# RGR92 (lon-lat)
<7037> +proj=longlat +ellps=GRS80 +no_defs  <>
# RGM04 (lon-lat)
<7039> +proj=longlat +ellps=GRS80 +no_defs  <>
# RGFG95 (lon-lat)
<7041> +proj=longlat +ellps=GRS80 +no_defs  <>
# RGTAAF07
<7073> +proj=longlat +ellps=GRS80 +no_defs  <>
# RGF93 (lon-lat)
<7084> +proj=longlat +ellps=GRS80 +no_defs  <>
# RGAF09 (lon-lat)
<7086> +proj=longlat +ellps=GRS80 +no_defs  <>
# RGTAAF07 (lon-lat)
<7088> +proj=longlat +ellps=GRS80 +no_defs  <>
# RGTAAF07 (lon-lat)
<7133> +proj=longlat +ellps=GRS80 +no_defs  <>
# IGD05
<7136> +proj=longlat +ellps=WGS84 +no_defs  <>
# IGD05/12
<7139> +proj=longlat +ellps=WGS84 +no_defs  <>
# ONGD14
<7373> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# GSK-2011
<7683> +proj=longlat +a=6378136.5 +b=6356751.757955603 +no_defs  <>
# Kyrg-06
<7686> +proj=longlat +ellps=GRS80 +no_defs  <>
# BGS2005
<7798> +proj=longlat +ellps=GRS80 +no_defs  <>
# GDA2020
<7844> +proj=longlat +ellps=GRS80 +no_defs  <>
# St. Helena Tritan
<7881> +proj=longlat +ellps=WGS84 +towgs84=-0.077,0.079,0.086,0,0,0,0 +no_defs  <>
# SHGD2015
<7886> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  <>
# Gusterberg (Ferro)
<8042> +proj=longlat +a=6376045 +b=6355477.112903226 +pm=ferro +no_defs  <>
# St. Stephen (Ferro)
<8043> +proj=longlat +a=6376045 +b=6355477.112903226 +pm=ferro +no_defs  <>
# ISN2016
<8086> +proj=longlat +ellps=GRS80 +no_defs  <>
# NAD83(CSRS96)
<8232> +proj=longlat +ellps=GRS80 +no_defs  <>
# NAD83(CSRS)v2
<8237> +proj=longlat +ellps=GRS80 +no_defs  <>
# NAD83(CSRS)v3
<8240> +proj=longlat +ellps=GRS80 +no_defs  <>
# NAD83(CSRS)v4
<8246> +proj=longlat +ellps=GRS80 +no_defs  <>
# NAD83(CSRS)v5
<8249> +proj=longlat +ellps=GRS80 +no_defs  <>
# NAD83(CSRS)v6
<8252> +proj=longlat +ellps=GRS80 +no_defs  <>
# NAD83(CSRS)v7
<8255> +proj=longlat +ellps=GRS80 +no_defs  <>
# Anguilla 1957 / British West Indies Grid
<2000> +proj=tmerc +lat_0=0 +lon_0=-62 +k=0.9995000000000001 +x_0=400000 +y_0=0 +ellps=clrk80 +units=m +no_defs  <>
# Antigua 1943 / British West Indies Grid
<2001> +proj=tmerc +lat_0=0 +lon_0=-62 +k=0.9995000000000001 +x_0=400000 +y_0=0 +ellps=clrk80 +towgs84=-255,-15,71,0,0,0,0 +units=m +no_defs  <>
# Dominica 1945 / British West Indies Grid
<2002> +proj=tmerc +lat_0=0 +lon_0=-62 +k=0.9995000000000001 +x_0=400000 +y_0=0 +ellps=clrk80 +towgs84=725,685,536,0,0,0,0 +units=m +no_defs  <>
# Grenada 1953 / British West Indies Grid
<2003> +proj=tmerc +lat_0=0 +lon_0=-62 +k=0.9995000000000001 +x_0=400000 +y_0=0 +ellps=clrk80 +towgs84=72,213.7,93,0,0,0,0 +units=m +no_defs  <>
# Montserrat 1958 / British West Indies Grid
<2004> +proj=tmerc +lat_0=0 +lon_0=-62 +k=0.9995000000000001 +x_0=400000 +y_0=0 +ellps=clrk80 +towgs84=174,359,365,0,0,0,0 +units=m +no_defs  <>
# St. Kitts 1955 / British West Indies Grid
<2005> +proj=tmerc +lat_0=0 +lon_0=-62 +k=0.9995000000000001 +x_0=400000 +y_0=0 +ellps=clrk80 +towgs84=9,183,236,0,0,0,0 +units=m +no_defs  <>
# St. Lucia 1955 / British West Indies Grid
<2006> +proj=tmerc +lat_0=0 +lon_0=-62 +k=0.9995000000000001 +x_0=400000 +y_0=0 +ellps=clrk80 +towgs84=-149,128,296,0,0,0,0 +units=m +no_defs  <>
# St. Vincent 45 / British West Indies Grid
<2007> +proj=tmerc +lat_0=0 +lon_0=-62 +k=0.9995000000000001 +x_0=400000 +y_0=0 +ellps=clrk80 +towgs84=195.671,332.517,274.607,0,0,0,0 +units=m +no_defs  <>
# NAD27(CGQ77) / SCoPQ zone 2 (deprecated)
<2008> +proj=tmerc +lat_0=0 +lon_0=-55.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(CGQ77) / SCoPQ zone 3
<2009> +proj=tmerc +lat_0=0 +lon_0=-58.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(CGQ77) / SCoPQ zone 4
<2010> +proj=tmerc +lat_0=0 +lon_0=-61.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(CGQ77) / SCoPQ zone 5
<2011> +proj=tmerc +lat_0=0 +lon_0=-64.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(CGQ77) / SCoPQ zone 6
<2012> +proj=tmerc +lat_0=0 +lon_0=-67.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(CGQ77) / SCoPQ zone 7
<2013> +proj=tmerc +lat_0=0 +lon_0=-70.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(CGQ77) / SCoPQ zone 8
<2014> +proj=tmerc +lat_0=0 +lon_0=-73.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(CGQ77) / SCoPQ zone 9
<2015> +proj=tmerc +lat_0=0 +lon_0=-76.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(CGQ77) / SCoPQ zone 10
<2016> +proj=tmerc +lat_0=0 +lon_0=-79.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(76) / MTM zone 8
<2017> +proj=tmerc +lat_0=0 +lon_0=-73.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(76) / MTM zone 9
<2018> +proj=tmerc +lat_0=0 +lon_0=-76.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(76) / MTM zone 10
<2019> +proj=tmerc +lat_0=0 +lon_0=-79.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(76) / MTM zone 11
<2020> +proj=tmerc +lat_0=0 +lon_0=-82.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(76) / MTM zone 12
<2021> +proj=tmerc +lat_0=0 +lon_0=-81 +k=0.9999 +x_0=304800 +y_0=0 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(76) / MTM zone 13
<2022> +proj=tmerc +lat_0=0 +lon_0=-84 +k=0.9999 +x_0=304800 +y_0=0 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(76) / MTM zone 14
<2023> +proj=tmerc +lat_0=0 +lon_0=-87 +k=0.9999 +x_0=304800 +y_0=0 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(76) / MTM zone 15
<2024> +proj=tmerc +lat_0=0 +lon_0=-90 +k=0.9999 +x_0=304800 +y_0=0 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(76) / MTM zone 16
<2025> +proj=tmerc +lat_0=0 +lon_0=-93 +k=0.9999 +x_0=304800 +y_0=0 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(76) / MTM zone 17
<2026> +proj=tmerc +lat_0=0 +lon_0=-96 +k=0.9999 +x_0=304800 +y_0=0 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(76) / UTM zone 15N
<2027> +proj=utm +zone=15 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(76) / UTM zone 16N
<2028> +proj=utm +zone=16 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(76) / UTM zone 17N
<2029> +proj=utm +zone=17 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(76) / UTM zone 18N
<2030> +proj=utm +zone=18 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(CGQ77) / UTM zone 17N
<2031> +proj=utm +zone=17 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(CGQ77) / UTM zone 18N
<2032> +proj=utm +zone=18 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(CGQ77) / UTM zone 19N
<2033> +proj=utm +zone=19 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(CGQ77) / UTM zone 20N
<2034> +proj=utm +zone=20 +ellps=clrk66 +units=m +no_defs  <>
# NAD27(CGQ77) / UTM zone 21N
<2035> +proj=utm +zone=21 +ellps=clrk66 +units=m +no_defs  <>
# NAD83(CSRS98) / New Brunswick Stereo (deprecated)
<2036> +proj=sterea +lat_0=46.5 +lon_0=-66.5 +k=0.999912 +x_0=2500000 +y_0=7500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS98) / UTM zone 19N (deprecated)
<2037> +proj=utm +zone=19 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS98) / UTM zone 20N (deprecated)
<2038> +proj=utm +zone=20 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Israel 1993 / Israeli TM Grid
<2039> +proj=tmerc +lat_0=31.73439361111111 +lon_0=35.20451694444445 +k=1.0000067 +x_0=219529.584 +y_0=626907.39 +ellps=GRS80 +towgs84=-48,55,52,0,0,0,0 +units=m +no_defs  <>
# Locodjo 1965 / UTM zone 30N
<2040> +proj=utm +zone=30 +ellps=clrk80 +towgs84=-125,53,467,0,0,0,0 +units=m +no_defs  <>
# Abidjan 1987 / UTM zone 30N
<2041> +proj=utm +zone=30 +ellps=clrk80 +towgs84=-124.76,53,466.79,0,0,0,0 +units=m +no_defs  <>
# Locodjo 1965 / UTM zone 29N
<2042> +proj=utm +zone=29 +ellps=clrk80 +towgs84=-125,53,467,0,0,0,0 +units=m +no_defs  <>
# Abidjan 1987 / UTM zone 29N
<2043> +proj=utm +zone=29 +ellps=clrk80 +towgs84=-124.76,53,466.79,0,0,0,0 +units=m +no_defs  <>
# Hanoi 1972 / Gauss-Kruger zone 18
<2044> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=18500000 +y_0=0 +ellps=krass +towgs84=-17.51,-108.32,-62.39,0,0,0,0 +units=m +no_defs  <>
# Hanoi 1972 / Gauss-Kruger zone 19
<2045> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=19500000 +y_0=0 +ellps=krass +towgs84=-17.51,-108.32,-62.39,0,0,0,0 +units=m +no_defs  <>
# Hartebeesthoek94 / Lo15
<2046> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=0 +y_0=0 +axis=wsu +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Hartebeesthoek94 / Lo17
<2047> +proj=tmerc +lat_0=0 +lon_0=17 +k=1 +x_0=0 +y_0=0 +axis=wsu +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Hartebeesthoek94 / Lo19
<2048> +proj=tmerc +lat_0=0 +lon_0=19 +k=1 +x_0=0 +y_0=0 +axis=wsu +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Hartebeesthoek94 / Lo21
<2049> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=0 +y_0=0 +axis=wsu +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Hartebeesthoek94 / Lo23
<2050> +proj=tmerc +lat_0=0 +lon_0=23 +k=1 +x_0=0 +y_0=0 +axis=wsu +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Hartebeesthoek94 / Lo25
<2051> +proj=tmerc +lat_0=0 +lon_0=25 +k=1 +x_0=0 +y_0=0 +axis=wsu +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Hartebeesthoek94 / Lo27
<2052> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=0 +y_0=0 +axis=wsu +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Hartebeesthoek94 / Lo29
<2053> +proj=tmerc +lat_0=0 +lon_0=29 +k=1 +x_0=0 +y_0=0 +axis=wsu +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Hartebeesthoek94 / Lo31
<2054> +proj=tmerc +lat_0=0 +lon_0=31 +k=1 +x_0=0 +y_0=0 +axis=wsu +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Hartebeesthoek94 / Lo33
<2055> +proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=0 +y_0=0 +axis=wsu +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# CH1903+ / LV95
<2056> +proj=somerc +lat_0=46.95240555555556 +lon_0=7.439583333333333 +k_0=1 +x_0=2600000 +y_0=1200000 +ellps=bessel +towgs84=674.374,15.056,405.346,0,0,0,0 +units=m +no_defs  <>
# Rassadiran / Nakhl e Taqi
<2057> +proj=omerc +lat_0=27.51882880555555 +lonc=52.60353916666667 +alpha=0.5716611944444444 +k=0.999895934 +x_0=658377.437 +y_0=3044969.194 +gamma=0.5716611944444444 +ellps=intl +towgs84=-133.63,-157.5,-158.62,0,0,0,0 +units=m +no_defs  <>
# ED50(ED77) / UTM zone 38N
<2058> +proj=utm +zone=38 +ellps=intl +towgs84=-117,-132,-164,0,0,0,0 +units=m +no_defs  <>
# ED50(ED77) / UTM zone 39N
<2059> +proj=utm +zone=39 +ellps=intl +towgs84=-117,-132,-164,0,0,0,0 +units=m +no_defs  <>
# ED50(ED77) / UTM zone 40N
<2060> +proj=utm +zone=40 +ellps=intl +towgs84=-117,-132,-164,0,0,0,0 +units=m +no_defs  <>
# ED50(ED77) / UTM zone 41N
<2061> +proj=utm +zone=41 +ellps=intl +towgs84=-117,-132,-164,0,0,0,0 +units=m +no_defs  <>
# Madrid 1870 (Madrid) / Spain
<2062> +proj=lcc +lat_1=40 +lat_0=40 +lon_0=0 +k_0=0.9988085293 +x_0=600000 +y_0=600000 +a=6378298.3 +b=6356657.142669561 +pm=madrid +units=m +no_defs  <>
# Dabola 1981 / UTM zone 28N (deprecated)
<2063> +proj=utm +zone=28 +a=6378249.2 +b=6356515 +towgs84=-23,259,-9,0,0,0,0 +units=m +no_defs  <>
# Dabola 1981 / UTM zone 29N (deprecated)
<2064> +proj=utm +zone=29 +a=6378249.2 +b=6356515 +towgs84=-23,259,-9,0,0,0,0 +units=m +no_defs  <>
# S-JTSK (Ferro) / Krovak
<2065> +proj=krovak +lat_0=49.5 +lon_0=42.5 +alpha=30.28813972222222 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=570.8,85.7,462.8,4.998,1.587,5.261,3.56 +pm=ferro +units=m +no_defs  <>
# Mount Dillon / Tobago Grid
<2066> +proj=cass +lat_0=11.25217861111111 +lon_0=-60.68600888888889 +x_0=37718.66159325 +y_0=36209.91512952 +a=6378293.645208759 +b=6356617.987679838 +to_meter=0.201166195164 +no_defs  <>
# Naparima 1955 / UTM zone 20N
<2067> +proj=utm +zone=20 +ellps=intl +towgs84=-0.465,372.095,171.736,0,0,0,0 +units=m +no_defs  <>
# ELD79 / Libya zone 5
<2068> +proj=tmerc +lat_0=0 +lon_0=9 +k=0.9999 +x_0=200000 +y_0=0 +ellps=intl +towgs84=-115.8543,-99.0583,-152.4616,0,0,0,0 +units=m +no_defs  <>
# ELD79 / Libya zone 6
<2069> +proj=tmerc +lat_0=0 +lon_0=11 +k=0.9999 +x_0=200000 +y_0=0 +ellps=intl +towgs84=-115.8543,-99.0583,-152.4616,0,0,0,0 +units=m +no_defs  <>
# ELD79 / Libya zone 7
<2070> +proj=tmerc +lat_0=0 +lon_0=13 +k=0.9999 +x_0=200000 +y_0=0 +ellps=intl +towgs84=-115.8543,-99.0583,-152.4616,0,0,0,0 +units=m +no_defs  <>
# ELD79 / Libya zone 8
<2071> +proj=tmerc +lat_0=0 +lon_0=15 +k=0.9999 +x_0=200000 +y_0=0 +ellps=intl +towgs84=-115.8543,-99.0583,-152.4616,0,0,0,0 +units=m +no_defs  <>
# ELD79 / Libya zone 9
<2072> +proj=tmerc +lat_0=0 +lon_0=17 +k=0.9999 +x_0=200000 +y_0=0 +ellps=intl +towgs84=-115.8543,-99.0583,-152.4616,0,0,0,0 +units=m +no_defs  <>
# ELD79 / Libya zone 10
<2073> +proj=tmerc +lat_0=0 +lon_0=19 +k=0.9999 +x_0=200000 +y_0=0 +ellps=intl +towgs84=-115.8543,-99.0583,-152.4616,0,0,0,0 +units=m +no_defs  <>
# ELD79 / Libya zone 11
<2074> +proj=tmerc +lat_0=0 +lon_0=21 +k=0.9999 +x_0=200000 +y_0=0 +ellps=intl +towgs84=-115.8543,-99.0583,-152.4616,0,0,0,0 +units=m +no_defs  <>
# ELD79 / Libya zone 12
<2075> +proj=tmerc +lat_0=0 +lon_0=23 +k=0.9999 +x_0=200000 +y_0=0 +ellps=intl +towgs84=-115.8543,-99.0583,-152.4616,0,0,0,0 +units=m +no_defs  <>
# ELD79 / Libya zone 13
<2076> +proj=tmerc +lat_0=0 +lon_0=25 +k=0.9999 +x_0=200000 +y_0=0 +ellps=intl +towgs84=-115.8543,-99.0583,-152.4616,0,0,0,0 +units=m +no_defs  <>
# ELD79 / UTM zone 32N
<2077> +proj=utm +zone=32 +ellps=intl +towgs84=-115.8543,-99.0583,-152.4616,0,0,0,0 +units=m +no_defs  <>
# ELD79 / UTM zone 33N
<2078> +proj=utm +zone=33 +ellps=intl +towgs84=-115.8543,-99.0583,-152.4616,0,0,0,0 +units=m +no_defs  <>
# ELD79 / UTM zone 34N
<2079> +proj=utm +zone=34 +ellps=intl +towgs84=-115.8543,-99.0583,-152.4616,0,0,0,0 +units=m +no_defs  <>
# ELD79 / UTM zone 35N
<2080> +proj=utm +zone=35 +ellps=intl +towgs84=-115.8543,-99.0583,-152.4616,0,0,0,0 +units=m +no_defs  <>
# Chos Malal 1914 / Argentina 2
<2081> +proj=tmerc +lat_0=-90 +lon_0=-69 +k=1 +x_0=2500000 +y_0=0 +ellps=intl +units=m +no_defs  <>
# Pampa del Castillo / Argentina 2
<2082> +proj=tmerc +lat_0=-90 +lon_0=-69 +k=1 +x_0=2500000 +y_0=0 +ellps=intl +towgs84=27.5,14,186.4,0,0,0,0 +units=m +no_defs  <>
# Hito XVIII 1963 / Argentina 2
<2083> +proj=tmerc +lat_0=-90 +lon_0=-69 +k=1 +x_0=2500000 +y_0=0 +ellps=intl +towgs84=16,196,93,0,0,0,0 +units=m +no_defs  <>
# Hito XVIII 1963 / UTM zone 19S
<2084> +proj=utm +zone=19 +south +ellps=intl +towgs84=16,196,93,0,0,0,0 +units=m +no_defs  <>
# NAD27 / Cuba Norte (deprecated)
<2085> +proj=lcc +lat_1=22.35 +lat_0=22.35 +lon_0=-81 +k_0=0.99993602 +x_0=500000 +y_0=280296.016 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / Cuba Sur (deprecated)
<2086> +proj=lcc +lat_1=20.71666666666667 +lat_0=20.71666666666667 +lon_0=-76.83333333333333 +k_0=0.99994848 +x_0=500000 +y_0=229126.939 +datum=NAD27 +units=m +no_defs  <>
# ELD79 / TM 12 NE
<2087> +proj=tmerc +lat_0=0 +lon_0=12 +k=0.9996 +x_0=500000 +y_0=0 +ellps=intl +towgs84=-115.8543,-99.0583,-152.4616,0,0,0,0 +units=m +no_defs  <>
# Carthage / TM 11 NE
<2088> +proj=tmerc +lat_0=0 +lon_0=11 +k=0.9996 +x_0=500000 +y_0=0 +datum=carthage +units=m +no_defs  <>
# Yemen NGN96 / UTM zone 38N
<2089> +proj=utm +zone=38 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Yemen NGN96 / UTM zone 39N
<2090> +proj=utm +zone=39 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# South Yemen / Gauss Kruger zone 8 (deprecated)
<2091> +proj=tmerc +lat_0=0 +lon_0=45 +k=1 +x_0=8500000 +y_0=0 +ellps=krass +towgs84=-76,-138,67,0,0,0,0 +units=m +no_defs  <>
# South Yemen / Gauss Kruger zone 9 (deprecated)
<2092> +proj=tmerc +lat_0=0 +lon_0=51 +k=1 +x_0=9500000 +y_0=0 +ellps=krass +towgs84=-76,-138,67,0,0,0,0 +units=m +no_defs  <>
# Hanoi 1972 / GK 106 NE
<2093> +proj=tmerc +lat_0=0 +lon_0=106 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=-17.51,-108.32,-62.39,0,0,0,0 +units=m +no_defs  <>
# WGS 72BE / TM 106 NE
<2094> +proj=tmerc +lat_0=0 +lon_0=106 +k=0.9996 +x_0=500000 +y_0=0 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# Bissau / UTM zone 28N
<2095> +proj=utm +zone=28 +ellps=intl +towgs84=-173,253,27,0,0,0,0 +units=m +no_defs  <>
# Korean 1985 / East Belt
<2096> +proj=tmerc +lat_0=38 +lon_0=129 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs  <>
# Korean 1985 / Central Belt
<2097> +proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs  <>
# Korean 1985 / West Belt
<2098> +proj=tmerc +lat_0=38 +lon_0=125 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs  <>
# Qatar 1948 / Qatar Grid
<2099> +proj=cass +lat_0=25.38236111111111 +lon_0=50.76138888888889 +x_0=100000 +y_0=100000 +ellps=helmert +units=m +no_defs  <>
# GGRS87 / Greek Grid
<2100> +proj=tmerc +lat_0=0 +lon_0=24 +k=0.9996 +x_0=500000 +y_0=0 +datum=GGRS87 +units=m +no_defs  <>
# Lake / Maracaibo Grid M1
<2101> +proj=lcc +lat_1=10.16666666666667 +lat_0=10.16666666666667 +lon_0=-71.60561777777777 +k_0=1 +x_0=0 +y_0=-52684.972 +ellps=intl +units=m +no_defs  <>
# Lake / Maracaibo Grid
<2102> +proj=lcc +lat_1=10.16666666666667 +lat_0=10.16666666666667 +lon_0=-71.60561777777777 +k_0=1 +x_0=200000 +y_0=147315.028 +ellps=intl +units=m +no_defs  <>
# Lake / Maracaibo Grid M3
<2103> +proj=lcc +lat_1=10.16666666666667 +lat_0=10.16666666666667 +lon_0=-71.60561777777777 +k_0=1 +x_0=500000 +y_0=447315.028 +ellps=intl +units=m +no_defs  <>
# Lake / Maracaibo La Rosa Grid
<2104> +proj=lcc +lat_1=10.16666666666667 +lat_0=10.16666666666667 +lon_0=-71.60561777777777 +k_0=1 +x_0=-17044 +y_0=-23139.97 +ellps=intl +units=m +no_defs  <>
# NZGD2000 / Mount Eden 2000
<2105> +proj=tmerc +lat_0=-36.87972222222222 +lon_0=174.7641666666667 +k=0.9999 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Bay of Plenty 2000
<2106> +proj=tmerc +lat_0=-37.76111111111111 +lon_0=176.4661111111111 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Poverty Bay 2000
<2107> +proj=tmerc +lat_0=-38.62444444444444 +lon_0=177.8855555555556 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Hawkes Bay 2000
<2108> +proj=tmerc +lat_0=-39.65083333333333 +lon_0=176.6736111111111 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Taranaki 2000
<2109> +proj=tmerc +lat_0=-39.13555555555556 +lon_0=174.2277777777778 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Tuhirangi 2000
<2110> +proj=tmerc +lat_0=-39.51222222222222 +lon_0=175.64 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Wanganui 2000
<2111> +proj=tmerc +lat_0=-40.24194444444444 +lon_0=175.4880555555555 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Wairarapa 2000
<2112> +proj=tmerc +lat_0=-40.92527777777777 +lon_0=175.6472222222222 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Wellington 2000
<2113> +proj=tmerc +lat_0=-41.3011111111111 +lon_0=174.7763888888889 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Collingwood 2000
<2114> +proj=tmerc +lat_0=-40.71472222222223 +lon_0=172.6719444444444 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Nelson 2000
<2115> +proj=tmerc +lat_0=-41.27444444444444 +lon_0=173.2991666666667 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Karamea 2000
<2116> +proj=tmerc +lat_0=-41.28972222222222 +lon_0=172.1088888888889 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Buller 2000
<2117> +proj=tmerc +lat_0=-41.81055555555555 +lon_0=171.5811111111111 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Grey 2000
<2118> +proj=tmerc +lat_0=-42.33361111111111 +lon_0=171.5497222222222 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Amuri 2000
<2119> +proj=tmerc +lat_0=-42.68888888888888 +lon_0=173.01 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Marlborough 2000
<2120> +proj=tmerc +lat_0=-41.54444444444444 +lon_0=173.8019444444444 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Hokitika 2000
<2121> +proj=tmerc +lat_0=-42.88611111111111 +lon_0=170.9797222222222 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Okarito 2000
<2122> +proj=tmerc +lat_0=-43.11 +lon_0=170.2608333333333 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Jacksons Bay 2000
<2123> +proj=tmerc +lat_0=-43.97777777777778 +lon_0=168.6061111111111 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Mount Pleasant 2000
<2124> +proj=tmerc +lat_0=-43.59055555555556 +lon_0=172.7269444444445 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Gawler 2000
<2125> +proj=tmerc +lat_0=-43.74861111111111 +lon_0=171.3605555555555 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Timaru 2000
<2126> +proj=tmerc +lat_0=-44.40194444444445 +lon_0=171.0572222222222 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Lindis Peak 2000
<2127> +proj=tmerc +lat_0=-44.735 +lon_0=169.4675 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Mount Nicholas 2000
<2128> +proj=tmerc +lat_0=-45.13277777777778 +lon_0=168.3986111111111 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Mount York 2000
<2129> +proj=tmerc +lat_0=-45.56361111111111 +lon_0=167.7386111111111 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Observation Point 2000
<2130> +proj=tmerc +lat_0=-45.81611111111111 +lon_0=170.6283333333333 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / North Taieri 2000
<2131> +proj=tmerc +lat_0=-45.86138888888889 +lon_0=170.2825 +k=0.99996 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Bluff 2000
<2132> +proj=tmerc +lat_0=-46.6 +lon_0=168.3427777777778 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / UTM zone 58S
<2133> +proj=utm +zone=58 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / UTM zone 59S
<2134> +proj=utm +zone=59 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / UTM zone 60S
<2135> +proj=utm +zone=60 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Accra / Ghana National Grid
<2136> +proj=tmerc +lat_0=4.666666666666667 +lon_0=-1 +k=0.99975 +x_0=274319.7391633579 +y_0=0 +a=6378300 +b=6356751.689189189 +towgs84=-199,32,322,0,0,0,0 +to_meter=0.3047997101815088 +no_defs  <>
# Accra / TM 1 NW
<2137> +proj=tmerc +lat_0=0 +lon_0=-1 +k=0.9996 +x_0=500000 +y_0=0 +a=6378300 +b=6356751.689189189 +towgs84=-199,32,322,0,0,0,0 +units=m +no_defs  <>
# NAD27(CGQ77) / Quebec Lambert
<2138> +proj=lcc +lat_1=60 +lat_2=46 +lat_0=44 +lon_0=-68.5 +x_0=0 +y_0=0 +ellps=clrk66 +units=m +no_defs  <>
# NAD83(CSRS98) / SCoPQ zone 2 (deprecated)
<2139> +proj=tmerc +lat_0=0 +lon_0=-55.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS98) / MTM zone 3 (deprecated)
<2140> +proj=tmerc +lat_0=0 +lon_0=-58.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS98) / MTM zone 4 (deprecated)
<2141> +proj=tmerc +lat_0=0 +lon_0=-61.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS98) / MTM zone 5 (deprecated)
<2142> +proj=tmerc +lat_0=0 +lon_0=-64.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS98) / MTM zone 6 (deprecated)
<2143> +proj=tmerc +lat_0=0 +lon_0=-67.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS98) / MTM zone 7 (deprecated)
<2144> +proj=tmerc +lat_0=0 +lon_0=-70.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS98) / MTM zone 8 (deprecated)
<2145> +proj=tmerc +lat_0=0 +lon_0=-73.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS98) / MTM zone 9 (deprecated)
<2146> +proj=tmerc +lat_0=0 +lon_0=-76.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS98) / MTM zone 10 (deprecated)
<2147> +proj=tmerc +lat_0=0 +lon_0=-79.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS98) / UTM zone 21N (deprecated)
<2148> +proj=utm +zone=21 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS98) / UTM zone 18N (deprecated)
<2149> +proj=utm +zone=18 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS98) / UTM zone 17N (deprecated)
<2150> +proj=utm +zone=17 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS98) / UTM zone 13N (deprecated)
<2151> +proj=utm +zone=13 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS98) / UTM zone 12N (deprecated)
<2152> +proj=utm +zone=12 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS98) / UTM zone 11N (deprecated)
<2153> +proj=utm +zone=11 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGF93 / Lambert-93
<2154> +proj=lcc +lat_1=49 +lat_2=44 +lat_0=46.5 +lon_0=3 +x_0=700000 +y_0=6600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# American Samoa 1962 / American Samoa Lambert (deprecated)
<2155> +proj=lcc +lat_1=-14.26666666666667 +lat_0=-14.26666666666667 +lon_0=170 +k_0=1 +x_0=152400.3048006096 +y_0=0 +ellps=clrk66 +towgs84=-115,118,426,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / UTM zone 59S (deprecated)
<2156> +proj=utm +zone=59 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# IRENET95 / Irish Transverse Mercator
<2157> +proj=tmerc +lat_0=53.5 +lon_0=-8 +k=0.99982 +x_0=600000 +y_0=750000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# IRENET95 / UTM zone 29N
<2158> +proj=utm +zone=29 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Sierra Leone 1924 / New Colony Grid
<2159> +proj=tmerc +lat_0=6.666666666666667 +lon_0=-12 +k=1 +x_0=152399.8550907544 +y_0=0 +a=6378300 +b=6356751.689189189 +to_meter=0.3047997101815088 +no_defs  <>
# Sierra Leone 1924 / New War Office Grid
<2160> +proj=tmerc +lat_0=6.666666666666667 +lon_0=-12 +k=1 +x_0=243839.7681452071 +y_0=182879.8261089053 +a=6378300 +b=6356751.689189189 +to_meter=0.3047997101815088 +no_defs  <>
# Sierra Leone 1968 / UTM zone 28N
<2161> +proj=utm +zone=28 +ellps=clrk80 +towgs84=-88,4,101,0,0,0,0 +units=m +no_defs  <>
# Sierra Leone 1968 / UTM zone 29N
<2162> +proj=utm +zone=29 +ellps=clrk80 +towgs84=-88,4,101,0,0,0,0 +units=m +no_defs  <>
# US National Atlas Equal Area
<2163> +proj=laea +lat_0=45 +lon_0=-100 +x_0=0 +y_0=0 +a=6370997 +b=6370997 +units=m +no_defs  <>
# Locodjo 1965 / TM 5 NW
<2164> +proj=tmerc +lat_0=0 +lon_0=-5 +k=0.9996 +x_0=500000 +y_0=0 +ellps=clrk80 +towgs84=-125,53,467,0,0,0,0 +units=m +no_defs  <>
# Abidjan 1987 / TM 5 NW
<2165> +proj=tmerc +lat_0=0 +lon_0=-5 +k=0.9996 +x_0=500000 +y_0=0 +ellps=clrk80 +towgs84=-124.76,53,466.79,0,0,0,0 +units=m +no_defs  <>
# Pulkovo 1942(83) / Gauss Kruger zone 3 (deprecated)
<2166> +proj=tmerc +lat_0=0 +lon_0=9 +k=1 +x_0=3500000 +y_0=0 +ellps=krass +towgs84=26,-121,-78,0,0,0,0 +units=m +no_defs  <>
# Pulkovo 1942(83) / Gauss Kruger zone 4 (deprecated)
<2167> +proj=tmerc +lat_0=0 +lon_0=12 +k=1 +x_0=4500000 +y_0=0 +ellps=krass +towgs84=26,-121,-78,0,0,0,0 +units=m +no_defs  <>
# Pulkovo 1942(83) / Gauss Kruger zone 5 (deprecated)
<2168> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=5500000 +y_0=0 +ellps=krass +towgs84=26,-121,-78,0,0,0,0 +units=m +no_defs  <>
# Luxembourg 1930 / Gauss
<2169> +proj=tmerc +lat_0=49.83333333333334 +lon_0=6.166666666666667 +k=1 +x_0=80000 +y_0=100000 +ellps=intl +towgs84=-189.6806,18.3463,-42.7695,-0.33746,-3.09264,2.53861,0.4598 +units=m +no_defs  <>
# MGI / Slovenia Grid (deprecated)
<2170> +proj=tmerc +lat_0=0 +lon_0=15 +k=0.9999 +x_0=500000 +y_0=0 +datum=hermannskogel +units=m +no_defs  <>
# Pulkovo 1942(58) / Poland zone I (deprecated)
<2171> +proj=sterea +lat_0=50.625 +lon_0=21.08333333333333 +k=0.9998 +x_0=4637000 +y_0=5647000 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# Pulkovo 1942(58) / Poland zone II
<2172> +proj=sterea +lat_0=53.00194444444445 +lon_0=21.50277777777778 +k=0.9998 +x_0=4603000 +y_0=5806000 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# Pulkovo 1942(58) / Poland zone III
<2173> +proj=sterea +lat_0=53.58333333333334 +lon_0=17.00833333333333 +k=0.9998 +x_0=3501000 +y_0=5999000 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# Pulkovo 1942(58) / Poland zone IV
<2174> +proj=sterea +lat_0=51.67083333333333 +lon_0=16.67222222222222 +k=0.9998 +x_0=3703000 +y_0=5627000 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# Pulkovo 1942(58) / Poland zone V
<2175> +proj=tmerc +lat_0=0 +lon_0=18.95833333333333 +k=0.999983 +x_0=237000 +y_0=-4700000 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# ETRS89 / Poland CS2000 zone 5
<2176> +proj=tmerc +lat_0=0 +lon_0=15 +k=0.999923 +x_0=5500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / Poland CS2000 zone 6
<2177> +proj=tmerc +lat_0=0 +lon_0=18 +k=0.999923 +x_0=6500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / Poland CS2000 zone 7
<2178> +proj=tmerc +lat_0=0 +lon_0=21 +k=0.999923 +x_0=7500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / Poland CS2000 zone 8
<2179> +proj=tmerc +lat_0=0 +lon_0=24 +k=0.999923 +x_0=8500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / Poland CS92
<2180> +proj=tmerc +lat_0=0 +lon_0=19 +k=0.9993 +x_0=500000 +y_0=-5300000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Azores Occidental 1939 / UTM zone 25N
<2188> +proj=utm +zone=25 +ellps=intl +towgs84=-425,-169,81,0,0,0,0 +units=m +no_defs  <>
# Azores Central 1948 / UTM zone 26N
<2189> +proj=utm +zone=26 +ellps=intl +towgs84=-104,167,-38,0,0,0,0 +units=m +no_defs  <>
# Azores Oriental 1940 / UTM zone 26N
<2190> +proj=utm +zone=26 +ellps=intl +towgs84=-203,141,53,0,0,0,0 +units=m +no_defs  <>
# Madeira 1936 / UTM zone 28N (deprecated)
<2191> +proj=utm +zone=28 +ellps=intl +units=m +no_defs  <>
# ED50 / France EuroLambert (deprecated)
<2192> +proj=lcc +lat_1=46.8 +lat_0=46.8 +lon_0=2.337229166666667 +k_0=0.99987742 +x_0=600000 +y_0=2200000 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / New Zealand Transverse Mercator 2000
<2193> +proj=tmerc +lat_0=0 +lon_0=173 +k=0.9996 +x_0=1600000 +y_0=10000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# American Samoa 1962 / American Samoa Lambert (deprecated)
<2194> +proj=lcc +lat_1=-14.26666666666667 +lat_0=-14.26666666666667 +lon_0=-170 +k_0=1 +x_0=152400.3048006096 +y_0=0 +ellps=clrk66 +towgs84=-115,118,426,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / UTM zone 2S
<2195> +proj=utm +zone=2 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / Kp2000 Jutland
<2196> +proj=tmerc +lat_0=0 +lon_0=9.5 +k=0.99995 +x_0=200000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / Kp2000 Zealand
<2197> +proj=tmerc +lat_0=0 +lon_0=12 +k=0.99995 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / Kp2000 Bornholm
<2198> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=900000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Albanian 1987 / Gauss Kruger zone 4 (deprecated)
<2199> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=4500000 +y_0=0 +ellps=krass +towgs84=-44.183,-0.58,-38.489,2.3867,2.7072,-3.5196,-8.2703 +units=m +no_defs  <>
# ATS77 / New Brunswick Stereographic (ATS77)
<2200> +proj=sterea +lat_0=46.5 +lon_0=-66.5 +k=0.999912 +x_0=300000 +y_0=800000 +a=6378135 +b=6356750.304921594 +units=m +no_defs  <>
# REGVEN / UTM zone 18N
<2201> +proj=utm +zone=18 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# REGVEN / UTM zone 19N
<2202> +proj=utm +zone=19 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# REGVEN / UTM zone 20N
<2203> +proj=utm +zone=20 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD27 / Tennessee
<2204> +proj=lcc +lat_1=35.25 +lat_2=36.41666666666666 +lat_0=34.66666666666666 +lon_0=-86 +x_0=609601.2192024384 +y_0=30480.06096012192 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD83 / Kentucky North
<2205> +proj=lcc +lat_1=37.96666666666667 +lat_2=38.96666666666667 +lat_0=37.5 +lon_0=-84.25 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# ED50 / 3-degree Gauss-Kruger zone 9
<2206> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=9500000 +y_0=0 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / 3-degree Gauss-Kruger zone 10
<2207> +proj=tmerc +lat_0=0 +lon_0=30 +k=1 +x_0=10500000 +y_0=0 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / 3-degree Gauss-Kruger zone 11
<2208> +proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=11500000 +y_0=0 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / 3-degree Gauss-Kruger zone 12
<2209> +proj=tmerc +lat_0=0 +lon_0=36 +k=1 +x_0=12500000 +y_0=0 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / 3-degree Gauss-Kruger zone 13
<2210> +proj=tmerc +lat_0=0 +lon_0=39 +k=1 +x_0=13500000 +y_0=0 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / 3-degree Gauss-Kruger zone 14
<2211> +proj=tmerc +lat_0=0 +lon_0=42 +k=1 +x_0=14500000 +y_0=0 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / 3-degree Gauss-Kruger zone 15
<2212> +proj=tmerc +lat_0=0 +lon_0=45 +k=1 +x_0=15500000 +y_0=0 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / TM 30 NE
<2213> +proj=tmerc +lat_0=0 +lon_0=30 +k=0.9996 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Douala 1948 / AOF west (deprecated)
<2214> +proj=tmerc +lat_0=0 +lon_0=10.5 +k=0.999 +x_0=1000000 +y_0=1000000 +ellps=intl +towgs84=-206.1,-174.7,-87.7,0,0,0,0 +units=m +no_defs  <>
# Manoca 1962 / UTM zone 32N
<2215> +proj=utm +zone=32 +a=6378249.2 +b=6356515 +towgs84=-70.9,-151.8,-41.4,0,0,0,0 +units=m +no_defs  <>
# Qornoq 1927 / UTM zone 22N
<2216> +proj=utm +zone=22 +ellps=intl +towgs84=164,138,-189,0,0,0,0 +units=m +no_defs  <>
# Qornoq 1927 / UTM zone 23N
<2217> +proj=utm +zone=23 +ellps=intl +towgs84=164,138,-189,0,0,0,0 +units=m +no_defs  <>
# Scoresbysund 1952 / Greenland zone 5 east
# Unable to translate coordinate system EPSG:2218 into PROJ.4 format.
#
# ATS77 / UTM zone 19N
<2219> +proj=utm +zone=19 +a=6378135 +b=6356750.304921594 +units=m +no_defs  <>
# ATS77 / UTM zone 20N
<2220> +proj=utm +zone=20 +a=6378135 +b=6356750.304921594 +units=m +no_defs  <>
# Scoresbysund 1952 / Greenland zone 6 east
# Unable to translate coordinate system EPSG:2221 into PROJ.4 format.
#
# NAD83 / Arizona East (ft)
<2222> +proj=tmerc +lat_0=31 +lon_0=-110.1666666666667 +k=0.9999 +x_0=213360 +y_0=0 +datum=NAD83 +units=ft +no_defs  <>
# NAD83 / Arizona Central (ft)
<2223> +proj=tmerc +lat_0=31 +lon_0=-111.9166666666667 +k=0.9999 +x_0=213360 +y_0=0 +datum=NAD83 +units=ft +no_defs  <>
# NAD83 / Arizona West (ft)
<2224> +proj=tmerc +lat_0=31 +lon_0=-113.75 +k=0.999933333 +x_0=213360 +y_0=0 +datum=NAD83 +units=ft +no_defs  <>
# NAD83 / California zone 1 (ftUS)
<2225> +proj=lcc +lat_1=41.66666666666666 +lat_2=40 +lat_0=39.33333333333334 +lon_0=-122 +x_0=2000000.0001016 +y_0=500000.0001016001 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / California zone 2 (ftUS)
<2226> +proj=lcc +lat_1=39.83333333333334 +lat_2=38.33333333333334 +lat_0=37.66666666666666 +lon_0=-122 +x_0=2000000.0001016 +y_0=500000.0001016001 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / California zone 3 (ftUS)
<2227> +proj=lcc +lat_1=38.43333333333333 +lat_2=37.06666666666667 +lat_0=36.5 +lon_0=-120.5 +x_0=2000000.0001016 +y_0=500000.0001016001 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / California zone 4 (ftUS)
<2228> +proj=lcc +lat_1=37.25 +lat_2=36 +lat_0=35.33333333333334 +lon_0=-119 +x_0=2000000.0001016 +y_0=500000.0001016001 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / California zone 5 (ftUS)
<2229> +proj=lcc +lat_1=35.46666666666667 +lat_2=34.03333333333333 +lat_0=33.5 +lon_0=-118 +x_0=2000000.0001016 +y_0=500000.0001016001 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / California zone 6 (ftUS)
<2230> +proj=lcc +lat_1=33.88333333333333 +lat_2=32.78333333333333 +lat_0=32.16666666666666 +lon_0=-116.25 +x_0=2000000.0001016 +y_0=500000.0001016001 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Colorado North (ftUS)
<2231> +proj=lcc +lat_1=40.78333333333333 +lat_2=39.71666666666667 +lat_0=39.33333333333334 +lon_0=-105.5 +x_0=914401.8288036576 +y_0=304800.6096012192 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Colorado Central (ftUS)
<2232> +proj=lcc +lat_1=39.75 +lat_2=38.45 +lat_0=37.83333333333334 +lon_0=-105.5 +x_0=914401.8288036576 +y_0=304800.6096012192 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Colorado South (ftUS)
<2233> +proj=lcc +lat_1=38.43333333333333 +lat_2=37.23333333333333 +lat_0=36.66666666666666 +lon_0=-105.5 +x_0=914401.8288036576 +y_0=304800.6096012192 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Connecticut (ftUS)
<2234> +proj=lcc +lat_1=41.86666666666667 +lat_2=41.2 +lat_0=40.83333333333334 +lon_0=-72.75 +x_0=304800.6096012192 +y_0=152400.3048006096 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Delaware (ftUS)
<2235> +proj=tmerc +lat_0=38 +lon_0=-75.41666666666667 +k=0.999995 +x_0=200000.0001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Florida East (ftUS)
<2236> +proj=tmerc +lat_0=24.33333333333333 +lon_0=-81 +k=0.999941177 +x_0=200000.0001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Florida West (ftUS)
<2237> +proj=tmerc +lat_0=24.33333333333333 +lon_0=-82 +k=0.999941177 +x_0=200000.0001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Florida North (ftUS)
<2238> +proj=lcc +lat_1=30.75 +lat_2=29.58333333333333 +lat_0=29 +lon_0=-84.5 +x_0=600000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Georgia East (ftUS)
<2239> +proj=tmerc +lat_0=30 +lon_0=-82.16666666666667 +k=0.9999 +x_0=200000.0001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Georgia West (ftUS)
<2240> +proj=tmerc +lat_0=30 +lon_0=-84.16666666666667 +k=0.9999 +x_0=699999.9998983998 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Idaho East (ftUS)
<2241> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-112.1666666666667 +k=0.9999473679999999 +x_0=200000.0001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Idaho Central (ftUS)
<2242> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-114 +k=0.9999473679999999 +x_0=500000.0001016001 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Idaho West (ftUS)
<2243> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-115.75 +k=0.999933333 +x_0=800000.0001016001 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Indiana East (ftUS) (deprecated)
<2244> +proj=tmerc +lat_0=37.5 +lon_0=-85.66666666666667 +k=0.999966667 +x_0=99999.99989839978 +y_0=249364.9987299975 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Indiana West (ftUS) (deprecated)
<2245> +proj=tmerc +lat_0=37.5 +lon_0=-87.08333333333333 +k=0.999966667 +x_0=900000 +y_0=249364.9987299975 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Kentucky North (ftUS)
<2246> +proj=lcc +lat_1=37.96666666666667 +lat_2=38.96666666666667 +lat_0=37.5 +lon_0=-84.25 +x_0=500000.0001016001 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Kentucky South (ftUS)
<2247> +proj=lcc +lat_1=37.93333333333333 +lat_2=36.73333333333333 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=500000.0001016001 +y_0=500000.0001016001 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Maryland (ftUS)
<2248> +proj=lcc +lat_1=39.45 +lat_2=38.3 +lat_0=37.66666666666666 +lon_0=-77 +x_0=399999.9998983998 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Massachusetts Mainland (ftUS)
<2249> +proj=lcc +lat_1=42.68333333333333 +lat_2=41.71666666666667 +lat_0=41 +lon_0=-71.5 +x_0=200000.0001016002 +y_0=750000 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Massachusetts Island (ftUS)
<2250> +proj=lcc +lat_1=41.48333333333333 +lat_2=41.28333333333333 +lat_0=41 +lon_0=-70.5 +x_0=500000.0001016001 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Michigan North (ft)
<2251> +proj=lcc +lat_1=47.08333333333334 +lat_2=45.48333333333333 +lat_0=44.78333333333333 +lon_0=-87 +x_0=7999999.999968001 +y_0=0 +datum=NAD83 +units=ft +no_defs  <>
# NAD83 / Michigan Central (ft)
<2252> +proj=lcc +lat_1=45.7 +lat_2=44.18333333333333 +lat_0=43.31666666666667 +lon_0=-84.36666666666666 +x_0=5999999.999976001 +y_0=0 +datum=NAD83 +units=ft +no_defs  <>
# NAD83 / Michigan South (ft)
<2253> +proj=lcc +lat_1=43.66666666666666 +lat_2=42.1 +lat_0=41.5 +lon_0=-84.36666666666666 +x_0=3999999.999984 +y_0=0 +datum=NAD83 +units=ft +no_defs  <>
# NAD83 / Mississippi East (ftUS)
<2254> +proj=tmerc +lat_0=29.5 +lon_0=-88.83333333333333 +k=0.99995 +x_0=300000.0000000001 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Mississippi West (ftUS)
<2255> +proj=tmerc +lat_0=29.5 +lon_0=-90.33333333333333 +k=0.99995 +x_0=699999.9998983998 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Montana (ft)
<2256> +proj=lcc +lat_1=49 +lat_2=45 +lat_0=44.25 +lon_0=-109.5 +x_0=599999.9999976 +y_0=0 +datum=NAD83 +units=ft +no_defs  <>
# NAD83 / New Mexico East (ftUS)
<2257> +proj=tmerc +lat_0=31 +lon_0=-104.3333333333333 +k=0.999909091 +x_0=165000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / New Mexico Central (ftUS)
<2258> +proj=tmerc +lat_0=31 +lon_0=-106.25 +k=0.9999 +x_0=500000.0001016001 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / New Mexico West (ftUS)
<2259> +proj=tmerc +lat_0=31 +lon_0=-107.8333333333333 +k=0.999916667 +x_0=830000.0001016001 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / New York East (ftUS)
<2260> +proj=tmerc +lat_0=38.83333333333334 +lon_0=-74.5 +k=0.9999 +x_0=150000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / New York Central (ftUS)
<2261> +proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=249999.9998983998 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / New York West (ftUS)
<2262> +proj=tmerc +lat_0=40 +lon_0=-78.58333333333333 +k=0.9999375 +x_0=350000.0001016001 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / New York Long Island (ftUS)
<2263> +proj=lcc +lat_1=41.03333333333333 +lat_2=40.66666666666666 +lat_0=40.16666666666666 +lon_0=-74 +x_0=300000.0000000001 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / North Carolina (ftUS)
<2264> +proj=lcc +lat_1=36.16666666666666 +lat_2=34.33333333333334 +lat_0=33.75 +lon_0=-79 +x_0=609601.2192024384 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / North Dakota North (ft)
<2265> +proj=lcc +lat_1=48.73333333333333 +lat_2=47.43333333333333 +lat_0=47 +lon_0=-100.5 +x_0=599999.9999976 +y_0=0 +datum=NAD83 +units=ft +no_defs  <>
# NAD83 / North Dakota South (ft)
<2266> +proj=lcc +lat_1=47.48333333333333 +lat_2=46.18333333333333 +lat_0=45.66666666666666 +lon_0=-100.5 +x_0=599999.9999976 +y_0=0 +datum=NAD83 +units=ft +no_defs  <>
# NAD83 / Oklahoma North (ftUS)
<2267> +proj=lcc +lat_1=36.76666666666667 +lat_2=35.56666666666667 +lat_0=35 +lon_0=-98 +x_0=600000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Oklahoma South (ftUS)
<2268> +proj=lcc +lat_1=35.23333333333333 +lat_2=33.93333333333333 +lat_0=33.33333333333334 +lon_0=-98 +x_0=600000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Oregon North (ft)
<2269> +proj=lcc +lat_1=46 +lat_2=44.33333333333334 +lat_0=43.66666666666666 +lon_0=-120.5 +x_0=2500000.0001424 +y_0=0 +datum=NAD83 +units=ft +no_defs  <>
# NAD83 / Oregon South (ft)
<2270> +proj=lcc +lat_1=44 +lat_2=42.33333333333334 +lat_0=41.66666666666666 +lon_0=-120.5 +x_0=1500000.0001464 +y_0=0 +datum=NAD83 +units=ft +no_defs  <>
# NAD83 / Pennsylvania North (ftUS)
<2271> +proj=lcc +lat_1=41.95 +lat_2=40.88333333333333 +lat_0=40.16666666666666 +lon_0=-77.75 +x_0=600000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Pennsylvania South (ftUS)
<2272> +proj=lcc +lat_1=40.96666666666667 +lat_2=39.93333333333333 +lat_0=39.33333333333334 +lon_0=-77.75 +x_0=600000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / South Carolina (ft)
<2273> +proj=lcc +lat_1=34.83333333333334 +lat_2=32.5 +lat_0=31.83333333333333 +lon_0=-81 +x_0=609600 +y_0=0 +datum=NAD83 +units=ft +no_defs  <>
# NAD83 / Tennessee (ftUS)
<2274> +proj=lcc +lat_1=36.41666666666666 +lat_2=35.25 +lat_0=34.33333333333334 +lon_0=-86 +x_0=600000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Texas North (ftUS)
<2275> +proj=lcc +lat_1=36.18333333333333 +lat_2=34.65 +lat_0=34 +lon_0=-101.5 +x_0=200000.0001016002 +y_0=999999.9998983998 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Texas North Central (ftUS)
<2276> +proj=lcc +lat_1=33.96666666666667 +lat_2=32.13333333333333 +lat_0=31.66666666666667 +lon_0=-98.5 +x_0=600000 +y_0=2000000.0001016 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Texas Central (ftUS)
<2277> +proj=lcc +lat_1=31.88333333333333 +lat_2=30.11666666666667 +lat_0=29.66666666666667 +lon_0=-100.3333333333333 +x_0=699999.9998983998 +y_0=3000000 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Texas South Central (ftUS)
<2278> +proj=lcc +lat_1=30.28333333333333 +lat_2=28.38333333333333 +lat_0=27.83333333333333 +lon_0=-99 +x_0=600000 +y_0=3999999.9998984 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Texas South (ftUS)
<2279> +proj=lcc +lat_1=27.83333333333333 +lat_2=26.16666666666667 +lat_0=25.66666666666667 +lon_0=-98.5 +x_0=300000.0000000001 +y_0=5000000.0001016 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Utah North (ft)
<2280> +proj=lcc +lat_1=41.78333333333333 +lat_2=40.71666666666667 +lat_0=40.33333333333334 +lon_0=-111.5 +x_0=500000.0001504 +y_0=999999.9999960001 +datum=NAD83 +units=ft +no_defs  <>
# NAD83 / Utah Central (ft)
<2281> +proj=lcc +lat_1=40.65 +lat_2=39.01666666666667 +lat_0=38.33333333333334 +lon_0=-111.5 +x_0=500000.0001504 +y_0=1999999.999992 +datum=NAD83 +units=ft +no_defs  <>
# NAD83 / Utah South (ft)
<2282> +proj=lcc +lat_1=38.35 +lat_2=37.21666666666667 +lat_0=36.66666666666666 +lon_0=-111.5 +x_0=500000.0001504 +y_0=2999999.999988 +datum=NAD83 +units=ft +no_defs  <>
# NAD83 / Virginia North (ftUS)
<2283> +proj=lcc +lat_1=39.2 +lat_2=38.03333333333333 +lat_0=37.66666666666666 +lon_0=-78.5 +x_0=3500000.0001016 +y_0=2000000.0001016 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Virginia South (ftUS)
<2284> +proj=lcc +lat_1=37.96666666666667 +lat_2=36.76666666666667 +lat_0=36.33333333333334 +lon_0=-78.5 +x_0=3500000.0001016 +y_0=999999.9998983998 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Washington North (ftUS)
<2285> +proj=lcc +lat_1=48.73333333333333 +lat_2=47.5 +lat_0=47 +lon_0=-120.8333333333333 +x_0=500000.0001016001 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Washington South (ftUS)
<2286> +proj=lcc +lat_1=47.33333333333334 +lat_2=45.83333333333334 +lat_0=45.33333333333334 +lon_0=-120.5 +x_0=500000.0001016001 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Wisconsin North (ftUS)
<2287> +proj=lcc +lat_1=46.76666666666667 +lat_2=45.56666666666667 +lat_0=45.16666666666666 +lon_0=-90 +x_0=600000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Wisconsin Central (ftUS)
<2288> +proj=lcc +lat_1=45.5 +lat_2=44.25 +lat_0=43.83333333333334 +lon_0=-90 +x_0=600000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Wisconsin South (ftUS)
<2289> +proj=lcc +lat_1=44.06666666666667 +lat_2=42.73333333333333 +lat_0=42 +lon_0=-90 +x_0=600000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# ATS77 / Prince Edward Isl. Stereographic (ATS77)
<2290> +proj=sterea +lat_0=47.25 +lon_0=-63 +k=0.999912 +x_0=700000 +y_0=400000 +a=6378135 +b=6356750.304921594 +units=m +no_defs  <>
# NAD83(CSRS98) / Prince Edward Isl. Stereographic (NAD83) (deprecated)
<2291> +proj=sterea +lat_0=47.25 +lon_0=-63 +k=0.999912 +x_0=400000 +y_0=800000 +a=6378135 +b=6356750.304921594 +units=m +no_defs  <>
# NAD83(CSRS98) / Prince Edward Isl. Stereographic (NAD83) (deprecated)
<2292> +proj=sterea +lat_0=47.25 +lon_0=-63 +k=0.999912 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ATS77 / MTM Nova Scotia zone 4
<2294> +proj=tmerc +lat_0=0 +lon_0=-61.5 +k=0.9999 +x_0=4500000 +y_0=0 +a=6378135 +b=6356750.304921594 +units=m +no_defs  <>
# ATS77 / MTM Nova Scotia zone 5
<2295> +proj=tmerc +lat_0=0 +lon_0=-64.5 +k=0.9999 +x_0=5500000 +y_0=0 +a=6378135 +b=6356750.304921594 +units=m +no_defs  <>
# Ammassalik 1958 / Greenland zone 7 east
# Unable to translate coordinate system EPSG:2296 into PROJ.4 format.
#
# Qornoq 1927 / Greenland zone 1 east (deprecated)
# Unable to translate coordinate system EPSG:2297 into PROJ.4 format.
#
# Qornoq 1927 / Greenland zone 2 east (deprecated)
# Unable to translate coordinate system EPSG:2298 into PROJ.4 format.
#
# Qornoq 1927 / Greenland zone 2 west
# Unable to translate coordinate system EPSG:2299 into PROJ.4 format.
#
# Qornoq 1927 / Greenland zone 3 east (deprecated)
# Unable to translate coordinate system EPSG:2300 into PROJ.4 format.
#
# Qornoq 1927 / Greenland zone 3 west
# Unable to translate coordinate system EPSG:2301 into PROJ.4 format.
#
# Qornoq 1927 / Greenland zone 4 east (deprecated)
# Unable to translate coordinate system EPSG:2302 into PROJ.4 format.
#
# Qornoq 1927 / Greenland zone 4 west
# Unable to translate coordinate system EPSG:2303 into PROJ.4 format.
#
# Qornoq 1927 / Greenland zone 5 west
# Unable to translate coordinate system EPSG:2304 into PROJ.4 format.
#
# Qornoq 1927 / Greenland zone 6 west
# Unable to translate coordinate system EPSG:2305 into PROJ.4 format.
#
# Qornoq 1927 / Greenland zone 7 west
# Unable to translate coordinate system EPSG:2306 into PROJ.4 format.
#
# Qornoq 1927 / Greenland zone 8 east
# Unable to translate coordinate system EPSG:2307 into PROJ.4 format.
#
# Batavia / TM 109 SE
<2308> +proj=tmerc +lat_0=0 +lon_0=109 +k=0.9996 +x_0=500000 +y_0=10000000 +ellps=bessel +towgs84=-377,681,-50,0,0,0,0 +units=m +no_defs  <>
# WGS 84 / TM 116 SE
<2309> +proj=tmerc +lat_0=0 +lon_0=116 +k=0.9996 +x_0=500000 +y_0=10000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / TM 132 SE
<2310> +proj=tmerc +lat_0=0 +lon_0=132 +k=0.9996 +x_0=500000 +y_0=10000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / TM 6 NE
<2311> +proj=tmerc +lat_0=0 +lon_0=6 +k=0.9996 +x_0=500000 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# Garoua / UTM zone 33N
<2312> +proj=utm +zone=33 +ellps=clrk80 +units=m +no_defs  <>
# Kousseri / UTM zone 33N
<2313> +proj=utm +zone=33 +ellps=clrk80 +units=m +no_defs  <>
# Trinidad 1903 / Trinidad Grid (ftCla)
<2314> +proj=cass +lat_0=10.44166666666667 +lon_0=-61.33333333333334 +x_0=86501.46392052001 +y_0=65379.0134283 +a=6378293.645208759 +b=6356617.987679838 +towgs84=-61.702,284.488,472.052,0,0,0,0 +to_meter=0.3047972654 +no_defs  <>
# Campo Inchauspe / UTM zone 19S
<2315> +proj=utm +zone=19 +south +ellps=intl +towgs84=-148,136,90,0,0,0,0 +units=m +no_defs  <>
# Campo Inchauspe / UTM zone 20S
<2316> +proj=utm +zone=20 +south +ellps=intl +towgs84=-148,136,90,0,0,0,0 +units=m +no_defs  <>
# PSAD56 / ICN Regional
<2317> +proj=lcc +lat_1=9 +lat_2=3 +lat_0=6 +lon_0=-66 +x_0=1000000 +y_0=1000000 +ellps=intl +towgs84=-288,175,-376,0,0,0,0 +units=m +no_defs  <>
# Ain el Abd / Aramco Lambert
<2318> +proj=lcc +lat_1=17 +lat_2=33 +lat_0=25.08951 +lon_0=48 +x_0=0 +y_0=0 +ellps=intl +towgs84=-143,-236,7,0,0,0,0 +units=m +no_defs  <>
# ED50 / TM27
<2319> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=500000 +y_0=0 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / TM30
<2320> +proj=tmerc +lat_0=0 +lon_0=30 +k=1 +x_0=500000 +y_0=0 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / TM33
<2321> +proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=500000 +y_0=0 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / TM36
<2322> +proj=tmerc +lat_0=0 +lon_0=36 +k=1 +x_0=500000 +y_0=0 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / TM39
<2323> +proj=tmerc +lat_0=0 +lon_0=39 +k=1 +x_0=500000 +y_0=0 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / TM42
<2324> +proj=tmerc +lat_0=0 +lon_0=42 +k=1 +x_0=500000 +y_0=0 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / TM45
<2325> +proj=tmerc +lat_0=0 +lon_0=45 +k=1 +x_0=500000 +y_0=0 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# Hong Kong 1980 Grid System
<2326> +proj=tmerc +lat_0=22.31213333333334 +lon_0=114.1785555555556 +k=1 +x_0=836694.05 +y_0=819069.8 +ellps=intl +towgs84=-162.619,-276.959,-161.764,0.067753,-2.243649,-1.158827,-1.094246 +units=m +no_defs  <>
# Xian 1980 / Gauss-Kruger zone 13
<2327> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=13500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / Gauss-Kruger zone 14
<2328> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=14500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / Gauss-Kruger zone 15
<2329> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=15500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / Gauss-Kruger zone 16
<2330> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=16500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / Gauss-Kruger zone 17
<2331> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=17500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / Gauss-Kruger zone 18
<2332> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=18500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / Gauss-Kruger zone 19
<2333> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=19500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / Gauss-Kruger zone 20
<2334> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=20500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / Gauss-Kruger zone 21
<2335> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=21500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / Gauss-Kruger zone 22
<2336> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=22500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / Gauss-Kruger zone 23
<2337> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=23500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / Gauss-Kruger CM 75E
<2338> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / Gauss-Kruger CM 81E
<2339> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / Gauss-Kruger CM 87E
<2340> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / Gauss-Kruger CM 93E
<2341> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / Gauss-Kruger CM 99E
<2342> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / Gauss-Kruger CM 105E
<2343> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / Gauss-Kruger CM 111E
<2344> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / Gauss-Kruger CM 117E
<2345> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / Gauss-Kruger CM 123E
<2346> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / Gauss-Kruger CM 129E
<2347> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / Gauss-Kruger CM 135E
<2348> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger zone 25
<2349> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=25500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger zone 26
<2350> +proj=tmerc +lat_0=0 +lon_0=78 +k=1 +x_0=26500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger zone 27
<2351> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=27500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger zone 28
<2352> +proj=tmerc +lat_0=0 +lon_0=84 +k=1 +x_0=28500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger zone 29
<2353> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=29500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger zone 30
<2354> +proj=tmerc +lat_0=0 +lon_0=90 +k=1 +x_0=30500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger zone 31
<2355> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=31500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger zone 32
<2356> +proj=tmerc +lat_0=0 +lon_0=96 +k=1 +x_0=32500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger zone 33
<2357> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=33500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger zone 34
<2358> +proj=tmerc +lat_0=0 +lon_0=102 +k=1 +x_0=34500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger zone 35
<2359> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=35500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger zone 36
<2360> +proj=tmerc +lat_0=0 +lon_0=108 +k=1 +x_0=36500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger zone 37
<2361> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=37500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger zone 38
<2362> +proj=tmerc +lat_0=0 +lon_0=114 +k=1 +x_0=38500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger zone 39
<2363> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=39500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger zone 40
<2364> +proj=tmerc +lat_0=0 +lon_0=120 +k=1 +x_0=40500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger zone 41
<2365> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=41500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger zone 42
<2366> +proj=tmerc +lat_0=0 +lon_0=126 +k=1 +x_0=42500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger zone 43
<2367> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=43500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger zone 44
<2368> +proj=tmerc +lat_0=0 +lon_0=132 +k=1 +x_0=44500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger zone 45
<2369> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=45500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger CM 75E
<2370> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger CM 78E
<2371> +proj=tmerc +lat_0=0 +lon_0=78 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger CM 81E
<2372> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger CM 84E
<2373> +proj=tmerc +lat_0=0 +lon_0=84 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger CM 87E
<2374> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger CM 90E
<2375> +proj=tmerc +lat_0=0 +lon_0=90 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger CM 93E
<2376> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger CM 96E
<2377> +proj=tmerc +lat_0=0 +lon_0=96 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger CM 99E
<2378> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger CM 102E
<2379> +proj=tmerc +lat_0=0 +lon_0=102 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger CM 105E
<2380> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger CM 108E
<2381> +proj=tmerc +lat_0=0 +lon_0=108 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger CM 111E
<2382> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger CM 114E
<2383> +proj=tmerc +lat_0=0 +lon_0=114 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger CM 117E
<2384> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger CM 120E
<2385> +proj=tmerc +lat_0=0 +lon_0=120 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger CM 123E
<2386> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger CM 126E
<2387> +proj=tmerc +lat_0=0 +lon_0=126 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger CM 129E
<2388> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger CM 132E
<2389> +proj=tmerc +lat_0=0 +lon_0=132 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# Xian 1980 / 3-degree Gauss-Kruger CM 135E
<2390> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs  <>
# KKJ / Finland zone 1
<2391> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=1500000 +y_0=0 +ellps=intl +towgs84=-96.062,-82.428,-121.753,4.801,0.345,-1.376,1.496 +units=m +no_defs  <>
# KKJ / Finland zone 2
<2392> +proj=tmerc +lat_0=0 +lon_0=24 +k=1 +x_0=2500000 +y_0=0 +ellps=intl +towgs84=-96.062,-82.428,-121.753,4.801,0.345,-1.376,1.496 +units=m +no_defs  <>
# KKJ / Finland Uniform Coordinate System
<2393> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=3500000 +y_0=0 +ellps=intl +towgs84=-96.062,-82.428,-121.753,4.801,0.345,-1.376,1.496 +units=m +no_defs  <>
# KKJ / Finland zone 4
<2394> +proj=tmerc +lat_0=0 +lon_0=30 +k=1 +x_0=4500000 +y_0=0 +ellps=intl +towgs84=-96.062,-82.428,-121.753,4.801,0.345,-1.376,1.496 +units=m +no_defs  <>
# South Yemen / Gauss-Kruger zone 8
<2395> +proj=tmerc +lat_0=0 +lon_0=45 +k=1 +x_0=8500000 +y_0=0 +ellps=krass +towgs84=-76,-138,67,0,0,0,0 +units=m +no_defs  <>
# South Yemen / Gauss-Kruger zone 9
<2396> +proj=tmerc +lat_0=0 +lon_0=51 +k=1 +x_0=9500000 +y_0=0 +ellps=krass +towgs84=-76,-138,67,0,0,0,0 +units=m +no_defs  <>
# Pulkovo 1942(83) / 3-degree Gauss-Kruger zone 3
<2397> +proj=tmerc +lat_0=0 +lon_0=9 +k=1 +x_0=3500000 +y_0=0 +ellps=krass +towgs84=24.9,-126.4,-93.2,-0.063,-0.247,-0.041,1.01 +units=m +no_defs  <>
# Pulkovo 1942(83) / 3-degree Gauss-Kruger zone 4
<2398> +proj=tmerc +lat_0=0 +lon_0=12 +k=1 +x_0=4500000 +y_0=0 +ellps=krass +towgs84=24.9,-126.4,-93.2,-0.063,-0.247,-0.041,1.01 +units=m +no_defs  <>
# Pulkovo 1942(83) / 3-degree Gauss-Kruger zone 5
<2399> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=5500000 +y_0=0 +ellps=krass +towgs84=24.9,-126.4,-93.2,-0.063,-0.247,-0.041,1.01 +units=m +no_defs  <>
# RT90 2.5 gon W (deprecated)
<2400> +proj=tmerc +lat_0=0 +lon_0=15.80827777777778 +k=1 +x_0=1500000 +y_0=0 +ellps=bessel +towgs84=414.1,41.3,603.1,-0.855,2.141,-7.023,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger zone 25
<2401> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=25500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger zone 26
<2402> +proj=tmerc +lat_0=0 +lon_0=78 +k=1 +x_0=26500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger zone 27
<2403> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=27500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger zone 28
<2404> +proj=tmerc +lat_0=0 +lon_0=84 +k=1 +x_0=28500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger zone 29
<2405> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=29500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger zone 30
<2406> +proj=tmerc +lat_0=0 +lon_0=90 +k=1 +x_0=30500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger zone 31
<2407> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=31500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger zone 32
<2408> +proj=tmerc +lat_0=0 +lon_0=96 +k=1 +x_0=32500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger zone 33
<2409> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=33500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger zone 34
<2410> +proj=tmerc +lat_0=0 +lon_0=102 +k=1 +x_0=34500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger zone 35
<2411> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=35500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger zone 36
<2412> +proj=tmerc +lat_0=0 +lon_0=108 +k=1 +x_0=36500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger zone 37
<2413> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=37500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger zone 38
<2414> +proj=tmerc +lat_0=0 +lon_0=114 +k=1 +x_0=38500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger zone 39
<2415> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=39500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger zone 40
<2416> +proj=tmerc +lat_0=0 +lon_0=120 +k=1 +x_0=40500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger zone 41
<2417> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=41500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger zone 42
<2418> +proj=tmerc +lat_0=0 +lon_0=126 +k=1 +x_0=42500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger zone 43
<2419> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=43500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger zone 44
<2420> +proj=tmerc +lat_0=0 +lon_0=132 +k=1 +x_0=44500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger zone 45
<2421> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=45500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger CM 75E
<2422> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger CM 78E
<2423> +proj=tmerc +lat_0=0 +lon_0=78 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger CM 81E
<2424> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger CM 84E
<2425> +proj=tmerc +lat_0=0 +lon_0=84 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger CM 87E
<2426> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger CM 90E
<2427> +proj=tmerc +lat_0=0 +lon_0=90 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger CM 93E
<2428> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger CM 96E
<2429> +proj=tmerc +lat_0=0 +lon_0=96 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger CM 99E
<2430> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger CM 102E
<2431> +proj=tmerc +lat_0=0 +lon_0=102 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger CM 105E
<2432> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger CM 108E
<2433> +proj=tmerc +lat_0=0 +lon_0=108 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger CM 111E
<2434> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger CM 114E
<2435> +proj=tmerc +lat_0=0 +lon_0=114 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger CM 117E
<2436> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger CM 120E
<2437> +proj=tmerc +lat_0=0 +lon_0=120 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger CM 123E
<2438> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger CM 126E
<2439> +proj=tmerc +lat_0=0 +lon_0=126 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger CM 129E
<2440> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger CM 132E
<2441> +proj=tmerc +lat_0=0 +lon_0=132 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / 3-degree Gauss-Kruger CM 135E
<2442> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / Japan Plane Rectangular CS I
<2443> +proj=tmerc +lat_0=33 +lon_0=129.5 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / Japan Plane Rectangular CS II
<2444> +proj=tmerc +lat_0=33 +lon_0=131 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / Japan Plane Rectangular CS III
<2445> +proj=tmerc +lat_0=36 +lon_0=132.1666666666667 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / Japan Plane Rectangular CS IV
<2446> +proj=tmerc +lat_0=33 +lon_0=133.5 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / Japan Plane Rectangular CS V
<2447> +proj=tmerc +lat_0=36 +lon_0=134.3333333333333 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / Japan Plane Rectangular CS VI
<2448> +proj=tmerc +lat_0=36 +lon_0=136 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / Japan Plane Rectangular CS VII
<2449> +proj=tmerc +lat_0=36 +lon_0=137.1666666666667 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / Japan Plane Rectangular CS VIII
<2450> +proj=tmerc +lat_0=36 +lon_0=138.5 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / Japan Plane Rectangular CS IX
<2451> +proj=tmerc +lat_0=36 +lon_0=139.8333333333333 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / Japan Plane Rectangular CS X
<2452> +proj=tmerc +lat_0=40 +lon_0=140.8333333333333 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / Japan Plane Rectangular CS XI
<2453> +proj=tmerc +lat_0=44 +lon_0=140.25 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / Japan Plane Rectangular CS XII
<2454> +proj=tmerc +lat_0=44 +lon_0=142.25 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / Japan Plane Rectangular CS XIII
<2455> +proj=tmerc +lat_0=44 +lon_0=144.25 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / Japan Plane Rectangular CS XIV
<2456> +proj=tmerc +lat_0=26 +lon_0=142 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / Japan Plane Rectangular CS XV
<2457> +proj=tmerc +lat_0=26 +lon_0=127.5 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / Japan Plane Rectangular CS XVI
<2458> +proj=tmerc +lat_0=26 +lon_0=124 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / Japan Plane Rectangular CS XVII
<2459> +proj=tmerc +lat_0=26 +lon_0=131 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / Japan Plane Rectangular CS XVIII
<2460> +proj=tmerc +lat_0=20 +lon_0=136 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / Japan Plane Rectangular CS XIX
<2461> +proj=tmerc +lat_0=26 +lon_0=154 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Albanian 1987 / Gauss-Kruger zone 4
<2462> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=4500000 +y_0=0 +ellps=krass +towgs84=-44.183,-0.58,-38.489,2.3867,2.7072,-3.5196,-8.2703 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 21E
<2463> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 27E
<2464> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 33E
<2465> +proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 39E
<2466> +proj=tmerc +lat_0=0 +lon_0=39 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 45E
<2467> +proj=tmerc +lat_0=0 +lon_0=45 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 51E
<2468> +proj=tmerc +lat_0=0 +lon_0=51 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 57E
<2469> +proj=tmerc +lat_0=0 +lon_0=57 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 63E
<2470> +proj=tmerc +lat_0=0 +lon_0=63 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 69E
<2471> +proj=tmerc +lat_0=0 +lon_0=69 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 75E
<2472> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 81E
<2473> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 87E
<2474> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 93E
<2475> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 99E
<2476> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 105E
<2477> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 111E
<2478> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 117E
<2479> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 123E
<2480> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 129E
<2481> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 135E
<2482> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 141E
<2483> +proj=tmerc +lat_0=0 +lon_0=141 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 147E
<2484> +proj=tmerc +lat_0=0 +lon_0=147 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 153E
<2485> +proj=tmerc +lat_0=0 +lon_0=153 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 159E
<2486> +proj=tmerc +lat_0=0 +lon_0=159 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 165E
<2487> +proj=tmerc +lat_0=0 +lon_0=165 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 171E
<2488> +proj=tmerc +lat_0=0 +lon_0=171 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 177E
<2489> +proj=tmerc +lat_0=0 +lon_0=177 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 177W
<2490> +proj=tmerc +lat_0=0 +lon_0=-177 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger CM 171W
<2491> +proj=tmerc +lat_0=0 +lon_0=-171 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 9E (deprecated)
<2492> +proj=tmerc +lat_0=0 +lon_0=9 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 15E (deprecated)
<2493> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 21E
<2494> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 27E
<2495> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 33E
<2496> +proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 39E
<2497> +proj=tmerc +lat_0=0 +lon_0=39 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 45E
<2498> +proj=tmerc +lat_0=0 +lon_0=45 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 51E
<2499> +proj=tmerc +lat_0=0 +lon_0=51 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 57E
<2500> +proj=tmerc +lat_0=0 +lon_0=57 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 63E
<2501> +proj=tmerc +lat_0=0 +lon_0=63 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 69E
<2502> +proj=tmerc +lat_0=0 +lon_0=69 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 75E
<2503> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 81E
<2504> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 87E
<2505> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 93E
<2506> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 99E
<2507> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 105E
<2508> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 111E
<2509> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 117E
<2510> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 123E
<2511> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 129E
<2512> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 135E
<2513> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 141E
<2514> +proj=tmerc +lat_0=0 +lon_0=141 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 147E
<2515> +proj=tmerc +lat_0=0 +lon_0=147 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 153E
<2516> +proj=tmerc +lat_0=0 +lon_0=153 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 159E
<2517> +proj=tmerc +lat_0=0 +lon_0=159 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 165E
<2518> +proj=tmerc +lat_0=0 +lon_0=165 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 171E
<2519> +proj=tmerc +lat_0=0 +lon_0=171 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 177E
<2520> +proj=tmerc +lat_0=0 +lon_0=177 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 177W
<2521> +proj=tmerc +lat_0=0 +lon_0=-177 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger CM 171W
<2522> +proj=tmerc +lat_0=0 +lon_0=-171 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 7
<2523> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=7500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 8
<2524> +proj=tmerc +lat_0=0 +lon_0=24 +k=1 +x_0=8500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 9
<2525> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=9500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 10
<2526> +proj=tmerc +lat_0=0 +lon_0=30 +k=1 +x_0=10500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 11
<2527> +proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=11500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 12
<2528> +proj=tmerc +lat_0=0 +lon_0=36 +k=1 +x_0=12500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 13
<2529> +proj=tmerc +lat_0=0 +lon_0=39 +k=1 +x_0=13500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 14
<2530> +proj=tmerc +lat_0=0 +lon_0=42 +k=1 +x_0=14500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 15
<2531> +proj=tmerc +lat_0=0 +lon_0=45 +k=1 +x_0=15500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 16
<2532> +proj=tmerc +lat_0=0 +lon_0=48 +k=1 +x_0=16500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 17
<2533> +proj=tmerc +lat_0=0 +lon_0=51 +k=1 +x_0=17500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 18
<2534> +proj=tmerc +lat_0=0 +lon_0=54 +k=1 +x_0=18500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 19
<2535> +proj=tmerc +lat_0=0 +lon_0=57 +k=1 +x_0=19500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 20
<2536> +proj=tmerc +lat_0=0 +lon_0=60 +k=1 +x_0=20500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 21
<2537> +proj=tmerc +lat_0=0 +lon_0=63 +k=1 +x_0=21500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 22
<2538> +proj=tmerc +lat_0=0 +lon_0=66 +k=1 +x_0=22500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 23
<2539> +proj=tmerc +lat_0=0 +lon_0=69 +k=1 +x_0=23500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 24
<2540> +proj=tmerc +lat_0=0 +lon_0=72 +k=1 +x_0=24500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 25
<2541> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=25500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 26
<2542> +proj=tmerc +lat_0=0 +lon_0=78 +k=1 +x_0=26500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 27
<2543> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=27500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 28
<2544> +proj=tmerc +lat_0=0 +lon_0=84 +k=1 +x_0=28500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 29
<2545> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=29500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 30
<2546> +proj=tmerc +lat_0=0 +lon_0=90 +k=1 +x_0=30500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 31
<2547> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=31500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 32
<2548> +proj=tmerc +lat_0=0 +lon_0=96 +k=1 +x_0=32500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 33
<2549> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=33500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Samboja / UTM zone 50S (deprecated)
<2550> +proj=utm +zone=50 +south +ellps=bessel +towgs84=-404.78,685.68,45.47,0,0,0,0 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 34
<2551> +proj=tmerc +lat_0=0 +lon_0=102 +k=1 +x_0=34500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 35
<2552> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=35500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 36
<2553> +proj=tmerc +lat_0=0 +lon_0=108 +k=1 +x_0=36500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 37
<2554> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=37500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 38
<2555> +proj=tmerc +lat_0=0 +lon_0=114 +k=1 +x_0=38500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 39
<2556> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=39500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 40
<2557> +proj=tmerc +lat_0=0 +lon_0=120 +k=1 +x_0=40500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 41
<2558> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=41500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 42
<2559> +proj=tmerc +lat_0=0 +lon_0=126 +k=1 +x_0=42500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 43
<2560> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=43500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 44
<2561> +proj=tmerc +lat_0=0 +lon_0=132 +k=1 +x_0=44500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 45
<2562> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=45500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 46
<2563> +proj=tmerc +lat_0=0 +lon_0=138 +k=1 +x_0=46500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 47
<2564> +proj=tmerc +lat_0=0 +lon_0=141 +k=1 +x_0=47500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 48
<2565> +proj=tmerc +lat_0=0 +lon_0=144 +k=1 +x_0=48500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 49
<2566> +proj=tmerc +lat_0=0 +lon_0=147 +k=1 +x_0=49500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 50
<2567> +proj=tmerc +lat_0=0 +lon_0=150 +k=1 +x_0=50500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 51
<2568> +proj=tmerc +lat_0=0 +lon_0=153 +k=1 +x_0=51500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 52
<2569> +proj=tmerc +lat_0=0 +lon_0=156 +k=1 +x_0=52500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 53
<2570> +proj=tmerc +lat_0=0 +lon_0=159 +k=1 +x_0=53500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 54
<2571> +proj=tmerc +lat_0=0 +lon_0=162 +k=1 +x_0=54500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 55
<2572> +proj=tmerc +lat_0=0 +lon_0=165 +k=1 +x_0=55500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 56
<2573> +proj=tmerc +lat_0=0 +lon_0=168 +k=1 +x_0=56500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 57
<2574> +proj=tmerc +lat_0=0 +lon_0=171 +k=1 +x_0=57500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 58
<2575> +proj=tmerc +lat_0=0 +lon_0=174 +k=1 +x_0=58500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 59
<2576> +proj=tmerc +lat_0=0 +lon_0=177 +k=1 +x_0=59500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 60 (deprecated)
<2577> +proj=tmerc +lat_0=0 +lon_0=180 +k=1 +x_0=60000000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 61
<2578> +proj=tmerc +lat_0=0 +lon_0=-177 +k=1 +x_0=61500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 62
<2579> +proj=tmerc +lat_0=0 +lon_0=-174 +k=1 +x_0=62500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 63
<2580> +proj=tmerc +lat_0=0 +lon_0=-171 +k=1 +x_0=63500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 64
<2581> +proj=tmerc +lat_0=0 +lon_0=-168 +k=1 +x_0=64500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 21E
<2582> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 24E
<2583> +proj=tmerc +lat_0=0 +lon_0=24 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 27E
<2584> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 30E
<2585> +proj=tmerc +lat_0=0 +lon_0=30 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 33E
<2586> +proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 36E
<2587> +proj=tmerc +lat_0=0 +lon_0=36 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 39E
<2588> +proj=tmerc +lat_0=0 +lon_0=39 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 42E
<2589> +proj=tmerc +lat_0=0 +lon_0=42 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 45E
<2590> +proj=tmerc +lat_0=0 +lon_0=45 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 48E
<2591> +proj=tmerc +lat_0=0 +lon_0=48 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 51E
<2592> +proj=tmerc +lat_0=0 +lon_0=51 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 54E
<2593> +proj=tmerc +lat_0=0 +lon_0=54 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 57E
<2594> +proj=tmerc +lat_0=0 +lon_0=57 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 60E
<2595> +proj=tmerc +lat_0=0 +lon_0=60 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 63E
<2596> +proj=tmerc +lat_0=0 +lon_0=63 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 66E
<2597> +proj=tmerc +lat_0=0 +lon_0=66 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 69E
<2598> +proj=tmerc +lat_0=0 +lon_0=69 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 72E
<2599> +proj=tmerc +lat_0=0 +lon_0=72 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Lietuvos Koordinoei Sistema 1994 (deprecated)
<2600> +proj=tmerc +lat_0=0 +lon_0=24 +k=0.9998 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 75E
<2601> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 78E
<2602> +proj=tmerc +lat_0=0 +lon_0=78 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 81E
<2603> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 84E
<2604> +proj=tmerc +lat_0=0 +lon_0=84 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 87E
<2605> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 90E
<2606> +proj=tmerc +lat_0=0 +lon_0=90 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 93E
<2607> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 96E
<2608> +proj=tmerc +lat_0=0 +lon_0=96 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 99E
<2609> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 102E
<2610> +proj=tmerc +lat_0=0 +lon_0=102 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 105E
<2611> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 108E
<2612> +proj=tmerc +lat_0=0 +lon_0=108 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 111E
<2613> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 114E
<2614> +proj=tmerc +lat_0=0 +lon_0=114 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 117E
<2615> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 120E
<2616> +proj=tmerc +lat_0=0 +lon_0=120 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 123E
<2617> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 126E
<2618> +proj=tmerc +lat_0=0 +lon_0=126 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 129E
<2619> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 132E
<2620> +proj=tmerc +lat_0=0 +lon_0=132 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 135E
<2621> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 138E
<2622> +proj=tmerc +lat_0=0 +lon_0=138 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 141E
<2623> +proj=tmerc +lat_0=0 +lon_0=141 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 144E
<2624> +proj=tmerc +lat_0=0 +lon_0=144 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 147E
<2625> +proj=tmerc +lat_0=0 +lon_0=147 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 150E
<2626> +proj=tmerc +lat_0=0 +lon_0=150 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 153E
<2627> +proj=tmerc +lat_0=0 +lon_0=153 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 156E
<2628> +proj=tmerc +lat_0=0 +lon_0=156 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 159E
<2629> +proj=tmerc +lat_0=0 +lon_0=159 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 162E
<2630> +proj=tmerc +lat_0=0 +lon_0=162 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 165E
<2631> +proj=tmerc +lat_0=0 +lon_0=165 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 168E
<2632> +proj=tmerc +lat_0=0 +lon_0=168 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 171E
<2633> +proj=tmerc +lat_0=0 +lon_0=171 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 174E
<2634> +proj=tmerc +lat_0=0 +lon_0=174 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 177E
<2635> +proj=tmerc +lat_0=0 +lon_0=177 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 180E
<2636> +proj=tmerc +lat_0=0 +lon_0=180 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 177W
<2637> +proj=tmerc +lat_0=0 +lon_0=-177 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 174W
<2638> +proj=tmerc +lat_0=0 +lon_0=-174 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 171W
<2639> +proj=tmerc +lat_0=0 +lon_0=-171 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 168W
<2640> +proj=tmerc +lat_0=0 +lon_0=-168 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 7
<2641> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=7500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 8
<2642> +proj=tmerc +lat_0=0 +lon_0=24 +k=1 +x_0=8500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 9
<2643> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=9500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 10
<2644> +proj=tmerc +lat_0=0 +lon_0=30 +k=1 +x_0=10500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 11
<2645> +proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=11500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 12
<2646> +proj=tmerc +lat_0=0 +lon_0=36 +k=1 +x_0=12500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 13
<2647> +proj=tmerc +lat_0=0 +lon_0=39 +k=1 +x_0=13500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 14
<2648> +proj=tmerc +lat_0=0 +lon_0=42 +k=1 +x_0=14500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 15
<2649> +proj=tmerc +lat_0=0 +lon_0=45 +k=1 +x_0=15500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 16
<2650> +proj=tmerc +lat_0=0 +lon_0=48 +k=1 +x_0=16500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 17
<2651> +proj=tmerc +lat_0=0 +lon_0=51 +k=1 +x_0=17500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 18
<2652> +proj=tmerc +lat_0=0 +lon_0=54 +k=1 +x_0=18500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 19
<2653> +proj=tmerc +lat_0=0 +lon_0=57 +k=1 +x_0=19500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 20
<2654> +proj=tmerc +lat_0=0 +lon_0=60 +k=1 +x_0=20500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 21
<2655> +proj=tmerc +lat_0=0 +lon_0=63 +k=1 +x_0=21500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 22
<2656> +proj=tmerc +lat_0=0 +lon_0=66 +k=1 +x_0=22500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 23
<2657> +proj=tmerc +lat_0=0 +lon_0=69 +k=1 +x_0=23500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 24
<2658> +proj=tmerc +lat_0=0 +lon_0=72 +k=1 +x_0=24500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 25
<2659> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=25500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 26
<2660> +proj=tmerc +lat_0=0 +lon_0=78 +k=1 +x_0=26500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 27
<2661> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=27500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 28
<2662> +proj=tmerc +lat_0=0 +lon_0=84 +k=1 +x_0=28500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 29
<2663> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=29500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 30
<2664> +proj=tmerc +lat_0=0 +lon_0=90 +k=1 +x_0=30500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 31
<2665> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=31500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 32
<2666> +proj=tmerc +lat_0=0 +lon_0=96 +k=1 +x_0=32500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 33
<2667> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=33500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 34
<2668> +proj=tmerc +lat_0=0 +lon_0=102 +k=1 +x_0=34500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 35
<2669> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=35500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 36
<2670> +proj=tmerc +lat_0=0 +lon_0=108 +k=1 +x_0=36500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 37
<2671> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=37500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 38
<2672> +proj=tmerc +lat_0=0 +lon_0=114 +k=1 +x_0=38500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 39
<2673> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=39500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 40
<2674> +proj=tmerc +lat_0=0 +lon_0=120 +k=1 +x_0=40500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 41
<2675> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=41500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 42
<2676> +proj=tmerc +lat_0=0 +lon_0=126 +k=1 +x_0=42500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 43
<2677> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=43500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 44
<2678> +proj=tmerc +lat_0=0 +lon_0=132 +k=1 +x_0=44500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 45
<2679> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=45500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 46
<2680> +proj=tmerc +lat_0=0 +lon_0=138 +k=1 +x_0=46500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 47
<2681> +proj=tmerc +lat_0=0 +lon_0=141 +k=1 +x_0=47500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 48
<2682> +proj=tmerc +lat_0=0 +lon_0=144 +k=1 +x_0=48500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 49
<2683> +proj=tmerc +lat_0=0 +lon_0=147 +k=1 +x_0=49500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 50
<2684> +proj=tmerc +lat_0=0 +lon_0=150 +k=1 +x_0=50500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 51
<2685> +proj=tmerc +lat_0=0 +lon_0=153 +k=1 +x_0=51500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 52
<2686> +proj=tmerc +lat_0=0 +lon_0=156 +k=1 +x_0=52500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 53
<2687> +proj=tmerc +lat_0=0 +lon_0=159 +k=1 +x_0=53500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 54
<2688> +proj=tmerc +lat_0=0 +lon_0=162 +k=1 +x_0=54500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 55
<2689> +proj=tmerc +lat_0=0 +lon_0=165 +k=1 +x_0=55500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 56
<2690> +proj=tmerc +lat_0=0 +lon_0=168 +k=1 +x_0=56500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 57
<2691> +proj=tmerc +lat_0=0 +lon_0=171 +k=1 +x_0=57500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 58
<2692> +proj=tmerc +lat_0=0 +lon_0=174 +k=1 +x_0=58500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 59
<2693> +proj=tmerc +lat_0=0 +lon_0=177 +k=1 +x_0=59500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 60 (deprecated)
<2694> +proj=tmerc +lat_0=0 +lon_0=180 +k=1 +x_0=60000000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 61
<2695> +proj=tmerc +lat_0=0 +lon_0=-177 +k=1 +x_0=61500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 62
<2696> +proj=tmerc +lat_0=0 +lon_0=-174 +k=1 +x_0=62500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 63
<2697> +proj=tmerc +lat_0=0 +lon_0=-171 +k=1 +x_0=63500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 64
<2698> +proj=tmerc +lat_0=0 +lon_0=-168 +k=1 +x_0=64500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 21E
<2699> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 24E
<2700> +proj=tmerc +lat_0=0 +lon_0=24 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 27E
<2701> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 30E
<2702> +proj=tmerc +lat_0=0 +lon_0=30 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 33E
<2703> +proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 36E
<2704> +proj=tmerc +lat_0=0 +lon_0=36 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 39E
<2705> +proj=tmerc +lat_0=0 +lon_0=39 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 42E
<2706> +proj=tmerc +lat_0=0 +lon_0=42 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 45E
<2707> +proj=tmerc +lat_0=0 +lon_0=45 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 48E
<2708> +proj=tmerc +lat_0=0 +lon_0=48 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 51E
<2709> +proj=tmerc +lat_0=0 +lon_0=51 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 54E
<2710> +proj=tmerc +lat_0=0 +lon_0=54 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 57E
<2711> +proj=tmerc +lat_0=0 +lon_0=57 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 60E
<2712> +proj=tmerc +lat_0=0 +lon_0=60 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 63E
<2713> +proj=tmerc +lat_0=0 +lon_0=63 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 66E
<2714> +proj=tmerc +lat_0=0 +lon_0=66 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 69E
<2715> +proj=tmerc +lat_0=0 +lon_0=69 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 72E
<2716> +proj=tmerc +lat_0=0 +lon_0=72 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 75E
<2717> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 78E
<2718> +proj=tmerc +lat_0=0 +lon_0=78 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 81E
<2719> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 84E
<2720> +proj=tmerc +lat_0=0 +lon_0=84 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 87E
<2721> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 90E
<2722> +proj=tmerc +lat_0=0 +lon_0=90 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 93E
<2723> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 96E
<2724> +proj=tmerc +lat_0=0 +lon_0=96 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 99E
<2725> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 102E
<2726> +proj=tmerc +lat_0=0 +lon_0=102 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 105E
<2727> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 108E
<2728> +proj=tmerc +lat_0=0 +lon_0=108 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 111E
<2729> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 114E
<2730> +proj=tmerc +lat_0=0 +lon_0=114 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 117E
<2731> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 120E
<2732> +proj=tmerc +lat_0=0 +lon_0=120 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 123E
<2733> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 126E
<2734> +proj=tmerc +lat_0=0 +lon_0=126 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 129E
<2735> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Tete / UTM zone 36S
<2736> +proj=utm +zone=36 +south +ellps=clrk66 +towgs84=-80,-100,-228,0,0,0,0 +units=m +no_defs  <>
# Tete / UTM zone 37S
<2737> +proj=utm +zone=37 +south +ellps=clrk66 +towgs84=-80,-100,-228,0,0,0,0 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 132E
<2738> +proj=tmerc +lat_0=0 +lon_0=132 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 135E
<2739> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 138E
<2740> +proj=tmerc +lat_0=0 +lon_0=138 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 141E
<2741> +proj=tmerc +lat_0=0 +lon_0=141 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 144E
<2742> +proj=tmerc +lat_0=0 +lon_0=144 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 147E
<2743> +proj=tmerc +lat_0=0 +lon_0=147 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 150E
<2744> +proj=tmerc +lat_0=0 +lon_0=150 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 153E
<2745> +proj=tmerc +lat_0=0 +lon_0=153 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 156E
<2746> +proj=tmerc +lat_0=0 +lon_0=156 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 159E
<2747> +proj=tmerc +lat_0=0 +lon_0=159 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 162E
<2748> +proj=tmerc +lat_0=0 +lon_0=162 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 165E
<2749> +proj=tmerc +lat_0=0 +lon_0=165 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 168E
<2750> +proj=tmerc +lat_0=0 +lon_0=168 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 171E
<2751> +proj=tmerc +lat_0=0 +lon_0=171 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 174E
<2752> +proj=tmerc +lat_0=0 +lon_0=174 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 177E
<2753> +proj=tmerc +lat_0=0 +lon_0=177 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 180E
<2754> +proj=tmerc +lat_0=0 +lon_0=180 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 177W
<2755> +proj=tmerc +lat_0=0 +lon_0=-177 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 174W
<2756> +proj=tmerc +lat_0=0 +lon_0=-174 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 171W
<2757> +proj=tmerc +lat_0=0 +lon_0=-171 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 168W
<2758> +proj=tmerc +lat_0=0 +lon_0=-168 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# NAD83(HARN) / Alabama East
<2759> +proj=tmerc +lat_0=30.5 +lon_0=-85.83333333333333 +k=0.99996 +x_0=200000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Alabama West
<2760> +proj=tmerc +lat_0=30 +lon_0=-87.5 +k=0.999933333 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Arizona East
<2761> +proj=tmerc +lat_0=31 +lon_0=-110.1666666666667 +k=0.9999 +x_0=213360 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Arizona Central
<2762> +proj=tmerc +lat_0=31 +lon_0=-111.9166666666667 +k=0.9999 +x_0=213360 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Arizona West
<2763> +proj=tmerc +lat_0=31 +lon_0=-113.75 +k=0.999933333 +x_0=213360 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Arkansas North
<2764> +proj=lcc +lat_1=36.23333333333333 +lat_2=34.93333333333333 +lat_0=34.33333333333334 +lon_0=-92 +x_0=400000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Arkansas South
<2765> +proj=lcc +lat_1=34.76666666666667 +lat_2=33.3 +lat_0=32.66666666666666 +lon_0=-92 +x_0=400000 +y_0=400000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / California zone 1
<2766> +proj=lcc +lat_1=41.66666666666666 +lat_2=40 +lat_0=39.33333333333334 +lon_0=-122 +x_0=2000000 +y_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / California zone 2
<2767> +proj=lcc +lat_1=39.83333333333334 +lat_2=38.33333333333334 +lat_0=37.66666666666666 +lon_0=-122 +x_0=2000000 +y_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / California zone 3
<2768> +proj=lcc +lat_1=38.43333333333333 +lat_2=37.06666666666667 +lat_0=36.5 +lon_0=-120.5 +x_0=2000000 +y_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / California zone 4
<2769> +proj=lcc +lat_1=37.25 +lat_2=36 +lat_0=35.33333333333334 +lon_0=-119 +x_0=2000000 +y_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / California zone 5
<2770> +proj=lcc +lat_1=35.46666666666667 +lat_2=34.03333333333333 +lat_0=33.5 +lon_0=-118 +x_0=2000000 +y_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / California zone 6
<2771> +proj=lcc +lat_1=33.88333333333333 +lat_2=32.78333333333333 +lat_0=32.16666666666666 +lon_0=-116.25 +x_0=2000000 +y_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Colorado North
<2772> +proj=lcc +lat_1=40.78333333333333 +lat_2=39.71666666666667 +lat_0=39.33333333333334 +lon_0=-105.5 +x_0=914401.8289 +y_0=304800.6096 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Colorado Central
<2773> +proj=lcc +lat_1=39.75 +lat_2=38.45 +lat_0=37.83333333333334 +lon_0=-105.5 +x_0=914401.8289 +y_0=304800.6096 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Colorado South
<2774> +proj=lcc +lat_1=38.43333333333333 +lat_2=37.23333333333333 +lat_0=36.66666666666666 +lon_0=-105.5 +x_0=914401.8289 +y_0=304800.6096 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Connecticut
<2775> +proj=lcc +lat_1=41.86666666666667 +lat_2=41.2 +lat_0=40.83333333333334 +lon_0=-72.75 +x_0=304800.6096 +y_0=152400.3048 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Delaware
<2776> +proj=tmerc +lat_0=38 +lon_0=-75.41666666666667 +k=0.999995 +x_0=200000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Florida East
<2777> +proj=tmerc +lat_0=24.33333333333333 +lon_0=-81 +k=0.999941177 +x_0=200000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Florida West
<2778> +proj=tmerc +lat_0=24.33333333333333 +lon_0=-82 +k=0.999941177 +x_0=200000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Florida North
<2779> +proj=lcc +lat_1=30.75 +lat_2=29.58333333333333 +lat_0=29 +lon_0=-84.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Georgia East
<2780> +proj=tmerc +lat_0=30 +lon_0=-82.16666666666667 +k=0.9999 +x_0=200000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Georgia West
<2781> +proj=tmerc +lat_0=30 +lon_0=-84.16666666666667 +k=0.9999 +x_0=700000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Hawaii zone 1
<2782> +proj=tmerc +lat_0=18.83333333333333 +lon_0=-155.5 +k=0.999966667 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Hawaii zone 2
<2783> +proj=tmerc +lat_0=20.33333333333333 +lon_0=-156.6666666666667 +k=0.999966667 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Hawaii zone 3
<2784> +proj=tmerc +lat_0=21.16666666666667 +lon_0=-158 +k=0.99999 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Hawaii zone 4
<2785> +proj=tmerc +lat_0=21.83333333333333 +lon_0=-159.5 +k=0.99999 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Hawaii zone 5
<2786> +proj=tmerc +lat_0=21.66666666666667 +lon_0=-160.1666666666667 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Idaho East
<2787> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-112.1666666666667 +k=0.9999473679999999 +x_0=200000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Idaho Central
<2788> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-114 +k=0.9999473679999999 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Idaho West
<2789> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-115.75 +k=0.999933333 +x_0=800000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Illinois East
<2790> +proj=tmerc +lat_0=36.66666666666666 +lon_0=-88.33333333333333 +k=0.9999749999999999 +x_0=300000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Illinois West
<2791> +proj=tmerc +lat_0=36.66666666666666 +lon_0=-90.16666666666667 +k=0.999941177 +x_0=700000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Indiana East
<2792> +proj=tmerc +lat_0=37.5 +lon_0=-85.66666666666667 +k=0.999966667 +x_0=100000 +y_0=250000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Indiana West
<2793> +proj=tmerc +lat_0=37.5 +lon_0=-87.08333333333333 +k=0.999966667 +x_0=900000 +y_0=250000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Iowa North
<2794> +proj=lcc +lat_1=43.26666666666667 +lat_2=42.06666666666667 +lat_0=41.5 +lon_0=-93.5 +x_0=1500000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Iowa South
<2795> +proj=lcc +lat_1=41.78333333333333 +lat_2=40.61666666666667 +lat_0=40 +lon_0=-93.5 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Kansas North
<2796> +proj=lcc +lat_1=39.78333333333333 +lat_2=38.71666666666667 +lat_0=38.33333333333334 +lon_0=-98 +x_0=400000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Kansas South
<2797> +proj=lcc +lat_1=38.56666666666667 +lat_2=37.26666666666667 +lat_0=36.66666666666666 +lon_0=-98.5 +x_0=400000 +y_0=400000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Kentucky North
<2798> +proj=lcc +lat_1=37.96666666666667 +lat_2=38.96666666666667 +lat_0=37.5 +lon_0=-84.25 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Kentucky South
<2799> +proj=lcc +lat_1=37.93333333333333 +lat_2=36.73333333333333 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=500000 +y_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Louisiana North
<2800> +proj=lcc +lat_1=32.66666666666666 +lat_2=31.16666666666667 +lat_0=30.5 +lon_0=-92.5 +x_0=1000000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Louisiana South
<2801> +proj=lcc +lat_1=30.7 +lat_2=29.3 +lat_0=28.5 +lon_0=-91.33333333333333 +x_0=1000000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Maine East
<2802> +proj=tmerc +lat_0=43.66666666666666 +lon_0=-68.5 +k=0.9999 +x_0=300000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Maine West
<2803> +proj=tmerc +lat_0=42.83333333333334 +lon_0=-70.16666666666667 +k=0.999966667 +x_0=900000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Maryland
<2804> +proj=lcc +lat_1=39.45 +lat_2=38.3 +lat_0=37.66666666666666 +lon_0=-77 +x_0=400000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Massachusetts Mainland
<2805> +proj=lcc +lat_1=42.68333333333333 +lat_2=41.71666666666667 +lat_0=41 +lon_0=-71.5 +x_0=200000 +y_0=750000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Massachusetts Island
<2806> +proj=lcc +lat_1=41.48333333333333 +lat_2=41.28333333333333 +lat_0=41 +lon_0=-70.5 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Michigan North
<2807> +proj=lcc +lat_1=47.08333333333334 +lat_2=45.48333333333333 +lat_0=44.78333333333333 +lon_0=-87 +x_0=8000000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Michigan Central
<2808> +proj=lcc +lat_1=45.7 +lat_2=44.18333333333333 +lat_0=43.31666666666667 +lon_0=-84.36666666666666 +x_0=6000000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Michigan South
<2809> +proj=lcc +lat_1=43.66666666666666 +lat_2=42.1 +lat_0=41.5 +lon_0=-84.36666666666666 +x_0=4000000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Minnesota North
<2810> +proj=lcc +lat_1=48.63333333333333 +lat_2=47.03333333333333 +lat_0=46.5 +lon_0=-93.09999999999999 +x_0=800000 +y_0=100000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Minnesota Central
<2811> +proj=lcc +lat_1=47.05 +lat_2=45.61666666666667 +lat_0=45 +lon_0=-94.25 +x_0=800000 +y_0=100000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Minnesota South
<2812> +proj=lcc +lat_1=45.21666666666667 +lat_2=43.78333333333333 +lat_0=43 +lon_0=-94 +x_0=800000 +y_0=100000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Mississippi East
<2813> +proj=tmerc +lat_0=29.5 +lon_0=-88.83333333333333 +k=0.99995 +x_0=300000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Mississippi West
<2814> +proj=tmerc +lat_0=29.5 +lon_0=-90.33333333333333 +k=0.99995 +x_0=700000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Missouri East
<2815> +proj=tmerc +lat_0=35.83333333333334 +lon_0=-90.5 +k=0.999933333 +x_0=250000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Missouri Central
<2816> +proj=tmerc +lat_0=35.83333333333334 +lon_0=-92.5 +k=0.999933333 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Missouri West
<2817> +proj=tmerc +lat_0=36.16666666666666 +lon_0=-94.5 +k=0.999941177 +x_0=850000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Montana
<2818> +proj=lcc +lat_1=49 +lat_2=45 +lat_0=44.25 +lon_0=-109.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Nebraska
<2819> +proj=lcc +lat_1=43 +lat_2=40 +lat_0=39.83333333333334 +lon_0=-100 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Nevada East
<2820> +proj=tmerc +lat_0=34.75 +lon_0=-115.5833333333333 +k=0.9999 +x_0=200000 +y_0=8000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Nevada Central
<2821> +proj=tmerc +lat_0=34.75 +lon_0=-116.6666666666667 +k=0.9999 +x_0=500000 +y_0=6000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Nevada West
<2822> +proj=tmerc +lat_0=34.75 +lon_0=-118.5833333333333 +k=0.9999 +x_0=800000 +y_0=4000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / New Hampshire
<2823> +proj=tmerc +lat_0=42.5 +lon_0=-71.66666666666667 +k=0.999966667 +x_0=300000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / New Jersey
<2824> +proj=tmerc +lat_0=38.83333333333334 +lon_0=-74.5 +k=0.9999 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / New Mexico East
<2825> +proj=tmerc +lat_0=31 +lon_0=-104.3333333333333 +k=0.999909091 +x_0=165000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / New Mexico Central
<2826> +proj=tmerc +lat_0=31 +lon_0=-106.25 +k=0.9999 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / New Mexico West
<2827> +proj=tmerc +lat_0=31 +lon_0=-107.8333333333333 +k=0.999916667 +x_0=830000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / New York East
<2828> +proj=tmerc +lat_0=38.83333333333334 +lon_0=-74.5 +k=0.9999 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / New York Central
<2829> +proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=250000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / New York West
<2830> +proj=tmerc +lat_0=40 +lon_0=-78.58333333333333 +k=0.9999375 +x_0=350000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / New York Long Island
<2831> +proj=lcc +lat_1=41.03333333333333 +lat_2=40.66666666666666 +lat_0=40.16666666666666 +lon_0=-74 +x_0=300000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / North Dakota North
<2832> +proj=lcc +lat_1=48.73333333333333 +lat_2=47.43333333333333 +lat_0=47 +lon_0=-100.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / North Dakota South
<2833> +proj=lcc +lat_1=47.48333333333333 +lat_2=46.18333333333333 +lat_0=45.66666666666666 +lon_0=-100.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Ohio North
<2834> +proj=lcc +lat_1=41.7 +lat_2=40.43333333333333 +lat_0=39.66666666666666 +lon_0=-82.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Ohio South
<2835> +proj=lcc +lat_1=40.03333333333333 +lat_2=38.73333333333333 +lat_0=38 +lon_0=-82.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Oklahoma North
<2836> +proj=lcc +lat_1=36.76666666666667 +lat_2=35.56666666666667 +lat_0=35 +lon_0=-98 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Oklahoma South
<2837> +proj=lcc +lat_1=35.23333333333333 +lat_2=33.93333333333333 +lat_0=33.33333333333334 +lon_0=-98 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Oregon North
<2838> +proj=lcc +lat_1=46 +lat_2=44.33333333333334 +lat_0=43.66666666666666 +lon_0=-120.5 +x_0=2500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Oregon South
<2839> +proj=lcc +lat_1=44 +lat_2=42.33333333333334 +lat_0=41.66666666666666 +lon_0=-120.5 +x_0=1500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Rhode Island
<2840> +proj=tmerc +lat_0=41.08333333333334 +lon_0=-71.5 +k=0.99999375 +x_0=100000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / South Dakota North
<2841> +proj=lcc +lat_1=45.68333333333333 +lat_2=44.41666666666666 +lat_0=43.83333333333334 +lon_0=-100 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / South Dakota South
<2842> +proj=lcc +lat_1=44.4 +lat_2=42.83333333333334 +lat_0=42.33333333333334 +lon_0=-100.3333333333333 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Tennessee
<2843> +proj=lcc +lat_1=36.41666666666666 +lat_2=35.25 +lat_0=34.33333333333334 +lon_0=-86 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Texas North
<2844> +proj=lcc +lat_1=36.18333333333333 +lat_2=34.65 +lat_0=34 +lon_0=-101.5 +x_0=200000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Texas North Central
<2845> +proj=lcc +lat_1=33.96666666666667 +lat_2=32.13333333333333 +lat_0=31.66666666666667 +lon_0=-98.5 +x_0=600000 +y_0=2000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Texas Central
<2846> +proj=lcc +lat_1=31.88333333333333 +lat_2=30.11666666666667 +lat_0=29.66666666666667 +lon_0=-100.3333333333333 +x_0=700000 +y_0=3000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Texas South Central
<2847> +proj=lcc +lat_1=30.28333333333333 +lat_2=28.38333333333333 +lat_0=27.83333333333333 +lon_0=-99 +x_0=600000 +y_0=4000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Texas South
<2848> +proj=lcc +lat_1=27.83333333333333 +lat_2=26.16666666666667 +lat_0=25.66666666666667 +lon_0=-98.5 +x_0=300000 +y_0=5000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Utah North
<2849> +proj=lcc +lat_1=41.78333333333333 +lat_2=40.71666666666667 +lat_0=40.33333333333334 +lon_0=-111.5 +x_0=500000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Utah Central
<2850> +proj=lcc +lat_1=40.65 +lat_2=39.01666666666667 +lat_0=38.33333333333334 +lon_0=-111.5 +x_0=500000 +y_0=2000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Utah South
<2851> +proj=lcc +lat_1=38.35 +lat_2=37.21666666666667 +lat_0=36.66666666666666 +lon_0=-111.5 +x_0=500000 +y_0=3000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Vermont
<2852> +proj=tmerc +lat_0=42.5 +lon_0=-72.5 +k=0.999964286 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Virginia North
<2853> +proj=lcc +lat_1=39.2 +lat_2=38.03333333333333 +lat_0=37.66666666666666 +lon_0=-78.5 +x_0=3500000 +y_0=2000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Virginia South
<2854> +proj=lcc +lat_1=37.96666666666667 +lat_2=36.76666666666667 +lat_0=36.33333333333334 +lon_0=-78.5 +x_0=3500000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Washington North
<2855> +proj=lcc +lat_1=48.73333333333333 +lat_2=47.5 +lat_0=47 +lon_0=-120.8333333333333 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Washington South
<2856> +proj=lcc +lat_1=47.33333333333334 +lat_2=45.83333333333334 +lat_0=45.33333333333334 +lon_0=-120.5 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / West Virginia North
<2857> +proj=lcc +lat_1=40.25 +lat_2=39 +lat_0=38.5 +lon_0=-79.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / West Virginia South
<2858> +proj=lcc +lat_1=38.88333333333333 +lat_2=37.48333333333333 +lat_0=37 +lon_0=-81 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Wisconsin North
<2859> +proj=lcc +lat_1=46.76666666666667 +lat_2=45.56666666666667 +lat_0=45.16666666666666 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Wisconsin Central
<2860> +proj=lcc +lat_1=45.5 +lat_2=44.25 +lat_0=43.83333333333334 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Wisconsin South
<2861> +proj=lcc +lat_1=44.06666666666667 +lat_2=42.73333333333333 +lat_0=42 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Wyoming East
<2862> +proj=tmerc +lat_0=40.5 +lon_0=-105.1666666666667 +k=0.9999375 +x_0=200000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Wyoming East Central
<2863> +proj=tmerc +lat_0=40.5 +lon_0=-107.3333333333333 +k=0.9999375 +x_0=400000 +y_0=100000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Wyoming West Central
<2864> +proj=tmerc +lat_0=40.5 +lon_0=-108.75 +k=0.9999375 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Wyoming West
<2865> +proj=tmerc +lat_0=40.5 +lon_0=-110.0833333333333 +k=0.9999375 +x_0=800000 +y_0=100000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Puerto Rico and Virgin Is.
<2866> +proj=lcc +lat_1=18.43333333333333 +lat_2=18.03333333333333 +lat_0=17.83333333333333 +lon_0=-66.43333333333334 +x_0=200000 +y_0=200000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Arizona East (ft)
<2867> +proj=tmerc +lat_0=31 +lon_0=-110.1666666666667 +k=0.9999 +x_0=213360 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(HARN) / Arizona Central (ft)
<2868> +proj=tmerc +lat_0=31 +lon_0=-111.9166666666667 +k=0.9999 +x_0=213360 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(HARN) / Arizona West (ft)
<2869> +proj=tmerc +lat_0=31 +lon_0=-113.75 +k=0.999933333 +x_0=213360 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(HARN) / California zone 1 (ftUS)
<2870> +proj=lcc +lat_1=41.66666666666666 +lat_2=40 +lat_0=39.33333333333334 +lon_0=-122 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / California zone 2 (ftUS)
<2871> +proj=lcc +lat_1=39.83333333333334 +lat_2=38.33333333333334 +lat_0=37.66666666666666 +lon_0=-122 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / California zone 3 (ftUS)
<2872> +proj=lcc +lat_1=38.43333333333333 +lat_2=37.06666666666667 +lat_0=36.5 +lon_0=-120.5 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / California zone 4 (ftUS)
<2873> +proj=lcc +lat_1=37.25 +lat_2=36 +lat_0=35.33333333333334 +lon_0=-119 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / California zone 5 (ftUS)
<2874> +proj=lcc +lat_1=35.46666666666667 +lat_2=34.03333333333333 +lat_0=33.5 +lon_0=-118 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / California zone 6 (ftUS)
<2875> +proj=lcc +lat_1=33.88333333333333 +lat_2=32.78333333333333 +lat_0=32.16666666666666 +lon_0=-116.25 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Colorado North (ftUS)
<2876> +proj=lcc +lat_1=40.78333333333333 +lat_2=39.71666666666667 +lat_0=39.33333333333334 +lon_0=-105.5 +x_0=914401.8288036576 +y_0=304800.6096012192 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Colorado Central (ftUS)
<2877> +proj=lcc +lat_1=39.75 +lat_2=38.45 +lat_0=37.83333333333334 +lon_0=-105.5 +x_0=914401.8288036576 +y_0=304800.6096012192 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Colorado South (ftUS)
<2878> +proj=lcc +lat_1=38.43333333333333 +lat_2=37.23333333333333 +lat_0=36.66666666666666 +lon_0=-105.5 +x_0=914401.8288036576 +y_0=304800.6096012192 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Connecticut (ftUS)
<2879> +proj=lcc +lat_1=41.86666666666667 +lat_2=41.2 +lat_0=40.83333333333334 +lon_0=-72.75 +x_0=304800.6096012192 +y_0=152400.3048006096 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Delaware (ftUS)
<2880> +proj=tmerc +lat_0=38 +lon_0=-75.41666666666667 +k=0.999995 +x_0=200000.0001016002 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Florida East (ftUS)
<2881> +proj=tmerc +lat_0=24.33333333333333 +lon_0=-81 +k=0.999941177 +x_0=200000.0001016002 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Florida West (ftUS)
<2882> +proj=tmerc +lat_0=24.33333333333333 +lon_0=-82 +k=0.999941177 +x_0=200000.0001016002 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Florida North (ftUS)
<2883> +proj=lcc +lat_1=30.75 +lat_2=29.58333333333333 +lat_0=29 +lon_0=-84.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Georgia East (ftUS)
<2884> +proj=tmerc +lat_0=30 +lon_0=-82.16666666666667 +k=0.9999 +x_0=200000.0001016002 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Georgia West (ftUS)
<2885> +proj=tmerc +lat_0=30 +lon_0=-84.16666666666667 +k=0.9999 +x_0=699999.9998983998 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Idaho East (ftUS)
<2886> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-112.1666666666667 +k=0.9999473679999999 +x_0=200000.0001016002 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Idaho Central (ftUS)
<2887> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-114 +k=0.9999473679999999 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Idaho West (ftUS)
<2888> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-115.75 +k=0.999933333 +x_0=800000.0001016001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Indiana East (ftUS) (deprecated)
<2889> +proj=tmerc +lat_0=37.5 +lon_0=-85.66666666666667 +k=0.999966667 +x_0=99999.99989839978 +y_0=249364.9987299975 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Indiana West (ftUS) (deprecated)
<2890> +proj=tmerc +lat_0=37.5 +lon_0=-87.08333333333333 +k=0.999966667 +x_0=900000 +y_0=249364.9987299975 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Kentucky North (ftUS)
<2891> +proj=lcc +lat_1=37.96666666666667 +lat_2=38.96666666666667 +lat_0=37.5 +lon_0=-84.25 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Kentucky South (ftUS)
<2892> +proj=lcc +lat_1=37.93333333333333 +lat_2=36.73333333333333 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=500000.0001016001 +y_0=500000.0001016001 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Maryland (ftUS)
<2893> +proj=lcc +lat_1=39.45 +lat_2=38.3 +lat_0=37.66666666666666 +lon_0=-77 +x_0=399999.9998983998 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Massachusetts Mainland (ftUS)
<2894> +proj=lcc +lat_1=42.68333333333333 +lat_2=41.71666666666667 +lat_0=41 +lon_0=-71.5 +x_0=200000.0001016002 +y_0=750000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Massachusetts Island (ftUS)
<2895> +proj=lcc +lat_1=41.48333333333333 +lat_2=41.28333333333333 +lat_0=41 +lon_0=-70.5 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Michigan North (ft)
<2896> +proj=lcc +lat_1=47.08333333333334 +lat_2=45.48333333333333 +lat_0=44.78333333333333 +lon_0=-87 +x_0=7999999.999968001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(HARN) / Michigan Central (ft)
<2897> +proj=lcc +lat_1=45.7 +lat_2=44.18333333333333 +lat_0=43.31666666666667 +lon_0=-84.36666666666666 +x_0=5999999.999976001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(HARN) / Michigan South (ft)
<2898> +proj=lcc +lat_1=43.66666666666666 +lat_2=42.1 +lat_0=41.5 +lon_0=-84.36666666666666 +x_0=3999999.999984 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(HARN) / Mississippi East (ftUS)
<2899> +proj=tmerc +lat_0=29.5 +lon_0=-88.83333333333333 +k=0.99995 +x_0=300000.0000000001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Mississippi West (ftUS)
<2900> +proj=tmerc +lat_0=29.5 +lon_0=-90.33333333333333 +k=0.99995 +x_0=699999.9998983998 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Montana (ft)
<2901> +proj=lcc +lat_1=49 +lat_2=45 +lat_0=44.25 +lon_0=-109.5 +x_0=599999.9999976 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(HARN) / New Mexico East (ftUS)
<2902> +proj=tmerc +lat_0=31 +lon_0=-104.3333333333333 +k=0.999909091 +x_0=165000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / New Mexico Central (ftUS)
<2903> +proj=tmerc +lat_0=31 +lon_0=-106.25 +k=0.9999 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / New Mexico West (ftUS)
<2904> +proj=tmerc +lat_0=31 +lon_0=-107.8333333333333 +k=0.999916667 +x_0=830000.0001016001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / New York East (ftUS)
<2905> +proj=tmerc +lat_0=38.83333333333334 +lon_0=-74.5 +k=0.9999 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / New York Central (ftUS)
<2906> +proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=249999.9998983998 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / New York West (ftUS)
<2907> +proj=tmerc +lat_0=40 +lon_0=-78.58333333333333 +k=0.9999375 +x_0=350000.0001016001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / New York Long Island (ftUS)
<2908> +proj=lcc +lat_1=41.03333333333333 +lat_2=40.66666666666666 +lat_0=40.16666666666666 +lon_0=-74 +x_0=300000.0000000001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / North Dakota North (ft)
<2909> +proj=lcc +lat_1=48.73333333333333 +lat_2=47.43333333333333 +lat_0=47 +lon_0=-100.5 +x_0=599999.9999976 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(HARN) / North Dakota South (ft)
<2910> +proj=lcc +lat_1=47.48333333333333 +lat_2=46.18333333333333 +lat_0=45.66666666666666 +lon_0=-100.5 +x_0=599999.9999976 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(HARN) / Oklahoma North (ftUS)
<2911> +proj=lcc +lat_1=36.76666666666667 +lat_2=35.56666666666667 +lat_0=35 +lon_0=-98 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Oklahoma South (ftUS)
<2912> +proj=lcc +lat_1=35.23333333333333 +lat_2=33.93333333333333 +lat_0=33.33333333333334 +lon_0=-98 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Oregon North (ft)
<2913> +proj=lcc +lat_1=46 +lat_2=44.33333333333334 +lat_0=43.66666666666666 +lon_0=-120.5 +x_0=2500000.0001424 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(HARN) / Oregon South (ft)
<2914> +proj=lcc +lat_1=44 +lat_2=42.33333333333334 +lat_0=41.66666666666666 +lon_0=-120.5 +x_0=1500000.0001464 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(HARN) / Tennessee (ftUS)
<2915> +proj=lcc +lat_1=36.41666666666666 +lat_2=35.25 +lat_0=34.33333333333334 +lon_0=-86 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Texas North (ftUS)
<2916> +proj=lcc +lat_1=36.18333333333333 +lat_2=34.65 +lat_0=34 +lon_0=-101.5 +x_0=200000.0001016002 +y_0=999999.9998983998 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Texas North Central (ftUS)
<2917> +proj=lcc +lat_1=33.96666666666667 +lat_2=32.13333333333333 +lat_0=31.66666666666667 +lon_0=-98.5 +x_0=600000 +y_0=2000000.0001016 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Texas Central (ftUS)
<2918> +proj=lcc +lat_1=31.88333333333333 +lat_2=30.11666666666667 +lat_0=29.66666666666667 +lon_0=-100.3333333333333 +x_0=699999.9998983998 +y_0=3000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Texas South Central (ftUS)
<2919> +proj=lcc +lat_1=30.28333333333333 +lat_2=28.38333333333333 +lat_0=27.83333333333333 +lon_0=-99 +x_0=600000 +y_0=3999999.9998984 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Texas South (ftUS)
<2920> +proj=lcc +lat_1=27.83333333333333 +lat_2=26.16666666666667 +lat_0=25.66666666666667 +lon_0=-98.5 +x_0=300000.0000000001 +y_0=5000000.0001016 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Utah North (ft)
<2921> +proj=lcc +lat_1=41.78333333333333 +lat_2=40.71666666666667 +lat_0=40.33333333333334 +lon_0=-111.5 +x_0=500000.0001504 +y_0=999999.9999960001 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(HARN) / Utah Central (ft)
<2922> +proj=lcc +lat_1=40.65 +lat_2=39.01666666666667 +lat_0=38.33333333333334 +lon_0=-111.5 +x_0=500000.0001504 +y_0=1999999.999992 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(HARN) / Utah South (ft)
<2923> +proj=lcc +lat_1=38.35 +lat_2=37.21666666666667 +lat_0=36.66666666666666 +lon_0=-111.5 +x_0=500000.0001504 +y_0=2999999.999988 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(HARN) / Virginia North (ftUS)
<2924> +proj=lcc +lat_1=39.2 +lat_2=38.03333333333333 +lat_0=37.66666666666666 +lon_0=-78.5 +x_0=3500000.0001016 +y_0=2000000.0001016 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Virginia South (ftUS)
<2925> +proj=lcc +lat_1=37.96666666666667 +lat_2=36.76666666666667 +lat_0=36.33333333333334 +lon_0=-78.5 +x_0=3500000.0001016 +y_0=999999.9998983998 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Washington North (ftUS)
<2926> +proj=lcc +lat_1=48.73333333333333 +lat_2=47.5 +lat_0=47 +lon_0=-120.8333333333333 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Washington South (ftUS)
<2927> +proj=lcc +lat_1=47.33333333333334 +lat_2=45.83333333333334 +lat_0=45.33333333333334 +lon_0=-120.5 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Wisconsin North (ftUS)
<2928> +proj=lcc +lat_1=46.76666666666667 +lat_2=45.56666666666667 +lat_0=45.16666666666666 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Wisconsin Central (ftUS)
<2929> +proj=lcc +lat_1=45.5 +lat_2=44.25 +lat_0=43.83333333333334 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Wisconsin South (ftUS)
<2930> +proj=lcc +lat_1=44.06666666666667 +lat_2=42.73333333333333 +lat_0=42 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# Beduaram / TM 13 NE
<2931> +proj=tmerc +lat_0=0 +lon_0=13 +k=0.9996 +x_0=500000 +y_0=0 +a=6378249.2 +b=6356515 +towgs84=-106,-87,188,0,0,0,0 +units=m +no_defs  <>
# QND95 / Qatar National Grid
<2932> +proj=tmerc +lat_0=24.45 +lon_0=51.21666666666667 +k=0.99999 +x_0=200000 +y_0=300000 +ellps=intl +towgs84=-119.4248,-303.65872,-11.00061,1.164298,0.174458,1.096259,3.657065 +units=m +no_defs  <>
# Segara / UTM zone 50S
<2933> +proj=utm +zone=50 +south +ellps=bessel +towgs84=-403,684,41,0,0,0,0 +units=m +no_defs  <>
# Segara (Jakarta) / NEIEZ (deprecated)
<2934> +proj=merc +lon_0=110 +k=0.997 +x_0=3900000 +y_0=900000 +ellps=bessel +towgs84=-403,684,41,0,0,0,0 +pm=jakarta +units=m +no_defs  <>
# Pulkovo 1942 / CS63 zone A1
<2935> +proj=tmerc +lat_0=0.1166666666666667 +lon_0=41.53333333333333 +k=1 +x_0=1300000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / CS63 zone A2
<2936> +proj=tmerc +lat_0=0.1166666666666667 +lon_0=44.53333333333333 +k=1 +x_0=2300000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / CS63 zone A3
<2937> +proj=tmerc +lat_0=0.1166666666666667 +lon_0=47.53333333333333 +k=1 +x_0=3300000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / CS63 zone A4
<2938> +proj=tmerc +lat_0=0.1166666666666667 +lon_0=50.53333333333333 +k=1 +x_0=4300000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / CS63 zone K2
<2939> +proj=tmerc +lat_0=0.1333333333333333 +lon_0=50.76666666666667 +k=1 +x_0=2300000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / CS63 zone K3
<2940> +proj=tmerc +lat_0=0.1333333333333333 +lon_0=53.76666666666667 +k=1 +x_0=3300000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / CS63 zone K4
<2941> +proj=tmerc +lat_0=0.1333333333333333 +lon_0=56.76666666666667 +k=1 +x_0=4300000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Porto Santo / UTM zone 28N
<2942> +proj=utm +zone=28 +ellps=intl +towgs84=-499,-249,314,0,0,0,0 +units=m +no_defs  <>
# Selvagem Grande / UTM zone 28N
<2943> +proj=utm +zone=28 +ellps=intl +towgs84=-289,-124,60,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / SCoPQ zone 2 (deprecated)
<2944> +proj=tmerc +lat_0=0 +lon_0=-55.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / MTM zone 3
<2945> +proj=tmerc +lat_0=0 +lon_0=-58.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / MTM zone 4
<2946> +proj=tmerc +lat_0=0 +lon_0=-61.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / MTM zone 5
<2947> +proj=tmerc +lat_0=0 +lon_0=-64.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / MTM zone 6
<2948> +proj=tmerc +lat_0=0 +lon_0=-67.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / MTM zone 7
<2949> +proj=tmerc +lat_0=0 +lon_0=-70.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / MTM zone 8
<2950> +proj=tmerc +lat_0=0 +lon_0=-73.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / MTM zone 9
<2951> +proj=tmerc +lat_0=0 +lon_0=-76.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / MTM zone 10
<2952> +proj=tmerc +lat_0=0 +lon_0=-79.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / New Brunswick Stereographic
<2953> +proj=sterea +lat_0=46.5 +lon_0=-66.5 +k=0.999912 +x_0=2500000 +y_0=7500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / Prince Edward Isl. Stereographic (NAD83)
<2954> +proj=sterea +lat_0=47.25 +lon_0=-63 +k=0.999912 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / UTM zone 11N
<2955> +proj=utm +zone=11 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / UTM zone 12N
<2956> +proj=utm +zone=12 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / UTM zone 13N
<2957> +proj=utm +zone=13 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / UTM zone 17N
<2958> +proj=utm +zone=17 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / UTM zone 18N
<2959> +proj=utm +zone=18 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / UTM zone 19N
<2960> +proj=utm +zone=19 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / UTM zone 20N
<2961> +proj=utm +zone=20 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / UTM zone 21N
<2962> +proj=utm +zone=21 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Lisbon 1890 (Lisbon) / Portugal Bonne
# Unable to translate coordinate system EPSG:2963 into PROJ.4 format.
#
# NAD27 / Alaska Albers
<2964> +proj=aea +lat_1=55 +lat_2=65 +lat_0=50 +lon_0=-154 +x_0=0 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD83 / Indiana East (ftUS)
<2965> +proj=tmerc +lat_0=37.5 +lon_0=-85.66666666666667 +k=0.999966667 +x_0=99999.99989839978 +y_0=249999.9998983998 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Indiana West (ftUS)
<2966> +proj=tmerc +lat_0=37.5 +lon_0=-87.08333333333333 +k=0.999966667 +x_0=900000 +y_0=249999.9998983998 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83(HARN) / Indiana East (ftUS)
<2967> +proj=tmerc +lat_0=37.5 +lon_0=-85.66666666666667 +k=0.999966667 +x_0=99999.99989839978 +y_0=249999.9998983998 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Indiana West (ftUS)
<2968> +proj=tmerc +lat_0=37.5 +lon_0=-87.08333333333333 +k=0.999966667 +x_0=900000 +y_0=249999.9998983998 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# Fort Marigot / UTM zone 20N
<2969> +proj=utm +zone=20 +ellps=intl +towgs84=137,248,-430,0,0,0,0 +units=m +no_defs  <>
# Guadeloupe 1948 / UTM zone 20N
<2970> +proj=utm +zone=20 +ellps=intl +towgs84=-467,-16,-300,0,0,0,0 +units=m +no_defs  <>
# CSG67 / UTM zone 22N
<2971> +proj=utm +zone=22 +ellps=intl +towgs84=-186,230,110,0,0,0,0 +units=m +no_defs  <>
# RGFG95 / UTM zone 22N
<2972> +proj=utm +zone=22 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Martinique 1938 / UTM zone 20N
<2973> +proj=utm +zone=20 +ellps=intl +towgs84=186,482,151,0,0,0,0 +units=m +no_defs  <>
# RGR92 / UTM zone 40S
<2975> +proj=utm +zone=40 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Tahiti 52 / UTM zone 6S
<2976> +proj=utm +zone=6 +south +ellps=intl +towgs84=162,117,154,0,0,0,0 +units=m +no_defs  <>
# Tahaa 54 / UTM zone 5S
<2977> +proj=utm +zone=5 +south +ellps=intl +towgs84=72.438,345.918,79.486,1.6045,0.8823,0.5565,1.3746 +units=m +no_defs  <>
# IGN72 Nuku Hiva / UTM zone 7S
<2978> +proj=utm +zone=7 +south +ellps=intl +towgs84=84,274,65,0,0,0,0 +units=m +no_defs  <>
# K0 1949 / UTM zone 42S (deprecated)
<2979> +proj=utm +zone=42 +south +ellps=intl +towgs84=145,-187,103,0,0,0,0 +units=m +no_defs  <>
# Combani 1950 / UTM zone 38S
<2980> +proj=utm +zone=38 +south +ellps=intl +towgs84=-382,-59,-262,0,0,0,0 +units=m +no_defs  <>
# IGN56 Lifou / UTM zone 58S
<2981> +proj=utm +zone=58 +south +ellps=intl +towgs84=335.47,222.58,-230.94,0,0,0,0 +units=m +no_defs  <>
# IGN72 Grand Terre / UTM zone 58S (deprecated)
<2982> +proj=utm +zone=58 +south +ellps=intl +towgs84=-13,-348,292,0,0,0,0 +units=m +no_defs  <>
# ST87 Ouvea / UTM zone 58S (deprecated)
<2983> +proj=utm +zone=58 +south +ellps=intl +towgs84=-122.383,-188.696,103.344,3.5107,-4.9668,-5.7047,4.4798 +units=m +no_defs  <>
# RGNC 1991 / Lambert New Caledonia (deprecated)
<2984> +proj=lcc +lat_1=-20.66666666666667 +lat_2=-22.33333333333333 +lat_0=-21.5 +lon_0=166 +x_0=400000 +y_0=300000 +ellps=intl +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Petrels 1972 / Terre Adelie Polar Stereographic
# Unable to translate coordinate system EPSG:2985 into PROJ.4 format.
#
# Perroud 1950 / Terre Adelie Polar Stereographic
# Unable to translate coordinate system EPSG:2986 into PROJ.4 format.
#
# Saint Pierre et Miquelon 1950 / UTM zone 21N
<2987> +proj=utm +zone=21 +ellps=clrk66 +towgs84=11.363,424.148,373.13,0,0,0,0 +units=m +no_defs  <>
# MOP78 / UTM zone 1S
<2988> +proj=utm +zone=1 +south +ellps=intl +towgs84=253,-132,-127,0,0,0,0 +units=m +no_defs  <>
# RRAF 1991 / UTM zone 20N (deprecated)
<2989> +proj=utm +zone=20 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Reunion 1947 / TM Reunion (deprecated)
<2990> +proj=tmerc +lat_0=-21.11666666666667 +lon_0=55.53333333333333 +k=1 +x_0=50000 +y_0=160000 +ellps=intl +towgs84=94,-948,-1262,0,0,0,0 +units=m +no_defs  <>
# NAD83 / Oregon LCC (m)
<2991> +proj=lcc +lat_1=43 +lat_2=45.5 +lat_0=41.75 +lon_0=-120.5 +x_0=400000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Oregon GIC Lambert (ft)
<2992> +proj=lcc +lat_1=43 +lat_2=45.5 +lat_0=41.75 +lon_0=-120.5 +x_0=399999.9999984 +y_0=0 +datum=NAD83 +units=ft +no_defs  <>
# NAD83(HARN) / Oregon LCC (m)
<2993> +proj=lcc +lat_1=43 +lat_2=45.5 +lat_0=41.75 +lon_0=-120.5 +x_0=400000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Oregon GIC Lambert (ft)
<2994> +proj=lcc +lat_1=43 +lat_2=45.5 +lat_0=41.75 +lon_0=-120.5 +x_0=399999.9999984 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# IGN53 Mare / UTM zone 58S
<2995> +proj=utm +zone=58 +south +ellps=intl +towgs84=287.58,177.78,-135.41,0,0,0,0 +units=m +no_defs  <>
# ST84 Ile des Pins / UTM zone 58S
<2996> +proj=utm +zone=58 +south +ellps=intl +towgs84=-13,-348,292,0,0,0,0 +units=m +no_defs  <>
# ST71 Belep / UTM zone 58S
<2997> +proj=utm +zone=58 +south +ellps=intl +towgs84=-480.26,-438.32,-643.429,16.3119,20.1721,-4.0349,-111.7002 +units=m +no_defs  <>
# NEA74 Noumea / UTM zone 58S
<2998> +proj=utm +zone=58 +south +ellps=intl +towgs84=-10.18,-350.43,291.37,0,0,0,0 +units=m +no_defs  <>
# Grand Comoros / UTM zone 38S
<2999> +proj=utm +zone=38 +south +ellps=intl +towgs84=-963,510,-359,0,0,0,0 +units=m +no_defs  <>
# Segara / NEIEZ
<3000> +proj=merc +lon_0=110 +k=0.997 +x_0=3900000 +y_0=900000 +ellps=bessel +towgs84=-403,684,41,0,0,0,0 +units=m +no_defs  <>
# Batavia / NEIEZ
<3001> +proj=merc +lon_0=110 +k=0.997 +x_0=3900000 +y_0=900000 +ellps=bessel +towgs84=-377,681,-50,0,0,0,0 +units=m +no_defs  <>
# Makassar / NEIEZ
<3002> +proj=merc +lon_0=110 +k=0.997 +x_0=3900000 +y_0=900000 +ellps=bessel +towgs84=-587.8,519.75,145.76,0,0,0,0 +units=m +no_defs  <>
# Monte Mario / Italy zone 1
<3003> +proj=tmerc +lat_0=0 +lon_0=9 +k=0.9996 +x_0=1500000 +y_0=0 +ellps=intl +towgs84=-104.1,-49.1,-9.9,0.971,-2.917,0.714,-11.68 +units=m +no_defs  <>
# Monte Mario / Italy zone 2
<3004> +proj=tmerc +lat_0=0 +lon_0=15 +k=0.9996 +x_0=2520000 +y_0=0 +ellps=intl +towgs84=-104.1,-49.1,-9.9,0.971,-2.917,0.714,-11.68 +units=m +no_defs  <>
# NAD83 / BC Albers
<3005> +proj=aea +lat_1=50 +lat_2=58.5 +lat_0=45 +lon_0=-126 +x_0=1000000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# SWEREF99 TM
<3006> +proj=utm +zone=33 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SWEREF99 12 00
<3007> +proj=tmerc +lat_0=0 +lon_0=12 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SWEREF99 13 30
<3008> +proj=tmerc +lat_0=0 +lon_0=13.5 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SWEREF99 15 00
<3009> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SWEREF99 16 30
<3010> +proj=tmerc +lat_0=0 +lon_0=16.5 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SWEREF99 18 00
<3011> +proj=tmerc +lat_0=0 +lon_0=18 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SWEREF99 14 15
<3012> +proj=tmerc +lat_0=0 +lon_0=14.25 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SWEREF99 15 45
<3013> +proj=tmerc +lat_0=0 +lon_0=15.75 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SWEREF99 17 15
<3014> +proj=tmerc +lat_0=0 +lon_0=17.25 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SWEREF99 18 45
<3015> +proj=tmerc +lat_0=0 +lon_0=18.75 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SWEREF99 20 15
<3016> +proj=tmerc +lat_0=0 +lon_0=20.25 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SWEREF99 21 45
<3017> +proj=tmerc +lat_0=0 +lon_0=21.75 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SWEREF99 23 15
<3018> +proj=tmerc +lat_0=0 +lon_0=23.25 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RT90 7.5 gon V
<3019> +proj=tmerc +lat_0=0 +lon_0=11.30827777777778 +k=1 +x_0=1500000 +y_0=0 +ellps=bessel +towgs84=414.1,41.3,603.1,-0.855,2.141,-7.023,0 +units=m +no_defs  <>
# RT90 5 gon V
<3020> +proj=tmerc +lat_0=0 +lon_0=13.55827777777778 +k=1 +x_0=1500000 +y_0=0 +ellps=bessel +towgs84=414.1,41.3,603.1,-0.855,2.141,-7.023,0 +units=m +no_defs  <>
# RT90 2.5 gon V
<3021> +proj=tmerc +lat_0=0 +lon_0=15.80827777777778 +k=1 +x_0=1500000 +y_0=0 +ellps=bessel +towgs84=414.1,41.3,603.1,-0.855,2.141,-7.023,0 +units=m +no_defs  <>
# RT90 0 gon
<3022> +proj=tmerc +lat_0=0 +lon_0=18.05827777777778 +k=1 +x_0=1500000 +y_0=0 +ellps=bessel +towgs84=414.1,41.3,603.1,-0.855,2.141,-7.023,0 +units=m +no_defs  <>
# RT90 2.5 gon O
<3023> +proj=tmerc +lat_0=0 +lon_0=20.30827777777778 +k=1 +x_0=1500000 +y_0=0 +ellps=bessel +towgs84=414.1,41.3,603.1,-0.855,2.141,-7.023,0 +units=m +no_defs  <>
# RT90 5 gon O
<3024> +proj=tmerc +lat_0=0 +lon_0=22.55827777777778 +k=1 +x_0=1500000 +y_0=0 +ellps=bessel +towgs84=414.1,41.3,603.1,-0.855,2.141,-7.023,0 +units=m +no_defs  <>
# RT38 7.5 gon V
<3025> +proj=tmerc +lat_0=0 +lon_0=11.30827777777778 +k=1 +x_0=1500000 +y_0=0 +ellps=bessel +units=m +no_defs  <>
# RT38 5 gon V
<3026> +proj=tmerc +lat_0=0 +lon_0=13.55827777777778 +k=1 +x_0=1500000 +y_0=0 +ellps=bessel +units=m +no_defs  <>
# RT38 2.5 gon V
<3027> +proj=tmerc +lat_0=0 +lon_0=15.80827777777778 +k=1 +x_0=1500000 +y_0=0 +ellps=bessel +units=m +no_defs  <>
# RT38 0 gon
<3028> +proj=tmerc +lat_0=0 +lon_0=18.05827777777778 +k=1 +x_0=1500000 +y_0=0 +ellps=bessel +units=m +no_defs  <>
# RT38 2.5 gon O
<3029> +proj=tmerc +lat_0=0 +lon_0=20.30827777777778 +k=1 +x_0=1500000 +y_0=0 +ellps=bessel +units=m +no_defs  <>
# RT38 5 gon O
<3030> +proj=tmerc +lat_0=0 +lon_0=22.55827777777778 +k=1 +x_0=1500000 +y_0=0 +ellps=bessel +units=m +no_defs  <>
# WGS 84 / Antarctic Polar Stereographic
<3031> +proj=stere +lat_0=-90 +lat_ts=-71 +lon_0=0 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Australian Antarctic Polar Stereographic
<3032> +proj=stere +lat_0=-90 +lat_ts=-71 +lon_0=70 +k=1 +x_0=6000000 +y_0=6000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Australian Antarctic Lambert
<3033> +proj=lcc +lat_1=-68.5 +lat_2=-74.5 +lat_0=-50 +lon_0=70 +x_0=6000000 +y_0=6000000 +datum=WGS84 +units=m +no_defs  <>
# ETRS89 / LCC Europe
<3034> +proj=lcc +lat_1=35 +lat_2=65 +lat_0=52 +lon_0=10 +x_0=4000000 +y_0=2800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / LAEA Europe
<3035> +proj=laea +lat_0=52 +lon_0=10 +x_0=4321000 +y_0=3210000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Moznet / UTM zone 36S
<3036> +proj=utm +zone=36 +south +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Moznet / UTM zone 37S
<3037> +proj=utm +zone=37 +south +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / TM26 (deprecated)
<3038> +proj=utm +zone=26 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / TM27 (deprecated)
<3039> +proj=utm +zone=27 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 28N (N-E)
<3040> +proj=utm +zone=28 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 29N (N-E)
<3041> +proj=utm +zone=29 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 30N (N-E)
<3042> +proj=utm +zone=30 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 31N (N-E)
<3043> +proj=utm +zone=31 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 32N (N-E)
<3044> +proj=utm +zone=32 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 33N (N-E)
<3045> +proj=utm +zone=33 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 34N (N-E)
<3046> +proj=utm +zone=34 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 35N (N-E)
<3047> +proj=utm +zone=35 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 36N (N-E)
<3048> +proj=utm +zone=36 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 37N (N-E)
<3049> +proj=utm +zone=37 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / TM38 (deprecated)
<3050> +proj=utm +zone=38 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / TM39 (deprecated)
<3051> +proj=utm +zone=39 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Reykjavik 1900 / Lambert 1900
# Unable to translate coordinate system EPSG:3052 into PROJ.4 format.
#
# Hjorsey 1955 / Lambert 1955
# Unable to translate coordinate system EPSG:3053 into PROJ.4 format.
#
# Hjorsey 1955 / UTM zone 26N
<3054> +proj=utm +zone=26 +ellps=intl +towgs84=-73,47,-83,0,0,0,0 +units=m +no_defs  <>
# Hjorsey 1955 / UTM zone 27N
<3055> +proj=utm +zone=27 +ellps=intl +towgs84=-73,47,-83,0,0,0,0 +units=m +no_defs  <>
# Hjorsey 1955 / UTM zone 28N
<3056> +proj=utm +zone=28 +ellps=intl +towgs84=-73,47,-83,0,0,0,0 +units=m +no_defs  <>
# ISN93 / Lambert 1993
<3057> +proj=lcc +lat_1=64.25 +lat_2=65.75 +lat_0=65 +lon_0=-19 +x_0=500000 +y_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Helle 1954 / Jan Mayen Grid
<3058> +proj=tmerc +lat_0=0 +lon_0=-8.5 +k=1 +x_0=50000 +y_0=-7800000 +ellps=intl +towgs84=982.6087,552.753,-540.873,6.6816266,-31.6114924,-19.84816,16.805 +units=m +no_defs  <>
# LKS92 / Latvia TM
<3059> +proj=tmerc +lat_0=0 +lon_0=24 +k=0.9996 +x_0=500000 +y_0=-6000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# IGN72 Grande Terre / UTM zone 58S
<3060> +proj=utm +zone=58 +south +ellps=intl +towgs84=-11.64,-348.6,291.98,0,0,0,0 +units=m +no_defs  <>
# Porto Santo 1995 / UTM zone 28N
<3061> +proj=utm +zone=28 +ellps=intl +towgs84=-502.862,-247.438,312.724,0,0,0,0 +units=m +no_defs  <>
# Azores Oriental 1995 / UTM zone 26N
<3062> +proj=utm +zone=26 +ellps=intl +towgs84=-204.619,140.176,55.226,0,0,0,0 +units=m +no_defs  <>
# Azores Central 1995 / UTM zone 26N
<3063> +proj=utm +zone=26 +ellps=intl +towgs84=-106.226,166.366,-37.893,0,0,0,0 +units=m +no_defs  <>
# IGM95 / UTM zone 32N
<3064> +proj=utm +zone=32 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# IGM95 / UTM zone 33N
<3065> +proj=utm +zone=33 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ED50 / Jordan TM
<3066> +proj=tmerc +lat_0=0 +lon_0=37 +k=0.9998 +x_0=500000 +y_0=-3000000 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / TM35FIN(E,N)
<3067> +proj=utm +zone=35 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DHDN / Soldner Berlin
<3068> +proj=cass +lat_0=52.41864827777778 +lon_0=13.62720366666667 +x_0=40000 +y_0=10000 +datum=potsdam +units=m +no_defs  <>
# NAD27 / Wisconsin Transverse Mercator
<3069> +proj=tmerc +lat_0=0 +lon_0=-90 +k=0.9996 +x_0=500000 +y_0=-4500000 +datum=NAD27 +units=m +no_defs  <>
# NAD83 / Wisconsin Transverse Mercator
<3070> +proj=tmerc +lat_0=0 +lon_0=-90 +k=0.9996 +x_0=520000 +y_0=-4480000 +datum=NAD83 +units=m +no_defs  <>
# NAD83(HARN) / Wisconsin Transverse Mercator
<3071> +proj=tmerc +lat_0=0 +lon_0=-90 +k=0.9996 +x_0=520000 +y_0=-4480000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83 / Maine CS2000 East
<3072> +proj=tmerc +lat_0=43.83333333333334 +lon_0=-67.875 +k=0.99998 +x_0=700000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Maine CS2000 Central (deprecated)
<3073> +proj=tmerc +lat_0=43 +lon_0=-69.125 +k=0.99998 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Maine CS2000 West
<3074> +proj=tmerc +lat_0=42.83333333333334 +lon_0=-70.375 +k=0.99998 +x_0=300000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83(HARN) / Maine CS2000 East
<3075> +proj=tmerc +lat_0=43.83333333333334 +lon_0=-67.875 +k=0.99998 +x_0=700000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Maine CS2000 Central (deprecated)
<3076> +proj=tmerc +lat_0=43 +lon_0=-69.125 +k=0.99998 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Maine CS2000 West
<3077> +proj=tmerc +lat_0=42.83333333333334 +lon_0=-70.375 +k=0.99998 +x_0=300000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83 / Michigan Oblique Mercator
<3078> +proj=omerc +lat_0=45.30916666666666 +lonc=-86 +alpha=337.25556 +k=0.9996 +x_0=2546731.496 +y_0=-4354009.816 +no_uoff +gamma=337.25556 +datum=NAD83 +units=m +no_defs  <>
# NAD83(HARN) / Michigan Oblique Mercator
<3079> +proj=omerc +lat_0=45.30916666666666 +lonc=-86 +alpha=337.25556 +k=0.9996 +x_0=2546731.496 +y_0=-4354009.816 +no_uoff +gamma=337.25556 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD27 / Shackleford
<3080> +proj=lcc +lat_1=27.41666666666667 +lat_2=34.91666666666666 +lat_0=31.16666666666667 +lon_0=-100 +x_0=914400 +y_0=914400 +datum=NAD27 +units=ft +no_defs  <>
# NAD83 / Texas State Mapping System
<3081> +proj=lcc +lat_1=27.41666666666667 +lat_2=34.91666666666666 +lat_0=31.16666666666667 +lon_0=-100 +x_0=1000000 +y_0=1000000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Texas Centric Lambert Conformal
<3082> +proj=lcc +lat_1=27.5 +lat_2=35 +lat_0=18 +lon_0=-100 +x_0=1500000 +y_0=5000000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Texas Centric Albers Equal Area
<3083> +proj=aea +lat_1=27.5 +lat_2=35 +lat_0=18 +lon_0=-100 +x_0=1500000 +y_0=6000000 +datum=NAD83 +units=m +no_defs  <>
# NAD83(HARN) / Texas Centric Lambert Conformal
<3084> +proj=lcc +lat_1=27.5 +lat_2=35 +lat_0=18 +lon_0=-100 +x_0=1500000 +y_0=5000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Texas Centric Albers Equal Area
<3085> +proj=aea +lat_1=27.5 +lat_2=35 +lat_0=18 +lon_0=-100 +x_0=1500000 +y_0=6000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83 / Florida GDL Albers
<3086> +proj=aea +lat_1=24 +lat_2=31.5 +lat_0=24 +lon_0=-84 +x_0=400000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83(HARN) / Florida GDL Albers
<3087> +proj=aea +lat_1=24 +lat_2=31.5 +lat_0=24 +lon_0=-84 +x_0=400000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83 / Kentucky Single Zone
<3088> +proj=lcc +lat_1=37.08333333333334 +lat_2=38.66666666666666 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=1500000 +y_0=1000000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Kentucky Single Zone (ftUS)
<3089> +proj=lcc +lat_1=37.08333333333334 +lat_2=38.66666666666666 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=1500000 +y_0=999999.9998983998 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83(HARN) / Kentucky Single Zone
<3090> +proj=lcc +lat_1=37.08333333333334 +lat_2=38.66666666666666 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=1500000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Kentucky Single Zone (ftUS)
<3091> +proj=lcc +lat_1=37.08333333333334 +lat_2=38.66666666666666 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=1500000 +y_0=999999.9998983998 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# Tokyo / UTM zone 51N
<3092> +proj=utm +zone=51 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Tokyo / UTM zone 52N
<3093> +proj=utm +zone=52 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Tokyo / UTM zone 53N
<3094> +proj=utm +zone=53 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Tokyo / UTM zone 54N
<3095> +proj=utm +zone=54 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Tokyo / UTM zone 55N
<3096> +proj=utm +zone=55 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / UTM zone 51N
<3097> +proj=utm +zone=51 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / UTM zone 52N
<3098> +proj=utm +zone=52 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / UTM zone 53N
<3099> +proj=utm +zone=53 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / UTM zone 54N
<3100> +proj=utm +zone=54 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JGD2000 / UTM zone 55N
<3101> +proj=utm +zone=55 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# American Samoa 1962 / American Samoa Lambert
<3102> +proj=lcc +lat_1=-14.26666666666667 +lat_0=-14.26666666666667 +lon_0=-170 +k_0=1 +x_0=152400.3048006096 +y_0=95169.31165862332 +ellps=clrk66 +towgs84=-115,118,426,0,0,0,0 +units=us-ft +no_defs  <>
# Mauritania 1999 / UTM zone 28N (deprecated)
<3103> +proj=utm +zone=28 +ellps=clrk80 +units=m +no_defs  <>
# Mauritania 1999 / UTM zone 29N (deprecated)
<3104> +proj=utm +zone=29 +ellps=clrk80 +units=m +no_defs  <>
# Mauritania 1999 / UTM zone 30N (deprecated)
<3105> +proj=utm +zone=30 +ellps=clrk80 +units=m +no_defs  <>
# Gulshan 303 / Bangladesh Transverse Mercator
<3106> +proj=tmerc +lat_0=0 +lon_0=90 +k=0.9996 +x_0=500000 +y_0=0 +a=6377276.345 +b=6356075.41314024 +towgs84=283.7,735.9,261.1,0,0,0,0 +units=m +no_defs  <>
# GDA94 / SA Lambert
<3107> +proj=lcc +lat_1=-28 +lat_2=-36 +lat_0=-32 +lon_0=135 +x_0=1000000 +y_0=2000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / Guernsey Grid
<3108> +proj=tmerc +lat_0=49.5 +lon_0=-2.416666666666667 +k=0.999997 +x_0=47000 +y_0=50000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / Jersey Transverse Mercator
<3109> +proj=tmerc +lat_0=49.225 +lon_0=-2.135 +k=0.9999999000000001 +x_0=40000 +y_0=70000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# AGD66 / Vicgrid66
<3110> +proj=lcc +lat_1=-36 +lat_2=-38 +lat_0=-37 +lon_0=145 +x_0=2500000 +y_0=4500000 +ellps=aust_SA +towgs84=-117.808,-51.536,137.784,0.303,0.446,0.234,-0.29 +units=m +no_defs  <>
# GDA94 / Vicgrid
<3111> +proj=lcc +lat_1=-36 +lat_2=-38 +lat_0=-37 +lon_0=145 +x_0=2500000 +y_0=2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GDA94 / Geoscience Australia Lambert
<3112> +proj=lcc +lat_1=-18 +lat_2=-36 +lat_0=0 +lon_0=134 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GDA94 / BCSG02
<3113> +proj=tmerc +lat_0=-28 +lon_0=153 +k=0.99999 +x_0=50000 +y_0=100000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# MAGNA-SIRGAS / Colombia Far West zone
<3114> +proj=tmerc +lat_0=4.596200416666666 +lon_0=-80.07750791666666 +k=1 +x_0=1000000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# MAGNA-SIRGAS / Colombia West zone
<3115> +proj=tmerc +lat_0=4.596200416666666 +lon_0=-77.07750791666666 +k=1 +x_0=1000000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# MAGNA-SIRGAS / Colombia Bogota zone
<3116> +proj=tmerc +lat_0=4.596200416666666 +lon_0=-74.07750791666666 +k=1 +x_0=1000000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# MAGNA-SIRGAS / Colombia East Central zone
<3117> +proj=tmerc +lat_0=4.596200416666666 +lon_0=-71.07750791666666 +k=1 +x_0=1000000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# MAGNA-SIRGAS / Colombia East zone
<3118> +proj=tmerc +lat_0=4.596200416666666 +lon_0=-68.07750791666666 +k=1 +x_0=1000000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Douala 1948 / AEF west
<3119> +proj=tmerc +lat_0=0 +lon_0=10.5 +k=0.999 +x_0=1000000 +y_0=1000000 +ellps=intl +towgs84=-206.1,-174.7,-87.7,0,0,0,0 +units=m +no_defs  <>
# Pulkovo 1942(58) / Poland zone I
<3120> +proj=sterea +lat_0=50.625 +lon_0=21.08333333333333 +k=0.9998 +x_0=4637000 +y_0=5467000 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# PRS92 / Philippines zone 1
<3121> +proj=tmerc +lat_0=0 +lon_0=117 +k=0.99995 +x_0=500000 +y_0=0 +ellps=clrk66 +towgs84=-127.62,-67.24,-47.04,-3.068,4.903,1.578,-1.06 +units=m +no_defs  <>
# PRS92 / Philippines zone 2
<3122> +proj=tmerc +lat_0=0 +lon_0=119 +k=0.99995 +x_0=500000 +y_0=0 +ellps=clrk66 +towgs84=-127.62,-67.24,-47.04,-3.068,4.903,1.578,-1.06 +units=m +no_defs  <>
# PRS92 / Philippines zone 3
<3123> +proj=tmerc +lat_0=0 +lon_0=121 +k=0.99995 +x_0=500000 +y_0=0 +ellps=clrk66 +towgs84=-127.62,-67.24,-47.04,-3.068,4.903,1.578,-1.06 +units=m +no_defs  <>
# PRS92 / Philippines zone 4
<3124> +proj=tmerc +lat_0=0 +lon_0=123 +k=0.99995 +x_0=500000 +y_0=0 +ellps=clrk66 +towgs84=-127.62,-67.24,-47.04,-3.068,4.903,1.578,-1.06 +units=m +no_defs  <>
# PRS92 / Philippines zone 5
<3125> +proj=tmerc +lat_0=0 +lon_0=125 +k=0.99995 +x_0=500000 +y_0=0 +ellps=clrk66 +towgs84=-127.62,-67.24,-47.04,-3.068,4.903,1.578,-1.06 +units=m +no_defs  <>
# ETRS89 / ETRS-GK19FIN
<3126> +proj=tmerc +lat_0=0 +lon_0=19 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / ETRS-GK20FIN
<3127> +proj=tmerc +lat_0=0 +lon_0=20 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / ETRS-GK21FIN
<3128> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / ETRS-GK22FIN
<3129> +proj=tmerc +lat_0=0 +lon_0=22 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / ETRS-GK23FIN
<3130> +proj=tmerc +lat_0=0 +lon_0=23 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / ETRS-GK24FIN
<3131> +proj=tmerc +lat_0=0 +lon_0=24 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / ETRS-GK25FIN
<3132> +proj=tmerc +lat_0=0 +lon_0=25 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / ETRS-GK26FIN
<3133> +proj=tmerc +lat_0=0 +lon_0=26 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / ETRS-GK27FIN
<3134> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / ETRS-GK28FIN
<3135> +proj=tmerc +lat_0=0 +lon_0=28 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / ETRS-GK29FIN
<3136> +proj=tmerc +lat_0=0 +lon_0=29 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / ETRS-GK30FIN
<3137> +proj=tmerc +lat_0=0 +lon_0=30 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / ETRS-GK31FIN
<3138> +proj=tmerc +lat_0=0 +lon_0=31 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Vanua Levu 1915 / Vanua Levu Grid
# Unable to translate coordinate system EPSG:3139 into PROJ.4 format.
#
# Viti Levu 1912 / Viti Levu Grid
<3140> +proj=cass +lat_0=-18 +lon_0=178 +x_0=109435.392 +y_0=141622.272 +a=6378306.3696 +b=6356571.996 +towgs84=98,390,-22,0,0,0,0 +units=link +no_defs  <>
# Fiji 1956 / UTM zone 60S
<3141> +proj=utm +zone=60 +south +ellps=intl +towgs84=265.025,384.929,-194.046,0,0,0,0 +units=m +no_defs  <>
# Fiji 1956 / UTM zone 1S
<3142> +proj=utm +zone=1 +south +ellps=intl +towgs84=265.025,384.929,-194.046,0,0,0,0 +units=m +no_defs  <>
# Fiji 1986 / Fiji Map Grid (deprecated)
<3143> +proj=tmerc +lat_0=-17 +lon_0=178.75 +k=0.99985 +x_0=2000000 +y_0=4000000 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# FD54 / Faroe Lambert
# Unable to translate coordinate system EPSG:3144 into PROJ.4 format.
#
# ETRS89 / Faroe Lambert
# Unable to translate coordinate system EPSG:3145 into PROJ.4 format.
#
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 6 (deprecated)
<3146> +proj=tmerc +lat_0=0 +lon_0=18 +k=1 +x_0=6500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger CM 18E (deprecated)
<3147> +proj=tmerc +lat_0=0 +lon_0=18 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Indian 1960 / UTM zone 48N
<3148> +proj=utm +zone=48 +a=6377276.345 +b=6356075.41314024 +towgs84=198,881,317,0,0,0,0 +units=m +no_defs  <>
# Indian 1960 / UTM zone 49N
<3149> +proj=utm +zone=49 +a=6377276.345 +b=6356075.41314024 +towgs84=198,881,317,0,0,0,0 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 6 (deprecated)
<3150> +proj=tmerc +lat_0=0 +lon_0=18 +k=1 +x_0=6500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger CM 18E (deprecated)
<3151> +proj=tmerc +lat_0=0 +lon_0=18 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# ST74
<3152> +proj=tmerc +lat_0=0 +lon_0=18.05779 +k=0.99999425 +x_0=100178.1808 +y_0=-6500614.7836 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / BC Albers
<3153> +proj=aea +lat_1=50 +lat_2=58.5 +lat_0=45 +lon_0=-126 +x_0=1000000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / UTM zone 7N
<3154> +proj=utm +zone=7 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / UTM zone 8N
<3155> +proj=utm +zone=8 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / UTM zone 9N
<3156> +proj=utm +zone=9 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / UTM zone 10N
<3157> +proj=utm +zone=10 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / UTM zone 14N
<3158> +proj=utm +zone=14 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / UTM zone 15N
<3159> +proj=utm +zone=15 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / UTM zone 16N
<3160> +proj=utm +zone=16 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83 / Ontario MNR Lambert
<3161> +proj=lcc +lat_1=44.5 +lat_2=53.5 +lat_0=0 +lon_0=-85 +x_0=930000 +y_0=6430000 +datum=NAD83 +units=m +no_defs  <>
# NAD83(CSRS) / Ontario MNR Lambert
<3162> +proj=lcc +lat_1=44.5 +lat_2=53.5 +lat_0=0 +lon_0=-85 +x_0=930000 +y_0=6430000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGNC91-93 / Lambert New Caledonia
<3163> +proj=lcc +lat_1=-20.66666666666667 +lat_2=-22.33333333333333 +lat_0=-21.5 +lon_0=166 +x_0=400000 +y_0=300000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ST87 Ouvea / UTM zone 58S
<3164> +proj=utm +zone=58 +south +ellps=WGS84 +towgs84=-56.263,16.136,-22.856,0,0,0,0 +units=m +no_defs  <>
# NEA74 Noumea / Noumea Lambert
<3165> +proj=lcc +lat_1=-22.24469175 +lat_2=-22.29469175 +lat_0=-22.26969175 +lon_0=166.44242575 +x_0=0.66 +y_0=1.02 +ellps=intl +towgs84=-10.18,-350.43,291.37,0,0,0,0 +units=m +no_defs  <>
# NEA74 Noumea / Noumea Lambert 2
<3166> +proj=lcc +lat_1=-22.24472222222222 +lat_2=-22.29472222222222 +lat_0=-22.26972222222222 +lon_0=166.4425 +x_0=8.313000000000001 +y_0=-2.354 +ellps=intl +towgs84=-10.18,-350.43,291.37,0,0,0,0 +units=m +no_defs  <>
# Kertau (RSO) / RSO Malaya (ch)
<3167> +proj=omerc +lat_0=4 +lonc=102.25 +alpha=323.0257905 +k=0.99984 +x_0=40000 +y_0=0 +no_uoff +gamma=323.1301023611111 +a=6377295.664 +b=6356094.667915204 +to_meter=20.116756 +no_defs  <>
# Kertau (RSO) / RSO Malaya (m)
<3168> +proj=omerc +lat_0=4 +lonc=102.25 +alpha=323.0257905 +k=0.99984 +x_0=804670.24 +y_0=0 +no_uoff +gamma=323.1301023611111 +a=6377295.664 +b=6356094.667915204 +units=m +no_defs  <>
# RGNC91-93 / UTM zone 57S
<3169> +proj=utm +zone=57 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGNC91-93 / UTM zone 58S
<3170> +proj=utm +zone=58 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGNC91-93 / UTM zone 59S
<3171> +proj=utm +zone=59 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# IGN53 Mare / UTM zone 59S
<3172> +proj=utm +zone=59 +south +ellps=intl +towgs84=287.58,177.78,-135.41,0,0,0,0 +units=m +no_defs  <>
# fk89 / Faroe Lambert FK89
# Unable to translate coordinate system EPSG:3173 into PROJ.4 format.
#
# NAD83 / Great Lakes Albers
<3174> +proj=aea +lat_1=42.122774 +lat_2=49.01518 +lat_0=45.568977 +lon_0=-84.455955 +x_0=1000000 +y_0=1000000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Great Lakes and St Lawrence Albers
<3175> +proj=aea +lat_1=42.122774 +lat_2=49.01518 +lat_0=45.568977 +lon_0=-83.248627 +x_0=1000000 +y_0=1000000 +datum=NAD83 +units=m +no_defs  <>
# Indian 1960 / TM 106 NE
<3176> +proj=tmerc +lat_0=0 +lon_0=106 +k=0.9996 +x_0=500000 +y_0=0 +a=6377276.345 +b=6356075.41314024 +towgs84=198,881,317,0,0,0,0 +units=m +no_defs  <>
# LGD2006 / Libya TM
<3177> +proj=tmerc +lat_0=0 +lon_0=17 +k=0.9965000000000001 +x_0=1000000 +y_0=0 +ellps=intl +towgs84=-208.4058,-109.8777,-2.5764,0,0,0,0 +units=m +no_defs  <>
# GR96 / UTM zone 18N
<3178> +proj=utm +zone=18 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / UTM zone 19N
<3179> +proj=utm +zone=19 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / UTM zone 20N
<3180> +proj=utm +zone=20 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / UTM zone 21N
<3181> +proj=utm +zone=21 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / UTM zone 22N
<3182> +proj=utm +zone=22 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / UTM zone 23N
<3183> +proj=utm +zone=23 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / UTM zone 24N
<3184> +proj=utm +zone=24 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / UTM zone 25N
<3185> +proj=utm +zone=25 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / UTM zone 26N
<3186> +proj=utm +zone=26 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / UTM zone 27N
<3187> +proj=utm +zone=27 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / UTM zone 28N
<3188> +proj=utm +zone=28 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / UTM zone 29N
<3189> +proj=utm +zone=29 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# LGD2006 / Libya TM zone 5
<3190> +proj=tmerc +lat_0=0 +lon_0=9 +k=0.99995 +x_0=200000 +y_0=0 +ellps=intl +towgs84=-208.4058,-109.8777,-2.5764,0,0,0,0 +units=m +no_defs  <>
# LGD2006 / Libya TM zone 6
<3191> +proj=tmerc +lat_0=0 +lon_0=11 +k=0.99995 +x_0=200000 +y_0=0 +ellps=intl +towgs84=-208.4058,-109.8777,-2.5764,0,0,0,0 +units=m +no_defs  <>
# LGD2006 / Libya TM zone 7
<3192> +proj=tmerc +lat_0=0 +lon_0=13 +k=0.99995 +x_0=200000 +y_0=0 +ellps=intl +towgs84=-208.4058,-109.8777,-2.5764,0,0,0,0 +units=m +no_defs  <>
# LGD2006 / Libya TM zone 8
<3193> +proj=tmerc +lat_0=0 +lon_0=15 +k=0.99995 +x_0=200000 +y_0=0 +ellps=intl +towgs84=-208.4058,-109.8777,-2.5764,0,0,0,0 +units=m +no_defs  <>
# LGD2006 / Libya TM zone 9
<3194> +proj=tmerc +lat_0=0 +lon_0=17 +k=0.99995 +x_0=200000 +y_0=0 +ellps=intl +towgs84=-208.4058,-109.8777,-2.5764,0,0,0,0 +units=m +no_defs  <>
# LGD2006 / Libya TM zone 10
<3195> +proj=tmerc +lat_0=0 +lon_0=19 +k=0.99995 +x_0=200000 +y_0=0 +ellps=intl +towgs84=-208.4058,-109.8777,-2.5764,0,0,0,0 +units=m +no_defs  <>
# LGD2006 / Libya TM zone 11
<3196> +proj=tmerc +lat_0=0 +lon_0=21 +k=0.99995 +x_0=200000 +y_0=0 +ellps=intl +towgs84=-208.4058,-109.8777,-2.5764,0,0,0,0 +units=m +no_defs  <>
# LGD2006 / Libya TM zone 12
<3197> +proj=tmerc +lat_0=0 +lon_0=23 +k=0.99995 +x_0=200000 +y_0=0 +ellps=intl +towgs84=-208.4058,-109.8777,-2.5764,0,0,0,0 +units=m +no_defs  <>
# LGD2006 / Libya TM zone 13
<3198> +proj=tmerc +lat_0=0 +lon_0=25 +k=0.99995 +x_0=200000 +y_0=0 +ellps=intl +towgs84=-208.4058,-109.8777,-2.5764,0,0,0,0 +units=m +no_defs  <>
# LGD2006 / UTM zone 32N
<3199> +proj=utm +zone=32 +ellps=intl +towgs84=-208.4058,-109.8777,-2.5764,0,0,0,0 +units=m +no_defs  <>
# FD58 / Iraq zone
<3200> +proj=lcc +lat_1=32.5 +lat_0=32.5 +lon_0=45 +k_0=0.9987864078000001 +x_0=1500000 +y_0=1166200 +ellps=clrk80 +towgs84=-241.54,-163.64,396.06,0,0,0,0 +units=m +no_defs  <>
# LGD2006 / UTM zone 33N
<3201> +proj=utm +zone=33 +ellps=intl +towgs84=-208.4058,-109.8777,-2.5764,0,0,0,0 +units=m +no_defs  <>
# LGD2006 / UTM zone 34N
<3202> +proj=utm +zone=34 +ellps=intl +towgs84=-208.4058,-109.8777,-2.5764,0,0,0,0 +units=m +no_defs  <>
# LGD2006 / UTM zone 35N
<3203> +proj=utm +zone=35 +ellps=intl +towgs84=-208.4058,-109.8777,-2.5764,0,0,0,0 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SP19-20
<3204> +proj=lcc +lat_1=-60.66666666666666 +lat_2=-63.33333333333334 +lat_0=-90 +lon_0=-66 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SP21-22
<3205> +proj=lcc +lat_1=-60.66666666666666 +lat_2=-63.33333333333334 +lat_0=-90 +lon_0=-54 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SP23-24
<3206> +proj=lcc +lat_1=-60.66666666666666 +lat_2=-63.33333333333334 +lat_0=-90 +lon_0=-42 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SQ01-02
<3207> +proj=lcc +lat_1=-64.66666666666667 +lat_2=-67.33333333333333 +lat_0=-90 +lon_0=-174 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SQ19-20
<3208> +proj=lcc +lat_1=-64.66666666666667 +lat_2=-67.33333333333333 +lat_0=-90 +lon_0=-66 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SQ21-22
<3209> +proj=lcc +lat_1=-64.66666666666667 +lat_2=-67.33333333333333 +lat_0=-90 +lon_0=-54 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SQ37-38
<3210> +proj=lcc +lat_1=-64.66666666666667 +lat_2=-67.33333333333333 +lat_0=-90 +lon_0=42 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SQ39-40
<3211> +proj=lcc +lat_1=-64.66666666666667 +lat_2=-67.33333333333333 +lat_0=-90 +lon_0=54 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SQ41-42
<3212> +proj=lcc +lat_1=-64.66666666666667 +lat_2=-67.33333333333333 +lat_0=-90 +lon_0=66 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SQ43-44
<3213> +proj=lcc +lat_1=-64.66666666666667 +lat_2=-67.33333333333333 +lat_0=-90 +lon_0=78 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SQ45-46
<3214> +proj=lcc +lat_1=-64.66666666666667 +lat_2=-67.33333333333333 +lat_0=-90 +lon_0=90 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SQ47-48
<3215> +proj=lcc +lat_1=-64.66666666666667 +lat_2=-67.33333333333333 +lat_0=-90 +lon_0=102 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SQ49-50
<3216> +proj=lcc +lat_1=-64.66666666666667 +lat_2=-67.33333333333333 +lat_0=-90 +lon_0=114 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SQ51-52
<3217> +proj=lcc +lat_1=-64.66666666666667 +lat_2=-67.33333333333333 +lat_0=-90 +lon_0=126 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SQ53-54
<3218> +proj=lcc +lat_1=-64.66666666666667 +lat_2=-67.33333333333333 +lat_0=-90 +lon_0=138 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SQ55-56
<3219> +proj=lcc +lat_1=-64.66666666666667 +lat_2=-67.33333333333333 +lat_0=-90 +lon_0=150 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SQ57-58
<3220> +proj=lcc +lat_1=-64.66666666666667 +lat_2=-67.33333333333333 +lat_0=-90 +lon_0=162 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SR13-14
<3221> +proj=lcc +lat_1=-68.66666666666667 +lat_2=-71.33333333333333 +lat_0=-90 +lon_0=-102 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SR15-16
<3222> +proj=lcc +lat_1=-68.66666666666667 +lat_2=-71.33333333333333 +lat_0=-90 +lon_0=-90 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SR17-18
<3223> +proj=lcc +lat_1=-68.66666666666667 +lat_2=-71.33333333333333 +lat_0=-90 +lon_0=-78 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SR19-20
<3224> +proj=lcc +lat_1=-68.66666666666667 +lat_2=-71.33333333333333 +lat_0=-90 +lon_0=-66 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SR27-28
<3225> +proj=lcc +lat_1=-68.66666666666667 +lat_2=-71.33333333333333 +lat_0=-90 +lon_0=-18 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SR29-30
<3226> +proj=lcc +lat_1=-68.66666666666667 +lat_2=-71.33333333333333 +lat_0=-90 +lon_0=-6 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SR31-32
<3227> +proj=lcc +lat_1=-68.66666666666667 +lat_2=-71.33333333333333 +lat_0=-90 +lon_0=6 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SR33-34
<3228> +proj=lcc +lat_1=-68.66666666666667 +lat_2=-71.33333333333333 +lat_0=-90 +lon_0=18 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SR35-36
<3229> +proj=lcc +lat_1=-68.66666666666667 +lat_2=-71.33333333333333 +lat_0=-90 +lon_0=30 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SR37-38
<3230> +proj=lcc +lat_1=-68.66666666666667 +lat_2=-71.33333333333333 +lat_0=-90 +lon_0=42 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SR39-40
<3231> +proj=lcc +lat_1=-68.66666666666667 +lat_2=-71.33333333333333 +lat_0=-90 +lon_0=54 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SR41-42
<3232> +proj=lcc +lat_1=-68.66666666666667 +lat_2=-71.33333333333333 +lat_0=-90 +lon_0=66 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SR43-44
<3233> +proj=lcc +lat_1=-68.66666666666667 +lat_2=-71.33333333333333 +lat_0=-90 +lon_0=78 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SR45-46
<3234> +proj=lcc +lat_1=-68.66666666666667 +lat_2=-71.33333333333333 +lat_0=-90 +lon_0=90 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SR47-48
<3235> +proj=lcc +lat_1=-68.66666666666667 +lat_2=-71.33333333333333 +lat_0=-90 +lon_0=102 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SR49-50
<3236> +proj=lcc +lat_1=-68.66666666666667 +lat_2=-71.33333333333333 +lat_0=-90 +lon_0=114 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SR51-52
<3237> +proj=lcc +lat_1=-68.66666666666667 +lat_2=-71.33333333333333 +lat_0=-90 +lon_0=126 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SR53-54
<3238> +proj=lcc +lat_1=-68.66666666666667 +lat_2=-71.33333333333333 +lat_0=-90 +lon_0=138 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SR55-56
<3239> +proj=lcc +lat_1=-68.66666666666667 +lat_2=-71.33333333333333 +lat_0=-90 +lon_0=150 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SR57-58
<3240> +proj=lcc +lat_1=-68.66666666666667 +lat_2=-71.33333333333333 +lat_0=-90 +lon_0=162 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SR59-60
<3241> +proj=lcc +lat_1=-68.66666666666667 +lat_2=-71.33333333333333 +lat_0=-90 +lon_0=174 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SS04-06
<3242> +proj=lcc +lat_1=-72.66666666666667 +lat_2=-75.33333333333333 +lat_0=-90 +lon_0=-153 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SS07-09
<3243> +proj=lcc +lat_1=-72.66666666666667 +lat_2=-75.33333333333333 +lat_0=-90 +lon_0=-135 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SS10-12
<3244> +proj=lcc +lat_1=-72.66666666666667 +lat_2=-75.33333333333333 +lat_0=-90 +lon_0=-117 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SS13-15
<3245> +proj=lcc +lat_1=-72.66666666666667 +lat_2=-75.33333333333333 +lat_0=-90 +lon_0=-99 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SS16-18
<3246> +proj=lcc +lat_1=-72.66666666666667 +lat_2=-75.33333333333333 +lat_0=-90 +lon_0=-81 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SS19-21
<3247> +proj=lcc +lat_1=-72.66666666666667 +lat_2=-75.33333333333333 +lat_0=-90 +lon_0=-63 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SS25-27
<3248> +proj=lcc +lat_1=-72.66666666666667 +lat_2=-75.33333333333333 +lat_0=-90 +lon_0=-27 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SS28-30
<3249> +proj=lcc +lat_1=-72.66666666666667 +lat_2=-75.33333333333333 +lat_0=-90 +lon_0=-9 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SS31-33
<3250> +proj=lcc +lat_1=-72.66666666666667 +lat_2=-75.33333333333333 +lat_0=-90 +lon_0=9 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SS34-36
<3251> +proj=lcc +lat_1=-72.66666666666667 +lat_2=-75.33333333333333 +lat_0=-90 +lon_0=27 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SS37-39
<3252> +proj=lcc +lat_1=-72.66666666666667 +lat_2=-75.33333333333333 +lat_0=-90 +lon_0=45 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SS40-42
<3253> +proj=lcc +lat_1=-72.66666666666667 +lat_2=-75.33333333333333 +lat_0=-90 +lon_0=63 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SS43-45
<3254> +proj=lcc +lat_1=-72.66666666666667 +lat_2=-75.33333333333333 +lat_0=-90 +lon_0=81 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SS46-48
<3255> +proj=lcc +lat_1=-72.66666666666667 +lat_2=-75.33333333333333 +lat_0=-90 +lon_0=99 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SS49-51
<3256> +proj=lcc +lat_1=-72.66666666666667 +lat_2=-75.33333333333333 +lat_0=-90 +lon_0=117 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SS52-54
<3257> +proj=lcc +lat_1=-72.66666666666667 +lat_2=-75.33333333333333 +lat_0=-90 +lon_0=135 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SS55-57
<3258> +proj=lcc +lat_1=-72.66666666666667 +lat_2=-75.33333333333333 +lat_0=-90 +lon_0=153 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SS58-60
<3259> +proj=lcc +lat_1=-72.66666666666667 +lat_2=-75.33333333333333 +lat_0=-90 +lon_0=171 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW ST01-04
<3260> +proj=lcc +lat_1=-76.66666666666667 +lat_2=-79.33333333333333 +lat_0=-90 +lon_0=-168 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW ST05-08
<3261> +proj=lcc +lat_1=-76.66666666666667 +lat_2=-79.33333333333333 +lat_0=-90 +lon_0=-144 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW ST09-12
<3262> +proj=lcc +lat_1=-76.66666666666667 +lat_2=-79.33333333333333 +lat_0=-90 +lon_0=-120 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW ST13-16
<3263> +proj=lcc +lat_1=-76.66666666666667 +lat_2=-79.33333333333333 +lat_0=-90 +lon_0=-96 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW ST17-20
<3264> +proj=lcc +lat_1=-76.66666666666667 +lat_2=-79.33333333333333 +lat_0=-90 +lon_0=-72 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW ST21-24
<3265> +proj=lcc +lat_1=-76.66666666666667 +lat_2=-79.33333333333333 +lat_0=-90 +lon_0=-48 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW ST25-28
<3266> +proj=lcc +lat_1=-76.66666666666667 +lat_2=-79.33333333333333 +lat_0=-90 +lon_0=-24 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW ST29-32
<3267> +proj=lcc +lat_1=-76.66666666666667 +lat_2=-79.33333333333333 +lat_0=-90 +lon_0=0 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW ST33-36
<3268> +proj=lcc +lat_1=-76.66666666666667 +lat_2=-79.33333333333333 +lat_0=-90 +lon_0=24 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW ST37-40
<3269> +proj=lcc +lat_1=-76.66666666666667 +lat_2=-79.33333333333333 +lat_0=-90 +lon_0=48 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW ST41-44
<3270> +proj=lcc +lat_1=-76.66666666666667 +lat_2=-79.33333333333333 +lat_0=-90 +lon_0=72 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW ST45-48
<3271> +proj=lcc +lat_1=-76.66666666666667 +lat_2=-79.33333333333333 +lat_0=-90 +lon_0=96 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW ST49-52
<3272> +proj=lcc +lat_1=-76.66666666666667 +lat_2=-79.33333333333333 +lat_0=-90 +lon_0=120 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW ST53-56
<3273> +proj=lcc +lat_1=-76.66666666666667 +lat_2=-79.33333333333333 +lat_0=-90 +lon_0=144 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW ST57-60
<3274> +proj=lcc +lat_1=-76.66666666666667 +lat_2=-79.33333333333333 +lat_0=-90 +lon_0=168 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SU01-05
<3275> +proj=stere +lat_0=-90 +lat_ts=-80.23861111111111 +lon_0=-165 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SU06-10
<3276> +proj=stere +lat_0=-90 +lat_ts=-80.23861111111111 +lon_0=-135 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SU11-15
<3277> +proj=stere +lat_0=-90 +lat_ts=-80.23861111111111 +lon_0=-105 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SU16-20
<3278> +proj=stere +lat_0=-90 +lat_ts=-80.23861111111111 +lon_0=-75 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SU21-25
<3279> +proj=stere +lat_0=-90 +lat_ts=-80.23861111111111 +lon_0=-45 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SU26-30
<3280> +proj=stere +lat_0=-90 +lat_ts=-80.23861111111111 +lon_0=-15 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SU31-35
<3281> +proj=stere +lat_0=-90 +lat_ts=-80.23861111111111 +lon_0=15 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SU36-40
<3282> +proj=stere +lat_0=-90 +lat_ts=-80.23861111111111 +lon_0=45 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SU41-45
<3283> +proj=stere +lat_0=-90 +lat_ts=-80.23861111111111 +lon_0=75 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SU46-50
<3284> +proj=stere +lat_0=-90 +lat_ts=-80.23861111111111 +lon_0=105 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SU51-55
<3285> +proj=stere +lat_0=-90 +lat_ts=-80.23861111111111 +lon_0=135 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SU56-60
<3286> +proj=stere +lat_0=-90 +lat_ts=-80.23861111111111 +lon_0=165 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SV01-10
<3287> +proj=stere +lat_0=-90 +lat_ts=-80.23861111111111 +lon_0=-150 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SV11-20
<3288> +proj=stere +lat_0=-90 +lat_ts=-80.23861111111111 +lon_0=-90 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SV21-30
<3289> +proj=stere +lat_0=-90 +lat_ts=-80.23861111111111 +lon_0=-30 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SV31-40
<3290> +proj=stere +lat_0=-90 +lat_ts=-80.23861111111111 +lon_0=30 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SV41-50
<3291> +proj=stere +lat_0=-90 +lat_ts=-80.23861111111111 +lon_0=90 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SV51-60
<3292> +proj=stere +lat_0=-90 +lat_ts=-80.23861111111111 +lon_0=150 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / SCAR IMW SW01-60
<3293> +proj=stere +lat_0=-90 +lat_ts=-80.23861111111111 +lon_0=0 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / USGS Transantarctic Mountains
<3294> +proj=lcc +lat_1=-76.66666666666667 +lat_2=-79.33333333333333 +lat_0=-78 +lon_0=162 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# Guam 1963 / Yap Islands
# Unable to translate coordinate system EPSG:3295 into PROJ.4 format.
#
# RGPF / UTM zone 5S
<3296> +proj=utm +zone=5 +south +ellps=GRS80 +towgs84=0.072,-0.507,-0.245,-0.0183,0.0003,-0.007,-0.0093 +units=m +no_defs  <>
# RGPF / UTM zone 6S
<3297> +proj=utm +zone=6 +south +ellps=GRS80 +towgs84=0.072,-0.507,-0.245,-0.0183,0.0003,-0.007,-0.0093 +units=m +no_defs  <>
# RGPF / UTM zone 7S
<3298> +proj=utm +zone=7 +south +ellps=GRS80 +towgs84=0.072,-0.507,-0.245,-0.0183,0.0003,-0.007,-0.0093 +units=m +no_defs  <>
# RGPF / UTM zone 8S
<3299> +proj=utm +zone=8 +south +ellps=GRS80 +towgs84=0.072,-0.507,-0.245,-0.0183,0.0003,-0.007,-0.0093 +units=m +no_defs  <>
# Estonian Coordinate System of 1992
<3300> +proj=lcc +lat_1=59.33333333333334 +lat_2=58 +lat_0=57.51755393055556 +lon_0=24 +x_0=500000 +y_0=6375000 +ellps=GRS80 +towgs84=0.055,-0.541,-0.185,0.0183,-0.0003,-0.007,-0.014 +units=m +no_defs  <>
# Estonian Coordinate System of 1997
<3301> +proj=lcc +lat_1=59.33333333333334 +lat_2=58 +lat_0=57.51755393055556 +lon_0=24 +x_0=500000 +y_0=6375000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# IGN63 Hiva Oa / UTM zone 7S
<3302> +proj=utm +zone=7 +south +ellps=intl +towgs84=410.721,55.049,80.746,2.5779,2.3514,0.6664,17.3311 +units=m +no_defs  <>
# Fatu Iva 72 / UTM zone 7S
<3303> +proj=utm +zone=7 +south +ellps=intl +towgs84=347.103,1078.125,2623.922,-33.8875,70.6773,-9.3943,186.074 +units=m +no_defs  <>
# Tahiti 79 / UTM zone 6S
<3304> +proj=utm +zone=6 +south +ellps=intl +towgs84=221.525,152.948,176.768,-2.3847,-1.3896,-0.877,11.4741 +units=m +no_defs  <>
# Moorea 87 / UTM zone 6S
<3305> +proj=utm +zone=6 +south +ellps=intl +towgs84=215.525,149.593,176.229,-3.2624,-1.692,-1.1571,10.4773 +units=m +no_defs  <>
# Maupiti 83 / UTM zone 5S
<3306> +proj=utm +zone=5 +south +ellps=intl +towgs84=217.037,86.959,23.956,0,0,0,0 +units=m +no_defs  <>
# Nakhl-e Ghanem / UTM zone 39N
<3307> +proj=utm +zone=39 +ellps=WGS84 +towgs84=0,-0.15,0.68,0,0,0,0 +units=m +no_defs  <>
# GDA94 / NSW Lambert
<3308> +proj=lcc +lat_1=-30.75 +lat_2=-35.75 +lat_0=-33.25 +lon_0=147 +x_0=9300000 +y_0=4500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD27 / California Albers
<3309> +proj=aea +lat_1=34 +lat_2=40.5 +lat_0=0 +lon_0=-120 +x_0=0 +y_0=-4000000 +datum=NAD27 +units=m +no_defs  <>
# NAD83 / California Albers
<3310> +proj=aea +lat_1=34 +lat_2=40.5 +lat_0=0 +lon_0=-120 +x_0=0 +y_0=-4000000 +datum=NAD83 +units=m +no_defs  <>
# NAD83(HARN) / California Albers
<3311> +proj=aea +lat_1=34 +lat_2=40.5 +lat_0=0 +lon_0=-120 +x_0=0 +y_0=-4000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# CSG67 / UTM zone 21N
<3312> +proj=utm +zone=21 +ellps=intl +towgs84=-186,230,110,0,0,0,0 +units=m +no_defs  <>
# RGFG95 / UTM zone 21N
<3313> +proj=utm +zone=21 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Katanga 1955 / Katanga Lambert (deprecated)
<3314> +proj=lcc +lat_1=-6.5 +lat_2=-11.5 +lat_0=0 +lon_0=26 +x_0=0 +y_0=0 +ellps=clrk66 +towgs84=-103.746,-9.614,-255.95,0,0,0,0 +units=m +no_defs  <>
# Katanga 1955 / Katanga TM (deprecated)
<3315> +proj=tmerc +lat_0=-9 +lon_0=26 +k=0.9998 +x_0=0 +y_0=0 +ellps=clrk66 +towgs84=-103.746,-9.614,-255.95,0,0,0,0 +units=m +no_defs  <>
# Kasai 1953 / Congo TM zone 22
<3316> +proj=tmerc +lat_0=0 +lon_0=22 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=clrk80 +units=m +no_defs  <>
# Kasai 1953 / Congo TM zone 24
<3317> +proj=tmerc +lat_0=0 +lon_0=24 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=clrk80 +units=m +no_defs  <>
# IGC 1962 / Congo TM zone 12
<3318> +proj=tmerc +lat_0=0 +lon_0=12 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=clrk80 +units=m +no_defs  <>
# IGC 1962 / Congo TM zone 14
<3319> +proj=tmerc +lat_0=0 +lon_0=14 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=clrk80 +units=m +no_defs  <>
# IGC 1962 / Congo TM zone 16
<3320> +proj=tmerc +lat_0=0 +lon_0=16 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=clrk80 +units=m +no_defs  <>
# IGC 1962 / Congo TM zone 18
<3321> +proj=tmerc +lat_0=0 +lon_0=18 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=clrk80 +units=m +no_defs  <>
# IGC 1962 / Congo TM zone 20
<3322> +proj=tmerc +lat_0=0 +lon_0=20 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=clrk80 +units=m +no_defs  <>
# IGC 1962 / Congo TM zone 22
<3323> +proj=tmerc +lat_0=0 +lon_0=22 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=clrk80 +units=m +no_defs  <>
# IGC 1962 / Congo TM zone 24
<3324> +proj=tmerc +lat_0=0 +lon_0=24 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=clrk80 +units=m +no_defs  <>
# IGC 1962 / Congo TM zone 26
<3325> +proj=tmerc +lat_0=0 +lon_0=26 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=clrk80 +units=m +no_defs  <>
# IGC 1962 / Congo TM zone 28
<3326> +proj=tmerc +lat_0=0 +lon_0=28 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=clrk80 +units=m +no_defs  <>
# IGC 1962 / Congo TM zone 30
<3327> +proj=tmerc +lat_0=0 +lon_0=30 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=clrk80 +units=m +no_defs  <>
# Pulkovo 1942(58) / GUGiK-80
<3328> +proj=sterea +lat_0=52.16666666666666 +lon_0=19.16666666666667 +k=0.999714 +x_0=500000 +y_0=500000 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# Pulkovo 1942(58) / 3-degree Gauss-Kruger zone 5
<3329> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=5500000 +y_0=0 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# Pulkovo 1942(58) / 3-degree Gauss-Kruger zone 6
<3330> +proj=tmerc +lat_0=0 +lon_0=18 +k=1 +x_0=6500000 +y_0=0 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# Pulkovo 1942(58) / 3-degree Gauss-Kruger zone 7
<3331> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=7500000 +y_0=0 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# Pulkovo 1942(58) / 3-degree Gauss-Kruger zone 8
<3332> +proj=tmerc +lat_0=0 +lon_0=24 +k=1 +x_0=8500000 +y_0=0 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# Pulkovo 1942(58) / Gauss-Kruger zone 3
<3333> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=3500000 +y_0=0 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# Pulkovo 1942(58) / Gauss-Kruger zone 4
<3334> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=4500000 +y_0=0 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# Pulkovo 1942(58) / Gauss-Kruger zone 5
<3335> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=5500000 +y_0=0 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# IGN 1962 Kerguelen / UTM zone 42S
<3336> +proj=utm +zone=42 +south +ellps=intl +towgs84=145,-187,103,0,0,0,0 +units=m +no_defs  <>
# Le Pouce 1934 / Mauritius Grid
<3337> +proj=lcc +lat_1=-20.19506944444445 +lat_0=-20.19506944444445 +lon_0=57.52182777777778 +k_0=1 +x_0=1000000 +y_0=1000000 +ellps=clrk80 +towgs84=-770.1,158.4,-498.2,0,0,0,0 +units=m +no_defs  <>
# NAD83 / Alaska Albers
<3338> +proj=aea +lat_1=55 +lat_2=65 +lat_0=50 +lon_0=-154 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# IGCB 1955 / Congo TM zone 12
<3339> +proj=tmerc +lat_0=0 +lon_0=12 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=clrk80 +towgs84=-79.9,-158,-168.9,0,0,0,0 +units=m +no_defs  <>
# IGCB 1955 / Congo TM zone 14
<3340> +proj=tmerc +lat_0=0 +lon_0=14 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=clrk80 +towgs84=-79.9,-158,-168.9,0,0,0,0 +units=m +no_defs  <>
# IGCB 1955 / Congo TM zone 16
<3341> +proj=tmerc +lat_0=0 +lon_0=16 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=clrk80 +towgs84=-79.9,-158,-168.9,0,0,0,0 +units=m +no_defs  <>
# IGCB 1955 / UTM zone 33S
<3342> +proj=utm +zone=33 +south +ellps=clrk80 +towgs84=-79.9,-158,-168.9,0,0,0,0 +units=m +no_defs  <>
# Mauritania 1999 / UTM zone 28N
<3343> +proj=utm +zone=28 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Mauritania 1999 / UTM zone 29N
<3344> +proj=utm +zone=29 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Mauritania 1999 / UTM zone 30N
<3345> +proj=utm +zone=30 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# LKS94 / Lithuania TM
<3346> +proj=tmerc +lat_0=0 +lon_0=24 +k=0.9998 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83 / Statistics Canada Lambert
<3347> +proj=lcc +lat_1=49 +lat_2=77 +lat_0=63.390675 +lon_0=-91.86666666666666 +x_0=6200000 +y_0=3000000 +datum=NAD83 +units=m +no_defs  <>
# NAD83(CSRS) / Statistics Canada Lambert
<3348> +proj=lcc +lat_1=49 +lat_2=77 +lat_0=63.390675 +lon_0=-91.86666666666666 +x_0=6200000 +y_0=3000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# WGS 84 / PDC Mercator (deprecated)
<3349> +proj=merc +lon_0=-150 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# Pulkovo 1942 / CS63 zone C0
<3350> +proj=tmerc +lat_0=0.1 +lon_0=21.95 +k=1 +x_0=250000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / CS63 zone C1
<3351> +proj=tmerc +lat_0=0.1 +lon_0=24.95 +k=1 +x_0=1250000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / CS63 zone C2
<3352> +proj=tmerc +lat_0=0.1 +lon_0=27.95 +k=1 +x_0=2250000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Mhast (onshore) / UTM zone 32S
<3353> +proj=utm +zone=32 +south +ellps=intl +units=m +no_defs  <>
# Mhast (offshore) / UTM zone 32S
<3354> +proj=utm +zone=32 +south +ellps=intl +units=m +no_defs  <>
# Egypt Gulf of Suez S-650 TL / Red Belt
<3355> +proj=tmerc +lat_0=30 +lon_0=31 +k=1 +x_0=615000 +y_0=810000 +ellps=helmert +towgs84=-146.21,112.63,4.05,0,0,0,0 +units=m +no_defs  <>
# Grand Cayman 1959 / UTM zone 17N (deprecated)
<3356> +proj=utm +zone=17 +ellps=clrk66 +towgs84=-179.483,-69.379,-27.584,-7.862,8.163,6.042,-13.925 +units=m +no_defs  <>
# Little Cayman 1961 / UTM zone 17N (deprecated)
<3357> +proj=utm +zone=17 +ellps=clrk66 +towgs84=8.853,-52.644,180.304,-0.393,-2.323,2.96,-24.081 +units=m +no_defs  <>
# NAD83(HARN) / North Carolina
<3358> +proj=lcc +lat_1=36.16666666666666 +lat_2=34.33333333333334 +lat_0=33.75 +lon_0=-79 +x_0=609601.22 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / North Carolina (ftUS) (deprecated)
<3359> +proj=lcc +lat_1=36.16666666666666 +lat_2=34.33333333333334 +lat_0=33.75 +lon_0=-79 +x_0=609601.2192024385 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(HARN) / South Carolina
<3360> +proj=lcc +lat_1=34.83333333333334 +lat_2=32.5 +lat_0=31.83333333333333 +lon_0=-81 +x_0=609600 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / South Carolina (ft)
<3361> +proj=lcc +lat_1=34.83333333333334 +lat_2=32.5 +lat_0=31.83333333333333 +lon_0=-81 +x_0=609600 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(HARN) / Pennsylvania North
<3362> +proj=lcc +lat_1=41.95 +lat_2=40.88333333333333 +lat_0=40.16666666666666 +lon_0=-77.75 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Pennsylvania North (ftUS)
<3363> +proj=lcc +lat_1=41.95 +lat_2=40.88333333333333 +lat_0=40.16666666666666 +lon_0=-77.75 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Pennsylvania South
<3364> +proj=lcc +lat_1=40.96666666666667 +lat_2=39.93333333333333 +lat_0=39.33333333333334 +lon_0=-77.75 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Pennsylvania South (ftUS)
<3365> +proj=lcc +lat_1=40.96666666666667 +lat_2=39.93333333333333 +lat_0=39.33333333333334 +lon_0=-77.75 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# Hong Kong 1963 Grid System (deprecated)
<3366> +proj=cass +lat_0=22.31213333333334 +lon_0=114.1785555555556 +x_0=40243.57775604237 +y_0=19069.93351512578 +a=6378293.645208759 +b=6356617.987679838 +units=m +no_defs  <>
# IGN Astro 1960 / UTM zone 28N
<3367> +proj=utm +zone=28 +ellps=clrk80 +units=m +no_defs  <>
# IGN Astro 1960 / UTM zone 29N
<3368> +proj=utm +zone=29 +ellps=clrk80 +units=m +no_defs  <>
# IGN Astro 1960 / UTM zone 30N
<3369> +proj=utm +zone=30 +ellps=clrk80 +units=m +no_defs  <>
# NAD27 / UTM zone 59N
<3370> +proj=utm +zone=59 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / UTM zone 60N
<3371> +proj=utm +zone=60 +datum=NAD27 +units=m +no_defs  <>
# NAD83 / UTM zone 59N
<3372> +proj=utm +zone=59 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 60N
<3373> +proj=utm +zone=60 +datum=NAD83 +units=m +no_defs  <>
# FD54 / UTM zone 29N
<3374> +proj=utm +zone=29 +ellps=intl +units=m +no_defs  <>
# GDM2000 / Peninsula RSO
<3375> +proj=omerc +lat_0=4 +lonc=102.25 +alpha=323.0257964666666 +k=0.99984 +x_0=804671 +y_0=0 +no_uoff +gamma=323.1301023611111 +ellps=GRS80 +units=m +no_defs  <>
# GDM2000 / East Malaysia BRSO
<3376> +proj=omerc +lat_0=4 +lonc=115 +alpha=53.31580995 +k=0.99984 +x_0=0 +y_0=0 +no_uoff +gamma=53.13010236111111 +ellps=GRS80 +units=m +no_defs  <>
# GDM2000 / Johor Grid
<3377> +proj=cass +lat_0=2.121679744444445 +lon_0=103.4279362361111 +x_0=-14810.562 +y_0=8758.32 +ellps=GRS80 +units=m +no_defs  <>
# GDM2000 / Sembilan and Melaka Grid
<3378> +proj=cass +lat_0=2.682347636111111 +lon_0=101.9749050416667 +x_0=3673.785 +y_0=-4240.573 +ellps=GRS80 +units=m +no_defs  <>
# GDM2000 / Pahang Grid
<3379> +proj=cass +lat_0=3.769388088888889 +lon_0=102.3682989833333 +x_0=-7368.228 +y_0=6485.858 +ellps=GRS80 +units=m +no_defs  <>
# GDM2000 / Selangor Grid
<3380> +proj=cass +lat_0=3.68464905 +lon_0=101.3891079138889 +x_0=-34836.161 +y_0=56464.049 +ellps=GRS80 +units=m +no_defs  <>
# GDM2000 / Terengganu Grid
<3381> +proj=cass +lat_0=4.9762852 +lon_0=103.070275625 +x_0=19594.245 +y_0=3371.895 +ellps=GRS80 +units=m +no_defs  <>
# GDM2000 / Pinang Grid
<3382> +proj=cass +lat_0=5.421517541666667 +lon_0=100.3443769638889 +x_0=-23.414 +y_0=62.283 +ellps=GRS80 +units=m +no_defs  <>
# GDM2000 / Kedah and Perlis Grid
<3383> +proj=cass +lat_0=5.964672713888889 +lon_0=100.6363711111111 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# GDM2000 / Perak Grid
<3384> +proj=cass +lat_0=4.859063022222222 +lon_0=100.8154105861111 +x_0=-1.769 +y_0=133454.779 +ellps=GRS80 +units=m +no_defs  <>
# GDM2000 / Kelantan Grid
<3385> +proj=cass +lat_0=5.972543658333334 +lon_0=102.2952416694444 +x_0=13227.851 +y_0=8739.894 +ellps=GRS80 +units=m +no_defs  <>
# KKJ / Finland zone 0
<3386> +proj=tmerc +lat_0=0 +lon_0=18 +k=1 +x_0=500000 +y_0=0 +ellps=intl +towgs84=-96.062,-82.428,-121.753,4.801,0.345,-1.376,1.496 +units=m +no_defs  <>
# KKJ / Finland zone 5
<3387> +proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=5500000 +y_0=0 +ellps=intl +towgs84=-96.062,-82.428,-121.753,4.801,0.345,-1.376,1.496 +units=m +no_defs  <>
# Pulkovo 1942 / Caspian Sea Mercator
<3388> +proj=merc +lon_0=51 +lat_ts=42 +x_0=0 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / 3-degree Gauss-Kruger zone 60
<3389> +proj=tmerc +lat_0=0 +lon_0=180 +k=1 +x_0=60500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1995 / 3-degree Gauss-Kruger zone 60
<3390> +proj=tmerc +lat_0=0 +lon_0=180 +k=1 +x_0=60500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Karbala 1979 / UTM zone 37N
<3391> +proj=utm +zone=37 +ellps=clrk80 +towgs84=70.995,-335.916,262.898,0,0,0,0 +units=m +no_defs  <>
# Karbala 1979 / UTM zone 38N
<3392> +proj=utm +zone=38 +ellps=clrk80 +towgs84=70.995,-335.916,262.898,0,0,0,0 +units=m +no_defs  <>
# Karbala 1979 / UTM zone 39N
<3393> +proj=utm +zone=39 +ellps=clrk80 +towgs84=70.995,-335.916,262.898,0,0,0,0 +units=m +no_defs  <>
# Nahrwan 1934 / Iraq zone
<3394> +proj=lcc +lat_1=32.5 +lat_0=32.5 +lon_0=45 +k_0=0.9987864078000001 +x_0=1500000 +y_0=1166200 +ellps=clrk80 +towgs84=-242.2,-144.9,370.3,0,0,0,0 +units=m +no_defs  <>
# WGS 84 / World Mercator
<3395> +proj=merc +lon_0=0 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# PD/83 / 3-degree Gauss-Kruger zone 3
<3396> +proj=tmerc +lat_0=0 +lon_0=9 +k=1 +x_0=3500000 +y_0=0 +ellps=bessel +units=m +no_defs  <>
# PD/83 / 3-degree Gauss-Kruger zone 4
<3397> +proj=tmerc +lat_0=0 +lon_0=12 +k=1 +x_0=4500000 +y_0=0 +ellps=bessel +units=m +no_defs  <>
# RD/83 / 3-degree Gauss-Kruger zone 4
<3398> +proj=tmerc +lat_0=0 +lon_0=12 +k=1 +x_0=4500000 +y_0=0 +ellps=bessel +units=m +no_defs  <>
# RD/83 / 3-degree Gauss-Kruger zone 5
<3399> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=5500000 +y_0=0 +ellps=bessel +units=m +no_defs  <>
# NAD83 / Alberta 10-TM (Forest)
<3400> +proj=tmerc +lat_0=0 +lon_0=-115 +k=0.9992 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Alberta 10-TM (Resource)
<3401> +proj=tmerc +lat_0=0 +lon_0=-115 +k=0.9992 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83(CSRS) / Alberta 10-TM (Forest)
<3402> +proj=tmerc +lat_0=0 +lon_0=-115 +k=0.9992 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / Alberta 10-TM (Resource)
<3403> +proj=tmerc +lat_0=0 +lon_0=-115 +k=0.9992 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / North Carolina (ftUS)
<3404> +proj=lcc +lat_1=36.16666666666666 +lat_2=34.33333333333334 +lat_0=33.75 +lon_0=-79 +x_0=609601.2192024384 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# VN-2000 / UTM zone 48N
<3405> +proj=utm +zone=48 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,0.00928836,-0.01975479,0.00427372,0.252906278 +units=m +no_defs  <>
# VN-2000 / UTM zone 49N
<3406> +proj=utm +zone=49 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,0.00928836,-0.01975479,0.00427372,0.252906278 +units=m +no_defs  <>
# Hong Kong 1963 Grid System
<3407> +proj=cass +lat_0=22.31213333333334 +lon_0=114.1785555555556 +x_0=40243.57775604237 +y_0=19069.93351512578 +a=6378293.645208759 +b=6356617.987679838 +to_meter=0.3047972654 +no_defs  <>
# NSIDC EASE-Grid North
<3408> +proj=laea +lat_0=90 +lon_0=0 +x_0=0 +y_0=0 +a=6371228 +b=6371228 +units=m +no_defs  <>
# NSIDC EASE-Grid South
<3409> +proj=laea +lat_0=-90 +lon_0=0 +x_0=0 +y_0=0 +a=6371228 +b=6371228 +units=m +no_defs  <>
# NSIDC EASE-Grid Global
<3410> +proj=cea +lon_0=0 +lat_ts=30 +x_0=0 +y_0=0 +a=6371228 +b=6371228 +units=m +no_defs  <>
# NSIDC Sea Ice Polar Stereographic North
<3411> +proj=stere +lat_0=90 +lat_ts=70 +lon_0=-45 +k=1 +x_0=0 +y_0=0 +a=6378273 +b=6356889.449 +units=m +no_defs  <>
# NSIDC Sea Ice Polar Stereographic South
<3412> +proj=stere +lat_0=-90 +lat_ts=-70 +lon_0=0 +k=1 +x_0=0 +y_0=0 +a=6378273 +b=6356889.449 +units=m +no_defs  <>
# WGS 84 / NSIDC Sea Ice Polar Stereographic North
<3413> +proj=stere +lat_0=90 +lat_ts=70 +lon_0=-45 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# SVY21 / Singapore TM
<3414> +proj=tmerc +lat_0=1.366666666666667 +lon_0=103.8333333333333 +k=1 +x_0=28001.642 +y_0=38744.572 +ellps=WGS84 +units=m +no_defs  <>
# WGS 72BE / South China Sea Lambert
<3415> +proj=lcc +lat_1=18 +lat_2=24 +lat_0=21 +lon_0=114 +x_0=500000 +y_0=500000 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# ETRS89 / Austria Lambert
<3416> +proj=lcc +lat_1=49 +lat_2=46 +lat_0=47.5 +lon_0=13.33333333333333 +x_0=400000 +y_0=400000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83 / Iowa North (ftUS)
<3417> +proj=lcc +lat_1=43.26666666666667 +lat_2=42.06666666666667 +lat_0=41.5 +lon_0=-93.5 +x_0=1500000 +y_0=999999.9999898402 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Iowa South (ftUS)
<3418> +proj=lcc +lat_1=41.78333333333333 +lat_2=40.61666666666667 +lat_0=40 +lon_0=-93.5 +x_0=500000.00001016 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Kansas North (ftUS)
<3419> +proj=lcc +lat_1=39.78333333333333 +lat_2=38.71666666666667 +lat_0=38.33333333333334 +lon_0=-98 +x_0=399999.99998984 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Kansas South (ftUS)
<3420> +proj=lcc +lat_1=38.56666666666667 +lat_2=37.26666666666667 +lat_0=36.66666666666666 +lon_0=-98.5 +x_0=399999.99998984 +y_0=399999.99998984 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Nevada East (ftUS)
<3421> +proj=tmerc +lat_0=34.75 +lon_0=-115.5833333333333 +k=0.9999 +x_0=200000.00001016 +y_0=8000000.000010163 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Nevada Central (ftUS)
<3422> +proj=tmerc +lat_0=34.75 +lon_0=-116.6666666666667 +k=0.9999 +x_0=500000.00001016 +y_0=6000000 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Nevada West (ftUS)
<3423> +proj=tmerc +lat_0=34.75 +lon_0=-118.5833333333333 +k=0.9999 +x_0=800000.0000101599 +y_0=3999999.99998984 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / New Jersey (ftUS)
<3424> +proj=tmerc +lat_0=38.83333333333334 +lon_0=-74.5 +k=0.9999 +x_0=150000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83(HARN) / Iowa North (ftUS)
<3425> +proj=lcc +lat_1=43.26666666666667 +lat_2=42.06666666666667 +lat_0=41.5 +lon_0=-93.5 +x_0=1500000 +y_0=999999.9999898402 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Iowa South (ftUS)
<3426> +proj=lcc +lat_1=41.78333333333333 +lat_2=40.61666666666667 +lat_0=40 +lon_0=-93.5 +x_0=500000.00001016 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Kansas North (ftUS)
<3427> +proj=lcc +lat_1=39.78333333333333 +lat_2=38.71666666666667 +lat_0=38.33333333333334 +lon_0=-98 +x_0=399999.99998984 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Kansas South (ftUS)
<3428> +proj=lcc +lat_1=38.56666666666667 +lat_2=37.26666666666667 +lat_0=36.66666666666666 +lon_0=-98.5 +x_0=399999.99998984 +y_0=399999.99998984 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Nevada East (ftUS)
<3429> +proj=tmerc +lat_0=34.75 +lon_0=-115.5833333333333 +k=0.9999 +x_0=200000.00001016 +y_0=8000000.000010163 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Nevada Central (ftUS)
<3430> +proj=tmerc +lat_0=34.75 +lon_0=-116.6666666666667 +k=0.9999 +x_0=500000.00001016 +y_0=6000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Nevada West (ftUS)
<3431> +proj=tmerc +lat_0=34.75 +lon_0=-118.5833333333333 +k=0.9999 +x_0=800000.0000101599 +y_0=3999999.99998984 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / New Jersey (ftUS)
<3432> +proj=tmerc +lat_0=38.83333333333334 +lon_0=-74.5 +k=0.9999 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83 / Arkansas North (ftUS)
<3433> +proj=lcc +lat_1=36.23333333333333 +lat_2=34.93333333333333 +lat_0=34.33333333333334 +lon_0=-92 +x_0=399999.99998984 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Arkansas South (ftUS)
<3434> +proj=lcc +lat_1=34.76666666666667 +lat_2=33.3 +lat_0=32.66666666666666 +lon_0=-92 +x_0=399999.99998984 +y_0=399999.99998984 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Illinois East (ftUS)
<3435> +proj=tmerc +lat_0=36.66666666666666 +lon_0=-88.33333333333333 +k=0.9999749999999999 +x_0=300000.0000000001 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Illinois West (ftUS)
<3436> +proj=tmerc +lat_0=36.66666666666666 +lon_0=-90.16666666666667 +k=0.999941177 +x_0=699999.9999898402 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / New Hampshire (ftUS)
<3437> +proj=tmerc +lat_0=42.5 +lon_0=-71.66666666666667 +k=0.999966667 +x_0=300000.0000000001 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Rhode Island (ftUS)
<3438> +proj=tmerc +lat_0=41.08333333333334 +lon_0=-71.5 +k=0.99999375 +x_0=99999.99998983997 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# PSD93 / UTM zone 39N
<3439> +proj=utm +zone=39 +ellps=clrk80 +towgs84=-180.624,-225.516,173.919,-0.81,-1.898,8.336,16.71006 +units=m +no_defs  <>
# PSD93 / UTM zone 40N
<3440> +proj=utm +zone=40 +ellps=clrk80 +towgs84=-180.624,-225.516,173.919,-0.81,-1.898,8.336,16.71006 +units=m +no_defs  <>
# NAD83(HARN) / Arkansas North (ftUS)
<3441> +proj=lcc +lat_1=36.23333333333333 +lat_2=34.93333333333333 +lat_0=34.33333333333334 +lon_0=-92 +x_0=399999.99998984 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Arkansas South (ftUS)
<3442> +proj=lcc +lat_1=34.76666666666667 +lat_2=33.3 +lat_0=32.66666666666666 +lon_0=-92 +x_0=399999.99998984 +y_0=399999.99998984 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Illinois East (ftUS)
<3443> +proj=tmerc +lat_0=36.66666666666666 +lon_0=-88.33333333333333 +k=0.9999749999999999 +x_0=300000.0000000001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Illinois West (ftUS)
<3444> +proj=tmerc +lat_0=36.66666666666666 +lon_0=-90.16666666666667 +k=0.999941177 +x_0=699999.9999898402 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / New Hampshire (ftUS)
<3445> +proj=tmerc +lat_0=42.5 +lon_0=-71.66666666666667 +k=0.999966667 +x_0=300000.0000000001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Rhode Island (ftUS)
<3446> +proj=tmerc +lat_0=41.08333333333334 +lon_0=-71.5 +k=0.99999375 +x_0=99999.99998983997 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# ETRS89 / Belgian Lambert 2005
<3447> +proj=lcc +lat_1=49.83333333333334 +lat_2=51.16666666666666 +lat_0=50.797815 +lon_0=4.359215833333333 +x_0=150328 +y_0=166262 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JAD2001 / Jamaica Metric Grid
<3448> +proj=lcc +lat_1=18 +lat_0=18 +lon_0=-77 +k_0=1 +x_0=750000 +y_0=650000 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JAD2001 / UTM zone 17N
<3449> +proj=utm +zone=17 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# JAD2001 / UTM zone 18N
<3450> +proj=utm +zone=18 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83 / Louisiana North (ftUS)
<3451> +proj=lcc +lat_1=32.66666666666666 +lat_2=31.16666666666667 +lat_0=30.5 +lon_0=-92.5 +x_0=999999.9999898402 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Louisiana South (ftUS)
<3452> +proj=lcc +lat_1=30.7 +lat_2=29.3 +lat_0=28.5 +lon_0=-91.33333333333333 +x_0=999999.9999898402 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Louisiana Offshore (ftUS)
<3453> +proj=lcc +lat_1=27.83333333333333 +lat_2=26.16666666666667 +lat_0=25.5 +lon_0=-91.33333333333333 +x_0=999999.9999898402 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / South Dakota North (ftUS) (deprecated)
<3454> +proj=lcc +lat_1=44.4 +lat_2=42.83333333333334 +lat_0=42.33333333333334 +lon_0=-100.3333333333333 +x_0=600000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / South Dakota South (ftUS)
<3455> +proj=lcc +lat_1=44.4 +lat_2=42.83333333333334 +lat_0=42.33333333333334 +lon_0=-100.3333333333333 +x_0=600000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83(HARN) / Louisiana North (ftUS)
<3456> +proj=lcc +lat_1=32.66666666666666 +lat_2=31.16666666666667 +lat_0=30.5 +lon_0=-92.5 +x_0=999999.9999898402 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Louisiana South (ftUS)
<3457> +proj=lcc +lat_1=30.7 +lat_2=29.3 +lat_0=28.5 +lon_0=-91.33333333333333 +x_0=999999.9999898402 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / South Dakota North (ftUS)
<3458> +proj=lcc +lat_1=45.68333333333333 +lat_2=44.41666666666666 +lat_0=43.83333333333334 +lon_0=-100 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / South Dakota South (ftUS)
<3459> +proj=lcc +lat_1=44.4 +lat_2=42.83333333333334 +lat_0=42.33333333333334 +lon_0=-100.3333333333333 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# Fiji 1986 / Fiji Map Grid
<3460> +proj=tmerc +lat_0=-17 +lon_0=178.75 +k=0.99985 +x_0=2000000 +y_0=4000000 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# Dabola 1981 / UTM zone 28N
<3461> +proj=utm +zone=28 +a=6378249.2 +b=6356515 +towgs84=-83,37,124,0,0,0,0 +units=m +no_defs  <>
# Dabola 1981 / UTM zone 29N
<3462> +proj=utm +zone=29 +a=6378249.2 +b=6356515 +towgs84=-83,37,124,0,0,0,0 +units=m +no_defs  <>
# NAD83 / Maine CS2000 Central
<3463> +proj=tmerc +lat_0=43.5 +lon_0=-69.125 +k=0.99998 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83(HARN) / Maine CS2000 Central
<3464> +proj=tmerc +lat_0=43.5 +lon_0=-69.125 +k=0.99998 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Alabama East
<3465> +proj=tmerc +lat_0=30.5 +lon_0=-85.83333333333333 +k=0.99996 +x_0=200000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Alabama West
<3466> +proj=tmerc +lat_0=30 +lon_0=-87.5 +k=0.999933333 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Alaska Albers
<3467> +proj=aea +lat_1=55 +lat_2=65 +lat_0=50 +lon_0=-154 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Alaska zone 1
<3468> +proj=omerc +lat_0=57 +lonc=-133.6666666666667 +alpha=323.1301023611111 +k=0.9999 +x_0=5000000 +y_0=-5000000 +no_uoff +gamma=323.1301023611111 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Alaska zone 2
<3469> +proj=tmerc +lat_0=54 +lon_0=-142 +k=0.9999 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Alaska zone 3
<3470> +proj=tmerc +lat_0=54 +lon_0=-146 +k=0.9999 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Alaska zone 4
<3471> +proj=tmerc +lat_0=54 +lon_0=-150 +k=0.9999 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Alaska zone 5
<3472> +proj=tmerc +lat_0=54 +lon_0=-154 +k=0.9999 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Alaska zone 6
<3473> +proj=tmerc +lat_0=54 +lon_0=-158 +k=0.9999 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Alaska zone 7
<3474> +proj=tmerc +lat_0=54 +lon_0=-162 +k=0.9999 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Alaska zone 8
<3475> +proj=tmerc +lat_0=54 +lon_0=-166 +k=0.9999 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Alaska zone 9
<3476> +proj=tmerc +lat_0=54 +lon_0=-170 +k=0.9999 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Alaska zone 10
<3477> +proj=lcc +lat_1=53.83333333333334 +lat_2=51.83333333333334 +lat_0=51 +lon_0=-176 +x_0=1000000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Arizona Central
<3478> +proj=tmerc +lat_0=31 +lon_0=-111.9166666666667 +k=0.9999 +x_0=213360 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Arizona Central (ft)
<3479> +proj=tmerc +lat_0=31 +lon_0=-111.9166666666667 +k=0.9999 +x_0=213360 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(NSRS2007) / Arizona East
<3480> +proj=tmerc +lat_0=31 +lon_0=-110.1666666666667 +k=0.9999 +x_0=213360 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Arizona East (ft)
<3481> +proj=tmerc +lat_0=31 +lon_0=-110.1666666666667 +k=0.9999 +x_0=213360 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(NSRS2007) / Arizona West
<3482> +proj=tmerc +lat_0=31 +lon_0=-113.75 +k=0.999933333 +x_0=213360 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Arizona West (ft)
<3483> +proj=tmerc +lat_0=31 +lon_0=-113.75 +k=0.999933333 +x_0=213360 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(NSRS2007) / Arkansas North
<3484> +proj=lcc +lat_1=36.23333333333333 +lat_2=34.93333333333333 +lat_0=34.33333333333334 +lon_0=-92 +x_0=400000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Arkansas North (ftUS)
<3485> +proj=lcc +lat_1=36.23333333333333 +lat_2=34.93333333333333 +lat_0=34.33333333333334 +lon_0=-92 +x_0=399999.99998984 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Arkansas South
<3486> +proj=lcc +lat_1=34.76666666666667 +lat_2=33.3 +lat_0=32.66666666666666 +lon_0=-92 +x_0=400000 +y_0=400000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Arkansas South (ftUS)
<3487> +proj=lcc +lat_1=34.76666666666667 +lat_2=33.3 +lat_0=32.66666666666666 +lon_0=-92 +x_0=399999.99998984 +y_0=399999.99998984 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / California Albers
<3488> +proj=aea +lat_1=34 +lat_2=40.5 +lat_0=0 +lon_0=-120 +x_0=0 +y_0=-4000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / California zone 1
<3489> +proj=lcc +lat_1=41.66666666666666 +lat_2=40 +lat_0=39.33333333333334 +lon_0=-122 +x_0=2000000 +y_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / California zone 1 (ftUS)
<3490> +proj=lcc +lat_1=41.66666666666666 +lat_2=40 +lat_0=39.33333333333334 +lon_0=-122 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / California zone 2
<3491> +proj=lcc +lat_1=39.83333333333334 +lat_2=38.33333333333334 +lat_0=37.66666666666666 +lon_0=-122 +x_0=2000000 +y_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / California zone 2 (ftUS)
<3492> +proj=lcc +lat_1=39.83333333333334 +lat_2=38.33333333333334 +lat_0=37.66666666666666 +lon_0=-122 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / California zone 3
<3493> +proj=lcc +lat_1=38.43333333333333 +lat_2=37.06666666666667 +lat_0=36.5 +lon_0=-120.5 +x_0=2000000 +y_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / California zone 3 (ftUS)
<3494> +proj=lcc +lat_1=38.43333333333333 +lat_2=37.06666666666667 +lat_0=36.5 +lon_0=-120.5 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / California zone 4
<3495> +proj=lcc +lat_1=37.25 +lat_2=36 +lat_0=35.33333333333334 +lon_0=-119 +x_0=2000000 +y_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / California zone 4 (ftUS)
<3496> +proj=lcc +lat_1=37.25 +lat_2=36 +lat_0=35.33333333333334 +lon_0=-119 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / California zone 5
<3497> +proj=lcc +lat_1=35.46666666666667 +lat_2=34.03333333333333 +lat_0=33.5 +lon_0=-118 +x_0=2000000 +y_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / California zone 5 (ftUS)
<3498> +proj=lcc +lat_1=35.46666666666667 +lat_2=34.03333333333333 +lat_0=33.5 +lon_0=-118 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / California zone 6
<3499> +proj=lcc +lat_1=33.88333333333333 +lat_2=32.78333333333333 +lat_0=32.16666666666666 +lon_0=-116.25 +x_0=2000000 +y_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / California zone 6 (ftUS)
<3500> +proj=lcc +lat_1=33.88333333333333 +lat_2=32.78333333333333 +lat_0=32.16666666666666 +lon_0=-116.25 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Colorado Central
<3501> +proj=lcc +lat_1=39.75 +lat_2=38.45 +lat_0=37.83333333333334 +lon_0=-105.5 +x_0=914401.8289 +y_0=304800.6096 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Colorado Central (ftUS)
<3502> +proj=lcc +lat_1=39.75 +lat_2=38.45 +lat_0=37.83333333333334 +lon_0=-105.5 +x_0=914401.8288036576 +y_0=304800.6096012192 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Colorado North
<3503> +proj=lcc +lat_1=40.78333333333333 +lat_2=39.71666666666667 +lat_0=39.33333333333334 +lon_0=-105.5 +x_0=914401.8289 +y_0=304800.6096 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Colorado North (ftUS)
<3504> +proj=lcc +lat_1=40.78333333333333 +lat_2=39.71666666666667 +lat_0=39.33333333333334 +lon_0=-105.5 +x_0=914401.8288036576 +y_0=304800.6096012192 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Colorado South
<3505> +proj=lcc +lat_1=38.43333333333333 +lat_2=37.23333333333333 +lat_0=36.66666666666666 +lon_0=-105.5 +x_0=914401.8289 +y_0=304800.6096 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Colorado South (ftUS)
<3506> +proj=lcc +lat_1=38.43333333333333 +lat_2=37.23333333333333 +lat_0=36.66666666666666 +lon_0=-105.5 +x_0=914401.8288036576 +y_0=304800.6096012192 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Connecticut
<3507> +proj=lcc +lat_1=41.86666666666667 +lat_2=41.2 +lat_0=40.83333333333334 +lon_0=-72.75 +x_0=304800.6096 +y_0=152400.3048 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Connecticut (ftUS)
<3508> +proj=lcc +lat_1=41.86666666666667 +lat_2=41.2 +lat_0=40.83333333333334 +lon_0=-72.75 +x_0=304800.6096012192 +y_0=152400.3048006096 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Delaware
<3509> +proj=tmerc +lat_0=38 +lon_0=-75.41666666666667 +k=0.999995 +x_0=200000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Delaware (ftUS)
<3510> +proj=tmerc +lat_0=38 +lon_0=-75.41666666666667 +k=0.999995 +x_0=200000.0001016002 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Florida East
<3511> +proj=tmerc +lat_0=24.33333333333333 +lon_0=-81 +k=0.999941177 +x_0=200000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Florida East (ftUS)
<3512> +proj=tmerc +lat_0=24.33333333333333 +lon_0=-81 +k=0.999941177 +x_0=200000.0001016002 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Florida GDL Albers
<3513> +proj=aea +lat_1=24 +lat_2=31.5 +lat_0=24 +lon_0=-84 +x_0=400000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Florida North
<3514> +proj=lcc +lat_1=30.75 +lat_2=29.58333333333333 +lat_0=29 +lon_0=-84.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Florida North (ftUS)
<3515> +proj=lcc +lat_1=30.75 +lat_2=29.58333333333333 +lat_0=29 +lon_0=-84.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Florida West
<3516> +proj=tmerc +lat_0=24.33333333333333 +lon_0=-82 +k=0.999941177 +x_0=200000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Florida West (ftUS)
<3517> +proj=tmerc +lat_0=24.33333333333333 +lon_0=-82 +k=0.999941177 +x_0=200000.0001016002 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Georgia East
<3518> +proj=tmerc +lat_0=30 +lon_0=-82.16666666666667 +k=0.9999 +x_0=200000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Georgia East (ftUS)
<3519> +proj=tmerc +lat_0=30 +lon_0=-82.16666666666667 +k=0.9999 +x_0=200000.0001016002 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Georgia West
<3520> +proj=tmerc +lat_0=30 +lon_0=-84.16666666666667 +k=0.9999 +x_0=700000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Georgia West (ftUS)
<3521> +proj=tmerc +lat_0=30 +lon_0=-84.16666666666667 +k=0.9999 +x_0=699999.9998983998 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Idaho Central
<3522> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-114 +k=0.9999473679999999 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Idaho Central (ftUS)
<3523> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-114 +k=0.9999473679999999 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Idaho East
<3524> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-112.1666666666667 +k=0.9999473679999999 +x_0=200000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Idaho East (ftUS)
<3525> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-112.1666666666667 +k=0.9999473679999999 +x_0=200000.0001016002 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Idaho West
<3526> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-115.75 +k=0.999933333 +x_0=800000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Idaho West (ftUS)
<3527> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-115.75 +k=0.999933333 +x_0=800000.0001016001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Illinois East
<3528> +proj=tmerc +lat_0=36.66666666666666 +lon_0=-88.33333333333333 +k=0.9999749999999999 +x_0=300000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Illinois East (ftUS)
<3529> +proj=tmerc +lat_0=36.66666666666666 +lon_0=-88.33333333333333 +k=0.9999749999999999 +x_0=300000.0000000001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Illinois West
<3530> +proj=tmerc +lat_0=36.66666666666666 +lon_0=-90.16666666666667 +k=0.999941177 +x_0=700000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Illinois West (ftUS)
<3531> +proj=tmerc +lat_0=36.66666666666666 +lon_0=-90.16666666666667 +k=0.999941177 +x_0=699999.9999898402 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Indiana East
<3532> +proj=tmerc +lat_0=37.5 +lon_0=-85.66666666666667 +k=0.999966667 +x_0=100000 +y_0=250000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Indiana East (ftUS)
<3533> +proj=tmerc +lat_0=37.5 +lon_0=-85.66666666666667 +k=0.999966667 +x_0=99999.99989839978 +y_0=249999.9998983998 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Indiana West
<3534> +proj=tmerc +lat_0=37.5 +lon_0=-87.08333333333333 +k=0.999966667 +x_0=900000 +y_0=250000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Indiana West (ftUS)
<3535> +proj=tmerc +lat_0=37.5 +lon_0=-87.08333333333333 +k=0.999966667 +x_0=900000 +y_0=249999.9998983998 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Iowa North
<3536> +proj=lcc +lat_1=43.26666666666667 +lat_2=42.06666666666667 +lat_0=41.5 +lon_0=-93.5 +x_0=1500000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Iowa North (ftUS)
<3537> +proj=lcc +lat_1=43.26666666666667 +lat_2=42.06666666666667 +lat_0=41.5 +lon_0=-93.5 +x_0=1500000 +y_0=999999.9999898402 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Iowa South
<3538> +proj=lcc +lat_1=41.78333333333333 +lat_2=40.61666666666667 +lat_0=40 +lon_0=-93.5 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Iowa South (ftUS)
<3539> +proj=lcc +lat_1=41.78333333333333 +lat_2=40.61666666666667 +lat_0=40 +lon_0=-93.5 +x_0=500000.00001016 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Kansas North
<3540> +proj=lcc +lat_1=39.78333333333333 +lat_2=38.71666666666667 +lat_0=38.33333333333334 +lon_0=-98 +x_0=400000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Kansas North (ftUS)
<3541> +proj=lcc +lat_1=39.78333333333333 +lat_2=38.71666666666667 +lat_0=38.33333333333334 +lon_0=-98 +x_0=399999.99998984 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Kansas South
<3542> +proj=lcc +lat_1=38.56666666666667 +lat_2=37.26666666666667 +lat_0=36.66666666666666 +lon_0=-98.5 +x_0=400000 +y_0=400000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Kansas South (ftUS)
<3543> +proj=lcc +lat_1=38.56666666666667 +lat_2=37.26666666666667 +lat_0=36.66666666666666 +lon_0=-98.5 +x_0=399999.99998984 +y_0=399999.99998984 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Kentucky North
<3544> +proj=lcc +lat_1=37.96666666666667 +lat_2=38.96666666666667 +lat_0=37.5 +lon_0=-84.25 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Kentucky North (ftUS)
<3545> +proj=lcc +lat_1=37.96666666666667 +lat_2=38.96666666666667 +lat_0=37.5 +lon_0=-84.25 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Kentucky Single Zone
<3546> +proj=lcc +lat_1=37.08333333333334 +lat_2=38.66666666666666 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=1500000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Kentucky Single Zone (ftUS)
<3547> +proj=lcc +lat_1=37.08333333333334 +lat_2=38.66666666666666 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=1500000 +y_0=999999.9998983998 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Kentucky South
<3548> +proj=lcc +lat_1=37.93333333333333 +lat_2=36.73333333333333 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=500000 +y_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Kentucky South (ftUS)
<3549> +proj=lcc +lat_1=37.93333333333333 +lat_2=36.73333333333333 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=500000.0001016001 +y_0=500000.0001016001 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Louisiana North
<3550> +proj=lcc +lat_1=32.66666666666666 +lat_2=31.16666666666667 +lat_0=30.5 +lon_0=-92.5 +x_0=1000000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Louisiana North (ftUS)
<3551> +proj=lcc +lat_1=32.66666666666666 +lat_2=31.16666666666667 +lat_0=30.5 +lon_0=-92.5 +x_0=999999.9999898402 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Louisiana South
<3552> +proj=lcc +lat_1=30.7 +lat_2=29.3 +lat_0=28.5 +lon_0=-91.33333333333333 +x_0=1000000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Louisiana South (ftUS)
<3553> +proj=lcc +lat_1=30.7 +lat_2=29.3 +lat_0=28.5 +lon_0=-91.33333333333333 +x_0=999999.9999898402 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Maine CS2000 Central
<3554> +proj=tmerc +lat_0=43.5 +lon_0=-69.125 +k=0.99998 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Maine CS2000 East
<3555> +proj=tmerc +lat_0=43.83333333333334 +lon_0=-67.875 +k=0.99998 +x_0=700000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Maine CS2000 West
<3556> +proj=tmerc +lat_0=42.83333333333334 +lon_0=-70.375 +k=0.99998 +x_0=300000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Maine East
<3557> +proj=tmerc +lat_0=43.66666666666666 +lon_0=-68.5 +k=0.9999 +x_0=300000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Maine West
<3558> +proj=tmerc +lat_0=42.83333333333334 +lon_0=-70.16666666666667 +k=0.999966667 +x_0=900000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Maryland
<3559> +proj=lcc +lat_1=39.45 +lat_2=38.3 +lat_0=37.66666666666666 +lon_0=-77 +x_0=400000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83 / Utah North (ftUS)
<3560> +proj=lcc +lat_1=41.78333333333333 +lat_2=40.71666666666667 +lat_0=40.33333333333334 +lon_0=-111.5 +x_0=500000.00001016 +y_0=999999.9999898402 +datum=NAD83 +units=us-ft +no_defs  <>
# Old Hawaiian / Hawaii zone 1
<3561> +proj=tmerc +lat_0=18.83333333333333 +lon_0=-155.5 +k=0.999966667 +x_0=152400.3048006096 +y_0=0 +ellps=clrk66 +towgs84=61,-285,-181,0,0,0,0 +units=us-ft +no_defs  <>
# Old Hawaiian / Hawaii zone 2
<3562> +proj=tmerc +lat_0=20.33333333333333 +lon_0=-156.6666666666667 +k=0.999966667 +x_0=152400.3048006096 +y_0=0 +ellps=clrk66 +towgs84=61,-285,-181,0,0,0,0 +units=us-ft +no_defs  <>
# Old Hawaiian / Hawaii zone 3
<3563> +proj=tmerc +lat_0=21.16666666666667 +lon_0=-158 +k=0.99999 +x_0=152400.3048006096 +y_0=0 +ellps=clrk66 +towgs84=61,-285,-181,0,0,0,0 +units=us-ft +no_defs  <>
# Old Hawaiian / Hawaii zone 4
<3564> +proj=tmerc +lat_0=21.83333333333333 +lon_0=-159.5 +k=0.99999 +x_0=152400.3048006096 +y_0=0 +ellps=clrk66 +towgs84=61,-285,-181,0,0,0,0 +units=us-ft +no_defs  <>
# Old Hawaiian / Hawaii zone 5
<3565> +proj=tmerc +lat_0=21.66666666666667 +lon_0=-160.1666666666667 +k=1 +x_0=152400.3048006096 +y_0=0 +ellps=clrk66 +towgs84=61,-285,-181,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83 / Utah Central (ftUS)
<3566> +proj=lcc +lat_1=40.65 +lat_2=39.01666666666667 +lat_0=38.33333333333334 +lon_0=-111.5 +x_0=500000.00001016 +y_0=2000000.00001016 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Utah South (ftUS)
<3567> +proj=lcc +lat_1=38.35 +lat_2=37.21666666666667 +lat_0=36.66666666666666 +lon_0=-111.5 +x_0=500000.00001016 +y_0=3000000 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83(HARN) / Utah North (ftUS)
<3568> +proj=lcc +lat_1=41.78333333333333 +lat_2=40.71666666666667 +lat_0=40.33333333333334 +lon_0=-111.5 +x_0=500000.00001016 +y_0=999999.9999898402 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Utah Central (ftUS)
<3569> +proj=lcc +lat_1=40.65 +lat_2=39.01666666666667 +lat_0=38.33333333333334 +lon_0=-111.5 +x_0=500000.00001016 +y_0=2000000.00001016 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Utah South (ftUS)
<3570> +proj=lcc +lat_1=38.35 +lat_2=37.21666666666667 +lat_0=36.66666666666666 +lon_0=-111.5 +x_0=500000.00001016 +y_0=3000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# WGS 84 / North Pole LAEA Bering Sea
<3571> +proj=laea +lat_0=90 +lon_0=180 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / North Pole LAEA Alaska
<3572> +proj=laea +lat_0=90 +lon_0=-150 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / North Pole LAEA Canada
<3573> +proj=laea +lat_0=90 +lon_0=-100 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / North Pole LAEA Atlantic
<3574> +proj=laea +lat_0=90 +lon_0=-40 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / North Pole LAEA Europe
<3575> +proj=laea +lat_0=90 +lon_0=10 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / North Pole LAEA Russia
<3576> +proj=laea +lat_0=90 +lon_0=90 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# GDA94 / Australian Albers
<3577> +proj=aea +lat_1=-18 +lat_2=-36 +lat_0=0 +lon_0=132 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83 / Yukon Albers
<3578> +proj=aea +lat_1=61.66666666666666 +lat_2=68 +lat_0=59 +lon_0=-132.5 +x_0=500000 +y_0=500000 +datum=NAD83 +units=m +no_defs  <>
# NAD83(CSRS) / Yukon Albers
<3579> +proj=aea +lat_1=61.66666666666666 +lat_2=68 +lat_0=59 +lon_0=-132.5 +x_0=500000 +y_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83 / NWT Lambert
<3580> +proj=lcc +lat_1=62 +lat_2=70 +lat_0=0 +lon_0=-112 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83(CSRS) / NWT Lambert
<3581> +proj=lcc +lat_1=62 +lat_2=70 +lat_0=0 +lon_0=-112 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Maryland (ftUS)
<3582> +proj=lcc +lat_1=39.45 +lat_2=38.3 +lat_0=37.66666666666666 +lon_0=-77 +x_0=399999.9998983998 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Massachusetts Island
<3583> +proj=lcc +lat_1=41.48333333333333 +lat_2=41.28333333333333 +lat_0=41 +lon_0=-70.5 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Massachusetts Island (ftUS)
<3584> +proj=lcc +lat_1=41.48333333333333 +lat_2=41.28333333333333 +lat_0=41 +lon_0=-70.5 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Massachusetts Mainland
<3585> +proj=lcc +lat_1=42.68333333333333 +lat_2=41.71666666666667 +lat_0=41 +lon_0=-71.5 +x_0=200000 +y_0=750000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Massachusetts Mainland (ftUS)
<3586> +proj=lcc +lat_1=42.68333333333333 +lat_2=41.71666666666667 +lat_0=41 +lon_0=-71.5 +x_0=200000.0001016002 +y_0=750000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Michigan Central
<3587> +proj=lcc +lat_1=45.7 +lat_2=44.18333333333333 +lat_0=43.31666666666667 +lon_0=-84.36666666666666 +x_0=6000000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Michigan Central (ft)
<3588> +proj=lcc +lat_1=45.7 +lat_2=44.18333333333333 +lat_0=43.31666666666667 +lon_0=-84.36666666666666 +x_0=5999999.999976001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(NSRS2007) / Michigan North
<3589> +proj=lcc +lat_1=47.08333333333334 +lat_2=45.48333333333333 +lat_0=44.78333333333333 +lon_0=-87 +x_0=8000000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Michigan North (ft)
<3590> +proj=lcc +lat_1=47.08333333333334 +lat_2=45.48333333333333 +lat_0=44.78333333333333 +lon_0=-87 +x_0=7999999.999968001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(NSRS2007) / Michigan Oblique Mercator
<3591> +proj=omerc +lat_0=45.30916666666666 +lonc=-86 +alpha=337.25556 +k=0.9996 +x_0=2546731.496 +y_0=-4354009.816 +no_uoff +gamma=337.25556 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Michigan South
<3592> +proj=lcc +lat_1=43.66666666666666 +lat_2=42.1 +lat_0=41.5 +lon_0=-84.36666666666666 +x_0=4000000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Michigan South (ft)
<3593> +proj=lcc +lat_1=43.66666666666666 +lat_2=42.1 +lat_0=41.5 +lon_0=-84.36666666666666 +x_0=3999999.999984 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(NSRS2007) / Minnesota Central
<3594> +proj=lcc +lat_1=47.05 +lat_2=45.61666666666667 +lat_0=45 +lon_0=-94.25 +x_0=800000 +y_0=100000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Minnesota North
<3595> +proj=lcc +lat_1=48.63333333333333 +lat_2=47.03333333333333 +lat_0=46.5 +lon_0=-93.09999999999999 +x_0=800000 +y_0=100000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Minnesota South
<3596> +proj=lcc +lat_1=45.21666666666667 +lat_2=43.78333333333333 +lat_0=43 +lon_0=-94 +x_0=800000 +y_0=100000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Mississippi East
<3597> +proj=tmerc +lat_0=29.5 +lon_0=-88.83333333333333 +k=0.99995 +x_0=300000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Mississippi East (ftUS)
<3598> +proj=tmerc +lat_0=29.5 +lon_0=-88.83333333333333 +k=0.99995 +x_0=300000.0000000001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Mississippi West
<3599> +proj=tmerc +lat_0=29.5 +lon_0=-90.33333333333333 +k=0.99995 +x_0=700000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Mississippi West (ftUS)
<3600> +proj=tmerc +lat_0=29.5 +lon_0=-90.33333333333333 +k=0.99995 +x_0=699999.9998983998 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Missouri Central
<3601> +proj=tmerc +lat_0=35.83333333333334 +lon_0=-92.5 +k=0.999933333 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Missouri East
<3602> +proj=tmerc +lat_0=35.83333333333334 +lon_0=-90.5 +k=0.999933333 +x_0=250000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Missouri West
<3603> +proj=tmerc +lat_0=36.16666666666666 +lon_0=-94.5 +k=0.999941177 +x_0=850000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Montana
<3604> +proj=lcc +lat_1=49 +lat_2=45 +lat_0=44.25 +lon_0=-109.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Montana (ft)
<3605> +proj=lcc +lat_1=49 +lat_2=45 +lat_0=44.25 +lon_0=-109.5 +x_0=599999.9999976 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(NSRS2007) / Nebraska
<3606> +proj=lcc +lat_1=43 +lat_2=40 +lat_0=39.83333333333334 +lon_0=-100 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Nevada Central
<3607> +proj=tmerc +lat_0=34.75 +lon_0=-116.6666666666667 +k=0.9999 +x_0=500000 +y_0=6000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Nevada Central (ftUS)
<3608> +proj=tmerc +lat_0=34.75 +lon_0=-116.6666666666667 +k=0.9999 +x_0=500000.00001016 +y_0=6000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Nevada East
<3609> +proj=tmerc +lat_0=34.75 +lon_0=-115.5833333333333 +k=0.9999 +x_0=200000 +y_0=8000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Nevada East (ftUS)
<3610> +proj=tmerc +lat_0=34.75 +lon_0=-115.5833333333333 +k=0.9999 +x_0=200000.00001016 +y_0=8000000.000010163 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Nevada West
<3611> +proj=tmerc +lat_0=34.75 +lon_0=-118.5833333333333 +k=0.9999 +x_0=800000 +y_0=4000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Nevada West (ftUS)
<3612> +proj=tmerc +lat_0=34.75 +lon_0=-118.5833333333333 +k=0.9999 +x_0=800000.0000101599 +y_0=3999999.99998984 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / New Hampshire
<3613> +proj=tmerc +lat_0=42.5 +lon_0=-71.66666666666667 +k=0.999966667 +x_0=300000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / New Hampshire (ftUS)
<3614> +proj=tmerc +lat_0=42.5 +lon_0=-71.66666666666667 +k=0.999966667 +x_0=300000.0000000001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / New Jersey
<3615> +proj=tmerc +lat_0=38.83333333333334 +lon_0=-74.5 +k=0.9999 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / New Jersey (ftUS)
<3616> +proj=tmerc +lat_0=38.83333333333334 +lon_0=-74.5 +k=0.9999 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / New Mexico Central
<3617> +proj=tmerc +lat_0=31 +lon_0=-106.25 +k=0.9999 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / New Mexico Central (ftUS)
<3618> +proj=tmerc +lat_0=31 +lon_0=-106.25 +k=0.9999 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / New Mexico East
<3619> +proj=tmerc +lat_0=31 +lon_0=-104.3333333333333 +k=0.999909091 +x_0=165000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / New Mexico East (ftUS)
<3620> +proj=tmerc +lat_0=31 +lon_0=-104.3333333333333 +k=0.999909091 +x_0=165000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / New Mexico West
<3621> +proj=tmerc +lat_0=31 +lon_0=-107.8333333333333 +k=0.999916667 +x_0=830000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / New Mexico West (ftUS)
<3622> +proj=tmerc +lat_0=31 +lon_0=-107.8333333333333 +k=0.999916667 +x_0=830000.0001016001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / New York Central
<3623> +proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=250000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / New York Central (ftUS)
<3624> +proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=249999.9998983998 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / New York East
<3625> +proj=tmerc +lat_0=38.83333333333334 +lon_0=-74.5 +k=0.9999 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / New York East (ftUS)
<3626> +proj=tmerc +lat_0=38.83333333333334 +lon_0=-74.5 +k=0.9999 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / New York Long Island
<3627> +proj=lcc +lat_1=41.03333333333333 +lat_2=40.66666666666666 +lat_0=40.16666666666666 +lon_0=-74 +x_0=300000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / New York Long Island (ftUS)
<3628> +proj=lcc +lat_1=41.03333333333333 +lat_2=40.66666666666666 +lat_0=40.16666666666666 +lon_0=-74 +x_0=300000.0000000001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / New York West
<3629> +proj=tmerc +lat_0=40 +lon_0=-78.58333333333333 +k=0.9999375 +x_0=350000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / New York West (ftUS)
<3630> +proj=tmerc +lat_0=40 +lon_0=-78.58333333333333 +k=0.9999375 +x_0=350000.0001016001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / North Carolina
<3631> +proj=lcc +lat_1=36.16666666666666 +lat_2=34.33333333333334 +lat_0=33.75 +lon_0=-79 +x_0=609601.22 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / North Carolina (ftUS)
<3632> +proj=lcc +lat_1=36.16666666666666 +lat_2=34.33333333333334 +lat_0=33.75 +lon_0=-79 +x_0=609601.2192024384 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / North Dakota North
<3633> +proj=lcc +lat_1=48.73333333333333 +lat_2=47.43333333333333 +lat_0=47 +lon_0=-100.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / North Dakota North (ft)
<3634> +proj=lcc +lat_1=48.73333333333333 +lat_2=47.43333333333333 +lat_0=47 +lon_0=-100.5 +x_0=599999.9999976 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(NSRS2007) / North Dakota South
<3635> +proj=lcc +lat_1=47.48333333333333 +lat_2=46.18333333333333 +lat_0=45.66666666666666 +lon_0=-100.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / North Dakota South (ft)
<3636> +proj=lcc +lat_1=47.48333333333333 +lat_2=46.18333333333333 +lat_0=45.66666666666666 +lon_0=-100.5 +x_0=599999.9999976 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(NSRS2007) / Ohio North
<3637> +proj=lcc +lat_1=41.7 +lat_2=40.43333333333333 +lat_0=39.66666666666666 +lon_0=-82.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Ohio South
<3638> +proj=lcc +lat_1=40.03333333333333 +lat_2=38.73333333333333 +lat_0=38 +lon_0=-82.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Oklahoma North
<3639> +proj=lcc +lat_1=36.76666666666667 +lat_2=35.56666666666667 +lat_0=35 +lon_0=-98 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Oklahoma North (ftUS)
<3640> +proj=lcc +lat_1=36.76666666666667 +lat_2=35.56666666666667 +lat_0=35 +lon_0=-98 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Oklahoma South
<3641> +proj=lcc +lat_1=35.23333333333333 +lat_2=33.93333333333333 +lat_0=33.33333333333334 +lon_0=-98 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Oklahoma South (ftUS)
<3642> +proj=lcc +lat_1=35.23333333333333 +lat_2=33.93333333333333 +lat_0=33.33333333333334 +lon_0=-98 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Oregon LCC (m)
<3643> +proj=lcc +lat_1=43 +lat_2=45.5 +lat_0=41.75 +lon_0=-120.5 +x_0=400000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Oregon GIC Lambert (ft)
<3644> +proj=lcc +lat_1=43 +lat_2=45.5 +lat_0=41.75 +lon_0=-120.5 +x_0=399999.9999984 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(NSRS2007) / Oregon North
<3645> +proj=lcc +lat_1=46 +lat_2=44.33333333333334 +lat_0=43.66666666666666 +lon_0=-120.5 +x_0=2500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Oregon North (ft)
<3646> +proj=lcc +lat_1=46 +lat_2=44.33333333333334 +lat_0=43.66666666666666 +lon_0=-120.5 +x_0=2500000.0001424 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(NSRS2007) / Oregon South
<3647> +proj=lcc +lat_1=44 +lat_2=42.33333333333334 +lat_0=41.66666666666666 +lon_0=-120.5 +x_0=1500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Oregon South (ft)
<3648> +proj=lcc +lat_1=44 +lat_2=42.33333333333334 +lat_0=41.66666666666666 +lon_0=-120.5 +x_0=1500000.0001464 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(NSRS2007) / Pennsylvania North
<3649> +proj=lcc +lat_1=41.95 +lat_2=40.88333333333333 +lat_0=40.16666666666666 +lon_0=-77.75 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Pennsylvania North (ftUS)
<3650> +proj=lcc +lat_1=41.95 +lat_2=40.88333333333333 +lat_0=40.16666666666666 +lon_0=-77.75 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Pennsylvania South
<3651> +proj=lcc +lat_1=40.96666666666667 +lat_2=39.93333333333333 +lat_0=39.33333333333334 +lon_0=-77.75 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Pennsylvania South (ftUS)
<3652> +proj=lcc +lat_1=40.96666666666667 +lat_2=39.93333333333333 +lat_0=39.33333333333334 +lon_0=-77.75 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Rhode Island
<3653> +proj=tmerc +lat_0=41.08333333333334 +lon_0=-71.5 +k=0.99999375 +x_0=100000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Rhode Island (ftUS)
<3654> +proj=tmerc +lat_0=41.08333333333334 +lon_0=-71.5 +k=0.99999375 +x_0=99999.99998983997 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / South Carolina
<3655> +proj=lcc +lat_1=34.83333333333334 +lat_2=32.5 +lat_0=31.83333333333333 +lon_0=-81 +x_0=609600 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / South Carolina (ft)
<3656> +proj=lcc +lat_1=34.83333333333334 +lat_2=32.5 +lat_0=31.83333333333333 +lon_0=-81 +x_0=609600 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(NSRS2007) / South Dakota North
<3657> +proj=lcc +lat_1=45.68333333333333 +lat_2=44.41666666666666 +lat_0=43.83333333333334 +lon_0=-100 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / South Dakota North (ftUS)
<3658> +proj=lcc +lat_1=45.68333333333333 +lat_2=44.41666666666666 +lat_0=43.83333333333334 +lon_0=-100 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / South Dakota South
<3659> +proj=lcc +lat_1=44.4 +lat_2=42.83333333333334 +lat_0=42.33333333333334 +lon_0=-100.3333333333333 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / South Dakota South (ftUS)
<3660> +proj=lcc +lat_1=44.4 +lat_2=42.83333333333334 +lat_0=42.33333333333334 +lon_0=-100.3333333333333 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Tennessee
<3661> +proj=lcc +lat_1=36.41666666666666 +lat_2=35.25 +lat_0=34.33333333333334 +lon_0=-86 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Tennessee (ftUS)
<3662> +proj=lcc +lat_1=36.41666666666666 +lat_2=35.25 +lat_0=34.33333333333334 +lon_0=-86 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Texas Central
<3663> +proj=lcc +lat_1=31.88333333333333 +lat_2=30.11666666666667 +lat_0=29.66666666666667 +lon_0=-100.3333333333333 +x_0=700000 +y_0=3000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Texas Central (ftUS)
<3664> +proj=lcc +lat_1=31.88333333333333 +lat_2=30.11666666666667 +lat_0=29.66666666666667 +lon_0=-100.3333333333333 +x_0=699999.9998983998 +y_0=3000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Texas Centric Albers Equal Area
<3665> +proj=aea +lat_1=27.5 +lat_2=35 +lat_0=18 +lon_0=-100 +x_0=1500000 +y_0=6000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Texas Centric Lambert Conformal
<3666> +proj=lcc +lat_1=27.5 +lat_2=35 +lat_0=18 +lon_0=-100 +x_0=1500000 +y_0=5000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Texas North
<3667> +proj=lcc +lat_1=36.18333333333333 +lat_2=34.65 +lat_0=34 +lon_0=-101.5 +x_0=200000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Texas North (ftUS)
<3668> +proj=lcc +lat_1=36.18333333333333 +lat_2=34.65 +lat_0=34 +lon_0=-101.5 +x_0=200000.0001016002 +y_0=999999.9998983998 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Texas North Central
<3669> +proj=lcc +lat_1=33.96666666666667 +lat_2=32.13333333333333 +lat_0=31.66666666666667 +lon_0=-98.5 +x_0=600000 +y_0=2000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Texas North Central (ftUS)
<3670> +proj=lcc +lat_1=33.96666666666667 +lat_2=32.13333333333333 +lat_0=31.66666666666667 +lon_0=-98.5 +x_0=600000 +y_0=2000000.0001016 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Texas South
<3671> +proj=lcc +lat_1=27.83333333333333 +lat_2=26.16666666666667 +lat_0=25.66666666666667 +lon_0=-98.5 +x_0=300000 +y_0=5000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Texas South (ftUS)
<3672> +proj=lcc +lat_1=27.83333333333333 +lat_2=26.16666666666667 +lat_0=25.66666666666667 +lon_0=-98.5 +x_0=300000.0000000001 +y_0=5000000.0001016 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Texas South Central
<3673> +proj=lcc +lat_1=30.28333333333333 +lat_2=28.38333333333333 +lat_0=27.83333333333333 +lon_0=-99 +x_0=600000 +y_0=4000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Texas South Central (ftUS)
<3674> +proj=lcc +lat_1=30.28333333333333 +lat_2=28.38333333333333 +lat_0=27.83333333333333 +lon_0=-99 +x_0=600000 +y_0=3999999.9998984 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Utah Central
<3675> +proj=lcc +lat_1=40.65 +lat_2=39.01666666666667 +lat_0=38.33333333333334 +lon_0=-111.5 +x_0=500000 +y_0=2000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Utah Central (ft)
<3676> +proj=lcc +lat_1=40.65 +lat_2=39.01666666666667 +lat_0=38.33333333333334 +lon_0=-111.5 +x_0=500000.0001504 +y_0=1999999.999992 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(NSRS2007) / Utah Central (ftUS)
<3677> +proj=lcc +lat_1=40.65 +lat_2=39.01666666666667 +lat_0=38.33333333333334 +lon_0=-111.5 +x_0=500000.00001016 +y_0=2000000.00001016 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Utah North
<3678> +proj=lcc +lat_1=41.78333333333333 +lat_2=40.71666666666667 +lat_0=40.33333333333334 +lon_0=-111.5 +x_0=500000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Utah North (ft)
<3679> +proj=lcc +lat_1=41.78333333333333 +lat_2=40.71666666666667 +lat_0=40.33333333333334 +lon_0=-111.5 +x_0=500000.0001504 +y_0=999999.9999960001 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(NSRS2007) / Utah North (ftUS)
<3680> +proj=lcc +lat_1=41.78333333333333 +lat_2=40.71666666666667 +lat_0=40.33333333333334 +lon_0=-111.5 +x_0=500000.00001016 +y_0=999999.9999898402 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Utah South
<3681> +proj=lcc +lat_1=38.35 +lat_2=37.21666666666667 +lat_0=36.66666666666666 +lon_0=-111.5 +x_0=500000 +y_0=3000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Utah South (ft)
<3682> +proj=lcc +lat_1=38.35 +lat_2=37.21666666666667 +lat_0=36.66666666666666 +lon_0=-111.5 +x_0=500000.0001504 +y_0=2999999.999988 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(NSRS2007) / Utah South (ftUS)
<3683> +proj=lcc +lat_1=38.35 +lat_2=37.21666666666667 +lat_0=36.66666666666666 +lon_0=-111.5 +x_0=500000.00001016 +y_0=3000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Vermont
<3684> +proj=tmerc +lat_0=42.5 +lon_0=-72.5 +k=0.999964286 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Virginia North
<3685> +proj=lcc +lat_1=39.2 +lat_2=38.03333333333333 +lat_0=37.66666666666666 +lon_0=-78.5 +x_0=3500000 +y_0=2000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Virginia North (ftUS)
<3686> +proj=lcc +lat_1=39.2 +lat_2=38.03333333333333 +lat_0=37.66666666666666 +lon_0=-78.5 +x_0=3500000.0001016 +y_0=2000000.0001016 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Virginia South
<3687> +proj=lcc +lat_1=37.96666666666667 +lat_2=36.76666666666667 +lat_0=36.33333333333334 +lon_0=-78.5 +x_0=3500000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Virginia South (ftUS)
<3688> +proj=lcc +lat_1=37.96666666666667 +lat_2=36.76666666666667 +lat_0=36.33333333333334 +lon_0=-78.5 +x_0=3500000.0001016 +y_0=999999.9998983998 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Washington North
<3689> +proj=lcc +lat_1=48.73333333333333 +lat_2=47.5 +lat_0=47 +lon_0=-120.8333333333333 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Washington North (ftUS)
<3690> +proj=lcc +lat_1=48.73333333333333 +lat_2=47.5 +lat_0=47 +lon_0=-120.8333333333333 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Washington South
<3691> +proj=lcc +lat_1=47.33333333333334 +lat_2=45.83333333333334 +lat_0=45.33333333333334 +lon_0=-120.5 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Washington South (ftUS)
<3692> +proj=lcc +lat_1=47.33333333333334 +lat_2=45.83333333333334 +lat_0=45.33333333333334 +lon_0=-120.5 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / West Virginia North
<3693> +proj=lcc +lat_1=40.25 +lat_2=39 +lat_0=38.5 +lon_0=-79.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / West Virginia South
<3694> +proj=lcc +lat_1=38.88333333333333 +lat_2=37.48333333333333 +lat_0=37 +lon_0=-81 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Wisconsin Central
<3695> +proj=lcc +lat_1=45.5 +lat_2=44.25 +lat_0=43.83333333333334 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Wisconsin Central (ftUS)
<3696> +proj=lcc +lat_1=45.5 +lat_2=44.25 +lat_0=43.83333333333334 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Wisconsin North
<3697> +proj=lcc +lat_1=46.76666666666667 +lat_2=45.56666666666667 +lat_0=45.16666666666666 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Wisconsin North (ftUS)
<3698> +proj=lcc +lat_1=46.76666666666667 +lat_2=45.56666666666667 +lat_0=45.16666666666666 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Wisconsin South
<3699> +proj=lcc +lat_1=44.06666666666667 +lat_2=42.73333333333333 +lat_0=42 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Wisconsin South (ftUS)
<3700> +proj=lcc +lat_1=44.06666666666667 +lat_2=42.73333333333333 +lat_0=42 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Wisconsin Transverse Mercator
<3701> +proj=tmerc +lat_0=0 +lon_0=-90 +k=0.9996 +x_0=520000 +y_0=-4480000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Wyoming East
<3702> +proj=tmerc +lat_0=40.5 +lon_0=-105.1666666666667 +k=0.9999375 +x_0=200000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Wyoming East Central
<3703> +proj=tmerc +lat_0=40.5 +lon_0=-107.3333333333333 +k=0.9999375 +x_0=400000 +y_0=100000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Wyoming West Central
<3704> +proj=tmerc +lat_0=40.5 +lon_0=-108.75 +k=0.9999375 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Wyoming West
<3705> +proj=tmerc +lat_0=40.5 +lon_0=-110.0833333333333 +k=0.9999375 +x_0=800000 +y_0=100000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / UTM zone 59N
<3706> +proj=utm +zone=59 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / UTM zone 60N
<3707> +proj=utm +zone=60 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / UTM zone 1N
<3708> +proj=utm +zone=1 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / UTM zone 2N
<3709> +proj=utm +zone=2 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / UTM zone 3N
<3710> +proj=utm +zone=3 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / UTM zone 4N
<3711> +proj=utm +zone=4 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / UTM zone 5N
<3712> +proj=utm +zone=5 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / UTM zone 6N
<3713> +proj=utm +zone=6 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / UTM zone 7N
<3714> +proj=utm +zone=7 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / UTM zone 8N
<3715> +proj=utm +zone=8 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / UTM zone 9N
<3716> +proj=utm +zone=9 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / UTM zone 10N
<3717> +proj=utm +zone=10 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / UTM zone 11N
<3718> +proj=utm +zone=11 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / UTM zone 12N
<3719> +proj=utm +zone=12 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / UTM zone 13N
<3720> +proj=utm +zone=13 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / UTM zone 14N
<3721> +proj=utm +zone=14 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / UTM zone 15N
<3722> +proj=utm +zone=15 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / UTM zone 16N
<3723> +proj=utm +zone=16 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / UTM zone 17N
<3724> +proj=utm +zone=17 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / UTM zone 18N
<3725> +proj=utm +zone=18 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / UTM zone 19N
<3726> +proj=utm +zone=19 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Reunion 1947 / TM Reunion
<3727> +proj=tmerc +lat_0=-21.11666666666667 +lon_0=55.53333333333333 +k=1 +x_0=160000 +y_0=50000 +ellps=intl +towgs84=94,-948,-1262,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Ohio North (ftUS)
<3728> +proj=lcc +lat_1=41.7 +lat_2=40.43333333333333 +lat_0=39.66666666666666 +lon_0=-82.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Ohio South (ftUS)
<3729> +proj=lcc +lat_1=40.03333333333333 +lat_2=38.73333333333333 +lat_0=38 +lon_0=-82.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Wyoming East (ftUS)
<3730> +proj=tmerc +lat_0=40.5 +lon_0=-105.1666666666667 +k=0.9999375 +x_0=200000.00001016 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Wyoming East Central (ftUS)
<3731> +proj=tmerc +lat_0=40.5 +lon_0=-107.3333333333333 +k=0.9999375 +x_0=399999.99998984 +y_0=99999.99998983997 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Wyoming West Central (ftUS)
<3732> +proj=tmerc +lat_0=40.5 +lon_0=-108.75 +k=0.9999375 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Wyoming West (ftUS)
<3733> +proj=tmerc +lat_0=40.5 +lon_0=-110.0833333333333 +k=0.9999375 +x_0=800000.0000101599 +y_0=99999.99998983997 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83 / Ohio North (ftUS)
<3734> +proj=lcc +lat_1=41.7 +lat_2=40.43333333333333 +lat_0=39.66666666666666 +lon_0=-82.5 +x_0=600000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Ohio South (ftUS)
<3735> +proj=lcc +lat_1=40.03333333333333 +lat_2=38.73333333333333 +lat_0=38 +lon_0=-82.5 +x_0=600000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Wyoming East (ftUS)
<3736> +proj=tmerc +lat_0=40.5 +lon_0=-105.1666666666667 +k=0.9999375 +x_0=200000.00001016 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Wyoming East Central (ftUS)
<3737> +proj=tmerc +lat_0=40.5 +lon_0=-107.3333333333333 +k=0.9999375 +x_0=399999.99998984 +y_0=99999.99998983997 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Wyoming West Central (ftUS)
<3738> +proj=tmerc +lat_0=40.5 +lon_0=-108.75 +k=0.9999375 +x_0=600000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Wyoming West (ftUS)
<3739> +proj=tmerc +lat_0=40.5 +lon_0=-110.0833333333333 +k=0.9999375 +x_0=800000.0000101599 +y_0=99999.99998983997 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83(HARN) / UTM zone 10N
<3740> +proj=utm +zone=10 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / UTM zone 11N
<3741> +proj=utm +zone=11 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / UTM zone 12N
<3742> +proj=utm +zone=12 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / UTM zone 13N
<3743> +proj=utm +zone=13 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / UTM zone 14N
<3744> +proj=utm +zone=14 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / UTM zone 15N
<3745> +proj=utm +zone=15 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / UTM zone 16N
<3746> +proj=utm +zone=16 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / UTM zone 17N
<3747> +proj=utm +zone=17 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / UTM zone 18N
<3748> +proj=utm +zone=18 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / UTM zone 19N
<3749> +proj=utm +zone=19 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / UTM zone 4N
<3750> +proj=utm +zone=4 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / UTM zone 5N
<3751> +proj=utm +zone=5 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# WGS 84 / Mercator 41 (deprecated)
<3752> +proj=merc +lon_0=100 +lat_ts=-41 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# NAD83(HARN) / Ohio North (ftUS)
<3753> +proj=lcc +lat_1=41.7 +lat_2=40.43333333333333 +lat_0=39.66666666666666 +lon_0=-82.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Ohio South (ftUS)
<3754> +proj=lcc +lat_1=40.03333333333333 +lat_2=38.73333333333333 +lat_0=38 +lon_0=-82.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Wyoming East (ftUS)
<3755> +proj=tmerc +lat_0=40.5 +lon_0=-105.1666666666667 +k=0.9999375 +x_0=200000.00001016 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Wyoming East Central (ftUS)
<3756> +proj=tmerc +lat_0=40.5 +lon_0=-107.3333333333333 +k=0.9999375 +x_0=399999.99998984 +y_0=99999.99998983997 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Wyoming West Central (ftUS)
<3757> +proj=tmerc +lat_0=40.5 +lon_0=-108.75 +k=0.9999375 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Wyoming West (ftUS)
<3758> +proj=tmerc +lat_0=40.5 +lon_0=-110.0833333333333 +k=0.9999375 +x_0=800000.0000101599 +y_0=99999.99998983997 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83 / Hawaii zone 3 (ftUS)
<3759> +proj=tmerc +lat_0=21.16666666666667 +lon_0=-158 +k=0.99999 +x_0=500000.00001016 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83(HARN) / Hawaii zone 3 (ftUS)
<3760> +proj=tmerc +lat_0=21.16666666666667 +lon_0=-158 +k=0.99999 +x_0=500000.00001016 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(CSRS) / UTM zone 22N
<3761> +proj=utm +zone=22 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# WGS 84 / South Georgia Lambert
<3762> +proj=lcc +lat_1=-54 +lat_2=-54.75 +lat_0=-55 +lon_0=-37 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# ETRS89 / Portugal TM06
<3763> +proj=tmerc +lat_0=39.66825833333333 +lon_0=-8.133108333333334 +k=1 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Chatham Island Circuit 2000
<3764> +proj=tmerc +lat_0=-44 +lon_0=-176.5 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# HTRS96 / Croatia TM
<3765> +proj=tmerc +lat_0=0 +lon_0=16.5 +k=0.9999 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# HTRS96 / Croatia LCC
<3766> +proj=lcc +lat_1=45.91666666666666 +lat_2=43.08333333333334 +lat_0=0 +lon_0=16.5 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# HTRS96 / UTM zone 33N
<3767> +proj=utm +zone=33 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# HTRS96 / UTM zone 34N
<3768> +proj=utm +zone=34 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Bermuda 1957 / UTM zone 20N
<3769> +proj=utm +zone=20 +ellps=clrk66 +towgs84=-73,213,296,0,0,0,0 +units=m +no_defs  <>
# BDA2000 / Bermuda 2000 National Grid
<3770> +proj=tmerc +lat_0=32 +lon_0=-64.75 +k=1 +x_0=550000 +y_0=100000 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD27 / Alberta 3TM ref merid 111 W
<3771> +proj=tmerc +lat_0=0 +lon_0=-111 +k=0.9999 +x_0=0 +y_0=0 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / Alberta 3TM ref merid 114 W
<3772> +proj=tmerc +lat_0=0 +lon_0=-114 +k=0.9999 +x_0=0 +y_0=0 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / Alberta 3TM ref merid 117 W
<3773> +proj=tmerc +lat_0=0 +lon_0=-117 +k=0.9999 +x_0=0 +y_0=0 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / Alberta 3TM ref merid 120 W (deprecated)
<3774> +proj=tmerc +lat_0=0 +lon_0=-120 +k=0.9999 +x_0=0 +y_0=0 +datum=NAD27 +units=m +no_defs  <>
# NAD83 / Alberta 3TM ref merid 111 W
<3775> +proj=tmerc +lat_0=0 +lon_0=-111 +k=0.9999 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Alberta 3TM ref merid 114 W
<3776> +proj=tmerc +lat_0=0 +lon_0=-114 +k=0.9999 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Alberta 3TM ref merid 117 W
<3777> +proj=tmerc +lat_0=0 +lon_0=-117 +k=0.9999 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Alberta 3TM ref merid 120 W (deprecated)
<3778> +proj=tmerc +lat_0=0 +lon_0=-120 +k=0.9999 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83(CSRS) / Alberta 3TM ref merid 111 W
<3779> +proj=tmerc +lat_0=0 +lon_0=-111 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / Alberta 3TM ref merid 114 W
<3780> +proj=tmerc +lat_0=0 +lon_0=-114 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / Alberta 3TM ref merid 117 W
<3781> +proj=tmerc +lat_0=0 +lon_0=-117 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / Alberta 3TM ref merid 120 W (deprecated)
<3782> +proj=tmerc +lat_0=0 +lon_0=-120 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Pitcairn 2006 / Pitcairn TM 2006
<3783> +proj=tmerc +lat_0=-25.06855261111111 +lon_0=-130.1129671111111 +k=1 +x_0=14200 +y_0=15500 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Pitcairn 1967 / UTM zone 9S
<3784> +proj=utm +zone=9 +south +ellps=intl +towgs84=185,165,42,0,0,0,0 +units=m +no_defs  <>
# Popular Visualisation CRS / Mercator (deprecated)
<3785> +proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs <>
# World Equidistant Cylindrical (Sphere) (deprecated)
<3786> +proj=eqc +lat_ts=0 +lat_0=0 +lon_0=0 +x_0=0 +y_0=0 +a=6371007 +b=6371007 +units=m +no_defs  <>
# MGI / Slovene National Grid (deprecated)
<3787> +proj=tmerc +lat_0=0 +lon_0=15 +k=0.9999 +x_0=500000 +y_0=-5000000 +datum=hermannskogel +units=m +no_defs  <>
# NZGD2000 / Auckland Islands TM 2000
<3788> +proj=tmerc +lat_0=0 +lon_0=166 +k=1 +x_0=3500000 +y_0=10000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Campbell Island TM 2000
<3789> +proj=tmerc +lat_0=0 +lon_0=169 +k=1 +x_0=3500000 +y_0=10000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Antipodes Islands TM 2000
<3790> +proj=tmerc +lat_0=0 +lon_0=179 +k=1 +x_0=3500000 +y_0=10000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Raoul Island TM 2000
<3791> +proj=tmerc +lat_0=0 +lon_0=-178 +k=1 +x_0=3500000 +y_0=10000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / Chatham Islands TM 2000
<3793> +proj=tmerc +lat_0=0 +lon_0=-176.5 +k=1 +x_0=3500000 +y_0=10000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Slovenia 1996 / Slovene National Grid
<3794> +proj=tmerc +lat_0=0 +lon_0=15 +k=0.9999 +x_0=500000 +y_0=-5000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD27 / Cuba Norte
<3795> +proj=lcc +lat_1=23 +lat_2=21.7 +lat_0=22.35 +lon_0=-81 +x_0=500000 +y_0=280296.016 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / Cuba Sur
<3796> +proj=lcc +lat_1=21.3 +lat_2=20.13333333333333 +lat_0=20.71666666666667 +lon_0=-76.83333333333333 +x_0=500000 +y_0=229126.939 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / MTQ Lambert
<3797> +proj=lcc +lat_1=50 +lat_2=46 +lat_0=44 +lon_0=-70 +x_0=800000 +y_0=0 +datum=NAD27 +units=m +no_defs  <>
# NAD83 / MTQ Lambert
<3798> +proj=lcc +lat_1=50 +lat_2=46 +lat_0=44 +lon_0=-70 +x_0=800000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83(CSRS) / MTQ Lambert
<3799> +proj=lcc +lat_1=50 +lat_2=46 +lat_0=44 +lon_0=-70 +x_0=800000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD27 / Alberta 3TM ref merid 120 W
<3800> +proj=tmerc +lat_0=0 +lon_0=-120 +k=0.9999 +x_0=0 +y_0=0 +datum=NAD27 +units=m +no_defs  <>
# NAD83 / Alberta 3TM ref merid 120 W
<3801> +proj=tmerc +lat_0=0 +lon_0=-120 +k=0.9999 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83(CSRS) / Alberta 3TM ref merid 120 W
<3802> +proj=tmerc +lat_0=0 +lon_0=-120 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / Belgian Lambert 2008
<3812> +proj=lcc +lat_1=49.83333333333334 +lat_2=51.16666666666666 +lat_0=50.797815 +lon_0=4.359215833333333 +x_0=649328 +y_0=665262 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83 / Mississippi TM
<3814> +proj=tmerc +lat_0=32.5 +lon_0=-89.75 +k=0.9998335 +x_0=500000 +y_0=1300000 +datum=NAD83 +units=m +no_defs  <>
# NAD83(HARN) / Mississippi TM
<3815> +proj=tmerc +lat_0=32.5 +lon_0=-89.75 +k=0.9998335 +x_0=500000 +y_0=1300000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Mississippi TM
<3816> +proj=tmerc +lat_0=32.5 +lon_0=-89.75 +k=0.9998335 +x_0=500000 +y_0=1300000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# TWD97 / TM2 zone 119
<3825> +proj=tmerc +lat_0=0 +lon_0=119 +k=0.9999 +x_0=250000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# TWD97 / TM2 zone 121
<3826> +proj=tmerc +lat_0=0 +lon_0=121 +k=0.9999 +x_0=250000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# TWD67 / TM2 zone 119
<3827> +proj=tmerc +lat_0=0 +lon_0=119 +k=0.9999 +x_0=250000 +y_0=0 +ellps=aust_SA +units=m +no_defs  <>
# TWD67 / TM2 zone 121
<3828> +proj=tmerc +lat_0=0 +lon_0=121 +k=0.9999 +x_0=250000 +y_0=0 +ellps=aust_SA +units=m +no_defs  <>
# Hu Tzu Shan 1950 / UTM zone 51N
<3829> +proj=utm +zone=51 +ellps=intl +towgs84=-637,-549,-203,0,0,0,0 +units=m +no_defs  <>
# WGS 84 / PDC Mercator
<3832> +proj=merc +lon_0=150 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# Pulkovo 1942(58) / Gauss-Kruger zone 2
<3833> +proj=tmerc +lat_0=0 +lon_0=9 +k=1 +x_0=2500000 +y_0=0 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# Pulkovo 1942(83) / Gauss-Kruger zone 2
<3834> +proj=tmerc +lat_0=0 +lon_0=9 +k=1 +x_0=2500000 +y_0=0 +ellps=krass +towgs84=26,-121,-78,0,0,0,0 +units=m +no_defs  <>
# Pulkovo 1942(83) / Gauss-Kruger zone 3
<3835> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=3500000 +y_0=0 +ellps=krass +towgs84=26,-121,-78,0,0,0,0 +units=m +no_defs  <>
# Pulkovo 1942(83) / Gauss-Kruger zone 4
<3836> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=4500000 +y_0=0 +ellps=krass +towgs84=26,-121,-78,0,0,0,0 +units=m +no_defs  <>
# Pulkovo 1942(58) / 3-degree Gauss-Kruger zone 3
<3837> +proj=tmerc +lat_0=0 +lon_0=9 +k=1 +x_0=3500000 +y_0=0 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# Pulkovo 1942(58) / 3-degree Gauss-Kruger zone 4
<3838> +proj=tmerc +lat_0=0 +lon_0=12 +k=1 +x_0=4500000 +y_0=0 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# Pulkovo 1942(58) / 3-degree Gauss-Kruger zone 9
<3839> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=9500000 +y_0=0 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# Pulkovo 1942(58) / 3-degree Gauss-Kruger zone 10
<3840> +proj=tmerc +lat_0=0 +lon_0=30 +k=1 +x_0=10500000 +y_0=0 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# Pulkovo 1942(83) / 3-degree Gauss-Kruger zone 6
<3841> +proj=tmerc +lat_0=0 +lon_0=18 +k=1 +x_0=6500000 +y_0=0 +ellps=krass +towgs84=26,-121,-78,0,0,0,0 +units=m +no_defs  <>
# Pulkovo 1942(83) / 3-degree Gauss-Kruger zone 7 (deprecated)
<3842> +proj=tmerc +lat_0=0 +lon_0=18 +k=1 +x_0=6500000 +y_0=0 +ellps=krass +towgs84=26,-121,-78,0,0,0,0 +units=m +no_defs  <>
# Pulkovo 1942(83) / 3-degree Gauss-Kruger zone 8 (deprecated)
<3843> +proj=tmerc +lat_0=0 +lon_0=18 +k=1 +x_0=6500000 +y_0=0 +ellps=krass +towgs84=26,-121,-78,0,0,0,0 +units=m +no_defs  <>
# Pulkovo 1942(58) / Stereo70
<3844> +proj=sterea +lat_0=46 +lon_0=25 +k=0.99975 +x_0=500000 +y_0=500000 +ellps=krass +towgs84=2.329,-147.042,-92.08,0.309,-0.325,-0.497,5.69 +units=m +no_defs  <>
# SWEREF99 / RT90 7.5 gon V emulation
<3845> +proj=tmerc +lat_0=0 +lon_0=11.30625 +k=1.000006 +x_0=1500025.141 +y_0=-667.282 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SWEREF99 / RT90 5 gon V emulation
<3846> +proj=tmerc +lat_0=0 +lon_0=13.55626666666667 +k=1.0000058 +x_0=1500044.695 +y_0=-667.13 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SWEREF99 / RT90 2.5 gon V emulation
<3847> +proj=tmerc +lat_0=0 +lon_0=15.80628452944445 +k=1.00000561024 +x_0=1500064.274 +y_0=-667.711 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SWEREF99 / RT90 0 gon emulation
<3848> +proj=tmerc +lat_0=0 +lon_0=18.0563 +k=1.0000054 +x_0=1500083.521 +y_0=-668.8440000000001 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SWEREF99 / RT90 2.5 gon O emulation
<3849> +proj=tmerc +lat_0=0 +lon_0=20.30631666666667 +k=1.0000052 +x_0=1500102.765 +y_0=-670.706 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SWEREF99 / RT90 5 gon O emulation
<3850> +proj=tmerc +lat_0=0 +lon_0=22.55633333333333 +k=1.0000049 +x_0=1500121.846 +y_0=-672.557 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NZGD2000 / NZCS2000
<3851> +proj=lcc +lat_1=-37.5 +lat_2=-44.5 +lat_0=-41 +lon_0=173 +x_0=3000000 +y_0=7000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RSRGD2000 / DGLC2000
<3852> +proj=lcc +lat_1=-76.66666666666667 +lat_2=-79.33333333333333 +lat_0=-90 +lon_0=157 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# County ST74
<3854> +proj=tmerc +lat_0=0 +lon_0=18.05787 +k=0.99999506 +x_0=100182.7406 +y_0=-6500620.1207 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# WGS 84 / Pseudo-Mercator
<3857> +proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs <>
# ETRS89 / GK19FIN
<3873> +proj=tmerc +lat_0=0 +lon_0=19 +k=1 +x_0=19500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / GK20FIN
<3874> +proj=tmerc +lat_0=0 +lon_0=20 +k=1 +x_0=20500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / GK21FIN
<3875> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=21500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / GK22FIN
<3876> +proj=tmerc +lat_0=0 +lon_0=22 +k=1 +x_0=22500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / GK23FIN
<3877> +proj=tmerc +lat_0=0 +lon_0=23 +k=1 +x_0=23500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / GK24FIN
<3878> +proj=tmerc +lat_0=0 +lon_0=24 +k=1 +x_0=24500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / GK25FIN
<3879> +proj=tmerc +lat_0=0 +lon_0=25 +k=1 +x_0=25500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / GK26FIN
<3880> +proj=tmerc +lat_0=0 +lon_0=26 +k=1 +x_0=26500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / GK27FIN
<3881> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=27500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / GK28FIN
<3882> +proj=tmerc +lat_0=0 +lon_0=28 +k=1 +x_0=28500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / GK29FIN
<3883> +proj=tmerc +lat_0=0 +lon_0=29 +k=1 +x_0=29500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / GK30FIN
<3884> +proj=tmerc +lat_0=0 +lon_0=30 +k=1 +x_0=30500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / GK31FIN
<3885> +proj=tmerc +lat_0=0 +lon_0=31 +k=1 +x_0=31500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# IGRS / UTM zone 37N
<3890> +proj=utm +zone=37 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# IGRS / UTM zone 38N
<3891> +proj=utm +zone=38 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# IGRS / UTM zone 39N
<3892> +proj=utm +zone=39 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ED50 / Iraq National Grid
<3893> +proj=tmerc +lat_0=29.02626833333333 +lon_0=46.5 +k=0.9994 +x_0=800000 +y_0=0 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# MGI 1901 / Balkans zone 5
<3907> +proj=tmerc +lat_0=0 +lon_0=15 +k=0.9999 +x_0=5500000 +y_0=0 +ellps=bessel +towgs84=682,-203,480,0,0,0,0 +units=m +no_defs  <>
# MGI 1901 / Balkans zone 6
<3908> +proj=tmerc +lat_0=0 +lon_0=18 +k=0.9999 +x_0=6500000 +y_0=0 +ellps=bessel +towgs84=682,-203,480,0,0,0,0 +units=m +no_defs  <>
# MGI 1901 / Balkans zone 7
<3909> +proj=tmerc +lat_0=0 +lon_0=21 +k=0.9999 +x_0=7500000 +y_0=0 +ellps=bessel +towgs84=682,-203,480,0,0,0,0 +units=m +no_defs  <>
# MGI 1901 / Balkans zone 8
<3910> +proj=tmerc +lat_0=0 +lon_0=24 +k=0.9999 +x_0=8500000 +y_0=0 +ellps=bessel +towgs84=682,-203,480,0,0,0,0 +units=m +no_defs  <>
# MGI 1901 / Slovenia Grid
<3911> +proj=tmerc +lat_0=0 +lon_0=15 +k=0.9999 +x_0=500000 +y_0=0 +ellps=bessel +towgs84=682,-203,480,0,0,0,0 +units=m +no_defs  <>
# MGI 1901 / Slovene National Grid
<3912> +proj=tmerc +lat_0=0 +lon_0=15 +k=0.9999 +x_0=500000 +y_0=-5000000 +ellps=bessel +towgs84=682,-203,480,0,0,0,0 +units=m +no_defs  <>
# Puerto Rico / UTM zone 20N
<3920> +proj=utm +zone=20 +ellps=clrk66 +towgs84=11,72,-101,0,0,0,0 +units=m +no_defs  <>
# RGF93 / CC42
<3942> +proj=lcc +lat_1=41.25 +lat_2=42.75 +lat_0=42 +lon_0=3 +x_0=1700000 +y_0=1200000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGF93 / CC43
<3943> +proj=lcc +lat_1=42.25 +lat_2=43.75 +lat_0=43 +lon_0=3 +x_0=1700000 +y_0=2200000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGF93 / CC44
<3944> +proj=lcc +lat_1=43.25 +lat_2=44.75 +lat_0=44 +lon_0=3 +x_0=1700000 +y_0=3200000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGF93 / CC45
<3945> +proj=lcc +lat_1=44.25 +lat_2=45.75 +lat_0=45 +lon_0=3 +x_0=1700000 +y_0=4200000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGF93 / CC46
<3946> +proj=lcc +lat_1=45.25 +lat_2=46.75 +lat_0=46 +lon_0=3 +x_0=1700000 +y_0=5200000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGF93 / CC47
<3947> +proj=lcc +lat_1=46.25 +lat_2=47.75 +lat_0=47 +lon_0=3 +x_0=1700000 +y_0=6200000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGF93 / CC48
<3948> +proj=lcc +lat_1=47.25 +lat_2=48.75 +lat_0=48 +lon_0=3 +x_0=1700000 +y_0=7200000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGF93 / CC49
<3949> +proj=lcc +lat_1=48.25 +lat_2=49.75 +lat_0=49 +lon_0=3 +x_0=1700000 +y_0=8200000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGF93 / CC50
<3950> +proj=lcc +lat_1=49.25 +lat_2=50.75 +lat_0=50 +lon_0=3 +x_0=1700000 +y_0=9200000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83 / Virginia Lambert
<3968> +proj=lcc +lat_1=37 +lat_2=39.5 +lat_0=36 +lon_0=-79.5 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83(HARN) / Virginia Lambert
<3969> +proj=lcc +lat_1=37 +lat_2=39.5 +lat_0=36 +lon_0=-79.5 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Virginia Lambert
<3970> +proj=lcc +lat_1=37 +lat_2=39.5 +lat_0=36 +lon_0=-79.5 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# WGS 84 / NSIDC EASE-Grid North (deprecated)
<3973> +proj=laea +lat_0=90 +lon_0=0 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / NSIDC EASE-Grid South (deprecated)
<3974> +proj=laea +lat_0=-90 +lon_0=0 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / NSIDC EASE-Grid Global (deprecated)
<3975> +proj=cea +lon_0=0 +lat_ts=30 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / NSIDC Sea Ice Polar Stereographic South
<3976> +proj=stere +lat_0=-90 +lat_ts=-70 +lon_0=0 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# NAD83 / Canada Atlas Lambert
<3978> +proj=lcc +lat_1=49 +lat_2=77 +lat_0=49 +lon_0=-95 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83(CSRS) / Canada Atlas Lambert
<3979> +proj=lcc +lat_1=49 +lat_2=77 +lat_0=49 +lon_0=-95 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Katanga 1955 / Katanga Lambert (deprecated)
<3985> +proj=lcc +lat_1=-6.5 +lat_2=-11.5 +lat_0=9 +lon_0=26 +x_0=500000 +y_0=500000 +ellps=clrk66 +towgs84=-103.746,-9.614,-255.95,0,0,0,0 +units=m +no_defs  <>
# Katanga 1955 / Katanga Gauss zone A
<3986> +proj=tmerc +lat_0=-9 +lon_0=30 +k=1 +x_0=200000 +y_0=500000 +ellps=clrk66 +towgs84=-103.746,-9.614,-255.95,0,0,0,0 +units=m +no_defs  <>
# Katanga 1955 / Katanga Gauss zone B
<3987> +proj=tmerc +lat_0=-9 +lon_0=28 +k=1 +x_0=200000 +y_0=500000 +ellps=clrk66 +towgs84=-103.746,-9.614,-255.95,0,0,0,0 +units=m +no_defs  <>
# Katanga 1955 / Katanga Gauss zone C
<3988> +proj=tmerc +lat_0=-9 +lon_0=26 +k=1 +x_0=200000 +y_0=500000 +ellps=clrk66 +towgs84=-103.746,-9.614,-255.95,0,0,0,0 +units=m +no_defs  <>
# Katanga 1955 / Katanga Gauss zone D
<3989> +proj=tmerc +lat_0=-9 +lon_0=24 +k=1 +x_0=200000 +y_0=500000 +ellps=clrk66 +towgs84=-103.746,-9.614,-255.95,0,0,0,0 +units=m +no_defs  <>
# Puerto Rico State Plane CS of 1927
<3991> +proj=lcc +lat_1=18.43333333333333 +lat_2=18.03333333333333 +lat_0=17.83333333333333 +lon_0=-66.43333333333334 +x_0=152400.3048006096 +y_0=0 +ellps=clrk66 +towgs84=11,72,-101,0,0,0,0 +units=us-ft +no_defs  <>
# Puerto Rico / St. Croix
<3992> +proj=lcc +lat_1=18.43333333333333 +lat_2=18.03333333333333 +lat_0=17.83333333333333 +lon_0=-66.43333333333334 +x_0=152400.3048006096 +y_0=30480.06096012192 +ellps=clrk66 +towgs84=11,72,-101,0,0,0,0 +units=us-ft +no_defs  <>
# Guam 1963 / Guam SPCS
# Unable to translate coordinate system EPSG:3993 into PROJ.4 format.
#
# WGS 84 / Mercator 41
<3994> +proj=merc +lon_0=100 +lat_ts=-41 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Arctic Polar Stereographic
<3995> +proj=stere +lat_0=90 +lat_ts=71 +lon_0=0 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / IBCAO Polar Stereographic
<3996> +proj=stere +lat_0=90 +lat_ts=75 +lon_0=0 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Dubai Local TM
<3997> +proj=tmerc +lat_0=0 +lon_0=55.33333333333334 +k=1 +x_0=500000 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# MOLDREF99 / Moldova TM
<4026> +proj=tmerc +lat_0=0 +lon_0=28.4 +k=0.9999400000000001 +x_0=200000 +y_0=-5000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# WGS 84 / TMzn35N
<4037> +proj=utm +zone=35 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / TMzn36N
<4038> +proj=utm +zone=36 +datum=WGS84 +units=m +no_defs  <>
# RGRDC 2005 / Congo TM zone 12
<4048> +proj=tmerc +lat_0=0 +lon_0=12 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGRDC 2005 / Congo TM zone 14
<4049> +proj=tmerc +lat_0=0 +lon_0=14 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGRDC 2005 / Congo TM zone 16
<4050> +proj=tmerc +lat_0=0 +lon_0=16 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGRDC 2005 / Congo TM zone 18
<4051> +proj=tmerc +lat_0=0 +lon_0=18 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGRDC 2005 / Congo TM zone 20
<4056> +proj=tmerc +lat_0=0 +lon_0=20 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGRDC 2005 / Congo TM zone 22
<4057> +proj=tmerc +lat_0=0 +lon_0=22 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGRDC 2005 / Congo TM zone 24
<4058> +proj=tmerc +lat_0=0 +lon_0=24 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGRDC 2005 / Congo TM zone 26
<4059> +proj=tmerc +lat_0=0 +lon_0=26 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGRDC 2005 / Congo TM zone 28
<4060> +proj=tmerc +lat_0=0 +lon_0=28 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGRDC 2005 / UTM zone 33S
<4061> +proj=utm +zone=33 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGRDC 2005 / UTM zone 34S
<4062> +proj=utm +zone=34 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGRDC 2005 / UTM zone 35S
<4063> +proj=utm +zone=35 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Chua / UTM zone 23S
<4071> +proj=utm +zone=23 +south +ellps=intl +towgs84=-143.87,243.37,-33.52,0,0,0,0 +units=m +no_defs  <>
# REGCAN95 / UTM zone 27N
<4082> +proj=utm +zone=27 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# REGCAN95 / UTM zone 28N
<4083> +proj=utm +zone=28 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# WGS 84 / World Equidistant Cylindrical
<4087> +proj=eqc +lat_ts=0 +lat_0=0 +lon_0=0 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# World Equidistant Cylindrical (Sphere)
<4088> +proj=eqc +lat_ts=0 +lat_0=0 +lon_0=0 +x_0=0 +y_0=0 +a=6371007 +b=6371007 +units=m +no_defs  <>
# ETRS89 / DKTM1
<4093> +proj=tmerc +lat_0=0 +lon_0=9 +k=0.99998 +x_0=200000 +y_0=-5000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / DKTM2
<4094> +proj=tmerc +lat_0=0 +lon_0=10 +k=0.99998 +x_0=400000 +y_0=-5000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / DKTM3
<4095> +proj=tmerc +lat_0=0 +lon_0=11.75 +k=0.99998 +x_0=600000 +y_0=-5000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / DKTM4
<4096> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=800000 +y_0=-5000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83 / BLM 59N (ftUS)
<4217> +proj=tmerc +lat_0=0 +lon_0=171 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# Kertau 1968 / Johor Grid
<4390> +proj=cass +lat_0=2.042583333333333 +lon_0=103.5627583333333 +x_0=0 +y_0=0 +a=6377304.063 +b=6356103.038993155 +towgs84=-11,851,5,0,0,0,0 +units=m +no_defs  <>
# Kertau 1968 / Sembilan and Melaka Grid
<4391> +proj=cass +lat_0=2.712283333333334 +lon_0=101.9411666666667 +x_0=-242.005 +y_0=-948.547 +a=6377304.063 +b=6356103.038993155 +towgs84=-11,851,5,0,0,0,0 +units=m +no_defs  <>
# Kertau 1968 / Pahang Grid
<4392> +proj=cass +lat_0=3.710972222222222 +lon_0=102.4361777777778 +x_0=0 +y_0=0 +a=6377304.063 +b=6356103.038993155 +towgs84=-11,851,5,0,0,0,0 +units=m +no_defs  <>
# Kertau 1968 / Selangor Grid
<4393> +proj=cass +lat_0=3.680344444444444 +lon_0=101.5082444444444 +x_0=-21759.438 +y_0=55960.906 +a=6377304.063 +b=6356103.038993155 +towgs84=-11,851,5,0,0,0,0 +units=m +no_defs  <>
# Kertau 1968 / Terengganu Grid
<4394> +proj=cass +lat_0=4.946141666666667 +lon_0=102.8952083333333 +x_0=0 +y_0=0 +a=6377304.063 +b=6356103.038993155 +towgs84=-11,851,5,0,0,0,0 +units=m +no_defs  <>
# Kertau 1968 / Pinang Grid
<4395> +proj=cass +lat_0=5.421325 +lon_0=100.3458694444444 +x_0=0 +y_0=0 +a=6377304.063 +b=6356103.038993155 +towgs84=-11,851,5,0,0,0,0 +units=m +no_defs  <>
# Kertau 1968 / Kedah and Perlis Grid
<4396> +proj=cass +lat_0=5.965147222222223 +lon_0=100.6375944444444 +x_0=0 +y_0=0 +a=6377304.063 +b=6356103.038993155 +towgs84=-11,851,5,0,0,0,0 +units=m +no_defs  <>
# Kertau 1968 / Perak Revised Grid
<4397> +proj=cass +lat_0=4.859380555555555 +lon_0=100.8167666666667 +x_0=0 +y_0=133453.669 +a=6377304.063 +b=6356103.038993155 +towgs84=-11,851,5,0,0,0,0 +units=m +no_defs  <>
# Kertau 1968 / Kelantan Grid
<4398> +proj=cass +lat_0=5.893922222222222 +lon_0=102.1772916666667 +x_0=0 +y_0=0 +a=6377304.063 +b=6356103.038993155 +towgs84=-11,851,5,0,0,0,0 +units=m +no_defs  <>
# NAD27 / BLM 59N (ftUS)
<4399> +proj=tmerc +lat_0=0 +lon_0=171 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / BLM 60N (ftUS)
<4400> +proj=tmerc +lat_0=0 +lon_0=177 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / BLM 1N (ftUS)
<4401> +proj=tmerc +lat_0=0 +lon_0=-177 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / BLM 2N (ftUS)
<4402> +proj=tmerc +lat_0=0 +lon_0=-171 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / BLM 3N (ftUS)
<4403> +proj=tmerc +lat_0=0 +lon_0=-165 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / BLM 4N (ftUS)
<4404> +proj=tmerc +lat_0=0 +lon_0=-159 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / BLM 5N (ftUS)
<4405> +proj=tmerc +lat_0=0 +lon_0=-153 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / BLM 6N (ftUS)
<4406> +proj=tmerc +lat_0=0 +lon_0=-147 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / BLM 7N (ftUS)
<4407> +proj=tmerc +lat_0=0 +lon_0=-141 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / BLM 8N (ftUS)
<4408> +proj=tmerc +lat_0=0 +lon_0=-135 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / BLM 9N (ftUS)
<4409> +proj=tmerc +lat_0=0 +lon_0=-129 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / BLM 10N (ftUS)
<4410> +proj=tmerc +lat_0=0 +lon_0=-123 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / BLM 11N (ftUS)
<4411> +proj=tmerc +lat_0=0 +lon_0=-117 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / BLM 12N (ftUS)
<4412> +proj=tmerc +lat_0=0 +lon_0=-111 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / BLM 13N (ftUS)
<4413> +proj=tmerc +lat_0=0 +lon_0=-105 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD83(HARN) / Guam Map Grid
<4414> +proj=tmerc +lat_0=13.5 +lon_0=144.75 +k=1 +x_0=100000 +y_0=200000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Katanga 1955 / Katanga Lambert
<4415> +proj=lcc +lat_1=-6.5 +lat_2=-11.5 +lat_0=-9 +lon_0=26 +x_0=500000 +y_0=500000 +ellps=clrk66 +towgs84=-103.746,-9.614,-255.95,0,0,0,0 +units=m +no_defs  <>
# Pulkovo 1942(83) / 3-degree Gauss-Kruger zone 7
<4417> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=7500000 +y_0=0 +ellps=krass +towgs84=26,-121,-78,0,0,0,0 +units=m +no_defs  <>
# NAD27 / BLM 18N (ftUS)
<4418> +proj=tmerc +lat_0=0 +lon_0=-75 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / BLM 19N (ftUS)
<4419> +proj=tmerc +lat_0=0 +lon_0=-69 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD83 / BLM 60N (ftUS)
<4420> +proj=tmerc +lat_0=0 +lon_0=177 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / BLM 1N (ftUS)
<4421> +proj=tmerc +lat_0=0 +lon_0=-177 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / BLM 2N (ftUS)
<4422> +proj=tmerc +lat_0=0 +lon_0=-171 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / BLM 3N (ftUS)
<4423> +proj=tmerc +lat_0=0 +lon_0=-165 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / BLM 4N (ftUS)
<4424> +proj=tmerc +lat_0=0 +lon_0=-159 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / BLM 5N (ftUS)
<4425> +proj=tmerc +lat_0=0 +lon_0=-153 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / BLM 6N (ftUS)
<4426> +proj=tmerc +lat_0=0 +lon_0=-147 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / BLM 7N (ftUS)
<4427> +proj=tmerc +lat_0=0 +lon_0=-141 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / BLM 8N (ftUS)
<4428> +proj=tmerc +lat_0=0 +lon_0=-135 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / BLM 9N (ftUS)
<4429> +proj=tmerc +lat_0=0 +lon_0=-129 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / BLM 10N (ftUS)
<4430> +proj=tmerc +lat_0=0 +lon_0=-123 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / BLM 11N (ftUS)
<4431> +proj=tmerc +lat_0=0 +lon_0=-117 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / BLM 12N (ftUS)
<4432> +proj=tmerc +lat_0=0 +lon_0=-111 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / BLM 13N (ftUS)
<4433> +proj=tmerc +lat_0=0 +lon_0=-105 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# Pulkovo 1942(83) / 3-degree Gauss-Kruger zone 8
<4434> +proj=tmerc +lat_0=0 +lon_0=24 +k=1 +x_0=8500000 +y_0=0 +ellps=krass +towgs84=26,-121,-78,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Puerto Rico and Virgin Is.
<4437> +proj=lcc +lat_1=18.43333333333333 +lat_2=18.03333333333333 +lat_0=17.83333333333333 +lon_0=-66.43333333333334 +x_0=200000 +y_0=200000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83 / BLM 18N (ftUS)
<4438> +proj=tmerc +lat_0=0 +lon_0=-75 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / BLM 19N (ftUS)
<4439> +proj=tmerc +lat_0=0 +lon_0=-69 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD27 / Pennsylvania South
<4455> +proj=lcc +lat_1=40.96666666666667 +lat_2=39.93333333333333 +lat_0=39.33333333333334 +lon_0=-77.75 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / New York Long Island
<4456> +proj=lcc +lat_1=41.03333333333333 +lat_2=40.66666666666666 +lat_0=40.5 +lon_0=-74 +x_0=609601.2192024384 +y_0=30480.06096012192 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD83 / South Dakota North (ftUS)
<4457> +proj=lcc +lat_1=45.68333333333333 +lat_2=44.41666666666666 +lat_0=43.83333333333334 +lon_0=-100 +x_0=600000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# WGS 84 / Australian Centre for Remote Sensing Lambert
<4462> +proj=lcc +lat_1=-18 +lat_2=-36 +lat_0=-27 +lon_0=132 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# RGSPM06 / UTM zone 21N
<4467> +proj=utm +zone=21 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGM04 / UTM zone 38S
<4471> +proj=utm +zone=38 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Cadastre 1997 / UTM zone 38S (deprecated)
<4474> +proj=utm +zone=38 +south +ellps=intl +towgs84=-382,-59,-262,0,0,0,0 +units=m +no_defs  <>
# Mexico ITRF92 / UTM zone 11N
<4484> +proj=utm +zone=11 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Mexico ITRF92 / UTM zone 12N
<4485> +proj=utm +zone=12 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Mexico ITRF92 / UTM zone 13N
<4486> +proj=utm +zone=13 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Mexico ITRF92 / UTM zone 14N
<4487> +proj=utm +zone=14 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Mexico ITRF92 / UTM zone 15N
<4488> +proj=utm +zone=15 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Mexico ITRF92 / UTM zone 16N
<4489> +proj=utm +zone=16 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# CGCS2000 / Gauss-Kruger zone 13
<4491> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=13500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / Gauss-Kruger zone 14
<4492> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=14500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / Gauss-Kruger zone 15
<4493> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=15500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / Gauss-Kruger zone 16
<4494> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=16500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / Gauss-Kruger zone 17
<4495> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=17500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / Gauss-Kruger zone 18
<4496> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=18500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / Gauss-Kruger zone 19
<4497> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=19500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / Gauss-Kruger zone 20
<4498> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=20500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / Gauss-Kruger zone 21
<4499> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=21500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / Gauss-Kruger zone 22
<4500> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=22500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / Gauss-Kruger zone 23
<4501> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=23500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / Gauss-Kruger CM 75E
<4502> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / Gauss-Kruger CM 81E
<4503> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / Gauss-Kruger CM 87E
<4504> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / Gauss-Kruger CM 93E
<4505> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / Gauss-Kruger CM 99E
<4506> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / Gauss-Kruger CM 105E
<4507> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / Gauss-Kruger CM 111E
<4508> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / Gauss-Kruger CM 117E
<4509> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / Gauss-Kruger CM 123E
<4510> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / Gauss-Kruger CM 129E
<4511> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / Gauss-Kruger CM 135E
<4512> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger zone 25
<4513> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=25500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger zone 26
<4514> +proj=tmerc +lat_0=0 +lon_0=78 +k=1 +x_0=26500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger zone 27
<4515> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=27500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger zone 28
<4516> +proj=tmerc +lat_0=0 +lon_0=84 +k=1 +x_0=28500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger zone 29
<4517> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=29500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger zone 30
<4518> +proj=tmerc +lat_0=0 +lon_0=90 +k=1 +x_0=30500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger zone 31
<4519> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=31500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger zone 32
<4520> +proj=tmerc +lat_0=0 +lon_0=96 +k=1 +x_0=32500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger zone 33
<4521> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=33500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger zone 34
<4522> +proj=tmerc +lat_0=0 +lon_0=102 +k=1 +x_0=34500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger zone 35
<4523> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=35500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger zone 36
<4524> +proj=tmerc +lat_0=0 +lon_0=108 +k=1 +x_0=36500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger zone 37
<4525> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=37500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger zone 38
<4526> +proj=tmerc +lat_0=0 +lon_0=114 +k=1 +x_0=38500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger zone 39
<4527> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=39500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger zone 40
<4528> +proj=tmerc +lat_0=0 +lon_0=120 +k=1 +x_0=40500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger zone 41
<4529> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=41500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger zone 42
<4530> +proj=tmerc +lat_0=0 +lon_0=126 +k=1 +x_0=42500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger zone 43
<4531> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=43500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger zone 44
<4532> +proj=tmerc +lat_0=0 +lon_0=132 +k=1 +x_0=44500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger zone 45
<4533> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=45500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger CM 75E
<4534> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger CM 78E
<4535> +proj=tmerc +lat_0=0 +lon_0=78 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger CM 81E
<4536> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger CM 84E
<4537> +proj=tmerc +lat_0=0 +lon_0=84 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger CM 87E
<4538> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger CM 90E
<4539> +proj=tmerc +lat_0=0 +lon_0=90 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger CM 93E
<4540> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger CM 96E
<4541> +proj=tmerc +lat_0=0 +lon_0=96 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger CM 99E
<4542> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger CM 102E
<4543> +proj=tmerc +lat_0=0 +lon_0=102 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger CM 105E
<4544> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger CM 108E
<4545> +proj=tmerc +lat_0=0 +lon_0=108 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger CM 111E
<4546> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger CM 114E
<4547> +proj=tmerc +lat_0=0 +lon_0=114 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger CM 117E
<4548> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger CM 120E
<4549> +proj=tmerc +lat_0=0 +lon_0=120 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger CM 123E
<4550> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger CM 126E
<4551> +proj=tmerc +lat_0=0 +lon_0=126 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger CM 129E
<4552> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger CM 132E
<4553> +proj=tmerc +lat_0=0 +lon_0=132 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# CGCS2000 / 3-degree Gauss-Kruger CM 135E
<4554> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# RRAF 1991 / UTM zone 20N
<4559> +proj=utm +zone=20 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# New Beijing / Gauss-Kruger zone 13
<4568> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=13500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / Gauss-Kruger zone 14
<4569> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=14500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / Gauss-Kruger zone 15
<4570> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=15500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / Gauss-Kruger zone 16
<4571> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=16500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / Gauss-Kruger zone 17
<4572> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=17500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / Gauss-Kruger zone 18
<4573> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=18500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / Gauss-Kruger zone 19
<4574> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=19500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / Gauss-Kruger zone 20
<4575> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=20500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / Gauss-Kruger zone 21
<4576> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=21500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / Gauss-Kruger zone 22
<4577> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=22500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / Gauss-Kruger zone 23
<4578> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=23500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / Gauss-Kruger CM 75E
<4579> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / Gauss-Kruger CM 81E
<4580> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / Gauss-Kruger CM 87E
<4581> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / Gauss-Kruger CM 93E
<4582> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / Gauss-Kruger CM 99E
<4583> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / Gauss-Kruger CM 105E
<4584> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / Gauss-Kruger CM 111E
<4585> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / Gauss-Kruger CM 117E
<4586> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / Gauss-Kruger CM 123E
<4587> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / Gauss-Kruger CM 129E
<4588> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / Gauss-Kruger CM 135E
<4589> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# ETRS89 / UTM zone 32N (zE-N)
<4647> +proj=tmerc +lat_0=0 +lon_0=9 +k=0.9996 +x_0=32500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger zone 25
<4652> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=25500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger zone 26
<4653> +proj=tmerc +lat_0=0 +lon_0=78 +k=1 +x_0=26500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger zone 27
<4654> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=27500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger zone 28
<4655> +proj=tmerc +lat_0=0 +lon_0=84 +k=1 +x_0=28500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger zone 29
<4656> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=29500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger zone 30
<4766> +proj=tmerc +lat_0=0 +lon_0=90 +k=1 +x_0=30500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger zone 31
<4767> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=31500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger zone 32
<4768> +proj=tmerc +lat_0=0 +lon_0=96 +k=1 +x_0=32500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger zone 33
<4769> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=33500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger zone 34
<4770> +proj=tmerc +lat_0=0 +lon_0=102 +k=1 +x_0=34500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger zone 35
<4771> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=35500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger zone 36
<4772> +proj=tmerc +lat_0=0 +lon_0=108 +k=1 +x_0=36500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger zone 37
<4773> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=37500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger zone 38
<4774> +proj=tmerc +lat_0=0 +lon_0=114 +k=1 +x_0=38500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger zone 39
<4775> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=39500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger zone 40
<4776> +proj=tmerc +lat_0=0 +lon_0=120 +k=1 +x_0=40500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger zone 41
<4777> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=41500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger zone 42
<4778> +proj=tmerc +lat_0=0 +lon_0=126 +k=1 +x_0=42500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger zone 43
<4779> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=43500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger zone 44
<4780> +proj=tmerc +lat_0=0 +lon_0=132 +k=1 +x_0=44500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger zone 45
<4781> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=45500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger CM 75E
<4782> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger CM 78E
<4783> +proj=tmerc +lat_0=0 +lon_0=78 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger CM 81E
<4784> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger CM 84E
<4785> +proj=tmerc +lat_0=0 +lon_0=84 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger CM 87E
<4786> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger CM 90E
<4787> +proj=tmerc +lat_0=0 +lon_0=90 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger CM 93E
<4788> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger CM 96E
<4789> +proj=tmerc +lat_0=0 +lon_0=96 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger CM 99E
<4790> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger CM 102E
<4791> +proj=tmerc +lat_0=0 +lon_0=102 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger CM 105E
<4792> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger CM 108E
<4793> +proj=tmerc +lat_0=0 +lon_0=108 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger CM 111E
<4794> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger CM 114E
<4795> +proj=tmerc +lat_0=0 +lon_0=114 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger CM 117E
<4796> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger CM 120E
<4797> +proj=tmerc +lat_0=0 +lon_0=120 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger CM 123E
<4798> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger CM 126E
<4799> +proj=tmerc +lat_0=0 +lon_0=126 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger CM 129E
<4800> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger CM 132E
<4812> +proj=tmerc +lat_0=0 +lon_0=132 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# New Beijing / 3-degree Gauss-Kruger CM 135E
<4822> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs  <>
# WGS 84 / Cape Verde National
<4826> +proj=lcc +lat_1=15 +lat_2=16.66666666666667 +lat_0=15.83333333333333 +lon_0=-24 +x_0=161587.83 +y_0=128511.202 +datum=WGS84 +units=m +no_defs  <>
# ETRS89 / LCC Germany (N-E)
<4839> +proj=lcc +lat_1=48.66666666666666 +lat_2=53.66666666666666 +lat_0=51 +lon_0=10.5 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 5 (deprecated)
<4855> +proj=tmerc +lat_0=0 +lon_0=5.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 6 (deprecated)
<4856> +proj=tmerc +lat_0=0 +lon_0=6.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 7 (deprecated)
<4857> +proj=tmerc +lat_0=0 +lon_0=7.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 8 (deprecated)
<4858> +proj=tmerc +lat_0=0 +lon_0=8.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 9 (deprecated)
<4859> +proj=tmerc +lat_0=0 +lon_0=9.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 10 (deprecated)
<4860> +proj=tmerc +lat_0=0 +lon_0=10.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 11 (deprecated)
<4861> +proj=tmerc +lat_0=0 +lon_0=11.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 12 (deprecated)
<4862> +proj=tmerc +lat_0=0 +lon_0=12.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 13 (deprecated)
<4863> +proj=tmerc +lat_0=0 +lon_0=13.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 14 (deprecated)
<4864> +proj=tmerc +lat_0=0 +lon_0=14.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 15 (deprecated)
<4865> +proj=tmerc +lat_0=0 +lon_0=15.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 16 (deprecated)
<4866> +proj=tmerc +lat_0=0 +lon_0=16.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 17 (deprecated)
<4867> +proj=tmerc +lat_0=0 +lon_0=17.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 18 (deprecated)
<4868> +proj=tmerc +lat_0=0 +lon_0=18.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 19 (deprecated)
<4869> +proj=tmerc +lat_0=0 +lon_0=19.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 20 (deprecated)
<4870> +proj=tmerc +lat_0=0 +lon_0=20.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 21 (deprecated)
<4871> +proj=tmerc +lat_0=0 +lon_0=21.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 22 (deprecated)
<4872> +proj=tmerc +lat_0=0 +lon_0=22.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 23 (deprecated)
<4873> +proj=tmerc +lat_0=0 +lon_0=23.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 24 (deprecated)
<4874> +proj=tmerc +lat_0=0 +lon_0=24.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 25 (deprecated)
<4875> +proj=tmerc +lat_0=0 +lon_0=25.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 26 (deprecated)
<4876> +proj=tmerc +lat_0=0 +lon_0=26.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 27 (deprecated)
<4877> +proj=tmerc +lat_0=0 +lon_0=27.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 28 (deprecated)
<4878> +proj=tmerc +lat_0=0 +lon_0=28.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 29 (deprecated)
<4879> +proj=tmerc +lat_0=0 +lon_0=29.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 30 (deprecated)
<4880> +proj=tmerc +lat_0=0 +lon_0=30.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# PTRA08 / UTM zone 25N
<5014> +proj=utm +zone=25 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# PTRA08 / UTM zone 26N
<5015> +proj=utm +zone=26 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# PTRA08 / UTM zone 28N
<5016> +proj=utm +zone=28 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Lisbon 1890 / Portugal Bonne New
# Unable to translate coordinate system EPSG:5017 into PROJ.4 format.
#
# Lisbon / Portuguese Grid New
<5018> +proj=tmerc +lat_0=39.66666666666666 +lon_0=-8.131906111111112 +k=1 +x_0=0 +y_0=0 +ellps=intl +towgs84=-304.046,-60.576,103.64,0,0,0,0 +units=m +no_defs  <>
# WGS 84 / UPS North (E,N)
<5041> +proj=stere +lat_0=90 +lat_ts=90 +lon_0=0 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UPS South (E,N)
<5042> +proj=stere +lat_0=-90 +lat_ts=-90 +lon_0=0 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs  <>
# ETRS89 / TM35FIN(N,E)
<5048> +proj=utm +zone=35 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD27 / Conus Albers
<5069> +proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=23 +lon_0=-96 +x_0=0 +y_0=0 +datum=NAD27 +units=m +no_defs  <>
# NAD83 / Conus Albers
<5070> +proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=23 +lon_0=-96 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83(HARN) / Conus Albers
<5071> +proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=23 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Conus Albers
<5072> +proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=23 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 5
<5105> +proj=tmerc +lat_0=58 +lon_0=5.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 6
<5106> +proj=tmerc +lat_0=58 +lon_0=6.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 7
<5107> +proj=tmerc +lat_0=58 +lon_0=7.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 8
<5108> +proj=tmerc +lat_0=58 +lon_0=8.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 9
<5109> +proj=tmerc +lat_0=58 +lon_0=9.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 10
<5110> +proj=tmerc +lat_0=58 +lon_0=10.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 11
<5111> +proj=tmerc +lat_0=58 +lon_0=11.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 12
<5112> +proj=tmerc +lat_0=58 +lon_0=12.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 13
<5113> +proj=tmerc +lat_0=58 +lon_0=13.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 14
<5114> +proj=tmerc +lat_0=58 +lon_0=14.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 15
<5115> +proj=tmerc +lat_0=58 +lon_0=15.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 16
<5116> +proj=tmerc +lat_0=58 +lon_0=16.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 17
<5117> +proj=tmerc +lat_0=58 +lon_0=17.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 18
<5118> +proj=tmerc +lat_0=58 +lon_0=18.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 19
<5119> +proj=tmerc +lat_0=58 +lon_0=19.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 20
<5120> +proj=tmerc +lat_0=58 +lon_0=20.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 21
<5121> +proj=tmerc +lat_0=58 +lon_0=21.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 22
<5122> +proj=tmerc +lat_0=58 +lon_0=22.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 23
<5123> +proj=tmerc +lat_0=58 +lon_0=23.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 24
<5124> +proj=tmerc +lat_0=58 +lon_0=24.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 25
<5125> +proj=tmerc +lat_0=58 +lon_0=25.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 26
<5126> +proj=tmerc +lat_0=58 +lon_0=26.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 27
<5127> +proj=tmerc +lat_0=58 +lon_0=27.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 28
<5128> +proj=tmerc +lat_0=58 +lon_0=28.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 29
<5129> +proj=tmerc +lat_0=58 +lon_0=29.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / NTM zone 30
<5130> +proj=tmerc +lat_0=58 +lon_0=30.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Korean 1985 / East Sea Belt
<5167> +proj=tmerc +lat_0=38 +lon_0=131 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs  <>
# Korean 1985 / Central Belt Jeju
<5168> +proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=550000 +ellps=bessel +units=m +no_defs  <>
# Tokyo 1892 / Korea West Belt
<5169> +proj=tmerc +lat_0=38 +lon_0=125 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs  <>
# Tokyo 1892 / Korea Central Belt
<5170> +proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs  <>
# Tokyo 1892 / Korea East Belt
<5171> +proj=tmerc +lat_0=38 +lon_0=129 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs  <>
# Tokyo 1892 / Korea East Sea Belt
<5172> +proj=tmerc +lat_0=38 +lon_0=131 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs  <>
# Korean 1985 / Modified West Belt
<5173> +proj=tmerc +lat_0=38 +lon_0=125.0028902777778 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs  <>
# Korean 1985 / Modified Central Belt
<5174> +proj=tmerc +lat_0=38 +lon_0=127.0028902777778 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs  <>
# Korean 1985 / Modified Central Belt Jeju
<5175> +proj=tmerc +lat_0=38 +lon_0=127.0028902777778 +k=1 +x_0=200000 +y_0=550000 +ellps=bessel +units=m +no_defs  <>
# Korean 1985 / Modified East Belt
<5176> +proj=tmerc +lat_0=38 +lon_0=129.0028902777778 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs  <>
# Korean 1985 / Modified East Sea Belt
<5177> +proj=tmerc +lat_0=38 +lon_0=131.0028902777778 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs  <>
# Korean 1985 / Unified CS
<5178> +proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=1000000 +y_0=2000000 +ellps=bessel +units=m +no_defs  <>
# Korea 2000 / Unified CS
<5179> +proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=1000000 +y_0=2000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Korea 2000 / West Belt
<5180> +proj=tmerc +lat_0=38 +lon_0=125 +k=1 +x_0=200000 +y_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Korea 2000 / Central Belt
<5181> +proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Korea 2000 / Central Belt Jeju
<5182> +proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=550000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Korea 2000 / East Belt
<5183> +proj=tmerc +lat_0=38 +lon_0=129 +k=1 +x_0=200000 +y_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Korea 2000 / East Sea Belt
<5184> +proj=tmerc +lat_0=38 +lon_0=131 +k=1 +x_0=200000 +y_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Korea 2000 / West Belt 2010
<5185> +proj=tmerc +lat_0=38 +lon_0=125 +k=1 +x_0=200000 +y_0=600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Korea 2000 / Central Belt 2010
<5186> +proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Korea 2000 / East Belt 2010
<5187> +proj=tmerc +lat_0=38 +lon_0=129 +k=1 +x_0=200000 +y_0=600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Korea 2000 / East Sea Belt 2010
<5188> +proj=tmerc +lat_0=38 +lon_0=131 +k=1 +x_0=200000 +y_0=600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# S-JTSK (Ferro) / Krovak East North
<5221> +proj=krovak +lat_0=49.5 +lon_0=42.5 +alpha=30.28813972222222 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=589,76,480,0,0,0,0 +pm=ferro +units=m +no_defs  <>
# WGS 84 / Gabon TM
<5223> +proj=tmerc +lat_0=0 +lon_0=12 +k=0.9996 +x_0=500000 +y_0=500000 +datum=WGS84 +units=m +no_defs  <>
# S-JTSK/05 (Ferro) / Modified Krovak
# Unable to translate coordinate system EPSG:5224 into PROJ.4 format.
#
# S-JTSK/05 (Ferro) / Modified Krovak East North
# Unable to translate coordinate system EPSG:5225 into PROJ.4 format.
#
# Kandawala / Sri Lanka Grid
<5234> +proj=tmerc +lat_0=7.000480277777778 +lon_0=80.77171111111112 +k=0.9999238418 +x_0=200000 +y_0=200000 +a=6377276.345 +b=6356075.41314024 +towgs84=-97,787,86,0,0,0,0 +units=m +no_defs  <>
# SLD99 / Sri Lanka Grid 1999
<5235> +proj=tmerc +lat_0=7.000471527777778 +lon_0=80.77171308333334 +k=0.9999238418 +x_0=500000 +y_0=500000 +a=6377276.345 +b=6356075.41314024 +towgs84=-0.293,766.95,87.713,0.195704,1.695068,3.473016,-0.039338 +units=m +no_defs  <>
# ETRS89 / LCC Germany (E-N)
<5243> +proj=lcc +lat_1=48.66666666666666 +lat_2=53.66666666666666 +lat_0=51 +lon_0=10.5 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GDBD2009 / Brunei BRSO
<5247> +proj=omerc +lat_0=4 +lonc=115 +alpha=53.31580995 +k=0.99984 +x_0=0 +y_0=0 +no_uoff +gamma=53.13010236111111 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# TUREF / TM27
<5253> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# TUREF / TM30
<5254> +proj=tmerc +lat_0=0 +lon_0=30 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# TUREF / TM33
<5255> +proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# TUREF / TM36
<5256> +proj=tmerc +lat_0=0 +lon_0=36 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# TUREF / TM39
<5257> +proj=tmerc +lat_0=0 +lon_0=39 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# TUREF / TM42
<5258> +proj=tmerc +lat_0=0 +lon_0=42 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# TUREF / TM45
<5259> +proj=tmerc +lat_0=0 +lon_0=45 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DRUKREF 03 / Bhutan National Grid
<5266> +proj=tmerc +lat_0=0 +lon_0=90 +k=1 +x_0=250000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# TUREF / 3-degree Gauss-Kruger zone 9
<5269> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=9500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# TUREF / 3-degree Gauss-Kruger zone 10
<5270> +proj=tmerc +lat_0=0 +lon_0=30 +k=1 +x_0=10500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# TUREF / 3-degree Gauss-Kruger zone 11
<5271> +proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=11500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# TUREF / 3-degree Gauss-Kruger zone 12
<5272> +proj=tmerc +lat_0=0 +lon_0=36 +k=1 +x_0=12500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# TUREF / 3-degree Gauss-Kruger zone 13
<5273> +proj=tmerc +lat_0=0 +lon_0=39 +k=1 +x_0=13500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# TUREF / 3-degree Gauss-Kruger zone 14
<5274> +proj=tmerc +lat_0=0 +lon_0=42 +k=1 +x_0=14500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# TUREF / 3-degree Gauss-Kruger zone 15
<5275> +proj=tmerc +lat_0=0 +lon_0=45 +k=1 +x_0=15500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DRUKREF 03 / Bumthang TM
<5292> +proj=tmerc +lat_0=0 +lon_0=90.73333333333333 +k=1 +x_0=250000 +y_0=-2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DRUKREF 03 / Chhukha TM
<5293> +proj=tmerc +lat_0=0 +lon_0=89.55 +k=1 +x_0=250000 +y_0=-2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DRUKREF 03 / Dagana TM
<5294> +proj=tmerc +lat_0=0 +lon_0=89.84999999999999 +k=1 +x_0=250000 +y_0=-2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DRUKREF 03 / Gasa TM
<5295> +proj=tmerc +lat_0=0 +lon_0=90.03333333333333 +k=1 +x_0=250000 +y_0=-2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DRUKREF 03 / Ha TM
<5296> +proj=tmerc +lat_0=0 +lon_0=90.15000000000001 +k=1 +x_0=250000 +y_0=-2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DRUKREF 03 / Lhuentse TM
<5297> +proj=tmerc +lat_0=0 +lon_0=91.13333333333334 +k=1 +x_0=250000 +y_0=-2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DRUKREF 03 / Mongar TM
<5298> +proj=tmerc +lat_0=0 +lon_0=91.23333333333333 +k=1 +x_0=250000 +y_0=-2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DRUKREF 03 / Paro TM
<5299> +proj=tmerc +lat_0=0 +lon_0=89.34999999999999 +k=1 +x_0=250000 +y_0=-2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DRUKREF 03 / Pemagatshel TM
<5300> +proj=tmerc +lat_0=0 +lon_0=91.34999999999999 +k=1 +x_0=250000 +y_0=-2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DRUKREF 03 / Punakha TM
<5301> +proj=tmerc +lat_0=0 +lon_0=89.84999999999999 +k=1 +x_0=250000 +y_0=-2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DRUKREF 03 / Samdrup Jongkhar TM
<5302> +proj=tmerc +lat_0=0 +lon_0=91.56666666666666 +k=1 +x_0=250000 +y_0=-2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DRUKREF 03 / Samtse TM
<5303> +proj=tmerc +lat_0=0 +lon_0=89.06666666666666 +k=1 +x_0=250000 +y_0=-2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DRUKREF 03 / Sarpang TM
<5304> +proj=tmerc +lat_0=0 +lon_0=90.26666666666667 +k=1 +x_0=250000 +y_0=-2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DRUKREF 03 / Thimphu TM
<5305> +proj=tmerc +lat_0=0 +lon_0=89.55 +k=1 +x_0=250000 +y_0=-2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DRUKREF 03 / Trashigang TM
<5306> +proj=tmerc +lat_0=0 +lon_0=91.75 +k=1 +x_0=250000 +y_0=-2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DRUKREF 03 / Trongsa TM
<5307> +proj=tmerc +lat_0=0 +lon_0=90.5 +k=1 +x_0=250000 +y_0=-2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DRUKREF 03 / Tsirang TM
<5308> +proj=tmerc +lat_0=0 +lon_0=90.16666666666667 +k=1 +x_0=250000 +y_0=-2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DRUKREF 03 / Wangdue Phodrang TM
<5309> +proj=tmerc +lat_0=0 +lon_0=90.11666666666666 +k=1 +x_0=250000 +y_0=-2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DRUKREF 03 / Yangtse TM
<5310> +proj=tmerc +lat_0=0 +lon_0=91.56666666666666 +k=1 +x_0=250000 +y_0=-2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DRUKREF 03 / Zhemgang TM
<5311> +proj=tmerc +lat_0=0 +lon_0=90.86666666666666 +k=1 +x_0=250000 +y_0=-2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / Faroe TM
<5316> +proj=tmerc +lat_0=0 +lon_0=-7 +k=0.999997 +x_0=200000 +y_0=-6000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83 / Teranet Ontario Lambert
<5320> +proj=lcc +lat_1=44.5 +lat_2=54.5 +lat_0=0 +lon_0=-84 +x_0=1000000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83(CSRS) / Teranet Ontario Lambert
<5321> +proj=lcc +lat_1=44.5 +lat_2=54.5 +lat_0=0 +lon_0=-84 +x_0=1000000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ISN2004 / Lambert 2004
<5325> +proj=lcc +lat_1=64.25 +lat_2=65.75 +lat_0=65 +lon_0=-19 +x_0=1700000 +y_0=300000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Segara (Jakarta) / NEIEZ
<5329> +proj=merc +lon_0=3.192280555555556 +k=0.997 +x_0=3900000 +y_0=900000 +ellps=bessel +towgs84=-403,684,41,0,0,0,0 +pm=jakarta +units=m +no_defs  <>
# Batavia (Jakarta) / NEIEZ
<5330> +proj=merc +lon_0=3.192280555555556 +k=0.997 +x_0=3900000 +y_0=900000 +ellps=bessel +towgs84=-377,681,-50,0,0,0,0 +pm=jakarta +units=m +no_defs  <>
# Makassar (Jakarta) / NEIEZ
<5331> +proj=merc +lon_0=3.192280555555556 +k=0.997 +x_0=3900000 +y_0=900000 +ellps=bessel +towgs84=-587.8,519.75,145.76,0,0,0,0 +pm=jakarta +units=m +no_defs  <>
# Aratu / UTM zone 25S
<5337> +proj=utm +zone=25 +south +ellps=intl +towgs84=-151.99,287.04,-147.45,0,0,0,0 +units=m +no_defs  <>
# POSGAR 2007 / Argentina 1
<5343> +proj=tmerc +lat_0=-90 +lon_0=-72 +k=1 +x_0=1500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# POSGAR 2007 / Argentina 2
<5344> +proj=tmerc +lat_0=-90 +lon_0=-69 +k=1 +x_0=2500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# POSGAR 2007 / Argentina 3
<5345> +proj=tmerc +lat_0=-90 +lon_0=-66 +k=1 +x_0=3500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# POSGAR 2007 / Argentina 4
<5346> +proj=tmerc +lat_0=-90 +lon_0=-63 +k=1 +x_0=4500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# POSGAR 2007 / Argentina 5
<5347> +proj=tmerc +lat_0=-90 +lon_0=-60 +k=1 +x_0=5500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# POSGAR 2007 / Argentina 6
<5348> +proj=tmerc +lat_0=-90 +lon_0=-57 +k=1 +x_0=6500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# POSGAR 2007 / Argentina 7
<5349> +proj=tmerc +lat_0=-90 +lon_0=-54 +k=1 +x_0=7500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# MARGEN / UTM zone 20S
<5355> +proj=utm +zone=20 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# MARGEN / UTM zone 19S
<5356> +proj=utm +zone=19 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# MARGEN / UTM zone 21S
<5357> +proj=utm +zone=21 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS-Chile / UTM zone 19S
<5361> +proj=utm +zone=19 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS-Chile / UTM zone 18S
<5362> +proj=utm +zone=18 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# CR05 / CRTM05
<5367> +proj=tmerc +lat_0=0 +lon_0=-84 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS-ROU98 / UTM zone 21S
<5382> +proj=utm +zone=21 +south +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS-ROU98 / UTM zone 22S
<5383> +proj=utm +zone=22 +south +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Peru96 / UTM zone 18S
<5387> +proj=utm +zone=18 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Peru96 / UTM zone 17S (deprecated)
<5388> +proj=utm +zone=17 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Peru96 / UTM zone 19S
<5389> +proj=utm +zone=19 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 26S
<5396> +proj=utm +zone=26 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Ocotepeque 1935 / Costa Rica Norte
<5456> +proj=lcc +lat_1=10.46666666666667 +lat_0=10.46666666666667 +lon_0=-84.33333333333333 +k_0=0.99995696 +x_0=500000 +y_0=271820.522 +ellps=clrk66 +towgs84=205,96,-98,0,0,0,0 +units=m +no_defs  <>
# Ocotepeque 1935 / Costa Rica Sur
<5457> +proj=lcc +lat_1=9 +lat_0=9 +lon_0=-83.66666666666667 +k_0=0.99995696 +x_0=500000 +y_0=327987.436 +ellps=clrk66 +towgs84=205,96,-98,0,0,0,0 +units=m +no_defs  <>
# Ocotepeque 1935 / Guatemala Norte (deprecated)
<5458> +proj=lcc +lat_1=16.81666666666667 +lat_0=16.81666666666667 +lon_0=-90.33333333333333 +k_0=0.99992226 +x_0=500000 +y_0=292209.579 +datum=NAD27 +units=m +no_defs  <>
# Ocotepeque 1935 / Guatemala Sur
<5459> +proj=lcc +lat_1=14.9 +lat_0=14.9 +lon_0=-90.33333333333333 +k_0=0.99989906 +x_0=500000 +y_0=325992.681 +ellps=clrk66 +towgs84=205,96,-98,0,0,0,0 +units=m +no_defs  <>
# Ocotepeque 1935 / El Salvador Lambert
<5460> +proj=lcc +lat_1=13.78333333333333 +lat_0=13.78333333333333 +lon_0=-89 +k_0=0.99996704 +x_0=500000 +y_0=295809.184 +ellps=clrk66 +towgs84=205,96,-98,0,0,0,0 +units=m +no_defs  <>
# Ocotepeque 1935 / Nicaragua Norte
<5461> +proj=lcc +lat_1=13.86666666666667 +lat_0=13.86666666666667 +lon_0=-85.5 +k_0=0.99990314 +x_0=500000 +y_0=359891.816 +ellps=clrk66 +towgs84=205,96,-98,0,0,0,0 +units=m +no_defs  <>
# Ocotepeque 1935 / Nicaragua Sur
<5462> +proj=lcc +lat_1=11.73333333333333 +lat_0=11.73333333333333 +lon_0=-85.5 +k_0=0.9999222800000001 +x_0=500000 +y_0=288876.327 +ellps=clrk66 +towgs84=205,96,-98,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 17N
<5463> +proj=utm +zone=17 +ellps=aust_SA +towgs84=-66.87,4.37,-38.52,0,0,0,0 +units=m +no_defs  <>
# Sibun Gorge 1922 / Colony Grid (deprecated)
<5466> +proj=tmerc +lat_0=17.06124194444444 +lon_0=-88.6318575 +k=1 +x_0=66220.02833082761 +y_0=135779.5099885299 +a=6378293.645208759 +b=6356617.987679838 +units=m +no_defs  <>
# Panama-Colon 1911 / Panama Lambert
<5469> +proj=lcc +lat_1=8.416666666666666 +lat_0=8.416666666666666 +lon_0=-80 +k_0=0.99989909 +x_0=500000 +y_0=294865.303 +ellps=clrk66 +units=m +no_defs  <>
# Panama-Colon 1911 / Panama Polyconic
<5472> +proj=poly +lat_0=8.25 +lon_0=-81 +x_0=914391.7962 +y_0=999404.7217154861 +ellps=clrk66 +to_meter=0.9143917962 +no_defs  <>
# RSRGD2000 / MSLC2000
<5479> +proj=lcc +lat_1=-76.66666666666667 +lat_2=-79.33333333333333 +lat_0=-78 +lon_0=163 +x_0=7000000 +y_0=5000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RSRGD2000 / BCLC2000
<5480> +proj=lcc +lat_1=-73.66666666666667 +lat_2=-75.33333333333333 +lat_0=-74.5 +lon_0=165 +x_0=5000000 +y_0=3000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RSRGD2000 / PCLC2000
<5481> +proj=lcc +lat_1=-70.66666666666667 +lat_2=-72.33333333333333 +lat_0=-71.5 +lon_0=166 +x_0=3000000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RSRGD2000 / RSPS2000
<5482> +proj=stere +lat_0=-90 +lat_ts=-90 +lon_0=180 +k=0.994 +x_0=5000000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RGAF09 / UTM zone 20N
<5490> +proj=utm +zone=20 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# S-JTSK / Krovak
<5513> +proj=krovak +lat_0=49.5 +lon_0=24.83333333333333 +alpha=30.28813972222222 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=589,76,480,0,0,0,0 +units=m +no_defs  <>
# S-JTSK / Krovak East North
<5514> +proj=krovak +lat_0=49.5 +lon_0=24.83333333333333 +alpha=30.28813972222222 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=589,76,480,0,0,0,0 +units=m +no_defs  <>
# S-JTSK/05 / Modified Krovak
# Unable to translate coordinate system EPSG:5515 into PROJ.4 format.
#
# S-JTSK/05 / Modified Krovak East North
# Unable to translate coordinate system EPSG:5516 into PROJ.4 format.
#
# CI1971 / Chatham Islands Map Grid
<5518> +proj=tmerc +lat_0=-44 +lon_0=-176.5 +k=1 +x_0=350000 +y_0=650000 +ellps=intl +towgs84=175,-38,113,0,0,0,0 +units=m +no_defs  <>
# CI1979 / Chatham Islands Map Grid
<5519> +proj=tmerc +lat_0=-44 +lon_0=-176.5 +k=1 +x_0=350000 +y_0=650000 +ellps=intl +towgs84=174.05,-25.49,112.57,0,0,0.554,0.2263 +units=m +no_defs  <>
# DHDN / 3-degree Gauss-Kruger zone 1
<5520> +proj=tmerc +lat_0=0 +lon_0=3 +k=1 +x_0=1500000 +y_0=0 +datum=potsdam +units=m +no_defs  <>
# WGS 84 / Gabon TM 2011
<5523> +proj=tmerc +lat_0=0 +lon_0=11.5 +k=0.9996 +x_0=1500000 +y_0=5500000 +datum=WGS84 +units=m +no_defs  <>
# SAD69(96) / Brazil Polyconic
<5530> +proj=poly +lat_0=0 +lon_0=-54 +x_0=5000000 +y_0=10000000 +ellps=aust_SA +towgs84=-67.35,3.88,-38.22,0,0,0,0 +units=m +no_defs  <>
# SAD69(96) / UTM zone 21S
<5531> +proj=utm +zone=21 +south +ellps=aust_SA +towgs84=-67.35,3.88,-38.22,0,0,0,0 +units=m +no_defs  <>
# SAD69(96) / UTM zone 22S (deprecated)
<5532> +proj=utm +zone=22 +south +ellps=aust_SA +towgs84=-66.87,4.37,-38.52,0,0,0,0 +units=m +no_defs  <>
# SAD69(96) / UTM zone 23S
<5533> +proj=utm +zone=23 +south +ellps=aust_SA +towgs84=-67.35,3.88,-38.22,0,0,0,0 +units=m +no_defs  <>
# SAD69(96) / UTM zone 24S
<5534> +proj=utm +zone=24 +south +ellps=aust_SA +towgs84=-67.35,3.88,-38.22,0,0,0,0 +units=m +no_defs  <>
# SAD69(96) / UTM zone 25S
<5535> +proj=utm +zone=25 +south +ellps=aust_SA +towgs84=-67.35,3.88,-38.22,0,0,0,0 +units=m +no_defs  <>
# Corrego Alegre 1961 / UTM zone 21S
<5536> +proj=utm +zone=21 +south +ellps=intl +units=m +no_defs  <>
# Corrego Alegre 1961 / UTM zone 22S
<5537> +proj=utm +zone=22 +south +ellps=intl +units=m +no_defs  <>
# Corrego Alegre 1961 / UTM zone 23S
<5538> +proj=utm +zone=23 +south +ellps=intl +units=m +no_defs  <>
# Corrego Alegre 1961 / UTM zone 24S
<5539> +proj=utm +zone=24 +south +ellps=intl +units=m +no_defs  <>
# PNG94 / PNGMG94 zone 54
<5550> +proj=utm +zone=54 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# PNG94 / PNGMG94 zone 55
<5551> +proj=utm +zone=55 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# PNG94 / PNGMG94 zone 56
<5552> +proj=utm +zone=56 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Ocotepeque 1935 / Guatemala Norte
<5559> +proj=lcc +lat_1=16.81666666666667 +lat_0=16.81666666666667 +lon_0=-90.33333333333333 +k_0=0.99992226 +x_0=500000 +y_0=292209.579 +ellps=clrk66 +towgs84=205,96,-98,0,0,0,0 +units=m +no_defs  <>
# UCS-2000 / Gauss-Kruger zone 4
<5562> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=4500000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / Gauss-Kruger zone 5
<5563> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=5500000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / Gauss-Kruger zone 6
<5564> +proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=6500000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / Gauss-Kruger zone 7
<5565> +proj=tmerc +lat_0=0 +lon_0=39 +k=1 +x_0=7500000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / Gauss-Kruger CM 21E
<5566> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / Gauss-Kruger CM 27E
<5567> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / Gauss-Kruger CM 33E
<5568> +proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / Gauss-Kruger CM 39E
<5569> +proj=tmerc +lat_0=0 +lon_0=39 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / 3-degree Gauss-Kruger zone 7 (deprecated)
<5570> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=7500000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / 3-degree Gauss-Kruger zone 8 (deprecated)
<5571> +proj=tmerc +lat_0=0 +lon_0=24 +k=1 +x_0=8500000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / 3-degree Gauss-Kruger zone 9 (deprecated)
<5572> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=9500000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / 3-degree Gauss-Kruger zone 10 (deprecated)
<5573> +proj=tmerc +lat_0=0 +lon_0=30 +k=1 +x_0=10500000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / 3-degree Gauss-Kruger zone 11 (deprecated)
<5574> +proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=11500000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / 3-degree Gauss-Kruger zone 12 (deprecated)
<5575> +proj=tmerc +lat_0=0 +lon_0=36 +k=1 +x_0=12500000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / 3-degree Gauss-Kruger zone 13 (deprecated)
<5576> +proj=tmerc +lat_0=0 +lon_0=39 +k=1 +x_0=13500000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / 3-degree Gauss-Kruger CM 21E (deprecated)
<5577> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / 3-degree Gauss-Kruger CM 24E (deprecated)
<5578> +proj=tmerc +lat_0=0 +lon_0=24 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / 3-degree Gauss-Kruger CM 27E (deprecated)
<5579> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / 3-degree Gauss-Kruger CM 30E (deprecated)
<5580> +proj=tmerc +lat_0=0 +lon_0=30 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / 3-degree Gauss-Kruger CM 33E (deprecated)
<5581> +proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / 3-degree Gauss-Kruger CM 36E (deprecated)
<5582> +proj=tmerc +lat_0=0 +lon_0=36 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / 3-degree Gauss-Kruger CM 39E (deprecated)
<5583> +proj=tmerc +lat_0=0 +lon_0=39 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# NAD27 / New Brunswick Stereographic (NAD27)
<5588> +proj=sterea +lat_0=46.5 +lon_0=-66.5 +k=0.999912 +x_0=304800 +y_0=304800 +datum=NAD27 +units=ft +no_defs  <>
# Sibun Gorge 1922 / Colony Grid
<5589> +proj=tmerc +lat_0=17.06124194444444 +lon_0=-88.6318575 +k=1 +x_0=66220.02833082761 +y_0=135779.5099885299 +a=6378293.645208759 +b=6356617.987679838 +to_meter=0.3047972654 +no_defs  <>
# FEH2010 / Fehmarnbelt TM
<5596> +proj=tmerc +lat_0=0 +lon_0=11.33333333333333 +k=1 +x_0=1000000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD27 / Michigan East
<5623> +proj=tmerc +lat_0=41.5 +lon_0=-83.66666666666667 +k=0.999942857 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Michigan Old Central
<5624> +proj=tmerc +lat_0=41.5 +lon_0=-85.75 +k=0.999909091 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Michigan West
<5625> +proj=tmerc +lat_0=41.5 +lon_0=-88.75 +k=0.999909091 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# ED50 / TM 6 NE
<5627> +proj=tmerc +lat_0=0 +lon_0=6 +k=0.9996 +x_0=500000 +y_0=0 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# Moznet / UTM zone 38S
<5629> +proj=utm +zone=38 +south +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Pulkovo 1942(58) / Gauss-Kruger zone 2 (E-N)
<5631> +proj=tmerc +lat_0=0 +lon_0=9 +k=1 +x_0=2500000 +y_0=0 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# PTRA08 / LCC Europe
<5632> +proj=lcc +lat_1=35 +lat_2=65 +lat_0=52 +lon_0=10 +x_0=4000000 +y_0=2800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# PTRA08 / LAEA Europe
<5633> +proj=laea +lat_0=52 +lon_0=10 +x_0=4321000 +y_0=3210000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# REGCAN95 / LCC Europe
<5634> +proj=lcc +lat_1=35 +lat_2=65 +lat_0=52 +lon_0=10 +x_0=4000000 +y_0=2800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# REGCAN95 / LAEA Europe
<5635> +proj=laea +lat_0=52 +lon_0=10 +x_0=4321000 +y_0=3210000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# TUREF / LAEA Europe
<5636> +proj=laea +lat_0=52 +lon_0=10 +x_0=4321000 +y_0=3210000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# TUREF / LCC Europe
<5637> +proj=lcc +lat_1=35 +lat_2=65 +lat_0=52 +lon_0=10 +x_0=4000000 +y_0=2800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ISN2004 / LAEA Europe
<5638> +proj=laea +lat_0=52 +lon_0=10 +x_0=4321000 +y_0=3210000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ISN2004 / LCC Europe
<5639> +proj=lcc +lat_1=35 +lat_2=65 +lat_0=52 +lon_0=10 +x_0=4000000 +y_0=2800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / Brazil Mercator
<5641> +proj=merc +lon_0=-43 +lat_ts=-2 +x_0=5000000 +y_0=10000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ED50 / SPBA LCC
<5643> +proj=lcc +lat_1=52.66666666666666 +lat_2=54.33333333333334 +lat_0=48 +lon_0=10 +x_0=815000 +y_0=0 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# RGR92 / UTM zone 39S
<5644> +proj=utm +zone=39 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83 / Vermont (ftUS)
<5646> +proj=tmerc +lat_0=42.5 +lon_0=-72.5 +k=0.999964286 +x_0=500000.00001016 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# ETRS89 / UTM zone 31N (zE-N)
<5649> +proj=tmerc +lat_0=0 +lon_0=3 +k=0.9996 +x_0=31500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 33N (zE-N)
<5650> +proj=tmerc +lat_0=0 +lon_0=15 +k=0.9996 +x_0=33500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 31N (N-zE)
<5651> +proj=tmerc +lat_0=0 +lon_0=3 +k=0.9996 +x_0=31500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 32N (N-zE)
<5652> +proj=tmerc +lat_0=0 +lon_0=9 +k=0.9996 +x_0=32500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 33N (N-zE)
<5653> +proj=tmerc +lat_0=0 +lon_0=15 +k=0.9996 +x_0=33500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Vermont (ftUS)
<5654> +proj=tmerc +lat_0=42.5 +lon_0=-72.5 +k=0.999964286 +x_0=500000.00001016 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Vermont (ftUS)
<5655> +proj=tmerc +lat_0=42.5 +lon_0=-72.5 +k=0.999964286 +x_0=500000.00001016 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# Monte Mario / TM Emilia-Romagna
<5659> +proj=tmerc +lat_0=0 +lon_0=9 +k=0.9996 +x_0=500053 +y_0=-3999820 +ellps=intl +towgs84=-104.1,-49.1,-9.9,0.971,-2.917,0.714,-11.68 +units=m +no_defs  <>
# Pulkovo 1942(58) / Gauss-Kruger zone 3 (E-N)
<5663> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=3500000 +y_0=0 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# Pulkovo 1942(83) / Gauss-Kruger zone 2 (E-N)
<5664> +proj=tmerc +lat_0=0 +lon_0=9 +k=1 +x_0=2500000 +y_0=0 +ellps=krass +towgs84=26,-121,-78,0,0,0,0 +units=m +no_defs  <>
# Pulkovo 1942(83) / Gauss-Kruger zone 3 (E-N)
<5665> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=3500000 +y_0=0 +ellps=krass +towgs84=26,-121,-78,0,0,0,0 +units=m +no_defs  <>
# PD/83 / 3-degree Gauss-Kruger zone 3 (E-N)
<5666> +proj=tmerc +lat_0=0 +lon_0=9 +k=1 +x_0=3500000 +y_0=0 +ellps=bessel +units=m +no_defs  <>
# PD/83 / 3-degree Gauss-Kruger zone 4 (E-N)
<5667> +proj=tmerc +lat_0=0 +lon_0=12 +k=1 +x_0=4500000 +y_0=0 +ellps=bessel +units=m +no_defs  <>
# RD/83 / 3-degree Gauss-Kruger zone 4 (E-N)
<5668> +proj=tmerc +lat_0=0 +lon_0=12 +k=1 +x_0=4500000 +y_0=0 +ellps=bessel +units=m +no_defs  <>
# RD/83 / 3-degree Gauss-Kruger zone 5 (E-N)
<5669> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=5500000 +y_0=0 +ellps=bessel +units=m +no_defs  <>
# Pulkovo 1942(58) / 3-degree Gauss-Kruger zone 3 (E-N)
<5670> +proj=tmerc +lat_0=0 +lon_0=9 +k=1 +x_0=3500000 +y_0=0 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# Pulkovo 1942(58) / 3-degree Gauss-Kruger zone 4 (E-N)
<5671> +proj=tmerc +lat_0=0 +lon_0=12 +k=1 +x_0=4500000 +y_0=0 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# Pulkovo 1942(58) / 3-degree Gauss-Kruger zone 5 (E-N)
<5672> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=5500000 +y_0=0 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs  <>
# Pulkovo 1942(83) / 3-degree Gauss-Kruger zone 3 (E-N)
<5673> +proj=tmerc +lat_0=0 +lon_0=9 +k=1 +x_0=3500000 +y_0=0 +ellps=krass +towgs84=26,-121,-78,0,0,0,0 +units=m +no_defs  <>
# Pulkovo 1942(83) / 3-degree Gauss-Kruger zone 4 (E-N)
<5674> +proj=tmerc +lat_0=0 +lon_0=12 +k=1 +x_0=4500000 +y_0=0 +ellps=krass +towgs84=26,-121,-78,0,0,0,0 +units=m +no_defs  <>
# Pulkovo 1942(83) / 3-degree Gauss-Kruger zone 5 (E-N)
<5675> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=5500000 +y_0=0 +ellps=krass +towgs84=26,-121,-78,0,0,0,0 +units=m +no_defs  <>
# DHDN / 3-degree Gauss-Kruger zone 2 (E-N)
<5676> +proj=tmerc +lat_0=0 +lon_0=6 +k=1 +x_0=2500000 +y_0=0 +datum=potsdam +units=m +no_defs  <>
# DHDN / 3-degree Gauss-Kruger zone 3 (E-N)
<5677> +proj=tmerc +lat_0=0 +lon_0=9 +k=1 +x_0=3500000 +y_0=0 +datum=potsdam +units=m +no_defs  <>
# DHDN / 3-degree Gauss-Kruger zone 4 (E-N)
<5678> +proj=tmerc +lat_0=0 +lon_0=12 +k=1 +x_0=4500000 +y_0=0 +datum=potsdam +units=m +no_defs  <>
# DHDN / 3-degree Gauss-Kruger zone 5 (E-N)
<5679> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=5500000 +y_0=0 +datum=potsdam +units=m +no_defs  <>
# DHDN / 3-degree Gauss-Kruger zone 1 (E-N)
<5680> +proj=tmerc +lat_0=0 +lon_0=3 +k=1 +x_0=1500000 +y_0=0 +datum=potsdam +units=m +no_defs  <>
# DB_REF / 3-degree Gauss-Kruger zone 2 (E-N)
<5682> +proj=tmerc +lat_0=0 +lon_0=6 +k=1 +x_0=2500000 +y_0=0 +ellps=bessel +units=m +no_defs  <>
# DB_REF / 3-degree Gauss-Kruger zone 3 (E-N)
<5683> +proj=tmerc +lat_0=0 +lon_0=9 +k=1 +x_0=3500000 +y_0=0 +ellps=bessel +units=m +no_defs  <>
# DB_REF / 3-degree Gauss-Kruger zone 4 (E-N)
<5684> +proj=tmerc +lat_0=0 +lon_0=12 +k=1 +x_0=4500000 +y_0=0 +ellps=bessel +units=m +no_defs  <>
# DB_REF / 3-degree Gauss-Kruger zone 5 (E-N)
<5685> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=5500000 +y_0=0 +ellps=bessel +units=m +no_defs  <>
# NZGD2000 / UTM zone 1S
<5700> +proj=utm +zone=1 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# EPSG topocentric example A
# Unable to translate coordinate system EPSG:5819 into PROJ.4 format.
#
# EPSG topocentric example B
# Unable to translate coordinate system EPSG:5820 into PROJ.4 format.
#
# EPSG vertical perspective example
# Unable to translate coordinate system EPSG:5821 into PROJ.4 format.
#
# AGD66 / ACT Standard Grid
<5825> +proj=tmerc +lat_0=-35.31773627777778 +lon_0=149.0092948305555 +k=1.000086 +x_0=200000 +y_0=600000 +ellps=aust_SA +towgs84=-117.808,-51.536,137.784,0.303,0.446,0.234,-0.29 +units=m +no_defs  <>
# Yemen NGN96 / UTM zone 37N
<5836> +proj=utm +zone=37 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Yemen NGN96 / UTM zone 40N
<5837> +proj=utm +zone=40 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Peru96 / UTM zone 17S
<5839> +proj=utm +zone=17 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# WGS 84 / TM 12 SE
<5842> +proj=tmerc +lat_0=0 +lon_0=12 +k=0.9996 +x_0=500000 +y_0=10000000 +datum=WGS84 +units=m +no_defs  <>
# RGRDC 2005 / Congo TM zone 30
<5844> +proj=tmerc +lat_0=0 +lon_0=30 +k=0.9999 +x_0=500000 +y_0=10000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SAD69(96) / UTM zone 22S
<5858> +proj=utm +zone=22 +south +ellps=aust_SA +towgs84=-67.35,3.88,-38.22,0,0,0,0 +units=m +no_defs  <>
# SAD69(96) / UTM zone 18S
<5875> +proj=utm +zone=18 +south +ellps=aust_SA +towgs84=-67.35,3.88,-38.22,0,0,0,0 +units=m +no_defs  <>
# SAD69(96) / UTM zone 19S
<5876> +proj=utm +zone=19 +south +ellps=aust_SA +towgs84=-67.35,3.88,-38.22,0,0,0,0 +units=m +no_defs  <>
# SAD69(96) / UTM zone 20S
<5877> +proj=utm +zone=20 +south +ellps=aust_SA +towgs84=-67.35,3.88,-38.22,0,0,0,0 +units=m +no_defs  <>
# Cadastre 1997 / UTM zone 38S
<5879> +proj=utm +zone=38 +south +ellps=intl +towgs84=-381.788,-57.501,-256.673,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / Brazil Polyconic
<5880> +proj=poly +lat_0=0 +lon_0=-54 +x_0=5000000 +y_0=10000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# TGD2005 / Tonga Map Grid
<5887> +proj=tmerc +lat_0=0 +lon_0=-177 +k=0.9996 +x_0=1500000 +y_0=5000000 +ellps=GRS80 +units=m +no_defs  <>
# JAXA Snow Depth Polar Stereographic North
<5890> +proj=stere +lat_0=90 +lat_ts=70 +lon_0=90 +k=1 +x_0=0 +y_0=0 +a=6378273 +b=6356889.449 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic Regional zone A1
<5921> +proj=lcc +lat_1=85 +lat_2=77 +lat_0=81.31722600000001 +lon_0=-111 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic Regional zone A2
<5922> +proj=lcc +lat_1=85 +lat_2=77 +lat_0=81.31722600000001 +lon_0=-39 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic Regional zone A3
<5923> +proj=lcc +lat_1=85 +lat_2=77 +lat_0=81.31722600000001 +lon_0=33 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic Regional zone A4
<5924> +proj=lcc +lat_1=85 +lat_2=77 +lat_0=81.31722600000001 +lon_0=105 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic Regional zone A5
<5925> +proj=lcc +lat_1=85 +lat_2=77 +lat_0=81.31722600000001 +lon_0=177 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic Regional zone B1
<5926> +proj=lcc +lat_1=77 +lat_2=69 +lat_0=73.15574086111111 +lon_0=-111 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic Regional zone B2
<5927> +proj=lcc +lat_1=77 +lat_2=69 +lat_0=73.15574086111111 +lon_0=-39 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic Regional zone B3
<5928> +proj=lcc +lat_1=77 +lat_2=69 +lat_0=73.15574086111111 +lon_0=33 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic Regional zone B4
<5929> +proj=lcc +lat_1=77 +lat_2=69 +lat_0=73.15574086111111 +lon_0=105 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic Regional zone B5
<5930> +proj=lcc +lat_1=77 +lat_2=69 +lat_0=73.15574086111111 +lon_0=177 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic Regional zone C1
<5931> +proj=lcc +lat_1=69 +lat_2=61 +lat_0=65.10127088888888 +lon_0=-111 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic Regional zone C2
<5932> +proj=lcc +lat_1=69 +lat_2=61 +lat_0=65.10127088888888 +lon_0=-39 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic Regional zone C3
<5933> +proj=lcc +lat_1=69 +lat_2=61 +lat_0=65.10127088888888 +lon_0=33 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic Regional zone C4
<5934> +proj=lcc +lat_1=69 +lat_2=61 +lat_0=65.10127088888888 +lon_0=105 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic Regional zone C5
<5935> +proj=lcc +lat_1=69 +lat_2=61 +lat_0=65.10127088888888 +lon_0=177 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Alaska Polar Stereographic
<5936> +proj=stere +lat_0=90 +lat_ts=90 +lon_0=-150 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Canada Polar Stereographic
<5937> +proj=stere +lat_0=90 +lat_ts=90 +lon_0=-100 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Greenland Polar Stereographic
<5938> +proj=stere +lat_0=90 +lat_ts=90 +lon_0=-33 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Norway Polar Stereographic
<5939> +proj=stere +lat_0=90 +lat_ts=90 +lon_0=18 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Russia Polar Stereographic
<5940> +proj=stere +lat_0=90 +lat_ts=90 +lon_0=105 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs  <>
# GR96 / EPSG Arctic zone 1-25
<6050> +proj=lcc +lat_1=87 +lat_2=83.66666666666667 +lat_0=85.43711833333333 +lon_0=-30 +x_0=25500000 +y_0=1500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / EPSG Arctic zone 2-18
<6051> +proj=lcc +lat_1=83.66666666666667 +lat_2=80.33333333333333 +lat_0=82.05842488888888 +lon_0=-52 +x_0=18500000 +y_0=2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / EPSG Arctic zone 2-20
<6052> +proj=lcc +lat_1=83.66666666666667 +lat_2=80.33333333333333 +lat_0=82.05842488888888 +lon_0=-12 +x_0=20500000 +y_0=2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / EPSG Arctic zone 3-29
<6053> +proj=lcc +lat_1=80.33333333333333 +lat_2=77 +lat_0=78.70733752777778 +lon_0=-69 +x_0=29500000 +y_0=3500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / EPSG Arctic zone 3-31
<6054> +proj=lcc +lat_1=80.33333333333333 +lat_2=77 +lat_0=78.70733752777778 +lon_0=-39 +x_0=31500000 +y_0=3500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / EPSG Arctic zone 3-33
<6055> +proj=lcc +lat_1=80.33333333333333 +lat_2=77 +lat_0=78.70733752777778 +lon_0=-10 +x_0=33500000 +y_0=3500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / EPSG Arctic zone 4-20
<6056> +proj=lcc +lat_1=77 +lat_2=73.66666666666667 +lat_0=75.36440330555556 +lon_0=-64 +x_0=20500000 +y_0=4500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / EPSG Arctic zone 4-22
<6057> +proj=lcc +lat_1=77 +lat_2=73.66666666666667 +lat_0=75.36440330555556 +lon_0=-39 +x_0=22500000 +y_0=4500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / EPSG Arctic zone 4-24
<6058> +proj=lcc +lat_1=77 +lat_2=73.66666666666667 +lat_0=75.36440330555556 +lon_0=-14 +x_0=24500000 +y_0=4500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / EPSG Arctic zone 5-41
<6059> +proj=lcc +lat_1=73.66666666666667 +lat_2=70.33333333333333 +lat_0=72.02500919444445 +lon_0=-62 +x_0=41500000 +y_0=5500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / EPSG Arctic zone 5-43
<6060> +proj=lcc +lat_1=73.66666666666667 +lat_2=70.33333333333333 +lat_0=72.02500919444445 +lon_0=-42 +x_0=43500000 +y_0=5500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / EPSG Arctic zone 5-45
<6061> +proj=lcc +lat_1=73.66666666666667 +lat_2=70.33333333333333 +lat_0=72.02500919444445 +lon_0=-22 +x_0=45500000 +y_0=5500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / EPSG Arctic zone 6-26
<6062> +proj=lcc +lat_1=70.33333333333333 +lat_2=67 +lat_0=68.68747555555557 +lon_0=-56 +x_0=26500000 +y_0=6500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / EPSG Arctic zone 6-28
<6063> +proj=lcc +lat_1=70.33333333333333 +lat_2=67 +lat_0=68.68747555555557 +lon_0=-38 +x_0=28500000 +y_0=6500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / EPSG Arctic zone 6-30
<6064> +proj=lcc +lat_1=70.33333333333333 +lat_2=67 +lat_0=68.68747555555557 +lon_0=-20 +x_0=30500000 +y_0=6500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / EPSG Arctic zone 7-11
<6065> +proj=lcc +lat_1=67 +lat_2=63.66666666666666 +lat_0=65.35103930555555 +lon_0=-51 +x_0=11500000 +y_0=7500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / EPSG Arctic zone 7-13
<6066> +proj=lcc +lat_1=67 +lat_2=63.66666666666666 +lat_0=65.35103930555555 +lon_0=-34 +x_0=13500000 +y_0=7500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / EPSG Arctic zone 8-20
<6067> +proj=lcc +lat_1=63.66666666666666 +lat_2=60.33333333333334 +lat_0=62.01530688888889 +lon_0=-52 +x_0=20500000 +y_0=8500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GR96 / EPSG Arctic zone 8-22
<6068> +proj=lcc +lat_1=63.66666666666666 +lat_2=60.33333333333334 +lat_0=62.01530688888889 +lon_0=-37 +x_0=22500000 +y_0=8500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / EPSG Arctic zone 2-22
<6069> +proj=lcc +lat_1=83.66666666666667 +lat_2=80.33333333333333 +lat_0=82.05842488888888 +lon_0=16 +x_0=22500000 +y_0=2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / EPSG Arctic zone 3-11
<6070> +proj=lcc +lat_1=80.33333333333333 +lat_2=77 +lat_0=78.70733752777778 +lon_0=21 +x_0=11500000 +y_0=3500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / EPSG Arctic zone 4-26
<6071> +proj=lcc +lat_1=77 +lat_2=73.66666666666667 +lat_0=75.36440330555556 +lon_0=10 +x_0=26500000 +y_0=4500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / EPSG Arctic zone 4-28
<6072> +proj=lcc +lat_1=77 +lat_2=73.66666666666667 +lat_0=75.36440330555556 +lon_0=34 +x_0=28500000 +y_0=4500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / EPSG Arctic zone 5-11
<6073> +proj=lcc +lat_1=73.66666666666667 +lat_2=70.33333333333333 +lat_0=72.02500919444445 +lon_0=14 +x_0=11500000 +y_0=5500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / EPSG Arctic zone 5-13
<6074> +proj=lcc +lat_1=73.66666666666667 +lat_2=70.33333333333333 +lat_0=72.02500919444445 +lon_0=34 +x_0=13500000 +y_0=5500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 2-24
<6075> +proj=lcc +lat_1=83.66666666666667 +lat_2=80.33333333333333 +lat_0=82.05842488888888 +lon_0=53 +x_0=24500000 +y_0=2500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 2-26
<6076> +proj=lcc +lat_1=83.66666666666667 +lat_2=80.33333333333333 +lat_0=82.05842488888888 +lon_0=93 +x_0=26500000 +y_0=2500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 3-13
<6077> +proj=lcc +lat_1=80.33333333333333 +lat_2=77 +lat_0=78.70733752777778 +lon_0=52 +x_0=13500000 +y_0=3500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 3-15
<6078> +proj=lcc +lat_1=80.33333333333333 +lat_2=77 +lat_0=78.70733752777778 +lon_0=83 +x_0=15500000 +y_0=3500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 3-17
<6079> +proj=lcc +lat_1=80.33333333333333 +lat_2=77 +lat_0=78.70733752777778 +lon_0=114 +x_0=17500000 +y_0=3500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 3-19
<6080> +proj=lcc +lat_1=80.33333333333333 +lat_2=77 +lat_0=78.70733752777778 +lon_0=145 +x_0=19500000 +y_0=3500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 4-30
<6081> +proj=lcc +lat_1=77 +lat_2=73.66666666666667 +lat_0=75.36440330555556 +lon_0=58 +x_0=30500000 +y_0=4500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 4-32
<6082> +proj=lcc +lat_1=77 +lat_2=73.66666666666667 +lat_0=75.36440330555556 +lon_0=82 +x_0=32500000 +y_0=4500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 4-34
<6083> +proj=lcc +lat_1=77 +lat_2=73.66666666666667 +lat_0=75.36440330555556 +lon_0=106 +x_0=34500000 +y_0=4500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 4-36
<6084> +proj=lcc +lat_1=77 +lat_2=73.66666666666667 +lat_0=75.36440330555556 +lon_0=130 +x_0=36500000 +y_0=4500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 4-38
<6085> +proj=lcc +lat_1=77 +lat_2=73.66666666666667 +lat_0=75.36440330555556 +lon_0=154 +x_0=38500000 +y_0=4500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 4-40
<6086> +proj=lcc +lat_1=77 +lat_2=73.66666666666667 +lat_0=75.36440330555556 +lon_0=179 +x_0=40500000 +y_0=4500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 5-15
<6087> +proj=lcc +lat_1=73.66666666666667 +lat_2=70.33333333333333 +lat_0=72.02500919444445 +lon_0=54 +x_0=15500000 +y_0=5500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 5-17
<6088> +proj=lcc +lat_1=73.66666666666667 +lat_2=70.33333333333333 +lat_0=72.02500919444445 +lon_0=74 +x_0=17500000 +y_0=5500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 5-19
<6089> +proj=lcc +lat_1=73.66666666666667 +lat_2=70.33333333333333 +lat_0=72.02500919444445 +lon_0=95 +x_0=19500000 +y_0=5500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 5-21
<6090> +proj=lcc +lat_1=73.66666666666667 +lat_2=70.33333333333333 +lat_0=72.02500919444445 +lon_0=116 +x_0=21500000 +y_0=5500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 5-23
<6091> +proj=lcc +lat_1=73.66666666666667 +lat_2=70.33333333333333 +lat_0=72.02500919444445 +lon_0=137 +x_0=23500000 +y_0=5500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 5-25
<6092> +proj=lcc +lat_1=73.66666666666667 +lat_2=70.33333333333333 +lat_0=72.02500919444445 +lon_0=158 +x_0=25500000 +y_0=5500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 5-27
<6093> +proj=lcc +lat_1=73.66666666666667 +lat_2=70.33333333333333 +lat_0=72.02500919444445 +lon_0=179 +x_0=27500000 +y_0=5500000 +datum=WGS84 +units=m +no_defs  <>
# NAD83(NSRS2007) / EPSG Arctic zone 5-29
<6094> +proj=lcc +lat_1=73.66666666666667 +lat_2=70.33333333333333 +lat_0=72.02500919444445 +lon_0=-163 +x_0=29500000 +y_0=5500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / EPSG Arctic zone 5-31
<6095> +proj=lcc +lat_1=73.66666666666667 +lat_2=70.33333333333333 +lat_0=72.02500919444445 +lon_0=-147 +x_0=31500000 +y_0=5500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / EPSG Arctic zone 6-14
<6096> +proj=lcc +lat_1=70.33333333333333 +lat_2=67 +lat_0=68.68747555555557 +lon_0=-165 +x_0=14500000 +y_0=6500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / EPSG Arctic zone 6-16
<6097> +proj=lcc +lat_1=70.33333333333333 +lat_2=67 +lat_0=68.68747555555557 +lon_0=-147 +x_0=16500000 +y_0=6500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / EPSG Arctic zone 1-23
<6098> +proj=lcc +lat_1=87 +lat_2=83.66666666666667 +lat_0=85.43711833333333 +lon_0=-90 +x_0=23500000 +y_0=1500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / EPSG Arctic zone 2-14
<6099> +proj=lcc +lat_1=83.66666666666667 +lat_2=80.33333333333333 +lat_0=82.05842488888888 +lon_0=-115 +x_0=14500000 +y_0=2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / EPSG Arctic zone 2-16
<6100> +proj=lcc +lat_1=83.66666666666667 +lat_2=80.33333333333333 +lat_0=82.05842488888888 +lon_0=-75 +x_0=16500000 +y_0=2500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / EPSG Arctic zone 3-25
<6101> +proj=lcc +lat_1=80.33333333333333 +lat_2=77 +lat_0=78.70733752777778 +lon_0=-129 +x_0=25500000 +y_0=3500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / EPSG Arctic zone 3-27
<6102> +proj=lcc +lat_1=80.33333333333333 +lat_2=77 +lat_0=78.70733752777778 +lon_0=-99 +x_0=27500000 +y_0=3500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / EPSG Arctic zone 3-29
<6103> +proj=lcc +lat_1=80.33333333333333 +lat_2=77 +lat_0=78.70733752777778 +lon_0=-69 +x_0=29500000 +y_0=3500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / EPSG Arctic zone 4-14
<6104> +proj=lcc +lat_1=77 +lat_2=73.66666666666667 +lat_0=75.36440330555556 +lon_0=-129 +x_0=14500000 +y_0=4500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / EPSG Arctic zone 4-16
<6105> +proj=lcc +lat_1=77 +lat_2=73.66666666666667 +lat_0=75.36440330555556 +lon_0=-104 +x_0=16500000 +y_0=4500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / EPSG Arctic zone 4-18
<6106> +proj=lcc +lat_1=77 +lat_2=73.66666666666667 +lat_0=75.36440330555556 +lon_0=-79 +x_0=18500000 +y_0=4500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / EPSG Arctic zone 5-33
<6107> +proj=lcc +lat_1=73.66666666666667 +lat_2=70.33333333333333 +lat_0=72.02500919444445 +lon_0=-131 +x_0=33500000 +y_0=5500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / EPSG Arctic zone 5-35
<6108> +proj=lcc +lat_1=73.66666666666667 +lat_2=70.33333333333333 +lat_0=72.02500919444445 +lon_0=-111 +x_0=35500000 +y_0=5500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / EPSG Arctic zone 5-37
<6109> +proj=lcc +lat_1=73.66666666666667 +lat_2=70.33333333333333 +lat_0=72.02500919444445 +lon_0=-91 +x_0=37500000 +y_0=5500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / EPSG Arctic zone 5-39
<6110> +proj=lcc +lat_1=73.66666666666667 +lat_2=70.33333333333333 +lat_0=72.02500919444445 +lon_0=-71 +x_0=39500000 +y_0=5500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / EPSG Arctic zone 6-18
<6111> +proj=lcc +lat_1=70.33333333333333 +lat_2=67 +lat_0=68.68747555555557 +lon_0=-132 +x_0=18500000 +y_0=6500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / EPSG Arctic zone 6-20
<6112> +proj=lcc +lat_1=70.33333333333333 +lat_2=67 +lat_0=68.68747555555557 +lon_0=-113 +x_0=20500000 +y_0=6500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / EPSG Arctic zone 6-22
<6113> +proj=lcc +lat_1=70.33333333333333 +lat_2=67 +lat_0=68.68747555555557 +lon_0=-94 +x_0=22500000 +y_0=6500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / EPSG Arctic zone 6-24
<6114> +proj=lcc +lat_1=70.33333333333333 +lat_2=67 +lat_0=68.68747555555557 +lon_0=-75 +x_0=24500000 +y_0=6500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 1-27
<6115> +proj=lcc +lat_1=87 +lat_2=83.66666666666667 +lat_0=85.43711833333333 +lon_0=30 +x_0=27500000 +y_0=1500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 1-29
<6116> +proj=lcc +lat_1=87 +lat_2=83.66666666666667 +lat_0=85.43711833333333 +lon_0=90 +x_0=29500000 +y_0=1500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 1-31
<6117> +proj=lcc +lat_1=87 +lat_2=83.66666666666667 +lat_0=85.43711833333333 +lon_0=150 +x_0=31500000 +y_0=1500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 1-21
<6118> +proj=lcc +lat_1=87 +lat_2=83.66666666666667 +lat_0=85.43711833333333 +lon_0=-150 +x_0=21500000 +y_0=1500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 2-28
<6119> +proj=lcc +lat_1=83.66666666666667 +lat_2=80.33333333333333 +lat_0=82.05842488888888 +lon_0=133 +x_0=28500000 +y_0=2500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 2-10
<6120> +proj=lcc +lat_1=83.66666666666667 +lat_2=80.33333333333333 +lat_0=82.05842488888888 +lon_0=166 +x_0=10500000 +y_0=2500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 2-12
<6121> +proj=lcc +lat_1=83.66666666666667 +lat_2=80.33333333333333 +lat_0=82.05842488888888 +lon_0=-154 +x_0=12500000 +y_0=2500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 3-21
<6122> +proj=lcc +lat_1=80.33333333333333 +lat_2=77 +lat_0=78.70733752777778 +lon_0=176 +x_0=21500000 +y_0=3500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 3-23
<6123> +proj=lcc +lat_1=80.33333333333333 +lat_2=77 +lat_0=78.70733752777778 +lon_0=-153 +x_0=23500000 +y_0=3500000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / EPSG Arctic zone 4-12
<6124> +proj=lcc +lat_1=77 +lat_2=73.66666666666667 +lat_0=75.36440330555556 +lon_0=-155 +x_0=12500000 +y_0=4500000 +datum=WGS84 +units=m +no_defs  <>
# ETRS89 / EPSG Arctic zone 5-47
<6125> +proj=lcc +lat_1=73.66666666666667 +lat_2=70.33333333333333 +lat_0=72.02500919444445 +lon_0=-5 +x_0=47500000 +y_0=5500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Grand Cayman National Grid 1959
<6128> +proj=utm +zone=17 +ellps=clrk66 +towgs84=-179.483,-69.379,-27.584,-7.862,8.163,6.042,-13.925 +units=ft +no_defs  <>
# Sister Islands National Grid 1961
<6129> +proj=utm +zone=17 +ellps=clrk66 +towgs84=8.853,-52.644,180.304,-0.393,-2.323,2.96,-24.081 +units=ft +no_defs  <>
# Cayman Islands National Grid 2011 (deprecated)
<6141> +proj=lcc +lat_1=19.33333333333333 +lat_2=19.7 +lat_0=19.33333333333333 +lon_0=80.56666666666666 +x_0=899160 +y_0=579120 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD27 / Michigan North (deprecated)
# Unable to translate coordinate system EPSG:6200 into PROJ.4 format.
#
# NAD27 / Michigan Central
# Unable to translate coordinate system EPSG:6201 into PROJ.4 format.
#
# NAD27 / Michigan South
# Unable to translate coordinate system EPSG:6202 into PROJ.4 format.
#
# Macedonia State Coordinate System
<6204> +proj=tmerc +lat_0=0 +lon_0=21 +k=0.9999 +x_0=500000 +y_0=0 +ellps=bessel +towgs84=682,-203,480,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 23N
<6210> +proj=utm +zone=23 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 24N
<6211> +proj=utm +zone=24 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# MAGNA-SIRGAS / Arauca urban grid
# Unable to translate coordinate system EPSG:6244 into PROJ.4 format.
#
# MAGNA-SIRGAS / Armenia urban grid
# Unable to translate coordinate system EPSG:6245 into PROJ.4 format.
#
# MAGNA-SIRGAS / Barranquilla urban grid
# Unable to translate coordinate system EPSG:6246 into PROJ.4 format.
#
# MAGNA-SIRGAS / Bogota urban grid
# Unable to translate coordinate system EPSG:6247 into PROJ.4 format.
#
# MAGNA-SIRGAS / Bucaramanga urban grid
# Unable to translate coordinate system EPSG:6248 into PROJ.4 format.
#
# MAGNA-SIRGAS / Cali urban grid
# Unable to translate coordinate system EPSG:6249 into PROJ.4 format.
#
# MAGNA-SIRGAS / Cartagena urban grid
# Unable to translate coordinate system EPSG:6250 into PROJ.4 format.
#
# MAGNA-SIRGAS / Cucuta urban grid
# Unable to translate coordinate system EPSG:6251 into PROJ.4 format.
#
# MAGNA-SIRGAS / Florencia urban grid
# Unable to translate coordinate system EPSG:6252 into PROJ.4 format.
#
# MAGNA-SIRGAS / Ibague urban grid
# Unable to translate coordinate system EPSG:6253 into PROJ.4 format.
#
# MAGNA-SIRGAS / Inirida urban grid
# Unable to translate coordinate system EPSG:6254 into PROJ.4 format.
#
# MAGNA-SIRGAS / Leticia urban grid
# Unable to translate coordinate system EPSG:6255 into PROJ.4 format.
#
# MAGNA-SIRGAS / Manizales urban grid
# Unable to translate coordinate system EPSG:6256 into PROJ.4 format.
#
# MAGNA-SIRGAS / Medellin urban grid
# Unable to translate coordinate system EPSG:6257 into PROJ.4 format.
#
# MAGNA-SIRGAS / Mitu urban grid
# Unable to translate coordinate system EPSG:6258 into PROJ.4 format.
#
# MAGNA-SIRGAS / Mocoa urban grid
# Unable to translate coordinate system EPSG:6259 into PROJ.4 format.
#
# MAGNA-SIRGAS / Monteria urban grid
# Unable to translate coordinate system EPSG:6260 into PROJ.4 format.
#
# MAGNA-SIRGAS / Neiva urban grid
# Unable to translate coordinate system EPSG:6261 into PROJ.4 format.
#
# MAGNA-SIRGAS / Pasto urban grid
# Unable to translate coordinate system EPSG:6262 into PROJ.4 format.
#
# MAGNA-SIRGAS / Pereira urban grid
# Unable to translate coordinate system EPSG:6263 into PROJ.4 format.
#
# MAGNA-SIRGAS / Popayan urban grid
# Unable to translate coordinate system EPSG:6264 into PROJ.4 format.
#
# MAGNA-SIRGAS / Puerto Carreno urban grid
# Unable to translate coordinate system EPSG:6265 into PROJ.4 format.
#
# MAGNA-SIRGAS / Quibdo urban grid
# Unable to translate coordinate system EPSG:6266 into PROJ.4 format.
#
# MAGNA-SIRGAS / Riohacha urban grid
# Unable to translate coordinate system EPSG:6267 into PROJ.4 format.
#
# MAGNA-SIRGAS / San Andres urban grid
# Unable to translate coordinate system EPSG:6268 into PROJ.4 format.
#
# MAGNA-SIRGAS / San Jose del Guaviare urban grid
# Unable to translate coordinate system EPSG:6269 into PROJ.4 format.
#
# MAGNA-SIRGAS / Santa Marta urban grid
# Unable to translate coordinate system EPSG:6270 into PROJ.4 format.
#
# MAGNA-SIRGAS / Sucre urban grid
# Unable to translate coordinate system EPSG:6271 into PROJ.4 format.
#
# MAGNA-SIRGAS / Tunja urban grid
# Unable to translate coordinate system EPSG:6272 into PROJ.4 format.
#
# MAGNA-SIRGAS / Valledupar urban grid
# Unable to translate coordinate system EPSG:6273 into PROJ.4 format.
#
# MAGNA-SIRGAS / Villavicencio urban grid
# Unable to translate coordinate system EPSG:6274 into PROJ.4 format.
#
# MAGNA-SIRGAS / Yopal urban grid
# Unable to translate coordinate system EPSG:6275 into PROJ.4 format.
#
# NAD83(CORS96) / Puerto Rico and Virgin Is.
<6307> +proj=lcc +lat_1=18.43333333333333 +lat_2=18.03333333333333 +lat_0=17.83333333333333 +lon_0=-66.43333333333334 +x_0=200000 +y_0=200000 +ellps=GRS80 +units=m +no_defs  <>
# CGRS93 / Cyprus Local Transverse Mercator
<6312> +proj=tmerc +lat_0=0 +lon_0=33 +k=0.99995 +x_0=200000 +y_0=-3500000 +ellps=WGS84 +towgs84=8.846,-4.394,-1.122,-0.00237,-0.146528,0.130428,0.783926 +units=m +no_defs  <>
# Macedonia State Coordinate System zone 7
<6316> +proj=tmerc +lat_0=0 +lon_0=21 +k=0.9999 +x_0=7500000 +y_0=0 +ellps=bessel +towgs84=682,-203,480,0,0,0,0 +units=m +no_defs  <>
# NAD83(2011) / UTM zone 59N
<6328> +proj=utm +zone=59 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / UTM zone 60N
<6329> +proj=utm +zone=60 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / UTM zone 1N
<6330> +proj=utm +zone=1 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / UTM zone 2N
<6331> +proj=utm +zone=2 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / UTM zone 3N
<6332> +proj=utm +zone=3 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / UTM zone 4N
<6333> +proj=utm +zone=4 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / UTM zone 5N
<6334> +proj=utm +zone=5 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / UTM zone 6N
<6335> +proj=utm +zone=6 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / UTM zone 7N
<6336> +proj=utm +zone=7 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / UTM zone 8N
<6337> +proj=utm +zone=8 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / UTM zone 9N
<6338> +proj=utm +zone=9 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / UTM zone 10N
<6339> +proj=utm +zone=10 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / UTM zone 11N
<6340> +proj=utm +zone=11 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / UTM zone 12N
<6341> +proj=utm +zone=12 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / UTM zone 13N
<6342> +proj=utm +zone=13 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / UTM zone 14N
<6343> +proj=utm +zone=14 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / UTM zone 15N
<6344> +proj=utm +zone=15 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / UTM zone 16N
<6345> +proj=utm +zone=16 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / UTM zone 17N
<6346> +proj=utm +zone=17 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / UTM zone 18N
<6347> +proj=utm +zone=18 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / UTM zone 19N
<6348> +proj=utm +zone=19 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Conus Albers
<6350> +proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=23 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / EPSG Arctic zone 5-29
<6351> +proj=lcc +lat_1=73.66666666666667 +lat_2=70.33333333333333 +lat_0=72.02500919444445 +lon_0=-163 +x_0=29500000 +y_0=5500000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / EPSG Arctic zone 5-31
<6352> +proj=lcc +lat_1=73.66666666666667 +lat_2=70.33333333333333 +lat_0=72.02500919444445 +lon_0=-147 +x_0=31500000 +y_0=5500000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / EPSG Arctic zone 6-14
<6353> +proj=lcc +lat_1=70.33333333333333 +lat_2=67 +lat_0=68.68747555555557 +lon_0=-165 +x_0=14500000 +y_0=6500000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / EPSG Arctic zone 6-16
<6354> +proj=lcc +lat_1=70.33333333333333 +lat_2=67 +lat_0=68.68747555555557 +lon_0=-147 +x_0=16500000 +y_0=6500000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Alabama East
<6355> +proj=tmerc +lat_0=30.5 +lon_0=-85.83333333333333 +k=0.99996 +x_0=200000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Alabama West
<6356> +proj=tmerc +lat_0=30 +lon_0=-87.5 +k=0.999933333 +x_0=600000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# Mexico ITRF92 / LCC
<6362> +proj=lcc +lat_1=17.5 +lat_2=29.5 +lat_0=12 +lon_0=-102 +x_0=2500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Mexico ITRF2008 / UTM zone 11N
<6366> +proj=utm +zone=11 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Mexico ITRF2008 / UTM zone 12N
<6367> +proj=utm +zone=12 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Mexico ITRF2008 / UTM zone 13N
<6368> +proj=utm +zone=13 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Mexico ITRF2008 / UTM zone 14N
<6369> +proj=utm +zone=14 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Mexico ITRF2008 / UTM zone 15N
<6370> +proj=utm +zone=15 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Mexico ITRF2008 / UTM zone 16N
<6371> +proj=utm +zone=16 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Mexico ITRF2008 / LCC
<6372> +proj=lcc +lat_1=17.5 +lat_2=29.5 +lat_0=12 +lon_0=-102 +x_0=2500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# UCS-2000 / Ukraine TM zone 7
<6381> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=300000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / Ukraine TM zone 8
<6382> +proj=tmerc +lat_0=0 +lon_0=24 +k=1 +x_0=300000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / Ukraine TM zone 9
<6383> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=300000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / Ukraine TM zone 10
<6384> +proj=tmerc +lat_0=0 +lon_0=30 +k=1 +x_0=300000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / Ukraine TM zone 11
<6385> +proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=300000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / Ukraine TM zone 12
<6386> +proj=tmerc +lat_0=0 +lon_0=36 +k=1 +x_0=300000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# UCS-2000 / Ukraine TM zone 13
<6387> +proj=tmerc +lat_0=0 +lon_0=39 +k=1 +x_0=300000 +y_0=0 +ellps=krass +towgs84=25,-141,-78.5,0,0.35,0.736,0 +units=m +no_defs  <>
# Cayman Islands National Grid 2011
<6391> +proj=lcc +lat_1=19.33333333333333 +lat_2=19.7 +lat_0=19.33333333333333 +lon_0=-80.56666666666666 +x_0=899160 +y_0=579120 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs  <>
# NAD83(2011) / Alaska Albers
<6393> +proj=aea +lat_1=55 +lat_2=65 +lat_0=50 +lon_0=-154 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Alaska zone 1
<6394> +proj=omerc +lat_0=57 +lonc=-133.6666666666667 +alpha=323.1301023611111 +k=0.9999 +x_0=5000000 +y_0=-5000000 +no_uoff +gamma=323.1301023611111 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Alaska zone 2
<6395> +proj=tmerc +lat_0=54 +lon_0=-142 +k=0.9999 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Alaska zone 3
<6396> +proj=tmerc +lat_0=54 +lon_0=-146 +k=0.9999 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Alaska zone 4
<6397> +proj=tmerc +lat_0=54 +lon_0=-150 +k=0.9999 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Alaska zone 5
<6398> +proj=tmerc +lat_0=54 +lon_0=-154 +k=0.9999 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Alaska zone 6
<6399> +proj=tmerc +lat_0=54 +lon_0=-158 +k=0.9999 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Alaska zone 7
<6400> +proj=tmerc +lat_0=54 +lon_0=-162 +k=0.9999 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Alaska zone 8
<6401> +proj=tmerc +lat_0=54 +lon_0=-166 +k=0.9999 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Alaska zone 9
<6402> +proj=tmerc +lat_0=54 +lon_0=-170 +k=0.9999 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Alaska zone 10
<6403> +proj=lcc +lat_1=53.83333333333334 +lat_2=51.83333333333334 +lat_0=51 +lon_0=-176 +x_0=1000000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Arizona Central
<6404> +proj=tmerc +lat_0=31 +lon_0=-111.9166666666667 +k=0.9999 +x_0=213360 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Arizona Central (ft)
<6405> +proj=tmerc +lat_0=31 +lon_0=-111.9166666666667 +k=0.9999 +x_0=213360 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Arizona East
<6406> +proj=tmerc +lat_0=31 +lon_0=-110.1666666666667 +k=0.9999 +x_0=213360 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Arizona East (ft)
<6407> +proj=tmerc +lat_0=31 +lon_0=-110.1666666666667 +k=0.9999 +x_0=213360 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Arizona West
<6408> +proj=tmerc +lat_0=31 +lon_0=-113.75 +k=0.999933333 +x_0=213360 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Arizona West (ft)
<6409> +proj=tmerc +lat_0=31 +lon_0=-113.75 +k=0.999933333 +x_0=213360 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Arkansas North
<6410> +proj=lcc +lat_1=36.23333333333333 +lat_2=34.93333333333333 +lat_0=34.33333333333334 +lon_0=-92 +x_0=400000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Arkansas North (ftUS)
<6411> +proj=lcc +lat_1=36.23333333333333 +lat_2=34.93333333333333 +lat_0=34.33333333333334 +lon_0=-92 +x_0=399999.99998984 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Arkansas South
<6412> +proj=lcc +lat_1=34.76666666666667 +lat_2=33.3 +lat_0=32.66666666666666 +lon_0=-92 +x_0=400000 +y_0=400000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Arkansas South (ftUS)
<6413> +proj=lcc +lat_1=34.76666666666667 +lat_2=33.3 +lat_0=32.66666666666666 +lon_0=-92 +x_0=399999.99998984 +y_0=399999.99998984 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / California Albers
<6414> +proj=aea +lat_1=34 +lat_2=40.5 +lat_0=0 +lon_0=-120 +x_0=0 +y_0=-4000000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / California zone 1
<6415> +proj=lcc +lat_1=41.66666666666666 +lat_2=40 +lat_0=39.33333333333334 +lon_0=-122 +x_0=2000000 +y_0=500000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / California zone 1 (ftUS)
<6416> +proj=lcc +lat_1=41.66666666666666 +lat_2=40 +lat_0=39.33333333333334 +lon_0=-122 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / California zone 2
<6417> +proj=lcc +lat_1=39.83333333333334 +lat_2=38.33333333333334 +lat_0=37.66666666666666 +lon_0=-122 +x_0=2000000 +y_0=500000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / California zone 2 (ftUS)
<6418> +proj=lcc +lat_1=39.83333333333334 +lat_2=38.33333333333334 +lat_0=37.66666666666666 +lon_0=-122 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / California zone 3
<6419> +proj=lcc +lat_1=38.43333333333333 +lat_2=37.06666666666667 +lat_0=36.5 +lon_0=-120.5 +x_0=2000000 +y_0=500000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / California zone 3 (ftUS)
<6420> +proj=lcc +lat_1=38.43333333333333 +lat_2=37.06666666666667 +lat_0=36.5 +lon_0=-120.5 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / California zone 4
<6421> +proj=lcc +lat_1=37.25 +lat_2=36 +lat_0=35.33333333333334 +lon_0=-119 +x_0=2000000 +y_0=500000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / California zone 4 (ftUS)
<6422> +proj=lcc +lat_1=37.25 +lat_2=36 +lat_0=35.33333333333334 +lon_0=-119 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / California zone 5
<6423> +proj=lcc +lat_1=35.46666666666667 +lat_2=34.03333333333333 +lat_0=33.5 +lon_0=-118 +x_0=2000000 +y_0=500000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / California zone 5 (ftUS)
<6424> +proj=lcc +lat_1=35.46666666666667 +lat_2=34.03333333333333 +lat_0=33.5 +lon_0=-118 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / California zone 6
<6425> +proj=lcc +lat_1=33.88333333333333 +lat_2=32.78333333333333 +lat_0=32.16666666666666 +lon_0=-116.25 +x_0=2000000 +y_0=500000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / California zone 6 (ftUS)
<6426> +proj=lcc +lat_1=33.88333333333333 +lat_2=32.78333333333333 +lat_0=32.16666666666666 +lon_0=-116.25 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Colorado Central
<6427> +proj=lcc +lat_1=39.75 +lat_2=38.45 +lat_0=37.83333333333334 +lon_0=-105.5 +x_0=914401.8289 +y_0=304800.6096 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Colorado Central (ftUS)
<6428> +proj=lcc +lat_1=39.75 +lat_2=38.45 +lat_0=37.83333333333334 +lon_0=-105.5 +x_0=914401.8288036576 +y_0=304800.6096012192 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Colorado North
<6429> +proj=lcc +lat_1=40.78333333333333 +lat_2=39.71666666666667 +lat_0=39.33333333333334 +lon_0=-105.5 +x_0=914401.8289 +y_0=304800.6096 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Colorado North (ftUS)
<6430> +proj=lcc +lat_1=40.78333333333333 +lat_2=39.71666666666667 +lat_0=39.33333333333334 +lon_0=-105.5 +x_0=914401.8288036576 +y_0=304800.6096012192 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Colorado South
<6431> +proj=lcc +lat_1=38.43333333333333 +lat_2=37.23333333333333 +lat_0=36.66666666666666 +lon_0=-105.5 +x_0=914401.8289 +y_0=304800.6096 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Colorado South (ftUS)
<6432> +proj=lcc +lat_1=38.43333333333333 +lat_2=37.23333333333333 +lat_0=36.66666666666666 +lon_0=-105.5 +x_0=914401.8288036576 +y_0=304800.6096012192 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Connecticut
<6433> +proj=lcc +lat_1=41.86666666666667 +lat_2=41.2 +lat_0=40.83333333333334 +lon_0=-72.75 +x_0=304800.6096 +y_0=152400.3048 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Connecticut (ftUS)
<6434> +proj=lcc +lat_1=41.86666666666667 +lat_2=41.2 +lat_0=40.83333333333334 +lon_0=-72.75 +x_0=304800.6096012192 +y_0=152400.3048006096 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Delaware
<6435> +proj=tmerc +lat_0=38 +lon_0=-75.41666666666667 +k=0.999995 +x_0=200000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Delaware (ftUS)
<6436> +proj=tmerc +lat_0=38 +lon_0=-75.41666666666667 +k=0.999995 +x_0=200000.0001016002 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Florida East
<6437> +proj=tmerc +lat_0=24.33333333333333 +lon_0=-81 +k=0.999941177 +x_0=200000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Florida East (ftUS)
<6438> +proj=tmerc +lat_0=24.33333333333333 +lon_0=-81 +k=0.999941177 +x_0=200000.0001016002 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Florida GDL Albers
<6439> +proj=aea +lat_1=24 +lat_2=31.5 +lat_0=24 +lon_0=-84 +x_0=400000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Florida North
<6440> +proj=lcc +lat_1=30.75 +lat_2=29.58333333333333 +lat_0=29 +lon_0=-84.5 +x_0=600000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Florida North (ftUS)
<6441> +proj=lcc +lat_1=30.75 +lat_2=29.58333333333333 +lat_0=29 +lon_0=-84.5 +x_0=600000 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Florida West
<6442> +proj=tmerc +lat_0=24.33333333333333 +lon_0=-82 +k=0.999941177 +x_0=200000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Florida West (ftUS)
<6443> +proj=tmerc +lat_0=24.33333333333333 +lon_0=-82 +k=0.999941177 +x_0=200000.0001016002 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Georgia East
<6444> +proj=tmerc +lat_0=30 +lon_0=-82.16666666666667 +k=0.9999 +x_0=200000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Georgia East (ftUS)
<6445> +proj=tmerc +lat_0=30 +lon_0=-82.16666666666667 +k=0.9999 +x_0=200000.0001016002 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Georgia West
<6446> +proj=tmerc +lat_0=30 +lon_0=-84.16666666666667 +k=0.9999 +x_0=700000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Georgia West (ftUS)
<6447> +proj=tmerc +lat_0=30 +lon_0=-84.16666666666667 +k=0.9999 +x_0=699999.9998983998 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Idaho Central
<6448> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-114 +k=0.9999473679999999 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Idaho Central (ftUS)
<6449> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-114 +k=0.9999473679999999 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Idaho East
<6450> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-112.1666666666667 +k=0.9999473679999999 +x_0=200000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Idaho East (ftUS)
<6451> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-112.1666666666667 +k=0.9999473679999999 +x_0=200000.0001016002 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Idaho West
<6452> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-115.75 +k=0.999933333 +x_0=800000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Idaho West (ftUS)
<6453> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-115.75 +k=0.999933333 +x_0=800000.0001016001 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Illinois East
<6454> +proj=tmerc +lat_0=36.66666666666666 +lon_0=-88.33333333333333 +k=0.9999749999999999 +x_0=300000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Illinois East (ftUS)
<6455> +proj=tmerc +lat_0=36.66666666666666 +lon_0=-88.33333333333333 +k=0.9999749999999999 +x_0=300000.0000000001 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Illinois West
<6456> +proj=tmerc +lat_0=36.66666666666666 +lon_0=-90.16666666666667 +k=0.999941177 +x_0=700000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Illinois West (ftUS)
<6457> +proj=tmerc +lat_0=36.66666666666666 +lon_0=-90.16666666666667 +k=0.999941177 +x_0=699999.9999898402 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Indiana East
<6458> +proj=tmerc +lat_0=37.5 +lon_0=-85.66666666666667 +k=0.999966667 +x_0=100000 +y_0=250000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Indiana East (ftUS)
<6459> +proj=tmerc +lat_0=37.5 +lon_0=-85.66666666666667 +k=0.999966667 +x_0=99999.99989839978 +y_0=249999.9998983998 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Indiana West
<6460> +proj=tmerc +lat_0=37.5 +lon_0=-87.08333333333333 +k=0.999966667 +x_0=900000 +y_0=250000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Indiana West (ftUS)
<6461> +proj=tmerc +lat_0=37.5 +lon_0=-87.08333333333333 +k=0.999966667 +x_0=900000 +y_0=249999.9998983998 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Iowa North
<6462> +proj=lcc +lat_1=43.26666666666667 +lat_2=42.06666666666667 +lat_0=41.5 +lon_0=-93.5 +x_0=1500000 +y_0=1000000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Iowa North (ftUS)
<6463> +proj=lcc +lat_1=43.26666666666667 +lat_2=42.06666666666667 +lat_0=41.5 +lon_0=-93.5 +x_0=1500000 +y_0=999999.9999898402 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Iowa South
<6464> +proj=lcc +lat_1=41.78333333333333 +lat_2=40.61666666666667 +lat_0=40 +lon_0=-93.5 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Iowa South (ftUS)
<6465> +proj=lcc +lat_1=41.78333333333333 +lat_2=40.61666666666667 +lat_0=40 +lon_0=-93.5 +x_0=500000.00001016 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Kansas North
<6466> +proj=lcc +lat_1=39.78333333333333 +lat_2=38.71666666666667 +lat_0=38.33333333333334 +lon_0=-98 +x_0=400000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Kansas North (ftUS)
<6467> +proj=lcc +lat_1=39.78333333333333 +lat_2=38.71666666666667 +lat_0=38.33333333333334 +lon_0=-98 +x_0=399999.99998984 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Kansas South
<6468> +proj=lcc +lat_1=38.56666666666667 +lat_2=37.26666666666667 +lat_0=36.66666666666666 +lon_0=-98.5 +x_0=400000 +y_0=400000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Kansas South (ftUS)
<6469> +proj=lcc +lat_1=38.56666666666667 +lat_2=37.26666666666667 +lat_0=36.66666666666666 +lon_0=-98.5 +x_0=399999.99998984 +y_0=399999.99998984 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Kentucky North
<6470> +proj=lcc +lat_1=37.96666666666667 +lat_2=38.96666666666667 +lat_0=37.5 +lon_0=-84.25 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Kentucky North (ftUS)
<6471> +proj=lcc +lat_1=37.96666666666667 +lat_2=38.96666666666667 +lat_0=37.5 +lon_0=-84.25 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Kentucky Single Zone
<6472> +proj=lcc +lat_1=37.08333333333334 +lat_2=38.66666666666666 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=1500000 +y_0=1000000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Kentucky Single Zone (ftUS)
<6473> +proj=lcc +lat_1=37.08333333333334 +lat_2=38.66666666666666 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=1500000 +y_0=999999.9998983998 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Kentucky South
<6474> +proj=lcc +lat_1=37.93333333333333 +lat_2=36.73333333333333 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=500000 +y_0=500000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Kentucky South (ftUS)
<6475> +proj=lcc +lat_1=37.93333333333333 +lat_2=36.73333333333333 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=500000.0001016001 +y_0=500000.0001016001 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Louisiana North
<6476> +proj=lcc +lat_1=32.66666666666666 +lat_2=31.16666666666667 +lat_0=30.5 +lon_0=-92.5 +x_0=1000000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Louisiana North (ftUS)
<6477> +proj=lcc +lat_1=32.66666666666666 +lat_2=31.16666666666667 +lat_0=30.5 +lon_0=-92.5 +x_0=999999.9999898402 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Louisiana South
<6478> +proj=lcc +lat_1=30.7 +lat_2=29.3 +lat_0=28.5 +lon_0=-91.33333333333333 +x_0=1000000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Louisiana South (ftUS)
<6479> +proj=lcc +lat_1=30.7 +lat_2=29.3 +lat_0=28.5 +lon_0=-91.33333333333333 +x_0=999999.9999898402 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Maine CS2000 Central
<6480> +proj=tmerc +lat_0=43.5 +lon_0=-69.125 +k=0.99998 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Maine CS2000 East
<6481> +proj=tmerc +lat_0=43.83333333333334 +lon_0=-67.875 +k=0.99998 +x_0=700000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Maine CS2000 West
<6482> +proj=tmerc +lat_0=42.83333333333334 +lon_0=-70.375 +k=0.99998 +x_0=300000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Maine East
<6483> +proj=tmerc +lat_0=43.66666666666666 +lon_0=-68.5 +k=0.9999 +x_0=300000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Maine East (ftUS)
<6484> +proj=tmerc +lat_0=43.66666666666666 +lon_0=-68.5 +k=0.9999 +x_0=300000.0000000001 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Maine West
<6485> +proj=tmerc +lat_0=42.83333333333334 +lon_0=-70.16666666666667 +k=0.999966667 +x_0=900000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Maine West (ftUS)
<6486> +proj=tmerc +lat_0=42.83333333333334 +lon_0=-70.16666666666667 +k=0.999966667 +x_0=900000 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Maryland
<6487> +proj=lcc +lat_1=39.45 +lat_2=38.3 +lat_0=37.66666666666666 +lon_0=-77 +x_0=400000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Maryland (ftUS)
<6488> +proj=lcc +lat_1=39.45 +lat_2=38.3 +lat_0=37.66666666666666 +lon_0=-77 +x_0=399999.9998983998 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Massachusetts Island
<6489> +proj=lcc +lat_1=41.48333333333333 +lat_2=41.28333333333333 +lat_0=41 +lon_0=-70.5 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Massachusetts Island (ftUS)
<6490> +proj=lcc +lat_1=41.48333333333333 +lat_2=41.28333333333333 +lat_0=41 +lon_0=-70.5 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Massachusetts Mainland
<6491> +proj=lcc +lat_1=42.68333333333333 +lat_2=41.71666666666667 +lat_0=41 +lon_0=-71.5 +x_0=200000 +y_0=750000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Massachusetts Mainland (ftUS)
<6492> +proj=lcc +lat_1=42.68333333333333 +lat_2=41.71666666666667 +lat_0=41 +lon_0=-71.5 +x_0=200000.0001016002 +y_0=750000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Michigan Central
<6493> +proj=lcc +lat_1=45.7 +lat_2=44.18333333333333 +lat_0=43.31666666666667 +lon_0=-84.36666666666666 +x_0=6000000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Michigan Central (ft)
<6494> +proj=lcc +lat_1=45.7 +lat_2=44.18333333333333 +lat_0=43.31666666666667 +lon_0=-84.36666666666666 +x_0=5999999.999976001 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Michigan North
<6495> +proj=lcc +lat_1=47.08333333333334 +lat_2=45.48333333333333 +lat_0=44.78333333333333 +lon_0=-87 +x_0=8000000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Michigan North (ft)
<6496> +proj=lcc +lat_1=47.08333333333334 +lat_2=45.48333333333333 +lat_0=44.78333333333333 +lon_0=-87 +x_0=7999999.999968001 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Michigan Oblique Mercator
<6497> +proj=omerc +lat_0=45.30916666666666 +lonc=-86 +alpha=337.25556 +k=0.9996 +x_0=2546731.496 +y_0=-4354009.816 +no_uoff +gamma=337.25556 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Michigan South
<6498> +proj=lcc +lat_1=43.66666666666666 +lat_2=42.1 +lat_0=41.5 +lon_0=-84.36666666666666 +x_0=4000000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Michigan South (ft)
<6499> +proj=lcc +lat_1=43.66666666666666 +lat_2=42.1 +lat_0=41.5 +lon_0=-84.36666666666666 +x_0=3999999.999984 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Minnesota Central
<6500> +proj=lcc +lat_1=47.05 +lat_2=45.61666666666667 +lat_0=45 +lon_0=-94.25 +x_0=800000 +y_0=100000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Minnesota Central (ftUS)
<6501> +proj=lcc +lat_1=47.05 +lat_2=45.61666666666667 +lat_0=45 +lon_0=-94.25 +x_0=800000.0000101599 +y_0=99999.99998983997 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Minnesota North
<6502> +proj=lcc +lat_1=48.63333333333333 +lat_2=47.03333333333333 +lat_0=46.5 +lon_0=-93.09999999999999 +x_0=800000 +y_0=100000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Minnesota North (ftUS)
<6503> +proj=lcc +lat_1=48.63333333333333 +lat_2=47.03333333333333 +lat_0=46.5 +lon_0=-93.09999999999999 +x_0=800000.0000101599 +y_0=99999.99998983997 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Minnesota South
<6504> +proj=lcc +lat_1=45.21666666666667 +lat_2=43.78333333333333 +lat_0=43 +lon_0=-94 +x_0=800000 +y_0=100000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Minnesota South (ftUS)
<6505> +proj=lcc +lat_1=45.21666666666667 +lat_2=43.78333333333333 +lat_0=43 +lon_0=-94 +x_0=800000.0000101599 +y_0=99999.99998983997 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Mississippi East
<6506> +proj=tmerc +lat_0=29.5 +lon_0=-88.83333333333333 +k=0.99995 +x_0=300000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Mississippi East (ftUS)
<6507> +proj=tmerc +lat_0=29.5 +lon_0=-88.83333333333333 +k=0.99995 +x_0=300000.0000000001 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Mississippi TM
<6508> +proj=tmerc +lat_0=32.5 +lon_0=-89.75 +k=0.9998335 +x_0=500000 +y_0=1300000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Mississippi West
<6509> +proj=tmerc +lat_0=29.5 +lon_0=-90.33333333333333 +k=0.99995 +x_0=700000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Mississippi West (ftUS)
<6510> +proj=tmerc +lat_0=29.5 +lon_0=-90.33333333333333 +k=0.99995 +x_0=699999.9998983998 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Missouri Central
<6511> +proj=tmerc +lat_0=35.83333333333334 +lon_0=-92.5 +k=0.999933333 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Missouri East
<6512> +proj=tmerc +lat_0=35.83333333333334 +lon_0=-90.5 +k=0.999933333 +x_0=250000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Missouri West
<6513> +proj=tmerc +lat_0=36.16666666666666 +lon_0=-94.5 +k=0.999941177 +x_0=850000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Montana
<6514> +proj=lcc +lat_1=49 +lat_2=45 +lat_0=44.25 +lon_0=-109.5 +x_0=600000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Montana (ft)
<6515> +proj=lcc +lat_1=49 +lat_2=45 +lat_0=44.25 +lon_0=-109.5 +x_0=599999.9999976 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Nebraska
<6516> +proj=lcc +lat_1=43 +lat_2=40 +lat_0=39.83333333333334 +lon_0=-100 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Nebraska (ftUS) (deprecated)
<6517> +proj=lcc +lat_1=43 +lat_2=40 +lat_0=39.83333333333334 +lon_0=-100 +x_0=500000.00001016 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(2011) / Nevada Central
<6518> +proj=tmerc +lat_0=34.75 +lon_0=-116.6666666666667 +k=0.9999 +x_0=500000 +y_0=6000000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Nevada Central (ftUS)
<6519> +proj=tmerc +lat_0=34.75 +lon_0=-116.6666666666667 +k=0.9999 +x_0=500000.00001016 +y_0=6000000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Nevada East
<6520> +proj=tmerc +lat_0=34.75 +lon_0=-115.5833333333333 +k=0.9999 +x_0=200000 +y_0=8000000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Nevada East (ftUS)
<6521> +proj=tmerc +lat_0=34.75 +lon_0=-115.5833333333333 +k=0.9999 +x_0=200000.00001016 +y_0=8000000.000010163 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Nevada West
<6522> +proj=tmerc +lat_0=34.75 +lon_0=-118.5833333333333 +k=0.9999 +x_0=800000 +y_0=4000000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Nevada West (ftUS)
<6523> +proj=tmerc +lat_0=34.75 +lon_0=-118.5833333333333 +k=0.9999 +x_0=800000.0000101599 +y_0=3999999.99998984 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / New Hampshire
<6524> +proj=tmerc +lat_0=42.5 +lon_0=-71.66666666666667 +k=0.999966667 +x_0=300000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / New Hampshire (ftUS)
<6525> +proj=tmerc +lat_0=42.5 +lon_0=-71.66666666666667 +k=0.999966667 +x_0=300000.0000000001 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / New Jersey
<6526> +proj=tmerc +lat_0=38.83333333333334 +lon_0=-74.5 +k=0.9999 +x_0=150000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / New Jersey (ftUS)
<6527> +proj=tmerc +lat_0=38.83333333333334 +lon_0=-74.5 +k=0.9999 +x_0=150000 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / New Mexico Central
<6528> +proj=tmerc +lat_0=31 +lon_0=-106.25 +k=0.9999 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / New Mexico Central (ftUS)
<6529> +proj=tmerc +lat_0=31 +lon_0=-106.25 +k=0.9999 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / New Mexico East
<6530> +proj=tmerc +lat_0=31 +lon_0=-104.3333333333333 +k=0.999909091 +x_0=165000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / New Mexico East (ftUS)
<6531> +proj=tmerc +lat_0=31 +lon_0=-104.3333333333333 +k=0.999909091 +x_0=165000 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / New Mexico West
<6532> +proj=tmerc +lat_0=31 +lon_0=-107.8333333333333 +k=0.999916667 +x_0=830000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / New Mexico West (ftUS)
<6533> +proj=tmerc +lat_0=31 +lon_0=-107.8333333333333 +k=0.999916667 +x_0=830000.0001016001 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / New York Central
<6534> +proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=250000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / New York Central (ftUS)
<6535> +proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=249999.9998983998 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / New York East
<6536> +proj=tmerc +lat_0=38.83333333333334 +lon_0=-74.5 +k=0.9999 +x_0=150000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / New York East (ftUS)
<6537> +proj=tmerc +lat_0=38.83333333333334 +lon_0=-74.5 +k=0.9999 +x_0=150000 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / New York Long Island
<6538> +proj=lcc +lat_1=41.03333333333333 +lat_2=40.66666666666666 +lat_0=40.16666666666666 +lon_0=-74 +x_0=300000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / New York Long Island (ftUS)
<6539> +proj=lcc +lat_1=41.03333333333333 +lat_2=40.66666666666666 +lat_0=40.16666666666666 +lon_0=-74 +x_0=300000.0000000001 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / New York West
<6540> +proj=tmerc +lat_0=40 +lon_0=-78.58333333333333 +k=0.9999375 +x_0=350000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / New York West (ftUS)
<6541> +proj=tmerc +lat_0=40 +lon_0=-78.58333333333333 +k=0.9999375 +x_0=350000.0001016001 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / North Carolina
<6542> +proj=lcc +lat_1=36.16666666666666 +lat_2=34.33333333333334 +lat_0=33.75 +lon_0=-79 +x_0=609601.22 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / North Carolina (ftUS)
<6543> +proj=lcc +lat_1=36.16666666666666 +lat_2=34.33333333333334 +lat_0=33.75 +lon_0=-79 +x_0=609601.2192024384 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / North Dakota North
<6544> +proj=lcc +lat_1=48.73333333333333 +lat_2=47.43333333333333 +lat_0=47 +lon_0=-100.5 +x_0=600000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / North Dakota North (ft)
<6545> +proj=lcc +lat_1=48.73333333333333 +lat_2=47.43333333333333 +lat_0=47 +lon_0=-100.5 +x_0=599999.9999976 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / North Dakota South
<6546> +proj=lcc +lat_1=47.48333333333333 +lat_2=46.18333333333333 +lat_0=45.66666666666666 +lon_0=-100.5 +x_0=600000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / North Dakota South (ft)
<6547> +proj=lcc +lat_1=47.48333333333333 +lat_2=46.18333333333333 +lat_0=45.66666666666666 +lon_0=-100.5 +x_0=599999.9999976 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Ohio North
<6548> +proj=lcc +lat_1=41.7 +lat_2=40.43333333333333 +lat_0=39.66666666666666 +lon_0=-82.5 +x_0=600000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Ohio North (ftUS)
<6549> +proj=lcc +lat_1=41.7 +lat_2=40.43333333333333 +lat_0=39.66666666666666 +lon_0=-82.5 +x_0=600000 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Ohio South
<6550> +proj=lcc +lat_1=40.03333333333333 +lat_2=38.73333333333333 +lat_0=38 +lon_0=-82.5 +x_0=600000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Ohio South (ftUS)
<6551> +proj=lcc +lat_1=40.03333333333333 +lat_2=38.73333333333333 +lat_0=38 +lon_0=-82.5 +x_0=600000 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Oklahoma North
<6552> +proj=lcc +lat_1=36.76666666666667 +lat_2=35.56666666666667 +lat_0=35 +lon_0=-98 +x_0=600000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oklahoma North (ftUS)
<6553> +proj=lcc +lat_1=36.76666666666667 +lat_2=35.56666666666667 +lat_0=35 +lon_0=-98 +x_0=600000 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Oklahoma South
<6554> +proj=lcc +lat_1=35.23333333333333 +lat_2=33.93333333333333 +lat_0=33.33333333333334 +lon_0=-98 +x_0=600000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oklahoma South (ftUS)
<6555> +proj=lcc +lat_1=35.23333333333333 +lat_2=33.93333333333333 +lat_0=33.33333333333334 +lon_0=-98 +x_0=600000 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Oregon LCC (m)
<6556> +proj=lcc +lat_1=43 +lat_2=45.5 +lat_0=41.75 +lon_0=-120.5 +x_0=400000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon GIC Lambert (ft)
<6557> +proj=lcc +lat_1=43 +lat_2=45.5 +lat_0=41.75 +lon_0=-120.5 +x_0=399999.9999984 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon North
<6558> +proj=lcc +lat_1=46 +lat_2=44.33333333333334 +lat_0=43.66666666666666 +lon_0=-120.5 +x_0=2500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon North (ft)
<6559> +proj=lcc +lat_1=46 +lat_2=44.33333333333334 +lat_0=43.66666666666666 +lon_0=-120.5 +x_0=2500000.0001424 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon South
<6560> +proj=lcc +lat_1=44 +lat_2=42.33333333333334 +lat_0=41.66666666666666 +lon_0=-120.5 +x_0=1500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon South (ft)
<6561> +proj=lcc +lat_1=44 +lat_2=42.33333333333334 +lat_0=41.66666666666666 +lon_0=-120.5 +x_0=1500000.0001464 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Pennsylvania North
<6562> +proj=lcc +lat_1=41.95 +lat_2=40.88333333333333 +lat_0=40.16666666666666 +lon_0=-77.75 +x_0=600000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Pennsylvania North (ftUS)
<6563> +proj=lcc +lat_1=41.95 +lat_2=40.88333333333333 +lat_0=40.16666666666666 +lon_0=-77.75 +x_0=600000 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Pennsylvania South
<6564> +proj=lcc +lat_1=40.96666666666667 +lat_2=39.93333333333333 +lat_0=39.33333333333334 +lon_0=-77.75 +x_0=600000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Pennsylvania South (ftUS)
<6565> +proj=lcc +lat_1=40.96666666666667 +lat_2=39.93333333333333 +lat_0=39.33333333333334 +lon_0=-77.75 +x_0=600000 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Puerto Rico and Virgin Is.
<6566> +proj=lcc +lat_1=18.43333333333333 +lat_2=18.03333333333333 +lat_0=17.83333333333333 +lon_0=-66.43333333333334 +x_0=200000 +y_0=200000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Rhode Island
<6567> +proj=tmerc +lat_0=41.08333333333334 +lon_0=-71.5 +k=0.99999375 +x_0=100000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Rhode Island (ftUS)
<6568> +proj=tmerc +lat_0=41.08333333333334 +lon_0=-71.5 +k=0.99999375 +x_0=99999.99998983997 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / South Carolina
<6569> +proj=lcc +lat_1=34.83333333333334 +lat_2=32.5 +lat_0=31.83333333333333 +lon_0=-81 +x_0=609600 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / South Carolina (ft)
<6570> +proj=lcc +lat_1=34.83333333333334 +lat_2=32.5 +lat_0=31.83333333333333 +lon_0=-81 +x_0=609600 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / South Dakota North
<6571> +proj=lcc +lat_1=45.68333333333333 +lat_2=44.41666666666666 +lat_0=43.83333333333334 +lon_0=-100 +x_0=600000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / South Dakota North (ftUS)
<6572> +proj=lcc +lat_1=45.68333333333333 +lat_2=44.41666666666666 +lat_0=43.83333333333334 +lon_0=-100 +x_0=600000 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / South Dakota South
<6573> +proj=lcc +lat_1=44.4 +lat_2=42.83333333333334 +lat_0=42.33333333333334 +lon_0=-100.3333333333333 +x_0=600000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / South Dakota South (ftUS)
<6574> +proj=lcc +lat_1=44.4 +lat_2=42.83333333333334 +lat_0=42.33333333333334 +lon_0=-100.3333333333333 +x_0=600000 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Tennessee
<6575> +proj=lcc +lat_1=36.41666666666666 +lat_2=35.25 +lat_0=34.33333333333334 +lon_0=-86 +x_0=600000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Tennessee (ftUS)
<6576> +proj=lcc +lat_1=36.41666666666666 +lat_2=35.25 +lat_0=34.33333333333334 +lon_0=-86 +x_0=600000 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Texas Central
<6577> +proj=lcc +lat_1=31.88333333333333 +lat_2=30.11666666666667 +lat_0=29.66666666666667 +lon_0=-100.3333333333333 +x_0=700000 +y_0=3000000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Texas Central (ftUS)
<6578> +proj=lcc +lat_1=31.88333333333333 +lat_2=30.11666666666667 +lat_0=29.66666666666667 +lon_0=-100.3333333333333 +x_0=699999.9998983998 +y_0=3000000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Texas Centric Albers Equal Area
<6579> +proj=aea +lat_1=27.5 +lat_2=35 +lat_0=18 +lon_0=-100 +x_0=1500000 +y_0=6000000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Texas Centric Lambert Conformal
<6580> +proj=lcc +lat_1=27.5 +lat_2=35 +lat_0=18 +lon_0=-100 +x_0=1500000 +y_0=5000000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Texas North
<6581> +proj=lcc +lat_1=36.18333333333333 +lat_2=34.65 +lat_0=34 +lon_0=-101.5 +x_0=200000 +y_0=1000000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Texas North (ftUS)
<6582> +proj=lcc +lat_1=36.18333333333333 +lat_2=34.65 +lat_0=34 +lon_0=-101.5 +x_0=200000.0001016002 +y_0=999999.9998983998 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Texas North Central
<6583> +proj=lcc +lat_1=33.96666666666667 +lat_2=32.13333333333333 +lat_0=31.66666666666667 +lon_0=-98.5 +x_0=600000 +y_0=2000000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Texas North Central (ftUS)
<6584> +proj=lcc +lat_1=33.96666666666667 +lat_2=32.13333333333333 +lat_0=31.66666666666667 +lon_0=-98.5 +x_0=600000 +y_0=2000000.0001016 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Texas South
<6585> +proj=lcc +lat_1=27.83333333333333 +lat_2=26.16666666666667 +lat_0=25.66666666666667 +lon_0=-98.5 +x_0=300000 +y_0=5000000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Texas South (ftUS)
<6586> +proj=lcc +lat_1=27.83333333333333 +lat_2=26.16666666666667 +lat_0=25.66666666666667 +lon_0=-98.5 +x_0=300000.0000000001 +y_0=5000000.0001016 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Texas South Central
<6587> +proj=lcc +lat_1=30.28333333333333 +lat_2=28.38333333333333 +lat_0=27.83333333333333 +lon_0=-99 +x_0=600000 +y_0=4000000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Texas South Central (ftUS)
<6588> +proj=lcc +lat_1=30.28333333333333 +lat_2=28.38333333333333 +lat_0=27.83333333333333 +lon_0=-99 +x_0=600000 +y_0=3999999.9998984 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Vermont
<6589> +proj=tmerc +lat_0=42.5 +lon_0=-72.5 +k=0.999964286 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Vermont (ftUS)
<6590> +proj=tmerc +lat_0=42.5 +lon_0=-72.5 +k=0.999964286 +x_0=500000.00001016 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Virginia Lambert
<6591> +proj=lcc +lat_1=37 +lat_2=39.5 +lat_0=36 +lon_0=-79.5 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Virginia North
<6592> +proj=lcc +lat_1=39.2 +lat_2=38.03333333333333 +lat_0=37.66666666666666 +lon_0=-78.5 +x_0=3500000 +y_0=2000000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Virginia North (ftUS)
<6593> +proj=lcc +lat_1=39.2 +lat_2=38.03333333333333 +lat_0=37.66666666666666 +lon_0=-78.5 +x_0=3500000.0001016 +y_0=2000000.0001016 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Virginia South
<6594> +proj=lcc +lat_1=37.96666666666667 +lat_2=36.76666666666667 +lat_0=36.33333333333334 +lon_0=-78.5 +x_0=3500000 +y_0=1000000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Virginia South (ftUS)
<6595> +proj=lcc +lat_1=37.96666666666667 +lat_2=36.76666666666667 +lat_0=36.33333333333334 +lon_0=-78.5 +x_0=3500000.0001016 +y_0=999999.9998983998 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Washington North
<6596> +proj=lcc +lat_1=48.73333333333333 +lat_2=47.5 +lat_0=47 +lon_0=-120.8333333333333 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Washington North (ftUS)
<6597> +proj=lcc +lat_1=48.73333333333333 +lat_2=47.5 +lat_0=47 +lon_0=-120.8333333333333 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Washington South
<6598> +proj=lcc +lat_1=47.33333333333334 +lat_2=45.83333333333334 +lat_0=45.33333333333334 +lon_0=-120.5 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Washington South (ftUS)
<6599> +proj=lcc +lat_1=47.33333333333334 +lat_2=45.83333333333334 +lat_0=45.33333333333334 +lon_0=-120.5 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / West Virginia North
<6600> +proj=lcc +lat_1=40.25 +lat_2=39 +lat_0=38.5 +lon_0=-79.5 +x_0=600000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / West Virginia North (ftUS)
<6601> +proj=lcc +lat_1=40.25 +lat_2=39 +lat_0=38.5 +lon_0=-79.5 +x_0=600000 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / West Virginia South
<6602> +proj=lcc +lat_1=38.88333333333333 +lat_2=37.48333333333333 +lat_0=37 +lon_0=-81 +x_0=600000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / West Virginia South (ftUS)
<6603> +proj=lcc +lat_1=38.88333333333333 +lat_2=37.48333333333333 +lat_0=37 +lon_0=-81 +x_0=600000 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Wisconsin Central (deprecated)
<6604> +proj=lcc +lat_1=45.5 +lat_2=44.25 +lat_0=43.83333333333334 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(2011) / Wisconsin Central (ftUS)
<6605> +proj=lcc +lat_1=45.5 +lat_2=44.25 +lat_0=43.83333333333334 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Wisconsin North
<6606> +proj=lcc +lat_1=46.76666666666667 +lat_2=45.56666666666667 +lat_0=45.16666666666666 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Wisconsin North (ftUS)
<6607> +proj=lcc +lat_1=46.76666666666667 +lat_2=45.56666666666667 +lat_0=45.16666666666666 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Wisconsin South
<6608> +proj=lcc +lat_1=44.06666666666667 +lat_2=42.73333333333333 +lat_0=42 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Wisconsin South (ftUS)
<6609> +proj=lcc +lat_1=44.06666666666667 +lat_2=42.73333333333333 +lat_0=42 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Wisconsin Transverse Mercator
<6610> +proj=tmerc +lat_0=0 +lon_0=-90 +k=0.9996 +x_0=520000 +y_0=-4480000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Wyoming East
<6611> +proj=tmerc +lat_0=40.5 +lon_0=-105.1666666666667 +k=0.9999375 +x_0=200000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Wyoming East (ftUS)
<6612> +proj=tmerc +lat_0=40.5 +lon_0=-105.1666666666667 +k=0.9999375 +x_0=200000.00001016 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Wyoming East Central
<6613> +proj=tmerc +lat_0=40.5 +lon_0=-107.3333333333333 +k=0.9999375 +x_0=400000 +y_0=100000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Wyoming East Central (ftUS)
<6614> +proj=tmerc +lat_0=40.5 +lon_0=-107.3333333333333 +k=0.9999375 +x_0=399999.99998984 +y_0=99999.99998983997 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Wyoming West
<6615> +proj=tmerc +lat_0=40.5 +lon_0=-110.0833333333333 +k=0.9999375 +x_0=800000 +y_0=100000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Wyoming West (ftUS)
<6616> +proj=tmerc +lat_0=40.5 +lon_0=-110.0833333333333 +k=0.9999375 +x_0=800000.0000101599 +y_0=99999.99998983997 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Wyoming West Central
<6617> +proj=tmerc +lat_0=40.5 +lon_0=-108.75 +k=0.9999375 +x_0=600000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Wyoming West Central (ftUS)
<6618> +proj=tmerc +lat_0=40.5 +lon_0=-108.75 +k=0.9999375 +x_0=600000 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Utah Central
<6619> +proj=lcc +lat_1=40.65 +lat_2=39.01666666666667 +lat_0=38.33333333333334 +lon_0=-111.5 +x_0=500000 +y_0=2000000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Utah North
<6620> +proj=lcc +lat_1=41.78333333333333 +lat_2=40.71666666666667 +lat_0=40.33333333333334 +lon_0=-111.5 +x_0=500000 +y_0=1000000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Utah South
<6621> +proj=lcc +lat_1=38.35 +lat_2=37.21666666666667 +lat_0=36.66666666666666 +lon_0=-111.5 +x_0=500000 +y_0=3000000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CSRS) / Quebec Lambert
<6622> +proj=lcc +lat_1=60 +lat_2=46 +lat_0=44 +lon_0=-68.5 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83 / Quebec Albers
<6623> +proj=aea +lat_1=60 +lat_2=46 +lat_0=44 +lon_0=-68.5 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83(CSRS) / Quebec Albers
<6624> +proj=aea +lat_1=60 +lat_2=46 +lat_0=44 +lon_0=-68.5 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(2011) / Utah Central (ftUS)
<6625> +proj=lcc +lat_1=40.65 +lat_2=39.01666666666667 +lat_0=38.33333333333334 +lon_0=-111.5 +x_0=500000.00001016 +y_0=2000000.00001016 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Utah North (ftUS)
<6626> +proj=lcc +lat_1=41.78333333333333 +lat_2=40.71666666666667 +lat_0=40.33333333333334 +lon_0=-111.5 +x_0=500000.00001016 +y_0=999999.9999898402 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / Utah South (ftUS)
<6627> +proj=lcc +lat_1=38.35 +lat_2=37.21666666666667 +lat_0=36.66666666666666 +lon_0=-111.5 +x_0=500000.00001016 +y_0=3000000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(PA11) / Hawaii zone 1
<6628> +proj=tmerc +lat_0=18.83333333333333 +lon_0=-155.5 +k=0.999966667 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(PA11) / Hawaii zone 2
<6629> +proj=tmerc +lat_0=20.33333333333333 +lon_0=-156.6666666666667 +k=0.999966667 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(PA11) / Hawaii zone 3
<6630> +proj=tmerc +lat_0=21.16666666666667 +lon_0=-158 +k=0.99999 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(PA11) / Hawaii zone 4
<6631> +proj=tmerc +lat_0=21.83333333333333 +lon_0=-159.5 +k=0.99999 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(PA11) / Hawaii zone 5
<6632> +proj=tmerc +lat_0=21.66666666666667 +lon_0=-160.1666666666667 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(PA11) / Hawaii zone 3 (ftUS)
<6633> +proj=tmerc +lat_0=21.16666666666667 +lon_0=-158 +k=0.99999 +x_0=500000.00001016 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(PA11) / UTM zone 4N
<6634> +proj=utm +zone=4 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(PA11) / UTM zone 5N
<6635> +proj=utm +zone=5 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(PA11) / UTM zone 2S
<6636> +proj=utm +zone=2 +south +ellps=GRS80 +units=m +no_defs  <>
# NAD83(MA11) / Guam Map Grid
<6637> +proj=tmerc +lat_0=13.5 +lon_0=144.75 +k=1 +x_0=100000 +y_0=200000 +ellps=GRS80 +units=m +no_defs  <>
# Karbala 1979 / Iraq National Grid
<6646> +proj=tmerc +lat_0=29.02626833333333 +lon_0=46.5 +k=0.9994 +x_0=800000 +y_0=0 +ellps=clrk80 +towgs84=70.995,-335.916,262.898,0,0,0,0 +units=m +no_defs  <>
# JGD2011 / Japan Plane Rectangular CS I
<6669> +proj=tmerc +lat_0=33 +lon_0=129.5 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / Japan Plane Rectangular CS II
<6670> +proj=tmerc +lat_0=33 +lon_0=131 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / Japan Plane Rectangular CS III
<6671> +proj=tmerc +lat_0=36 +lon_0=132.1666666666667 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / Japan Plane Rectangular CS IV
<6672> +proj=tmerc +lat_0=33 +lon_0=133.5 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / Japan Plane Rectangular CS V
<6673> +proj=tmerc +lat_0=36 +lon_0=134.3333333333333 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / Japan Plane Rectangular CS VI
<6674> +proj=tmerc +lat_0=36 +lon_0=136 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / Japan Plane Rectangular CS VII
<6675> +proj=tmerc +lat_0=36 +lon_0=137.1666666666667 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / Japan Plane Rectangular CS VIII
<6676> +proj=tmerc +lat_0=36 +lon_0=138.5 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / Japan Plane Rectangular CS IX
<6677> +proj=tmerc +lat_0=36 +lon_0=139.8333333333333 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / Japan Plane Rectangular CS X
<6678> +proj=tmerc +lat_0=40 +lon_0=140.8333333333333 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / Japan Plane Rectangular CS XI
<6679> +proj=tmerc +lat_0=44 +lon_0=140.25 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / Japan Plane Rectangular CS XII
<6680> +proj=tmerc +lat_0=44 +lon_0=142.25 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / Japan Plane Rectangular CS XIII
<6681> +proj=tmerc +lat_0=44 +lon_0=144.25 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / Japan Plane Rectangular CS XIV
<6682> +proj=tmerc +lat_0=26 +lon_0=142 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / Japan Plane Rectangular CS XV
<6683> +proj=tmerc +lat_0=26 +lon_0=127.5 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / Japan Plane Rectangular CS XVI
<6684> +proj=tmerc +lat_0=26 +lon_0=124 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / Japan Plane Rectangular CS XVII
<6685> +proj=tmerc +lat_0=26 +lon_0=131 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / Japan Plane Rectangular CS XVIII
<6686> +proj=tmerc +lat_0=20 +lon_0=136 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / Japan Plane Rectangular CS XIX
<6687> +proj=tmerc +lat_0=26 +lon_0=154 +k=0.9999 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / UTM zone 51N
<6688> +proj=utm +zone=51 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / UTM zone 52N
<6689> +proj=utm +zone=52 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / UTM zone 53N
<6690> +proj=utm +zone=53 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / UTM zone 54N
<6691> +proj=utm +zone=54 +ellps=GRS80 +units=m +no_defs  <>
# JGD2011 / UTM zone 55N
<6692> +proj=utm +zone=55 +ellps=GRS80 +units=m +no_defs  <>
# WGS 84 / TM 60 SW
<6703> +proj=tmerc +lat_0=0 +lon_0=-60 +k=0.9996 +x_0=500000 +y_0=10000000 +datum=WGS84 +units=m +no_defs  <>
# RDN2008 / UTM zone 32N (N-E)
<6707> +proj=utm +zone=32 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RDN2008 / UTM zone 33N (N-E)
<6708> +proj=utm +zone=33 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RDN2008 / UTM zone 34N (N-E)
<6709> +proj=utm +zone=34 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# WGS 84 / CIG92
<6720> +proj=tmerc +lat_0=0 +lon_0=105.625 +k=1.000024 +x_0=50000 +y_0=1300000 +datum=WGS84 +units=m +no_defs  <>
# GDA94 / CIG94
<6721> +proj=tmerc +lat_0=0 +lon_0=105.625 +k=1.00002514 +x_0=50000 +y_0=1300000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# WGS 84 / CKIG92
<6722> +proj=tmerc +lat_0=0 +lon_0=96.875 +k=1 +x_0=50000 +y_0=1400000 +datum=WGS84 +units=m +no_defs  <>
# GDA94 / CKIG94
<6723> +proj=tmerc +lat_0=0 +lon_0=96.875 +k=0.99999387 +x_0=50000 +y_0=1500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GDA94 / MGA zone 41 (deprecated)
<6732> +proj=utm +zone=41 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GDA94 / MGA zone 42 (deprecated)
<6733> +proj=utm +zone=42 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GDA94 / MGA zone 43 (deprecated)
<6734> +proj=utm +zone=43 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GDA94 / MGA zone 44 (deprecated)
<6735> +proj=utm +zone=44 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GDA94 / MGA zone 46
<6736> +proj=utm +zone=46 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GDA94 / MGA zone 47
<6737> +proj=utm +zone=47 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GDA94 / MGA zone 59
<6738> +proj=utm +zone=59 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon Baker zone (m)
<6784> +proj=tmerc +lat_0=44.5 +lon_0=-117.8333333333333 +k=1.00016 +x_0=40000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon Baker zone (ft)
<6785> +proj=tmerc +lat_0=44.5 +lon_0=-117.8333333333333 +k=1.00016 +x_0=39999.99999984 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Baker zone (m)
<6786> +proj=tmerc +lat_0=44.5 +lon_0=-117.8333333333333 +k=1.00016 +x_0=40000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Baker zone (ft)
<6787> +proj=tmerc +lat_0=44.5 +lon_0=-117.8333333333333 +k=1.00016 +x_0=39999.99999984 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(CORS96) / Oregon Bend-Klamath Falls zone (m)
<6788> +proj=tmerc +lat_0=41.75 +lon_0=-121.75 +k=1.0002 +x_0=80000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon Bend-Klamath Falls zone (ft)
<6789> +proj=tmerc +lat_0=41.75 +lon_0=-121.75 +k=1.0002 +x_0=79999.99999968 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Bend-Klamath Falls zone (m)
<6790> +proj=tmerc +lat_0=41.75 +lon_0=-121.75 +k=1.0002 +x_0=80000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Bend-Klamath Falls zone (ft)
<6791> +proj=tmerc +lat_0=41.75 +lon_0=-121.75 +k=1.0002 +x_0=79999.99999968 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(CORS96) / Oregon Bend-Redmond-Prineville zone (m)
<6792> +proj=lcc +lat_1=44.66666666666666 +lat_0=44.66666666666666 +lon_0=-121.25 +k_0=1.00012 +x_0=80000 +y_0=130000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon Bend-Redmond-Prineville zone (ft)
<6793> +proj=lcc +lat_1=44.66666666666666 +lat_0=44.66666666666666 +lon_0=-121.25 +k_0=1.00012 +x_0=79999.99999968 +y_0=130000.00001472 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Bend-Redmond-Prineville zone (m)
<6794> +proj=lcc +lat_1=44.66666666666666 +lat_0=44.66666666666666 +lon_0=-121.25 +k_0=1.00012 +x_0=80000 +y_0=130000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Bend-Redmond-Prineville zone (ft)
<6795> +proj=lcc +lat_1=44.66666666666666 +lat_0=44.66666666666666 +lon_0=-121.25 +k_0=1.00012 +x_0=79999.99999968 +y_0=130000.00001472 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(CORS96) / Oregon Bend-Burns zone (m)
<6796> +proj=lcc +lat_1=43.66666666666666 +lat_0=43.66666666666666 +lon_0=-119.75 +k_0=1.0002 +x_0=120000 +y_0=60000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon Bend-Burns zone (ft)
<6797> +proj=lcc +lat_1=43.66666666666666 +lat_0=43.66666666666666 +lon_0=-119.75 +k_0=1.0002 +x_0=119999.99999952 +y_0=59999.99999976 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Bend-Burns zone (m)
<6798> +proj=lcc +lat_1=43.66666666666666 +lat_0=43.66666666666666 +lon_0=-119.75 +k_0=1.0002 +x_0=120000 +y_0=60000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Bend-Burns zone (ft)
<6799> +proj=lcc +lat_1=43.66666666666666 +lat_0=43.66666666666666 +lon_0=-119.75 +k_0=1.0002 +x_0=119999.99999952 +y_0=59999.99999976 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(CORS96) / Oregon Canyonville-Grants Pass zone (m)
<6800> +proj=tmerc +lat_0=42.5 +lon_0=-123.3333333333333 +k=1.00007 +x_0=40000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon Canyonville-Grants Pass zone (ft)
<6801> +proj=tmerc +lat_0=42.5 +lon_0=-123.3333333333333 +k=1.00007 +x_0=39999.99999984 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Canyonville-Grants Pass zone (m)
<6802> +proj=tmerc +lat_0=42.5 +lon_0=-123.3333333333333 +k=1.00007 +x_0=40000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Canyonville-Grants Pass zone (ft)
<6803> +proj=tmerc +lat_0=42.5 +lon_0=-123.3333333333333 +k=1.00007 +x_0=39999.99999984 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(CORS96) / Oregon Columbia River East zone (m)
<6804> +proj=lcc +lat_1=45.66666666666666 +lat_0=45.66666666666666 +lon_0=-120.5 +k_0=1.000008 +x_0=150000 +y_0=30000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon Columbia River East zone (ft)
<6805> +proj=lcc +lat_1=45.66666666666666 +lat_0=45.66666666666666 +lon_0=-120.5 +k_0=1.000008 +x_0=150000.00001464 +y_0=30000.00001512 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Columbia River East zone (m)
<6806> +proj=lcc +lat_1=45.66666666666666 +lat_0=45.66666666666666 +lon_0=-120.5 +k_0=1.000008 +x_0=150000 +y_0=30000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Columbia River East zone (ft)
<6807> +proj=lcc +lat_1=45.66666666666666 +lat_0=45.66666666666666 +lon_0=-120.5 +k_0=1.000008 +x_0=150000.00001464 +y_0=30000.00001512 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(CORS96) / Oregon Columbia River West zone (m)
<6808> +proj=omerc +lat_0=45.91666666666666 +lonc=-123 +alpha=295 +k=1 +x_0=7000000 +y_0=-3000000 +no_uoff +gamma=295 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon Columbia River West zone (ft)
<6809> +proj=omerc +lat_0=45.91666666666666 +lonc=-123 +alpha=295 +k=1 +x_0=7000000.00000248 +y_0=-2999999.999988 +no_uoff +gamma=295 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Columbia River West zone (m)
<6810> +proj=omerc +lat_0=45.91666666666666 +lonc=-123 +alpha=295 +k=1 +x_0=7000000 +y_0=-3000000 +no_uoff +gamma=295 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Columbia River West zone (ft)
<6811> +proj=omerc +lat_0=45.91666666666666 +lonc=-123 +alpha=295 +k=1 +x_0=7000000.00000248 +y_0=-2999999.999988 +no_uoff +gamma=295 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(CORS96) / Oregon Cottage Grove-Canyonville zone (m)
<6812> +proj=tmerc +lat_0=42.83333333333334 +lon_0=-123.3333333333333 +k=1.000023 +x_0=50000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon Cottage Grove-Canyonville zone (ft)
<6813> +proj=tmerc +lat_0=42.83333333333334 +lon_0=-123.3333333333333 +k=1.000023 +x_0=50000.00001504 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Cottage Grove-Canyonville zone (m)
<6814> +proj=tmerc +lat_0=42.83333333333334 +lon_0=-123.3333333333333 +k=1.000023 +x_0=50000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Cottage Grove-Canyonville zone (ft)
<6815> +proj=tmerc +lat_0=42.83333333333334 +lon_0=-123.3333333333333 +k=1.000023 +x_0=50000.00001504 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(CORS96) / Oregon Dufur-Madras zone (m)
<6816> +proj=tmerc +lat_0=44.5 +lon_0=-121 +k=1.00011 +x_0=80000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon Dufur-Madras zone (ft)
<6817> +proj=tmerc +lat_0=44.5 +lon_0=-121 +k=1.00011 +x_0=79999.99999968 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Dufur-Madras zone (m)
<6818> +proj=tmerc +lat_0=44.5 +lon_0=-121 +k=1.00011 +x_0=80000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Dufur-Madras zone (ft)
<6819> +proj=tmerc +lat_0=44.5 +lon_0=-121 +k=1.00011 +x_0=79999.99999968 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(CORS96) / Oregon Eugene zone (m)
<6820> +proj=tmerc +lat_0=43.75 +lon_0=-123.1666666666667 +k=1.000015 +x_0=50000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon Eugene zone (ft)
<6821> +proj=tmerc +lat_0=43.75 +lon_0=-123.1666666666667 +k=1.000015 +x_0=50000.00001504 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Eugene zone (m)
<6822> +proj=tmerc +lat_0=43.75 +lon_0=-123.1666666666667 +k=1.000015 +x_0=50000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Eugene zone (ft)
<6823> +proj=tmerc +lat_0=43.75 +lon_0=-123.1666666666667 +k=1.000015 +x_0=50000.00001504 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(CORS96) / Oregon Grants Pass-Ashland zone (m)
<6824> +proj=tmerc +lat_0=41.75 +lon_0=-123.3333333333333 +k=1.000043 +x_0=50000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon Grants Pass-Ashland zone (ft)
<6825> +proj=tmerc +lat_0=41.75 +lon_0=-123.3333333333333 +k=1.000043 +x_0=50000.00001504 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Grants Pass-Ashland zone (m)
<6826> +proj=tmerc +lat_0=41.75 +lon_0=-123.3333333333333 +k=1.000043 +x_0=50000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Grants Pass-Ashland zone (ft)
<6827> +proj=tmerc +lat_0=41.75 +lon_0=-123.3333333333333 +k=1.000043 +x_0=50000.00001504 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(CORS96) / Oregon Gresham-Warm Springs zone (m)
<6828> +proj=tmerc +lat_0=45 +lon_0=-122.3333333333333 +k=1.00005 +x_0=10000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon Gresham-Warm Springs zone (ft)
<6829> +proj=tmerc +lat_0=45 +lon_0=-122.3333333333333 +k=1.00005 +x_0=10000.0000152 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Gresham-Warm Springs zone (m)
<6830> +proj=tmerc +lat_0=45 +lon_0=-122.3333333333333 +k=1.00005 +x_0=10000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Gresham-Warm Springs zone (ft)
<6831> +proj=tmerc +lat_0=45 +lon_0=-122.3333333333333 +k=1.00005 +x_0=10000.0000152 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(CORS96) / Oregon La Grande zone (m)
<6832> +proj=tmerc +lat_0=45 +lon_0=-118 +k=1.00013 +x_0=40000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon La Grande zone (ft)
<6833> +proj=tmerc +lat_0=45 +lon_0=-118 +k=1.00013 +x_0=39999.99999984 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon La Grande zone (m)
<6834> +proj=tmerc +lat_0=45 +lon_0=-118 +k=1.00013 +x_0=40000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon La Grande zone (ft)
<6835> +proj=tmerc +lat_0=45 +lon_0=-118 +k=1.00013 +x_0=39999.99999984 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(CORS96) / Oregon Ontario zone (m)
<6836> +proj=tmerc +lat_0=43.25 +lon_0=-117 +k=1.0001 +x_0=80000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon Ontario zone (ft)
<6837> +proj=tmerc +lat_0=43.25 +lon_0=-117 +k=1.0001 +x_0=79999.99999968 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Ontario zone (m)
<6838> +proj=tmerc +lat_0=43.25 +lon_0=-117 +k=1.0001 +x_0=80000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Ontario zone (ft)
<6839> +proj=tmerc +lat_0=43.25 +lon_0=-117 +k=1.0001 +x_0=79999.99999968 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(CORS96) / Oregon Coast zone (m)
<6840> +proj=omerc +lat_0=44.75 +lonc=-124.05 +alpha=5 +k=1 +x_0=-300000 +y_0=-4600000 +no_uoff +gamma=5 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon Coast zone (ft)
<6841> +proj=omerc +lat_0=44.75 +lonc=-124.05 +alpha=5 +k=1 +x_0=-299999.9999988 +y_0=-4600000.00001208 +no_uoff +gamma=5 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Coast zone (m)
<6842> +proj=omerc +lat_0=44.75 +lonc=-124.05 +alpha=5 +k=1 +x_0=-300000 +y_0=-4600000 +no_uoff +gamma=5 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Coast zone (ft)
<6843> +proj=omerc +lat_0=44.75 +lonc=-124.05 +alpha=5 +k=1 +x_0=-299999.9999988 +y_0=-4600000.00001208 +no_uoff +gamma=5 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(CORS96) / Oregon Pendleton zone (m)
<6844> +proj=tmerc +lat_0=45.25 +lon_0=-119.1666666666667 +k=1.000045 +x_0=60000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon Pendleton zone (ft)
<6845> +proj=tmerc +lat_0=45.25 +lon_0=-119.1666666666667 +k=1.000045 +x_0=59999.99999976 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Pendleton zone (m)
<6846> +proj=tmerc +lat_0=45.25 +lon_0=-119.1666666666667 +k=1.000045 +x_0=60000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Pendleton zone (ft)
<6847> +proj=tmerc +lat_0=45.25 +lon_0=-119.1666666666667 +k=1.000045 +x_0=59999.99999976 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(CORS96) / Oregon Pendleton-La Grande zone (m)
<6848> +proj=tmerc +lat_0=45.08333333333334 +lon_0=-118.3333333333333 +k=1.000175 +x_0=30000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon Pendleton-La Grande zone (ft)
<6849> +proj=tmerc +lat_0=45.08333333333334 +lon_0=-118.3333333333333 +k=1.000175 +x_0=30000.00001512 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Pendleton-La Grande zone (m)
<6850> +proj=tmerc +lat_0=45.08333333333334 +lon_0=-118.3333333333333 +k=1.000175 +x_0=30000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Pendleton-La Grande zone (ft)
<6851> +proj=tmerc +lat_0=45.08333333333334 +lon_0=-118.3333333333333 +k=1.000175 +x_0=30000.00001512 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(CORS96) / Oregon Portland zone (m)
<6852> +proj=lcc +lat_1=45.5 +lat_0=45.5 +lon_0=-122.75 +k_0=1.000002 +x_0=100000 +y_0=50000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon Portland zone (ft)
<6853> +proj=lcc +lat_1=45.5 +lat_0=45.5 +lon_0=-122.75 +k_0=1.000002 +x_0=99999.99999960001 +y_0=50000.00001504 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Portland zone (m)
<6854> +proj=lcc +lat_1=45.5 +lat_0=45.5 +lon_0=-122.75 +k_0=1.000002 +x_0=100000 +y_0=50000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Portland zone (ft)
<6855> +proj=lcc +lat_1=45.5 +lat_0=45.5 +lon_0=-122.75 +k_0=1.000002 +x_0=99999.99999960001 +y_0=50000.00001504 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(CORS96) / Oregon Salem zone (m)
<6856> +proj=tmerc +lat_0=44.33333333333334 +lon_0=-123.0833333333333 +k=1.00001 +x_0=50000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon Salem zone (ft)
<6857> +proj=tmerc +lat_0=44.33333333333334 +lon_0=-123.0833333333333 +k=1.00001 +x_0=50000.00001504 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Salem zone (m)
<6858> +proj=tmerc +lat_0=44.33333333333334 +lon_0=-123.0833333333333 +k=1.00001 +x_0=50000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Salem zone (ft)
<6859> +proj=tmerc +lat_0=44.33333333333334 +lon_0=-123.0833333333333 +k=1.00001 +x_0=50000.00001504 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(CORS96) / Oregon Santiam Pass zone (m)
<6860> +proj=tmerc +lat_0=44.08333333333334 +lon_0=-122.5 +k=1.000155 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon Santiam Pass zone (ft)
<6861> +proj=tmerc +lat_0=44.08333333333334 +lon_0=-122.5 +k=1.000155 +x_0=0 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Santiam Pass zone (m)
<6862> +proj=tmerc +lat_0=44.08333333333334 +lon_0=-122.5 +k=1.000155 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Santiam Pass zone (ft)
<6863> +proj=tmerc +lat_0=44.08333333333334 +lon_0=-122.5 +k=1.000155 +x_0=0 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(CORS96) / Oregon LCC (m)
<6867> +proj=lcc +lat_1=43 +lat_2=45.5 +lat_0=41.75 +lon_0=-120.5 +x_0=400000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon GIC Lambert (ft)
<6868> +proj=lcc +lat_1=43 +lat_2=45.5 +lat_0=41.75 +lon_0=-120.5 +x_0=399999.9999984 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# ETRS89 / Albania TM 2010
<6870> +proj=tmerc +lat_0=0 +lon_0=20 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RDN2008 / Italy zone (N-E)
<6875> +proj=tmerc +lat_0=0 +lon_0=12 +k=0.9985000000000001 +x_0=7000000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RDN2008 / Zone 12 (N-E)
<6876> +proj=tmerc +lat_0=0 +lon_0=12 +k=1 +x_0=3000000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(2011) / Wisconsin Central
<6879> +proj=lcc +lat_1=45.5 +lat_2=44.25 +lat_0=43.83333333333334 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Nebraska (ftUS)
<6880> +proj=lcc +lat_1=43 +lat_2=40 +lat_0=39.83333333333334 +lon_0=-100 +x_0=500000.00001016 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(CORS96) / Oregon North
<6884> +proj=lcc +lat_1=46 +lat_2=44.33333333333334 +lat_0=43.66666666666666 +lon_0=-120.5 +x_0=2500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon North (ft)
<6885> +proj=lcc +lat_1=46 +lat_2=44.33333333333334 +lat_0=43.66666666666666 +lon_0=-120.5 +x_0=2500000.0001424 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(CORS96) / Oregon South
<6886> +proj=lcc +lat_1=44 +lat_2=42.33333333333334 +lat_0=41.66666666666666 +lon_0=-120.5 +x_0=1500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96) / Oregon South (ft)
<6887> +proj=lcc +lat_1=44 +lat_2=42.33333333333334 +lat_0=41.66666666666666 +lon_0=-120.5 +x_0=1500000.0001464 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# South East Island 1943 / UTM zone 40N
<6915> +proj=utm +zone=40 +ellps=clrk80 +towgs84=-43.685,-179.785,-267.721,0,0,0,0 +units=m +no_defs  <>
# NAD83 / Kansas LCC
<6922> +proj=lcc +lat_1=39.5 +lat_2=37.5 +lat_0=36 +lon_0=-98.25 +x_0=400000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Kansas LCC (ftUS)
<6923> +proj=lcc +lat_1=39.5 +lat_2=37.5 +lat_0=36 +lon_0=-98.25 +x_0=399999.99998984 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83(2011) / Kansas LCC
<6924> +proj=lcc +lat_1=39.5 +lat_2=37.5 +lat_0=36 +lon_0=-98.25 +x_0=400000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Kansas LCC (ftUS)
<6925> +proj=lcc +lat_1=39.5 +lat_2=37.5 +lat_0=36 +lon_0=-98.25 +x_0=399999.99998984 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# WGS 84 / NSIDC EASE-Grid 2.0 North
<6931> +proj=laea +lat_0=90 +lon_0=0 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / NSIDC EASE-Grid 2.0 South
<6932> +proj=laea +lat_0=-90 +lon_0=0 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / NSIDC EASE-Grid 2.0 Global
<6933> +proj=cea +lon_0=0 +lat_ts=30 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# VN-2000 / TM-3 zone 481
<6956> +proj=tmerc +lat_0=0 +lon_0=102 +k=0.9999 +x_0=0 +y_0=500000 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,0.00928836,-0.01975479,0.00427372,0.252906278 +units=m +no_defs  <>
# VN-2000 / TM-3 zone 482
<6957> +proj=tmerc +lat_0=0 +lon_0=105 +k=0.9999 +x_0=0 +y_0=500000 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,0.00928836,-0.01975479,0.00427372,0.252906278 +units=m +no_defs  <>
# VN-2000 / TM-3 zone 491
<6958> +proj=tmerc +lat_0=0 +lon_0=108 +k=0.9999 +x_0=0 +y_0=500000 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,0.00928836,-0.01975479,0.00427372,0.252906278 +units=m +no_defs  <>
# VN-2000 / TM-3 Da Nang zone
<6959> +proj=tmerc +lat_0=0 +lon_0=107.75 +k=0.9999 +x_0=0 +y_0=500000 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,0.00928836,-0.01975479,0.00427372,0.252906278 +units=m +no_defs  <>
# ETRS89 / Albania LCC 2010
<6962> +proj=lcc +lat_1=39 +lat_2=43 +lat_0=41 +lon_0=20 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD27 / Michigan North
# Unable to translate coordinate system EPSG:6966 into PROJ.4 format.
#
# Israeli Grid 05
<6984> +proj=tmerc +lat_0=31.73439361111111 +lon_0=35.20451694444445 +k=1.0000067 +x_0=219529.584 +y_0=626907.39 +ellps=GRS80 +units=m +no_defs  <>
# Israeli Grid 05/12
<6991> +proj=tmerc +lat_0=31.73439361111111 +lon_0=35.20451694444445 +k=1.0000067 +x_0=219529.584 +y_0=626907.39 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / San Francisco CS13 (deprecated)
<6996> +proj=tmerc +lat_0=37.75 +lon_0=-122.45 +k=1.000007 +x_0=48000 +y_0=24000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / San Francisco CS13 (ftUS) (deprecated)
<6997> +proj=tmerc +lat_0=37.75 +lon_0=-122.45 +k=1.000007 +x_0=48000 +y_0=24000 +ellps=GRS80 +units=us-ft +no_defs  <>
# Nahrwan 1934 / UTM zone 37N
<7005> +proj=utm +zone=37 +ellps=clrk80 +towgs84=-242.2,-144.9,370.3,0,0,0,0 +units=m +no_defs  <>
# Nahrwan 1934 / UTM zone 38N
<7006> +proj=utm +zone=38 +ellps=clrk80 +towgs84=-242.2,-144.9,370.3,0,0,0,0 +units=m +no_defs  <>
# Nahrwan 1934 / UTM zone 39N
<7007> +proj=utm +zone=39 +ellps=clrk80 +towgs84=-242.2,-144.9,370.3,0,0,0,0 +units=m +no_defs  <>
# NAD83(2011) / IaRCS zone 1
<7057> +proj=lcc +lat_1=43.2 +lat_0=43.2 +lon_0=-95.25 +k_0=1.000052 +x_0=3505207.010414021 +y_0=2926085.852171705 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / IaRCS zone 2
<7058> +proj=lcc +lat_1=43.16666666666666 +lat_0=43.16666666666666 +lon_0=-92.75 +k_0=1.000043 +x_0=3810007.62001524 +y_0=2987045.974091948 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / IaRCS zone 3
<7059> +proj=tmerc +lat_0=40.25 +lon_0=-91.2 +k=1.000035 +x_0=4114808.229616459 +y_0=2529845.05969012 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / IaRCS zone 4
<7060> +proj=lcc +lat_1=42.53333333333333 +lat_0=42.53333333333333 +lon_0=-94.83333333333333 +k_0=1.000045 +x_0=4419608.839217679 +y_0=2621285.242570485 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / IaRCS zone 5
<7061> +proj=lcc +lat_1=42.65 +lat_0=42.65 +lon_0=-92.25 +k_0=1.000032 +x_0=4724409.448818898 +y_0=2712725.425450851 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / IaRCS zone 6
<7062> +proj=tmerc +lat_0=40.25 +lon_0=-95.73333333333333 +k=1.000039 +x_0=5029210.058420117 +y_0=2011684.023368047 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / IaRCS zone 7
<7063> +proj=tmerc +lat_0=40.25 +lon_0=-94.63333333333334 +k=1.000045 +x_0=5334010.668021336 +y_0=2072644.145288291 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / IaRCS zone 8
<7064> +proj=tmerc +lat_0=40.25 +lon_0=-93.71666666666667 +k=1.000033 +x_0=5638811.277622555 +y_0=2133604.267208535 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / IaRCS zone 9
<7065> +proj=tmerc +lat_0=40.25 +lon_0=-92.81666666666666 +k=1.000027 +x_0=5943611.887223775 +y_0=2194564.389128779 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / IaRCS zone 10
<7066> +proj=lcc +lat_1=41.83333333333334 +lat_0=41.83333333333334 +lon_0=-91.66666666666667 +k_0=1.00002 +x_0=6248412.496824994 +y_0=2438404.876809754 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / IaRCS zone 11
<7067> +proj=tmerc +lat_0=40.25 +lon_0=-90.53333333333333 +k=1.000027 +x_0=6553213.106426213 +y_0=2316484.632969266 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / IaRCS zone 12
<7068> +proj=lcc +lat_1=40.91666666666666 +lat_0=40.91666666666666 +lon_0=-93.75 +k_0=1.000037 +x_0=6858013.716027432 +y_0=1889763.779527559 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / IaRCS zone 13
<7069> +proj=tmerc +lat_0=40.25 +lon_0=-91.91666666666667 +k=1.00002 +x_0=7162814.325628651 +y_0=1950723.901447803 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / IaRCS zone 14
<7070> +proj=tmerc +lat_0=40.25 +lon_0=-91.25 +k=1.000018 +x_0=7467614.93522987 +y_0=1889763.779527559 +ellps=GRS80 +units=us-ft +no_defs  <>
# RGTAAF07 / UTM zone 37S
<7074> +proj=utm +zone=37 +south +ellps=GRS80 +units=m +no_defs  <>
# RGTAAF07 / UTM zone 38S
<7075> +proj=utm +zone=38 +south +ellps=GRS80 +units=m +no_defs  <>
# RGTAAF07 / UTM zone 39S
<7076> +proj=utm +zone=39 +south +ellps=GRS80 +units=m +no_defs  <>
# RGTAAF07 / UTM zone 40S
<7077> +proj=utm +zone=40 +south +ellps=GRS80 +units=m +no_defs  <>
# RGTAAF07 / UTM zone 41S
<7078> +proj=utm +zone=41 +south +ellps=GRS80 +units=m +no_defs  <>
# RGTAAF07 / UTM zone 42S
<7079> +proj=utm +zone=42 +south +ellps=GRS80 +units=m +no_defs  <>
# RGTAAF07 / UTM zone 43S
<7080> +proj=utm +zone=43 +south +ellps=GRS80 +units=m +no_defs  <>
# RGTAAF07 / UTM zone 44S
<7081> +proj=utm +zone=44 +south +ellps=GRS80 +units=m +no_defs  <>
# RGTAAF07 / Terre Adelie Polar Stereographic
# Unable to translate coordinate system EPSG:7082 into PROJ.4 format.
#
# NAD83(2011) / RMTCRS St Mary (m)
<7109> +proj=tmerc +lat_0=48.5 +lon_0=-112.5 +k=1.00016 +x_0=150000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / RMTCRS Blackfeet (m)
<7110> +proj=tmerc +lat_0=48 +lon_0=-112.5 +k=1.00019 +x_0=100000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / RMTCRS Milk River (m)
<7111> +proj=lcc +lat_1=48.5 +lat_0=48.5 +lon_0=-111 +k_0=1.000145 +x_0=150000 +y_0=200000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / RMTCRS Fort Belknap (m)
<7112> +proj=lcc +lat_1=48.5 +lat_0=48.5 +lon_0=-108.5 +k_0=1.00012 +x_0=200000 +y_0=150000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / RMTCRS Fort Peck Assiniboine (m)
<7113> +proj=lcc +lat_1=48.33333333333334 +lat_0=48.33333333333334 +lon_0=-105.5 +k_0=1.00012 +x_0=200000 +y_0=100000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / RMTCRS Fort Peck Sioux (m)
<7114> +proj=lcc +lat_1=48.33333333333334 +lat_0=48.33333333333334 +lon_0=-105.5 +k_0=1.00009 +x_0=100000 +y_0=50000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / RMTCRS Crow (m)
<7115> +proj=tmerc +lat_0=44.75 +lon_0=-107.75 +k=1.000148 +x_0=200000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / RMTCRS Bobcat (m)
<7116> +proj=lcc +lat_1=46.25 +lat_0=46.25 +lon_0=-111.25 +k_0=1.000185 +x_0=100000 +y_0=100000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / RMTCRS Billings (m)
<7117> +proj=lcc +lat_1=45.78333333333333 +lat_0=45.78333333333333 +lon_0=-108.4166666666667 +k_0=1.0001515 +x_0=200000 +y_0=50000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / RMTCRS Wind River (m)
<7118> +proj=tmerc +lat_0=42.66666666666666 +lon_0=-108.3333333333333 +k=1.00024 +x_0=100000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / RMTCRS St Mary (ft)
<7119> +proj=tmerc +lat_0=48.5 +lon_0=-112.5 +k=1.00016 +x_0=150000.00001464 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / RMTCRS Blackfeet (ft)
<7120> +proj=tmerc +lat_0=48 +lon_0=-112.5 +k=1.00019 +x_0=99999.99999960001 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / RMTCRS Milk River (ft)
<7121> +proj=lcc +lat_1=48.5 +lat_0=48.5 +lon_0=-111 +k_0=1.000145 +x_0=150000.00001464 +y_0=199999.9999992 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / RMTCRS Fort Belknap (ft)
<7122> +proj=lcc +lat_1=48.5 +lat_0=48.5 +lon_0=-108.5 +k_0=1.00012 +x_0=199999.9999992 +y_0=150000.00001464 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / RMTCRS Fort Peck Assiniboine (ft)
<7123> +proj=lcc +lat_1=48.33333333333334 +lat_0=48.33333333333334 +lon_0=-105.5 +k_0=1.00012 +x_0=199999.9999992 +y_0=99999.99999960001 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / RMTCRS Fort Peck Sioux (ft)
<7124> +proj=lcc +lat_1=48.33333333333334 +lat_0=48.33333333333334 +lon_0=-105.5 +k_0=1.00009 +x_0=99999.99999960001 +y_0=49999.99971024 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / RMTCRS Crow (ft)
<7125> +proj=tmerc +lat_0=44.75 +lon_0=-107.75 +k=1.000148 +x_0=199999.9999992 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / RMTCRS Bobcat (ft)
<7126> +proj=lcc +lat_1=46.25 +lat_0=46.25 +lon_0=-111.25 +k_0=1.000185 +x_0=99999.99999960001 +y_0=99999.99999960001 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / RMTCRS Billings (ft)
<7127> +proj=lcc +lat_1=45.78333333333333 +lat_0=45.78333333333333 +lon_0=-108.4166666666667 +k_0=1.0001515 +x_0=199999.9999992 +y_0=50000.00001504 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / RMTCRS Wind River (ftUS)
<7128> +proj=tmerc +lat_0=42.66666666666666 +lon_0=-108.3333333333333 +k=1.00024 +x_0=99999.99998983997 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / San Francisco CS13
<7131> +proj=tmerc +lat_0=37.75 +lon_0=-122.45 +k=1.000007 +x_0=48000 +y_0=24000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / San Francisco CS13 (ftUS)
<7132> +proj=tmerc +lat_0=37.75 +lon_0=-122.45 +k=1.000007 +x_0=48000 +y_0=24000 +ellps=GRS80 +units=us-ft +no_defs  <>
# Palestine 1923 / Palestine Grid modified
<7142> +proj=tmerc +lat_0=31.73409694444445 +lon_0=35.21208055555556 +k=1 +x_0=170251.555 +y_0=126867.909 +a=6378300.789 +b=6356566.435 +towgs84=-275.7224,94.7824,340.8944,-8.001,-4.42,-11.821,1 +units=m +no_defs  <>
# NAD83(2011) / InGCS Adams (m)
<7257> +proj=tmerc +lat_0=40.55 +lon_0=-84.95 +k=1.000034 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Adams (ftUS)
<7258> +proj=tmerc +lat_0=40.55 +lon_0=-84.95 +k=1.000034 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Allen (m)
<7259> +proj=tmerc +lat_0=40.9 +lon_0=-85.05 +k=1.000031 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Allen (ftUS)
<7260> +proj=tmerc +lat_0=40.9 +lon_0=-85.05 +k=1.000031 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Bartholomew (m)
<7261> +proj=tmerc +lat_0=39 +lon_0=-85.84999999999999 +k=1.000026 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Bartholomew (ftUS)
<7262> +proj=tmerc +lat_0=39 +lon_0=-85.84999999999999 +k=1.000026 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Benton (m)
<7263> +proj=tmerc +lat_0=40.45 +lon_0=-87.3 +k=1.000029 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Benton (ftUS)
<7264> +proj=tmerc +lat_0=40.45 +lon_0=-87.3 +k=1.000029 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Blackford-Delaware (m)
<7265> +proj=tmerc +lat_0=40.05 +lon_0=-85.40000000000001 +k=1.000038 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Blackford-Delaware (ftUS)
<7266> +proj=tmerc +lat_0=40.05 +lon_0=-85.40000000000001 +k=1.000038 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Boone-Hendricks (m)
<7267> +proj=tmerc +lat_0=39.6 +lon_0=-86.5 +k=1.000036 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Boone-Hendricks (ftUS)
<7268> +proj=tmerc +lat_0=39.6 +lon_0=-86.5 +k=1.000036 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Brown (m)
<7269> +proj=tmerc +lat_0=39 +lon_0=-86.3 +k=1.00003 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Brown (ftUS)
<7270> +proj=tmerc +lat_0=39 +lon_0=-86.3 +k=1.00003 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Carroll (m)
<7271> +proj=tmerc +lat_0=40.4 +lon_0=-86.65000000000001 +k=1.000026 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Carroll (ftUS)
<7272> +proj=tmerc +lat_0=40.4 +lon_0=-86.65000000000001 +k=1.000026 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Cass (m)
<7273> +proj=tmerc +lat_0=40.55 +lon_0=-86.40000000000001 +k=1.000028 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Cass (ftUS)
<7274> +proj=tmerc +lat_0=40.55 +lon_0=-86.40000000000001 +k=1.000028 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Clark-Floyd-Scott (m)
<7275> +proj=tmerc +lat_0=38.15 +lon_0=-85.59999999999999 +k=1.000021 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Clark-Floyd-Scott (ftUS)
<7276> +proj=tmerc +lat_0=38.15 +lon_0=-85.59999999999999 +k=1.000021 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Clay (m)
<7277> +proj=tmerc +lat_0=39.15 +lon_0=-87.15000000000001 +k=1.000024 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Clay (ftUS)
<7278> +proj=tmerc +lat_0=39.15 +lon_0=-87.15000000000001 +k=1.000024 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Clinton (m)
<7279> +proj=tmerc +lat_0=40.15 +lon_0=-86.59999999999999 +k=1.000032 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Clinton (ftUS)
<7280> +proj=tmerc +lat_0=40.15 +lon_0=-86.59999999999999 +k=1.000032 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Crawford-Lawrence-Orange (m)
<7281> +proj=tmerc +lat_0=38.1 +lon_0=-86.5 +k=1.000025 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Crawford-Lawrence-Orange (ftUS)
<7282> +proj=tmerc +lat_0=38.1 +lon_0=-86.5 +k=1.000025 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Daviess-Greene (m)
<7283> +proj=tmerc +lat_0=38.45 +lon_0=-87.09999999999999 +k=1.000018 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Daviess-Greene (ftUS)
<7284> +proj=tmerc +lat_0=38.45 +lon_0=-87.09999999999999 +k=1.000018 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Dearborn-Ohio-Switzerland (m)
<7285> +proj=tmerc +lat_0=38.65 +lon_0=-84.90000000000001 +k=1.000029 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Dearborn-Ohio-Switzerland (ftUS)
<7286> +proj=tmerc +lat_0=38.65 +lon_0=-84.90000000000001 +k=1.000029 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Decatur-Rush (m)
<7287> +proj=tmerc +lat_0=39.1 +lon_0=-85.65000000000001 +k=1.000036 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Decatur-Rush (ftUS)
<7288> +proj=tmerc +lat_0=39.1 +lon_0=-85.65000000000001 +k=1.000036 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS DeKalb (m)
<7289> +proj=tmerc +lat_0=41.25 +lon_0=-84.95 +k=1.000036 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS DeKalb (ftUS)
<7290> +proj=tmerc +lat_0=41.25 +lon_0=-84.95 +k=1.000036 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Dubois-Martin (m)
<7291> +proj=tmerc +lat_0=38.2 +lon_0=-86.95 +k=1.00002 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Dubois-Martin (ftUS)
<7292> +proj=tmerc +lat_0=38.2 +lon_0=-86.95 +k=1.00002 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Elkhart-Kosciusko-Wabash (m)
<7293> +proj=tmerc +lat_0=40.65 +lon_0=-85.84999999999999 +k=1.000033 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Elkhart-Kosciusko-Wabash (ftUS)
<7294> +proj=tmerc +lat_0=40.65 +lon_0=-85.84999999999999 +k=1.000033 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Fayette-Franklin-Union (m)
<7295> +proj=tmerc +lat_0=39.25 +lon_0=-85.05 +k=1.000038 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Fayette-Franklin-Union (ftUS)
<7296> +proj=tmerc +lat_0=39.25 +lon_0=-85.05 +k=1.000038 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Fountain-Warren (m)
<7297> +proj=tmerc +lat_0=39.95 +lon_0=-87.3 +k=1.000025 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Fountain-Warren (ftUS)
<7298> +proj=tmerc +lat_0=39.95 +lon_0=-87.3 +k=1.000025 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Fulton-Marshall-St. Joseph (m)
<7299> +proj=tmerc +lat_0=40.9 +lon_0=-86.3 +k=1.000031 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Fulton-Marshall-St. Joseph (ftUS)
<7300> +proj=tmerc +lat_0=40.9 +lon_0=-86.3 +k=1.000031 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Gibson (m)
<7301> +proj=tmerc +lat_0=38.15 +lon_0=-87.65000000000001 +k=1.000013 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Gibson (ftUS)
<7302> +proj=tmerc +lat_0=38.15 +lon_0=-87.65000000000001 +k=1.000013 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Grant (m)
<7303> +proj=tmerc +lat_0=40.35 +lon_0=-85.7 +k=1.000034 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Grant (ftUS)
<7304> +proj=tmerc +lat_0=40.35 +lon_0=-85.7 +k=1.000034 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Hamilton-Tipton (m)
<7305> +proj=tmerc +lat_0=39.9 +lon_0=-86 +k=1.000034 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Hamilton-Tipton (ftUS)
<7306> +proj=tmerc +lat_0=39.9 +lon_0=-86 +k=1.000034 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Hancock-Madison (m)
<7307> +proj=tmerc +lat_0=39.65 +lon_0=-85.8 +k=1.000036 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Hancock-Madison (ftUS)
<7308> +proj=tmerc +lat_0=39.65 +lon_0=-85.8 +k=1.000036 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Harrison-Washington (m)
<7309> +proj=tmerc +lat_0=37.95 +lon_0=-86.15000000000001 +k=1.000027 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Harrison-Washington (ftUS)
<7310> +proj=tmerc +lat_0=37.95 +lon_0=-86.15000000000001 +k=1.000027 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Henry (m)
<7311> +proj=tmerc +lat_0=39.75 +lon_0=-85.45 +k=1.000043 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Henry (ftUS)
<7312> +proj=tmerc +lat_0=39.75 +lon_0=-85.45 +k=1.000043 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Howard-Miami (m)
<7313> +proj=tmerc +lat_0=40.35 +lon_0=-86.15000000000001 +k=1.000031 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Howard-Miami (ftUS)
<7314> +proj=tmerc +lat_0=40.35 +lon_0=-86.15000000000001 +k=1.000031 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Huntington-Whitley (m)
<7315> +proj=tmerc +lat_0=40.65 +lon_0=-85.5 +k=1.000034 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Huntington-Whitley (ftUS)
<7316> +proj=tmerc +lat_0=40.65 +lon_0=-85.5 +k=1.000034 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Jackson (m)
<7317> +proj=tmerc +lat_0=38.7 +lon_0=-85.95 +k=1.000022 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Jackson (ftUS)
<7318> +proj=tmerc +lat_0=38.7 +lon_0=-85.95 +k=1.000022 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Jasper-Porter (m)
<7319> +proj=tmerc +lat_0=40.7 +lon_0=-87.09999999999999 +k=1.000027 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Jasper-Porter (ftUS)
<7320> +proj=tmerc +lat_0=40.7 +lon_0=-87.09999999999999 +k=1.000027 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Jay (m)
<7321> +proj=tmerc +lat_0=40.3 +lon_0=-85 +k=1.000038 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Jay (ftUS)
<7322> +proj=tmerc +lat_0=40.3 +lon_0=-85 +k=1.000038 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Jefferson (m)
<7323> +proj=tmerc +lat_0=38.55 +lon_0=-85.34999999999999 +k=1.000028 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Jefferson (ftUS)
<7324> +proj=tmerc +lat_0=38.55 +lon_0=-85.34999999999999 +k=1.000028 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Jennings (m)
<7325> +proj=tmerc +lat_0=38.8 +lon_0=-85.8 +k=1.000025 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Jennings (ftUS)
<7326> +proj=tmerc +lat_0=38.8 +lon_0=-85.8 +k=1.000025 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Johnson-Marion (m)
<7327> +proj=tmerc +lat_0=39.3 +lon_0=-86.15000000000001 +k=1.000031 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Johnson-Marion (ftUS)
<7328> +proj=tmerc +lat_0=39.3 +lon_0=-86.15000000000001 +k=1.000031 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Knox (m)
<7329> +proj=tmerc +lat_0=38.4 +lon_0=-87.45 +k=1.000015 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Knox (ftUS)
<7330> +proj=tmerc +lat_0=38.4 +lon_0=-87.45 +k=1.000015 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS LaGrange-Noble (m)
<7331> +proj=tmerc +lat_0=41.25 +lon_0=-85.45 +k=1.000037 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS LaGrange-Noble (ftUS)
<7332> +proj=tmerc +lat_0=41.25 +lon_0=-85.45 +k=1.000037 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Lake-Newton (m)
<7333> +proj=tmerc +lat_0=40.7 +lon_0=-87.40000000000001 +k=1.000026 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Lake-Newton (ftUS)
<7334> +proj=tmerc +lat_0=40.7 +lon_0=-87.40000000000001 +k=1.000026 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS LaPorte-Pulaski-Starke (m)
<7335> +proj=tmerc +lat_0=40.9 +lon_0=-86.75 +k=1.000027 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS LaPorte-Pulaski-Starke (ftUS)
<7336> +proj=tmerc +lat_0=40.9 +lon_0=-86.75 +k=1.000027 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Monroe-Morgan (m)
<7337> +proj=tmerc +lat_0=38.95 +lon_0=-86.5 +k=1.000028 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Monroe-Morgan (ftUS)
<7338> +proj=tmerc +lat_0=38.95 +lon_0=-86.5 +k=1.000028 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Montgomery-Putnam (m)
<7339> +proj=tmerc +lat_0=39.45 +lon_0=-86.95 +k=1.000031 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Montgomery-Putnam (ftUS)
<7340> +proj=tmerc +lat_0=39.45 +lon_0=-86.95 +k=1.000031 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Owen (m)
<7341> +proj=tmerc +lat_0=39.15 +lon_0=-86.90000000000001 +k=1.000026 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Owen (ftUS)
<7342> +proj=tmerc +lat_0=39.15 +lon_0=-86.90000000000001 +k=1.000026 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Parke-Vermillion (m)
<7343> +proj=tmerc +lat_0=39.6 +lon_0=-87.34999999999999 +k=1.000022 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Parke-Vermillion (ftUS)
<7344> +proj=tmerc +lat_0=39.6 +lon_0=-87.34999999999999 +k=1.000022 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Perry (m)
<7345> +proj=tmerc +lat_0=37.8 +lon_0=-86.7 +k=1.00002 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Perry (ftUS)
<7346> +proj=tmerc +lat_0=37.8 +lon_0=-86.7 +k=1.00002 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Pike-Warrick (m)
<7347> +proj=tmerc +lat_0=37.85 +lon_0=-87.3 +k=1.000015 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Pike-Warrick (ftUS)
<7348> +proj=tmerc +lat_0=37.85 +lon_0=-87.3 +k=1.000015 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Posey (m)
<7349> +proj=tmerc +lat_0=37.75 +lon_0=-87.95 +k=1.000013 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Posey (ftUS)
<7350> +proj=tmerc +lat_0=37.75 +lon_0=-87.95 +k=1.000013 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Randolph-Wayne (m)
<7351> +proj=tmerc +lat_0=39.7 +lon_0=-85.05 +k=1.000044 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Randolph-Wayne (ftUS)
<7352> +proj=tmerc +lat_0=39.7 +lon_0=-85.05 +k=1.000044 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Ripley (m)
<7353> +proj=tmerc +lat_0=38.9 +lon_0=-85.3 +k=1.000038 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Ripley (ftUS)
<7354> +proj=tmerc +lat_0=38.9 +lon_0=-85.3 +k=1.000038 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Shelby (m)
<7355> +proj=tmerc +lat_0=39.3 +lon_0=-85.90000000000001 +k=1.00003 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Shelby (ftUS)
<7356> +proj=tmerc +lat_0=39.3 +lon_0=-85.90000000000001 +k=1.00003 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Spencer (m)
<7357> +proj=tmerc +lat_0=37.75 +lon_0=-87.05 +k=1.000014 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Spencer (ftUS)
<7358> +proj=tmerc +lat_0=37.75 +lon_0=-87.05 +k=1.000014 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Steuben (m)
<7359> +proj=tmerc +lat_0=41.5 +lon_0=-85 +k=1.000041 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Steuben (ftUS)
<7360> +proj=tmerc +lat_0=41.5 +lon_0=-85 +k=1.000041 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Sullivan (m)
<7361> +proj=tmerc +lat_0=38.9 +lon_0=-87.5 +k=1.000017 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Sullivan (ftUS)
<7362> +proj=tmerc +lat_0=38.9 +lon_0=-87.5 +k=1.000017 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Tippecanoe-White (m)
<7363> +proj=tmerc +lat_0=40.2 +lon_0=-86.90000000000001 +k=1.000026 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Tippecanoe-White (ftUS)
<7364> +proj=tmerc +lat_0=40.2 +lon_0=-86.90000000000001 +k=1.000026 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Vanderburgh (m)
<7365> +proj=tmerc +lat_0=37.8 +lon_0=-87.55 +k=1.000015 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Vanderburgh (ftUS)
<7366> +proj=tmerc +lat_0=37.8 +lon_0=-87.55 +k=1.000015 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Vigo (m)
<7367> +proj=tmerc +lat_0=39.25 +lon_0=-87.45 +k=1.00002 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Vigo (ftUS)
<7368> +proj=tmerc +lat_0=39.25 +lon_0=-87.45 +k=1.00002 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / InGCS Wells (m)
<7369> +proj=tmerc +lat_0=40.55 +lon_0=-85.25 +k=1.000034 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / InGCS Wells (ftUS)
<7370> +proj=tmerc +lat_0=40.55 +lon_0=-85.25 +k=1.000034 +x_0=240000 +y_0=36000 +ellps=GRS80 +units=us-ft +no_defs  <>
# ONGD14 / UTM zone 39N
<7374> +proj=utm +zone=39 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ONGD14 / UTM zone 40N
<7375> +proj=utm +zone=40 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ONGD14 / UTM zone 41N
<7376> +proj=utm +zone=41 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Adams and Juneau (m)
<7528> +proj=tmerc +lat_0=43.36666666666667 +lon_0=-90 +k=1.0000365285 +x_0=147218.6942 +y_0=0.0037 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Ashland (m)
<7529> +proj=tmerc +lat_0=45.70611111111111 +lon_0=-90.62222222222222 +k=1.0000495683 +x_0=172821.9461 +y_0=0.0017 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Barron (m)
<7530> +proj=tmerc +lat_0=45.13333333333333 +lon_0=-91.84999999999999 +k=1.0000486665 +x_0=93150 +y_0=0.0029 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Bayfield (m)
<7531> +proj=lcc +lat_1=46.66964837722222 +lat_0=46.66964837722222 +lon_0=-91.15277777777779 +k_0=1.0000331195 +x_0=228600.4575 +y_0=148551.4837 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Brown (m)
<7532> +proj=tmerc +lat_0=43 +lon_0=-88 +k=1.00002 +x_0=31600 +y_0=4600 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Buffalo (m)
<7533> +proj=tmerc +lat_0=43.48138888888889 +lon_0=-91.79722222222222 +k=1.0000382778 +x_0=175260.3502 +y_0=0.0048 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Burnett (m)
<7534> +proj=lcc +lat_1=45.89871486583333 +lat_0=45.89871486583333 +lon_0=-92.45777777777778 +k_0=1.0000383841 +x_0=64008.1276 +y_0=59445.9043 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Calumet, Fond du Lac, Outagamie and Winnebago (m)
<7535> +proj=tmerc +lat_0=42.71944444444445 +lon_0=-88.5 +k=1.0000286569 +x_0=244754.8893 +y_0=0.0049 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Chippewa (m)
<7536> +proj=lcc +lat_1=44.97785689861112 +lat_0=44.97785689861112 +lon_0=-91.29444444444444 +k_0=1.0000391127 +x_0=60045.72 +y_0=44091.4346 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Clark (m)
<7537> +proj=tmerc +lat_0=43.6 +lon_0=-90.70833333333334 +k=1.0000463003 +x_0=199949.1989 +y_0=0.0086 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Columbia (m)
<7538> +proj=lcc +lat_1=43.46254664583333 +lat_0=43.46254664583333 +lon_0=-89.39444444444445 +k_0=1.00003498 +x_0=169164.3381 +y_0=111569.6134 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Crawford (m)
<7539> +proj=lcc +lat_1=43.200055605 +lat_0=43.200055605 +lon_0=-90.9388888888889 +k_0=1.0000349151 +x_0=113690.6274 +y_0=53703.1201 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Dane (m)
<7540> +proj=lcc +lat_1=43.0695160375 +lat_0=43.0695160375 +lon_0=-89.42222222222223 +k_0=1.0000384786 +x_0=247193.2944 +y_0=146591.9896 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Dodge and Jefferson (m)
<7541> +proj=tmerc +lat_0=41.47222222222222 +lon_0=-88.77500000000001 +k=1.0000346418 +x_0=263347.7263 +y_0=0.0076 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Door (m)
<7542> +proj=tmerc +lat_0=44.4 +lon_0=-87.27222222222223 +k=1.0000187521 +x_0=158801.1176 +y_0=0.0023 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Douglas (m)
<7543> +proj=tmerc +lat_0=45.88333333333333 +lon_0=-91.91666666666667 +k=1.0000385418 +x_0=59131.3183 +y_0=0.0041 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Dunn (m)
<7544> +proj=tmerc +lat_0=44.40833333333333 +lon_0=-91.89444444444445 +k=1.0000410324 +x_0=51816.104 +y_0=0.003 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Eau Claire (m)
<7545> +proj=lcc +lat_1=44.87228112638889 +lat_0=44.87228112638889 +lon_0=-91.28888888888889 +k_0=1.000035079 +x_0=120091.4402 +y_0=91687.92389999999 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Florence (m)
<7546> +proj=tmerc +lat_0=45.43888888888888 +lon_0=-88.14166666666668 +k=1.0000552095 +x_0=133502.6683 +y_0=0.0063 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Forest (m)
<7547> +proj=tmerc +lat_0=44.00555555555555 +lon_0=-88.63333333333334 +k=1.0000673004 +x_0=275844.5533 +y_0=0.0157 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Grant (m)
<7548> +proj=tmerc +lat_0=41.41111111111111 +lon_0=-90.8 +k=1.0000349452 +x_0=242316.4841 +y_0=0.01 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Green and Lafayette (m)
<7549> +proj=lcc +lat_1=42.63756227694444 +lat_0=42.63756227694444 +lon_0=-89.83888888888889 +k_0=1.0000390487 +x_0=170078.7403 +y_0=45830.2947 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Green Lake and Marquette (m)
<7550> +proj=lcc +lat_1=43.80700011777778 +lat_0=43.80700011777778 +lon_0=-89.24166666666667 +k_0=1.0000344057 +x_0=150876.3018 +y_0=79170.7795 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Iowa (m)
<7551> +proj=tmerc +lat_0=42.53888888888888 +lon_0=-90.16111111111111 +k=1.0000394961 +x_0=113081.0261 +y_0=0.0045 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Iron (m)
<7552> +proj=tmerc +lat_0=45.43333333333333 +lon_0=-90.25555555555556 +k=1.0000677153 +x_0=220980.4419 +y_0=0.008500000000000001 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Jackson (m)
<7553> +proj=tmerc +lat_0=44.25333512777778 +lon_0=-90.84429651944444 +k=1.0000353 +x_0=27000 +y_0=25000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Kenosha, Milwaukee, Ozaukee and Racine (m)
<7554> +proj=tmerc +lat_0=42.21666666666667 +lon_0=-87.89444444444445 +k=1.0000260649 +x_0=185928.3728 +y_0=0.0009 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Kewaunee, Manitowoc and Sheboygan (m)
<7555> +proj=tmerc +lat_0=43.26666666666667 +lon_0=-87.55 +k=1.0000233704 +x_0=79857.7614 +y_0=0.0012 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS La Crosse (m)
<7556> +proj=tmerc +lat_0=43.45111111111111 +lon_0=-91.31666666666666 +k=1.0000319985 +x_0=130454.6598 +y_0=0.0033 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Langlade (m)
<7557> +proj=lcc +lat_1=45.15423710527778 +lat_0=45.15423710527778 +lon_0=-89.03333333333333 +k_0=1.0000627024 +x_0=198425.197 +y_0=105279.7829 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Lincoln (m)
<7558> +proj=tmerc +lat_0=44.84444444444445 +lon_0=-89.73333333333333 +k=1.0000599003 +x_0=116129.0323 +y_0=0.0058 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Marathon (m)
<7559> +proj=lcc +lat_1=44.90090442361111 +lat_0=44.90090442361111 +lon_0=-89.77 +k_0=1.000053289 +x_0=74676.1493 +y_0=55049.2669 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Marinette (m)
<7560> +proj=tmerc +lat_0=44.69166666666666 +lon_0=-87.71111111111111 +k=1.0000234982 +x_0=238658.8794 +y_0=0.0032 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Menominee (m)
<7561> +proj=tmerc +lat_0=44.71666666666667 +lon_0=-88.41666666666667 +k=1.0000362499 +x_0=105461.0121 +y_0=0.0029 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Monroe (m)
<7562> +proj=lcc +lat_1=44.00007392861111 +lat_0=44.00007392861111 +lon_0=-90.64166666666668 +k_0=1.0000434122 +x_0=204521.209 +y_0=121923.9861 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Oconto (m)
<7563> +proj=tmerc +lat_0=44.39722222222222 +lon_0=-87.90833333333335 +k=1.0000236869 +x_0=182880.3676 +y_0=0.0033 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Oneida (m)
<7564> +proj=lcc +lat_1=45.70422377027778 +lat_0=45.70422377027778 +lon_0=-89.54444444444444 +k_0=1.0000686968 +x_0=70104.1401 +y_0=57588.0346 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Pepin and Pierce (m)
<7565> +proj=lcc +lat_1=44.63614887194444 +lat_0=44.63614887194444 +lon_0=-92.22777777777777 +k_0=1.0000362977 +x_0=167640.3354 +y_0=86033.0876 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Polk (m)
<7566> +proj=tmerc +lat_0=44.66111111111111 +lon_0=-92.63333333333334 +k=1.0000433849 +x_0=141732.2823 +y_0=0.0059 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Portage (m)
<7567> +proj=lcc +lat_1=44.41682397527777 +lat_0=44.41682397527777 +lon_0=-89.5 +k_0=1.000039936 +x_0=56388.1128 +y_0=50022.1874 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Price (m)
<7568> +proj=tmerc +lat_0=44.55555555555555 +lon_0=-90.48888888888889 +k=1.0000649554 +x_0=227990.8546 +y_0=0.0109 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Richland (m)
<7569> +proj=lcc +lat_1=43.3223129275 +lat_0=43.3223129275 +lon_0=-90.43055555555556 +k_0=1.0000375653 +x_0=202387.6048 +y_0=134255.4253 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Rock (m)
<7570> +proj=tmerc +lat_0=41.94444444444444 +lon_0=-89.07222222222222 +k=1.0000337311 +x_0=146304.2926 +y_0=0.0068 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Rusk (m)
<7571> +proj=tmerc +lat_0=43.91944444444444 +lon_0=-91.06666666666666 +k=1.0000495976 +x_0=250546.1013 +y_0=0.0234 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Sauk (m)
<7572> +proj=tmerc +lat_0=42.81944444444445 +lon_0=-89.90000000000001 +k=1.0000373868 +x_0=185623.5716 +y_0=0.0051 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Sawyer (m)
<7573> +proj=lcc +lat_1=45.90009913138888 +lat_0=45.90009913138888 +lon_0=-91.11666666666666 +k_0=1.0000573461 +x_0=216713.2336 +y_0=120734.1631 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Shawano (m)
<7574> +proj=tmerc +lat_0=44.03611111111111 +lon_0=-88.60555555555555 +k=1.000032144 +x_0=262433.3253 +y_0=0.009599999999999999 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS St. Croix (m)
<7575> +proj=tmerc +lat_0=44.03611111111111 +lon_0=-92.63333333333334 +k=1.0000381803 +x_0=165506.7302 +y_0=0.0103 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Taylor (m)
<7576> +proj=lcc +lat_1=45.17782208583333 +lat_0=45.17782208583333 +lon_0=-90.48333333333333 +k_0=1.0000597566 +x_0=187147.5744 +y_0=107746.7522 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Trempealeau (m)
<7577> +proj=tmerc +lat_0=43.16111111111111 +lon_0=-91.36666666666666 +k=1.0000361538 +x_0=256946.9138 +y_0=0.0041 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Vernon (m)
<7578> +proj=lcc +lat_1=43.57503293972223 +lat_0=43.57503293972223 +lon_0=-90.78333333333333 +k_0=1.0000408158 +x_0=222504.4451 +y_0=47532.0602 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Vilas (m)
<7579> +proj=lcc +lat_1=46.07784409055556 +lat_0=46.07784409055556 +lon_0=-89.48888888888889 +k_0=1.0000730142 +x_0=134417.0689 +y_0=50337.1092 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Walworth (m)
<7580> +proj=lcc +lat_1=42.66946209694444 +lat_0=42.66946209694444 +lon_0=-88.54166666666667 +k_0=1.0000367192 +x_0=232562.8651 +y_0=111088.2224 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Washburn (m)
<7581> +proj=lcc +lat_1=45.96121983333334 +lat_0=45.96121983333334 +lon_0=-91.78333333333333 +k_0=1.0000475376 +x_0=234086.8682 +y_0=188358.6058 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Washington (m)
<7582> +proj=tmerc +lat_0=42.91805555555555 +lon_0=-88.06388888888888 +k=1.00003738 +x_0=120091.4415 +y_0=0.003 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Waukesha (m)
<7583> +proj=tmerc +lat_0=42.56944444444445 +lon_0=-88.22499999999999 +k=1.0000346179 +x_0=208788.418 +y_0=0.0034 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Waupaca (m)
<7584> +proj=tmerc +lat_0=43.42027777777778 +lon_0=-88.81666666666666 +k=1.0000333645 +x_0=185013.9709 +y_0=0.007 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Waushara (m)
<7585> +proj=lcc +lat_1=44.11394404583334 +lat_0=44.11394404583334 +lon_0=-89.24166666666667 +k_0=1.0000392096 +x_0=120091.4402 +y_0=45069.7587 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Wood (m)
<7586> +proj=lcc +lat_1=44.36259546944444 +lat_0=44.36259546944444 +lon_0=-90 +k_0=1.0000421209 +x_0=208483.6173 +y_0=134589.754 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / WISCRS Adams and Juneau (ftUS)
<7587> +proj=tmerc +lat_0=43.36666666666667 +lon_0=-90 +k=1.0000365285 +x_0=147218.6941325883 +y_0=0.00365760731521463 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Ashland (ftUS)
<7588> +proj=tmerc +lat_0=45.70611111111111 +lon_0=-90.62222222222222 +k=1.0000495683 +x_0=172821.945948692 +y_0=0.001828803657607315 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Barron (ftUS)
<7589> +proj=tmerc +lat_0=45.13333333333333 +lon_0=-91.84999999999999 +k=1.0000486665 +x_0=93150 +y_0=0.003048006096012192 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Bayfield (ftUS)
<7590> +proj=lcc +lat_1=46.66964837722222 +lat_0=46.66964837722222 +lon_0=-91.15277777777779 +k_0=1.0000331195 +x_0=228600.4575057151 +y_0=148551.4835661671 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Brown (ftUS)
<7591> +proj=tmerc +lat_0=43 +lon_0=-88 +k=1.00002 +x_0=31599.99989839979 +y_0=4599.999898399797 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Buffalo (ftUS)
<7592> +proj=tmerc +lat_0=43.48138888888889 +lon_0=-91.79722222222222 +k=1.0000382778 +x_0=175260.3502159004 +y_0=0.004876809753619507 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Burnett (ftUS)
<7593> +proj=lcc +lat_1=45.89871486583333 +lat_0=45.89871486583333 +lon_0=-92.45777777777778 +k_0=1.0000383841 +x_0=64008.12771145543 +y_0=59445.90419100838 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Calumet, Fond du Lac, Outagamie and Winnebago (ftUS)
<7594> +proj=tmerc +lat_0=42.71944444444445 +lon_0=-88.5 +k=1.0000286569 +x_0=244754.8892049784 +y_0=0.004876809753619507 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Chippewa (ftUS)
<7595> +proj=lcc +lat_1=44.97785689861112 +lat_0=44.97785689861112 +lon_0=-91.29444444444444 +k_0=1.0000391127 +x_0=60045.72009144018 +y_0=44091.43449326898 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Clark (ftUS)
<7596> +proj=tmerc +lat_0=43.6 +lon_0=-90.70833333333334 +k=1.0000463003 +x_0=199949.198983998 +y_0=0.008534417068834137 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Columbia (ftUS)
<7597> +proj=lcc +lat_1=43.46254664583333 +lat_0=43.46254664583333 +lon_0=-89.39444444444445 +k_0=1.00003498 +x_0=169164.338023876 +y_0=111569.613512827 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Crawford (ftUS)
<7598> +proj=lcc +lat_1=43.200055605 +lat_0=43.200055605 +lon_0=-90.9388888888889 +k_0=1.0000349151 +x_0=113690.6273812548 +y_0=53703.12024384048 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Dane (ftUS)
<7599> +proj=lcc +lat_1=43.0695160375 +lat_0=43.0695160375 +lon_0=-89.42222222222223 +k_0=1.0000384786 +x_0=247193.2943865888 +y_0=146591.9896367793 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Dodge and Jefferson (ftUS)
<7600> +proj=tmerc +lat_0=41.47222222222222 +lon_0=-88.77500000000001 +k=1.0000346418 +x_0=263347.7263906528 +y_0=0.00762001524003048 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Door (ftUS)
<7601> +proj=tmerc +lat_0=44.4 +lon_0=-87.27222222222223 +k=1.0000187521 +x_0=158801.1176022352 +y_0=0.002438404876809754 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Douglas (ftUS)
<7602> +proj=tmerc +lat_0=45.88333333333333 +lon_0=-91.91666666666667 +k=1.0000385418 +x_0=59131.31826263652 +y_0=0.003962407924815849 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Dunn (ftUS)
<7603> +proj=tmerc +lat_0=44.40833333333333 +lon_0=-91.89444444444445 +k=1.0000410324 +x_0=51816.10393700787 +y_0=0.003048006096012192 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Eau Claire (ftUS)
<7604> +proj=lcc +lat_1=44.87228112638889 +lat_0=44.87228112638889 +lon_0=-91.28888888888889 +k_0=1.000035079 +x_0=120091.4401828804 +y_0=91687.92390144781 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Florence (ftUS)
<7605> +proj=tmerc +lat_0=45.43888888888888 +lon_0=-88.14166666666668 +k=1.0000552095 +x_0=133502.6682245364 +y_0=0.006400812801625603 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Forest (ftUS)
<7606> +proj=tmerc +lat_0=44.00555555555555 +lon_0=-88.63333333333334 +k=1.0000673004 +x_0=275844.5532131065 +y_0=0.0158496316992634 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Grant (ftUS)
<7607> +proj=tmerc +lat_0=41.41111111111111 +lon_0=-90.8 +k=1.0000349452 +x_0=242316.484023368 +y_0=0.01005842011684023 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Green and Lafayette (ftUS)
<7608> +proj=lcc +lat_1=42.63756227694444 +lat_0=42.63756227694444 +lon_0=-89.83888888888889 +k_0=1.0000390487 +x_0=170078.7401574803 +y_0=45830.29484378968 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Green Lake and Marquette (ftUS)
<7609> +proj=lcc +lat_1=43.80700011777778 +lat_0=43.80700011777778 +lon_0=-89.24166666666667 +k_0=1.0000344057 +x_0=150876.3017526035 +y_0=79170.77937515875 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Iowa (ftUS)
<7610> +proj=tmerc +lat_0=42.53888888888888 +lon_0=-90.16111111111111 +k=1.0000394961 +x_0=113081.0261620523 +y_0=0.004572009144018288 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Iron (ftUS)
<7611> +proj=tmerc +lat_0=45.43333333333333 +lon_0=-90.25555555555556 +k=1.0000677153 +x_0=220980.4419608839 +y_0=0.008534417068834137 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Jackson (ftUS)
<7612> +proj=tmerc +lat_0=44.25333512777778 +lon_0=-90.84429651944444 +k=1.0000353 +x_0=27000 +y_0=24999.99989839979 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Kenosha, Milwaukee, Ozaukee and Racine (ftUS)
<7613> +proj=tmerc +lat_0=42.21666666666667 +lon_0=-87.89444444444445 +k=1.0000260649 +x_0=185928.3727711455 +y_0=0.0009144018288036576 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Kewaunee, Manitowoc and Sheboygan (ftUS)
<7614> +proj=tmerc +lat_0=43.26666666666667 +lon_0=-87.55 +k=1.0000233704 +x_0=79857.76154432308 +y_0=0.001219202438404877 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS La Crosse (ftUS)
<7615> +proj=tmerc +lat_0=43.45111111111111 +lon_0=-91.31666666666666 +k=1.0000319985 +x_0=130454.6596901194 +y_0=0.003352806705613411 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Langlade (ftUS)
<7616> +proj=lcc +lat_1=45.15423710527778 +lat_0=45.15423710527778 +lon_0=-89.03333333333333 +k_0=1.0000627024 +x_0=198425.1968503937 +y_0=105279.7828803657 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Lincoln (ftUS)
<7617> +proj=tmerc +lat_0=44.84444444444445 +lon_0=-89.73333333333333 +k=1.0000599003 +x_0=116129.0322580645 +y_0=0.005791211582423164 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Marathon (ftUS)
<7618> +proj=lcc +lat_1=44.90090442361111 +lat_0=44.90090442361111 +lon_0=-89.77 +k_0=1.000053289 +x_0=74676.1493522987 +y_0=55049.26695453391 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Marinette (ftUS)
<7619> +proj=tmerc +lat_0=44.69166666666666 +lon_0=-87.71111111111111 +k=1.0000234982 +x_0=238658.8794513589 +y_0=0.003048006096012192 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Menominee (ftUS)
<7620> +proj=tmerc +lat_0=44.71666666666667 +lon_0=-88.41666666666667 +k=1.0000362499 +x_0=105461.0121412243 +y_0=0.003048006096012192 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Monroe (ftUS)
<7621> +proj=lcc +lat_1=44.00007392861111 +lat_0=44.00007392861111 +lon_0=-90.64166666666668 +k_0=1.0000434122 +x_0=204521.2090424181 +y_0=121923.9861823724 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Oconto (ftUS)
<7622> +proj=tmerc +lat_0=44.39722222222222 +lon_0=-87.90833333333335 +k=1.0000236869 +x_0=182880.3675895352 +y_0=0.003352806705613411 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Oneida (ftUS)
<7623> +proj=lcc +lat_1=45.70422377027778 +lat_0=45.70422377027778 +lon_0=-89.54444444444444 +k_0=1.0000686968 +x_0=70104.14020828041 +y_0=57588.03474726949 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Pepin and Pierce (ftUS)
<7624> +proj=lcc +lat_1=44.63614887194444 +lat_0=44.63614887194444 +lon_0=-92.22777777777777 +k_0=1.0000362977 +x_0=167640.3352806706 +y_0=86033.08773177546 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Polk (ftUS)
<7625> +proj=tmerc +lat_0=44.66111111111111 +lon_0=-92.63333333333334 +k=1.0000433849 +x_0=141732.2822453645 +y_0=0.005791211582423164 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Portage (ftUS)
<7626> +proj=lcc +lat_1=44.41682397527777 +lat_0=44.41682397527777 +lon_0=-89.5 +k_0=1.000039936 +x_0=56388.11277622555 +y_0=50022.1874523749 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Price (ftUS)
<7627> +proj=tmerc +lat_0=44.55555555555555 +lon_0=-90.48888888888889 +k=1.0000649554 +x_0=227990.8544577089 +y_0=0.01097282194564389 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Richland (ftUS)
<7628> +proj=lcc +lat_1=43.3223129275 +lat_0=43.3223129275 +lon_0=-90.43055555555556 +k_0=1.0000375653 +x_0=202387.6047752095 +y_0=134255.4254508509 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Rock (ftUS)
<7629> +proj=tmerc +lat_0=41.94444444444444 +lon_0=-89.07222222222222 +k=1.0000337311 +x_0=146304.2926085852 +y_0=0.006705613411226822 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Rusk (ftUS)
<7630> +proj=tmerc +lat_0=43.91944444444444 +lon_0=-91.06666666666666 +k=1.0000495976 +x_0=250546.1013970028 +y_0=0.02346964693929388 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Sauk (ftUS)
<7631> +proj=tmerc +lat_0=42.81944444444445 +lon_0=-89.90000000000001 +k=1.0000373868 +x_0=185623.5715519431 +y_0=0.005181610363220727 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Sawyer (ftUS)
<7632> +proj=lcc +lat_1=45.90009913138888 +lat_0=45.90009913138888 +lon_0=-91.11666666666666 +k_0=1.0000573461 +x_0=216713.2337312675 +y_0=120734.1631699263 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Shawano (ftUS)
<7633> +proj=tmerc +lat_0=44.03611111111111 +lon_0=-88.60555555555555 +k=1.000032144 +x_0=262433.3251714504 +y_0=0.009448818897637795 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS St. Croix (ftUS)
<7634> +proj=tmerc +lat_0=44.03611111111111 +lon_0=-92.63333333333334 +k=1.0000381803 +x_0=165506.7300990602 +y_0=0.01036322072644145 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Taylor (ftUS)
<7635> +proj=lcc +lat_1=45.17782208583333 +lat_0=45.17782208583333 +lon_0=-90.48333333333333 +k_0=1.0000597566 +x_0=187147.5742951486 +y_0=107746.7521463043 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Trempealeau (ftUS)
<7636> +proj=tmerc +lat_0=43.16111111111111 +lon_0=-91.36666666666666 +k=1.0000361538 +x_0=256946.9138938278 +y_0=0.003962407924815849 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Vernon (ftUS)
<7637> +proj=lcc +lat_1=43.57503293972223 +lat_0=43.57503293972223 +lon_0=-90.78333333333333 +k_0=1.0000408158 +x_0=222504.44500889 +y_0=47532.0603505207 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Vilas (ftUS)
<7638> +proj=lcc +lat_1=46.07784409055556 +lat_0=46.07784409055556 +lon_0=-89.48888888888889 +k_0=1.0000730142 +x_0=134417.0688341377 +y_0=50337.10927101854 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Walworth (ftUS)
<7639> +proj=lcc +lat_1=42.66946209694444 +lat_0=42.66946209694444 +lon_0=-88.54166666666667 +k_0=1.0000367192 +x_0=232562.8651257302 +y_0=111088.2224028448 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Washburn (ftUS)
<7640> +proj=lcc +lat_1=45.96121983333334 +lat_0=45.96121983333334 +lon_0=-91.78333333333333 +k_0=1.0000475376 +x_0=234086.8681737363 +y_0=188358.6059436119 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Washington (ftUS)
<7641> +proj=tmerc +lat_0=42.91805555555555 +lon_0=-88.06388888888888 +k=1.00003738 +x_0=120091.4414020828 +y_0=0.003048006096012192 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Waukesha (ftUS)
<7642> +proj=tmerc +lat_0=42.56944444444445 +lon_0=-88.22499999999999 +k=1.0000346179 +x_0=208788.4178816358 +y_0=0.003352806705613411 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Waupaca (ftUS)
<7643> +proj=tmerc +lat_0=43.42027777777778 +lon_0=-88.81666666666666 +k=1.0000333645 +x_0=185013.9709423419 +y_0=0.007010414020828041 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Waushara (ftUS)
<7644> +proj=lcc +lat_1=44.11394404583334 +lat_0=44.11394404583334 +lon_0=-89.24166666666667 +k_0=1.0000392096 +x_0=120091.4401828804 +y_0=45069.7588011176 +ellps=GRS80 +units=us-ft +no_defs  <>
# NAD83(2011) / WISCRS Wood (ftUS)
<7645> +proj=lcc +lat_1=44.36259546944444 +lat_0=44.36259546944444 +lon_0=-90 +k_0=1.0000421209 +x_0=208483.6172720346 +y_0=134589.7539243078 +ellps=GRS80 +units=us-ft +no_defs  <>
# Kyrg-06 / zone 1
<7692> +proj=tmerc +lat_0=0 +lon_0=68.51666666666667 +k=1 +x_0=1300000 +y_0=14743.5 +ellps=GRS80 +units=m +no_defs  <>
# Kyrg-06 / zone 2
<7693> +proj=tmerc +lat_0=0 +lon_0=71.51666666666667 +k=1 +x_0=2300000 +y_0=14743.5 +ellps=GRS80 +units=m +no_defs  <>
# Kyrg-06 / zone 3
<7694> +proj=tmerc +lat_0=0 +lon_0=74.51666666666667 +k=1 +x_0=3300000 +y_0=14743.5 +ellps=GRS80 +units=m +no_defs  <>
# Kyrg-06 / zone 4
<7695> +proj=tmerc +lat_0=0 +lon_0=77.51666666666667 +k=1 +x_0=4300000 +y_0=14743.5 +ellps=GRS80 +units=m +no_defs  <>
# Kyrg-06 / zone 5
<7696> +proj=tmerc +lat_0=0 +lon_0=80.51666666666667 +k=1 +x_0=5300000 +y_0=14743.5 +ellps=GRS80 +units=m +no_defs  <>
# WGS 84 / India NSF LCC
<7755> +proj=lcc +lat_1=12.472955 +lat_2=35.17280444444444 +lat_0=24 +lon_0=80 +x_0=4000000 +y_0=4000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Andhra Pradesh
<7756> +proj=lcc +lat_1=13.75 +lat_2=18.75 +lat_0=16.25543298 +lon_0=80.875 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Arunachal Pradesh
<7757> +proj=lcc +lat_1=27 +lat_2=29 +lat_0=28.00157897 +lon_0=94.5 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Assam
<7758> +proj=lcc +lat_1=24.66666666666667 +lat_2=27.33333333333333 +lat_0=26.00257703 +lon_0=92.75 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Bihar
<7759> +proj=lcc +lat_1=24.625 +lat_2=27.125 +lat_0=25.87725247 +lon_0=85.875 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Delhi
<7760> +proj=lcc +lat_1=28.375 +lat_2=28.875 +lat_0=28.62510126 +lon_0=77 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Gujarat
<7761> +proj=lcc +lat_1=20.79166666666667 +lat_2=23.95833333333333 +lat_0=22.37807121 +lon_0=71.375 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Haryana
<7762> +proj=lcc +lat_1=28.08333333333333 +lat_2=30.41666666666667 +lat_0=29.25226266 +lon_0=76 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Himachal Pradesh
<7763> +proj=lcc +lat_1=30.75 +lat_2=32.75 +lat_0=31.75183497 +lon_0=77.375 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Jammu and Kashmir
<7764> +proj=lcc +lat_1=33.08333333333334 +lat_2=36.41666666666666 +lat_0=34.75570874 +lon_0=76.5 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Jharkhand
<7765> +proj=lcc +lat_1=22.54166666666667 +lat_2=24.70833333333333 +lat_0=23.62652682 +lon_0=85.625 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Madhya Pradesh
<7766> +proj=lcc +lat_1=22 +lat_2=26 +lat_0=24.00529821 +lon_0=78.375 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Maharashtra
<7767> +proj=lcc +lat_1=16.625 +lat_2=21.125 +lat_0=18.88015774 +lon_0=76.75 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Manipur
<7768> +proj=lcc +lat_1=24.08333333333333 +lat_2=25.41666666666667 +lat_0=24.75060911 +lon_0=94 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Meghalaya
<7769> +proj=lcc +lat_1=25.20833333333333 +lat_2=26.04166666666667 +lat_0=25.62524747 +lon_0=91.375 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Nagaland
<7770> +proj=lcc +lat_1=25.375 +lat_2=26.875 +lat_0=26.12581974 +lon_0=94.375 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / India Northeast
<7771> +proj=lcc +lat_1=23.04166666666667 +lat_2=28.20833333333333 +lat_0=25.63452135 +lon_0=93.5 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Orissa
<7772> +proj=lcc +lat_1=18.58333333333333 +lat_2=21.91666666666667 +lat_0=20.25305174 +lon_0=84.375 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Punjab
<7773> +proj=lcc +lat_1=30 +lat_2=32 +lat_0=31.00178226 +lon_0=75.375 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Rajasthan
<7774> +proj=lcc +lat_1=24.29166666666667 +lat_2=29.45833333333333 +lat_0=26.88505546 +lon_0=73.875 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Uttar Pradesh
<7775> +proj=lcc +lat_1=24.875 +lat_2=29.375 +lat_0=27.13270823 +lon_0=80.875 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Uttaranchal
<7776> +proj=lcc +lat_1=29 +lat_2=31 +lat_0=30.0017132 +lon_0=79.375 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Andaman and Nicobar
<7777> +proj=tmerc +lat_0=10.25 +lon_0=93.25 +k=0.9999428 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Chhattisgarh
<7778> +proj=tmerc +lat_0=21 +lon_0=82.25 +k=0.9998332 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Goa
<7779> +proj=tmerc +lat_0=15.375 +lon_0=74 +k=0.9999913 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Karnataka
<7780> +proj=tmerc +lat_0=15.125 +lon_0=76.375 +k=0.9998011999999999 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Kerala
<7781> +proj=tmerc +lat_0=10.5 +lon_0=76 +k=0.9999177 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Lakshadweep
<7782> +proj=tmerc +lat_0=10 +lon_0=73.125 +k=0.9999536 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Mizoram
<7783> +proj=tmerc +lat_0=23.125 +lon_0=92.75 +k=0.9999821 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Sikkim
<7784> +proj=tmerc +lat_0=27.625 +lon_0=88.5 +k=0.9999926 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Tamil Nadu
<7785> +proj=tmerc +lat_0=10.875 +lon_0=78.375 +k=0.9997942 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Tripura
<7786> +proj=tmerc +lat_0=23.75 +lon_0=91.75 +k=0.9999822 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / West Bengal
<7787> +proj=tmerc +lat_0=24.375 +lon_0=87.875 +k=0.9998584 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs  <>
# RDN2008 / UTM zone 32N
<7791> +proj=utm +zone=32 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RDN2008 / UTM zone 33N
<7792> +proj=utm +zone=33 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RDN2008 / UTM zone 34N
<7793> +proj=utm +zone=34 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RDN2008 / Italy zone (E-N)
<7794> +proj=tmerc +lat_0=0 +lon_0=12 +k=0.9985000000000001 +x_0=7000000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# RDN2008 / Zone 12 (E-N)
<7795> +proj=tmerc +lat_0=0 +lon_0=12 +k=1 +x_0=3000000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# BGS2005 / UTM zone 34N (N-E)
<7799> +proj=utm +zone=34 +ellps=GRS80 +units=m +no_defs  <>
# BGS2005 / UTM zone 35N (N-E)
<7800> +proj=utm +zone=35 +ellps=GRS80 +units=m +no_defs  <>
# BGS2005 / CCS2005
<7801> +proj=lcc +lat_1=42 +lat_2=43.33333333333334 +lat_0=42.66787568333333 +lon_0=25.5 +x_0=500000 +y_0=4725824.3591 +ellps=GRS80 +units=m +no_defs  <>
# BGS2005 / UTM zone 34N
<7803> +proj=utm +zone=34 +ellps=GRS80 +units=m +no_defs  <>
# BGS2005 / UTM zone 35N
<7804> +proj=utm +zone=34 +ellps=GRS80 +units=m +no_defs  <>
# BGS2005 / UTM zone 36N
<7805> +proj=utm +zone=36 +ellps=GRS80 +units=m +no_defs  <>
# Pulkovo 1942 / CS63 zone X1
<7825> +proj=tmerc +lat_0=0.08333333333333333 +lon_0=23.5 +k=1 +x_0=1300000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / CS63 zone X2
<7826> +proj=tmerc +lat_0=0.08333333333333333 +lon_0=26.5 +k=1 +x_0=2300000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / CS63 zone X3
<7827> +proj=tmerc +lat_0=0.08333333333333333 +lon_0=29.5 +k=1 +x_0=3300000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / CS63 zone X4
<7828> +proj=tmerc +lat_0=0.08333333333333333 +lon_0=32.5 +k=1 +x_0=4300000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / CS63 zone X5
<7829> +proj=tmerc +lat_0=0.08333333333333333 +lon_0=35.5 +k=1 +x_0=5300000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / CS63 zone X6
<7830> +proj=tmerc +lat_0=0.08333333333333333 +lon_0=38.5 +k=1 +x_0=6300000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / CS63 zone X7
<7831> +proj=tmerc +lat_0=0.08333333333333333 +lon_0=41.5 +k=1 +x_0=7300000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# GDA2020 / GA LCC
<7845> +proj=lcc +lat_1=-18 +lat_2=-36 +lat_0=0 +lon_0=134 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / MGA zone 46
<7846> +proj=utm +zone=46 +south +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / MGA zone 47
<7847> +proj=utm +zone=47 +south +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / MGA zone 48
<7848> +proj=utm +zone=48 +south +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / MGA zone 49
<7849> +proj=utm +zone=49 +south +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / MGA zone 50
<7850> +proj=utm +zone=50 +south +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / MGA zone 51
<7851> +proj=utm +zone=51 +south +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / MGA zone 52
<7852> +proj=utm +zone=52 +south +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / MGA zone 53
<7853> +proj=utm +zone=53 +south +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / MGA zone 54
<7854> +proj=utm +zone=54 +south +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / MGA zone 55
<7855> +proj=utm +zone=55 +south +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / MGA zone 56
<7856> +proj=utm +zone=56 +south +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / MGA zone 57
<7857> +proj=utm +zone=57 +south +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / MGA zone 58
<7858> +proj=utm +zone=58 +south +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / MGA zone 59
<7859> +proj=utm +zone=59 +south +ellps=GRS80 +units=m +no_defs  <>
# Astro DOS 71 / SHLG71
<7877> +proj=tmerc +lat_0=-15.96666666666667 +lon_0=-5.716666666666667 +k=1 +x_0=300000 +y_0=2000000 +ellps=intl +towgs84=-320,550,-494,0,0,0,0 +units=m +no_defs  <>
# Astro DOS 71 / UTM zone 30S
<7878> +proj=utm +zone=30 +south +ellps=intl +towgs84=-320,550,-494,0,0,0,0 +units=m +no_defs  <>
# St. Helena Tritan / SHLG(Tritan)
<7882> +proj=tmerc +lat_0=-15.96666666666667 +lon_0=-5.716666666666667 +k=1 +x_0=299483.737 +y_0=2000527.879 +ellps=WGS84 +towgs84=-0.077,0.079,0.086,0,0,0,0 +units=m +no_defs  <>
# St. Helena Tritan / UTM zone 30S
<7883> +proj=utm +zone=30 +south +ellps=WGS84 +towgs84=-0.077,0.079,0.086,0,0,0,0 +units=m +no_defs  <>
# SHMG2015
<7887> +proj=utm +zone=30 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GDA2020 / Vicgrid
<7899> +proj=lcc +lat_1=-36 +lat_2=-38 +lat_0=-37 +lon_0=145 +x_0=2500000 +y_0=2500000 +ellps=GRS80 +units=m +no_defs  <>
# NAD27 / MTM zone 10
<7991> +proj=tmerc +lat_0=0 +lon_0=-79.5 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD27 +units=m +no_defs  <>
# Malongo 1987 / UTM zone 33S
<7992> +proj=utm +zone=33 +south +ellps=intl +towgs84=-254.1,-5.36,-100.29,0,0,0,0 +units=m +no_defs  <>
# GDA2020 / ALB2020
<8013> +proj=tmerc +lat_0=0 +lon_0=117.8833333333333 +k=1.0000044 +x_0=50000 +y_0=4100000 +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / BIO2020
<8014> +proj=tmerc +lat_0=0 +lon_0=115.25 +k=1.0000022 +x_0=60000 +y_0=2700000 +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / BRO2020
<8015> +proj=tmerc +lat_0=0 +lon_0=122.3333333333333 +k=1.00000298 +x_0=50000 +y_0=2300000 +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / BCG2020
<8016> +proj=tmerc +lat_0=0 +lon_0=115.4333333333333 +k=0.99999592 +x_0=50000 +y_0=4000000 +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / CARN2020
<8017> +proj=tmerc +lat_0=0 +lon_0=113.6666666666667 +k=0.99999796 +x_0=50000 +y_0=3050000 +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / CIG2020
<8018> +proj=tmerc +lat_0=0 +lon_0=105.625 +k=1.00002514 +x_0=50000 +y_0=1400000 +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / CKIG2020
<8019> +proj=tmerc +lat_0=0 +lon_0=96.875 +k=0.99999387 +x_0=50000 +y_0=1600000 +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / COL2020
<8020> +proj=tmerc +lat_0=0 +lon_0=115.9333333333333 +k=1.000019 +x_0=40000 +y_0=4100000 +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / ESP2020
<8021> +proj=tmerc +lat_0=0 +lon_0=121.8833333333333 +k=1.0000055 +x_0=50000 +y_0=4050000 +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / EXM2020
<8022> +proj=tmerc +lat_0=0 +lon_0=114.0666666666667 +k=1.00000236 +x_0=50000 +y_0=2750000 +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / GCG2020
<8023> +proj=tmerc +lat_0=0 +lon_0=114.5833333333333 +k=1.00000628 +x_0=50000 +y_0=3450000 +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / GOLD2020
<8024> +proj=tmerc +lat_0=0 +lon_0=121.5 +k=1.00004949 +x_0=60000 +y_0=3800000 +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / JCG2020
<8025> +proj=tmerc +lat_0=0 +lon_0=114.9833333333333 +k=1.00000314 +x_0=50000 +y_0=3650000 +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / KALB2020
<8026> +proj=tmerc +lat_0=0 +lon_0=114.3152777777778 +k=1.000014 +x_0=55000 +y_0=3700000 +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / KAR2020
<8027> +proj=tmerc +lat_0=0 +lon_0=116.9333333333333 +k=0.9999989 +x_0=50000 +y_0=2550000 +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / KUN2020
<8028> +proj=tmerc +lat_0=0 +lon_0=128.75 +k=1.0000165 +x_0=50000 +y_0=2100000 +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / LCG2020
<8029> +proj=tmerc +lat_0=0 +lon_0=115.3666666666667 +k=1.00000157 +x_0=50000 +y_0=3750000 +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / MRCG2020
<8030> +proj=tmerc +lat_0=0 +lon_0=115.1666666666667 +k=1.0000055 +x_0=50000 +y_0=4050000 +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / PCG2020
<8031> +proj=tmerc +lat_0=0 +lon_0=115.8166666666667 +k=0.9999990600000001 +x_0=50000 +y_0=3900000 +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / PHG2020
<8032> +proj=tmerc +lat_0=0 +lon_0=118.6 +k=1.00000135 +x_0=50000 +y_0=2500000 +ellps=GRS80 +units=m +no_defs  <>
# WGS 84 / TM Zone 20N (ftUS)
<8035> +proj=utm +zone=20 +datum=WGS84 +units=us-ft +no_defs  <>
# WGS 84 / TM Zone 21N (ftUS)
<8036> +proj=utm +zone=21 +datum=WGS84 +units=us-ft +no_defs  <>
# Gusterberg Grid (Ferro)
<8044> +proj=cass +lat_0=48.03846388888888 +lon_0=31.80418055555556 +x_0=0 +y_0=0 +a=6376045 +b=6355477.112903226 +pm=ferro +units=m +no_defs  <>
# St. Stephen Grid (Ferro)
<8045> +proj=cass +lat_0=48.20876111111112 +lon_0=34.04092222222222 +x_0=0 +y_0=0 +a=6376045 +b=6355477.112903226 +pm=ferro +units=m +no_defs  <>
# GDA2020 / NSW Lambert
<8058> +proj=lcc +lat_1=-30.75 +lat_2=-35.75 +lat_0=-33.25 +lon_0=147 +x_0=9300000 +y_0=4500000 +ellps=GRS80 +units=m +no_defs  <>
# GDA2020 / SA Lambert
<8059> +proj=lcc +lat_1=-28 +lat_2=-36 +lat_0=-32 +lon_0=135 +x_0=1000000 +y_0=2000000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / PCCS zone 1 (ft)
<8065> +proj=omerc +lat_0=32.25 +lonc=-111.4 +alpha=45 +k=1.00011 +x_0=48768 +y_0=243840 +gamma=45 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / PCCS zone 2 (ft)
<8066> +proj=tmerc +lat_0=31.25 +lon_0=-112.1666666666667 +k=1.00009 +x_0=548640 +y_0=304800 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / PCCS zone 3 (ft)
<8067> +proj=tmerc +lat_0=31.5 +lon_0=-113.1666666666667 +k=1.000055 +x_0=182880 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / PCCS zone 4 (ft)
<8068> +proj=lcc +lat_1=30.5 +lat_0=30.5 +lon_0=-110.75 +k_0=0.9998 +x_0=9144 +y_0=-188976 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(CSRS)v6 / MTM Nova Scotia zone 4
<8082> +proj=tmerc +lat_0=0 +lon_0=-61.5 +k=0.9999 +x_0=24500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CSRS)v6 / MTM Nova Scotia zone 5
<8083> +proj=tmerc +lat_0=0 +lon_0=-64.5 +k=0.9999 +x_0=25500000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# ISN2016 / Lambert 2016
<8088> +proj=lcc +lat_1=64.25 +lat_2=65.75 +lat_0=65 +lon_0=-19 +x_0=2700000 +y_0=300000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Florence (m)
<8090> +proj=tmerc +lat_0=45.43888888888888 +lon_0=-88.14166666666668 +k=1.0000552095 +x_0=133502.6683 +y_0=0.0063 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Florence (ftUS)
<8091> +proj=tmerc +lat_0=45.43888888888888 +lon_0=-88.14166666666668 +k=1.0000552095 +x_0=133502.6682245364 +y_0=0.006400812801625603 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Eau Claire (m)
<8092> +proj=lcc +lat_1=44.87228112638889 +lat_0=44.87228112638889 +lon_0=-91.28888888888889 +k_0=1.000035079 +x_0=120091.4402 +y_0=91687.92389999999 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Eau Claire (ftUS)
<8093> +proj=lcc +lat_1=44.87228112638889 +lat_0=44.87228112638889 +lon_0=-91.28888888888889 +k_0=1.000035079 +x_0=120091.4401828804 +y_0=91687.92390144781 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Wood (m)
<8095> +proj=lcc +lat_1=44.36259546944444 +lat_0=44.36259546944444 +lon_0=-90 +k_0=1.0000421209 +x_0=208483.6173 +y_0=134589.754 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Wood (ftUS)
<8096> +proj=lcc +lat_1=44.36259546944444 +lat_0=44.36259546944444 +lon_0=-90 +k_0=1.0000421209 +x_0=208483.6172720346 +y_0=134589.7539243078 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Waushara (m)
<8097> +proj=lcc +lat_1=44.11394404583334 +lat_0=44.11394404583334 +lon_0=-89.24166666666667 +k_0=1.0000392096 +x_0=120091.4402 +y_0=45069.7587 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Waushara (ftUS)
<8098> +proj=lcc +lat_1=44.11394404583334 +lat_0=44.11394404583334 +lon_0=-89.24166666666667 +k_0=1.0000392096 +x_0=120091.4401828804 +y_0=45069.7588011176 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Waupaca (m)
<8099> +proj=tmerc +lat_0=43.42027777777778 +lon_0=-88.81666666666666 +k=1.0000333645 +x_0=185013.9709 +y_0=0.007 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Waupaca (ftUS)
<8100> +proj=tmerc +lat_0=43.42027777777778 +lon_0=-88.81666666666666 +k=1.0000333645 +x_0=185013.9709423419 +y_0=0.007010414020828041 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Waukesha (m)
<8101> +proj=tmerc +lat_0=42.56944444444445 +lon_0=-88.22499999999999 +k=1.0000346179 +x_0=208788.418 +y_0=0.0034 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Waukesha (ftUS)
<8102> +proj=tmerc +lat_0=42.56944444444445 +lon_0=-88.22499999999999 +k=1.0000346179 +x_0=208788.4178816358 +y_0=0.003352806705613411 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Washington (m)
<8103> +proj=tmerc +lat_0=42.91805555555555 +lon_0=-88.06388888888888 +k=1.00003738 +x_0=120091.4415 +y_0=0.003 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Washington (ftUS)
<8104> +proj=tmerc +lat_0=42.91805555555555 +lon_0=-88.06388888888888 +k=1.00003738 +x_0=120091.4414020828 +y_0=0.003048006096012192 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Washburn (m)
<8105> +proj=lcc +lat_1=45.96121983333334 +lat_0=45.96121983333334 +lon_0=-91.78333333333333 +k_0=1.0000475376 +x_0=234086.8682 +y_0=188358.6058 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Washburn (ftUS)
<8106> +proj=lcc +lat_1=45.96121983333334 +lat_0=45.96121983333334 +lon_0=-91.78333333333333 +k_0=1.0000475376 +x_0=234086.8681737363 +y_0=188358.6059436119 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Walworth (m)
<8107> +proj=lcc +lat_1=42.66946209694444 +lat_0=42.66946209694444 +lon_0=-88.54166666666667 +k_0=1.0000367192 +x_0=232562.8651 +y_0=111088.2224 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Walworth (ftUS)
<8108> +proj=lcc +lat_1=42.66946209694444 +lat_0=42.66946209694444 +lon_0=-88.54166666666667 +k_0=1.0000367192 +x_0=232562.8651257302 +y_0=111088.2224028448 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Vilas (m)
<8109> +proj=lcc +lat_1=46.07784409055556 +lat_0=46.07784409055556 +lon_0=-89.48888888888889 +k_0=1.0000730142 +x_0=134417.0689 +y_0=50337.1092 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Vilas (ftUS)
<8110> +proj=lcc +lat_1=46.07784409055556 +lat_0=46.07784409055556 +lon_0=-89.48888888888889 +k_0=1.0000730142 +x_0=134417.0688341377 +y_0=50337.10927101854 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Vernon (m)
<8111> +proj=lcc +lat_1=43.57503293972223 +lat_0=43.57503293972223 +lon_0=-90.78333333333333 +k_0=1.0000408158 +x_0=222504.4451 +y_0=47532.0602 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Vernon (ftUS)
<8112> +proj=lcc +lat_1=43.57503293972223 +lat_0=43.57503293972223 +lon_0=-90.78333333333333 +k_0=1.0000408158 +x_0=222504.44500889 +y_0=47532.0603505207 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Trempealeau (m)
<8113> +proj=tmerc +lat_0=43.16111111111111 +lon_0=-91.36666666666666 +k=1.0000361538 +x_0=256946.9138 +y_0=0.0041 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Trempealeau (ftUS)
<8114> +proj=tmerc +lat_0=43.16111111111111 +lon_0=-91.36666666666666 +k=1.0000361538 +x_0=256946.9138938278 +y_0=0.003962407924815849 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Taylor (m)
<8115> +proj=lcc +lat_1=45.17782208583333 +lat_0=45.17782208583333 +lon_0=-90.48333333333333 +k_0=1.0000597566 +x_0=187147.5744 +y_0=107746.7522 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Taylor (ftUS)
<8116> +proj=lcc +lat_1=45.17782208583333 +lat_0=45.17782208583333 +lon_0=-90.48333333333333 +k_0=1.0000597566 +x_0=187147.5742951486 +y_0=107746.7521463043 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS St. Croix (m)
<8117> +proj=tmerc +lat_0=44.03611111111111 +lon_0=-92.63333333333334 +k=1.0000381803 +x_0=165506.7302 +y_0=0.0103 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS St. Croix (ftUS)
<8118> +proj=tmerc +lat_0=44.03611111111111 +lon_0=-92.63333333333334 +k=1.0000381803 +x_0=165506.7300990602 +y_0=0.01036322072644145 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Shawano (m)
<8119> +proj=tmerc +lat_0=44.03611111111111 +lon_0=-88.60555555555555 +k=1.000032144 +x_0=262433.3253 +y_0=0.009599999999999999 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Shawano (ftUS)
<8120> +proj=tmerc +lat_0=44.03611111111111 +lon_0=-88.60555555555555 +k=1.000032144 +x_0=262433.3251714504 +y_0=0.009448818897637795 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Sawyer (m)
<8121> +proj=lcc +lat_1=45.90009913138888 +lat_0=45.90009913138888 +lon_0=-91.11666666666666 +k_0=1.0000573461 +x_0=216713.2336 +y_0=120734.1631 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Sawyer (ftUS)
<8122> +proj=lcc +lat_1=45.90009913138888 +lat_0=45.90009913138888 +lon_0=-91.11666666666666 +k_0=1.0000573461 +x_0=216713.2337312675 +y_0=120734.1631699263 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Sauk (m)
<8123> +proj=tmerc +lat_0=42.81944444444445 +lon_0=-89.90000000000001 +k=1.0000373868 +x_0=185623.5716 +y_0=0.0051 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Sauk (ftUS)
<8124> +proj=tmerc +lat_0=42.81944444444445 +lon_0=-89.90000000000001 +k=1.0000373868 +x_0=185623.5715519431 +y_0=0.005181610363220727 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Rusk (m)
<8125> +proj=tmerc +lat_0=43.91944444444444 +lon_0=-91.06666666666666 +k=1.0000495976 +x_0=250546.1013 +y_0=0.0234 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Rusk (ftUS)
<8126> +proj=tmerc +lat_0=43.91944444444444 +lon_0=-91.06666666666666 +k=1.0000495976 +x_0=250546.1013970028 +y_0=0.02346964693929388 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Rock (m)
<8127> +proj=tmerc +lat_0=41.94444444444444 +lon_0=-89.07222222222222 +k=1.0000337311 +x_0=146304.2926 +y_0=0.0068 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Rock (ftUS)
<8128> +proj=tmerc +lat_0=41.94444444444444 +lon_0=-89.07222222222222 +k=1.0000337311 +x_0=146304.2926085852 +y_0=0.006705613411226822 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Richland (m)
<8129> +proj=lcc +lat_1=43.3223129275 +lat_0=43.3223129275 +lon_0=-90.43055555555556 +k_0=1.0000375653 +x_0=202387.6048 +y_0=134255.4253 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Richland (ftUS)
<8130> +proj=lcc +lat_1=43.3223129275 +lat_0=43.3223129275 +lon_0=-90.43055555555556 +k_0=1.0000375653 +x_0=202387.6047752095 +y_0=134255.4254508509 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Price (m)
<8131> +proj=tmerc +lat_0=44.55555555555555 +lon_0=-90.48888888888889 +k=1.0000649554 +x_0=227990.8546 +y_0=0.0109 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Price (ftUS)
<8132> +proj=tmerc +lat_0=44.55555555555555 +lon_0=-90.48888888888889 +k=1.0000649554 +x_0=227990.8544577089 +y_0=0.01097282194564389 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Portage (m)
<8133> +proj=lcc +lat_1=44.41682397527777 +lat_0=44.41682397527777 +lon_0=-89.5 +k_0=1.000039936 +x_0=56388.1128 +y_0=50022.1874 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Portage (ftUS)
<8134> +proj=lcc +lat_1=44.41682397527777 +lat_0=44.41682397527777 +lon_0=-89.5 +k_0=1.000039936 +x_0=56388.11277622555 +y_0=50022.1874523749 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Polk (m)
<8135> +proj=tmerc +lat_0=44.66111111111111 +lon_0=-92.63333333333334 +k=1.0000433849 +x_0=141732.2823 +y_0=0.0059 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Polk (ftUS)
<8136> +proj=tmerc +lat_0=44.66111111111111 +lon_0=-92.63333333333334 +k=1.0000433849 +x_0=141732.2822453645 +y_0=0.005791211582423164 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Pepin and Pierce (m)
<8137> +proj=lcc +lat_1=44.63614887194444 +lat_0=44.63614887194444 +lon_0=-92.22777777777777 +k_0=1.0000362977 +x_0=167640.3354 +y_0=86033.0876 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Pepin and Pierce (ftUS)
<8138> +proj=lcc +lat_1=44.63614887194444 +lat_0=44.63614887194444 +lon_0=-92.22777777777777 +k_0=1.0000362977 +x_0=167640.3352806706 +y_0=86033.08773177546 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Oneida (m)
<8139> +proj=lcc +lat_1=45.70422377027778 +lat_0=45.70422377027778 +lon_0=-89.54444444444444 +k_0=1.0000686968 +x_0=70104.1401 +y_0=57588.0346 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Oneida (ftUS)
<8140> +proj=lcc +lat_1=45.70422377027778 +lat_0=45.70422377027778 +lon_0=-89.54444444444444 +k_0=1.0000686968 +x_0=70104.14020828041 +y_0=57588.03474726949 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Oconto (m)
<8141> +proj=tmerc +lat_0=44.39722222222222 +lon_0=-87.90833333333335 +k=1.0000236869 +x_0=182880.3676 +y_0=0.0033 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Oconto (ftUS)
<8142> +proj=tmerc +lat_0=44.39722222222222 +lon_0=-87.90833333333335 +k=1.0000236869 +x_0=182880.3675895352 +y_0=0.003352806705613411 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Monroe (m)
<8143> +proj=lcc +lat_1=44.00007392861111 +lat_0=44.00007392861111 +lon_0=-90.64166666666668 +k_0=1.0000434122 +x_0=204521.209 +y_0=121923.9861 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Monroe (ftUS)
<8144> +proj=lcc +lat_1=44.00007392861111 +lat_0=44.00007392861111 +lon_0=-90.64166666666668 +k_0=1.0000434122 +x_0=204521.2090424181 +y_0=121923.9861823724 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Menominee (m)
<8145> +proj=tmerc +lat_0=44.71666666666667 +lon_0=-88.41666666666667 +k=1.0000362499 +x_0=105461.0121 +y_0=0.0029 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Menominee (ftUS)
<8146> +proj=tmerc +lat_0=44.71666666666667 +lon_0=-88.41666666666667 +k=1.0000362499 +x_0=105461.0121412243 +y_0=0.003048006096012192 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Marinette (m)
<8147> +proj=tmerc +lat_0=44.69166666666666 +lon_0=-87.71111111111111 +k=1.0000234982 +x_0=238658.8794 +y_0=0.0032 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Marinette (ftUS)
<8148> +proj=tmerc +lat_0=44.69166666666666 +lon_0=-87.71111111111111 +k=1.0000234982 +x_0=238658.8794513589 +y_0=0.003048006096012192 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Marathon (m)
<8149> +proj=lcc +lat_1=44.90090442361111 +lat_0=44.90090442361111 +lon_0=-89.77 +k_0=1.000053289 +x_0=74676.1493 +y_0=55049.2669 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Marathon (ftUS)
<8150> +proj=lcc +lat_1=44.90090442361111 +lat_0=44.90090442361111 +lon_0=-89.77 +k_0=1.000053289 +x_0=74676.1493522987 +y_0=55049.26695453391 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Lincoln (m)
<8151> +proj=tmerc +lat_0=44.84444444444445 +lon_0=-89.73333333333333 +k=1.0000599003 +x_0=116129.0323 +y_0=0.0058 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Lincoln (ftUS)
<8152> +proj=tmerc +lat_0=44.84444444444445 +lon_0=-89.73333333333333 +k=1.0000599003 +x_0=116129.0322580645 +y_0=0.005791211582423164 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Langlade (m)
<8153> +proj=lcc +lat_1=45.15423710527778 +lat_0=45.15423710527778 +lon_0=-89.03333333333333 +k_0=1.0000627024 +x_0=198425.197 +y_0=105279.7829 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Langlade (ftUS)
<8154> +proj=lcc +lat_1=45.15423710527778 +lat_0=45.15423710527778 +lon_0=-89.03333333333333 +k_0=1.0000627024 +x_0=198425.1968503937 +y_0=105279.7828803657 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS La Crosse (m)
<8155> +proj=tmerc +lat_0=43.45111111111111 +lon_0=-91.31666666666666 +k=1.0000319985 +x_0=130454.6598 +y_0=0.0033 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS La Crosse (ftUS)
<8156> +proj=tmerc +lat_0=43.45111111111111 +lon_0=-91.31666666666666 +k=1.0000319985 +x_0=130454.6596901194 +y_0=0.003352806705613411 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Kewaunee, Manitowoc and Sheboygan (m)
<8157> +proj=tmerc +lat_0=43.26666666666667 +lon_0=-87.55 +k=1.0000233704 +x_0=79857.7614 +y_0=0.0012 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Kewaunee, Manitowoc and Sheboygan (ftUS)
<8158> +proj=tmerc +lat_0=43.26666666666667 +lon_0=-87.55 +k=1.0000233704 +x_0=79857.76154432308 +y_0=0.001219202438404877 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Kenosha, Milwaukee, Ozaukee and Racine (m)
<8159> +proj=tmerc +lat_0=42.21666666666667 +lon_0=-87.89444444444445 +k=1.0000260649 +x_0=185928.3728 +y_0=0.0009 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Kenosha, Milwaukee, Ozaukee and Racine (ftUS)
<8160> +proj=tmerc +lat_0=42.21666666666667 +lon_0=-87.89444444444445 +k=1.0000260649 +x_0=185928.3727711455 +y_0=0.0009144018288036576 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Jackson (m)
<8161> +proj=tmerc +lat_0=44.25333512777778 +lon_0=-90.84429651944444 +k=1.0000353 +x_0=27000 +y_0=25000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Jackson (ftUS)
<8162> +proj=tmerc +lat_0=44.25333512777778 +lon_0=-90.84429651944444 +k=1.0000353 +x_0=27000 +y_0=24999.99989839979 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Iron (m)
<8163> +proj=tmerc +lat_0=45.43333333333333 +lon_0=-90.25555555555556 +k=1.0000677153 +x_0=220980.4419 +y_0=0.008500000000000001 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Iron (ftUS)
<8164> +proj=tmerc +lat_0=45.43333333333333 +lon_0=-90.25555555555556 +k=1.0000677153 +x_0=220980.4419608839 +y_0=0.008534417068834137 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Iowa (m)
<8165> +proj=tmerc +lat_0=42.53888888888888 +lon_0=-90.16111111111111 +k=1.0000394961 +x_0=113081.0261 +y_0=0.0045 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Iowa (ftUS)
<8166> +proj=tmerc +lat_0=42.53888888888888 +lon_0=-90.16111111111111 +k=1.0000394961 +x_0=113081.0261620523 +y_0=0.004572009144018288 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Green Lake and Marquette (m)
<8167> +proj=lcc +lat_1=43.80700011777778 +lat_0=43.80700011777778 +lon_0=-89.24166666666667 +k_0=1.0000344057 +x_0=150876.3018 +y_0=79170.7795 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Green Lake and Marquette (ftUS)
<8168> +proj=lcc +lat_1=43.80700011777778 +lat_0=43.80700011777778 +lon_0=-89.24166666666667 +k_0=1.0000344057 +x_0=150876.3017526035 +y_0=79170.77937515875 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Green and Lafayette (m)
<8169> +proj=lcc +lat_1=42.63756227694444 +lat_0=42.63756227694444 +lon_0=-89.83888888888889 +k_0=1.0000390487 +x_0=170078.7403 +y_0=45830.2947 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Green and Lafayette (ftUS)
<8170> +proj=lcc +lat_1=42.63756227694444 +lat_0=42.63756227694444 +lon_0=-89.83888888888889 +k_0=1.0000390487 +x_0=170078.7401574803 +y_0=45830.29484378968 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Grant (m)
<8171> +proj=tmerc +lat_0=41.41111111111111 +lon_0=-90.8 +k=1.0000349452 +x_0=242316.4841 +y_0=0.01 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Grant (ftUS)
<8172> +proj=tmerc +lat_0=41.41111111111111 +lon_0=-90.8 +k=1.0000349452 +x_0=242316.484023368 +y_0=0.01005842011684023 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Forest (m)
<8173> +proj=tmerc +lat_0=44.00555555555555 +lon_0=-88.63333333333334 +k=1.0000673004 +x_0=275844.5533 +y_0=0.0157 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Forest (ftUS)
<8177> +proj=tmerc +lat_0=44.00555555555555 +lon_0=-88.63333333333334 +k=1.0000673004 +x_0=275844.5532131065 +y_0=0.0158496316992634 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Dunn (m)
<8179> +proj=tmerc +lat_0=44.40833333333333 +lon_0=-91.89444444444445 +k=1.0000410324 +x_0=51816.104 +y_0=0.003 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Dunn (ftUS)
<8180> +proj=tmerc +lat_0=44.40833333333333 +lon_0=-91.89444444444445 +k=1.0000410324 +x_0=51816.10393700787 +y_0=0.003048006096012192 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Douglas (m)
<8181> +proj=tmerc +lat_0=45.88333333333333 +lon_0=-91.91666666666667 +k=1.0000385418 +x_0=59131.3183 +y_0=0.0041 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Douglas (ftUS)
<8182> +proj=tmerc +lat_0=45.88333333333333 +lon_0=-91.91666666666667 +k=1.0000385418 +x_0=59131.31826263652 +y_0=0.003962407924815849 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Door (m)
<8184> +proj=tmerc +lat_0=44.4 +lon_0=-87.27222222222223 +k=1.0000187521 +x_0=158801.1176 +y_0=0.0023 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Door (ftUS)
<8185> +proj=tmerc +lat_0=44.4 +lon_0=-87.27222222222223 +k=1.0000187521 +x_0=158801.1176022352 +y_0=0.002438404876809754 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Dodge and Jefferson (m)
<8187> +proj=tmerc +lat_0=41.47222222222222 +lon_0=-88.77500000000001 +k=1.0000346418 +x_0=263347.7263 +y_0=0.0076 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Dodge and Jefferson (ftUS)
<8189> +proj=tmerc +lat_0=41.47222222222222 +lon_0=-88.77500000000001 +k=1.0000346418 +x_0=263347.7263906528 +y_0=0.00762001524003048 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Dane (m)
<8191> +proj=lcc +lat_1=43.0695160375 +lat_0=43.0695160375 +lon_0=-89.42222222222223 +k_0=1.0000384786 +x_0=247193.2944 +y_0=146591.9896 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Dane (ftUS)
<8193> +proj=lcc +lat_1=43.0695160375 +lat_0=43.0695160375 +lon_0=-89.42222222222223 +k_0=1.0000384786 +x_0=247193.2943865888 +y_0=146591.9896367793 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Crawford (m)
<8196> +proj=lcc +lat_1=43.200055605 +lat_0=43.200055605 +lon_0=-90.9388888888889 +k_0=1.0000349151 +x_0=113690.6274 +y_0=53703.1201 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Crawford (ftUS)
<8197> +proj=lcc +lat_1=43.200055605 +lat_0=43.200055605 +lon_0=-90.9388888888889 +k_0=1.0000349151 +x_0=113690.6273812548 +y_0=53703.12024384048 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Columbia (m)
<8198> +proj=lcc +lat_1=43.46254664583333 +lat_0=43.46254664583333 +lon_0=-89.39444444444445 +k_0=1.00003498 +x_0=169164.3381 +y_0=111569.6134 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Columbia (ftUS)
<8200> +proj=lcc +lat_1=43.46254664583333 +lat_0=43.46254664583333 +lon_0=-89.39444444444445 +k_0=1.00003498 +x_0=169164.338023876 +y_0=111569.613512827 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Clark (m)
<8201> +proj=tmerc +lat_0=43.6 +lon_0=-90.70833333333334 +k=1.0000463003 +x_0=199949.1989 +y_0=0.0086 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Clark (ftUS)
<8202> +proj=tmerc +lat_0=43.6 +lon_0=-90.70833333333334 +k=1.0000463003 +x_0=199949.198983998 +y_0=0.008534417068834137 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Chippewa (m)
<8203> +proj=lcc +lat_1=44.97785689861112 +lat_0=44.97785689861112 +lon_0=-91.29444444444444 +k_0=1.0000391127 +x_0=60045.72 +y_0=44091.4346 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Chippewa (ftUS)
<8204> +proj=lcc +lat_1=44.97785689861112 +lat_0=44.97785689861112 +lon_0=-91.29444444444444 +k_0=1.0000391127 +x_0=60045.72009144018 +y_0=44091.43449326898 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Calumet, Fond du Lac, Outagamie and Winnebago (m)
<8205> +proj=tmerc +lat_0=42.71944444444445 +lon_0=-88.5 +k=1.0000286569 +x_0=244754.8893 +y_0=0.0049 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Calumet, Fond du Lac, Outagamie and Winnebago (ftUS)
<8206> +proj=tmerc +lat_0=42.71944444444445 +lon_0=-88.5 +k=1.0000286569 +x_0=244754.8892049784 +y_0=0.004876809753619507 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Burnett (m)
<8207> +proj=lcc +lat_1=45.89871486583333 +lat_0=45.89871486583333 +lon_0=-92.45777777777778 +k_0=1.0000383841 +x_0=64008.1276 +y_0=59445.9043 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Burnett (ftUS)
<8208> +proj=lcc +lat_1=45.89871486583333 +lat_0=45.89871486583333 +lon_0=-92.45777777777778 +k_0=1.0000383841 +x_0=64008.12771145543 +y_0=59445.90419100838 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Buffalo (m)
<8209> +proj=tmerc +lat_0=43.48138888888889 +lon_0=-91.79722222222222 +k=1.0000382778 +x_0=175260.3502 +y_0=0.0048 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Buffalo (ftUS)
<8210> +proj=tmerc +lat_0=43.48138888888889 +lon_0=-91.79722222222222 +k=1.0000382778 +x_0=175260.3502159004 +y_0=0.004876809753619507 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Brown (m)
<8212> +proj=tmerc +lat_0=43 +lon_0=-88 +k=1.00002 +x_0=31600 +y_0=4600 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Brown (ftUS)
<8213> +proj=tmerc +lat_0=43 +lon_0=-88 +k=1.00002 +x_0=31599.99989839979 +y_0=4599.999898399797 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Bayfield (m)
<8214> +proj=lcc +lat_1=46.66964837722222 +lat_0=46.66964837722222 +lon_0=-91.15277777777779 +k_0=1.0000331195 +x_0=228600.4575 +y_0=148551.4837 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Bayfield (ftUS)
<8216> +proj=lcc +lat_1=46.66964837722222 +lat_0=46.66964837722222 +lon_0=-91.15277777777779 +k_0=1.0000331195 +x_0=228600.4575057151 +y_0=148551.4835661671 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Barron (m)
<8218> +proj=tmerc +lat_0=45.13333333333333 +lon_0=-91.84999999999999 +k=1.0000486665 +x_0=93150 +y_0=0.0029 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Barron (ftUS)
<8220> +proj=tmerc +lat_0=45.13333333333333 +lon_0=-91.84999999999999 +k=1.0000486665 +x_0=93150 +y_0=0.003048006096012192 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Ashland (m)
<8222> +proj=tmerc +lat_0=45.70611111111111 +lon_0=-90.62222222222222 +k=1.0000495683 +x_0=172821.9461 +y_0=0.0017 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Ashland (ftUS)
<8224> +proj=tmerc +lat_0=45.70611111111111 +lon_0=-90.62222222222222 +k=1.0000495683 +x_0=172821.945948692 +y_0=0.001828803657607315 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / WISCRS Adams and Juneau (m)
<8225> +proj=tmerc +lat_0=43.36666666666667 +lon_0=-90 +k=1.0000365285 +x_0=147218.6942 +y_0=0.0037 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / WISCRS Adams and Juneau (ftUS)
<8226> +proj=tmerc +lat_0=43.36666666666667 +lon_0=-90 +k=1.0000365285 +x_0=147218.6941325883 +y_0=0.00365760731521463 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(2011) / Oregon Burns-Harper zone (m)
<8311> +proj=tmerc +lat_0=43.5 +lon_0=-117.6666666666667 +k=1.00014 +x_0=90000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Burns-Harper zone (ft)
<8312> +proj=tmerc +lat_0=43.5 +lon_0=-117.6666666666667 +k=1.00014 +x_0=90000.00001488 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Canyon City-Burns zone (m)
<8313> +proj=tmerc +lat_0=43.5 +lon_0=-119 +k=1.00022 +x_0=20000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Canyon City-Burns zone (ft)
<8314> +proj=tmerc +lat_0=43.5 +lon_0=-119 +k=1.00022 +x_0=19999.99999992 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Coast Range North zone (m)
<8315> +proj=lcc +lat_1=45.58333333333334 +lat_0=45.58333333333334 +lon_0=-123.4166666666667 +k_0=1.000045 +x_0=30000 +y_0=20000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Coast Range North zone (ft)
<8316> +proj=lcc +lat_1=45.58333333333334 +lat_0=45.58333333333334 +lon_0=-123.4166666666667 +k_0=1.000045 +x_0=30000.00001512 +y_0=19999.99999992 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Dayville-Prairie City zone (m)
<8317> +proj=tmerc +lat_0=44.25 +lon_0=-119.6333333333333 +k=1.00012 +x_0=20000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Dayville-Prairie City zone (ft)
<8318> +proj=tmerc +lat_0=44.25 +lon_0=-119.6333333333333 +k=1.00012 +x_0=19999.99999992 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Denio-Burns zone (m)
<8319> +proj=tmerc +lat_0=41.75 +lon_0=-118.4166666666667 +k=1.00019 +x_0=80000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Denio-Burns zone (ft)
<8320> +proj=tmerc +lat_0=41.75 +lon_0=-118.4166666666667 +k=1.00019 +x_0=79999.99999968 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Halfway zone (m)
<8321> +proj=lcc +lat_1=45.25 +lat_0=45.25 +lon_0=-117.25 +k_0=1.000085 +x_0=40000 +y_0=70000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Halfway zone (ft)
<8322> +proj=lcc +lat_1=45.25 +lat_0=45.25 +lon_0=-117.25 +k_0=1.000085 +x_0=39999.99999984 +y_0=70000.00001495999 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Medford-Diamond Lake zone (m)
<8323> +proj=lcc +lat_1=42 +lat_0=42 +lon_0=-122.25 +k_0=1.00004 +x_0=60000 +y_0=-60000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Medford-Diamond Lake zone (ft)
<8324> +proj=lcc +lat_1=42 +lat_0=42 +lon_0=-122.25 +k_0=1.00004 +x_0=59999.99999976 +y_0=-59999.99999976 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Mitchell zone (m)
<8325> +proj=lcc +lat_1=47 +lat_0=47 +lon_0=-120.25 +k_0=0.99927 +x_0=30000 +y_0=290000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Mitchell zone (ft)
<8326> +proj=lcc +lat_1=47 +lat_0=47 +lon_0=-120.25 +k_0=0.99927 +x_0=30000.00001512 +y_0=290000.00001408 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon North Central zone (m)
<8327> +proj=lcc +lat_1=46.16666666666666 +lat_0=46.16666666666666 +lon_0=-120.5 +k_0=1 +x_0=100000 +y_0=140000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon North Central zone (ft)
<8328> +proj=lcc +lat_1=46.16666666666666 +lat_0=46.16666666666666 +lon_0=-120.5 +k_0=1 +x_0=99999.99999960001 +y_0=139999.99999944 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Ochoco Summit zone (m)
<8329> +proj=lcc +lat_1=43.5 +lat_0=43.5 +lon_0=-120.5 +k_0=1.00006 +x_0=40000 +y_0=-80000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Ochoco Summit zone (ft)
<8330> +proj=lcc +lat_1=43.5 +lat_0=43.5 +lon_0=-120.5 +k_0=1.00006 +x_0=39999.99999984 +y_0=-79999.99999968 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Owyhee zone (m)
<8331> +proj=tmerc +lat_0=41.75 +lon_0=-117.5833333333333 +k=1.00018 +x_0=70000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Owyhee zone (ft)
<8332> +proj=tmerc +lat_0=41.75 +lon_0=-117.5833333333333 +k=1.00018 +x_0=70000.00001495999 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Pilot Rock-Ukiah zone (m)
<8333> +proj=lcc +lat_1=46.16666666666666 +lat_0=46.16666666666666 +lon_0=-119 +k_0=1.000025 +x_0=50000 +y_0=130000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Pilot Rock-Ukiah zone (ft)
<8334> +proj=lcc +lat_1=46.16666666666666 +lat_0=46.16666666666666 +lon_0=-119 +k_0=1.000025 +x_0=50000.00001504 +y_0=130000.00001472 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Prairie City-Brogan zone (m)
<8335> +proj=lcc +lat_1=44 +lat_0=44 +lon_0=-118 +k_0=1.00017 +x_0=60000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Prairie City-Brogan zone (ft)
<8336> +proj=lcc +lat_1=44 +lat_0=44 +lon_0=-118 +k_0=1.00017 +x_0=59999.99999976 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Riley-Lakeview zone (m)
<8337> +proj=tmerc +lat_0=41.75 +lon_0=-120.3333333333333 +k=1.000215 +x_0=70000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Riley-Lakeview zone (ft)
<8338> +proj=tmerc +lat_0=41.75 +lon_0=-120.3333333333333 +k=1.000215 +x_0=70000.00001495999 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Siskiyou Pass zone (m)
<8339> +proj=lcc +lat_1=42.5 +lat_0=42.5 +lon_0=-122.5833333333333 +k_0=1.00015 +x_0=10000 +y_0=60000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Siskiyou Pass zone (ft)
<8340> +proj=lcc +lat_1=42.5 +lat_0=42.5 +lon_0=-122.5833333333333 +k_0=1.00015 +x_0=10000.0000152 +y_0=59999.99999976 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Ukiah-Fox zone (m)
<8341> +proj=lcc +lat_1=45.25 +lat_0=45.25 +lon_0=-119 +k_0=1.00014 +x_0=30000 +y_0=90000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Ukiah-Fox zone (ft)
<8342> +proj=lcc +lat_1=45.25 +lat_0=45.25 +lon_0=-119 +k_0=1.00014 +x_0=30000.00001512 +y_0=90000.00001488 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Wallowa zone (m)
<8343> +proj=tmerc +lat_0=45.25 +lon_0=-117.5 +k=1.000195 +x_0=60000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Wallowa zone (ft)
<8344> +proj=tmerc +lat_0=45.25 +lon_0=-117.5 +k=1.000195 +x_0=59999.99999976 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Warner Highway zone (m)
<8345> +proj=lcc +lat_1=42.5 +lat_0=42.5 +lon_0=-120 +k_0=1.000245 +x_0=40000 +y_0=60000 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Warner Highway zone (ft)
<8346> +proj=lcc +lat_1=42.5 +lat_0=42.5 +lon_0=-120 +k_0=1.000245 +x_0=39999.99999984 +y_0=59999.99999976 +ellps=GRS80 +units=ft +no_defs  <>
# NAD83(2011) / Oregon Willamette Pass zone (m)
<8347> +proj=tmerc +lat_0=43 +lon_0=-122 +k=1.000223 +x_0=20000 +y_0=0 +ellps=GRS80 +units=m +no_defs  <>
# NAD83(2011) / Oregon Willamette Pass zone (ft)
<8348> +proj=tmerc +lat_0=43 +lon_0=-122 +k=1.000223 +x_0=19999.99999992 +y_0=0 +ellps=GRS80 +units=ft +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 4
<20004> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=4500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 5
<20005> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=5500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 6
<20006> +proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=6500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 7
<20007> +proj=tmerc +lat_0=0 +lon_0=39 +k=1 +x_0=7500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 8
<20008> +proj=tmerc +lat_0=0 +lon_0=45 +k=1 +x_0=8500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 9
<20009> +proj=tmerc +lat_0=0 +lon_0=51 +k=1 +x_0=9500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 10
<20010> +proj=tmerc +lat_0=0 +lon_0=57 +k=1 +x_0=10500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 11
<20011> +proj=tmerc +lat_0=0 +lon_0=63 +k=1 +x_0=11500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 12
<20012> +proj=tmerc +lat_0=0 +lon_0=69 +k=1 +x_0=12500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 13
<20013> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=13500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 14
<20014> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=14500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 15
<20015> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=15500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 16
<20016> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=16500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 17
<20017> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=17500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 18
<20018> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=18500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 19
<20019> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=19500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 20
<20020> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=20500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 21
<20021> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=21500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 22
<20022> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=22500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 23
<20023> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=23500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 24
<20024> +proj=tmerc +lat_0=0 +lon_0=141 +k=1 +x_0=24500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 25
<20025> +proj=tmerc +lat_0=0 +lon_0=147 +k=1 +x_0=25500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 26
<20026> +proj=tmerc +lat_0=0 +lon_0=153 +k=1 +x_0=26500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 27
<20027> +proj=tmerc +lat_0=0 +lon_0=159 +k=1 +x_0=27500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 28
<20028> +proj=tmerc +lat_0=0 +lon_0=165 +k=1 +x_0=28500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 29
<20029> +proj=tmerc +lat_0=0 +lon_0=171 +k=1 +x_0=29500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 30
<20030> +proj=tmerc +lat_0=0 +lon_0=177 +k=1 +x_0=30500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 31
<20031> +proj=tmerc +lat_0=0 +lon_0=-177 +k=1 +x_0=31500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger zone 32
<20032> +proj=tmerc +lat_0=0 +lon_0=-171 +k=1 +x_0=32500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 4N (deprecated)
<20064> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 5N (deprecated)
<20065> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 6N (deprecated)
<20066> +proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 7N (deprecated)
<20067> +proj=tmerc +lat_0=0 +lon_0=39 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 8N (deprecated)
<20068> +proj=tmerc +lat_0=0 +lon_0=45 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 9N (deprecated)
<20069> +proj=tmerc +lat_0=0 +lon_0=51 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 10N (deprecated)
<20070> +proj=tmerc +lat_0=0 +lon_0=57 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 11N (deprecated)
<20071> +proj=tmerc +lat_0=0 +lon_0=63 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 12N (deprecated)
<20072> +proj=tmerc +lat_0=0 +lon_0=69 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 13N (deprecated)
<20073> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 14N (deprecated)
<20074> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 15N (deprecated)
<20075> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 16N (deprecated)
<20076> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 17N (deprecated)
<20077> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 18N (deprecated)
<20078> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 19N (deprecated)
<20079> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 20N (deprecated)
<20080> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 21N (deprecated)
<20081> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 22N (deprecated)
<20082> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 23N (deprecated)
<20083> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 24N (deprecated)
<20084> +proj=tmerc +lat_0=0 +lon_0=141 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 25N (deprecated)
<20085> +proj=tmerc +lat_0=0 +lon_0=147 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 26N (deprecated)
<20086> +proj=tmerc +lat_0=0 +lon_0=153 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 27N (deprecated)
<20087> +proj=tmerc +lat_0=0 +lon_0=159 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 28N (deprecated)
<20088> +proj=tmerc +lat_0=0 +lon_0=165 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 29N (deprecated)
<20089> +proj=tmerc +lat_0=0 +lon_0=171 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 30N (deprecated)
<20090> +proj=tmerc +lat_0=0 +lon_0=177 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 31N (deprecated)
<20091> +proj=tmerc +lat_0=0 +lon_0=-177 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Pulkovo 1995 / Gauss-Kruger 32N (deprecated)
<20092> +proj=tmerc +lat_0=0 +lon_0=-171 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,0,0,0.13,-0.22 +units=m +no_defs  <>
# Adindan / UTM zone 35N
<20135> +proj=utm +zone=35 +ellps=clrk80 +towgs84=-166,-15,204,0,0,0,0 +units=m +no_defs  <>
# Adindan / UTM zone 36N
<20136> +proj=utm +zone=36 +ellps=clrk80 +towgs84=-166,-15,204,0,0,0,0 +units=m +no_defs  <>
# Adindan / UTM zone 37N
<20137> +proj=utm +zone=37 +ellps=clrk80 +towgs84=-166,-15,204,0,0,0,0 +units=m +no_defs  <>
# Adindan / UTM zone 38N
<20138> +proj=utm +zone=38 +ellps=clrk80 +towgs84=-166,-15,204,0,0,0,0 +units=m +no_defs  <>
# AGD66 / AMG zone 48 (deprecated)
<20248> +proj=utm +zone=48 +south +ellps=aust_SA +towgs84=-117.808,-51.536,137.784,0.303,0.446,0.234,-0.29 +units=m +no_defs  <>
# AGD66 / AMG zone 49
<20249> +proj=utm +zone=49 +south +ellps=aust_SA +towgs84=-117.808,-51.536,137.784,0.303,0.446,0.234,-0.29 +units=m +no_defs  <>
# AGD66 / AMG zone 50
<20250> +proj=utm +zone=50 +south +ellps=aust_SA +towgs84=-117.808,-51.536,137.784,0.303,0.446,0.234,-0.29 +units=m +no_defs  <>
# AGD66 / AMG zone 51
<20251> +proj=utm +zone=51 +south +ellps=aust_SA +towgs84=-117.808,-51.536,137.784,0.303,0.446,0.234,-0.29 +units=m +no_defs  <>
# AGD66 / AMG zone 52
<20252> +proj=utm +zone=52 +south +ellps=aust_SA +towgs84=-117.808,-51.536,137.784,0.303,0.446,0.234,-0.29 +units=m +no_defs  <>
# AGD66 / AMG zone 53
<20253> +proj=utm +zone=53 +south +ellps=aust_SA +towgs84=-117.808,-51.536,137.784,0.303,0.446,0.234,-0.29 +units=m +no_defs  <>
# AGD66 / AMG zone 54
<20254> +proj=utm +zone=54 +south +ellps=aust_SA +towgs84=-117.808,-51.536,137.784,0.303,0.446,0.234,-0.29 +units=m +no_defs  <>
# AGD66 / AMG zone 55
<20255> +proj=utm +zone=55 +south +ellps=aust_SA +towgs84=-117.808,-51.536,137.784,0.303,0.446,0.234,-0.29 +units=m +no_defs  <>
# AGD66 / AMG zone 56
<20256> +proj=utm +zone=56 +south +ellps=aust_SA +towgs84=-117.808,-51.536,137.784,0.303,0.446,0.234,-0.29 +units=m +no_defs  <>
# AGD66 / AMG zone 57
<20257> +proj=utm +zone=57 +south +ellps=aust_SA +towgs84=-117.808,-51.536,137.784,0.303,0.446,0.234,-0.29 +units=m +no_defs  <>
# AGD66 / AMG zone 58
<20258> +proj=utm +zone=58 +south +ellps=aust_SA +towgs84=-117.808,-51.536,137.784,0.303,0.446,0.234,-0.29 +units=m +no_defs  <>
# AGD84 / AMG zone 48 (deprecated)
<20348> +proj=utm +zone=48 +south +ellps=aust_SA +towgs84=-134,-48,149,0,0,0,0 +units=m +no_defs  <>
# AGD84 / AMG zone 49
<20349> +proj=utm +zone=49 +south +ellps=aust_SA +towgs84=-134,-48,149,0,0,0,0 +units=m +no_defs  <>
# AGD84 / AMG zone 50
<20350> +proj=utm +zone=50 +south +ellps=aust_SA +towgs84=-134,-48,149,0,0,0,0 +units=m +no_defs  <>
# AGD84 / AMG zone 51
<20351> +proj=utm +zone=51 +south +ellps=aust_SA +towgs84=-134,-48,149,0,0,0,0 +units=m +no_defs  <>
# AGD84 / AMG zone 52
<20352> +proj=utm +zone=52 +south +ellps=aust_SA +towgs84=-134,-48,149,0,0,0,0 +units=m +no_defs  <>
# AGD84 / AMG zone 53
<20353> +proj=utm +zone=53 +south +ellps=aust_SA +towgs84=-134,-48,149,0,0,0,0 +units=m +no_defs  <>
# AGD84 / AMG zone 54
<20354> +proj=utm +zone=54 +south +ellps=aust_SA +towgs84=-134,-48,149,0,0,0,0 +units=m +no_defs  <>
# AGD84 / AMG zone 55
<20355> +proj=utm +zone=55 +south +ellps=aust_SA +towgs84=-134,-48,149,0,0,0,0 +units=m +no_defs  <>
# AGD84 / AMG zone 56
<20356> +proj=utm +zone=56 +south +ellps=aust_SA +towgs84=-134,-48,149,0,0,0,0 +units=m +no_defs  <>
# AGD84 / AMG zone 57 (deprecated)
<20357> +proj=utm +zone=57 +south +ellps=aust_SA +towgs84=-134,-48,149,0,0,0,0 +units=m +no_defs  <>
# AGD84 / AMG zone 58 (deprecated)
<20358> +proj=utm +zone=58 +south +ellps=aust_SA +towgs84=-134,-48,149,0,0,0,0 +units=m +no_defs  <>
# Ain el Abd / UTM zone 36N
<20436> +proj=utm +zone=36 +ellps=intl +towgs84=-143,-236,7,0,0,0,0 +units=m +no_defs  <>
# Ain el Abd / UTM zone 37N
<20437> +proj=utm +zone=37 +ellps=intl +towgs84=-143,-236,7,0,0,0,0 +units=m +no_defs  <>
# Ain el Abd / UTM zone 38N
<20438> +proj=utm +zone=38 +ellps=intl +towgs84=-143,-236,7,0,0,0,0 +units=m +no_defs  <>
# Ain el Abd / UTM zone 39N
<20439> +proj=utm +zone=39 +ellps=intl +towgs84=-143,-236,7,0,0,0,0 +units=m +no_defs  <>
# Ain el Abd / UTM zone 40N
<20440> +proj=utm +zone=40 +ellps=intl +towgs84=-143,-236,7,0,0,0,0 +units=m +no_defs  <>
# Ain el Abd / Bahrain Grid
<20499> +proj=utm +zone=39 +ellps=intl +towgs84=-143,-236,7,0,0,0,0 +units=m +no_defs  <>
# Afgooye / UTM zone 38N
<20538> +proj=utm +zone=38 +ellps=krass +towgs84=-43,-163,45,0,0,0,0 +units=m +no_defs  <>
# Afgooye / UTM zone 39N
<20539> +proj=utm +zone=39 +ellps=krass +towgs84=-43,-163,45,0,0,0,0 +units=m +no_defs  <>
# Lisbon (Lisbon) / Portuguese National Grid
<20790> +proj=tmerc +lat_0=39.66666666666666 +lon_0=1 +k=1 +x_0=200000 +y_0=300000 +ellps=intl +towgs84=-304.046,-60.576,103.64,0,0,0,0 +pm=lisbon +units=m +no_defs  <>
# Lisbon (Lisbon) / Portuguese Grid
<20791> +proj=tmerc +lat_0=39.66666666666666 +lon_0=1 +k=1 +x_0=0 +y_0=0 +ellps=intl +towgs84=-304.046,-60.576,103.64,0,0,0,0 +pm=lisbon +units=m +no_defs  <>
# Aratu / UTM zone 22S
<20822> +proj=utm +zone=22 +south +ellps=intl +towgs84=-151.99,287.04,-147.45,0,0,0,0 +units=m +no_defs  <>
# Aratu / UTM zone 23S
<20823> +proj=utm +zone=23 +south +ellps=intl +towgs84=-151.99,287.04,-147.45,0,0,0,0 +units=m +no_defs  <>
# Aratu / UTM zone 24S
<20824> +proj=utm +zone=24 +south +ellps=intl +towgs84=-151.99,287.04,-147.45,0,0,0,0 +units=m +no_defs  <>
# Arc 1950 / UTM zone 34S
<20934> +proj=utm +zone=34 +south +a=6378249.145 +b=6356514.966398753 +towgs84=-143,-90,-294,0,0,0,0 +units=m +no_defs  <>
# Arc 1950 / UTM zone 35S
<20935> +proj=utm +zone=35 +south +a=6378249.145 +b=6356514.966398753 +towgs84=-143,-90,-294,0,0,0,0 +units=m +no_defs  <>
# Arc 1950 / UTM zone 36S
<20936> +proj=utm +zone=36 +south +a=6378249.145 +b=6356514.966398753 +towgs84=-143,-90,-294,0,0,0,0 +units=m +no_defs  <>
# Arc 1960 / UTM zone 35S
<21035> +proj=utm +zone=35 +south +ellps=clrk80 +towgs84=-160,-6,-302,0,0,0,0 +units=m +no_defs  <>
# Arc 1960 / UTM zone 36S
<21036> +proj=utm +zone=36 +south +ellps=clrk80 +towgs84=-160,-6,-302,0,0,0,0 +units=m +no_defs  <>
# Arc 1960 / UTM zone 37S
<21037> +proj=utm +zone=37 +south +ellps=clrk80 +towgs84=-160,-6,-302,0,0,0,0 +units=m +no_defs  <>
# Arc 1960 / UTM zone 35N
<21095> +proj=utm +zone=35 +ellps=clrk80 +towgs84=-160,-6,-302,0,0,0,0 +units=m +no_defs  <>
# Arc 1960 / UTM zone 36N
<21096> +proj=utm +zone=36 +ellps=clrk80 +towgs84=-160,-6,-302,0,0,0,0 +units=m +no_defs  <>
# Arc 1960 / UTM zone 37N
<21097> +proj=utm +zone=37 +ellps=clrk80 +towgs84=-160,-6,-302,0,0,0,0 +units=m +no_defs  <>
# Batavia (Jakarta) / NEIEZ (deprecated)
<21100> +proj=merc +lon_0=110 +k=0.997 +x_0=3900000 +y_0=900000 +ellps=bessel +towgs84=-377,681,-50,0,0,0,0 +pm=jakarta +units=m +no_defs  <>
# Batavia / UTM zone 48S
<21148> +proj=utm +zone=48 +south +ellps=bessel +towgs84=-377,681,-50,0,0,0,0 +units=m +no_defs  <>
# Batavia / UTM zone 49S
<21149> +proj=utm +zone=49 +south +ellps=bessel +towgs84=-377,681,-50,0,0,0,0 +units=m +no_defs  <>
# Batavia / UTM zone 50S
<21150> +proj=utm +zone=50 +south +ellps=bessel +towgs84=-377,681,-50,0,0,0,0 +units=m +no_defs  <>
# Barbados 1938 / British West Indies Grid
<21291> +proj=tmerc +lat_0=0 +lon_0=-62 +k=0.9995000000000001 +x_0=400000 +y_0=0 +ellps=clrk80 +towgs84=31.95,300.99,419.19,0,0,0,0 +units=m +no_defs  <>
# Barbados 1938 / Barbados National Grid
<21292> +proj=tmerc +lat_0=13.17638888888889 +lon_0=-59.55972222222222 +k=0.9999986 +x_0=30000 +y_0=75000 +ellps=clrk80 +towgs84=31.95,300.99,419.19,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger zone 13
<21413> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=13500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger zone 14
<21414> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=14500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger zone 15
<21415> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=15500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger zone 16
<21416> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=16500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger zone 17
<21417> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=17500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger zone 18
<21418> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=18500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger zone 19
<21419> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=19500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger zone 20
<21420> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=20500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger zone 21
<21421> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=21500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger zone 22
<21422> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=22500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger zone 23
<21423> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=23500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger CM 75E
<21453> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger CM 81E
<21454> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger CM 87E
<21455> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger CM 93E
<21456> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger CM 99E
<21457> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger CM 105E
<21458> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger CM 111E
<21459> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger CM 117E
<21460> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger CM 123E
<21461> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger CM 129E
<21462> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger CM 135E
<21463> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger 13N (deprecated)
<21473> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger 14N (deprecated)
<21474> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger 15N (deprecated)
<21475> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger 16N (deprecated)
<21476> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger 17N (deprecated)
<21477> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger 18N (deprecated)
<21478> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger 19N (deprecated)
<21479> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger 20N (deprecated)
<21480> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger 21N (deprecated)
<21481> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger 22N (deprecated)
<21482> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Beijing 1954 / Gauss-Kruger 23N (deprecated)
<21483> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=15.8,-154.4,-82.3,0,0,0,0 +units=m +no_defs  <>
# Belge 1950 (Brussels) / Belge Lambert 50
<21500> +proj=lcc +lat_1=49.83333333333334 +lat_2=51.16666666666666 +lat_0=90 +lon_0=0 +x_0=150000 +y_0=5400000 +ellps=intl +pm=brussels +units=m +no_defs  <>
# Bern 1898 (Bern) / LV03C
<21780> +proj=somerc +lat_0=46.95240555555556 +lon_0=0 +k_0=1 +x_0=0 +y_0=0 +ellps=bessel +towgs84=674.374,15.056,405.346,0,0,0,0 +pm=bern +units=m +no_defs  <>
# CH1903 / LV03
<21781> +proj=somerc +lat_0=46.95240555555556 +lon_0=7.439583333333333 +k_0=1 +x_0=600000 +y_0=200000 +ellps=bessel +towgs84=674.374,15.056,405.346,0,0,0,0 +units=m +no_defs  <>
# CH1903 / LV03C-G
<21782> +proj=somerc +lat_0=46.95240555555556 +lon_0=7.439583333333333 +k_0=1 +x_0=0 +y_0=0 +ellps=bessel +towgs84=674.374,15.056,405.346,0,0,0,0 +units=m +no_defs  <>
# Bogota 1975 / UTM zone 17N (deprecated)
<21817> +proj=utm +zone=17 +ellps=intl +towgs84=307,304,-318,0,0,0,0 +units=m +no_defs  <>
# Bogota 1975 / UTM zone 18N
<21818> +proj=utm +zone=18 +ellps=intl +towgs84=307,304,-318,0,0,0,0 +units=m +no_defs  <>
# Bogota 1975 / Colombia West zone (deprecated)
<21891> +proj=tmerc +lat_0=4.599047222222222 +lon_0=-77.08091666666667 +k=1 +x_0=1000000 +y_0=1000000 +ellps=intl +towgs84=307,304,-318,0,0,0,0 +units=m +no_defs  <>
# Bogota 1975 / Colombia Bogota zone (deprecated)
<21892> +proj=tmerc +lat_0=4.599047222222222 +lon_0=-74.08091666666667 +k=1 +x_0=1000000 +y_0=1000000 +ellps=intl +towgs84=307,304,-318,0,0,0,0 +units=m +no_defs  <>
# Bogota 1975 / Colombia East Central zone (deprecated)
<21893> +proj=tmerc +lat_0=4.599047222222222 +lon_0=-71.08091666666667 +k=1 +x_0=1000000 +y_0=1000000 +ellps=intl +towgs84=307,304,-318,0,0,0,0 +units=m +no_defs  <>
# Bogota 1975 / Colombia East (deprecated)
<21894> +proj=tmerc +lat_0=4.599047222222222 +lon_0=-68.08091666666667 +k=1 +x_0=1000000 +y_0=1000000 +ellps=intl +towgs84=307,304,-318,0,0,0,0 +units=m +no_defs  <>
# Bogota 1975 / Colombia West zone
<21896> +proj=tmerc +lat_0=4.599047222222222 +lon_0=-77.08091666666667 +k=1 +x_0=1000000 +y_0=1000000 +ellps=intl +towgs84=307,304,-318,0,0,0,0 +units=m +no_defs  <>
# Bogota 1975 / Colombia Bogota zone
<21897> +proj=tmerc +lat_0=4.599047222222222 +lon_0=-74.08091666666667 +k=1 +x_0=1000000 +y_0=1000000 +ellps=intl +towgs84=307,304,-318,0,0,0,0 +units=m +no_defs  <>
# Bogota 1975 / Colombia East Central zone
<21898> +proj=tmerc +lat_0=4.599047222222222 +lon_0=-71.08091666666667 +k=1 +x_0=1000000 +y_0=1000000 +ellps=intl +towgs84=307,304,-318,0,0,0,0 +units=m +no_defs  <>
# Bogota 1975 / Colombia East
<21899> +proj=tmerc +lat_0=4.599047222222222 +lon_0=-68.08091666666667 +k=1 +x_0=1000000 +y_0=1000000 +ellps=intl +towgs84=307,304,-318,0,0,0,0 +units=m +no_defs  <>
# Camacupa / UTM zone 32S
<22032> +proj=utm +zone=32 +south +ellps=clrk80 +towgs84=-50.9,-347.6,-231,0,0,0,0 +units=m +no_defs  <>
# Camacupa / UTM zone 33S
<22033> +proj=utm +zone=33 +south +ellps=clrk80 +towgs84=-50.9,-347.6,-231,0,0,0,0 +units=m +no_defs  <>
# Camacupa / TM 11.30 SE
<22091> +proj=tmerc +lat_0=0 +lon_0=11.5 +k=0.9996 +x_0=500000 +y_0=10000000 +ellps=clrk80 +towgs84=-50.9,-347.6,-231,0,0,0,0 +units=m +no_defs  <>
# Camacupa / TM 12 SE
<22092> +proj=tmerc +lat_0=0 +lon_0=12 +k=0.9996 +x_0=500000 +y_0=10000000 +ellps=clrk80 +towgs84=-50.9,-347.6,-231,0,0,0,0 +units=m +no_defs  <>
# POSGAR 98 / Argentina 1
<22171> +proj=tmerc +lat_0=-90 +lon_0=-72 +k=1 +x_0=1500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# POSGAR 98 / Argentina 2
<22172> +proj=tmerc +lat_0=-90 +lon_0=-69 +k=1 +x_0=2500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# POSGAR 98 / Argentina 3
<22173> +proj=tmerc +lat_0=-90 +lon_0=-66 +k=1 +x_0=3500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# POSGAR 98 / Argentina 4
<22174> +proj=tmerc +lat_0=-90 +lon_0=-63 +k=1 +x_0=4500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# POSGAR 98 / Argentina 5
<22175> +proj=tmerc +lat_0=-90 +lon_0=-60 +k=1 +x_0=5500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# POSGAR 98 / Argentina 6
<22176> +proj=tmerc +lat_0=-90 +lon_0=-57 +k=1 +x_0=6500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# POSGAR 98 / Argentina 7
<22177> +proj=tmerc +lat_0=-90 +lon_0=-54 +k=1 +x_0=7500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# POSGAR 94 / Argentina 1
<22181> +proj=tmerc +lat_0=-90 +lon_0=-72 +k=1 +x_0=1500000 +y_0=0 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# POSGAR 94 / Argentina 2
<22182> +proj=tmerc +lat_0=-90 +lon_0=-69 +k=1 +x_0=2500000 +y_0=0 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# POSGAR 94 / Argentina 3
<22183> +proj=tmerc +lat_0=-90 +lon_0=-66 +k=1 +x_0=3500000 +y_0=0 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# POSGAR 94 / Argentina 4
<22184> +proj=tmerc +lat_0=-90 +lon_0=-63 +k=1 +x_0=4500000 +y_0=0 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# POSGAR 94 / Argentina 5
<22185> +proj=tmerc +lat_0=-90 +lon_0=-60 +k=1 +x_0=5500000 +y_0=0 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# POSGAR 94 / Argentina 6
<22186> +proj=tmerc +lat_0=-90 +lon_0=-57 +k=1 +x_0=6500000 +y_0=0 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# POSGAR 94 / Argentina 7
<22187> +proj=tmerc +lat_0=-90 +lon_0=-54 +k=1 +x_0=7500000 +y_0=0 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Campo Inchauspe / Argentina 1
<22191> +proj=tmerc +lat_0=-90 +lon_0=-72 +k=1 +x_0=1500000 +y_0=0 +ellps=intl +towgs84=-148,136,90,0,0,0,0 +units=m +no_defs  <>
# Campo Inchauspe / Argentina 2
<22192> +proj=tmerc +lat_0=-90 +lon_0=-69 +k=1 +x_0=2500000 +y_0=0 +ellps=intl +towgs84=-148,136,90,0,0,0,0 +units=m +no_defs  <>
# Campo Inchauspe / Argentina 3
<22193> +proj=tmerc +lat_0=-90 +lon_0=-66 +k=1 +x_0=3500000 +y_0=0 +ellps=intl +towgs84=-148,136,90,0,0,0,0 +units=m +no_defs  <>
# Campo Inchauspe / Argentina 4
<22194> +proj=tmerc +lat_0=-90 +lon_0=-63 +k=1 +x_0=4500000 +y_0=0 +ellps=intl +towgs84=-148,136,90,0,0,0,0 +units=m +no_defs  <>
# Campo Inchauspe / Argentina 5
<22195> +proj=tmerc +lat_0=-90 +lon_0=-60 +k=1 +x_0=5500000 +y_0=0 +ellps=intl +towgs84=-148,136,90,0,0,0,0 +units=m +no_defs  <>
# Campo Inchauspe / Argentina 6
<22196> +proj=tmerc +lat_0=-90 +lon_0=-57 +k=1 +x_0=6500000 +y_0=0 +ellps=intl +towgs84=-148,136,90,0,0,0,0 +units=m +no_defs  <>
# Campo Inchauspe / Argentina 7
<22197> +proj=tmerc +lat_0=-90 +lon_0=-54 +k=1 +x_0=7500000 +y_0=0 +ellps=intl +towgs84=-148,136,90,0,0,0,0 +units=m +no_defs  <>
# Cape / UTM zone 34S
<22234> +proj=utm +zone=34 +south +a=6378249.145 +b=6356514.966398753 +towgs84=-136,-108,-292,0,0,0,0 +units=m +no_defs  <>
# Cape / UTM zone 35S
<22235> +proj=utm +zone=35 +south +a=6378249.145 +b=6356514.966398753 +towgs84=-136,-108,-292,0,0,0,0 +units=m +no_defs  <>
# Cape / UTM zone 36S (deprecated)
<22236> +proj=utm +zone=36 +south +a=6378249.145 +b=6356514.966398753 +towgs84=-136,-108,-292,0,0,0,0 +units=m +no_defs  <>
# Cape / Lo15
<22275> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=0 +y_0=0 +axis=wsu +a=6378249.145 +b=6356514.966398753 +towgs84=-136,-108,-292,0,0,0,0 +units=m +no_defs  <>
# Cape / Lo17
<22277> +proj=tmerc +lat_0=0 +lon_0=17 +k=1 +x_0=0 +y_0=0 +axis=wsu +a=6378249.145 +b=6356514.966398753 +towgs84=-136,-108,-292,0,0,0,0 +units=m +no_defs  <>
# Cape / Lo19
<22279> +proj=tmerc +lat_0=0 +lon_0=19 +k=1 +x_0=0 +y_0=0 +axis=wsu +a=6378249.145 +b=6356514.966398753 +towgs84=-136,-108,-292,0,0,0,0 +units=m +no_defs  <>
# Cape / Lo21
<22281> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=0 +y_0=0 +axis=wsu +a=6378249.145 +b=6356514.966398753 +towgs84=-136,-108,-292,0,0,0,0 +units=m +no_defs  <>
# Cape / Lo23
<22283> +proj=tmerc +lat_0=0 +lon_0=23 +k=1 +x_0=0 +y_0=0 +axis=wsu +a=6378249.145 +b=6356514.966398753 +towgs84=-136,-108,-292,0,0,0,0 +units=m +no_defs  <>
# Cape / Lo25
<22285> +proj=tmerc +lat_0=0 +lon_0=25 +k=1 +x_0=0 +y_0=0 +axis=wsu +a=6378249.145 +b=6356514.966398753 +towgs84=-136,-108,-292,0,0,0,0 +units=m +no_defs  <>
# Cape / Lo27
<22287> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=0 +y_0=0 +axis=wsu +a=6378249.145 +b=6356514.966398753 +towgs84=-136,-108,-292,0,0,0,0 +units=m +no_defs  <>
# Cape / Lo29
<22289> +proj=tmerc +lat_0=0 +lon_0=29 +k=1 +x_0=0 +y_0=0 +axis=wsu +a=6378249.145 +b=6356514.966398753 +towgs84=-136,-108,-292,0,0,0,0 +units=m +no_defs  <>
# Cape / Lo31
<22291> +proj=tmerc +lat_0=0 +lon_0=31 +k=1 +x_0=0 +y_0=0 +axis=wsu +a=6378249.145 +b=6356514.966398753 +towgs84=-136,-108,-292,0,0,0,0 +units=m +no_defs  <>
# Cape / Lo33
<22293> +proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=0 +y_0=0 +axis=wsu +a=6378249.145 +b=6356514.966398753 +towgs84=-136,-108,-292,0,0,0,0 +units=m +no_defs  <>
# Carthage (Paris) / Tunisia Mining Grid
# Unable to translate coordinate system EPSG:22300 into PROJ.4 format.
#
# Carthage / UTM zone 32N
<22332> +proj=utm +zone=32 +datum=carthage +units=m +no_defs  <>
# Carthage / Nord Tunisie
<22391> +proj=lcc +lat_1=36 +lat_0=36 +lon_0=9.9 +k_0=0.999625544 +x_0=500000 +y_0=300000 +datum=carthage +units=m +no_defs  <>
# Carthage / Sud Tunisie
<22392> +proj=lcc +lat_1=33.3 +lat_0=33.3 +lon_0=9.9 +k_0=0.999625769 +x_0=500000 +y_0=300000 +datum=carthage +units=m +no_defs  <>
# Corrego Alegre 1970-72 / UTM zone 21S
<22521> +proj=utm +zone=21 +south +ellps=intl +towgs84=-205.57,168.77,-4.12,0,0,0,0 +units=m +no_defs  <>
# Corrego Alegre 1970-72 / UTM zone 22S
<22522> +proj=utm +zone=22 +south +ellps=intl +towgs84=-205.57,168.77,-4.12,0,0,0,0 +units=m +no_defs  <>
# Corrego Alegre 1970-72 / UTM zone 23S
<22523> +proj=utm +zone=23 +south +ellps=intl +towgs84=-205.57,168.77,-4.12,0,0,0,0 +units=m +no_defs  <>
# Corrego Alegre 1970-72 / UTM zone 24S
<22524> +proj=utm +zone=24 +south +ellps=intl +towgs84=-205.57,168.77,-4.12,0,0,0,0 +units=m +no_defs  <>
# Corrego Alegre 1970-72 / UTM zone 25S
<22525> +proj=utm +zone=25 +south +ellps=intl +towgs84=-205.57,168.77,-4.12,0,0,0,0 +units=m +no_defs  <>
# Deir ez Zor / Levant Zone
<22700> +proj=lcc +lat_1=34.65 +lat_0=34.65 +lon_0=37.35 +k_0=0.9996256 +x_0=300000 +y_0=300000 +a=6378249.2 +b=6356515 +towgs84=-190.421,8.532,238.69,0,0,0,0 +units=m +no_defs  <>
# Deir ez Zor / Syria Lambert
<22770> +proj=lcc +lat_1=34.65 +lat_0=34.65 +lon_0=37.35 +k_0=0.9996256 +x_0=300000 +y_0=300000 +a=6378249.2 +b=6356515 +towgs84=-190.421,8.532,238.69,0,0,0,0 +units=m +no_defs  <>
# Deir ez Zor / Levant Stereographic
<22780> +proj=sterea +lat_0=34.2 +lon_0=39.15 +k=0.9995341 +x_0=0 +y_0=0 +a=6378249.2 +b=6356515 +towgs84=-190.421,8.532,238.69,0,0,0,0 +units=m +no_defs  <>
# Douala / UTM zone 32N (deprecated)
<22832> +proj=utm +zone=32 +a=6378249.2 +b=6356515 +units=m +no_defs  <>
# Egypt 1907 / Blue Belt
<22991> +proj=tmerc +lat_0=30 +lon_0=35 +k=1 +x_0=300000 +y_0=1100000 +ellps=helmert +towgs84=-130,110,-13,0,0,0,0 +units=m +no_defs  <>
# Egypt 1907 / Red Belt
<22992> +proj=tmerc +lat_0=30 +lon_0=31 +k=1 +x_0=615000 +y_0=810000 +ellps=helmert +towgs84=-130,110,-13,0,0,0,0 +units=m +no_defs  <>
# Egypt 1907 / Purple Belt
<22993> +proj=tmerc +lat_0=30 +lon_0=27 +k=1 +x_0=700000 +y_0=200000 +ellps=helmert +towgs84=-130,110,-13,0,0,0,0 +units=m +no_defs  <>
# Egypt 1907 / Extended Purple Belt
<22994> +proj=tmerc +lat_0=30 +lon_0=27 +k=1 +x_0=700000 +y_0=1200000 +ellps=helmert +towgs84=-130,110,-13,0,0,0,0 +units=m +no_defs  <>
# ED50 / UTM zone 28N
<23028> +proj=utm +zone=28 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / UTM zone 29N
<23029> +proj=utm +zone=29 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / UTM zone 30N
<23030> +proj=utm +zone=30 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / UTM zone 31N
<23031> +proj=utm +zone=31 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / UTM zone 32N
<23032> +proj=utm +zone=32 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / UTM zone 33N
<23033> +proj=utm +zone=33 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / UTM zone 34N
<23034> +proj=utm +zone=34 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / UTM zone 35N
<23035> +proj=utm +zone=35 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / UTM zone 36N
<23036> +proj=utm +zone=36 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / UTM zone 37N
<23037> +proj=utm +zone=37 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / UTM zone 38N
<23038> +proj=utm +zone=38 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / TM 0 N
<23090> +proj=tmerc +lat_0=0 +lon_0=0 +k=0.9996 +x_0=500000 +y_0=0 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# ED50 / TM 5 NE
<23095> +proj=tmerc +lat_0=0 +lon_0=5 +k=0.9996 +x_0=500000 +y_0=0 +ellps=intl +towgs84=-87,-98,-121,0,0,0,0 +units=m +no_defs  <>
# Fahud / UTM zone 39N
<23239> +proj=utm +zone=39 +ellps=clrk80 +towgs84=-333.102,-11.02,230.69,0,0,0.554,0.219 +units=m +no_defs  <>
# Fahud / UTM zone 40N
<23240> +proj=utm +zone=40 +ellps=clrk80 +towgs84=-333.102,-11.02,230.69,0,0,0.554,0.219 +units=m +no_defs  <>
# Garoua / UTM zone 33N (deprecated)
<23433> +proj=utm +zone=33 +a=6378249.2 +b=6356515 +units=m +no_defs  <>
# HD72 / EOV
<23700> +proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +towgs84=52.17,-71.82,-14.9,0,0,0,0 +units=m +no_defs  <>
# DGN95 / Indonesia TM-3 zone 46.2
<23830> +proj=tmerc +lat_0=0 +lon_0=94.5 +k=0.9999 +x_0=200000 +y_0=1500000 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / Indonesia TM-3 zone 47.1
<23831> +proj=tmerc +lat_0=0 +lon_0=97.5 +k=0.9999 +x_0=200000 +y_0=1500000 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / Indonesia TM-3 zone 47.2
<23832> +proj=tmerc +lat_0=0 +lon_0=100.5 +k=0.9999 +x_0=200000 +y_0=1500000 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / Indonesia TM-3 zone 48.1
<23833> +proj=tmerc +lat_0=0 +lon_0=103.5 +k=0.9999 +x_0=200000 +y_0=1500000 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / Indonesia TM-3 zone 48.2
<23834> +proj=tmerc +lat_0=0 +lon_0=106.5 +k=0.9999 +x_0=200000 +y_0=1500000 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / Indonesia TM-3 zone 49.1
<23835> +proj=tmerc +lat_0=0 +lon_0=109.5 +k=0.9999 +x_0=200000 +y_0=1500000 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / Indonesia TM-3 zone 49.2
<23836> +proj=tmerc +lat_0=0 +lon_0=112.5 +k=0.9999 +x_0=200000 +y_0=1500000 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / Indonesia TM-3 zone 50.1
<23837> +proj=tmerc +lat_0=0 +lon_0=115.5 +k=0.9999 +x_0=200000 +y_0=1500000 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / Indonesia TM-3 zone 50.2
<23838> +proj=tmerc +lat_0=0 +lon_0=118.5 +k=0.9999 +x_0=200000 +y_0=1500000 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / Indonesia TM-3 zone 51.1
<23839> +proj=tmerc +lat_0=0 +lon_0=121.5 +k=0.9999 +x_0=200000 +y_0=1500000 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / Indonesia TM-3 zone 51.2
<23840> +proj=tmerc +lat_0=0 +lon_0=124.5 +k=0.9999 +x_0=200000 +y_0=1500000 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / Indonesia TM-3 zone 52.1
<23841> +proj=tmerc +lat_0=0 +lon_0=127.5 +k=0.9999 +x_0=200000 +y_0=1500000 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / Indonesia TM-3 zone 52.2
<23842> +proj=tmerc +lat_0=0 +lon_0=130.5 +k=0.9999 +x_0=200000 +y_0=1500000 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / Indonesia TM-3 zone 53.1
<23843> +proj=tmerc +lat_0=0 +lon_0=133.5 +k=0.9999 +x_0=200000 +y_0=1500000 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / Indonesia TM-3 zone 53.2
<23844> +proj=tmerc +lat_0=0 +lon_0=136.5 +k=0.9999 +x_0=200000 +y_0=1500000 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / Indonesia TM-3 zone 54.1
<23845> +proj=tmerc +lat_0=0 +lon_0=139.5 +k=0.9999 +x_0=200000 +y_0=1500000 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ID74 / UTM zone 46N
<23846> +proj=utm +zone=46 +a=6378160 +b=6356774.50408554 +towgs84=-24,-15,5,0,0,0,0 +units=m +no_defs  <>
# ID74 / UTM zone 47N
<23847> +proj=utm +zone=47 +a=6378160 +b=6356774.50408554 +towgs84=-24,-15,5,0,0,0,0 +units=m +no_defs  <>
# ID74 / UTM zone 48N
<23848> +proj=utm +zone=48 +a=6378160 +b=6356774.50408554 +towgs84=-24,-15,5,0,0,0,0 +units=m +no_defs  <>
# ID74 / UTM zone 49N
<23849> +proj=utm +zone=49 +a=6378160 +b=6356774.50408554 +towgs84=-24,-15,5,0,0,0,0 +units=m +no_defs  <>
# ID74 / UTM zone 50N
<23850> +proj=utm +zone=50 +a=6378160 +b=6356774.50408554 +towgs84=-24,-15,5,0,0,0,0 +units=m +no_defs  <>
# ID74 / UTM zone 51N
<23851> +proj=utm +zone=51 +a=6378160 +b=6356774.50408554 +towgs84=-24,-15,5,0,0,0,0 +units=m +no_defs  <>
# ID74 / UTM zone 52N
<23852> +proj=utm +zone=52 +a=6378160 +b=6356774.50408554 +towgs84=-24,-15,5,0,0,0,0 +units=m +no_defs  <>
# ID74 / UTM zone 53N (deprecated)
<23853> +proj=utm +zone=53 +a=6378160 +b=6356774.50408554 +towgs84=-24,-15,5,0,0,0,0 +units=m +no_defs  <>
# DGN95 / UTM zone 46N
<23866> +proj=utm +zone=46 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / UTM zone 47N
<23867> +proj=utm +zone=47 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / UTM zone 48N
<23868> +proj=utm +zone=48 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / UTM zone 49N
<23869> +proj=utm +zone=49 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / UTM zone 50N
<23870> +proj=utm +zone=50 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / UTM zone 51N
<23871> +proj=utm +zone=51 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / UTM zone 52N
<23872> +proj=utm +zone=52 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / UTM zone 47S
<23877> +proj=utm +zone=47 +south +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / UTM zone 48S
<23878> +proj=utm +zone=48 +south +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / UTM zone 49S
<23879> +proj=utm +zone=49 +south +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / UTM zone 50S
<23880> +proj=utm +zone=50 +south +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / UTM zone 51S
<23881> +proj=utm +zone=51 +south +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / UTM zone 52S
<23882> +proj=utm +zone=52 +south +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / UTM zone 53S
<23883> +proj=utm +zone=53 +south +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# DGN95 / UTM zone 54S
<23884> +proj=utm +zone=54 +south +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ID74 / UTM zone 46S (deprecated)
<23886> +proj=utm +zone=46 +south +a=6378160 +b=6356774.50408554 +towgs84=-24,-15,5,0,0,0,0 +units=m +no_defs  <>
# ID74 / UTM zone 47S
<23887> +proj=utm +zone=47 +south +a=6378160 +b=6356774.50408554 +towgs84=-24,-15,5,0,0,0,0 +units=m +no_defs  <>
# ID74 / UTM zone 48S
<23888> +proj=utm +zone=48 +south +a=6378160 +b=6356774.50408554 +towgs84=-24,-15,5,0,0,0,0 +units=m +no_defs  <>
# ID74 / UTM zone 49S
<23889> +proj=utm +zone=49 +south +a=6378160 +b=6356774.50408554 +towgs84=-24,-15,5,0,0,0,0 +units=m +no_defs  <>
# ID74 / UTM zone 50S
<23890> +proj=utm +zone=50 +south +a=6378160 +b=6356774.50408554 +towgs84=-24,-15,5,0,0,0,0 +units=m +no_defs  <>
# ID74 / UTM zone 51S
<23891> +proj=utm +zone=51 +south +a=6378160 +b=6356774.50408554 +towgs84=-24,-15,5,0,0,0,0 +units=m +no_defs  <>
# ID74 / UTM zone 52S
<23892> +proj=utm +zone=52 +south +a=6378160 +b=6356774.50408554 +towgs84=-24,-15,5,0,0,0,0 +units=m +no_defs  <>
# ID74 / UTM zone 53S
<23893> +proj=utm +zone=53 +south +a=6378160 +b=6356774.50408554 +towgs84=-24,-15,5,0,0,0,0 +units=m +no_defs  <>
# ID74 / UTM zone 54S
<23894> +proj=utm +zone=54 +south +a=6378160 +b=6356774.50408554 +towgs84=-24,-15,5,0,0,0,0 +units=m +no_defs  <>
# Indian 1954 / UTM zone 46N
<23946> +proj=utm +zone=46 +a=6377276.345 +b=6356075.41314024 +towgs84=217,823,299,0,0,0,0 +units=m +no_defs  <>
# Indian 1954 / UTM zone 47N
<23947> +proj=utm +zone=47 +a=6377276.345 +b=6356075.41314024 +towgs84=217,823,299,0,0,0,0 +units=m +no_defs  <>
# Indian 1954 / UTM zone 48N
<23948> +proj=utm +zone=48 +a=6377276.345 +b=6356075.41314024 +towgs84=217,823,299,0,0,0,0 +units=m +no_defs  <>
# Indian 1975 / UTM zone 47N
<24047> +proj=utm +zone=47 +a=6377276.345 +b=6356075.41314024 +towgs84=210,814,289,0,0,0,0 +units=m +no_defs  <>
# Indian 1975 / UTM zone 48N
<24048> +proj=utm +zone=48 +a=6377276.345 +b=6356075.41314024 +towgs84=210,814,289,0,0,0,0 +units=m +no_defs  <>
# Jamaica 1875 / Jamaica (Old Grid)
<24100> +proj=lcc +lat_1=18 +lat_0=18 +lon_0=-77 +k_0=1 +x_0=167638.49597 +y_0=121918.90616 +a=6378249.144808011 +b=6356514.966204134 +to_meter=0.3047972654 +no_defs  <>
# JAD69 / Jamaica National Grid
<24200> +proj=lcc +lat_1=18 +lat_0=18 +lon_0=-77 +k_0=1 +x_0=250000 +y_0=150000 +ellps=clrk66 +towgs84=70,207,389.5,0,0,0,0 +units=m +no_defs  <>
# Kalianpur 1937 / UTM zone 45N
<24305> +proj=utm +zone=45 +a=6377276.345 +b=6356075.41314024 +towgs84=214,804,268,0,0,0,0 +units=m +no_defs  <>
# Kalianpur 1937 / UTM zone 46N
<24306> +proj=utm +zone=46 +a=6377276.345 +b=6356075.41314024 +towgs84=214,804,268,0,0,0,0 +units=m +no_defs  <>
# Kalianpur 1962 / UTM zone 41N
<24311> +proj=utm +zone=41 +a=6377301.243 +b=6356100.230165384 +towgs84=283,682,231,0,0,0,0 +units=m +no_defs  <>
# Kalianpur 1962 / UTM zone 42N
<24312> +proj=utm +zone=42 +a=6377301.243 +b=6356100.230165384 +towgs84=283,682,231,0,0,0,0 +units=m +no_defs  <>
# Kalianpur 1962 / UTM zone 43N
<24313> +proj=utm +zone=43 +a=6377301.243 +b=6356100.230165384 +towgs84=283,682,231,0,0,0,0 +units=m +no_defs  <>
# Kalianpur 1975 / UTM zone 42N
<24342> +proj=utm +zone=42 +a=6377299.151 +b=6356098.145120132 +towgs84=295,736,257,0,0,0,0 +units=m +no_defs  <>
# Kalianpur 1975 / UTM zone 43N
<24343> +proj=utm +zone=43 +a=6377299.151 +b=6356098.145120132 +towgs84=295,736,257,0,0,0,0 +units=m +no_defs  <>
# Kalianpur 1975 / UTM zone 44N
<24344> +proj=utm +zone=44 +a=6377299.151 +b=6356098.145120132 +towgs84=295,736,257,0,0,0,0 +units=m +no_defs  <>
# Kalianpur 1975 / UTM zone 45N
<24345> +proj=utm +zone=45 +a=6377299.151 +b=6356098.145120132 +towgs84=295,736,257,0,0,0,0 +units=m +no_defs  <>
# Kalianpur 1975 / UTM zone 46N
<24346> +proj=utm +zone=46 +a=6377299.151 +b=6356098.145120132 +towgs84=295,736,257,0,0,0,0 +units=m +no_defs  <>
# Kalianpur 1975 / UTM zone 47N
<24347> +proj=utm +zone=47 +a=6377299.151 +b=6356098.145120132 +towgs84=295,736,257,0,0,0,0 +units=m +no_defs  <>
# Kalianpur 1880 / India zone 0
<24370> +proj=lcc +lat_1=39.5 +lat_0=39.5 +lon_0=68 +k_0=0.99846154 +x_0=2153865.73916853 +y_0=2368292.194628102 +a=6377299.36559538 +b=6356098.359005156 +to_meter=0.9143985307444408 +no_defs  <>
# Kalianpur 1880 / India zone I
<24371> +proj=lcc +lat_1=32.5 +lat_0=32.5 +lon_0=68 +k_0=0.99878641 +x_0=2743195.592233322 +y_0=914398.5307444407 +a=6377299.36559538 +b=6356098.359005156 +to_meter=0.9143985307444408 +no_defs  <>
# Kalianpur 1880 / India zone IIa
<24372> +proj=lcc +lat_1=26 +lat_0=26 +lon_0=74 +k_0=0.99878641 +x_0=2743195.592233322 +y_0=914398.5307444407 +a=6377299.36559538 +b=6356098.359005156 +to_meter=0.9143985307444408 +no_defs  <>
# Kalianpur 1880 / India zone IIIa
<24373> +proj=lcc +lat_1=19 +lat_0=19 +lon_0=80 +k_0=0.99878641 +x_0=2743195.592233322 +y_0=914398.5307444407 +a=6377299.36559538 +b=6356098.359005156 +to_meter=0.9143985307444408 +no_defs  <>
# Kalianpur 1880 / India zone IVa
<24374> +proj=lcc +lat_1=12 +lat_0=12 +lon_0=80 +k_0=0.99878641 +x_0=2743195.592233322 +y_0=914398.5307444407 +a=6377299.36559538 +b=6356098.359005156 +to_meter=0.9143985307444408 +no_defs  <>
# Kalianpur 1937 / India zone IIb
<24375> +proj=lcc +lat_1=26 +lat_0=26 +lon_0=90 +k_0=0.99878641 +x_0=2743185.69 +y_0=914395.23 +a=6377276.345 +b=6356075.41314024 +towgs84=214,804,268,0,0,0,0 +units=m +no_defs  <>
# Kalianpur 1962 / India zone I
<24376> +proj=lcc +lat_1=32.5 +lat_0=32.5 +lon_0=68 +k_0=0.99878641 +x_0=2743196.4 +y_0=914398.8 +a=6377301.243 +b=6356100.230165384 +towgs84=283,682,231,0,0,0,0 +units=m +no_defs  <>
# Kalianpur 1962 / India zone IIa
<24377> +proj=lcc +lat_1=26 +lat_0=26 +lon_0=74 +k_0=0.99878641 +x_0=2743196.4 +y_0=914398.8 +a=6377301.243 +b=6356100.230165384 +towgs84=283,682,231,0,0,0,0 +units=m +no_defs  <>
# Kalianpur 1975 / India zone I
<24378> +proj=lcc +lat_1=32.5 +lat_0=32.5 +lon_0=68 +k_0=0.99878641 +x_0=2743195.5 +y_0=914398.5 +a=6377299.151 +b=6356098.145120132 +towgs84=295,736,257,0,0,0,0 +units=m +no_defs  <>
# Kalianpur 1975 / India zone IIa
<24379> +proj=lcc +lat_1=26 +lat_0=26 +lon_0=74 +k_0=0.99878641 +x_0=2743195.5 +y_0=914398.5 +a=6377299.151 +b=6356098.145120132 +towgs84=295,736,257,0,0,0,0 +units=m +no_defs  <>
# Kalianpur 1975 / India zone IIb
<24380> +proj=lcc +lat_1=26 +lat_0=26 +lon_0=90 +k_0=0.99878641 +x_0=2743195.5 +y_0=914398.5 +a=6377299.151 +b=6356098.145120132 +towgs84=295,736,257,0,0,0,0 +units=m +no_defs  <>
# Kalianpur 1975 / India zone IIIa
<24381> +proj=lcc +lat_1=19 +lat_0=19 +lon_0=80 +k_0=0.99878641 +x_0=2743195.5 +y_0=914398.5 +a=6377299.151 +b=6356098.145120132 +towgs84=295,736,257,0,0,0,0 +units=m +no_defs  <>
# Kalianpur 1880 / India zone IIb
<24382> +proj=lcc +lat_1=26 +lat_0=26 +lon_0=90 +k_0=0.99878641 +x_0=2743195.592233322 +y_0=914398.5307444407 +a=6377299.36559538 +b=6356098.359005156 +to_meter=0.9143985307444408 +no_defs  <>
# Kalianpur 1975 / India zone IVa
<24383> +proj=lcc +lat_1=12 +lat_0=12 +lon_0=80 +k_0=0.99878641 +x_0=2743195.5 +y_0=914398.5 +a=6377299.151 +b=6356098.145120132 +towgs84=295,736,257,0,0,0,0 +units=m +no_defs  <>
# Kertau 1968 / Singapore Grid
<24500> +proj=cass +lat_0=1.287646666666667 +lon_0=103.8530022222222 +x_0=30000 +y_0=30000 +a=6377304.063 +b=6356103.038993155 +towgs84=-11,851,5,0,0,0,0 +units=m +no_defs  <>
# Kertau 1968 / UTM zone 47N
<24547> +proj=utm +zone=47 +a=6377304.063 +b=6356103.038993155 +towgs84=-11,851,5,0,0,0,0 +units=m +no_defs  <>
# Kertau 1968 / UTM zone 48N
<24548> +proj=utm +zone=48 +a=6377304.063 +b=6356103.038993155 +towgs84=-11,851,5,0,0,0,0 +units=m +no_defs  <>
# Kertau / R.S.O. Malaya (ch) (deprecated)
<24571> +proj=omerc +lat_0=4 +lonc=102.25 +alpha=323.0257905 +k=0.99984 +x_0=804671.2997750348 +y_0=0 +no_uoff +gamma=323.1301023611111 +a=6377304.063 +b=6356103.038993155 +towgs84=-11,851,5,0,0,0,0 +to_meter=20.11678249437587 +no_defs  <>
# KOC Lambert
<24600> +proj=lcc +lat_1=32.5 +lat_0=32.5 +lon_0=45 +k_0=0.9987864078000001 +x_0=1500000 +y_0=1166200 +ellps=clrk80 +towgs84=-294.7,-200.1,525.5,0,0,0,0 +units=m +no_defs  <>
# La Canoa / UTM zone 18N
<24718> +proj=utm +zone=18 +ellps=intl +towgs84=-273.5,110.6,-357.9,0,0,0,0 +units=m +no_defs  <>
# La Canoa / UTM zone 19N
<24719> +proj=utm +zone=19 +ellps=intl +towgs84=-273.5,110.6,-357.9,0,0,0,0 +units=m +no_defs  <>
# La Canoa / UTM zone 20N
<24720> +proj=utm +zone=20 +ellps=intl +towgs84=-273.5,110.6,-357.9,0,0,0,0 +units=m +no_defs  <>
# PSAD56 / UTM zone 17N
<24817> +proj=utm +zone=17 +ellps=intl +towgs84=-288,175,-376,0,0,0,0 +units=m +no_defs  <>
# PSAD56 / UTM zone 18N
<24818> +proj=utm +zone=18 +ellps=intl +towgs84=-288,175,-376,0,0,0,0 +units=m +no_defs  <>
# PSAD56 / UTM zone 19N
<24819> +proj=utm +zone=19 +ellps=intl +towgs84=-288,175,-376,0,0,0,0 +units=m +no_defs  <>
# PSAD56 / UTM zone 20N
<24820> +proj=utm +zone=20 +ellps=intl +towgs84=-288,175,-376,0,0,0,0 +units=m +no_defs  <>
# PSAD56 / UTM zone 21N
<24821> +proj=utm +zone=21 +ellps=intl +towgs84=-288,175,-376,0,0,0,0 +units=m +no_defs  <>
# PSAD56 / UTM zone 17S
<24877> +proj=utm +zone=17 +south +ellps=intl +towgs84=-288,175,-376,0,0,0,0 +units=m +no_defs  <>
# PSAD56 / UTM zone 18S
<24878> +proj=utm +zone=18 +south +ellps=intl +towgs84=-288,175,-376,0,0,0,0 +units=m +no_defs  <>
# PSAD56 / UTM zone 19S
<24879> +proj=utm +zone=19 +south +ellps=intl +towgs84=-288,175,-376,0,0,0,0 +units=m +no_defs  <>
# PSAD56 / UTM zone 20S
<24880> +proj=utm +zone=20 +south +ellps=intl +towgs84=-288,175,-376,0,0,0,0 +units=m +no_defs  <>
# PSAD56 / UTM zone 21S
<24881> +proj=utm +zone=21 +south +ellps=intl +towgs84=-288,175,-376,0,0,0,0 +units=m +no_defs  <>
# PSAD56 / UTM zone 22S
<24882> +proj=utm +zone=22 +south +ellps=intl +towgs84=-288,175,-376,0,0,0,0 +units=m +no_defs  <>
# PSAD56 / Peru west zone
<24891> +proj=tmerc +lat_0=-6 +lon_0=-80.5 +k=0.99983008 +x_0=222000 +y_0=1426834.743 +ellps=intl +towgs84=-288,175,-376,0,0,0,0 +units=m +no_defs  <>
# PSAD56 / Peru central zone
<24892> +proj=tmerc +lat_0=-9.5 +lon_0=-76 +k=0.99932994 +x_0=720000 +y_0=1039979.159 +ellps=intl +towgs84=-288,175,-376,0,0,0,0 +units=m +no_defs  <>
# PSAD56 / Peru east zone
<24893> +proj=tmerc +lat_0=-9.5 +lon_0=-70.5 +k=0.99952992 +x_0=1324000 +y_0=1040084.558 +ellps=intl +towgs84=-288,175,-376,0,0,0,0 +units=m +no_defs  <>
# Leigon / Ghana Metre Grid
<25000> +proj=tmerc +lat_0=4.666666666666667 +lon_0=-1 +k=0.99975 +x_0=274319.51 +y_0=0 +ellps=clrk80 +towgs84=-130,29,364,0,0,0,0 +units=m +no_defs  <>
# Lome / UTM zone 31N
<25231> +proj=utm +zone=31 +a=6378249.2 +b=6356515 +units=m +no_defs  <>
# Luzon 1911 / Philippines zone I
<25391> +proj=tmerc +lat_0=0 +lon_0=117 +k=0.99995 +x_0=500000 +y_0=0 +ellps=clrk66 +towgs84=-133,-77,-51,0,0,0,0 +units=m +no_defs  <>
# Luzon 1911 / Philippines zone II
<25392> +proj=tmerc +lat_0=0 +lon_0=119 +k=0.99995 +x_0=500000 +y_0=0 +ellps=clrk66 +towgs84=-133,-77,-51,0,0,0,0 +units=m +no_defs  <>
# Luzon 1911 / Philippines zone III
<25393> +proj=tmerc +lat_0=0 +lon_0=121 +k=0.99995 +x_0=500000 +y_0=0 +ellps=clrk66 +towgs84=-133,-77,-51,0,0,0,0 +units=m +no_defs  <>
# Luzon 1911 / Philippines zone IV
<25394> +proj=tmerc +lat_0=0 +lon_0=123 +k=0.99995 +x_0=500000 +y_0=0 +ellps=clrk66 +towgs84=-133,-77,-51,0,0,0,0 +units=m +no_defs  <>
# Luzon 1911 / Philippines zone V
<25395> +proj=tmerc +lat_0=0 +lon_0=125 +k=0.99995 +x_0=500000 +y_0=0 +ellps=clrk66 +towgs84=-133,-77,-51,0,0,0,0 +units=m +no_defs  <>
# Makassar (Jakarta) / NEIEZ (deprecated)
<25700> +proj=merc +lon_0=110 +k=0.997 +x_0=3900000 +y_0=900000 +ellps=bessel +towgs84=-587.8,519.75,145.76,0,0,0,0 +pm=jakarta +units=m +no_defs  <>
# ETRS89 / UTM zone 28N
<25828> +proj=utm +zone=28 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 29N
<25829> +proj=utm +zone=29 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 30N
<25830> +proj=utm +zone=30 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 31N
<25831> +proj=utm +zone=31 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 32N
<25832> +proj=utm +zone=32 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 33N
<25833> +proj=utm +zone=33 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 34N
<25834> +proj=utm +zone=34 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 35N
<25835> +proj=utm +zone=35 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 36N
<25836> +proj=utm +zone=36 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 37N
<25837> +proj=utm +zone=37 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / UTM zone 38N (deprecated)
<25838> +proj=utm +zone=38 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# ETRS89 / TM Baltic93
<25884> +proj=tmerc +lat_0=0 +lon_0=24 +k=0.9996 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Malongo 1987 / UTM zone 32S
<25932> +proj=utm +zone=32 +south +ellps=intl +towgs84=-254.1,-5.36,-100.29,0,0,0,0 +units=m +no_defs  <>
# Merchich / Nord Maroc
<26191> +proj=lcc +lat_1=33.3 +lat_0=33.3 +lon_0=-5.4 +k_0=0.999625769 +x_0=500000 +y_0=300000 +a=6378249.2 +b=6356515 +towgs84=31,146,47,0,0,0,0 +units=m +no_defs  <>
# Merchich / Sud Maroc
<26192> +proj=lcc +lat_1=29.7 +lat_0=29.7 +lon_0=-5.4 +k_0=0.9996155960000001 +x_0=500000 +y_0=300000 +a=6378249.2 +b=6356515 +towgs84=31,146,47,0,0,0,0 +units=m +no_defs  <>
# Merchich / Sahara (deprecated)
<26193> +proj=lcc +lat_1=26.1 +lat_0=26.1 +lon_0=-5.4 +k_0=0.9996 +x_0=1200000 +y_0=400000 +a=6378249.2 +b=6356515 +towgs84=31,146,47,0,0,0,0 +units=m +no_defs  <>
# Merchich / Sahara Nord
<26194> +proj=lcc +lat_1=26.1 +lat_0=26.1 +lon_0=-5.4 +k_0=0.999616304 +x_0=1200000 +y_0=400000 +a=6378249.2 +b=6356515 +towgs84=31,146,47,0,0,0,0 +units=m +no_defs  <>
# Merchich / Sahara Sud
<26195> +proj=lcc +lat_1=22.5 +lat_0=22.5 +lon_0=-5.4 +k_0=0.999616437 +x_0=1500000 +y_0=400000 +a=6378249.2 +b=6356515 +towgs84=31,146,47,0,0,0,0 +units=m +no_defs  <>
# Massawa / UTM zone 37N
<26237> +proj=utm +zone=37 +ellps=bessel +towgs84=639,405,60,0,0,0,0 +units=m +no_defs  <>
# Minna / UTM zone 31N
<26331> +proj=utm +zone=31 +ellps=clrk80 +towgs84=-92,-93,122,0,0,0,0 +units=m +no_defs  <>
# Minna / UTM zone 32N
<26332> +proj=utm +zone=32 +ellps=clrk80 +towgs84=-92,-93,122,0,0,0,0 +units=m +no_defs  <>
# Minna / Nigeria West Belt
<26391> +proj=tmerc +lat_0=4 +lon_0=4.5 +k=0.99975 +x_0=230738.26 +y_0=0 +ellps=clrk80 +towgs84=-92,-93,122,0,0,0,0 +units=m +no_defs  <>
# Minna / Nigeria Mid Belt
<26392> +proj=tmerc +lat_0=4 +lon_0=8.5 +k=0.99975 +x_0=670553.98 +y_0=0 +ellps=clrk80 +towgs84=-92,-93,122,0,0,0,0 +units=m +no_defs  <>
# Minna / Nigeria East Belt
<26393> +proj=tmerc +lat_0=4 +lon_0=12.5 +k=0.99975 +x_0=1110369.7 +y_0=0 +ellps=clrk80 +towgs84=-92,-93,122,0,0,0,0 +units=m +no_defs  <>
# Mhast / UTM zone 32S (deprecated)
<26432> +proj=utm +zone=32 +south +ellps=intl +towgs84=-252.95,-4.11,-96.38,0,0,0,0 +units=m +no_defs  <>
# Monte Mario (Rome) / Italy zone 1 (deprecated)
<26591> +proj=tmerc +lat_0=0 +lon_0=-3.45233333333333 +k=0.9996 +x_0=1500000 +y_0=0 +ellps=intl +towgs84=-104.1,-49.1,-9.9,0.971,-2.917,0.714,-11.68 +pm=rome +units=m +no_defs  <>
# Monte Mario (Rome) / Italy zone 2 (deprecated)
<26592> +proj=tmerc +lat_0=0 +lon_0=2.54766666666666 +k=0.9996 +x_0=2520000 +y_0=0 +ellps=intl +towgs84=-104.1,-49.1,-9.9,0.971,-2.917,0.714,-11.68 +pm=rome +units=m +no_defs  <>
# M'poraloko / UTM zone 32N
<26632> +proj=utm +zone=32 +a=6378249.2 +b=6356515 +towgs84=-74,-130,42,0,0,0,0 +units=m +no_defs  <>
# M'poraloko / UTM zone 32S
<26692> +proj=utm +zone=32 +south +a=6378249.2 +b=6356515 +towgs84=-74,-130,42,0,0,0,0 +units=m +no_defs  <>
# NAD27 / UTM zone 1N
<26701> +proj=utm +zone=1 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / UTM zone 2N
<26702> +proj=utm +zone=2 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / UTM zone 3N
<26703> +proj=utm +zone=3 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / UTM zone 4N
<26704> +proj=utm +zone=4 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / UTM zone 5N
<26705> +proj=utm +zone=5 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / UTM zone 6N
<26706> +proj=utm +zone=6 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / UTM zone 7N
<26707> +proj=utm +zone=7 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / UTM zone 8N
<26708> +proj=utm +zone=8 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / UTM zone 9N
<26709> +proj=utm +zone=9 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / UTM zone 10N
<26710> +proj=utm +zone=10 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / UTM zone 11N
<26711> +proj=utm +zone=11 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / UTM zone 12N
<26712> +proj=utm +zone=12 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / UTM zone 13N
<26713> +proj=utm +zone=13 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / UTM zone 14N
<26714> +proj=utm +zone=14 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / UTM zone 15N
<26715> +proj=utm +zone=15 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / UTM zone 16N
<26716> +proj=utm +zone=16 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / UTM zone 17N
<26717> +proj=utm +zone=17 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / UTM zone 18N
<26718> +proj=utm +zone=18 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / UTM zone 19N
<26719> +proj=utm +zone=19 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / UTM zone 20N
<26720> +proj=utm +zone=20 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / UTM zone 21N
<26721> +proj=utm +zone=21 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / UTM zone 22N
<26722> +proj=utm +zone=22 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / Alabama East
<26729> +proj=tmerc +lat_0=30.5 +lon_0=-85.83333333333333 +k=0.99996 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Alabama West
<26730> +proj=tmerc +lat_0=30 +lon_0=-87.5 +k=0.999933333 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Alaska zone 1
<26731> +proj=omerc +lat_0=57 +lonc=-133.6666666666667 +alpha=323.1301023611111 +k=0.9999 +x_0=5000000.001016002 +y_0=-5000000.001016002 +no_uoff +gamma=323.1301023611111 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Alaska zone 2
<26732> +proj=tmerc +lat_0=54 +lon_0=-142 +k=0.9999 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Alaska zone 3
<26733> +proj=tmerc +lat_0=54 +lon_0=-146 +k=0.9999 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Alaska zone 4
<26734> +proj=tmerc +lat_0=54 +lon_0=-150 +k=0.9999 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Alaska zone 5
<26735> +proj=tmerc +lat_0=54 +lon_0=-154 +k=0.9999 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Alaska zone 6
<26736> +proj=tmerc +lat_0=54 +lon_0=-158 +k=0.9999 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Alaska zone 7
<26737> +proj=tmerc +lat_0=54 +lon_0=-162 +k=0.9999 +x_0=213360.4267208534 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Alaska zone 8
<26738> +proj=tmerc +lat_0=54 +lon_0=-166 +k=0.9999 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Alaska zone 9
<26739> +proj=tmerc +lat_0=54 +lon_0=-170 +k=0.9999 +x_0=182880.3657607315 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Alaska zone 10
<26740> +proj=lcc +lat_1=53.83333333333334 +lat_2=51.83333333333334 +lat_0=51 +lon_0=-176 +x_0=914401.8288036576 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / California zone I
<26741> +proj=lcc +lat_1=41.66666666666666 +lat_2=40 +lat_0=39.33333333333334 +lon_0=-122 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / California zone II
<26742> +proj=lcc +lat_1=39.83333333333334 +lat_2=38.33333333333334 +lat_0=37.66666666666666 +lon_0=-122 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / California zone III
<26743> +proj=lcc +lat_1=38.43333333333333 +lat_2=37.06666666666667 +lat_0=36.5 +lon_0=-120.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / California zone IV
<26744> +proj=lcc +lat_1=37.25 +lat_2=36 +lat_0=35.33333333333334 +lon_0=-119 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / California zone V
<26745> +proj=lcc +lat_1=35.46666666666667 +lat_2=34.03333333333333 +lat_0=33.5 +lon_0=-118 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / California zone VI
<26746> +proj=lcc +lat_1=33.88333333333333 +lat_2=32.78333333333333 +lat_0=32.16666666666666 +lon_0=-116.25 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / California zone VII (deprecated)
<26747> +proj=lcc +lat_1=34.41666666666666 +lat_2=33.86666666666667 +lat_0=34.13333333333333 +lon_0=-118.3333333333333 +x_0=1276106.450596901 +y_0=127079.524511049 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Arizona East
<26748> +proj=tmerc +lat_0=31 +lon_0=-110.1666666666667 +k=0.9999 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Arizona Central
<26749> +proj=tmerc +lat_0=31 +lon_0=-111.9166666666667 +k=0.9999 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Arizona West
<26750> +proj=tmerc +lat_0=31 +lon_0=-113.75 +k=0.999933333 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Arkansas North
<26751> +proj=lcc +lat_1=36.23333333333333 +lat_2=34.93333333333333 +lat_0=34.33333333333334 +lon_0=-92 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Arkansas South
<26752> +proj=lcc +lat_1=34.76666666666667 +lat_2=33.3 +lat_0=32.66666666666666 +lon_0=-92 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Colorado North
<26753> +proj=lcc +lat_1=39.71666666666667 +lat_2=40.78333333333333 +lat_0=39.33333333333334 +lon_0=-105.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Colorado Central
<26754> +proj=lcc +lat_1=39.75 +lat_2=38.45 +lat_0=37.83333333333334 +lon_0=-105.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Colorado South
<26755> +proj=lcc +lat_1=38.43333333333333 +lat_2=37.23333333333333 +lat_0=36.66666666666666 +lon_0=-105.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Connecticut
<26756> +proj=lcc +lat_1=41.86666666666667 +lat_2=41.2 +lat_0=40.83333333333334 +lon_0=-72.75 +x_0=182880.3657607315 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Delaware
<26757> +proj=tmerc +lat_0=38 +lon_0=-75.41666666666667 +k=0.999995 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Florida East
<26758> +proj=tmerc +lat_0=24.33333333333333 +lon_0=-81 +k=0.999941177 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Florida West
<26759> +proj=tmerc +lat_0=24.33333333333333 +lon_0=-82 +k=0.999941177 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Florida North
<26760> +proj=lcc +lat_1=30.75 +lat_2=29.58333333333333 +lat_0=29 +lon_0=-84.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Georgia East
<26766> +proj=tmerc +lat_0=30 +lon_0=-82.16666666666667 +k=0.9999 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Georgia West
<26767> +proj=tmerc +lat_0=30 +lon_0=-84.16666666666667 +k=0.9999 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Idaho East
<26768> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-112.1666666666667 +k=0.9999473679999999 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Idaho Central
<26769> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-114 +k=0.9999473679999999 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Idaho West
<26770> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-115.75 +k=0.999933333 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Illinois East
<26771> +proj=tmerc +lat_0=36.66666666666666 +lon_0=-88.33333333333333 +k=0.9999749999999999 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Illinois West
<26772> +proj=tmerc +lat_0=36.66666666666666 +lon_0=-90.16666666666667 +k=0.999941177 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Indiana East
<26773> +proj=tmerc +lat_0=37.5 +lon_0=-85.66666666666667 +k=0.999966667 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Indiana West
<26774> +proj=tmerc +lat_0=37.5 +lon_0=-87.08333333333333 +k=0.999966667 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Iowa North
<26775> +proj=lcc +lat_1=43.26666666666667 +lat_2=42.06666666666667 +lat_0=41.5 +lon_0=-93.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Iowa South
<26776> +proj=lcc +lat_1=41.78333333333333 +lat_2=40.61666666666667 +lat_0=40 +lon_0=-93.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Kansas North
<26777> +proj=lcc +lat_1=39.78333333333333 +lat_2=38.71666666666667 +lat_0=38.33333333333334 +lon_0=-98 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Kansas South
<26778> +proj=lcc +lat_1=38.56666666666667 +lat_2=37.26666666666667 +lat_0=36.66666666666666 +lon_0=-98.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Kentucky North
<26779> +proj=lcc +lat_1=37.96666666666667 +lat_2=38.96666666666667 +lat_0=37.5 +lon_0=-84.25 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Kentucky South
<26780> +proj=lcc +lat_1=36.73333333333333 +lat_2=37.93333333333333 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Louisiana North
<26781> +proj=lcc +lat_1=31.16666666666667 +lat_2=32.66666666666666 +lat_0=30.66666666666667 +lon_0=-92.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Louisiana South
<26782> +proj=lcc +lat_1=29.3 +lat_2=30.7 +lat_0=28.66666666666667 +lon_0=-91.33333333333333 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Maine East
<26783> +proj=tmerc +lat_0=43.83333333333334 +lon_0=-68.5 +k=0.9999 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Maine West
<26784> +proj=tmerc +lat_0=42.83333333333334 +lon_0=-70.16666666666667 +k=0.999966667 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Maryland
<26785> +proj=lcc +lat_1=38.3 +lat_2=39.45 +lat_0=37.83333333333334 +lon_0=-77 +x_0=243840.4876809754 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Massachusetts Mainland
<26786> +proj=lcc +lat_1=41.71666666666667 +lat_2=42.68333333333333 +lat_0=41 +lon_0=-71.5 +x_0=182880.3657607315 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Massachusetts Island
<26787> +proj=lcc +lat_1=41.28333333333333 +lat_2=41.48333333333333 +lat_0=41 +lon_0=-70.5 +x_0=60960.12192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Minnesota North
<26791> +proj=lcc +lat_1=47.03333333333333 +lat_2=48.63333333333333 +lat_0=46.5 +lon_0=-93.09999999999999 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Minnesota Central
<26792> +proj=lcc +lat_1=45.61666666666667 +lat_2=47.05 +lat_0=45 +lon_0=-94.25 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Minnesota South
<26793> +proj=lcc +lat_1=43.78333333333333 +lat_2=45.21666666666667 +lat_0=43 +lon_0=-94 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Mississippi East
<26794> +proj=tmerc +lat_0=29.66666666666667 +lon_0=-88.83333333333333 +k=0.99996 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Mississippi West
<26795> +proj=tmerc +lat_0=30.5 +lon_0=-90.33333333333333 +k=0.999941177 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Missouri East
<26796> +proj=tmerc +lat_0=35.83333333333334 +lon_0=-90.5 +k=0.999933333 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Missouri Central
<26797> +proj=tmerc +lat_0=35.83333333333334 +lon_0=-92.5 +k=0.999933333 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Missouri West
<26798> +proj=tmerc +lat_0=36.16666666666666 +lon_0=-94.5 +k=0.999941177 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / California zone VII
<26799> +proj=lcc +lat_1=34.41666666666666 +lat_2=33.86666666666667 +lat_0=34.13333333333333 +lon_0=-118.3333333333333 +x_0=1276106.450596901 +y_0=1268253.006858014 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD Michigan / Michigan East (deprecated)
<26801> +proj=tmerc +lat_0=41.5 +lon_0=-83.66666666666667 +k=0.999942857 +x_0=152400.3048006096 +y_0=0 +a=6378450.047548896 +b=6356826.621488444 +units=us-ft +no_defs  <>
# NAD Michigan / Michigan Old Central (deprecated)
<26802> +proj=tmerc +lat_0=41.5 +lon_0=-85.75 +k=0.999909091 +x_0=152400.3048006096 +y_0=0 +a=6378450.047548896 +b=6356826.621488444 +units=us-ft +no_defs  <>
# NAD Michigan / Michigan West (deprecated)
<26803> +proj=tmerc +lat_0=41.5 +lon_0=-88.75 +k=0.999909091 +x_0=152400.3048006096 +y_0=0 +a=6378450.047548896 +b=6356826.621488444 +units=us-ft +no_defs  <>
# NAD Michigan / Michigan North (deprecated)
<26811> +proj=lcc +lat_1=45.48333333333333 +lat_2=47.08333333333334 +lat_0=44.78333333333333 +lon_0=-87 +x_0=609601.2192024384 +y_0=0 +a=6378450.047548896 +b=6356826.621488444 +units=us-ft +no_defs  <>
# NAD Michigan / Michigan Central (deprecated)
<26812> +proj=lcc +lat_1=44.18333333333333 +lat_2=45.7 +lat_0=43.31666666666667 +lon_0=-84.33333333333333 +x_0=609601.2192024384 +y_0=0 +a=6378450.047548896 +b=6356826.621488444 +units=us-ft +no_defs  <>
# NAD Michigan / Michigan South (deprecated)
<26813> +proj=lcc +lat_1=42.1 +lat_2=43.66666666666666 +lat_0=41.5 +lon_0=-84.33333333333333 +x_0=609601.2192024384 +y_0=0 +a=6378450.047548896 +b=6356826.621488444 +units=us-ft +no_defs  <>
# NAD83 / Maine East (ftUS) (deprecated)
<26814> +proj=tmerc +lat_0=43.66666666666666 +lon_0=-68.5 +k=0.9999 +x_0=300000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Maine West (ftUS) (deprecated)
<26815> +proj=tmerc +lat_0=42.83333333333334 +lon_0=-70.16666666666667 +k=0.999966667 +x_0=900000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Minnesota North (ftUS) (deprecated)
<26819> +proj=lcc +lat_1=48.63333333333333 +lat_2=47.03333333333333 +lat_0=46.5 +lon_0=-93.09999999999999 +x_0=800000.0000101601 +y_0=99999.99998984 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Minnesota Central (ftUS) (deprecated)
<26820> +proj=lcc +lat_1=47.05 +lat_2=45.61666666666667 +lat_0=45 +lon_0=-94.25 +x_0=800000.0000101601 +y_0=99999.99998984 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Minnesota South (ftUS) (deprecated)
<26821> +proj=lcc +lat_1=45.21666666666667 +lat_2=43.78333333333333 +lat_0=43 +lon_0=-94 +x_0=800000.0000101601 +y_0=99999.99998984 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Nebraska (ftUS) (deprecated)
<26822> +proj=lcc +lat_1=43 +lat_2=40 +lat_0=39.83333333333334 +lon_0=-100 +x_0=500000.0000101601 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / West Virginia North (ftUS) (deprecated)
<26823> +proj=lcc +lat_1=40.25 +lat_2=39 +lat_0=38.5 +lon_0=-79.5 +x_0=1968500 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / West Virginia South (ftUS) (deprecated)
<26824> +proj=lcc +lat_1=38.88333333333333 +lat_2=37.48333333333333 +lat_0=37 +lon_0=-81 +x_0=1968500 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83(HARN) / Maine East (ftUS) (deprecated)
<26825> +proj=tmerc +lat_0=43.66666666666666 +lon_0=-68.5 +k=0.9999 +x_0=300000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Maine West (ftUS) (deprecated)
<26826> +proj=tmerc +lat_0=42.83333333333334 +lon_0=-70.16666666666667 +k=0.999966667 +x_0=900000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Minnesota North (ftUS) (deprecated)
<26830> +proj=lcc +lat_1=48.63333333333333 +lat_2=47.03333333333333 +lat_0=46.5 +lon_0=-93.09999999999999 +x_0=800000.0000101601 +y_0=99999.99998984 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Minnesota Central (ftUS) (deprecated)
<26831> +proj=lcc +lat_1=47.05 +lat_2=45.61666666666667 +lat_0=45 +lon_0=-94.25 +x_0=800000.0000101601 +y_0=99999.99998984 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Minnesota South (ftUS) (deprecated)
<26832> +proj=lcc +lat_1=45.21666666666667 +lat_2=43.78333333333333 +lat_0=43 +lon_0=-94 +x_0=800000.0000101601 +y_0=99999.99998984 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / Nebraska (ftUS) (deprecated)
<26833> +proj=lcc +lat_1=43 +lat_2=40 +lat_0=39.83333333333334 +lon_0=-100 +x_0=500000.0000101601 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / West Virginia North (ftUS) (deprecated)
<26834> +proj=lcc +lat_1=40.25 +lat_2=39 +lat_0=38.5 +lon_0=-79.5 +x_0=1968500 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(HARN) / West Virginia South (ftUS) (deprecated)
<26835> +proj=lcc +lat_1=38.88333333333333 +lat_2=37.48333333333333 +lat_0=37 +lon_0=-81 +x_0=1968500 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Maine East (ftUS) (deprecated)
<26836> +proj=tmerc +lat_0=43.66666666666666 +lon_0=-68.5 +k=0.9999 +x_0=300000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Maine West (ftUS) (deprecated)
<26837> +proj=tmerc +lat_0=42.83333333333334 +lon_0=-70.16666666666667 +k=0.999966667 +x_0=900000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Minnesota North (ftUS) (deprecated)
<26841> +proj=lcc +lat_1=48.63333333333333 +lat_2=47.03333333333333 +lat_0=46.5 +lon_0=-93.09999999999999 +x_0=800000.0000101601 +y_0=99999.99998984 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Minnesota Central (ftUS) (deprecated)
<26842> +proj=lcc +lat_1=47.05 +lat_2=45.61666666666667 +lat_0=45 +lon_0=-94.25 +x_0=800000.0000101601 +y_0=99999.99998984 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Minnesota South (ftUS) (deprecated)
<26843> +proj=lcc +lat_1=45.21666666666667 +lat_2=43.78333333333333 +lat_0=43 +lon_0=-94 +x_0=800000.0000101601 +y_0=99999.99998984 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / Nebraska (ftUS) (deprecated)
<26844> +proj=lcc +lat_1=43 +lat_2=40 +lat_0=39.83333333333334 +lon_0=-100 +x_0=500000.0000101601 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / West Virginia North (ftUS) (deprecated)
<26845> +proj=lcc +lat_1=40.25 +lat_2=39 +lat_0=38.5 +lon_0=-79.5 +x_0=1968500 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(NSRS2007) / West Virginia South (ftUS) (deprecated)
<26846> +proj=lcc +lat_1=38.88333333333333 +lat_2=37.48333333333333 +lat_0=37 +lon_0=-81 +x_0=1968500 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83 / Maine East (ftUS)
<26847> +proj=tmerc +lat_0=43.66666666666666 +lon_0=-68.5 +k=0.9999 +x_0=300000.0000000001 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Maine West (ftUS)
<26848> +proj=tmerc +lat_0=42.83333333333334 +lon_0=-70.16666666666667 +k=0.999966667 +x_0=900000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Minnesota North (ftUS)
<26849> +proj=lcc +lat_1=48.63333333333333 +lat_2=47.03333333333333 +lat_0=46.5 +lon_0=-93.09999999999999 +x_0=800000.0000101599 +y_0=99999.99998983997 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Minnesota Central (ftUS)
<26850> +proj=lcc +lat_1=47.05 +lat_2=45.61666666666667 +lat_0=45 +lon_0=-94.25 +x_0=800000.0000101599 +y_0=99999.99998983997 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Minnesota South (ftUS)
<26851> +proj=lcc +lat_1=45.21666666666667 +lat_2=43.78333333333333 +lat_0=43 +lon_0=-94 +x_0=800000.0000101599 +y_0=99999.99998983997 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / Nebraska (ftUS)
<26852> +proj=lcc +lat_1=43 +lat_2=40 +lat_0=39.83333333333334 +lon_0=-100 +x_0=500000.00001016 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / West Virginia North (ftUS)
<26853> +proj=lcc +lat_1=40.25 +lat_2=39 +lat_0=38.5 +lon_0=-79.5 +x_0=600000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / West Virginia South (ftUS)
<26854> +proj=lcc +lat_1=38.88333333333333 +lat_2=37.48333333333333 +lat_0=37 +lon_0=-81 +x_0=600000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83(HARN) / Maine East (ftUS)
<26855> +proj=tmerc +lat_0=43.66666666666666 +lon_0=-68.5 +k=0.9999 +x_0=300000.0000000001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Maine West (ftUS)
<26856> +proj=tmerc +lat_0=42.83333333333334 +lon_0=-70.16666666666667 +k=0.999966667 +x_0=900000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Minnesota North (ftUS)
<26857> +proj=lcc +lat_1=48.63333333333333 +lat_2=47.03333333333333 +lat_0=46.5 +lon_0=-93.09999999999999 +x_0=800000.0000101599 +y_0=99999.99998983997 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Minnesota Central (ftUS)
<26858> +proj=lcc +lat_1=47.05 +lat_2=45.61666666666667 +lat_0=45 +lon_0=-94.25 +x_0=800000.0000101599 +y_0=99999.99998983997 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Minnesota South (ftUS)
<26859> +proj=lcc +lat_1=45.21666666666667 +lat_2=43.78333333333333 +lat_0=43 +lon_0=-94 +x_0=800000.0000101599 +y_0=99999.99998983997 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / Nebraska (ftUS)
<26860> +proj=lcc +lat_1=43 +lat_2=40 +lat_0=39.83333333333334 +lon_0=-100 +x_0=500000.00001016 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / West Virginia North (ftUS)
<26861> +proj=lcc +lat_1=40.25 +lat_2=39 +lat_0=38.5 +lon_0=-79.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(HARN) / West Virginia South (ftUS)
<26862> +proj=lcc +lat_1=38.88333333333333 +lat_2=37.48333333333333 +lat_0=37 +lon_0=-81 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Maine East (ftUS)
<26863> +proj=tmerc +lat_0=43.66666666666666 +lon_0=-68.5 +k=0.9999 +x_0=300000.0000000001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Maine West (ftUS)
<26864> +proj=tmerc +lat_0=42.83333333333334 +lon_0=-70.16666666666667 +k=0.999966667 +x_0=900000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Minnesota North (ftUS)
<26865> +proj=lcc +lat_1=48.63333333333333 +lat_2=47.03333333333333 +lat_0=46.5 +lon_0=-93.09999999999999 +x_0=800000.0000101599 +y_0=99999.99998983997 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Minnesota Central (ftUS)
<26866> +proj=lcc +lat_1=47.05 +lat_2=45.61666666666667 +lat_0=45 +lon_0=-94.25 +x_0=800000.0000101599 +y_0=99999.99998983997 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Minnesota South (ftUS)
<26867> +proj=lcc +lat_1=45.21666666666667 +lat_2=43.78333333333333 +lat_0=43 +lon_0=-94 +x_0=800000.0000101599 +y_0=99999.99998983997 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / Nebraska (ftUS)
<26868> +proj=lcc +lat_1=43 +lat_2=40 +lat_0=39.83333333333334 +lon_0=-100 +x_0=500000.00001016 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / West Virginia North (ftUS)
<26869> +proj=lcc +lat_1=40.25 +lat_2=39 +lat_0=38.5 +lon_0=-79.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(NSRS2007) / West Virginia South (ftUS)
<26870> +proj=lcc +lat_1=38.88333333333333 +lat_2=37.48333333333333 +lat_0=37 +lon_0=-81 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs  <>
# NAD83(CSRS) / MTM zone 11
<26891> +proj=tmerc +lat_0=0 +lon_0=-82.5 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / MTM zone 12
<26892> +proj=tmerc +lat_0=0 +lon_0=-81 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / MTM zone 13
<26893> +proj=tmerc +lat_0=0 +lon_0=-84 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / MTM zone 14
<26894> +proj=tmerc +lat_0=0 +lon_0=-87 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / MTM zone 15
<26895> +proj=tmerc +lat_0=0 +lon_0=-90 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / MTM zone 16
<26896> +proj=tmerc +lat_0=0 +lon_0=-93 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / MTM zone 17
<26897> +proj=tmerc +lat_0=0 +lon_0=-96 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / MTM zone 1
<26898> +proj=tmerc +lat_0=0 +lon_0=-53 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83(CSRS) / MTM zone 2
<26899> +proj=tmerc +lat_0=0 +lon_0=-56 +k=0.9999 +x_0=304800 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD83 / UTM zone 1N
<26901> +proj=utm +zone=1 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 2N
<26902> +proj=utm +zone=2 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 3N
<26903> +proj=utm +zone=3 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 4N
<26904> +proj=utm +zone=4 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 5N
<26905> +proj=utm +zone=5 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 6N
<26906> +proj=utm +zone=6 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 7N
<26907> +proj=utm +zone=7 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 8N
<26908> +proj=utm +zone=8 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 9N
<26909> +proj=utm +zone=9 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 10N
<26910> +proj=utm +zone=10 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 11N
<26911> +proj=utm +zone=11 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 12N
<26912> +proj=utm +zone=12 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 13N
<26913> +proj=utm +zone=13 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 14N
<26914> +proj=utm +zone=14 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 15N
<26915> +proj=utm +zone=15 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 16N
<26916> +proj=utm +zone=16 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 17N
<26917> +proj=utm +zone=17 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 18N
<26918> +proj=utm +zone=18 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 19N
<26919> +proj=utm +zone=19 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 20N
<26920> +proj=utm +zone=20 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 21N
<26921> +proj=utm +zone=21 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 22N
<26922> +proj=utm +zone=22 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / UTM zone 23N
<26923> +proj=utm +zone=23 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Alabama East
<26929> +proj=tmerc +lat_0=30.5 +lon_0=-85.83333333333333 +k=0.99996 +x_0=200000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Alabama West
<26930> +proj=tmerc +lat_0=30 +lon_0=-87.5 +k=0.999933333 +x_0=600000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Alaska zone 1
<26931> +proj=omerc +lat_0=57 +lonc=-133.6666666666667 +alpha=323.1301023611111 +k=0.9999 +x_0=5000000 +y_0=-5000000 +no_uoff +gamma=323.1301023611111 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Alaska zone 2
<26932> +proj=tmerc +lat_0=54 +lon_0=-142 +k=0.9999 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Alaska zone 3
<26933> +proj=tmerc +lat_0=54 +lon_0=-146 +k=0.9999 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Alaska zone 4
<26934> +proj=tmerc +lat_0=54 +lon_0=-150 +k=0.9999 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Alaska zone 5
<26935> +proj=tmerc +lat_0=54 +lon_0=-154 +k=0.9999 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Alaska zone 6
<26936> +proj=tmerc +lat_0=54 +lon_0=-158 +k=0.9999 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Alaska zone 7
<26937> +proj=tmerc +lat_0=54 +lon_0=-162 +k=0.9999 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Alaska zone 8
<26938> +proj=tmerc +lat_0=54 +lon_0=-166 +k=0.9999 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Alaska zone 9
<26939> +proj=tmerc +lat_0=54 +lon_0=-170 +k=0.9999 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Alaska zone 10
<26940> +proj=lcc +lat_1=53.83333333333334 +lat_2=51.83333333333334 +lat_0=51 +lon_0=-176 +x_0=1000000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / California zone 1
<26941> +proj=lcc +lat_1=41.66666666666666 +lat_2=40 +lat_0=39.33333333333334 +lon_0=-122 +x_0=2000000 +y_0=500000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / California zone 2
<26942> +proj=lcc +lat_1=39.83333333333334 +lat_2=38.33333333333334 +lat_0=37.66666666666666 +lon_0=-122 +x_0=2000000 +y_0=500000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / California zone 3
<26943> +proj=lcc +lat_1=38.43333333333333 +lat_2=37.06666666666667 +lat_0=36.5 +lon_0=-120.5 +x_0=2000000 +y_0=500000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / California zone 4
<26944> +proj=lcc +lat_1=37.25 +lat_2=36 +lat_0=35.33333333333334 +lon_0=-119 +x_0=2000000 +y_0=500000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / California zone 5
<26945> +proj=lcc +lat_1=35.46666666666667 +lat_2=34.03333333333333 +lat_0=33.5 +lon_0=-118 +x_0=2000000 +y_0=500000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / California zone 6
<26946> +proj=lcc +lat_1=33.88333333333333 +lat_2=32.78333333333333 +lat_0=32.16666666666666 +lon_0=-116.25 +x_0=2000000 +y_0=500000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Arizona East
<26948> +proj=tmerc +lat_0=31 +lon_0=-110.1666666666667 +k=0.9999 +x_0=213360 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Arizona Central
<26949> +proj=tmerc +lat_0=31 +lon_0=-111.9166666666667 +k=0.9999 +x_0=213360 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Arizona West
<26950> +proj=tmerc +lat_0=31 +lon_0=-113.75 +k=0.999933333 +x_0=213360 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Arkansas North
<26951> +proj=lcc +lat_1=36.23333333333333 +lat_2=34.93333333333333 +lat_0=34.33333333333334 +lon_0=-92 +x_0=400000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Arkansas South
<26952> +proj=lcc +lat_1=34.76666666666667 +lat_2=33.3 +lat_0=32.66666666666666 +lon_0=-92 +x_0=400000 +y_0=400000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Colorado North
<26953> +proj=lcc +lat_1=40.78333333333333 +lat_2=39.71666666666667 +lat_0=39.33333333333334 +lon_0=-105.5 +x_0=914401.8289 +y_0=304800.6096 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Colorado Central
<26954> +proj=lcc +lat_1=39.75 +lat_2=38.45 +lat_0=37.83333333333334 +lon_0=-105.5 +x_0=914401.8289 +y_0=304800.6096 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Colorado South
<26955> +proj=lcc +lat_1=38.43333333333333 +lat_2=37.23333333333333 +lat_0=36.66666666666666 +lon_0=-105.5 +x_0=914401.8289 +y_0=304800.6096 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Connecticut
<26956> +proj=lcc +lat_1=41.86666666666667 +lat_2=41.2 +lat_0=40.83333333333334 +lon_0=-72.75 +x_0=304800.6096 +y_0=152400.3048 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Delaware
<26957> +proj=tmerc +lat_0=38 +lon_0=-75.41666666666667 +k=0.999995 +x_0=200000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Florida East
<26958> +proj=tmerc +lat_0=24.33333333333333 +lon_0=-81 +k=0.999941177 +x_0=200000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Florida West
<26959> +proj=tmerc +lat_0=24.33333333333333 +lon_0=-82 +k=0.999941177 +x_0=200000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Florida North
<26960> +proj=lcc +lat_1=30.75 +lat_2=29.58333333333333 +lat_0=29 +lon_0=-84.5 +x_0=600000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Hawaii zone 1
<26961> +proj=tmerc +lat_0=18.83333333333333 +lon_0=-155.5 +k=0.999966667 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Hawaii zone 2
<26962> +proj=tmerc +lat_0=20.33333333333333 +lon_0=-156.6666666666667 +k=0.999966667 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Hawaii zone 3
<26963> +proj=tmerc +lat_0=21.16666666666667 +lon_0=-158 +k=0.99999 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Hawaii zone 4
<26964> +proj=tmerc +lat_0=21.83333333333333 +lon_0=-159.5 +k=0.99999 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Hawaii zone 5
<26965> +proj=tmerc +lat_0=21.66666666666667 +lon_0=-160.1666666666667 +k=1 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Georgia East
<26966> +proj=tmerc +lat_0=30 +lon_0=-82.16666666666667 +k=0.9999 +x_0=200000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Georgia West
<26967> +proj=tmerc +lat_0=30 +lon_0=-84.16666666666667 +k=0.9999 +x_0=700000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Idaho East
<26968> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-112.1666666666667 +k=0.9999473679999999 +x_0=200000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Idaho Central
<26969> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-114 +k=0.9999473679999999 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Idaho West
<26970> +proj=tmerc +lat_0=41.66666666666666 +lon_0=-115.75 +k=0.999933333 +x_0=800000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Illinois East
<26971> +proj=tmerc +lat_0=36.66666666666666 +lon_0=-88.33333333333333 +k=0.9999749999999999 +x_0=300000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Illinois West
<26972> +proj=tmerc +lat_0=36.66666666666666 +lon_0=-90.16666666666667 +k=0.999941177 +x_0=700000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Indiana East
<26973> +proj=tmerc +lat_0=37.5 +lon_0=-85.66666666666667 +k=0.999966667 +x_0=100000 +y_0=250000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Indiana West
<26974> +proj=tmerc +lat_0=37.5 +lon_0=-87.08333333333333 +k=0.999966667 +x_0=900000 +y_0=250000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Iowa North
<26975> +proj=lcc +lat_1=43.26666666666667 +lat_2=42.06666666666667 +lat_0=41.5 +lon_0=-93.5 +x_0=1500000 +y_0=1000000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Iowa South
<26976> +proj=lcc +lat_1=41.78333333333333 +lat_2=40.61666666666667 +lat_0=40 +lon_0=-93.5 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Kansas North
<26977> +proj=lcc +lat_1=39.78333333333333 +lat_2=38.71666666666667 +lat_0=38.33333333333334 +lon_0=-98 +x_0=400000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Kansas South
<26978> +proj=lcc +lat_1=38.56666666666667 +lat_2=37.26666666666667 +lat_0=36.66666666666666 +lon_0=-98.5 +x_0=400000 +y_0=400000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Kentucky North (deprecated)
<26979> +proj=lcc +lat_1=37.96666666666667 +lat_2=37.96666666666667 +lat_0=37.5 +lon_0=-84.25 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Kentucky South
<26980> +proj=lcc +lat_1=37.93333333333333 +lat_2=36.73333333333333 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=500000 +y_0=500000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Louisiana North
<26981> +proj=lcc +lat_1=32.66666666666666 +lat_2=31.16666666666667 +lat_0=30.5 +lon_0=-92.5 +x_0=1000000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Louisiana South
<26982> +proj=lcc +lat_1=30.7 +lat_2=29.3 +lat_0=28.5 +lon_0=-91.33333333333333 +x_0=1000000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Maine East
<26983> +proj=tmerc +lat_0=43.66666666666666 +lon_0=-68.5 +k=0.9999 +x_0=300000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Maine West
<26984> +proj=tmerc +lat_0=42.83333333333334 +lon_0=-70.16666666666667 +k=0.999966667 +x_0=900000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Maryland
<26985> +proj=lcc +lat_1=39.45 +lat_2=38.3 +lat_0=37.66666666666666 +lon_0=-77 +x_0=400000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Massachusetts Mainland
<26986> +proj=lcc +lat_1=42.68333333333333 +lat_2=41.71666666666667 +lat_0=41 +lon_0=-71.5 +x_0=200000 +y_0=750000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Massachusetts Island
<26987> +proj=lcc +lat_1=41.48333333333333 +lat_2=41.28333333333333 +lat_0=41 +lon_0=-70.5 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Michigan North
<26988> +proj=lcc +lat_1=47.08333333333334 +lat_2=45.48333333333333 +lat_0=44.78333333333333 +lon_0=-87 +x_0=8000000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Michigan Central
<26989> +proj=lcc +lat_1=45.7 +lat_2=44.18333333333333 +lat_0=43.31666666666667 +lon_0=-84.36666666666666 +x_0=6000000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Michigan South
<26990> +proj=lcc +lat_1=43.66666666666666 +lat_2=42.1 +lat_0=41.5 +lon_0=-84.36666666666666 +x_0=4000000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Minnesota North
<26991> +proj=lcc +lat_1=48.63333333333333 +lat_2=47.03333333333333 +lat_0=46.5 +lon_0=-93.09999999999999 +x_0=800000 +y_0=100000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Minnesota Central
<26992> +proj=lcc +lat_1=47.05 +lat_2=45.61666666666667 +lat_0=45 +lon_0=-94.25 +x_0=800000 +y_0=100000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Minnesota South
<26993> +proj=lcc +lat_1=45.21666666666667 +lat_2=43.78333333333333 +lat_0=43 +lon_0=-94 +x_0=800000 +y_0=100000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Mississippi East
<26994> +proj=tmerc +lat_0=29.5 +lon_0=-88.83333333333333 +k=0.99995 +x_0=300000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Mississippi West
<26995> +proj=tmerc +lat_0=29.5 +lon_0=-90.33333333333333 +k=0.99995 +x_0=700000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Missouri East
<26996> +proj=tmerc +lat_0=35.83333333333334 +lon_0=-90.5 +k=0.999933333 +x_0=250000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Missouri Central
<26997> +proj=tmerc +lat_0=35.83333333333334 +lon_0=-92.5 +k=0.999933333 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Missouri West
<26998> +proj=tmerc +lat_0=36.16666666666666 +lon_0=-94.5 +k=0.999941177 +x_0=850000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# Nahrwan 1967 / UTM zone 37N (deprecated)
<27037> +proj=utm +zone=37 +ellps=clrk80 +towgs84=-249,-156,381,0,0,0,0 +units=m +no_defs  <>
# Nahrwan 1967 / UTM zone 38N (deprecated)
<27038> +proj=utm +zone=38 +ellps=clrk80 +towgs84=-249,-156,381,0,0,0,0 +units=m +no_defs  <>
# Nahrwan 1967 / UTM zone 39N
<27039> +proj=utm +zone=39 +ellps=clrk80 +towgs84=-249,-156,381,0,0,0,0 +units=m +no_defs  <>
# Nahrwan 1967 / UTM zone 40N
<27040> +proj=utm +zone=40 +ellps=clrk80 +towgs84=-249,-156,381,0,0,0,0 +units=m +no_defs  <>
# Naparima 1972 / UTM zone 20N
<27120> +proj=utm +zone=20 +ellps=intl +towgs84=-10,375,165,0,0,0,0 +units=m +no_defs  <>
# NZGD49 / New Zealand Map Grid
<27200> +proj=nzmg +lat_0=-41 +lon_0=173 +x_0=2510000 +y_0=6023150 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Mount Eden Circuit
<27205> +proj=tmerc +lat_0=-36.87986527777778 +lon_0=174.7643393611111 +k=0.9999 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Bay of Plenty Circuit
<27206> +proj=tmerc +lat_0=-37.76124980555556 +lon_0=176.46619725 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Poverty Bay Circuit
<27207> +proj=tmerc +lat_0=-38.62470277777778 +lon_0=177.8856362777778 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Hawkes Bay Circuit
<27208> +proj=tmerc +lat_0=-39.65092930555556 +lon_0=176.6736805277778 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Taranaki Circuit
<27209> +proj=tmerc +lat_0=-39.13575830555556 +lon_0=174.22801175 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Tuhirangi Circuit
<27210> +proj=tmerc +lat_0=-39.51247038888889 +lon_0=175.6400368055556 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Wanganui Circuit
<27211> +proj=tmerc +lat_0=-40.24194713888889 +lon_0=175.4880996111111 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Wairarapa Circuit
<27212> +proj=tmerc +lat_0=-40.92553263888889 +lon_0=175.6473496666667 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Wellington Circuit
<27213> +proj=tmerc +lat_0=-41.30131963888888 +lon_0=174.7766231111111 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Collingwood Circuit
<27214> +proj=tmerc +lat_0=-40.71475905555556 +lon_0=172.6720465 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Nelson Circuit
<27215> +proj=tmerc +lat_0=-41.27454472222222 +lon_0=173.2993168055555 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Karamea Circuit
<27216> +proj=tmerc +lat_0=-41.28991152777778 +lon_0=172.1090281944444 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Buller Circuit
<27217> +proj=tmerc +lat_0=-41.81080286111111 +lon_0=171.5812600555556 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Grey Circuit
<27218> +proj=tmerc +lat_0=-42.33369427777778 +lon_0=171.5497713055556 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Amuri Circuit
<27219> +proj=tmerc +lat_0=-42.68911658333333 +lon_0=173.0101333888889 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Marlborough Circuit
<27220> +proj=tmerc +lat_0=-41.54448666666666 +lon_0=173.8020741111111 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Hokitika Circuit
<27221> +proj=tmerc +lat_0=-42.88632236111111 +lon_0=170.9799935 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Okarito Circuit
<27222> +proj=tmerc +lat_0=-43.11012813888889 +lon_0=170.2609258333333 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Jacksons Bay Circuit
<27223> +proj=tmerc +lat_0=-43.97780288888889 +lon_0=168.606267 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Mount Pleasant Circuit
<27224> +proj=tmerc +lat_0=-43.59063758333333 +lon_0=172.7271935833333 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Gawler Circuit
<27225> +proj=tmerc +lat_0=-43.74871155555556 +lon_0=171.3607484722222 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Timaru Circuit
<27226> +proj=tmerc +lat_0=-44.40222036111111 +lon_0=171.0572508333333 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Lindis Peak Circuit
<27227> +proj=tmerc +lat_0=-44.73526797222222 +lon_0=169.4677550833333 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Mount Nicholas Circuit
<27228> +proj=tmerc +lat_0=-45.13290258333333 +lon_0=168.3986411944444 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Mount York Circuit
<27229> +proj=tmerc +lat_0=-45.56372616666666 +lon_0=167.7388617777778 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Observation Point Circuit
<27230> +proj=tmerc +lat_0=-45.81619661111111 +lon_0=170.6285951666667 +k=1 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / North Taieri Circuit
<27231> +proj=tmerc +lat_0=-45.86151336111111 +lon_0=170.2825891111111 +k=0.99996 +x_0=300000 +y_0=700000 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / Bluff Circuit
<27232> +proj=tmerc +lat_0=-46.60000961111111 +lon_0=168.342872 +k=1 +x_0=300002.66 +y_0=699999.58 +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / UTM zone 58S
<27258> +proj=utm +zone=58 +south +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / UTM zone 59S
<27259> +proj=utm +zone=59 +south +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / UTM zone 60S
<27260> +proj=utm +zone=60 +south +datum=nzgd49 +units=m +no_defs  <>
# NZGD49 / North Island Grid
<27291> +proj=tmerc +lat_0=-39 +lon_0=175.5 +k=1 +x_0=274319.5243848086 +y_0=365759.3658464114 +datum=nzgd49 +to_meter=0.9143984146160287 +no_defs  <>
# NZGD49 / South Island Grid
<27292> +proj=tmerc +lat_0=-44 +lon_0=171.5 +k=1 +x_0=457199.2073080143 +y_0=457199.2073080143 +datum=nzgd49 +to_meter=0.9143984146160287 +no_defs  <>
# NGO 1948 (Oslo) / NGO zone I
<27391> +proj=tmerc +lat_0=58 +lon_0=-4.666666666666667 +k=1 +x_0=0 +y_0=0 +a=6377492.018 +b=6356173.508712696 +towgs84=278.3,93,474.5,7.889,0.05,-6.61,6.21 +pm=oslo +units=m +no_defs  <>
# NGO 1948 (Oslo) / NGO zone II
<27392> +proj=tmerc +lat_0=58 +lon_0=-2.333333333333333 +k=1 +x_0=0 +y_0=0 +a=6377492.018 +b=6356173.508712696 +towgs84=278.3,93,474.5,7.889,0.05,-6.61,6.21 +pm=oslo +units=m +no_defs  <>
# NGO 1948 (Oslo) / NGO zone III
<27393> +proj=tmerc +lat_0=58 +lon_0=0 +k=1 +x_0=0 +y_0=0 +a=6377492.018 +b=6356173.508712696 +towgs84=278.3,93,474.5,7.889,0.05,-6.61,6.21 +pm=oslo +units=m +no_defs  <>
# NGO 1948 (Oslo) / NGO zone IV
<27394> +proj=tmerc +lat_0=58 +lon_0=2.5 +k=1 +x_0=0 +y_0=0 +a=6377492.018 +b=6356173.508712696 +towgs84=278.3,93,474.5,7.889,0.05,-6.61,6.21 +pm=oslo +units=m +no_defs  <>
# NGO 1948 (Oslo) / NGO zone V
<27395> +proj=tmerc +lat_0=58 +lon_0=6.166666666666667 +k=1 +x_0=0 +y_0=0 +a=6377492.018 +b=6356173.508712696 +towgs84=278.3,93,474.5,7.889,0.05,-6.61,6.21 +pm=oslo +units=m +no_defs  <>
# NGO 1948 (Oslo) / NGO zone VI
<27396> +proj=tmerc +lat_0=58 +lon_0=10.16666666666667 +k=1 +x_0=0 +y_0=0 +a=6377492.018 +b=6356173.508712696 +towgs84=278.3,93,474.5,7.889,0.05,-6.61,6.21 +pm=oslo +units=m +no_defs  <>
# NGO 1948 (Oslo) / NGO zone VII
<27397> +proj=tmerc +lat_0=58 +lon_0=14.16666666666667 +k=1 +x_0=0 +y_0=0 +a=6377492.018 +b=6356173.508712696 +towgs84=278.3,93,474.5,7.889,0.05,-6.61,6.21 +pm=oslo +units=m +no_defs  <>
# NGO 1948 (Oslo) / NGO zone VIII
<27398> +proj=tmerc +lat_0=58 +lon_0=18.33333333333333 +k=1 +x_0=0 +y_0=0 +a=6377492.018 +b=6356173.508712696 +towgs84=278.3,93,474.5,7.889,0.05,-6.61,6.21 +pm=oslo +units=m +no_defs  <>
# Datum 73 / UTM zone 29N
<27429> +proj=utm +zone=29 +ellps=intl +towgs84=-223.237,110.193,36.649,0,0,0,0 +units=m +no_defs  <>
# Datum 73 / Modified Portuguese Grid (deprecated)
<27492> +proj=tmerc +lat_0=39.66666666666666 +lon_0=-8.131906111111112 +k=1 +x_0=180.598 +y_0=-86.98999999999999 +ellps=intl +towgs84=-223.237,110.193,36.649,0,0,0,0 +units=m +no_defs  <>
# Datum 73 / Modified Portuguese Grid
<27493> +proj=tmerc +lat_0=39.66666666666666 +lon_0=-8.131906111111112 +k=1 +x_0=180.598 +y_0=-86.98999999999999 +ellps=intl +towgs84=-223.237,110.193,36.649,0,0,0,0 +units=m +no_defs  <>
# ATF (Paris) / Nord de Guerre
<27500> +proj=lcc +lat_1=49.50000000000001 +lat_0=49.50000000000001 +lon_0=5.399999999999999 +k_0=0.99950908 +x_0=500000 +y_0=300000 +a=6376523 +b=6355862.933255573 +pm=2.337208333333333 +units=m +no_defs  <>
# NTF (Paris) / Lambert Nord France
<27561> +proj=lcc +lat_1=49.50000000000001 +lat_0=49.50000000000001 +lon_0=0 +k_0=0.999877341 +x_0=600000 +y_0=200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs  <>
# NTF (Paris) / Lambert Centre France
<27562> +proj=lcc +lat_1=46.8 +lat_0=46.8 +lon_0=0 +k_0=0.99987742 +x_0=600000 +y_0=200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs  <>
# NTF (Paris) / Lambert Sud France
<27563> +proj=lcc +lat_1=44.10000000000001 +lat_0=44.10000000000001 +lon_0=0 +k_0=0.999877499 +x_0=600000 +y_0=200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs  <>
# NTF (Paris) / Lambert Corse
<27564> +proj=lcc +lat_1=42.16500000000001 +lat_0=42.16500000000001 +lon_0=0 +k_0=0.99994471 +x_0=234.358 +y_0=185861.369 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs  <>
# NTF (Paris) / Lambert zone I
<27571> +proj=lcc +lat_1=49.50000000000001 +lat_0=49.50000000000001 +lon_0=0 +k_0=0.999877341 +x_0=600000 +y_0=1200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs  <>
# NTF (Paris) / Lambert zone II
<27572> +proj=lcc +lat_1=46.8 +lat_0=46.8 +lon_0=0 +k_0=0.99987742 +x_0=600000 +y_0=2200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs  <>
# NTF (Paris) / Lambert zone III
<27573> +proj=lcc +lat_1=44.10000000000001 +lat_0=44.10000000000001 +lon_0=0 +k_0=0.999877499 +x_0=600000 +y_0=3200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs  <>
# NTF (Paris) / Lambert zone IV
<27574> +proj=lcc +lat_1=42.16500000000001 +lat_0=42.16500000000001 +lon_0=0 +k_0=0.99994471 +x_0=234.358 +y_0=4185861.369 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs  <>
# NTF (Paris) / France I (deprecated)
<27581> +proj=lcc +lat_1=49.50000000000001 +lat_0=49.50000000000001 +lon_0=0 +k_0=0.999877341 +x_0=600000 +y_0=1200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs  <>
# NTF (Paris) / France II (deprecated)
<27582> +proj=lcc +lat_1=46.8 +lat_0=46.8 +lon_0=0 +k_0=0.99987742 +x_0=600000 +y_0=2200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs  <>
# NTF (Paris) / France III (deprecated)
<27583> +proj=lcc +lat_1=44.10000000000001 +lat_0=44.10000000000001 +lon_0=0 +k_0=0.999877499 +x_0=600000 +y_0=3200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs  <>
# NTF (Paris) / France IV (deprecated)
<27584> +proj=lcc +lat_1=42.16500000000001 +lat_0=42.16500000000001 +lon_0=0 +k_0=0.99994471 +x_0=234.358 +y_0=4185861.369 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs  <>
# NTF (Paris) / Nord France (deprecated)
<27591> +proj=lcc +lat_1=49.50000000000001 +lat_0=49.50000000000001 +lon_0=0 +k_0=0.999877341 +x_0=600000 +y_0=200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs  <>
# NTF (Paris) / Centre France (deprecated)
<27592> +proj=lcc +lat_1=46.8 +lat_0=46.8 +lon_0=0 +k_0=0.99987742 +x_0=600000 +y_0=200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs  <>
# NTF (Paris) / Sud France (deprecated)
<27593> +proj=lcc +lat_1=44.10000000000001 +lat_0=44.10000000000001 +lon_0=0 +k_0=0.999877499 +x_0=600000 +y_0=200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs  <>
# NTF (Paris) / Corse (deprecated)
<27594> +proj=lcc +lat_1=42.16500000000001 +lat_0=42.16500000000001 +lon_0=0 +k_0=0.99994471 +x_0=234.358 +y_0=185861.369 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs  <>
# OSGB 1936 / British National Grid
<27700> +proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +datum=OSGB36 +units=m +no_defs  <>
# Palestine 1923 / Palestine Grid
<28191> +proj=cass +lat_0=31.73409694444445 +lon_0=35.21208055555556 +x_0=170251.555 +y_0=126867.909 +a=6378300.789 +b=6356566.435 +towgs84=-275.7224,94.7824,340.8944,-8.001,-4.42,-11.821,1 +units=m +no_defs  <>
# Palestine 1923 / Palestine Belt
<28192> +proj=tmerc +lat_0=31.73409694444445 +lon_0=35.21208055555556 +k=1 +x_0=170251.555 +y_0=1126867.909 +a=6378300.789 +b=6356566.435 +towgs84=-275.7224,94.7824,340.8944,-8.001,-4.42,-11.821,1 +units=m +no_defs  <>
# Palestine 1923 / Israeli CS Grid
<28193> +proj=cass +lat_0=31.73409694444445 +lon_0=35.21208055555556 +x_0=170251.555 +y_0=1126867.909 +a=6378300.789 +b=6356566.435 +towgs84=-275.7224,94.7824,340.8944,-8.001,-4.42,-11.821,1 +units=m +no_defs  <>
# Pointe Noire / UTM zone 32S
<28232> +proj=utm +zone=32 +south +a=6378249.2 +b=6356515 +towgs84=-148,51,-291,0,0,0,0 +units=m +no_defs  <>
# GDA94 / MGA zone 48
<28348> +proj=utm +zone=48 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GDA94 / MGA zone 49
<28349> +proj=utm +zone=49 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GDA94 / MGA zone 50
<28350> +proj=utm +zone=50 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GDA94 / MGA zone 51
<28351> +proj=utm +zone=51 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GDA94 / MGA zone 52
<28352> +proj=utm +zone=52 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GDA94 / MGA zone 53
<28353> +proj=utm +zone=53 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GDA94 / MGA zone 54
<28354> +proj=utm +zone=54 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GDA94 / MGA zone 55
<28355> +proj=utm +zone=55 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GDA94 / MGA zone 56
<28356> +proj=utm +zone=56 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GDA94 / MGA zone 57
<28357> +proj=utm +zone=57 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# GDA94 / MGA zone 58
<28358> +proj=utm +zone=58 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 2 (deprecated)
<28402> +proj=tmerc +lat_0=0 +lon_0=9 +k=1 +x_0=2500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 3 (deprecated)
<28403> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=3500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 4
<28404> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=4500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 5
<28405> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=5500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 6
<28406> +proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=6500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 7
<28407> +proj=tmerc +lat_0=0 +lon_0=39 +k=1 +x_0=7500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 8
<28408> +proj=tmerc +lat_0=0 +lon_0=45 +k=1 +x_0=8500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 9
<28409> +proj=tmerc +lat_0=0 +lon_0=51 +k=1 +x_0=9500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 10
<28410> +proj=tmerc +lat_0=0 +lon_0=57 +k=1 +x_0=10500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 11
<28411> +proj=tmerc +lat_0=0 +lon_0=63 +k=1 +x_0=11500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 12
<28412> +proj=tmerc +lat_0=0 +lon_0=69 +k=1 +x_0=12500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 13
<28413> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=13500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 14
<28414> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=14500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 15
<28415> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=15500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 16
<28416> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=16500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 17
<28417> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=17500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 18
<28418> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=18500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 19
<28419> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=19500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 20
<28420> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=20500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 21
<28421> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=21500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 22
<28422> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=22500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 23
<28423> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=23500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 24
<28424> +proj=tmerc +lat_0=0 +lon_0=141 +k=1 +x_0=24500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 25
<28425> +proj=tmerc +lat_0=0 +lon_0=147 +k=1 +x_0=25500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 26
<28426> +proj=tmerc +lat_0=0 +lon_0=153 +k=1 +x_0=26500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 27
<28427> +proj=tmerc +lat_0=0 +lon_0=159 +k=1 +x_0=27500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 28
<28428> +proj=tmerc +lat_0=0 +lon_0=165 +k=1 +x_0=28500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 29
<28429> +proj=tmerc +lat_0=0 +lon_0=171 +k=1 +x_0=29500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 30
<28430> +proj=tmerc +lat_0=0 +lon_0=177 +k=1 +x_0=30500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 31
<28431> +proj=tmerc +lat_0=0 +lon_0=-177 +k=1 +x_0=31500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger zone 32
<28432> +proj=tmerc +lat_0=0 +lon_0=-171 +k=1 +x_0=32500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 2N (deprecated)
<28462> +proj=tmerc +lat_0=0 +lon_0=9 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 3N (deprecated)
<28463> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 4N (deprecated)
<28464> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 5N (deprecated)
<28465> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 6N (deprecated)
<28466> +proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 7N (deprecated)
<28467> +proj=tmerc +lat_0=0 +lon_0=39 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 8N (deprecated)
<28468> +proj=tmerc +lat_0=0 +lon_0=45 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 9N (deprecated)
<28469> +proj=tmerc +lat_0=0 +lon_0=51 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 10N (deprecated)
<28470> +proj=tmerc +lat_0=0 +lon_0=57 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 11N (deprecated)
<28471> +proj=tmerc +lat_0=0 +lon_0=63 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 12N (deprecated)
<28472> +proj=tmerc +lat_0=0 +lon_0=69 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 13N (deprecated)
<28473> +proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 14N (deprecated)
<28474> +proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 15N (deprecated)
<28475> +proj=tmerc +lat_0=0 +lon_0=87 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 16N (deprecated)
<28476> +proj=tmerc +lat_0=0 +lon_0=93 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 17N (deprecated)
<28477> +proj=tmerc +lat_0=0 +lon_0=99 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 18N (deprecated)
<28478> +proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 19N (deprecated)
<28479> +proj=tmerc +lat_0=0 +lon_0=111 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 20N (deprecated)
<28480> +proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 21N (deprecated)
<28481> +proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 22N (deprecated)
<28482> +proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 23N (deprecated)
<28483> +proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 24N (deprecated)
<28484> +proj=tmerc +lat_0=0 +lon_0=141 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 25N (deprecated)
<28485> +proj=tmerc +lat_0=0 +lon_0=147 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 26N (deprecated)
<28486> +proj=tmerc +lat_0=0 +lon_0=153 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 27N (deprecated)
<28487> +proj=tmerc +lat_0=0 +lon_0=159 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 28N (deprecated)
<28488> +proj=tmerc +lat_0=0 +lon_0=165 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 29N (deprecated)
<28489> +proj=tmerc +lat_0=0 +lon_0=171 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 30N (deprecated)
<28490> +proj=tmerc +lat_0=0 +lon_0=177 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 31N (deprecated)
<28491> +proj=tmerc +lat_0=0 +lon_0=-177 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Pulkovo 1942 / Gauss-Kruger 32N (deprecated)
<28492> +proj=tmerc +lat_0=0 +lon_0=-171 +k=1 +x_0=500000 +y_0=0 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs  <>
# Qatar 1974 / Qatar National Grid
<28600> +proj=tmerc +lat_0=24.45 +lon_0=51.21666666666667 +k=0.99999 +x_0=200000 +y_0=300000 +ellps=intl +towgs84=-128.16,-282.42,21.93,0,0,0,0 +units=m +no_defs  <>
# Amersfoort / RD Old
<28991> +proj=sterea +lat_0=52.15616055555555 +lon_0=5.38763888888889 +k=0.9999079 +x_0=0 +y_0=0 +ellps=bessel +towgs84=565.2369,50.0087,465.658,-0.406857,0.350733,-1.87035,4.0812 +units=m +no_defs  <>
# Amersfoort / RD New
<28992> +proj=sterea +lat_0=52.15616055555555 +lon_0=5.38763888888889 +k=0.9999079 +x_0=155000 +y_0=463000 +ellps=bessel +towgs84=565.2369,50.0087,465.658,-0.406857,0.350733,-1.87035,4.0812 +units=m +no_defs  <>
# SAD69 / Brazil Polyconic (deprecated)
<29100> +proj=poly +lat_0=0 +lon_0=-54 +x_0=5000000 +y_0=10000000 +ellps=GRS67 +towgs84=-57,1,-41,0,0,0,0 +units=m +no_defs  <>
# SAD69 / Brazil Polyconic
<29101> +proj=poly +lat_0=0 +lon_0=-54 +x_0=5000000 +y_0=10000000 +ellps=aust_SA +towgs84=-66.87,4.37,-38.52,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 18N (deprecated)
<29118> +proj=utm +zone=18 +ellps=GRS67 +towgs84=-57,1,-41,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 19N (deprecated)
<29119> +proj=utm +zone=19 +ellps=GRS67 +towgs84=-57,1,-41,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 20N (deprecated)
<29120> +proj=utm +zone=20 +ellps=GRS67 +towgs84=-57,1,-41,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 21N (deprecated)
<29121> +proj=utm +zone=21 +ellps=GRS67 +towgs84=-57,1,-41,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 22N (deprecated)
<29122> +proj=utm +zone=22 +ellps=GRS67 +towgs84=-57,1,-41,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 18N
<29168> +proj=utm +zone=18 +ellps=aust_SA +towgs84=-66.87,4.37,-38.52,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 19N
<29169> +proj=utm +zone=19 +ellps=aust_SA +towgs84=-66.87,4.37,-38.52,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 20N
<29170> +proj=utm +zone=20 +ellps=aust_SA +towgs84=-66.87,4.37,-38.52,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 21N
<29171> +proj=utm +zone=21 +ellps=aust_SA +towgs84=-66.87,4.37,-38.52,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 22N
<29172> +proj=utm +zone=22 +ellps=aust_SA +towgs84=-66.87,4.37,-38.52,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 17S (deprecated)
<29177> +proj=utm +zone=17 +south +ellps=GRS67 +towgs84=-57,1,-41,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 18S (deprecated)
<29178> +proj=utm +zone=18 +south +ellps=GRS67 +towgs84=-57,1,-41,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 19S (deprecated)
<29179> +proj=utm +zone=19 +south +ellps=GRS67 +towgs84=-57,1,-41,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 20S (deprecated)
<29180> +proj=utm +zone=20 +south +ellps=GRS67 +towgs84=-57,1,-41,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 21S (deprecated)
<29181> +proj=utm +zone=21 +south +ellps=GRS67 +towgs84=-57,1,-41,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 22S (deprecated)
<29182> +proj=utm +zone=22 +south +ellps=GRS67 +towgs84=-57,1,-41,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 23S (deprecated)
<29183> +proj=utm +zone=23 +south +ellps=GRS67 +towgs84=-57,1,-41,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 24S (deprecated)
<29184> +proj=utm +zone=24 +south +ellps=GRS67 +towgs84=-57,1,-41,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 25S (deprecated)
<29185> +proj=utm +zone=25 +south +ellps=GRS67 +towgs84=-57,1,-41,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 17S
<29187> +proj=utm +zone=17 +south +ellps=aust_SA +towgs84=-66.87,4.37,-38.52,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 18S
<29188> +proj=utm +zone=18 +south +ellps=aust_SA +towgs84=-66.87,4.37,-38.52,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 19S
<29189> +proj=utm +zone=19 +south +ellps=aust_SA +towgs84=-66.87,4.37,-38.52,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 20S
<29190> +proj=utm +zone=20 +south +ellps=aust_SA +towgs84=-66.87,4.37,-38.52,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 21S
<29191> +proj=utm +zone=21 +south +ellps=aust_SA +towgs84=-66.87,4.37,-38.52,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 22S
<29192> +proj=utm +zone=22 +south +ellps=aust_SA +towgs84=-66.87,4.37,-38.52,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 23S
<29193> +proj=utm +zone=23 +south +ellps=aust_SA +towgs84=-66.87,4.37,-38.52,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 24S
<29194> +proj=utm +zone=24 +south +ellps=aust_SA +towgs84=-66.87,4.37,-38.52,0,0,0,0 +units=m +no_defs  <>
# SAD69 / UTM zone 25S
<29195> +proj=utm +zone=25 +south +ellps=aust_SA +towgs84=-66.87,4.37,-38.52,0,0,0,0 +units=m +no_defs  <>
# Sapper Hill 1943 / UTM zone 20S
<29220> +proj=utm +zone=20 +south +ellps=intl +towgs84=-355,21,72,0,0,0,0 +units=m +no_defs  <>
# Sapper Hill 1943 / UTM zone 21S
<29221> +proj=utm +zone=21 +south +ellps=intl +towgs84=-355,21,72,0,0,0,0 +units=m +no_defs  <>
# Schwarzeck / UTM zone 33S
<29333> +proj=utm +zone=33 +south +ellps=bess_nam +towgs84=616,97,-251,0,0,0,0 +units=m +no_defs  <>
# Schwarzeck / Lo22/11
<29371> +proj=tmerc +lat_0=-22 +lon_0=11 +k=1 +x_0=0 +y_0=0 +axis=wsu +ellps=bess_nam +towgs84=616,97,-251,0,0,0,0 +to_meter=1.0000135965 +no_defs  <>
# Schwarzeck / Lo22/13
<29373> +proj=tmerc +lat_0=-22 +lon_0=13 +k=1 +x_0=0 +y_0=0 +axis=wsu +ellps=bess_nam +towgs84=616,97,-251,0,0,0,0 +to_meter=1.0000135965 +no_defs  <>
# Schwarzeck / Lo22/15
<29375> +proj=tmerc +lat_0=-22 +lon_0=15 +k=1 +x_0=0 +y_0=0 +axis=wsu +ellps=bess_nam +towgs84=616,97,-251,0,0,0,0 +to_meter=1.0000135965 +no_defs  <>
# Schwarzeck / Lo22/17
<29377> +proj=tmerc +lat_0=-22 +lon_0=17 +k=1 +x_0=0 +y_0=0 +axis=wsu +ellps=bess_nam +towgs84=616,97,-251,0,0,0,0 +to_meter=1.0000135965 +no_defs  <>
# Schwarzeck / Lo22/19
<29379> +proj=tmerc +lat_0=-22 +lon_0=19 +k=1 +x_0=0 +y_0=0 +axis=wsu +ellps=bess_nam +towgs84=616,97,-251,0,0,0,0 +to_meter=1.0000135965 +no_defs  <>
# Schwarzeck / Lo22/21
<29381> +proj=tmerc +lat_0=-22 +lon_0=21 +k=1 +x_0=0 +y_0=0 +axis=wsu +ellps=bess_nam +towgs84=616,97,-251,0,0,0,0 +to_meter=1.0000135965 +no_defs  <>
# Schwarzeck / Lo22/23
<29383> +proj=tmerc +lat_0=-22 +lon_0=23 +k=1 +x_0=0 +y_0=0 +axis=wsu +ellps=bess_nam +towgs84=616,97,-251,0,0,0,0 +to_meter=1.0000135965 +no_defs  <>
# Schwarzeck / Lo22/25
<29385> +proj=tmerc +lat_0=-22 +lon_0=25 +k=1 +x_0=0 +y_0=0 +axis=wsu +ellps=bess_nam +towgs84=616,97,-251,0,0,0,0 +to_meter=1.0000135965 +no_defs  <>
# Sudan / UTM zone 35N (deprecated)
<29635> +proj=utm +zone=35 +a=6378249.2 +b=6356515 +units=m +no_defs  <>
# Sudan / UTM zone 36N (deprecated)
<29636> +proj=utm +zone=36 +a=6378249.2 +b=6356515 +units=m +no_defs  <>
# Tananarive (Paris) / Laborde Grid (deprecated)
<29700> +proj=omerc +lat_0=-18.9 +lonc=44.10000000000001 +alpha=18.9 +k=0.9995000000000001 +x_0=400000 +y_0=800000 +gamma=18.9 +ellps=intl +towgs84=-189,-242,-91,0,0,0,0 +pm=paris +units=m +no_defs  <>
# Tananarive (Paris) / Laborde Grid
# Unable to translate coordinate system EPSG:29701 into PROJ.4 format.
#
# Tananarive (Paris) / Laborde Grid approximation
<29702> +proj=omerc +lat_0=-18.9 +lonc=44.10000000000001 +alpha=18.9 +k=0.9995000000000001 +x_0=400000 +y_0=800000 +gamma=18.9 +ellps=intl +towgs84=-189,-242,-91,0,0,0,0 +pm=paris +units=m +no_defs  <>
# Tananarive / UTM zone 38S
<29738> +proj=utm +zone=38 +south +ellps=intl +towgs84=-189,-242,-91,0,0,0,0 +units=m +no_defs  <>
# Tananarive / UTM zone 39S
<29739> +proj=utm +zone=39 +south +ellps=intl +towgs84=-189,-242,-91,0,0,0,0 +units=m +no_defs  <>
# Timbalai 1948 / UTM zone 49N
<29849> +proj=utm +zone=49 +ellps=evrstSS +towgs84=-679,669,-48,0,0,0,0 +units=m +no_defs  <>
# Timbalai 1948 / UTM zone 50N
<29850> +proj=utm +zone=50 +ellps=evrstSS +towgs84=-679,669,-48,0,0,0,0 +units=m +no_defs  <>
# Timbalai 1948 / RSO Borneo (ch)
<29871> +proj=omerc +lat_0=4 +lonc=115 +alpha=53.31582047222222 +k=0.99984 +x_0=590476.8714630401 +y_0=442857.653094361 +gamma=53.13010236111111 +ellps=evrstSS +towgs84=-679,669,-48,0,0,0,0 +to_meter=20.11676512155263 +no_defs  <>
# Timbalai 1948 / RSO Borneo (ftSe)
<29872> +proj=omerc +lat_0=4 +lonc=115 +alpha=53.31582047222222 +k=0.99984 +x_0=590476.8727431979 +y_0=442857.6545573985 +gamma=53.13010236111111 +ellps=evrstSS +towgs84=-679,669,-48,0,0,0,0 +to_meter=0.3047994715386762 +no_defs  <>
# Timbalai 1948 / RSO Borneo (m)
<29873> +proj=omerc +lat_0=4 +lonc=115 +alpha=53.31582047222222 +k=0.99984 +x_0=590476.87 +y_0=442857.65 +gamma=53.13010236111111 +ellps=evrstSS +towgs84=-679,669,-48,0,0,0,0 +units=m +no_defs  <>
# TM65 / Irish National Grid (deprecated)
<29900> +proj=tmerc +lat_0=53.5 +lon_0=-8 +k=1.000035 +x_0=200000 +y_0=250000 +datum=ire65 +units=m +no_defs  <>
# OSNI 1952 / Irish National Grid
<29901> +proj=tmerc +lat_0=53.5 +lon_0=-8 +k=1 +x_0=200000 +y_0=250000 +ellps=airy +towgs84=482.5,-130.6,564.6,-1.042,-0.214,-0.631,8.15 +units=m +no_defs  <>
# TM65 / Irish Grid
<29902> +proj=tmerc +lat_0=53.5 +lon_0=-8 +k=1.000035 +x_0=200000 +y_0=250000 +datum=ire65 +units=m +no_defs  <>
# TM75 / Irish Grid
<29903> +proj=tmerc +lat_0=53.5 +lon_0=-8 +k=1.000035 +x_0=200000 +y_0=250000 +ellps=mod_airy +towgs84=482.5,-130.6,564.6,-1.042,-0.214,-0.631,8.15 +units=m +no_defs  <>
# Tokyo / Japan Plane Rectangular CS I
<30161> +proj=tmerc +lat_0=33 +lon_0=129.5 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Tokyo / Japan Plane Rectangular CS II
<30162> +proj=tmerc +lat_0=33 +lon_0=131 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Tokyo / Japan Plane Rectangular CS III
<30163> +proj=tmerc +lat_0=36 +lon_0=132.1666666666667 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Tokyo / Japan Plane Rectangular CS IV
<30164> +proj=tmerc +lat_0=33 +lon_0=133.5 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Tokyo / Japan Plane Rectangular CS V
<30165> +proj=tmerc +lat_0=36 +lon_0=134.3333333333333 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Tokyo / Japan Plane Rectangular CS VI
<30166> +proj=tmerc +lat_0=36 +lon_0=136 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Tokyo / Japan Plane Rectangular CS VII
<30167> +proj=tmerc +lat_0=36 +lon_0=137.1666666666667 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Tokyo / Japan Plane Rectangular CS VIII
<30168> +proj=tmerc +lat_0=36 +lon_0=138.5 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Tokyo / Japan Plane Rectangular CS IX
<30169> +proj=tmerc +lat_0=36 +lon_0=139.8333333333333 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Tokyo / Japan Plane Rectangular CS X
<30170> +proj=tmerc +lat_0=40 +lon_0=140.8333333333333 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Tokyo / Japan Plane Rectangular CS XI
<30171> +proj=tmerc +lat_0=44 +lon_0=140.25 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Tokyo / Japan Plane Rectangular CS XII
<30172> +proj=tmerc +lat_0=44 +lon_0=142.25 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Tokyo / Japan Plane Rectangular CS XIII
<30173> +proj=tmerc +lat_0=44 +lon_0=144.25 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Tokyo / Japan Plane Rectangular CS XIV
<30174> +proj=tmerc +lat_0=26 +lon_0=142 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Tokyo / Japan Plane Rectangular CS XV
<30175> +proj=tmerc +lat_0=26 +lon_0=127.5 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Tokyo / Japan Plane Rectangular CS XVI
<30176> +proj=tmerc +lat_0=26 +lon_0=124 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Tokyo / Japan Plane Rectangular CS XVII
<30177> +proj=tmerc +lat_0=26 +lon_0=131 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Tokyo / Japan Plane Rectangular CS XVIII
<30178> +proj=tmerc +lat_0=20 +lon_0=136 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Tokyo / Japan Plane Rectangular CS XIX
<30179> +proj=tmerc +lat_0=26 +lon_0=154 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +units=m +no_defs  <>
# Trinidad 1903 / Trinidad Grid
<30200> +proj=cass +lat_0=10.44166666666667 +lon_0=-61.33333333333334 +x_0=86501.46392051999 +y_0=65379.0134283 +a=6378293.645208759 +b=6356617.987679838 +towgs84=-61.702,284.488,472.052,0,0,0,0 +to_meter=0.201166195164 +no_defs  <>
# TC(1948) / UTM zone 39N
<30339> +proj=utm +zone=39 +ellps=helmert +units=m +no_defs  <>
# TC(1948) / UTM zone 40N
<30340> +proj=utm +zone=40 +ellps=helmert +units=m +no_defs  <>
# Voirol 1875 / Nord Algerie (ancienne)
<30491> +proj=lcc +lat_1=36 +lat_0=36 +lon_0=2.7 +k_0=0.999625544 +x_0=500000 +y_0=300000 +a=6378249.2 +b=6356515 +towgs84=-73,-247,227,0,0,0,0 +units=m +no_defs  <>
# Voirol 1875 / Sud Algerie (ancienne)
<30492> +proj=lcc +lat_1=33.3 +lat_0=33.3 +lon_0=2.7 +k_0=0.999625769 +x_0=500000 +y_0=300000 +a=6378249.2 +b=6356515 +towgs84=-73,-247,227,0,0,0,0 +units=m +no_defs  <>
# Voirol 1879 / Nord Algerie (ancienne)
<30493> +proj=lcc +lat_1=36 +lat_0=36 +lon_0=2.7 +k_0=0.999625544 +x_0=500000 +y_0=300000 +a=6378249.2 +b=6356515 +units=m +no_defs  <>
# Voirol 1879 / Sud Algerie (ancienne)
<30494> +proj=lcc +lat_1=33.3 +lat_0=33.3 +lon_0=2.7 +k_0=0.999625769 +x_0=500000 +y_0=300000 +a=6378249.2 +b=6356515 +units=m +no_defs  <>
# Nord Sahara 1959 / UTM zone 29N
<30729> +proj=utm +zone=29 +ellps=clrk80 +towgs84=-209.3622,-87.8162,404.6198,0.0046,3.4784,0.5805,-1.4547 +units=m +no_defs  <>
# Nord Sahara 1959 / UTM zone 30N
<30730> +proj=utm +zone=30 +ellps=clrk80 +towgs84=-209.3622,-87.8162,404.6198,0.0046,3.4784,0.5805,-1.4547 +units=m +no_defs  <>
# Nord Sahara 1959 / UTM zone 31N
<30731> +proj=utm +zone=31 +ellps=clrk80 +towgs84=-209.3622,-87.8162,404.6198,0.0046,3.4784,0.5805,-1.4547 +units=m +no_defs  <>
# Nord Sahara 1959 / UTM zone 32N
<30732> +proj=utm +zone=32 +ellps=clrk80 +towgs84=-209.3622,-87.8162,404.6198,0.0046,3.4784,0.5805,-1.4547 +units=m +no_defs  <>
# Nord Sahara 1959 / Nord Algerie
<30791> +proj=lcc +lat_1=36 +lat_0=36 +lon_0=2.7 +k_0=0.999625544 +x_0=500135 +y_0=300090 +ellps=clrk80 +towgs84=-209.3622,-87.8162,404.6198,0.0046,3.4784,0.5805,-1.4547 +units=m +no_defs  <>
# Nord Sahara 1959 / Sud Algerie
<30792> +proj=lcc +lat_1=33.3 +lat_0=33.3 +lon_0=2.7 +k_0=0.999625769 +x_0=500135 +y_0=300090 +ellps=clrk80 +towgs84=-209.3622,-87.8162,404.6198,0.0046,3.4784,0.5805,-1.4547 +units=m +no_defs  <>
# RT38 2.5 gon W (deprecated)
<30800> +proj=tmerc +lat_0=0 +lon_0=15.80827777777778 +k=1 +x_0=1500000 +y_0=0 +ellps=bessel +units=m +no_defs  <>
# Yoff / UTM zone 28N
<31028> +proj=utm +zone=28 +a=6378249.2 +b=6356515 +towgs84=-30,190,89,0,0,0,0 +units=m +no_defs  <>
# Zanderij / UTM zone 21N
<31121> +proj=utm +zone=21 +ellps=intl +towgs84=-265,120,-358,0,0,0,0 +units=m +no_defs  <>
# Zanderij / TM 54 NW
<31154> +proj=tmerc +lat_0=0 +lon_0=-54 +k=0.9996 +x_0=500000 +y_0=0 +ellps=intl +towgs84=-265,120,-358,0,0,0,0 +units=m +no_defs  <>
# Zanderij / Suriname Old TM
<31170> +proj=tmerc +lat_0=0 +lon_0=-55.68333333333333 +k=0.9996 +x_0=500000 +y_0=0 +ellps=intl +towgs84=-265,120,-358,0,0,0,0 +units=m +no_defs  <>
# Zanderij / Suriname TM
<31171> +proj=tmerc +lat_0=0 +lon_0=-55.68333333333333 +k=0.9999 +x_0=500000 +y_0=0 +ellps=intl +towgs84=-265,120,-358,0,0,0,0 +units=m +no_defs  <>
# MGI (Ferro) / Austria GK West Zone
<31251> +proj=tmerc +lat_0=0 +lon_0=28 +k=1 +x_0=0 +y_0=-5000000 +ellps=bessel +towgs84=577.326,90.129,463.919,5.137,1.474,5.297,2.4232 +pm=ferro +units=m +no_defs  <>
# MGI (Ferro) / Austria GK Central Zone
<31252> +proj=tmerc +lat_0=0 +lon_0=31 +k=1 +x_0=0 +y_0=-5000000 +ellps=bessel +towgs84=577.326,90.129,463.919,5.137,1.474,5.297,2.4232 +pm=ferro +units=m +no_defs  <>
# MGI (Ferro) / Austria GK East Zone
<31253> +proj=tmerc +lat_0=0 +lon_0=34 +k=1 +x_0=0 +y_0=-5000000 +ellps=bessel +towgs84=577.326,90.129,463.919,5.137,1.474,5.297,2.4232 +pm=ferro +units=m +no_defs  <>
# MGI / Austria GK West
<31254> +proj=tmerc +lat_0=0 +lon_0=10.33333333333333 +k=1 +x_0=0 +y_0=-5000000 +datum=hermannskogel +units=m +no_defs  <>
# MGI / Austria GK Central
<31255> +proj=tmerc +lat_0=0 +lon_0=13.33333333333333 +k=1 +x_0=0 +y_0=-5000000 +datum=hermannskogel +units=m +no_defs  <>
# MGI / Austria GK East
<31256> +proj=tmerc +lat_0=0 +lon_0=16.33333333333333 +k=1 +x_0=0 +y_0=-5000000 +datum=hermannskogel +units=m +no_defs  <>
# MGI / Austria GK M28
<31257> +proj=tmerc +lat_0=0 +lon_0=10.33333333333333 +k=1 +x_0=150000 +y_0=-5000000 +datum=hermannskogel +units=m +no_defs  <>
# MGI / Austria GK M31
<31258> +proj=tmerc +lat_0=0 +lon_0=13.33333333333333 +k=1 +x_0=450000 +y_0=-5000000 +datum=hermannskogel +units=m +no_defs  <>
# MGI / Austria GK M34
<31259> +proj=tmerc +lat_0=0 +lon_0=16.33333333333333 +k=1 +x_0=750000 +y_0=-5000000 +datum=hermannskogel +units=m +no_defs  <>
# MGI / 3-degree Gauss zone 5 (deprecated)
<31265> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=5500000 +y_0=0 +datum=hermannskogel +units=m +no_defs  <>
# MGI / 3-degree Gauss zone 6 (deprecated)
<31266> +proj=tmerc +lat_0=0 +lon_0=18 +k=1 +x_0=6500000 +y_0=0 +datum=hermannskogel +units=m +no_defs  <>
# MGI / 3-degree Gauss zone 7 (deprecated)
<31267> +proj=tmerc +lat_0=0 +lon_0=21 +k=1 +x_0=7500000 +y_0=0 +datum=hermannskogel +units=m +no_defs  <>
# MGI / 3-degree Gauss zone 8 (deprecated)
<31268> +proj=tmerc +lat_0=0 +lon_0=24 +k=1 +x_0=8500000 +y_0=0 +datum=hermannskogel +units=m +no_defs  <>
# MGI / Balkans zone 5 (deprecated)
<31275> +proj=tmerc +lat_0=0 +lon_0=15 +k=0.9999 +x_0=5500000 +y_0=0 +datum=hermannskogel +units=m +no_defs  <>
# MGI / Balkans zone 6 (deprecated)
<31276> +proj=tmerc +lat_0=0 +lon_0=18 +k=0.9999 +x_0=6500000 +y_0=0 +datum=hermannskogel +units=m +no_defs  <>
# MGI / Balkans zone 7 (deprecated)
<31277> +proj=tmerc +lat_0=0 +lon_0=21 +k=0.9999 +x_0=7500000 +y_0=0 +datum=hermannskogel +units=m +no_defs  <>
# MGI / Balkans zone 8 (deprecated)
<31278> +proj=tmerc +lat_0=0 +lon_0=21 +k=0.9999 +x_0=7500000 +y_0=0 +datum=hermannskogel +units=m +no_defs  <>
# MGI / Balkans zone 8 (deprecated)
<31279> +proj=tmerc +lat_0=0 +lon_0=24 +k=0.9999 +x_0=8500000 +y_0=0 +datum=hermannskogel +units=m +no_defs  <>
# MGI (Ferro) / Austria West Zone
<31281> +proj=tmerc +lat_0=0 +lon_0=28 +k=1 +x_0=0 +y_0=0 +ellps=bessel +towgs84=682,-203,480,0,0,0,0 +pm=ferro +units=m +no_defs  <>
# MGI (Ferro) / Austria Central Zone
<31282> +proj=tmerc +lat_0=0 +lon_0=31 +k=1 +x_0=0 +y_0=0 +ellps=bessel +towgs84=682,-203,480,0,0,0,0 +pm=ferro +units=m +no_defs  <>
# MGI (Ferro) / Austria East Zone
<31283> +proj=tmerc +lat_0=0 +lon_0=34 +k=1 +x_0=0 +y_0=0 +ellps=bessel +towgs84=682,-203,480,0,0,0,0 +pm=ferro +units=m +no_defs  <>
# MGI / Austria M28
<31284> +proj=tmerc +lat_0=0 +lon_0=10.33333333333333 +k=1 +x_0=150000 +y_0=0 +datum=hermannskogel +units=m +no_defs  <>
# MGI / Austria M31
<31285> +proj=tmerc +lat_0=0 +lon_0=13.33333333333333 +k=1 +x_0=450000 +y_0=0 +datum=hermannskogel +units=m +no_defs  <>
# MGI / Austria M34
<31286> +proj=tmerc +lat_0=0 +lon_0=16.33333333333333 +k=1 +x_0=750000 +y_0=0 +datum=hermannskogel +units=m +no_defs  <>
# MGI / Austria Lambert
<31287> +proj=lcc +lat_1=49 +lat_2=46 +lat_0=47.5 +lon_0=13.33333333333333 +x_0=400000 +y_0=400000 +datum=hermannskogel +units=m +no_defs  <>
# MGI (Ferro) / M28
<31288> +proj=tmerc +lat_0=0 +lon_0=28 +k=1 +x_0=150000 +y_0=0 +ellps=bessel +towgs84=682,-203,480,0,0,0,0 +pm=ferro +units=m +no_defs  <>
# MGI (Ferro) / M31
<31289> +proj=tmerc +lat_0=0 +lon_0=31 +k=1 +x_0=450000 +y_0=0 +ellps=bessel +towgs84=682,-203,480,0,0,0,0 +pm=ferro +units=m +no_defs  <>
# MGI (Ferro) / M34
<31290> +proj=tmerc +lat_0=0 +lon_0=34 +k=1 +x_0=750000 +y_0=0 +ellps=bessel +towgs84=682,-203,480,0,0,0,0 +pm=ferro +units=m +no_defs  <>
# MGI (Ferro) / Austria West Zone (deprecated)
<31291> +proj=tmerc +lat_0=0 +lon_0=28 +k=1 +x_0=0 +y_0=0 +ellps=bessel +towgs84=682,-203,480,0,0,0,0 +pm=ferro +units=m +no_defs  <>
# MGI (Ferro) / Austria Central Zone (deprecated)
<31292> +proj=tmerc +lat_0=0 +lon_0=31 +k=1 +x_0=0 +y_0=0 +ellps=bessel +towgs84=682,-203,480,0,0,0,0 +pm=ferro +units=m +no_defs  <>
# MGI (Ferro) / Austria East Zone (deprecated)
<31293> +proj=tmerc +lat_0=0 +lon_0=34 +k=1 +x_0=0 +y_0=0 +ellps=bessel +towgs84=682,-203,480,0,0,0,0 +pm=ferro +units=m +no_defs  <>
# MGI / M28 (deprecated)
<31294> +proj=tmerc +lat_0=0 +lon_0=10.33333333333333 +k=1 +x_0=150000 +y_0=0 +datum=hermannskogel +units=m +no_defs  <>
# MGI / M31 (deprecated)
<31295> +proj=tmerc +lat_0=0 +lon_0=13.33333333333333 +k=1 +x_0=450000 +y_0=0 +datum=hermannskogel +units=m +no_defs  <>
# MGI / M34 (deprecated)
<31296> +proj=tmerc +lat_0=0 +lon_0=16.33333333333333 +k=1 +x_0=750000 +y_0=0 +datum=hermannskogel +units=m +no_defs  <>
# MGI / Austria Lambert (deprecated)
<31297> +proj=lcc +lat_1=49 +lat_2=46 +lat_0=47.5 +lon_0=13.33333333333333 +x_0=400000 +y_0=400000 +datum=hermannskogel +units=m +no_defs  <>
# Belge 1972 / Belge Lambert 72
<31300> +proj=lcc +lat_1=49.83333333333334 +lat_2=51.16666666666666 +lat_0=90 +lon_0=4.356939722222222 +x_0=150000.01256 +y_0=5400088.4378 +ellps=intl +towgs84=-106.8686,52.2978,-103.7239,0.3366,-0.457,1.8422,-1.2747 +units=m +no_defs  <>
# Belge 1972 / Belgian Lambert 72
<31370> +proj=lcc +lat_1=51.16666723333333 +lat_2=49.8333339 +lat_0=90 +lon_0=4.367486666666666 +x_0=150000.013 +y_0=5400088.438 +ellps=intl +towgs84=-106.8686,52.2978,-103.7239,0.3366,-0.457,1.8422,-1.2747 +units=m +no_defs  <>
# DHDN / 3-degree Gauss zone 1 (deprecated)
<31461> +proj=tmerc +lat_0=0 +lon_0=3 +k=1 +x_0=1500000 +y_0=0 +datum=potsdam +units=m +no_defs  <>
# DHDN / 3-degree Gauss zone 2 (deprecated)
<31462> +proj=tmerc +lat_0=0 +lon_0=6 +k=1 +x_0=2500000 +y_0=0 +datum=potsdam +units=m +no_defs  <>
# DHDN / 3-degree Gauss zone 3 (deprecated)
<31463> +proj=tmerc +lat_0=0 +lon_0=9 +k=1 +x_0=3500000 +y_0=0 +datum=potsdam +units=m +no_defs  <>
# DHDN / 3-degree Gauss zone 4 (deprecated)
<31464> +proj=tmerc +lat_0=0 +lon_0=12 +k=1 +x_0=4500000 +y_0=0 +datum=potsdam +units=m +no_defs  <>
# DHDN / 3-degree Gauss zone 5 (deprecated)
<31465> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=5500000 +y_0=0 +datum=potsdam +units=m +no_defs  <>
# DHDN / 3-degree Gauss-Kruger zone 2
<31466> +proj=tmerc +lat_0=0 +lon_0=6 +k=1 +x_0=2500000 +y_0=0 +datum=potsdam +units=m +no_defs  <>
# DHDN / 3-degree Gauss-Kruger zone 3
<31467> +proj=tmerc +lat_0=0 +lon_0=9 +k=1 +x_0=3500000 +y_0=0 +datum=potsdam +units=m +no_defs  <>
# DHDN / 3-degree Gauss-Kruger zone 4
<31468> +proj=tmerc +lat_0=0 +lon_0=12 +k=1 +x_0=4500000 +y_0=0 +datum=potsdam +units=m +no_defs  <>
# DHDN / 3-degree Gauss-Kruger zone 5
<31469> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=5500000 +y_0=0 +datum=potsdam +units=m +no_defs  <>
# Conakry 1905 / UTM zone 28N
<31528> +proj=utm +zone=28 +a=6378249.2 +b=6356515 +towgs84=-23,259,-9,0,0,0,0 +units=m +no_defs  <>
# Conakry 1905 / UTM zone 29N
<31529> +proj=utm +zone=29 +a=6378249.2 +b=6356515 +towgs84=-23,259,-9,0,0,0,0 +units=m +no_defs  <>
# Dealul Piscului 1930 / Stereo 33
<31600> +proj=sterea +lat_0=45.9 +lon_0=25.39246588888889 +k=0.9996667 +x_0=500000 +y_0=500000 +ellps=intl +towgs84=103.25,-100.4,-307.19,0,0,0,0 +units=m +no_defs  <>
# Dealul Piscului 1970/ Stereo 70 (deprecated)
<31700> +proj=sterea +lat_0=46 +lon_0=25 +k=0.99975 +x_0=500000 +y_0=500000 +ellps=krass +towgs84=28,-121,-77,0,0,0,0 +units=m +no_defs  <>
# NGN / UTM zone 38N
<31838> +proj=utm +zone=38 +ellps=WGS84 +towgs84=-3.2,-5.7,2.8,0,0,0,0 +units=m +no_defs  <>
# NGN / UTM zone 39N
<31839> +proj=utm +zone=39 +ellps=WGS84 +towgs84=-3.2,-5.7,2.8,0,0,0,0 +units=m +no_defs  <>
# KUDAMS / KTM (deprecated)
<31900> +proj=tmerc +lat_0=0 +lon_0=48 +k=0.9996 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=-20.8,11.3,2.4,0,0,0,0 +units=m +no_defs  <>
# KUDAMS / KTM
<31901> +proj=tmerc +lat_0=0 +lon_0=48 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=-20.8,11.3,2.4,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 11N
<31965> +proj=utm +zone=11 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 12N
<31966> +proj=utm +zone=12 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 13N
<31967> +proj=utm +zone=13 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 14N
<31968> +proj=utm +zone=14 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 15N
<31969> +proj=utm +zone=15 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 16N
<31970> +proj=utm +zone=16 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 17N
<31971> +proj=utm +zone=17 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 18N
<31972> +proj=utm +zone=18 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 19N
<31973> +proj=utm +zone=19 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 20N
<31974> +proj=utm +zone=20 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 21N
<31975> +proj=utm +zone=21 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 22N
<31976> +proj=utm +zone=22 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 17S
<31977> +proj=utm +zone=17 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 18S
<31978> +proj=utm +zone=18 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 19S
<31979> +proj=utm +zone=19 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 20S
<31980> +proj=utm +zone=20 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 21S
<31981> +proj=utm +zone=21 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 22S
<31982> +proj=utm +zone=22 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 23S
<31983> +proj=utm +zone=23 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 24S
<31984> +proj=utm +zone=24 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 2000 / UTM zone 25S
<31985> +proj=utm +zone=25 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 1995 / UTM zone 17N
<31986> +proj=utm +zone=17 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 1995 / UTM zone 18N
<31987> +proj=utm +zone=18 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 1995 / UTM zone 19N
<31988> +proj=utm +zone=19 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 1995 / UTM zone 20N
<31989> +proj=utm +zone=20 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 1995 / UTM zone 21N
<31990> +proj=utm +zone=21 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 1995 / UTM zone 22N
<31991> +proj=utm +zone=22 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 1995 / UTM zone 17S
<31992> +proj=utm +zone=17 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 1995 / UTM zone 18S
<31993> +proj=utm +zone=18 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 1995 / UTM zone 19S
<31994> +proj=utm +zone=19 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 1995 / UTM zone 20S
<31995> +proj=utm +zone=20 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 1995 / UTM zone 21S
<31996> +proj=utm +zone=21 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 1995 / UTM zone 22S
<31997> +proj=utm +zone=22 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 1995 / UTM zone 23S
<31998> +proj=utm +zone=23 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 1995 / UTM zone 24S
<31999> +proj=utm +zone=24 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# SIRGAS 1995 / UTM zone 25S
<32000> +proj=utm +zone=25 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs  <>
# NAD27 / Montana North
<32001> +proj=lcc +lat_1=48.71666666666667 +lat_2=47.85 +lat_0=47 +lon_0=-109.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Montana Central
<32002> +proj=lcc +lat_1=47.88333333333333 +lat_2=46.45 +lat_0=45.83333333333334 +lon_0=-109.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Montana South
<32003> +proj=lcc +lat_1=46.4 +lat_2=44.86666666666667 +lat_0=44 +lon_0=-109.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Nebraska North
<32005> +proj=lcc +lat_1=41.85 +lat_2=42.81666666666667 +lat_0=41.33333333333334 +lon_0=-100 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Nebraska South
<32006> +proj=lcc +lat_1=40.28333333333333 +lat_2=41.71666666666667 +lat_0=39.66666666666666 +lon_0=-99.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Nevada East
<32007> +proj=tmerc +lat_0=34.75 +lon_0=-115.5833333333333 +k=0.9999 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Nevada Central
<32008> +proj=tmerc +lat_0=34.75 +lon_0=-116.6666666666667 +k=0.9999 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Nevada West
<32009> +proj=tmerc +lat_0=34.75 +lon_0=-118.5833333333333 +k=0.9999 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / New Hampshire
<32010> +proj=tmerc +lat_0=42.5 +lon_0=-71.66666666666667 +k=0.999966667 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / New Jersey
<32011> +proj=tmerc +lat_0=38.83333333333334 +lon_0=-74.66666666666667 +k=0.9999749999999999 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / New Mexico East
<32012> +proj=tmerc +lat_0=31 +lon_0=-104.3333333333333 +k=0.999909091 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / New Mexico Central
<32013> +proj=tmerc +lat_0=31 +lon_0=-106.25 +k=0.9999 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / New Mexico West
<32014> +proj=tmerc +lat_0=31 +lon_0=-107.8333333333333 +k=0.999916667 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / New York East
<32015> +proj=tmerc +lat_0=40 +lon_0=-74.33333333333333 +k=0.999966667 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / New York Central
<32016> +proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / New York West
<32017> +proj=tmerc +lat_0=40 +lon_0=-78.58333333333333 +k=0.9999375 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / New York Long Island (deprecated)
<32018> +proj=lcc +lat_1=41.03333333333333 +lat_2=40.66666666666666 +lat_0=40.5 +lon_0=-74 +x_0=304800.6096012192 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / North Carolina
<32019> +proj=lcc +lat_1=34.33333333333334 +lat_2=36.16666666666666 +lat_0=33.75 +lon_0=-79 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / North Dakota North
<32020> +proj=lcc +lat_1=47.43333333333333 +lat_2=48.73333333333333 +lat_0=47 +lon_0=-100.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / North Dakota South
<32021> +proj=lcc +lat_1=46.18333333333333 +lat_2=47.48333333333333 +lat_0=45.66666666666666 +lon_0=-100.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Ohio North
<32022> +proj=lcc +lat_1=40.43333333333333 +lat_2=41.7 +lat_0=39.66666666666666 +lon_0=-82.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Ohio South
<32023> +proj=lcc +lat_1=38.73333333333333 +lat_2=40.03333333333333 +lat_0=38 +lon_0=-82.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Oklahoma North
<32024> +proj=lcc +lat_1=35.56666666666667 +lat_2=36.76666666666667 +lat_0=35 +lon_0=-98 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Oklahoma South
<32025> +proj=lcc +lat_1=33.93333333333333 +lat_2=35.23333333333333 +lat_0=33.33333333333334 +lon_0=-98 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Oregon North
<32026> +proj=lcc +lat_1=44.33333333333334 +lat_2=46 +lat_0=43.66666666666666 +lon_0=-120.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Oregon South
<32027> +proj=lcc +lat_1=42.33333333333334 +lat_2=44 +lat_0=41.66666666666666 +lon_0=-120.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Pennsylvania North
<32028> +proj=lcc +lat_1=40.88333333333333 +lat_2=41.95 +lat_0=40.16666666666666 +lon_0=-77.75 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Pennsylvania South (deprecated)
<32029> +proj=lcc +lat_1=39.93333333333333 +lat_2=40.8 +lat_0=39.33333333333334 +lon_0=-77.75 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Rhode Island
<32030> +proj=tmerc +lat_0=41.08333333333334 +lon_0=-71.5 +k=0.9999938 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / South Carolina North
<32031> +proj=lcc +lat_1=33.76666666666667 +lat_2=34.96666666666667 +lat_0=33 +lon_0=-81 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / South Carolina South
<32033> +proj=lcc +lat_1=32.33333333333334 +lat_2=33.66666666666666 +lat_0=31.83333333333333 +lon_0=-81 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / South Dakota North
<32034> +proj=lcc +lat_1=44.41666666666666 +lat_2=45.68333333333333 +lat_0=43.83333333333334 +lon_0=-100 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / South Dakota South
<32035> +proj=lcc +lat_1=42.83333333333334 +lat_2=44.4 +lat_0=42.33333333333334 +lon_0=-100.3333333333333 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Tennessee (deprecated)
<32036> +proj=lcc +lat_1=35.25 +lat_2=36.41666666666666 +lat_0=34.66666666666666 +lon_0=-86 +x_0=30480.06096012192 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Texas North
<32037> +proj=lcc +lat_1=34.65 +lat_2=36.18333333333333 +lat_0=34 +lon_0=-101.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Texas North Central
<32038> +proj=lcc +lat_1=32.13333333333333 +lat_2=33.96666666666667 +lat_0=31.66666666666667 +lon_0=-97.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Texas Central
<32039> +proj=lcc +lat_1=30.11666666666667 +lat_2=31.88333333333333 +lat_0=29.66666666666667 +lon_0=-100.3333333333333 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Texas South Central
<32040> +proj=lcc +lat_1=28.38333333333333 +lat_2=30.28333333333333 +lat_0=27.83333333333333 +lon_0=-99 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Texas South
<32041> +proj=lcc +lat_1=26.16666666666667 +lat_2=27.83333333333333 +lat_0=25.66666666666667 +lon_0=-98.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Utah North
<32042> +proj=lcc +lat_1=40.71666666666667 +lat_2=41.78333333333333 +lat_0=40.33333333333334 +lon_0=-111.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Utah Central
<32043> +proj=lcc +lat_1=39.01666666666667 +lat_2=40.65 +lat_0=38.33333333333334 +lon_0=-111.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Utah South
<32044> +proj=lcc +lat_1=37.21666666666667 +lat_2=38.35 +lat_0=36.66666666666666 +lon_0=-111.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Vermont
<32045> +proj=tmerc +lat_0=42.5 +lon_0=-72.5 +k=0.999964286 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Virginia North
<32046> +proj=lcc +lat_1=38.03333333333333 +lat_2=39.2 +lat_0=37.66666666666666 +lon_0=-78.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Virginia South
<32047> +proj=lcc +lat_1=36.76666666666667 +lat_2=37.96666666666667 +lat_0=36.33333333333334 +lon_0=-78.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Washington North
<32048> +proj=lcc +lat_1=47.5 +lat_2=48.73333333333333 +lat_0=47 +lon_0=-120.8333333333333 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Washington South
<32049> +proj=lcc +lat_1=45.83333333333334 +lat_2=47.33333333333334 +lat_0=45.33333333333334 +lon_0=-120.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / West Virginia North
<32050> +proj=lcc +lat_1=39 +lat_2=40.25 +lat_0=38.5 +lon_0=-79.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / West Virginia South
<32051> +proj=lcc +lat_1=37.48333333333333 +lat_2=38.88333333333333 +lat_0=37 +lon_0=-81 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Wisconsin North
<32052> +proj=lcc +lat_1=45.56666666666667 +lat_2=46.76666666666667 +lat_0=45.16666666666666 +lon_0=-90 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Wisconsin Central
<32053> +proj=lcc +lat_1=44.25 +lat_2=45.5 +lat_0=43.83333333333334 +lon_0=-90 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Wisconsin South
<32054> +proj=lcc +lat_1=42.73333333333333 +lat_2=44.06666666666667 +lat_0=42 +lon_0=-90 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Wyoming East
<32055> +proj=tmerc +lat_0=40.66666666666666 +lon_0=-105.1666666666667 +k=0.999941177 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Wyoming East Central
<32056> +proj=tmerc +lat_0=40.66666666666666 +lon_0=-107.3333333333333 +k=0.999941177 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Wyoming West Central
<32057> +proj=tmerc +lat_0=40.66666666666666 +lon_0=-108.75 +k=0.999941177 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Wyoming West
<32058> +proj=tmerc +lat_0=40.66666666666666 +lon_0=-110.0833333333333 +k=0.999941177 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / Guatemala Norte (deprecated)
<32061> +proj=lcc +lat_1=16.81666666666667 +lat_0=16.81666666666667 +lon_0=-90.33333333333333 +k_0=0.99992226 +x_0=500000 +y_0=292209.579 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / Guatemala Sur (deprecated)
<32062> +proj=lcc +lat_1=14.9 +lat_0=14.9 +lon_0=-90.33333333333333 +k_0=0.99989906 +x_0=500000 +y_0=325992.681 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / BLM 14N (ftUS)
<32064> +proj=tmerc +lat_0=0 +lon_0=-99 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / BLM 15N (ftUS)
<32065> +proj=tmerc +lat_0=0 +lon_0=-93 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / BLM 16N (ftUS)
<32066> +proj=tmerc +lat_0=0 +lon_0=-87 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / BLM 17N (ftUS)
<32067> +proj=tmerc +lat_0=0 +lon_0=-81 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / BLM 14N (feet) (deprecated)
<32074> +proj=tmerc +lat_0=0 +lon_0=-99 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / BLM 15N (feet) (deprecated)
<32075> +proj=tmerc +lat_0=0 +lon_0=-93 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / BLM 16N (feet) (deprecated)
<32076> +proj=tmerc +lat_0=0 +lon_0=-87 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / BLM 17N (feet) (deprecated)
<32077> +proj=tmerc +lat_0=0 +lon_0=-81 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD27 / MTM zone 1
<32081> +proj=tmerc +lat_0=0 +lon_0=-53 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / MTM zone 2
<32082> +proj=tmerc +lat_0=0 +lon_0=-56 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / MTM zone 3
<32083> +proj=tmerc +lat_0=0 +lon_0=-58.5 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / MTM zone 4
<32084> +proj=tmerc +lat_0=0 +lon_0=-61.5 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / MTM zone 5
<32085> +proj=tmerc +lat_0=0 +lon_0=-64.5 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / MTM zone 6
<32086> +proj=tmerc +lat_0=0 +lon_0=-67.5 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / Quebec Lambert
<32098> +proj=lcc +lat_1=60 +lat_2=46 +lat_0=44 +lon_0=-68.5 +x_0=0 +y_0=0 +datum=NAD27 +units=m +no_defs  <>
# NAD27 / Louisiana Offshore
<32099> +proj=lcc +lat_1=27.83333333333333 +lat_2=26.16666666666667 +lat_0=25.66666666666667 +lon_0=-91.33333333333333 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +no_defs  <>
# NAD83 / Montana
<32100> +proj=lcc +lat_1=49 +lat_2=45 +lat_0=44.25 +lon_0=-109.5 +x_0=600000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Nebraska
<32104> +proj=lcc +lat_1=43 +lat_2=40 +lat_0=39.83333333333334 +lon_0=-100 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Nevada East
<32107> +proj=tmerc +lat_0=34.75 +lon_0=-115.5833333333333 +k=0.9999 +x_0=200000 +y_0=8000000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Nevada Central
<32108> +proj=tmerc +lat_0=34.75 +lon_0=-116.6666666666667 +k=0.9999 +x_0=500000 +y_0=6000000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Nevada West
<32109> +proj=tmerc +lat_0=34.75 +lon_0=-118.5833333333333 +k=0.9999 +x_0=800000 +y_0=4000000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / New Hampshire
<32110> +proj=tmerc +lat_0=42.5 +lon_0=-71.66666666666667 +k=0.999966667 +x_0=300000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / New Jersey
<32111> +proj=tmerc +lat_0=38.83333333333334 +lon_0=-74.5 +k=0.9999 +x_0=150000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / New Mexico East
<32112> +proj=tmerc +lat_0=31 +lon_0=-104.3333333333333 +k=0.999909091 +x_0=165000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / New Mexico Central
<32113> +proj=tmerc +lat_0=31 +lon_0=-106.25 +k=0.9999 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / New Mexico West
<32114> +proj=tmerc +lat_0=31 +lon_0=-107.8333333333333 +k=0.999916667 +x_0=830000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / New York East
<32115> +proj=tmerc +lat_0=38.83333333333334 +lon_0=-74.5 +k=0.9999 +x_0=150000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / New York Central
<32116> +proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=250000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / New York West
<32117> +proj=tmerc +lat_0=40 +lon_0=-78.58333333333333 +k=0.9999375 +x_0=350000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / New York Long Island
<32118> +proj=lcc +lat_1=41.03333333333333 +lat_2=40.66666666666666 +lat_0=40.16666666666666 +lon_0=-74 +x_0=300000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / North Carolina
<32119> +proj=lcc +lat_1=36.16666666666666 +lat_2=34.33333333333334 +lat_0=33.75 +lon_0=-79 +x_0=609601.22 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / North Dakota North
<32120> +proj=lcc +lat_1=48.73333333333333 +lat_2=47.43333333333333 +lat_0=47 +lon_0=-100.5 +x_0=600000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / North Dakota South
<32121> +proj=lcc +lat_1=47.48333333333333 +lat_2=46.18333333333333 +lat_0=45.66666666666666 +lon_0=-100.5 +x_0=600000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Ohio North
<32122> +proj=lcc +lat_1=41.7 +lat_2=40.43333333333333 +lat_0=39.66666666666666 +lon_0=-82.5 +x_0=600000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Ohio South
<32123> +proj=lcc +lat_1=40.03333333333333 +lat_2=38.73333333333333 +lat_0=38 +lon_0=-82.5 +x_0=600000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Oklahoma North
<32124> +proj=lcc +lat_1=36.76666666666667 +lat_2=35.56666666666667 +lat_0=35 +lon_0=-98 +x_0=600000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Oklahoma South
<32125> +proj=lcc +lat_1=35.23333333333333 +lat_2=33.93333333333333 +lat_0=33.33333333333334 +lon_0=-98 +x_0=600000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Oregon North
<32126> +proj=lcc +lat_1=46 +lat_2=44.33333333333334 +lat_0=43.66666666666666 +lon_0=-120.5 +x_0=2500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Oregon South
<32127> +proj=lcc +lat_1=44 +lat_2=42.33333333333334 +lat_0=41.66666666666666 +lon_0=-120.5 +x_0=1500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Pennsylvania North
<32128> +proj=lcc +lat_1=41.95 +lat_2=40.88333333333333 +lat_0=40.16666666666666 +lon_0=-77.75 +x_0=600000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Pennsylvania South
<32129> +proj=lcc +lat_1=40.96666666666667 +lat_2=39.93333333333333 +lat_0=39.33333333333334 +lon_0=-77.75 +x_0=600000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Rhode Island
<32130> +proj=tmerc +lat_0=41.08333333333334 +lon_0=-71.5 +k=0.99999375 +x_0=100000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / South Carolina
<32133> +proj=lcc +lat_1=34.83333333333334 +lat_2=32.5 +lat_0=31.83333333333333 +lon_0=-81 +x_0=609600 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / South Dakota North
<32134> +proj=lcc +lat_1=45.68333333333333 +lat_2=44.41666666666666 +lat_0=43.83333333333334 +lon_0=-100 +x_0=600000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / South Dakota South
<32135> +proj=lcc +lat_1=44.4 +lat_2=42.83333333333334 +lat_0=42.33333333333334 +lon_0=-100.3333333333333 +x_0=600000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Tennessee
<32136> +proj=lcc +lat_1=36.41666666666666 +lat_2=35.25 +lat_0=34.33333333333334 +lon_0=-86 +x_0=600000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Texas North
<32137> +proj=lcc +lat_1=36.18333333333333 +lat_2=34.65 +lat_0=34 +lon_0=-101.5 +x_0=200000 +y_0=1000000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Texas North Central
<32138> +proj=lcc +lat_1=33.96666666666667 +lat_2=32.13333333333333 +lat_0=31.66666666666667 +lon_0=-98.5 +x_0=600000 +y_0=2000000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Texas Central
<32139> +proj=lcc +lat_1=31.88333333333333 +lat_2=30.11666666666667 +lat_0=29.66666666666667 +lon_0=-100.3333333333333 +x_0=700000 +y_0=3000000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Texas South Central
<32140> +proj=lcc +lat_1=30.28333333333333 +lat_2=28.38333333333333 +lat_0=27.83333333333333 +lon_0=-99 +x_0=600000 +y_0=4000000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Texas South
<32141> +proj=lcc +lat_1=27.83333333333333 +lat_2=26.16666666666667 +lat_0=25.66666666666667 +lon_0=-98.5 +x_0=300000 +y_0=5000000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Utah North
<32142> +proj=lcc +lat_1=41.78333333333333 +lat_2=40.71666666666667 +lat_0=40.33333333333334 +lon_0=-111.5 +x_0=500000 +y_0=1000000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Utah Central
<32143> +proj=lcc +lat_1=40.65 +lat_2=39.01666666666667 +lat_0=38.33333333333334 +lon_0=-111.5 +x_0=500000 +y_0=2000000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Utah South
<32144> +proj=lcc +lat_1=38.35 +lat_2=37.21666666666667 +lat_0=36.66666666666666 +lon_0=-111.5 +x_0=500000 +y_0=3000000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Vermont
<32145> +proj=tmerc +lat_0=42.5 +lon_0=-72.5 +k=0.999964286 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Virginia North
<32146> +proj=lcc +lat_1=39.2 +lat_2=38.03333333333333 +lat_0=37.66666666666666 +lon_0=-78.5 +x_0=3500000 +y_0=2000000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Virginia South
<32147> +proj=lcc +lat_1=37.96666666666667 +lat_2=36.76666666666667 +lat_0=36.33333333333334 +lon_0=-78.5 +x_0=3500000 +y_0=1000000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Washington North
<32148> +proj=lcc +lat_1=48.73333333333333 +lat_2=47.5 +lat_0=47 +lon_0=-120.8333333333333 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Washington South
<32149> +proj=lcc +lat_1=47.33333333333334 +lat_2=45.83333333333334 +lat_0=45.33333333333334 +lon_0=-120.5 +x_0=500000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / West Virginia North
<32150> +proj=lcc +lat_1=40.25 +lat_2=39 +lat_0=38.5 +lon_0=-79.5 +x_0=600000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / West Virginia South
<32151> +proj=lcc +lat_1=38.88333333333333 +lat_2=37.48333333333333 +lat_0=37 +lon_0=-81 +x_0=600000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Wisconsin North
<32152> +proj=lcc +lat_1=46.76666666666667 +lat_2=45.56666666666667 +lat_0=45.16666666666666 +lon_0=-90 +x_0=600000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Wisconsin Central
<32153> +proj=lcc +lat_1=45.5 +lat_2=44.25 +lat_0=43.83333333333334 +lon_0=-90 +x_0=600000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Wisconsin South
<32154> +proj=lcc +lat_1=44.06666666666667 +lat_2=42.73333333333333 +lat_0=42 +lon_0=-90 +x_0=600000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Wyoming East
<32155> +proj=tmerc +lat_0=40.5 +lon_0=-105.1666666666667 +k=0.9999375 +x_0=200000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Wyoming East Central
<32156> +proj=tmerc +lat_0=40.5 +lon_0=-107.3333333333333 +k=0.9999375 +x_0=400000 +y_0=100000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Wyoming West Central
<32157> +proj=tmerc +lat_0=40.5 +lon_0=-108.75 +k=0.9999375 +x_0=600000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Wyoming West
<32158> +proj=tmerc +lat_0=40.5 +lon_0=-110.0833333333333 +k=0.9999375 +x_0=800000 +y_0=100000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Puerto Rico & Virgin Is.
<32161> +proj=lcc +lat_1=18.43333333333333 +lat_2=18.03333333333333 +lat_0=17.83333333333333 +lon_0=-66.43333333333334 +x_0=200000 +y_0=200000 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / BLM 14N (ftUS)
<32164> +proj=tmerc +lat_0=0 +lon_0=-99 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / BLM 15N (ftUS)
<32165> +proj=tmerc +lat_0=0 +lon_0=-93 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / BLM 16N (ftUS)
<32166> +proj=tmerc +lat_0=0 +lon_0=-87 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / BLM 17N (ftUS)
<32167> +proj=tmerc +lat_0=0 +lon_0=-81 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=NAD83 +units=us-ft +no_defs  <>
# NAD83 / SCoPQ zone 2 (deprecated)
<32180> +proj=tmerc +lat_0=0 +lon_0=-55.5 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / MTM zone 1
<32181> +proj=tmerc +lat_0=0 +lon_0=-53 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / MTM zone 2
<32182> +proj=tmerc +lat_0=0 +lon_0=-56 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / MTM zone 3
<32183> +proj=tmerc +lat_0=0 +lon_0=-58.5 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / MTM zone 4
<32184> +proj=tmerc +lat_0=0 +lon_0=-61.5 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / MTM zone 5
<32185> +proj=tmerc +lat_0=0 +lon_0=-64.5 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / MTM zone 6
<32186> +proj=tmerc +lat_0=0 +lon_0=-67.5 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / MTM zone 7
<32187> +proj=tmerc +lat_0=0 +lon_0=-70.5 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / MTM zone 8
<32188> +proj=tmerc +lat_0=0 +lon_0=-73.5 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / MTM zone 9
<32189> +proj=tmerc +lat_0=0 +lon_0=-76.5 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / MTM zone 10
<32190> +proj=tmerc +lat_0=0 +lon_0=-79.5 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / MTM zone 11
<32191> +proj=tmerc +lat_0=0 +lon_0=-82.5 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / MTM zone 12
<32192> +proj=tmerc +lat_0=0 +lon_0=-81 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / MTM zone 13
<32193> +proj=tmerc +lat_0=0 +lon_0=-84 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / MTM zone 14
<32194> +proj=tmerc +lat_0=0 +lon_0=-87 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / MTM zone 15
<32195> +proj=tmerc +lat_0=0 +lon_0=-90 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / MTM zone 16
<32196> +proj=tmerc +lat_0=0 +lon_0=-93 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / MTM zone 17
<32197> +proj=tmerc +lat_0=0 +lon_0=-96 +k=0.9999 +x_0=304800 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Quebec Lambert
<32198> +proj=lcc +lat_1=60 +lat_2=46 +lat_0=44 +lon_0=-68.5 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# NAD83 / Louisiana Offshore
<32199> +proj=lcc +lat_1=27.83333333333333 +lat_2=26.16666666666667 +lat_0=25.5 +lon_0=-91.33333333333333 +x_0=1000000 +y_0=0 +datum=NAD83 +units=m +no_defs  <>
# WGS 72 / UTM zone 1N
<32201> +proj=utm +zone=1 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 2N
<32202> +proj=utm +zone=2 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 3N
<32203> +proj=utm +zone=3 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 4N
<32204> +proj=utm +zone=4 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 5N
<32205> +proj=utm +zone=5 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 6N
<32206> +proj=utm +zone=6 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 7N
<32207> +proj=utm +zone=7 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 8N
<32208> +proj=utm +zone=8 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 9N
<32209> +proj=utm +zone=9 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 10N
<32210> +proj=utm +zone=10 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 11N
<32211> +proj=utm +zone=11 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 12N
<32212> +proj=utm +zone=12 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 13N
<32213> +proj=utm +zone=13 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 14N
<32214> +proj=utm +zone=14 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 15N
<32215> +proj=utm +zone=15 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 16N
<32216> +proj=utm +zone=16 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 17N
<32217> +proj=utm +zone=17 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 18N
<32218> +proj=utm +zone=18 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 19N
<32219> +proj=utm +zone=19 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 20N
<32220> +proj=utm +zone=20 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 21N
<32221> +proj=utm +zone=21 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 22N
<32222> +proj=utm +zone=22 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 23N
<32223> +proj=utm +zone=23 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 24N
<32224> +proj=utm +zone=24 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 25N
<32225> +proj=utm +zone=25 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 26N
<32226> +proj=utm +zone=26 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 27N
<32227> +proj=utm +zone=27 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 28N
<32228> +proj=utm +zone=28 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 29N
<32229> +proj=utm +zone=29 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 30N
<32230> +proj=utm +zone=30 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 31N
<32231> +proj=utm +zone=31 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 32N
<32232> +proj=utm +zone=32 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 33N
<32233> +proj=utm +zone=33 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 34N
<32234> +proj=utm +zone=34 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 35N
<32235> +proj=utm +zone=35 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 36N
<32236> +proj=utm +zone=36 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 37N
<32237> +proj=utm +zone=37 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 38N
<32238> +proj=utm +zone=38 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 39N
<32239> +proj=utm +zone=39 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 40N
<32240> +proj=utm +zone=40 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 41N
<32241> +proj=utm +zone=41 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 42N
<32242> +proj=utm +zone=42 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 43N
<32243> +proj=utm +zone=43 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 44N
<32244> +proj=utm +zone=44 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 45N
<32245> +proj=utm +zone=45 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 46N
<32246> +proj=utm +zone=46 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 47N
<32247> +proj=utm +zone=47 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 48N
<32248> +proj=utm +zone=48 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 49N
<32249> +proj=utm +zone=49 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 50N
<32250> +proj=utm +zone=50 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 51N
<32251> +proj=utm +zone=51 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 52N
<32252> +proj=utm +zone=52 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 53N
<32253> +proj=utm +zone=53 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 54N
<32254> +proj=utm +zone=54 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 55N
<32255> +proj=utm +zone=55 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 56N
<32256> +proj=utm +zone=56 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 57N
<32257> +proj=utm +zone=57 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 58N
<32258> +proj=utm +zone=58 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 59N
<32259> +proj=utm +zone=59 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 60N
<32260> +proj=utm +zone=60 +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 1S
<32301> +proj=utm +zone=1 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 2S
<32302> +proj=utm +zone=2 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 3S
<32303> +proj=utm +zone=3 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 4S
<32304> +proj=utm +zone=4 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 5S
<32305> +proj=utm +zone=5 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 6S
<32306> +proj=utm +zone=6 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 7S
<32307> +proj=utm +zone=7 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 8S
<32308> +proj=utm +zone=8 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 9S
<32309> +proj=utm +zone=9 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 10S
<32310> +proj=utm +zone=10 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 11S
<32311> +proj=utm +zone=11 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 12S
<32312> +proj=utm +zone=12 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 13S
<32313> +proj=utm +zone=13 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 14S
<32314> +proj=utm +zone=14 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 15S
<32315> +proj=utm +zone=15 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 16S
<32316> +proj=utm +zone=16 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 17S
<32317> +proj=utm +zone=17 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 18S
<32318> +proj=utm +zone=18 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 19S
<32319> +proj=utm +zone=19 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 20S
<32320> +proj=utm +zone=20 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 21S
<32321> +proj=utm +zone=21 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 22S
<32322> +proj=utm +zone=22 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 23S
<32323> +proj=utm +zone=23 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 24S
<32324> +proj=utm +zone=24 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 25S
<32325> +proj=utm +zone=25 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 26S
<32326> +proj=utm +zone=26 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 27S
<32327> +proj=utm +zone=27 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 28S
<32328> +proj=utm +zone=28 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 29S
<32329> +proj=utm +zone=29 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 30S
<32330> +proj=utm +zone=30 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 31S
<32331> +proj=utm +zone=31 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 32S
<32332> +proj=utm +zone=32 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 33S
<32333> +proj=utm +zone=33 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 34S
<32334> +proj=utm +zone=34 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 35S
<32335> +proj=utm +zone=35 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 36S
<32336> +proj=utm +zone=36 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 37S
<32337> +proj=utm +zone=37 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 38S
<32338> +proj=utm +zone=38 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 39S
<32339> +proj=utm +zone=39 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 40S
<32340> +proj=utm +zone=40 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 41S
<32341> +proj=utm +zone=41 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 42S
<32342> +proj=utm +zone=42 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 43S
<32343> +proj=utm +zone=43 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 44S
<32344> +proj=utm +zone=44 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 45S
<32345> +proj=utm +zone=45 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 46S
<32346> +proj=utm +zone=46 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 47S
<32347> +proj=utm +zone=47 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 48S
<32348> +proj=utm +zone=48 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 49S
<32349> +proj=utm +zone=49 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 50S
<32350> +proj=utm +zone=50 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 51S
<32351> +proj=utm +zone=51 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 52S
<32352> +proj=utm +zone=52 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 53S
<32353> +proj=utm +zone=53 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 54S
<32354> +proj=utm +zone=54 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 55S
<32355> +proj=utm +zone=55 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 56S
<32356> +proj=utm +zone=56 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 57S
<32357> +proj=utm +zone=57 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 58S
<32358> +proj=utm +zone=58 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 59S
<32359> +proj=utm +zone=59 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72 / UTM zone 60S
<32360> +proj=utm +zone=60 +south +ellps=WGS72 +towgs84=0,0,4.5,0,0,0.554,0.2263 +units=m +no_defs  <>
# WGS 72BE / UTM zone 1N
<32401> +proj=utm +zone=1 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 2N
<32402> +proj=utm +zone=2 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 3N
<32403> +proj=utm +zone=3 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 4N
<32404> +proj=utm +zone=4 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 5N
<32405> +proj=utm +zone=5 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 6N
<32406> +proj=utm +zone=6 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 7N
<32407> +proj=utm +zone=7 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 8N
<32408> +proj=utm +zone=8 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 9N
<32409> +proj=utm +zone=9 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 10N
<32410> +proj=utm +zone=10 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 11N
<32411> +proj=utm +zone=11 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 12N
<32412> +proj=utm +zone=12 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 13N
<32413> +proj=utm +zone=13 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 14N
<32414> +proj=utm +zone=14 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 15N
<32415> +proj=utm +zone=15 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 16N
<32416> +proj=utm +zone=16 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 17N
<32417> +proj=utm +zone=17 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 18N
<32418> +proj=utm +zone=18 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 19N
<32419> +proj=utm +zone=19 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 20N
<32420> +proj=utm +zone=20 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 21N
<32421> +proj=utm +zone=21 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 22N
<32422> +proj=utm +zone=22 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 23N
<32423> +proj=utm +zone=23 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 24N
<32424> +proj=utm +zone=24 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 25N
<32425> +proj=utm +zone=25 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 26N
<32426> +proj=utm +zone=26 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 27N
<32427> +proj=utm +zone=27 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 28N
<32428> +proj=utm +zone=28 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 29N
<32429> +proj=utm +zone=29 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 30N
<32430> +proj=utm +zone=30 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 31N
<32431> +proj=utm +zone=31 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 32N
<32432> +proj=utm +zone=32 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 33N
<32433> +proj=utm +zone=33 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 34N
<32434> +proj=utm +zone=34 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 35N
<32435> +proj=utm +zone=35 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 36N
<32436> +proj=utm +zone=36 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 37N
<32437> +proj=utm +zone=37 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 38N
<32438> +proj=utm +zone=38 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 39N
<32439> +proj=utm +zone=39 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 40N
<32440> +proj=utm +zone=40 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 41N
<32441> +proj=utm +zone=41 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 42N
<32442> +proj=utm +zone=42 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 43N
<32443> +proj=utm +zone=43 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 44N
<32444> +proj=utm +zone=44 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 45N
<32445> +proj=utm +zone=45 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 46N
<32446> +proj=utm +zone=46 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 47N
<32447> +proj=utm +zone=47 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 48N
<32448> +proj=utm +zone=48 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 49N
<32449> +proj=utm +zone=49 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 50N
<32450> +proj=utm +zone=50 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 51N
<32451> +proj=utm +zone=51 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 52N
<32452> +proj=utm +zone=52 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 53N
<32453> +proj=utm +zone=53 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 54N
<32454> +proj=utm +zone=54 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 55N
<32455> +proj=utm +zone=55 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 56N
<32456> +proj=utm +zone=56 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 57N
<32457> +proj=utm +zone=57 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 58N
<32458> +proj=utm +zone=58 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 59N
<32459> +proj=utm +zone=59 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 60N
<32460> +proj=utm +zone=60 +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 1S
<32501> +proj=utm +zone=1 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 2S
<32502> +proj=utm +zone=2 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 3S
<32503> +proj=utm +zone=3 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 4S
<32504> +proj=utm +zone=4 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 5S
<32505> +proj=utm +zone=5 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 6S
<32506> +proj=utm +zone=6 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 7S
<32507> +proj=utm +zone=7 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 8S
<32508> +proj=utm +zone=8 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 9S
<32509> +proj=utm +zone=9 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 10S
<32510> +proj=utm +zone=10 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 11S
<32511> +proj=utm +zone=11 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 12S
<32512> +proj=utm +zone=12 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 13S
<32513> +proj=utm +zone=13 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 14S
<32514> +proj=utm +zone=14 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 15S
<32515> +proj=utm +zone=15 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 16S
<32516> +proj=utm +zone=16 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 17S
<32517> +proj=utm +zone=17 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 18S
<32518> +proj=utm +zone=18 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 19S
<32519> +proj=utm +zone=19 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 20S
<32520> +proj=utm +zone=20 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 21S
<32521> +proj=utm +zone=21 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 22S
<32522> +proj=utm +zone=22 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 23S
<32523> +proj=utm +zone=23 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 24S
<32524> +proj=utm +zone=24 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 25S
<32525> +proj=utm +zone=25 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 26S
<32526> +proj=utm +zone=26 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 27S
<32527> +proj=utm +zone=27 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 28S
<32528> +proj=utm +zone=28 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 29S
<32529> +proj=utm +zone=29 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 30S
<32530> +proj=utm +zone=30 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 31S
<32531> +proj=utm +zone=31 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 32S
<32532> +proj=utm +zone=32 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 33S
<32533> +proj=utm +zone=33 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 34S
<32534> +proj=utm +zone=34 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 35S
<32535> +proj=utm +zone=35 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 36S
<32536> +proj=utm +zone=36 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 37S
<32537> +proj=utm +zone=37 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 38S
<32538> +proj=utm +zone=38 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 39S
<32539> +proj=utm +zone=39 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 40S
<32540> +proj=utm +zone=40 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 41S
<32541> +proj=utm +zone=41 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 42S
<32542> +proj=utm +zone=42 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 43S
<32543> +proj=utm +zone=43 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 44S
<32544> +proj=utm +zone=44 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 45S
<32545> +proj=utm +zone=45 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 46S
<32546> +proj=utm +zone=46 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 47S
<32547> +proj=utm +zone=47 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 48S
<32548> +proj=utm +zone=48 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 49S
<32549> +proj=utm +zone=49 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 50S
<32550> +proj=utm +zone=50 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 51S
<32551> +proj=utm +zone=51 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 52S
<32552> +proj=utm +zone=52 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 53S
<32553> +proj=utm +zone=53 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 54S
<32554> +proj=utm +zone=54 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 55S
<32555> +proj=utm +zone=55 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 56S
<32556> +proj=utm +zone=56 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 57S
<32557> +proj=utm +zone=57 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 58S
<32558> +proj=utm +zone=58 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 59S
<32559> +proj=utm +zone=59 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 72BE / UTM zone 60S
<32560> +proj=utm +zone=60 +south +ellps=WGS72 +towgs84=0,0,1.9,0,0,0.814,-0.38 +units=m +no_defs  <>
# WGS 84 / UTM grid system (northern hemisphere)
# Unable to translate coordinate system EPSG:32600 into PROJ.4 format.
#
# WGS 84 / UTM zone 1N
<32601> +proj=utm +zone=1 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 2N
<32602> +proj=utm +zone=2 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 3N
<32603> +proj=utm +zone=3 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 4N
<32604> +proj=utm +zone=4 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 5N
<32605> +proj=utm +zone=5 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 6N
<32606> +proj=utm +zone=6 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 7N
<32607> +proj=utm +zone=7 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 8N
<32608> +proj=utm +zone=8 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 9N
<32609> +proj=utm +zone=9 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 10N
<32610> +proj=utm +zone=10 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 11N
<32611> +proj=utm +zone=11 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 12N
<32612> +proj=utm +zone=12 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 13N
<32613> +proj=utm +zone=13 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 14N
<32614> +proj=utm +zone=14 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 15N
<32615> +proj=utm +zone=15 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 16N
<32616> +proj=utm +zone=16 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 17N
<32617> +proj=utm +zone=17 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 18N
<32618> +proj=utm +zone=18 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 19N
<32619> +proj=utm +zone=19 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 20N
<32620> +proj=utm +zone=20 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 21N
<32621> +proj=utm +zone=21 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 22N
<32622> +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 23N
<32623> +proj=utm +zone=23 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 24N
<32624> +proj=utm +zone=24 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 25N
<32625> +proj=utm +zone=25 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 26N
<32626> +proj=utm +zone=26 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 27N
<32627> +proj=utm +zone=27 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 28N
<32628> +proj=utm +zone=28 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 29N
<32629> +proj=utm +zone=29 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 30N
<32630> +proj=utm +zone=30 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 31N
<32631> +proj=utm +zone=31 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 32N
<32632> +proj=utm +zone=32 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 33N
<32633> +proj=utm +zone=33 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 34N
<32634> +proj=utm +zone=34 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 35N
<32635> +proj=utm +zone=35 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 36N
<32636> +proj=utm +zone=36 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 37N
<32637> +proj=utm +zone=37 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 38N
<32638> +proj=utm +zone=38 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 39N
<32639> +proj=utm +zone=39 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 40N
<32640> +proj=utm +zone=40 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 41N
<32641> +proj=utm +zone=41 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 42N
<32642> +proj=utm +zone=42 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 43N
<32643> +proj=utm +zone=43 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 44N
<32644> +proj=utm +zone=44 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 45N
<32645> +proj=utm +zone=45 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 46N
<32646> +proj=utm +zone=46 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 47N
<32647> +proj=utm +zone=47 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 48N
<32648> +proj=utm +zone=48 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 49N
<32649> +proj=utm +zone=49 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 50N
<32650> +proj=utm +zone=50 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 51N
<32651> +proj=utm +zone=51 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 52N
<32652> +proj=utm +zone=52 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 53N
<32653> +proj=utm +zone=53 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 54N
<32654> +proj=utm +zone=54 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 55N
<32655> +proj=utm +zone=55 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 56N
<32656> +proj=utm +zone=56 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 57N
<32657> +proj=utm +zone=57 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 58N
<32658> +proj=utm +zone=58 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 59N
<32659> +proj=utm +zone=59 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 60N
<32660> +proj=utm +zone=60 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UPS North (N,E)
<32661> +proj=stere +lat_0=90 +lat_ts=90 +lon_0=0 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / Plate Carree (deprecated)
<32662> +proj=eqc +lat_ts=0 +lat_0=0 +lon_0=0 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / World Equidistant Cylindrical (deprecated)
<32663> +proj=eqc +lat_ts=0 +lat_0=0 +lon_0=0 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / BLM 14N (ftUS)
<32664> +proj=tmerc +lat_0=0 +lon_0=-99 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=WGS84 +units=us-ft +no_defs  <>
# WGS 84 / BLM 15N (ftUS)
<32665> +proj=tmerc +lat_0=0 +lon_0=-93 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=WGS84 +units=us-ft +no_defs  <>
# WGS 84 / BLM 16N (ftUS)
<32666> +proj=tmerc +lat_0=0 +lon_0=-87 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=WGS84 +units=us-ft +no_defs  <>
# WGS 84 / BLM 17N (ftUS)
<32667> +proj=tmerc +lat_0=0 +lon_0=-81 +k=0.9996 +x_0=500000.001016002 +y_0=0 +datum=WGS84 +units=us-ft +no_defs  <>
# WGS 84 / UTM grid system (southern hemisphere)
# Unable to translate coordinate system EPSG:32700 into PROJ.4 format.
#
# WGS 84 / UTM zone 1S
<32701> +proj=utm +zone=1 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 2S
<32702> +proj=utm +zone=2 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 3S
<32703> +proj=utm +zone=3 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 4S
<32704> +proj=utm +zone=4 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 5S
<32705> +proj=utm +zone=5 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 6S
<32706> +proj=utm +zone=6 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 7S
<32707> +proj=utm +zone=7 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 8S
<32708> +proj=utm +zone=8 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 9S
<32709> +proj=utm +zone=9 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 10S
<32710> +proj=utm +zone=10 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 11S
<32711> +proj=utm +zone=11 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 12S
<32712> +proj=utm +zone=12 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 13S
<32713> +proj=utm +zone=13 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 14S
<32714> +proj=utm +zone=14 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 15S
<32715> +proj=utm +zone=15 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 16S
<32716> +proj=utm +zone=16 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 17S
<32717> +proj=utm +zone=17 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 18S
<32718> +proj=utm +zone=18 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 19S
<32719> +proj=utm +zone=19 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 20S
<32720> +proj=utm +zone=20 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 21S
<32721> +proj=utm +zone=21 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 22S
<32722> +proj=utm +zone=22 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 23S
<32723> +proj=utm +zone=23 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 24S
<32724> +proj=utm +zone=24 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 25S
<32725> +proj=utm +zone=25 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 26S
<32726> +proj=utm +zone=26 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 27S
<32727> +proj=utm +zone=27 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 28S
<32728> +proj=utm +zone=28 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 29S
<32729> +proj=utm +zone=29 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 30S
<32730> +proj=utm +zone=30 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 31S
<32731> +proj=utm +zone=31 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 32S
<32732> +proj=utm +zone=32 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 33S
<32733> +proj=utm +zone=33 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 34S
<32734> +proj=utm +zone=34 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 35S
<32735> +proj=utm +zone=35 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 36S
<32736> +proj=utm +zone=36 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 37S
<32737> +proj=utm +zone=37 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 38S
<32738> +proj=utm +zone=38 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 39S
<32739> +proj=utm +zone=39 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 40S
<32740> +proj=utm +zone=40 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 41S
<32741> +proj=utm +zone=41 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 42S
<32742> +proj=utm +zone=42 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 43S
<32743> +proj=utm +zone=43 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 44S
<32744> +proj=utm +zone=44 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 45S
<32745> +proj=utm +zone=45 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 46S
<32746> +proj=utm +zone=46 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 47S
<32747> +proj=utm +zone=47 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 48S
<32748> +proj=utm +zone=48 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 49S
<32749> +proj=utm +zone=49 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 50S
<32750> +proj=utm +zone=50 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 51S
<32751> +proj=utm +zone=51 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 52S
<32752> +proj=utm +zone=52 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 53S
<32753> +proj=utm +zone=53 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 54S
<32754> +proj=utm +zone=54 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 55S
<32755> +proj=utm +zone=55 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 56S
<32756> +proj=utm +zone=56 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 57S
<32757> +proj=utm +zone=57 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 58S
<32758> +proj=utm +zone=58 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 59S
<32759> +proj=utm +zone=59 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UTM zone 60S
<32760> +proj=utm +zone=60 +south +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / UPS South (N,E)
<32761> +proj=stere +lat_0=-90 +lat_ts=-90 +lon_0=0 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs  <>
# WGS 84 / TM 36 SE
<32766> +proj=tmerc +lat_0=0 +lon_0=36 +k=0.9996 +x_0=500000 +y_0=10000000 +datum=WGS84 +units=m +no_defs  <>
# TWD97
<3822> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# IGRS
<3887> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# MOLDREF99
<4000> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# RGRDC 2005
<4039> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# SREF98
<4073> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# REGCAN95
<4079> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# WGS 84 (geocentric)
<4328> +proj=geocent +datum=WGS84 +units=m +no_defs  <>
# ITRF88 (geocentric)
<4330> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ITRF89 (geocentric)
<4331> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ITRF90 (geocentric)
<4332> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ITRF91 (geocentric)
<4333> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ITRF92 (geocentric)
<4334> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ITRF93 (geocentric)
<4335> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ITRF94 (geocentric)
<4336> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ITRF96 (geocentric)
<4337> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ITRF97 (geocentric)
<4338> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# Australian Antarctic (geocentric)
<4340> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# EST97 (geocentric)
<4342> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# CHTRF95 (geocentric)
<4344> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ETRS89 (geocentric)
<4346> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# GDA94 (geocentric)
<4348> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# Hartebeesthoek94 (geocentric)
<4350> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# IRENET95 (geocentric)
<4352> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# JGD2000 (geocentric)
<4354> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# LKS94 (ETRS89) (geocentric)
<4356> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# Moznet (geocentric)
<4358> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# NAD83(CSRS) (geocentric)
<4360> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# NAD83(HARN) (geocentric)
<4362> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# NZGD2000 (geocentric)
<4364> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# POSGAR 98 (geocentric)
<4366> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# REGVEN (geocentric)
<4368> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# RGF93 (geocentric)
<4370> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# RGFG95 (geocentric)
<4372> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# RGR92 (geocentric)
<4374> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# SIRGAS (geocentric)
<4376> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# SWEREF99 (geocentric)
<4378> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# Yemen NGN96 (geocentric)
<4380> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# RGNC 1991 (geocentric)
<4382> +proj=geocent +ellps=intl +units=m +no_defs  <>
# RRAF 1991 (geocentric)
<4384> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# ITRF2000 (geocentric)
<4385> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ISN93 (geocentric)
<4387> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# LKS92 (geocentric)
<4389> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# RGSPM06
<4465> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# RGM04
<4468> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# Cadastre 1997
<4473> +proj=geocent +ellps=intl +units=m +no_defs  <>
# China Geodetic Coordinate System 2000
<4479> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# Mexico ITRF92
<4481> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# RRAF 1991
<4556> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# Slovenia 1996
<4882> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# RSRGD2000
<4884> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# BDA2000
<4886> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# HTRS96
<4888> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# WGS 66
<4890> +proj=geocent +ellps=WGS66 +units=m +no_defs  <>
# NAD83(NSRS2007)
<4892> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# JAD2001
<4894> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# ITRF2005
<4896> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# DGN95
<4897> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# LGD2006
<4899> +proj=geocent +ellps=intl +units=m +no_defs  <>
# RGNC91-93
<4906> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# GR96
<4908> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ITRF88
<4910> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ITRF89
<4911> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ITRF90
<4912> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ITRF91
<4913> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ITRF92
<4914> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ITRF93
<4915> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ITRF94
<4916> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ITRF96
<4917> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ITRF97
<4918> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ITRF2000
<4919> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# GDM2000
<4920> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# PZ-90
<4922> +proj=geocent +a=6378136 +b=6356751.361745712 +units=m +no_defs  <>
# Mauritania 1999
<4924> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# Korea 2000
<4926> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# POSGAR 94
<4928> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# Australian Antarctic
<4930> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# CHTRF95
<4932> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# EST97
<4934> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ETRS89
<4936> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# GDA94
<4938> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# Hartebeesthoek94
<4940> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# IRENET95
<4942> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ISN93
<4944> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# JGD2000
<4946> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# LKS92
<4948> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# LKS94
<4950> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# Moznet
<4952> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# NAD83(CSRS)
<4954> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# NAD83(HARN)
<4956> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# NZGD2000
<4958> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# POSGAR 98
<4960> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# REGVEN
<4962> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# RGF93
<4964> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# RGFG95
<4966> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# RGNC 1991
<4968> +proj=geocent +ellps=intl +units=m +no_defs  <>
# RGR92
<4970> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# RRAF 1991
<4972> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# SIRGAS 1995
<4974> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# SWEREF99
<4976> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# WGS 84
<4978> +proj=geocent +datum=WGS84 +units=m +no_defs  <>
# Yemen NGN96
<4980> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# IGM95
<4982> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# WGS 72
<4984> +proj=geocent +ellps=WGS72 +units=m +no_defs  <>
# WGS 72BE
<4986> +proj=geocent +ellps=WGS72 +units=m +no_defs  <>
# SIRGAS 2000
<4988> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# Lao 1993
<4990> +proj=geocent +ellps=krass +units=m +no_defs  <>
# Lao 1997
<4992> +proj=geocent +ellps=krass +units=m +no_defs  <>
# PRS92
<4994> +proj=geocent +ellps=clrk66 +units=m +no_defs  <>
# MAGNA-SIRGAS
<4996> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# RGPF
<4998> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# PTRA08
<5011> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# GDBD2009
<5244> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# TUREF
<5250> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# DRUKREF 03
<5262> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ISN2004
<5322> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ITRF2008
<5332> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# POSGAR 2007
<5341> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# MARGEN
<5352> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# SIRGAS-Chile
<5358> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# CR05
<5363> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# MACARIO SOLIS
<5368> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# Peru96
<5369> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# SIRGAS-ROU98
<5379> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# SIRGAS_ES2007.8
<5391> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# RGAF09
<5487> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# PNG94
<5544> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# UCS-2000
<5558> +proj=geocent +ellps=krass +units=m +no_defs  <>
# FEH2010
<5591> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# DB_REF
<5828> +proj=geocent +ellps=bessel +units=m +no_defs  <>
# TGD2005
<5884> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# CIGD11
<6133> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# CGRS93
<6309> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# NAD83(2011)
<6317> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# NAD83(PA11)
<6320> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# NAD83(MA11)
<6323> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# Mexico ITRF2008
<6363> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# JGD2011
<6666> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# RDN2008
<6704> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CORS96)
<6781> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# IGS08
<6934> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# IGD05
<6978> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# IG05 Intermediate CRS
<6981> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# IGD05/12
<6985> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# IG05/12 Intermediate CRS
<6988> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# RGTAAF07
<7071> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# IGD05
<7134> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# IGD05/12
<7137> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# ONGD14
<7371> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# WGS 84 (G730)
<7656> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# WGS 84 (G873)
<7658> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# WGS 84 (G1150)
<7660> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# WGS 84 (G1674)
<7662> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# WGS 84 (G1762)
<7664> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# PZ-90.02
<7677> +proj=geocent +a=6378136 +b=6356751.361745712 +units=m +no_defs  <>
# PZ-90.11
<7679> +proj=geocent +a=6378136 +b=6356751.361745712 +units=m +no_defs  <>
# GSK-2011
<7681> +proj=geocent +a=6378136.5 +b=6356751.757955603 +units=m +no_defs  <>
# Kyrg-06
<7684> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ITRF2014
<7789> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# BGS2005
<7796> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# WGS 84 (Transit)
<7815> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# GDA2020
<7842> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# St. Helena Tritan
<7879> +proj=geocent +ellps=WGS84 +units=m +no_defs  <>
# SHGD2015
<7884> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ETRF89
<7914> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ETRF90
<7916> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ETRF91
<7918> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ETRF92
<7920> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ETRF93
<7922> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ETRF94
<7924> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ETRF96
<7926> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ETRF97
<7928> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ETRF2000
<7930> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# ISN2016
<8084> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# IGS14
<8227> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CSRS96)
<8230> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CSRS)v2
<8233> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CSRS)v3
<8238> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CSRS)v4
<8242> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CSRS)v5
<8247> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CSRS)v6
<8250> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# NAD83(CSRS)v7
<8253> +proj=geocent +ellps=GRS80 +units=m +no_defs  <>
# KKJ / Finland Uniform Coordinate System + N60 height
<3901> +proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=3500000 +y_0=0 +ellps=intl +towgs84=-96.062,-82.428,-121.753,4.801,0.345,-1.376,1.496 +units=m +vunits=m +no_defs  <>
# ETRS89 / TM35FIN(N,E) + N60 height
<3902> +proj=utm +zone=35 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / TM35FIN(N,E) + N2000 height
<3903> +proj=utm +zone=35 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / DKTM1 + DVR90 height
<4097> +proj=tmerc +lat_0=0 +lon_0=9 +k=0.99998 +x_0=200000 +y_0=-5000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / DKTM2 + DVR90 height
<4098> +proj=tmerc +lat_0=0 +lon_0=10 +k=0.99998 +x_0=400000 +y_0=-5000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / DKTM3 + DVR90 height
<4099> +proj=tmerc +lat_0=0 +lon_0=11.75 +k=0.99998 +x_0=600000 +y_0=-5000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / DKTM4 + DVR90 height
<4100> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=800000 +y_0=-5000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / Faroe TM + FVR09 height
<5318> +proj=tmerc +lat_0=0 +lon_0=-7 +k=0.999997 +x_0=200000 +y_0=-6000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# NAD83 + NAVD88 height
<5498> +proj=longlat +datum=NAD83 +geoidgrids=g2012a_conus.gtx,g2012a_alaska.gtx,g2012a_guam.gtx,g2012a_hawaii.gtx,g2012a_puertorico.gtx,g2012a_samoa.gtx +vunits=m +no_defs  <>
# NAD83(HARN) + NAVD88 height
<5499> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +geoidgrids=g2012a_conus.gtx,g2012a_alaska.gtx,g2012a_guam.gtx,g2012a_hawaii.gtx,g2012a_puertorico.gtx,g2012a_samoa.gtx +vunits=m +no_defs  <>
# NAD83(NSRS2007) + NAVD88 height
<5500> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +geoidgrids=g2012a_conus.gtx,g2012a_alaska.gtx,g2012a_guam.gtx,g2012a_hawaii.gtx,g2012a_puertorico.gtx,g2012a_samoa.gtx +vunits=m +no_defs  <>
# ETRS89 / UTM zone 31N + DHHN92 height
<5554> +proj=utm +zone=31 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / UTM zone 32N + DHHN92 height
<5555> +proj=utm +zone=32 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / UTM zone 33N + DHHN92 height
<5556> +proj=utm +zone=33 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# FEH2010 / Fehmarnbelt TM + FCSVR10 height
<5598> +proj=tmerc +lat_0=0 +lon_0=11.33333333333333 +k=1 +x_0=1000000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# SWEREF99 + RH2000 height
<5628> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +vunits=m +no_defs  <>
# RGF93 / Lambert-93 + NGF-IGN69 height
<5698> +proj=lcc +lat_1=49 +lat_2=44 +lat_0=46.5 +lon_0=3 +x_0=700000 +y_0=6600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# RGF93 / Lambert-93 + NGF-IGN78 height
<5699> +proj=lcc +lat_1=49 +lat_2=44 +lat_0=46.5 +lon_0=3 +x_0=700000 +y_0=6600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# NTF (Paris) / Lambert zone I + NGF-IGN69 height
<5707> +proj=lcc +lat_1=49.50000000000001 +lat_0=49.50000000000001 +lon_0=0 +k_0=0.999877341 +x_0=600000 +y_0=1200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +vunits=m +no_defs  <>
# NTF (Paris) / Lambert zone IV + NGF-IGN78 height
<5708> +proj=lcc +lat_1=42.16500000000001 +lat_0=42.16500000000001 +lon_0=0 +k_0=0.99994471 +x_0=234.358 +y_0=4185861.369 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +vunits=m +no_defs  <>
# DB_REF / 3-degree Gauss-Kruger zone 2 (E-N) + DHHN92 height
<5832> +proj=tmerc +lat_0=0 +lon_0=6 +k=1 +x_0=2500000 +y_0=0 +ellps=bessel +units=m +vunits=m +no_defs  <>
# DB_REF / 3-degree Gauss-Kruger zone 3 (E-N) + DHHN92 height
<5833> +proj=tmerc +lat_0=0 +lon_0=9 +k=1 +x_0=3500000 +y_0=0 +ellps=bessel +units=m +vunits=m +no_defs  <>
# DB_REF / 3-degree Gauss-Kruger zone 4 (E-N) + DHHN92 height
<5834> +proj=tmerc +lat_0=0 +lon_0=12 +k=1 +x_0=4500000 +y_0=0 +ellps=bessel +units=m +vunits=m +no_defs  <>
# DB_REF / 3-degree Gauss-Kruger zone 5 (E-N) + DHHN92 height
<5835> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=5500000 +y_0=0 +ellps=bessel +units=m +vunits=m +no_defs  <>
# SWEREF99 TM + RH2000 height
<5845> +proj=utm +zone=33 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# SWEREF99 12 00 + RH2000 height
<5846> +proj=tmerc +lat_0=0 +lon_0=12 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# SWEREF99 13 30 + RH2000 height
<5847> +proj=tmerc +lat_0=0 +lon_0=13.5 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# SWEREF99 15 00 + RH2000 height
<5848> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# SWEREF99 16 30 + RH2000 height
<5849> +proj=tmerc +lat_0=0 +lon_0=16.5 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# SWEREF99 18 00 + RH2000 height
<5850> +proj=tmerc +lat_0=0 +lon_0=18 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# SWEREF99 14 15 + RH2000 height
<5851> +proj=tmerc +lat_0=0 +lon_0=14.25 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# SWEREF99 15 45 + RH2000 height
<5852> +proj=tmerc +lat_0=0 +lon_0=15.75 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# SWEREF99 17 15 + RH2000 height
<5853> +proj=tmerc +lat_0=0 +lon_0=17.25 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# SWEREF99 18 45 + RH2000 height
<5854> +proj=tmerc +lat_0=0 +lon_0=18.75 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# SWEREF99 20 15 + RH2000 height
<5855> +proj=tmerc +lat_0=0 +lon_0=20.25 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# SWEREF99 21 45 + RH2000 height
<5856> +proj=tmerc +lat_0=0 +lon_0=21.75 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# SWEREF99 23 15 + RH2000 height
<5857> +proj=tmerc +lat_0=0 +lon_0=23.25 +k=1 +x_0=150000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 + NN2000 height
<5942> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +vunits=m +no_defs  <>
# ETRS89 / NTM zone 5 + NN2000 height
<5945> +proj=tmerc +lat_0=58 +lon_0=5.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 6 + NN2000 height
<5946> +proj=tmerc +lat_0=58 +lon_0=6.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 7 + NN2000 height
<5947> +proj=tmerc +lat_0=58 +lon_0=7.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 8 + NN2000 height
<5948> +proj=tmerc +lat_0=58 +lon_0=8.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 9 + NN2000 height
<5949> +proj=tmerc +lat_0=58 +lon_0=9.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 10 + NN2000 height
<5950> +proj=tmerc +lat_0=58 +lon_0=10.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 11 + NN2000 height
<5951> +proj=tmerc +lat_0=58 +lon_0=11.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 12 + NN2000 height
<5952> +proj=tmerc +lat_0=58 +lon_0=12.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 13 + NN2000 height
<5953> +proj=tmerc +lat_0=58 +lon_0=13.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 14 + NN2000 height
<5954> +proj=tmerc +lat_0=58 +lon_0=14.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 15 + NN2000 height
<5955> +proj=tmerc +lat_0=58 +lon_0=15.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 16 + NN2000 height
<5956> +proj=tmerc +lat_0=58 +lon_0=16.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 17 + NN2000 height
<5957> +proj=tmerc +lat_0=58 +lon_0=17.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 18 + NN2000 height
<5958> +proj=tmerc +lat_0=58 +lon_0=18.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 19 + NN2000 height
<5959> +proj=tmerc +lat_0=58 +lon_0=19.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 20 + NN2000 height
<5960> +proj=tmerc +lat_0=58 +lon_0=20.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 21 + NN2000 height
<5961> +proj=tmerc +lat_0=58 +lon_0=21.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 22 + NN2000 height
<5962> +proj=tmerc +lat_0=58 +lon_0=22.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 23 + NN2000 height
<5963> +proj=tmerc +lat_0=58 +lon_0=23.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 24 + NN2000 height
<5964> +proj=tmerc +lat_0=58 +lon_0=24.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 25 + NN2000 height
<5965> +proj=tmerc +lat_0=58 +lon_0=25.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 26 + NN2000 height
<5966> +proj=tmerc +lat_0=58 +lon_0=26.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 27 + NN2000 height
<5967> +proj=tmerc +lat_0=58 +lon_0=27.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 28 + NN2000 height
<5968> +proj=tmerc +lat_0=58 +lon_0=28.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 29 + NN2000 height
<5969> +proj=tmerc +lat_0=58 +lon_0=29.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 30 + NN2000 height
<5970> +proj=tmerc +lat_0=58 +lon_0=30.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / UTM zone 31 + NN2000 height
<5971> +proj=utm +zone=31 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / UTM zone 32 + NN2000 height
<5972> +proj=utm +zone=32 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / UTM zone 33 + NN2000 height
<5973> +proj=utm +zone=33 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / UTM zone 34 + NN2000 height
<5974> +proj=utm +zone=34 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / UTM zone 35 + NN2000 height
<5975> +proj=utm +zone=35 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / UTM zone 36 + NN2000 height
<5976> +proj=utm +zone=36 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 + NN54 height
<6144> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +vunits=m +no_defs  <>
# ETRS89 / NTM zone 5 + NN54 height
<6145> +proj=tmerc +lat_0=58 +lon_0=5.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 6 + NN54 height
<6146> +proj=tmerc +lat_0=58 +lon_0=6.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 7 + NN54 height
<6147> +proj=tmerc +lat_0=58 +lon_0=7.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 8 + NN54 height
<6148> +proj=tmerc +lat_0=58 +lon_0=8.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 9 + NN54 height
<6149> +proj=tmerc +lat_0=58 +lon_0=9.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 10 + NN54 height
<6150> +proj=tmerc +lat_0=58 +lon_0=10.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 11 + NN54 height
<6151> +proj=tmerc +lat_0=58 +lon_0=11.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 12 + NN54 height
<6152> +proj=tmerc +lat_0=58 +lon_0=12.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 13 + NN54 height
<6153> +proj=tmerc +lat_0=58 +lon_0=13.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 14 + NN54 height
<6154> +proj=tmerc +lat_0=58 +lon_0=14.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 15 + NN54 height
<6155> +proj=tmerc +lat_0=58 +lon_0=15.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 16 + NN54 height
<6156> +proj=tmerc +lat_0=58 +lon_0=16.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 17 + NN54 height
<6157> +proj=tmerc +lat_0=58 +lon_0=17.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 18 + NN54 height
<6158> +proj=tmerc +lat_0=58 +lon_0=18.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 19 + NN54 height
<6159> +proj=tmerc +lat_0=58 +lon_0=19.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 20 + NN54 height
<6160> +proj=tmerc +lat_0=58 +lon_0=20.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 21 + NN54 height
<6161> +proj=tmerc +lat_0=58 +lon_0=21.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 22 + NN54 height
<6162> +proj=tmerc +lat_0=58 +lon_0=22.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 23 + NN54 height
<6163> +proj=tmerc +lat_0=58 +lon_0=23.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 24 + NN54 height
<6164> +proj=tmerc +lat_0=58 +lon_0=24.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 25 + NN54 height
<6165> +proj=tmerc +lat_0=58 +lon_0=25.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 26 + NN54 height
<6166> +proj=tmerc +lat_0=58 +lon_0=26.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 27 + NN54 height
<6167> +proj=tmerc +lat_0=58 +lon_0=27.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 28 + NN54 height
<6168> +proj=tmerc +lat_0=58 +lon_0=28.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 29 + NN54 height
<6169> +proj=tmerc +lat_0=58 +lon_0=29.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / NTM zone 30 + NN54 height
<6170> +proj=tmerc +lat_0=58 +lon_0=30.5 +k=1 +x_0=100000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / UTM zone 31 + NN54 height
<6171> +proj=utm +zone=31 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / UTM zone 32 + NN54 height
<6172> +proj=utm +zone=32 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / UTM zone 33 + NN54 height
<6173> +proj=utm +zone=33 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / UTM zone 34 + NN54 height
<6174> +proj=utm +zone=34 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / UTM zone 35 + NN54 height
<6175> +proj=utm +zone=35 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / UTM zone 36 + NN54 height
<6176> +proj=utm +zone=36 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# Belge 1972 / Belgian Lambert 72 + Ostend height
<6190> +proj=lcc +lat_1=51.16666723333333 +lat_2=49.8333339 +lat_0=90 +lon_0=4.367486666666666 +x_0=150000.013 +y_0=5400088.438 +ellps=intl +towgs84=-106.8686,52.2978,-103.7239,0.3366,-0.457,1.8422,-1.2747 +units=m +vunits=m +no_defs  <>
# NAD83(2011) + NAVD88 height
<6349> +proj=longlat +ellps=GRS80 +geoidgrids=g2012a_conus.gtx,g2012a_alaska.gtx,g2012a_guam.gtx,g2012a_hawaii.gtx,g2012a_puertorico.gtx,g2012a_samoa.gtx +vunits=m +no_defs  <>
# NAD83(CSRS) + CGVD2013 height
<6649> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +vunits=m +no_defs  <>
# NAD83(CSRS) / UTM zone 7N + CGVD2013 height
<6650> +proj=utm +zone=7 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# NAD83(CSRS) / UTM zone 8N + CGVD2013 height
<6651> +proj=utm +zone=8 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# NAD83(CSRS) / UTM zone 9N + CGVD2013 height
<6652> +proj=utm +zone=9 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# NAD83(CSRS) / UTM zone 10N + CGVD2013 height
<6653> +proj=utm +zone=10 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# NAD83(CSRS) / UTM zone 11N + CGVD2013 height
<6654> +proj=utm +zone=11 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# NAD83(CSRS) / UTM zone 12N + CGVD2013 height
<6655> +proj=utm +zone=12 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# NAD83(CSRS) / UTM zone 13N + CGVD2013 height
<6656> +proj=utm +zone=13 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# NAD83(CSRS) / UTM zone 14N + CGVD2013 height
<6657> +proj=utm +zone=14 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# NAD83(CSRS) / UTM zone 15N + CGVD2013 height
<6658> +proj=utm +zone=15 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# NAD83(CSRS) / UTM zone 16N + CGVD2013 height
<6659> +proj=utm +zone=16 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# NAD83(CSRS) / UTM zone 17N + CGVD2013 height
<6660> +proj=utm +zone=17 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# NAD83(CSRS) / UTM zone 18N + CGVD2013 height
<6661> +proj=utm +zone=18 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# NAD83(CSRS) / UTM zone 19N + CGVD2013 height
<6662> +proj=utm +zone=19 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# NAD83(CSRS) / UTM zone 20N + CGVD2013 height
<6663> +proj=utm +zone=20 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# NAD83(CSRS) / UTM zone 21N + CGVD2013 height
<6664> +proj=utm +zone=21 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# NAD83(CSRS) / UTM zone 22N + CGVD2013 height
<6665> +proj=utm +zone=22 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# JGD2000 + JGD2000 (vertical) height
<6696> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +vunits=m +no_defs  <>
# JGD2011 + JGD2011 (vertical) height
<6697> +proj=longlat +ellps=GRS80 +vunits=m +no_defs  <>
# Tokyo + JSLD72 height
<6700> +proj=longlat +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +vunits=m +no_defs  <>
# WGS 84 / Pseudo-Mercator +  EGM2008 geoid height
<6871> +proj=merc +lon_0=0 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +geoidgrids=egm08_25.gtx +vunits=m +no_defs  <>
# WGS 84 / World Mercator +  EGM2008 height
<6893> +proj=merc +lon_0=0 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +geoidgrids=egm08_25.gtx +vunits=m +no_defs  <>
# SVY21 + SHD height
<6917> +proj=longlat +ellps=WGS84 +vunits=m +no_defs  <>
# SVY21 / Singapore TM + SHD height
<6927> +proj=tmerc +lat_0=1.366666666666667 +lon_0=103.8333333333333 +k=1 +x_0=28001.642 +y_0=38744.572 +ellps=WGS84 +units=m +vunits=m +no_defs  <>
# NTF (Paris) + NGF IGN69 height
<7400> +proj=longlat +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +vunits=m +no_defs  <>
# NTF (Paris) / France II + NGF Lallemand
<7401> +proj=lcc +lat_1=46.8 +lat_0=46.8 +lon_0=0 +k_0=0.99987742 +x_0=600000 +y_0=2200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +vunits=m +no_defs  <>
# NTF (Paris) / France II + NGF IGN69
<7402> +proj=lcc +lat_1=46.8 +lat_0=46.8 +lon_0=0 +k_0=0.99987742 +x_0=600000 +y_0=2200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +vunits=m +no_defs  <>
# NTF (Paris) / France III + NGF IGN69
<7403> +proj=lcc +lat_1=44.10000000000001 +lat_0=44.10000000000001 +lon_0=0 +k_0=0.999877499 +x_0=600000 +y_0=3200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +vunits=m +no_defs  <>
# RT90 + RH70 height
<7404> +proj=longlat +ellps=bessel +towgs84=414.1,41.3,603.1,-0.855,2.141,-7.023,0 +vunits=m +no_defs  <>
# OSGB 1936 / British National Grid + ODN height
<7405> +proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +datum=OSGB36 +units=m +vunits=m +no_defs  <>
# NAD27 + NGVD29 height
<7406> +proj=longlat +datum=NAD27 +vunits=us-ft +no_defs  <>
# NAD27 / Texas North + NGVD29 height
<7407> +proj=lcc +lat_1=34.65 +lat_2=36.18333333333333 +lat_0=34 +lon_0=-101.5 +x_0=609601.2192024384 +y_0=0 +datum=NAD27 +units=us-ft +vunits=us-ft +no_defs  <>
# RD/NAP
<7408> +proj=longlat +ellps=bessel +towgs84=565.2369,50.0087,465.658,-0.406857,0.350733,-1.87035,4.0812 +vunits=m +no_defs  <>
# ETRS89 + EVRF2000 height
<7409> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +vunits=m +no_defs  <>
# PSHD93
<7410> +proj=longlat +ellps=clrk80 +towgs84=-180.624,-225.516,173.919,-0.81,-1.898,8.336,16.71006 +vunits=m +no_defs  <>
# NTF (Paris) / Lambert zone II + NGF Lallemand height
<7411> +proj=lcc +lat_1=46.8 +lat_0=46.8 +lon_0=0 +k_0=0.99987742 +x_0=600000 +y_0=2200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +vunits=m +no_defs  <>
# NTF (Paris) / Lambert zone II + NGF IGN69
<7412> +proj=lcc +lat_1=46.8 +lat_0=46.8 +lon_0=0 +k_0=0.99987742 +x_0=600000 +y_0=2200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +vunits=m +no_defs  <>
# NTF (Paris) / Lambert zone III + NGF IGN69
<7413> +proj=lcc +lat_1=44.10000000000001 +lat_0=44.10000000000001 +lon_0=0 +k_0=0.999877499 +x_0=600000 +y_0=3200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +vunits=m +no_defs  <>
# Tokyo + JSLD69 height
<7414> +proj=longlat +ellps=bessel +towgs84=-146.414,507.337,680.507,0,0,0,0 +vunits=m +no_defs  <>
# Amersfoort / RD New + NAP height
<7415> +proj=sterea +lat_0=52.15616055555555 +lon_0=5.38763888888889 +k=0.9999079 +x_0=155000 +y_0=463000 +ellps=bessel +towgs84=565.2369,50.0087,465.658,-0.406857,0.350733,-1.87035,4.0812 +units=m +vunits=m +no_defs  <>
# ETRS89 / UTM zone 32N + DVR90 height
<7416> +proj=utm +zone=32 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / UTM zone 33N + DVR90 height
<7417> +proj=utm +zone=33 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / Kp2000 Jutland + DVR90 height
<7418> +proj=tmerc +lat_0=0 +lon_0=9.5 +k=0.99995 +x_0=200000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / Kp2000 Zealand + DVR90 height
<7419> +proj=tmerc +lat_0=0 +lon_0=12 +k=0.99995 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# ETRS89 / Kp2000 Bornholm + DVR90 height
<7420> +proj=tmerc +lat_0=0 +lon_0=15 +k=1 +x_0=900000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# NTF (Paris) / Lambert zone II + NGF-IGN69 height
<7421> +proj=lcc +lat_1=46.8 +lat_0=46.8 +lon_0=0 +k_0=0.99987742 +x_0=600000 +y_0=2200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +vunits=m +no_defs  <>
# NTF (Paris) / Lambert zone III + NGF-IGN69 height
<7422> +proj=lcc +lat_1=44.10000000000001 +lat_0=44.10000000000001 +lon_0=0 +k_0=0.999877499 +x_0=600000 +y_0=3200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +vunits=m +no_defs  <>
# ETRS89 + EVRF2007 height
<7423> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +vunits=m +no_defs  <>
# Astro DOS 71 / UTM zone 30S + Jamestown 1971 height
<7954> +proj=utm +zone=30 +south +ellps=intl +towgs84=-320,550,-494,0,0,0,0 +units=m +vunits=m +no_defs  <>
# St. Helena Tritan / UTM zone 30S +  Tritan 2011 height
<7955> +proj=utm +zone=30 +south +ellps=WGS84 +towgs84=-0.077,0.079,0.086,0,0,0,0 +units=m +vunits=m +no_defs  <>
# SHMG2015 +  SHVD2015 height
<7956> +proj=utm +zone=30 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +vunits=m +no_defs  <>
# GR96 + GVR2000 height
<8349> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +vunits=m +no_defs  <>
# GR96 + GVR2016 height
<8350> +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +vunits=m +no_defs  <>
EOF
  echo "here.."$proj_path"/epsg"
fi
