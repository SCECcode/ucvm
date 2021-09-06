#!/usr/bin/env python
# 
# Script for downloading UCVM largefiles from remote repository site
# into the UCVMC/largefiles subdirectory.
#
#
import os
import sys

if sys.version_info.major >= (3) :
  from urllib.request import urlopen 
else:
  from urllib2 import urlopen

#
UCVM_Version = "21.7"

# remote repository
ucvmc_largefile_repository = "http://hypocenter.usc.edu/research/ucvmc/V21_7"

#
optional_large_model_list = [ "cvms5",
                    "cca",
                    "cs173",
                    "cs173h",
                    "cvms4",
                    "cvms426",
                    "cencal080",
                    "cvmh-15.1.1",
                    "albacore",
                    "cvlsu",
                    "ivlsu"]
optional_large_model_size = { 'cvms5':'1.2G',
                              'cca':'9.2G',
                              'cs173':'72G',
                              'cs173h':'72G',
                              'cvms4':'326M',
                              'cvms426':'1.6G',
                              'cencal080':'21G',
                              'cvmh-15.1.1':'1.6G',
                              'albacore':'2.3M',
                              'cvlsu':'1M',
                              'ivlsu':'1M'}
target_large_lib_list = ["proj-5.0.0.tar.gz",
                  "fftw-3.3.3.tar.gz",
                  "euclid3-1.3.tar.gz"]
##
## target_large_model_list = ["cvmh-15.1.1.tar.gz"]
target_large_model_list = []
target_large_etree_list = ["ucvm.e"]
target_large_ref_list = ["test-grid-lib-1d.ref"]

#
def download_urlfile(url,fname):
  try:
    response = urlopen(url)
    CHUNK = 16 * 1024
    with open(fname, 'wb') as f:
      while True:
        chunk = response.read(CHUNK)
        if not chunk:
          break
        f.write(chunk)
  except:
    e = sys.exc_info()[0]
    print("Exception retrieving and saving largefile:",e)
    raise
  return True

#
# Check to make sure the script is being run with outside a UCVM directory
#
curdir = os.getcwd()
if os.path.basename(os.path.normpath(curdir)) == "largefiles":
  print("Running in UCVMC/largefiles source directory. ")
  print("This script will download and install ucvm.e and several other files.")
  print("Due to the size of the files, this download could take minutes to hours to complete.")
else:
  print("Run this script in the directory that contains the UCVMC/largefiles src directory.")
  print("This script will download and install ucvm.e and several other files.")
  print("Due to the size of the files, this download could take minutes to hours to complete.")
  sys.exit(0)

######################################################################
#
#
for m in optional_large_model_list:
   print("\nWould you like to download " + m + ", will need "+ optional_large_model_size[m] + "?") 
   if sys.version_info.major >= (3) :
     yesmodel = input("Enter yes or no: ")
   else:
     yesmodel = raw_input("Enter yes or no: ")

   if yesmodel != "" and yesmodel.lower()[0] == "y":
     model = m + '.tar.gz'
     target_large_model_list.append(model)

print("Retrieving files from: %s"%(ucvmc_largefile_repository))
print("Installing files in: %s"%(curdir))

#
# First, download the required library files
#
for m in target_large_lib_list:
  print("Retrieving: ",m)
  outfilename = "./%s"%(m)
  scec_url = "%s/lib/%s"%(ucvmc_largefile_repository,m)
  #
  # First check if file exists. If so, don't re-download.
  # Tell user that old files must be deleted from UCVMC/largefiles to download new version
  #
  if not os.path.exists(outfilename):
    try:
      download_urlfile(scec_url,outfilename)
    except:
      print("Error downloading (%s), or writing file (%s)" % (scec_url,outfilename))
      break
    print("Finished downloading: ",m)
  else:
    print("Required largefile already exists in UCVMC/largefile directory",outfilename)
    print("If new version is required, delete current local copy (%s) and re-run this script"%(outfilename))

#
# Second download the CVM model files
#
for m in target_large_model_list:
  print("Retrieving: ",m)
  outfilename = "./%s"%(m)
  scec_url = "%s/model/%s"%(ucvmc_largefile_repository,m)
  #
  # First check if file exists. If so, don't re-download.
  # Tell user that old files must be deleted from UCVMC/largefiles to download new version
  #
  if not os.path.exists(outfilename):
    try:
      download_urlfile(scec_url,outfilename)
    except:
      print("Error downloading (%s), or writing file (%s)" % (scec_url,outfilename))
      break
    print("Finished downloading: ",m)
  else:
    print("Required largefile already exists in UCVMC/largefile directory",outfilename)
    print("If new version is required, delete current local copy (%s) and re-run this script"%(outfilename))

#
# Next download the topography and vs30 etree files
#

for m in target_large_etree_list:
  print("Retrieving: ",m)
  outfilename = "./%s"%(m)
  scec_url = "%s/etree/%s"%(ucvmc_largefile_repository,m)
  #
  # First check if file exists. If so, don't re-download.
  # Tell user that old files must be deleted from UCVMC/largefiles to download new version
  #
  if not os.path.exists(outfilename):
    try:
      download_urlfile(scec_url,outfilename)
    except:
      print("Error downloading (%s), or writing file (%s)" % (scec_url,outfilename))
      break
    print("Finished downloading: ",m)
  else:
    print("Required largefile already exists in UCVMC/largefile directory",outfilename)
    print("If new version is required, delete current local copy (%s) and re-run this script"%(outfilename))

#
# Download the large reference result file
#
for m in target_large_ref_list:
  print("Retrieving: ",m)
  outfilename = "./%s"%(m)
  scec_url = "%s/ref/%s"%(ucvmc_largefile_repository,m)
  #
  # First check if file exists. If so, don't re-download.
  # Tell user that old files must be deleted from UCVMC/largefiles to download new version
  #
  if not os.path.exists(outfilename):
    try:
      download_urlfile(scec_url,outfilename)
    except:
      print("Error downloading (%s), or writing file (%s)" % (scec_url,outfilename))
      break
    print("Finished downloading: ",m)
  else:
    print("Required largefile already exists in UCVMC/largefile directory",outfilename)
    print("If new version is required, delete current local copy (%s) and re-run this script"%(outfilename))

print("Completed all required downloads to build the UCVMC programs.\n")
print("Next, run ./check_largefiles_md5.py to verify the largefiles downloaded without errors.")
print("Next, run ./stage_large_files.py to move the largefiles in the source code subdirectories.")
print("Next, cd .. to move into the parent directory, the UCVM source home directory.")
print("Next, run ./ucvm_setup.py which will start the configure, make, install process.")
print("This script will ask the user several questions:")
print("First, it will ask the user to enter a path to the UCVM installation directory.") 
print("The user should specify a path to a directory that has at least 20GB of free disk space.")
print("Next, it will ask the user which models to install. The user will enter: yes (y), or no (n) to each model.")
print("We recommend saying yes (y) to CVM-S4 and CVM-H, so all tests and examples in the distribution will work.")
print("You may want to exclude some models to save disk space or installation time.")
sys.exit(0)
