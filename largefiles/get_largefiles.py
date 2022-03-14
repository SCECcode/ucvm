#!/usr/bin/env python
# 
# Script for downloading UCVM largefiles from remote repository site
# into the ./largefiles subdirectory.
#
# Pick up information from ../setup/setup.list
#
import os
import sys
import json
import pdb
import getopt

UCVM_Version = "21.10"

if sys.version_info.major >= (3) :
  from urllib.request import urlopen 
else:
  from urllib2 import urlopen


##########################

# Print usage.
def usage():
    print("Runing using commandline options.\n")
    print("\t-m  --model   list of models separated by comma.")
    print("\t-h  --help    show usage.\n")

def printPretty(list):
    buffer = ""
    # Make a nice comma list.
    print("  ")
    for i in range(0, len(list)):
        buffer += list[i]
        if i < len(list) - 2:
            buffer += ", "
        elif i == len(list) - 2 and len(list) != 2:
            buffer += ", and "
        elif i == len(list) - 2:
            buffer += " and "
    print(buffer)

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

def process_user_models(mlist) :
    global user_large_model_list
    user_large_model_list=mlist.split(",")

##########################

optional_large_model_list = []
user_large_model_list = []
target_large_lib_list = []
target_large_model_list = []
target_large_etree_list = []
target_large_ref_list = []
skip_ask_model = False 

########################### 

try:
    # We now have our list. Parse it.
    f = open("../setup/setup.list", "r")
    json_string = f.read()
    f.close()
    config_data = json.loads(json_string)
except OSError as e:
    eG(e, "Parsing setup for ucvm model list.")

for model in sorted(iter(config_data["models"].keys()), key=lambda k: int(config_data["models"][k]["Order"])):
    the_model = config_data["models"][model]
    _url = str(the_model["URL"])
    _abb= str(the_model["Abbreviation"])
    _sz= str(the_model["Size"])
    if config_data["models"][model]["Ask"] != "no":
       optional_large_model_list.append( {"model":_abb,"url":_url,"size":_sz })

for library in config_data["libraries"].keys() :
    the_library = config_data["libraries"][library]
    _url = str(the_library["URL"])
    _path= str(the_library["Path"])
    if config_data["libraries"][library]["Required"] == "yes":
       target_large_lib_list.append({"library":_path, "url":_url});

for etree in config_data["etrees"].keys() :
    the_etree = config_data["etrees"][etree]
    _url = str(the_etree["URL"])
    _path= str(the_etree["Path"])
    target_large_etree_list.append({"etree":_path, "url":_url});

for ref in config_data["references"].keys() :
    the_reference = config_data["references"][ref]
    _url = str(the_reference["URL"])
    _path= str(the_reference["Path"])
    target_large_ref_list.append({"reference":_path, "url":_url});

#
# Check to make sure the script is being run with outside a UCVM directory
#
curdir = os.getcwd()
if os.path.basename(os.path.normpath(curdir)) == "largefiles":
  print("Running in ./largefiles source directory. ")
  print("This script will download and install ucvm.e, ucvm_utah.e and several other files.")
  print("Due to the size of the files, this download could take minutes to hours to complete.")
else:
  print("Run this script in the directory that contains the ./largefiles src directory.")
  print("This script will download and install ucvm.e, ucvm_utah.e and several other files.")
  print("Due to the size of the files, this download could take minutes to hours to complete.")
  sys.exit(0)

######################################################################
#
# Check if there are arguments
try:
    opts, args = getopt.getopt(sys.argv[1:], "m:h", ["model","help"])
except getopt.GetoptError as err:
    print(str(err))
    usage()
    exit(1)

for o, a in opts:
    if o in ('-m', '--model'):
        skip_ask_model = True 
        process_user_models(a)
    elif o in ('-h', '--help'):
        usage()
        exit(0)
    else:
        print("Invalid option %s" % (o))
        exit(1)

