#!/usr/bin/env python3
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
import json
import subprocess
import tempfile
import pdb

target_large_lib_list = []
target_large_model_list = []
target_large_etree_list = []
target_large_ref_list = []

try:
    # We now have our list. Parse it.
    f = open("../setup/setup.list", "r")
    json_string = f.read()
    f.close()
    config_data = json.loads(json_string)
except OSError as e:
    eG(e, "Parsing setup for ucvm model list.")

## get ucvm version
UCVM_Version = config_data["UCVM"]["Version"]

for model in sorted(iter(config_data["models"].keys()), key=lambda k: int(config_data["models"][k]["Order"])):
    the_model = config_data["models"][model]
    _md5sum = str(the_model["md5sum"])
    _model = str(the_model["Abbreviation"])+".tar.gz"
    target_large_model_list.append( {"model":_model,"md5sum":_md5sum })
    if "Preprocess" in the_model :
        pre_tasks = the_model["Preprocess"]
        for the_task in pre_tasks :
            if "Action" in the_task and the_task["Action"] == "download":
                _md5sum = str(the_task["md5sum"])
                _ref = str(the_task["Lib"])+".tar.gz"
                target_large_ref_list.append({"reference":_ref, "md5sum":_md5sum})

for library in config_data["libraries"].keys() :
    the_library = config_data["libraries"][library]
    _md5sum = str(the_library["md5sum"])
    _lib = str(the_library["Lib"])+".tar.gz"
    target_large_lib_list.append({"library":_lib, "md5sum":_md5sum})
## postprocess download tasks
    if "Postprocess" in the_library :
       post_tasks = the_library["Postprocess"]
       for the_task in post_tasks :
           if "Action" in the_task and the_task["Action"] == "download":
               _md5sum = str(the_task["md5sum"])
               _ref = str(the_task["Lib"])+".tar.gz"
               target_large_ref_list.append({"reference":_ref, "md5sum":_md5sum})

for etree in config_data["etrees"].keys() :
    the_etree = config_data["etrees"][etree]
    _md5sum = str(the_etree["md5sum"])
    _etree = str(the_etree["Path"])
    target_large_etree_list.append({"etree":_etree, "md5sum":_md5sum})

for ref in config_data["references"].keys() :
    the_reference = config_data["references"][ref]
    _md5sum = str(the_reference["md5sum"])
    _ref=str(the_reference["Path"])
    target_large_ref_list.append({"reference":_ref, "md5sum":_md5sum})


#
#
def check_md5file(nm,filename,total_ok,total_errs):
  print("Checking file: "+nm)
  proc = subprocess.Popen(["md5sum", "-c", filename], stdout=subprocess.PIPE,stderr=subprocess.PIPE)
  out,err = proc.communicate()
  res = out.split()
  if len(res) > 1 and res[1].decode("utf-8") == "OK":
    print("File: %s OK"%(nm))
    total_ok += 1
  else:
    print("Erorr: %s does not match expected value."%(nm))
    total_errs += 1
  return total_ok,total_errs

#
#
print("Checking largefiles for UCVM version: %s"%(UCVM_Version))
total_ok = 0
total_errs = 0

#
# Check Model Files
#
for item in target_large_model_list :
  model = item['model']
  md5sum = item['md5sum']
  if not os.path.exists(model):
    continue
  fp = tempfile.NamedTemporaryFile(mode='w',delete=True)
  fp.write(md5sum)
  fp.write("  ")
  fp.write(model)
  fp.flush()
  total_ok, total_errs = check_md5file(model,fp.name,total_ok,total_errs)
  fp.close()

#
# Check Library Files
#
for item in target_large_lib_list :
  lib = item['library']
  md5sum = item['md5sum']
  if not os.path.exists(lib):
    continue
  fp = tempfile.NamedTemporaryFile(mode='w',delete=True)
  fp.write(md5sum)
  fp.write("  ")
  fp.write(lib)
  fp.flush()
  total_ok, total_errs = check_md5file(lib,fp.name,total_ok,total_errs)
  fp.close()

#
# Check etree files
# 
for item in target_large_etree_list :
  etree = item['etree']
  md5sum = item['md5sum']
  if not os.path.exists(etree):
    continue
  fp = tempfile.NamedTemporaryFile(mode='w',delete=True)
  fp.write(md5sum)
  fp.write("  ")
  fp.write(etree)
  fp.flush()
  total_ok, total_errs = check_md5file(etree,fp.name,total_ok,total_errs)
  fp.close()

#
# Check reference grids files
#
for item in target_large_ref_list :
  ref = item['reference']
  md5sum = item['md5sum']
  if not os.path.exists(ref):
    continue
  fp = tempfile.NamedTemporaryFile(mode='w',delete=True)
  fp.write(md5sum)
  fp.write("  ")
  fp.write(ref)
  fp.flush()
  total_ok, total_errs = check_md5file(ref,fp.name,total_ok,total_errs)
  fp.close()

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
