#!/usr/bin/env python
#
# Script for checking downloaded UCVM Files. This script should be run
# after the UCVM largefiles have been retrieved from their respository
# into the ucvm/largefiles subdirectory.
#
# When both the ucvm/largefiles and their associated md5 files
# are located in the same directory, then this script will confirm
# that the largefiles are intact.
#
# The md5 files are downloaded from git repository
# Then largefiles are downloaded from SCEC website
# This script confirms that all files have been downloaded intact.
# This script provides assurance that the downloaded largefiles
# are the files required for UCVM to work properly
#
import os
import sys
import subprocess
import pdb

UCVM_Version = "21.7"
target_large_lib_list = ["proj-5.0.0.tar.gz",
                  "fftw-3.3.3.tar.gz",
                  "euclid3-1.3.tar.gz"]
target_large_model_list = ["cvms5.tar.gz",
                    "cca.tar.gz",
                    "cs173.tar.gz",
                    "cs173h.tar.gz",
                    "cvms.tar.gz",
                    "cvmsi.tar.gz",
                    "cvmh.tar.gz",
                    "cencal.tar.gz",
                    "albacore.tar.gz",
                    "cvlsu.tar.gz",
                    "ivlsu.tar.gz",
                    "wfcvm.tar.gz"]
target_large_etree_list = ["ucvm.e","ucvm_utah.e"]
target_large_ref_list = ["test-grid-lib-1d.ref"]

#
#
def check_md5file(filename,total_ok,total_errs):
  print("Checking file: ",filename) 
  proc = subprocess.Popen(["md5sum", "-c", filename], stdout=subprocess.PIPE,stderr=subprocess.PIPE)
  out,err = proc.communicate()
  res = out.split()
  if res[1].decode("utf-8") == "OK":
    print("File: %s OK"%(filename))
    total_ok += 1
  else:
    print("Erorr: %s does not match expected value."%(filename))
    total_errs += 1
  return total_ok,total_errs

#
#
print("Checking largefiles for UCVMC version: %s"%(UCVM_Version))
total_ok = 0
total_errs = 0

#
# Check Model Files
#
for model in target_large_model_list :
  if not os.path.exists(model):
    continue
  md5 = model + ".md5"
  total_ok, total_errs = check_md5file(md5,total_ok,total_errs)

#
# Check Library Files
#
for lib in target_large_lib_list :
  if not os.path.exists(lib):
    continue
  md5 = lib + ".md5"
  total_ok, total_errs = check_md5file(md5,total_ok,total_errs)

#
# Check etree files
# 
for etree in target_large_etree_list :
  if not os.path.exists(etree):
    continue
  md5 = etree + ".md5"
  total_ok, total_errs = check_md5file(md5,total_ok,total_errs)

#
# Check reference grids files
#
for ref in target_large_ref_list :
  if not os.path.exists(ref):
    continue
  md5 = ref + ".md5"
  total_ok, total_errs = check_md5file(md5,total_ok,total_errs)

#
# All largefiles checked
#
print("Checked %d UCVM large files with: %d OK, and: %d errors\n"%((total_ok+total_errs),total_ok,total_errs))
print("Next, run ./stage_largefiles.py to move the largefiles in the source code subdirectories.")
print("Next, cd .. to move into the parent directory, the UCVM source home directory.")
print("Next, run ./ucvm_setup.py which will start the configure, make, install process.")
print("This script will ask the user several questions:")
print("First, it will ask the user to enter a path to the UCVM installation directory.")
print("The user should specify a path to a directory that has at least 20GB of free disk space.")
print("Next, it will ask the user which models to install. The user will enter: yes (y), or no (n) to each model.")
print("We recommend saying yes (y) to CVM-S4 and CVM-H, so all tests and examples in the distribution will work.")
print("You may want to exclude some models to save disk space or installation time.")
sys.exit(0)