######################################################################
#
# Ask, which model file to retrieve
for m in optional_large_model_list:
    _model=m['model']
    _url=m['url']
    _size=m['size']
    if skip_ask_model == False :
        print("\nWould you like to download " + _model + ", will need "+ _size + "?") 
        if sys.version_info.major >= (3) :
            yesmodel = input("Enter yes or no: ")
        else:
            yesmodel = raw_input("Enter yes or no: ")
    else:
        if _model in user_large_model_list :
            yesmodel = "yes"
        else:
            yesmodel = "no"

    if yesmodel != "" and yesmodel.lower()[0] == "y":
        model = _model + '.tar.gz'
        target_large_model_list.append({"model":model,"url":_url})

print("Installing files in: %s"%(curdir))

#
# First, download the required library files
#
for m in target_large_lib_list:
  _lib = m['library']
  _url = m['url']
  print("Retrieving: ",_lib)
  _path, _tarname = os.path.split(_url)
  outfilename = "./%s"%(_tarname)
  scec_url = _url

  #
  # First check if file exists. If so, don't re-download.
  # Tell user that old files must be deleted from ./largefiles to download new version
  #
  if not os.path.exists(outfilename):
    try:
      download_urlfile(scec_url,outfilename)
    except:
      print("Error downloading (%s), or writing file (%s)" % (scec_url,outfilename))
      break
    print("Finished downloading: ",_lib)
  else:
    print("Required largefile already exists in ./largefile directory",outfilename)
    print("If new version is required, delete current local copy (%s) and re-run this script"%(outfilename))

#
# Second download the CVM model files
#
for m in target_large_model_list:
  _model=m["model"]
  _url=m["url"]
  print("Retrieving: ",_model)
  _path, _tarname = os.path.split(_url)
  outfilename = "./%s"%(_tarname)
  scec_url = _url
  #
  # First check if file exists. If so, don't re-download.
  # Tell user that old files must be deleted from ./largefiles to download new version
  #
  if not os.path.exists(outfilename):
    try:
      download_urlfile(scec_url,outfilename)
    except:
      print("Error downloading (%s), or writing file (%s)" % (scec_url,outfilename))
      break
    print("Finished downloading: ",_model)
  else:
    print("Required largefile already exists in ./largefile directory",outfilename)
    print("If new version is required, delete current local copy (%s) and re-run this script"%(outfilename))

#
# Next download the topography and vs30 etree files
#

for m in target_large_etree_list:
  _etree=m["etree"]
  _url=m["url"]
  print("Retrieving: ",_etree)
  _path, _tarname = os.path.split(_url)
  outfilename = "./%s"%(_tarname)
  scec_url = _url
  #
  # First check if file exists. If so, don't re-download.
  # Tell user that old files must be deleted from ./largefiles to download new version
  #
  if not os.path.exists(outfilename):
    try:
      download_urlfile(scec_url,outfilename)
    except:
      print("Error downloading (%s), or writing file (%s)" % (scec_url,outfilename))
      break
    print("Finished downloading: ",_etree)
  else:
    print("Required largefile already exists in ./largefile directory",outfilename)
    print("If new version is required, delete current local copy (%s) and re-run this script"%(outfilename))

#
# Download the large reference result file
#
for m in target_large_ref_list:
  _ref=m["reference"]
  _url=m["url"]
  print("Retrieving: ",_ref)
  _path, _tarname = os.path.split(_url)
  outfilename = "./%s"%(_tarname)
  scec_url = _url
  #
  # First check if file exists. If so, don't re-download.
  # Tell user that old files must be deleted from ./largefiles to download new version
  #
  if not os.path.exists(outfilename):
    try:
      download_urlfile(scec_url,outfilename)
    except:
      print("Error downloading (%s), or writing file (%s)" % (scec_url,outfilename))
      break
    print("Finished downloading: ",_ref)
  else:
    print("Required largefile already exists in ./largefiles directory",outfilename)
    print("If new version is required, delete current local copy (%s) and re-run this script"%(outfilename))

print("Completed all required downloads to build the UCVM programs.\n")
print("Next, run ./check_largefiles_md5.py to verify the largefiles downloaded without errors.")
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
