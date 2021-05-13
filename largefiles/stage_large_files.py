#!/usr/bin/env python
#
# This script symbolic links large files from current directory to
# the target directory so that they are ready for processing with 
# the ucvm_setup.py script
#
# Conditions:
# This script should be run as the same user that is installing UCVM. This
# does not check permissions or ownership of files
#
import os
import sys
from shutil import copyfile

UCVM_Version = "19.4"
target_large_lib_list = ["proj-5.0.0.tar.gz",
                  "fftw-3.3.3.tar.gz",
                  "euclid3-1.3.tar.gz"]
target_large_model_list = ["cvms5.tar.gz",
                    "cca.tar.gz",
                    "cs173.tar.gz",
                    "cs173h.tar.gz",
                    "cvms4.tar.gz",
                    "cvms426.tar.gz",
                    "cvmh-15.1.1.tar.gz",
                    "cencal080.tar.gz",
                    "albacore.tar.gz",
                    "cvlsu.tar.gz",
                    "ivlsu.tar.gz",
                    "wfcvm.tar.gz"]
target_large_etree_list = ["ucvm.e","ucvm_utah.e"]
target_large_ref_list = ["test-grid-lib-1d.ref"]


# These two paths specify the location of the largefiles, and the src directory 
# for UCVM. For standard installation, the default values can be used. The user 
# only needs to edit these paths if they are doing custom installation methods
#
curdir = os.getcwd()
largefilepath = curdir
curpath = curdir + '/' + ".."

#
def link_largefile(filename, src, dst):
    srcname = os.path.join(src, filename)
    dstname = os.path.join(dst, filename)
    try:
       if os.path.islink(srcname):
         linkto = os.readlink(srcname)
         os.symlink(linkto, dstname)
       else:
         os.symlink(srcname, dstname)
    except (IOError, os.error) as why:
       raise Error(why)

#
#
if len(sys.argv) < 2:
  print("Using default as UCVM install directory")
  print("User can Override the default largefiles directory using the command line like this:")
  print("%stage_large_files.py /path/to/UCVM/largefiles/directory")
  src_dir = curpath
else:
  src_dir = str(sys.argv[1])
print(src_dir) 

### directory structure
model_dir = src_dir + "/model"
test_ref_dir = src_dir + "/test/ref"
etree_dir = model_dir + "/ucvm"

work_dir = src_dir + "/work"
work_model_dir = src_dir + "/work/model"
work_lib_dir = src_dir + "/work/lib"

#
# Make sure target build directories exists, if not create them
#
if not os.path.exists(work_dir):
  print("Creating work_dir: ",work_dir)
  os.makedirs(work_dir)

if not os.path.exists(work_model_dir):
  print("Creating model_dir: ", work_model_dir)
  os.makedirs(work_model_dir)

if not os.path.exists(work_lib_dir):
  print("Creating lib_dir: ", work_lib_dir)
  os.makedirs(work_lib_dir)

#
# Now move files one by one to destinations
#
for l in target_large_lib_list:
  src_file = largefilepath + "/" + l
  target_file = work_lib_dir + "/" + l 
  if not os.path.exists(src_file):
    continue
  if not os.path.exists(target_file):
    print("Linking lib:",l)
    link_largefile(l, largefilepath, work_lib_dir)
    # 
    # remove existing tar file so gzip doesn't ask for permisson
    #
    tarfile = os.path.splitext(os.path.basename(l))[0]
    tarfilepath = work_lib_dir + "/" + tarfile
    if os.path.exists(tarfilepath):
      print("Removing existing lib tar file",tarfilepath)
      os.remove(tarfilepath)
  else:
    print("Target lib file already exists",target_file)

for m in target_large_model_list:
  src_file = largefilepath + "/" + m
  target_file = work_model_dir + "/" + m
  if not os.path.exists(src_file):
    continue
  if not os.path.exists(target_file):
    print("Linking model:",m)
    link_largefile(m, largefilepath, work_model_dir)
    # 
    # remove existing tar file so gzip doesn't ask for permisson
    #
    tarfile = os.path.splitext(os.path.basename(m))[0]
    tarfilepath = work_model_dir + "/" + tarfile
    if os.path.exists(tarfilepath):
      print("Removing existing model tar file",tarfilepath)
      os.remove(tarfilepath)
  else:
    print("Target model file already exists",target_file)

for r in target_large_ref_list:
  src_file = largefilepath + "/" + r
  target_file = test_ref_dir + "/" + r 
  if not os.path.exists(src_file):
    continue
  if not os.path.exists(target_file):
    print("Linking ref file:",r)
    link_largefile(r, largefilepath, test_ref_dir)
  else:
    print("Target model file already exists",target_file)

#
# UCVM.e file is staged in the model/ucvm directory
# not the work/ucvm directory. This current script
# works only for ucvm.e due to hardcoded directory name
#
for e in target_large_etree_list:
  src_file = largefilepath + "/" + e
  target_file = etree_dir + "/" + e 
  if not os.path.exists(src_file):
    continue
  if not os.path.exists(target_file):
    print("Linking etree file:",e)
    link_largefile(e, largefilepath, etree_dir)
  else:
    print("Target etree file already exists",target_file)

print("All required library and model files staged in UCVM work directories.\n")
print("Next, cd .. to move into the parent directory, the UCVM source home directory.")
print("Next, run ./ucvm_setup.py which will start the configure, make, install process.")
print("This script will ask the user several questions:")
print("First, it will ask the user to enter a path to the UCVM installation directory.") 
print("The user should specify a path to a directory that has at least 20GB of free disk space.")
print("Next, it will ask the user which models to install. The user will enter: yes (y), or no (n) to each model.")
print("We recommend saying yes (y) to CVM-S4 and CVM-H, so all tests and examples in the distribution will work.")
print("You may want to exclude some models to save disk space or installation time.")
sys.exit(0)
