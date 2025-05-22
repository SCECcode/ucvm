#!/usr/bin/env python3
#
# This is the install script for the UCVM software framework.
# This work in conjuction with scripts in the largefiles directory. The largefile scripts will download and distribute
# the required large files before this ucvm_setup script is run.
#
#
import os
import sys
import getopt
from subprocess import call, Popen, PIPE
import json
import platform
import socket
import shlex
import pdb
import shutil


# Variables

# Set the version number for the installation script.
VERSION = "25.7.0"

# User defined variables.
all_flag = False
dynamic_flag = True
restart_flag = False
use_iobuf = False
## control adding of explicit dynamic linker flag
user_dynamic_flag = False
## track how many requeted models needs gfortran
needs_gfortran = 1
skip_ask_path = False

## track env of current model/lib etc
needs_env = []
needs_optional_env = []

# Should we abort after testing system conditions?
error_out = False

modelsToInstall = []
librariesToInstall = []
orderedLibrariesToInstall = []
modelPaths = {}
unsupported_features = []
shell_script = ""

# Print usage.
def usage():
    print("Automatically sets up UCVMC and alerts the user to potential complications.\n")
    print("\t-s  --static       Use static linking.")
    print("\t-d  --dynamic      Use dynamic linking.")
    print("\t-a  --all          Use all available models.")
    print("\t-r  --restart      This is a restart of ucvm_setup.py call.")
    print("\t-p  --path         use supplied installation path.")
    print("\t-h  --help         usage.\n")
    print("UCVMC %s\n" % VERSION)
    
# Stands for "error gracefully". Prints out a message for the error and asks to contact software@scec.org.
def eG(err, step):
    print("\nERROR:")
    print("An error occurred while trying to setup UCVM. Specifically, the error was:\n")
    print(str(err))
    print("\nAt step: %s\n" % step)
    print("Please contact software@scec.org for assistance setting up UCVM. In your message,")
    print("please let us know the operating system on which you are running and some")
    print("specifications about your computer.\n")
    exit(1)

# Find out if we have certain executables installed.
def which(file):
    for path in os.environ["PATH"].split(":"):
        if os.path.exists(path + "/" + file):
            return path + "/" + file
    return None


# Records the command to the global shell script variable.
def callAndRecord(command, nocall = False, noshell = True):
    global shell_script

    new_env = {}
    my_env = os.environ.copy()
    if len(needs_env) != 0 :  ## check on required environment 
      for env in needs_env:
        ## pick it up from current environment
        if env in my_env.keys(): 
          new_env[env] = my_env[env]
        else:
          print("ERROR>>",env,"<< expected env is not available");
          exit(1)

    if len(needs_optional_env) != 0 :  ## check on optional environment 
      for env in needs_optional_env:
        ## pick it up from current environment
        if env in my_env.keys(): 
          new_env[env] = my_env[env]
        else:
          print("WARN>>",env,"<< optional env is not set");

    print('  ==> command used.. '+'_'.join(command))
    if nocall == False:
        if noshell == False :
            my_command=' '.join(command)
            proc = Popen([ my_command ], env=my_env, shell=True, stdout = PIPE, stderr = PIPE)
            retout, reterr = proc.communicate()
            retVal = proc.poll()
        else:
            proc = Popen(command, stdout = PIPE, stderr = PIPE)
            retout, reterr = proc.communicate()
            retVal = proc.poll()


        if not retVal == 0:
            print("Return value for the call is ",retVal)
            print(reterr)
            if retVal == 1:
               eG("Error executing command.", command)
            else:
               print("WHAT... Return value for the call is ",retVal)
            exit(1)
      
    shell_script += command[0]
    for cmd in command[1:]:
        shell_script += " \"" + cmd + "\""
    shell_script += "\n"

# Prints a pretty text version of a tuple list.
def printPretty(list):
    buffer = ""
    # Make a nice comma list.
    for i in range(0, len(list)):
        buffer += list[i]
        if i < len(list) - 2:
            buffer += ", "
        elif i == len(list) - 2 and len(list) != 2:
            buffer += ", and "
        elif i == len(list) - 2:
            buffer += " and "
    print(buffer)

# create matching install directory from the build directory
# base on configure's prefix
def createInstallTargetPath( targetpath ):
  if not os.path.exists(targetpath):
    call(["mkdir", "-p", targetpath])

# Install with the configure, make, make install paradigm.
#
# This makes three assumptions
# (1) All required tar files are in the current_working_directory/work directory, and are gzipped
# (2) All installs of type "model" go to ucvmpath/model
# (3) All installs of type "library" go to ucvmpath/lib

#
def installConfigMakeInstall(tarname, ucvmpath, type, config_data):

    global needs_gfortran
    global needs_env

    print("\nInstalling " + type + " " + tarname)
    pathname = "lib"
    if type == "model":
        pathname = "model"
    
    workpath = "./work/" + pathname
    refpath = "./work/ref"

    ## skip the models that already exists and go to the ones that did not get processed yet
    if(restart_flag) :
        test_path= workpath + "/" + config_data["Path"];
        if os.path.exists(test_path):
            print("\nSkip building " + config_data["Path"] + ", already exists");
            return 0

    strip_level = "2"
    if config_data["Path"] == "fftw" or \
            config_data["Path"] == "netcdf" :
        strip_level = "1"
    
    ## still needs to track needs_gfortran
    if "Requirements" in config_data:
        requirements_array= config_data["Requirements"]
        if "gfortran" in requirements_array:
           needs_gfortran += 1

    # 
    # We need to un-tar the file.
    # The strip level determines how much of the path found in the tar file are removed.
    # strip=1 will remove the proj.0.0/configure and output only configure.in 
    # This enables us to untar into directories with static names like proj
    #
    print("Decompressing " + type)
    callAndRecord(["mkdir", "-p", workpath + "/" + config_data["Path"]])
    callAndRecord(["tar", "zxvf", workpath  + "/" + tarname, "-C", workpath + "/" + config_data["Path"], \
                     "--strip", strip_level])

## Any Preprocess needed ? 
## maybe download geomodelgrids into sfcvm source location ?
    if "Preprocess" in config_data :
        pre_tasks = config_data["Preprocess"]
        for the_task in pre_tasks :
            if "Action" in the_task and the_task["Action"] == "download":
                _url = the_task["URL"]
                _path = the_task["Path"]
                print("Decompressing add on data")
                tarname = _url.split("/")[-1]
                callAndRecord(["tar", "zxvf", refpath  + "/" + tarname, "-C", workpath + "/" + _path])

    savedPath = os.getcwd()
    os.chdir(workpath + "/" + config_data["Path"])
    callAndRecord(["cd", workpath + "/" + config_data["Path"]], True)

    libtoolize_list=["cvms5","cvmh","cs248","uwlinca"]
    autoreconf_list=["cca","cs248"]
    skip_conf_list = ["openssl"]

    if config_data["Path"] in skip_conf_list :
        print("\nNo need to configure -- ", config_data["Path"]);
    else:
        if config_data["Path"] in libtoolize_list :
          print("\nRunning libtoolize")
          callAndRecord(["libtoolize"])

        print("\nRunning aclocal")
        aclocal_array = ["aclocal"]
        if os.path.exists("./m4"):
            aclocal_array += ["-I", "m4"]
        callAndRecord(aclocal_array)

        if config_data["Path"] in autoreconf_list :
          print("\nRunning autoreconf")
          callAndRecord(["autoreconf", "-i", "-f"])
        else:
          print("\nRunning autoconf")
          callAndRecord(["autoconf"])

        print("\nRunning automake")
        callAndRecord(["automake", "--add-missing", "--force-missing"])

    print("\nRunning ./configure")

    prefix_string="--prefix=" + ucvmpath + "/" + pathname + "/" + config_data["Path"]

    if config_data["Path"] == "openssl" :
        configure_array = ["./Configure", prefix_string]
    else:
        configure_array = ["./configure", prefix_string]

    ## special case, move to setup/setup.list
    #if config_data["Path"] == "sfcvm" :
    #    gcc10path=shutil.which("gcc10-gcc")
    #    if gcc10path is None:
    #      pass
    #    else:
    #      configure_array += "CC=gcc10-gcc CXX=gcc10-g++".split(" ")

    createInstallTargetPath( ucvmpath + "/" + pathname + "/" + config_data["Path"])

    if "ConfigureEnv" in config_data.keys(): 
        needs_env = config_data["ConfigureEnv"]
    else:
        needs_env = [] 

    if "ConfigureFlags" in config_data and config_data["ConfigureFlags"] != "" :
        configure_array += config_data["ConfigureFlags"].split(" ")
    elif "Libraries" in config_data:
        needs_array = config_data["Libraries"]
        if "euclid3" in needs_array:
          configure_array.append("--with-etree-lib-path=" + ucvmpath + "/lib/euclid3/lib")
          configure_array.append("--with-etree-include-path=" + ucvmpath + "/lib/euclid3/include")
        if "proj" in needs_array:
          configure_array.append("--with-proj-lib-path=" + ucvmpath + "/lib/proj/lib")
          configure_array.append("--with-proj-include-path=" + ucvmpath + "/lib/proj/include")
        if "netcdf" in needs_array:
          configure_array.append("LDFLAGS=-L" + ucvmpath + "/lib/netcdf/lib")
          configure_array.append("CPPFLAGS=-I" + ucvmpath + "/lib/netcdf/include")
                    
## special case ??
    if config_data["Path"] == "cencal":
        configure_array.append("LDFLAGS=-L" + ucvmpath + "/lib/euclid3/lib -L" + ucvmpath + "/lib/proj/lib")
        configure_array.append("CPPFLAGS=-I" + ucvmpath + "/lib/euclid3/include -I" + ucvmpath + "/lib/proj/include")

##needs to replace all ${UCVM_INSTALL_PATH} with ucvmpath in configure_array
    configure_array_new = []
    for cterm in configure_array :
        n_cterm = cterm.replace('${UCVM_INSTALL_PATH}', ucvmpath)
        configure_array_new.append(n_cterm)

    ## both use $UCVM_INSTALL_PATH
    if config_data["Path"] == "curl" or config_data["Path"] == "proj" or config_data["Path"] == "cca"  or config_data["Path"] == "cvms5":
      callAndRecord(configure_array_new, noshell = False)
    else:
      callAndRecord(configure_array_new)
    
    print("\nRunning make clean")

    ## ??? ignore the return of the call ??
    if config_data["Path"] == "tiff":
      callAndRecord(["make", "clean"])
    else:
      callAndRecord(["make", "clean"])
    
    print("\nRunning make")
    if config_data["Path"] == "cencal":
        os.chdir("./libsrc")
        callAndRecord(["make"])
    else:
        callAndRecord(["make"])
    
    print("\nInstalling...")
    callAndRecord(["make", "install"])
    
    if config_data["Path"] == "cencal":
        os.chdir("../")
        callAndRecord(["mkdir", "-p", ucvmpath + "/model/" + config_data["Path"] + "/model"])
        callAndRecord(["mv", "./model/USGSBayAreaVM-08.3.0.etree", ucvmpath + "/model/" + config_data["Path"] + "/model/"])
        callAndRecord(["mv", "./model/USGSBayAreaVMExt-08.3.0.etree", ucvmpath + "/model/" + config_data["Path"] + "/model/"])
    
    config_data["Install"]="true"
    os.chdir(savedPath)
    callAndRecord(["cd", savedPath], True)

## Any Postprocess needed ? ie, proj needs to install proj-data at installed location
## special case, this is just a data package of a library, just need to stash it at the
## right library location
    if "Postprocess" in config_data :
        post_tasks = config_data["Postprocess"]
        for the_task in post_tasks :
            if "Action" in the_task and the_task["Action"] == "download":
                _url = the_task["URL"]
                _path = the_task["Path"]
                print("Decompressing add on data")
                tarname = _url.split("/")[-1]
                callAndRecord(["tar", "zxvf", refpath  + "/" + tarname, "-C", ucvmpath + "/" + pathname + "/" + _path])


## create the ucvm_env.sh that is approriate to go into /etc/profile.d/
##
def _add2LIBRARYPATH_bash(modelsToInstall, librariesToInstall) :
    str=""
#libraries
    for library in librariesToInstall:
        conf=config_data["libraries"][library]
        str=str+"add2LD_LIBRARY_PATH ${UCVM_INSTALL_PATH}/lib/"+conf['Path']+"/lib\n"
        str=str+"add2DYLD_LIBRARY_PATH ${UCVM_INSTALL_PATH}/lib/"+conf['Path']+"/lib\n"

## models
    for model in modelsToInstall:
        conf = config_data["models"][model]
        str=str+"add2LD_LIBRARY_PATH ${UCVM_INSTALL_PATH}/model/"+conf['Path']+"/lib\n"
        str=str+"add2DYLD_LIBRARY_PATH ${UCVM_INSTALL_PATH}/model/"+conf['Path']+"/lib\n"
    return str

def _add2PATH_bash(modelsToInstall, librariesToInstall) :
    str=""
    model="SFCVM"
    if model in modelsToInstall:
        conf = config_data["models"][model]
        str=str+"add2PATH ${UCVM_INSTALL_PATH}/model/"+conf['Path']+"/bin\n"
    return str

def _add2path_bash(master):
  str =      "function add2"+master+"() {\n"
  str = str +"  if [ \"$"+master+"\" ] ; then\n"
  str = str +"    if ! echo \"$"+master+"\" | grep -Eq \"(^|:)$1($|:)\" ; then\n"
  str = str +"      if [ \"$2\" = \"after\" ] ; then\n"
  str = str +"        export "+master+"=\"$"+master+":$1\"\n"
  str = str +"      else\n"
  str = str +"          export "+master+"=\"$1:$"+master+"\"\n"
  str = str +"      fi\n"
  str = str +"    fi\n"
  str = str +"    else\n"
  str = str +"       export "+master+"=\"$1\"\n"
  str = str +"  fi\n"
  str = str +"}\n"
  return str

def makeBashScript(ucvmsrc, ucvmpath, modelsToInstall, librariesToInstall) :
    str="" 
    fp=open("conf/ucvm_env.sh","w")
    fp.write("## \n")
    fp.write("##  models: [")
    for x in modelsToInstall:
      fp.write(" ")
      fp.write(x)
    fp.write(" ]")
    fp.write("\n")
    fp.write("##  libraries: [")
    for x in librariesToInstall:
      fp.write(" ")
      fp.write(x)
    fp.write(" ]")
    fp.write("\n")
    fp.write("## \n")
    fp.write("\n")
    str="export UCVM_SRC_PATH=" +ucvmsrc
    fp.write(str)
    fp.write("\n")
    str="export UCVM_INSTALL_PATH="+ucvmpath.rstrip("/")
    fp.write(str)
    fp.write("\n")
    fp.write("\n")

    pstr=_add2path_bash("PATH")
    fp.write(pstr)
    fp.write("\n")
    pstr=_add2path_bash("LD_LIBRARY_PATH")
    fp.write(pstr)
    fp.write("\n")
    pstr=_add2path_bash("DYLD_LIBRARY_PATH")
    fp.write(pstr)
    fp.write("\n")
    pstr=_add2path_bash("PYTHONPATH")
    fp.write(pstr)
    fp.write("\n")
    ldpstr=_add2LIBRARYPATH_bash(modelsToInstall, librariesToInstall)
    fp.write(ldpstr)

## add to PYTHONPATH
    pstr="add2PYTHONPATH ${UCVM_INSTALL_PATH}/utilities/pycvm"
    fp.write(pstr)
    fp.write("\n")

## add to PATH
    pstr="add2PATH ${UCVM_INSTALL_PATH}/bin"
    fp.write(pstr)
    fp.write("\n")
    pstr="add2PATH ${UCVM_INSTALL_PATH}/utilities"
    fp.write(pstr)
    fp.write("\n")

## add model specific BIN 
    pstr=_add2PATH_bash(modelsToInstall, librariesToInstall)
    fp.write(pstr)

    pstr=_addPROJ_LIB_bash()
    fp.write("\n")
    fp.write(pstr)
    fp.write("\n")

    fp.close();

## create the ucvm_env.py that is python script can be import to make sure
## LD_LIBRARY_PATH and DYLD_LIBRARY_PATH is setup up
##
def _add2LIBRARYPATH_python(modelsToInstall, librariesToInstall) :
    str=""
#libraries
    for library in librariesToInstall:
        conf=config_data["libraries"][library]
        str=str+"   add2LD_LIBRARY_PATH(UCVM_INSTALL_PATH + \"lib/"+conf['Path']+"/lib\")\n"
        str=str+"   add2DYLD_LIBRARY_PATH(UCVM_INSTALL_PATH + \"lib/"+conf['Path']+"/lib\")\n"

## models
    for model in modelsToInstall:
        conf = config_data["models"][model]
        str=str+"   add2LD_LIBRARY_PATH(UCVM_INSTALL_PATH + \"model/"+conf['Path']+"/lib\")\n"
        str=str+"   add2DYLD_LIBRARY_PATH(UCVM_INSTALL_PATH + \"model/"+conf['Path']+"/lib\")\n"

    return str

def _add2path_python():
  str =      "def _add2env(PNAME, path) :\n"
  str = str +"  my_path=my_env.get(PNAME,False)\n"
  str = str +"  if my_path != False :\n"
  str = str +"    if my_path.find(path) != -1 :\n"
  str = str +"        my_path = my_path + \":\" + path\n"
  str = str +"  else :\n"
  str = str +"    my_path = path\n"
  str = str +"  my_env[PNAME] = my_path\n\n"
  str = str +"def add2PATH(path) :\n"
  str = str +"  _add2env(\"PATH\",path)\n\n"
  str = str +"def add2LD_LIBRARY_PATH(path) :\n"
  str = str +"  _add2env(\"LD_LIBRARY_PATH\",path)\n\n"
  str = str +"def add2DYLD_LIBRARY_PATH(path) :\n"
  str = str +"  _add2env(\"DYLD_LIBRARY_PATH\",path)\n\n"
  return str

def makePythonScript(ucvmsrc, ucvmpath, modelsToInstall, librariesToInstall) :
    str="" 
    fp=open("conf/ucvm_env.py","w")
    fp.write("## \n")
    fp.write("##  models: [")
    for x in modelsToInstall:
      fp.write(" ")
      fp.write(x)
    fp.write(" ]")
    fp.write("\n")
    fp.write("##  libraries: [")
    for x in librariesToInstall:
      fp.write(" ")
      fp.write(x)
    fp.write(" ]\n")
    fp.write("## \n\n")
    str="import os\n"
    fp.write(str)
    str="UCVM_SRC_PATH=\"" + ucvmsrc + "\"\n"
    fp.write(str)
    str="UCVM_INSTALL_PATH=\""+ucvmpath.rstrip("/")+"\"\n"
    fp.write(str)
    str="my_env=os.environ\n\n"
    fp.write(str)

    pstr=_add2path_python()
    fp.write(pstr)
    str="def setup_ucvm_env():\n"
    fp.write(str)
    ldpstr=_add2LIBRARYPATH_python(modelsToInstall, librariesToInstall)
    fp.write(ldpstr)

## add to PATH
    pstr="   add2PATH(UCVM_INSTALL_PATH + \"bin\")\n"
    fp.write(pstr)
    pstr="   add2PATH(UCVM_INSTALL_PATH + \"utilities\")\n"
    fp.write(pstr)

    pstr=_addPROJ_LIB_python()
    fp.write("\n")
    fp.write(pstr)

    fp.close();

def _addInstallNameTool_bash(modelsToInstall, librariesToInstall):
    str=""
    if "Euclid3" in librariesToInstall:
        str=str+"install_name_tool -change libetree.so ${MY_UCVM_INSTALL_PATH}/lib/euclid3/lib/libetree.so $1\n"
    if "CS173" in modelsToInstall:
        str=str+"install_name_tool -change libcs173.so ${MY_UCVM_INSTALL_PATH}/model/cs173/lib/libcs173.so $1\n"
    if "CS173H" in modelsToInstall:
        str=str+"install_name_tool -change libcs173h.so ${MY_UCVM_INSTALL_PATH}/model/cs173h/lib/libcs173h.so $1\n"
    if "CVM-H" in modelsToInstall:
        str=str+"install_name_tool -change libcvmh.so ${MY_UCVM_INSTALL_PATH}/model/cvmh/lib/libcvmh.so $1\n"
    if "CVMHLABN" in modelsToInstall:
        str=str+"install_name_tool -change libcvmhlabn.so ${MY_UCVM_INSTALL_PATH}/model/cvmhlabn/lib/libcvmhlabn.so $1\n"
    if "CVMHSGBN" in modelsToInstall:
        str=str+"install_name_tool -change libcvmhsgbn.so ${MY_UCVM_INSTALL_PATH}/model/cvmhsgbn/lib/libcvmhsgbn.so $1\n"
    if "CVMHVBN" in modelsToInstall:
        str=str+"install_name_tool -change libcvmhvbn.so ${MY_UCVM_INSTALL_PATH}/model/cvmhvbn/lib/libcvmhvbn.so $1\n"
    if "SFCVM" in modelsToInstall:
        str=str+"install_name_tool -change libsfcvm.so ${MY_UCVM_INSTALL_PATH}/model/sfcvm/lib/libsfcvm.so $1\n"
    if "UWLINCA" in modelsToInstall:
        str=str+"install_name_tool -change libuwlinca.so ${MY_UCVM_INSTALL_PATH}/model/uwlinca/lib/libuwlinca.so $1\n"
    if "CVMHSMBN" in modelsToInstall:
        str=str+"install_name_tool -change libcvmhsmbn.so ${MY_UCVM_INSTALL_PATH}/model/cvmhsmbn/lib/libcvmhsmbn.so $1\n"
    if "CVMHSBCBN" in modelsToInstall:
        str=str+"install_name_tool -change libcvmhsbcbn.so ${MY_UCVM_INSTALL_PATH}/model/cvmhsbcbn/lib/libcvmhsbcbn.so $1\n"
    if "CVMHSBBN" in modelsToInstall:
        str=str+"install_name_tool -change libcvmhsbbn.so ${MY_UCVM_INSTALL_PATH}/model/cvmhsbbn/lib/libcvmhsbbn.so $1\n"
    if "CVMHSTBN" in modelsToInstall:
        str=str+"install_name_tool -change libcvmhstbn.so ${MY_UCVM_INSTALL_PATH}/model/cvmhstbn/lib/libcvmhstbn.so $1\n"
    if "CVMHRBN" in modelsToInstall:
        str=str+"install_name_tool -change libcvmhrbn.so ${MY_UCVM_INSTALL_PATH}/model/cvmhrbn/lib/libcvmhrbn.so $1\n"
    if "CVMHIBBN" in modelsToInstall:
        str=str+"install_name_tool -change libcvmhibbn.so ${MY_UCVM_INSTALL_PATH}/model/cvmhibbn/lib/libcvmhibbn.so $1\n"
    if "CVM-S4" in modelsToInstall:
        str=str+"install_name_tool -change libcvms.so ${MY_UCVM_INSTALL_PATH}/model/cvms/lib/libcvms.so $1\n"
    if "WFCVM" in modelsToInstall:
        str=str+"install_name_tool -change libwfcvm.so ${MY_UCVM_INSTALL_PATH}/model/wfcvm/lib/libwfcvm.so $1\n"
    if "IMPERIAL" in modelsToInstall:
        str=str+"install_name_tool -change libivlsu.so ${MY_UCVM_INSTALL_PATH}/model/ivlsu/lib/libivlsu.so $1\n"
    if "COACHELLA" in modelsToInstall:
        str=str+"install_name_tool -change libcvlsu.so ${MY_UCVM_INSTALL_PATH}/model/cvlsu/lib/libcvlsu.so $1\n"
    if "ALBACORE" in modelsToInstall:
        str=str+"install_name_tool -change libalbacore.so ${MY_UCVM_INSTALL_PATH}/model/albacore/lib/libalbacore.so $1\n"
    if "CVM-S4.26" in modelsToInstall:
        str=str+"install_name_tool -change libcvms5.so ${MY_UCVM_INSTALL_PATH}/model/cvms5/lib/libcvms5.so $1\n"
    if "CVM-S4.26.M01" in modelsToInstall:
        str=str+"install_name_tool -change libcvmsi.so ${MY_UCVM_INSTALL_PATH}/model/cvmsi/lib/libcvmsi.so $1\n"
    if "CenCalVM" in modelsToInstall:
        str=str+"install_name_tool -change libcencal.so ${MY_UCVM_INSTALL_PATH}/model/cencal/lib/libcencal.so $1\n"
    if "CCA" in modelsToInstall:
        str=str+"install_name_tool -change libcca.so ${MY_UCVM_INSTALL_PATH}/model/cca/lib/libcca.so $1\n"
    if "CS248" in modelsToInstall:
        str=str+"install_name_tool -change libcs248.so ${MY_UCVM_INSTALL_PATH}/model/cs248/lib/libcs248.so $1\n"
    if "CS242" in modelsToInstall:
        str=str+"install_name_tool -change libcs242.so ${MY_UCVM_INSTALL_PATH}/model/cs242/lib/libcs242.so $1\n"
    if "SJFZ" in modelsToInstall:
        str=str+"install_name_tool -change libsjfz.so ${MY_UCVM_INSTALL_PATH}/model/sjfz/lib/libsjfz.so $1\n"
    return str

def makeDyLibNameChangeScript(ucvmsrc, ucvmpath, modelsToInstall, librariesToInstall) :
    str="" 
    fp=open("conf/call_install_name_tool","w")
    fp.write("#!/bin/bash \n")
    fp.write("## \n")
    fp.write("##  models: [")
    for x in modelsToInstall:
      fp.write(" ")
      fp.write(x)
    fp.write(" ]")
    fp.write("\n")
    fp.write("##  libraries: [")
    for x in librariesToInstall:
      fp.write(" ")
      fp.write(x)
    fp.write(" ]")
    fp.write("\n")
    fp.write("## \n")
    fp.write("## workaround for macOS's system-integrity-protection's handling\n")
    fp.write("## of DYLD/LD_LIBRARY_PATH\n")
    fp.write("## \n")
    fp.write("\n")
    str="export MY_UCVM_SRC_PATH=" +ucvmsrc
    fp.write(str)
    fp.write("\n")
    str="export MY_UCVM_INSTALL_PATH="+ucvmpath.rstrip("/")
    fp.write(str)
    fp.write("\n")


    ldpstr=_addInstallNameTool_bash(modelsToInstall, librariesToInstall)
    fp.write(ldpstr)
    fp.close()

def process_user_path(p):
    global ucvmpath
    ucvmpath = p
    
## link proj's library to PROJ_LIB location if PROJ_LIB is defined
## else set it 
def linkPROJ_LIB(ucvmpath) :
   try :
      proj_lib = os.environ['PROJ_LIB']
   except:
      return 
   _proj_lib=ucvmpath+"/lib/proj/share/proj"
   print("\nHUM.. PROJ_LIB is defined attach",_proj_lib)
   call(["ln", "-p", ucvmpath+"/lib/proj/share/proj", proj_lib])

def _addPROJ_LIB_bash() :
   try :
      proj_lib = os.environ['PROJ_LIB']
   except:
      ret="export PROJ_LIB="+ucvmpath+"/lib/proj/share/proj"
      return ret 
#   return "export PROJ_LIB="+proj_lib
   return  "export PROJ_LIB="+ucvmpath+"/lib/proj/share/proj"

def _addPROJ_LIB_python() :
   try :
      proj_lib = os.environ['PROJ_LIB']
   except:
      ret="PROJ_LIB=\""+ucvmpath+"/lib/proj/share/proj\""
      return ret 
   return ""

#
# Start of main method.
# Read in the possible arguments
#
try:
    opts, args = getopt.getopt(sys.argv[1:], "asdhrp:", ["all", "static", "dynamic", "help", "restart","path"])
except getopt.GetoptError as err:
    print(str(err))
    usage()
    exit(1)

for o, a in opts:
    if o in ('-r', '--restart'):
        restart_flag = True
        print("Restart Flag: True")
    elif o in ('-a', '--all'):
        all_flag = True
        print("All Flag: True")
    elif o in ('-s', '--static'):
        dynamic_flag = False
        print("static Flag: True")
    elif o in ('-d', '--dynamic'):
        user_dynamic_flag = True 
        print("dynamic Flag: True")
    elif o in ('-p', '--path'):
        process_user_path(a)
        skip_ask_path = True
    elif o in ('-h', '--help'):
        usage()
        exit(0)
    else:
        if o[0:6].lower() == "--with-":
            unsupported_features.append(o[7:].lower())
        else:
            print("Invalid option %s" % (o))
            exit(1)

print("")
print("UCVM %s Installation" % VERSION)
print("Copyright (C) 20%s University of Southern California. All rights reserved." % (VERSION.split(".")[0]))

print("Using local setup.list and system.list ....")
    
try:
    f = open("./setup/system.list", "r")
    json_string = f.read()
    f.close()
    system_data = json.loads(json_string)
except OSError as e:
    eG(e, "Parsing list of supported systems.")
    
try:
    # Check the all-applicable conditions first.
    for k, v in system_data["all"].items():
        if eval(k):
            print("\n" + v["message"])
            exec(v["code"])

    print("Now check system specific conditions.")
    for k in system_data:
        print("System_data - k: ", k)
        if k != "all" and k in socket.gethostname():
            for k2 in sorted(system_data[k].iterkeys()):
                var_array = system_data[k][k2]
                if k2 != "vars":
                    the_command = Popen([item.replace("\x00", "") for item in shlex.split(var_array["command"])], \
                                        stdout = PIPE, stderr = PIPE)
                    if var_array["listenOn"] == "stderr":
                        com_results = the_command.communicate()[1]
                    else:
                        com_results = the_command.communicate()[0]
                
                    if eval("not " + var_array["condition"] + " com_results"):
                        print("\n" + var_array["not"])
                        exit()
                else:
                    for k3, v3 in var_array.items():
                        if type(v3) is dict:
                            if not eval(k3) == v3["value"]:
                                print("\n" + v3["not"])
                                exec(k3 + " = " + v3["value"])
                            else:
                                exec(k3 + " = " + v3)
except Exception as e:
    eG(e, "Checking system conditions.")

if error_out == True:
    print("\nError(s) encountered. Please resolve the above errors and re-run this script.")
    exit(1)
    
print("Using local setup.list file")

try:
    # We now have our list. Parse it.
    f = open("./setup/setup.list", "r")
    json_string = f.read()
    f.close()
    config_data = json.loads(json_string)
except OSError as e:
    eG(e, "Parsing available model list.")

print("\nPlease answer the following questions to install UCVM.\n")
print("Note that this install and build process may take up to an hour depending on your")
print("computer speed.")

if skip_ask_path == False :
    print("Where would you like UCVM to be installed?")

    try:
        if ucvmpath[0] == "$":
            # We want to expand that.
            ucvmpath = os.environ(ucvmpath[1:])
    except Exception:
        # Use default path.
        ucvmpath = os.path.expanduser("~")

# Append the version info to the path.
    ucvmpath = ucvmpath.rstrip("/") + "/ucvm-" + VERSION
    
    print("(Default: " + ucvmpath + ")")
    if sys.version_info.major >= (3) :
        enteredpath = input("Enter path or blank to use the default path: ")
    else:
        enteredpath = raw_input("Enter path or blank to use the default path: ")

    if enteredpath.strip() == "":
        enteredpath = ucvmpath

    while enteredpath != "":
        # Check to see that that path exists and is writable.
        if not os.access(os.path.dirname(enteredpath.rstrip("/")), os.W_OK | os.X_OK):
            print("\n" + enteredpath + " does not exist or is not writable.")
            if sys.version_info.major >= (3) :
              enteredpath = input("Exiting:Please enter a different path or blank to use the default path: ")
            else:
              enteredpath = raw_input("Exiting:Please enter a different path or blank to use the default path: ")
            sys.exit(0)
        else:
            break
    
# Copy final selected path back to the UCVM path variable.
# remove trailing '/' just in case
    ucvmpath = enteredpath.rstrip("/")

# Create necessary directories
if not os.path.exists(ucvmpath):
  call(["mkdir", "-p", ucvmpath])
  call(["mkdir", "-p", ucvmpath+'/work'])
  call(["mkdir", "-p", ucvmpath+'/lib'])

## print(config_data["models"].keys())
    
for model in sorted(iter(config_data["models"].keys()), key=lambda k: config_data["models"][k]["Order"]):

    the_model = config_data["models"][model]
    tarname = the_model["URL"].split("/")[-1]
    ltarname = "./work/model/" + tarname
## continue only if the model is in work_model_dir 
    if not os.path.isfile(ltarname):
        continue
    if all_flag == True:
        modelsToInstall.append(model)
        continue

    if config_data["models"][model]["Ask"] != "no":
        print("\nWould you like to install " + model + "?")
        if sys.version_info.major >= (3) :
          dlinstmodel = input("Enter yes or no: ")
        else:
          dlinstmodel = raw_input("Enter yes or no: ")
     
        if dlinstmodel != "" and dlinstmodel.lower()[0] == "y":
            modelsToInstall.append(model)
            
print("\nYou have indicated that you would like to install")
printPretty(modelsToInstall)


### there are some library that requires other libraries to be installed first
### ie, netcdf needs hdf5
###     geomodelgrids needs hdf5 and proj
###   very HACKY :-)
for library in config_data["libraries"]:
    the_library = config_data["libraries"][library]
    if the_library["Ask"] == "yes" or library.lower() in unsupported_features:
        if the_library["Prerequisites"] != "":
            if "Dynamic" in the_library["Prerequisites"] and dynamic_flag == False:
                print(library + " requires UCVM to be linked dynamically. If you would like " + library)
                print("to be included, please re-run ucvm_setup.py with the '-d' flag.")
            if "Static" in the_library["Prerequisites"] and dynamic_flag == True:
                print(library + " requires UCVM to be linked statically. If you would like " + library)
                print("to be included, please re-run ucvm_setup.py without the '-d' flag.")            
        
        if library.lower() in unsupported_features:
            print("WARNING: " + library + " is unsupported and we cannot guarantee that UCVM")
            print("will install correctly on your system if you install it with this library included.")
            
        print("\nWould you like to install support for " + library + "?")
        if sys.version_info.major >= (3) :
          dlinstlibrary = input("Enter yes or no: ")
        else:
          dlinstlibrary = raw_input("Enter yes or no: ")
                 
        if dlinstlibrary.strip() != "" and dlinstlibrary.strip().lower()[0] == "y":
          librariesToInstall.append(library)
    elif the_library["Required"] == "yes":
        librariesToInstall.append(library)

print("\nYou have indicated that you would like to install")
printPretty(librariesToInstall)

# Check if we can make the work directory.
try:
    if not os.path.exists("./work"):
#       call(["rm", "-R", "./work"])
#       call(["mkdir", "-p", "./work"])
        print("Work directory does not exist. Did you remember to stage sources? Error, exitting...")
        sys.exit(1)
    if not os.path.exists("./work") or not os.access("./work", os.W_OK | os.X_OK):
        print("Could not create ./work directory.")
        sys.exit(1)
except OSError as e:
    eG(e, "Could not create ./work directory.")

print("\nNow setting up the required UCVM libraries...")

#orderedLibrariesToInstall = []
for library in config_data["libraries"]: 
    the_library = config_data["libraries"][library]
    if library in librariesToInstall:
## bring in the dependency 
        if the_library.get("Needs", "") != "":
            needlist=the_library["Needs"].split()
            for need in needlist:
                if need in orderedLibrariesToInstall:
                   # no need to do anything
                   pass
                else:
                   orderedLibrariesToInstall.append(need)
        orderedLibrariesToInstall.append(library)


for library in config_data["libraries"]:
    the_library = config_data["libraries"][library]
    if library in orderedLibrariesToInstall:
        print("\n CHECKING on ", library)
        try:
            #downloadWithProgress(the_library["URL"], "./work/lib", "Downloading " + library + "..." )
            tarname = the_library["URL"].split("/")[-1]

            print("Calling URL Install with tarname,ucvmpath:",tarname,ucvmpath)
    
            installConfigMakeInstall(tarname, ucvmpath, "library", the_library)
        except Exception as e:
            eG(e, "Error installing library " + library + ".")

print("\nNow setting up CVM models...")

for model in config_data["models"]:
    print("Install model_name: ", model)
    the_model = config_data["models"][model]
    if model in modelsToInstall:
        try:
           #
            # Currently, this test for existing tar file will always fail because of the
            # recursive directory removal done above
            # TODO: Change this to check for largefiles/file and copy over if it has been downloaded already
            #
            tarname = the_model["URL"].split("/")[-1]
            ltarname = "./work/model/" + tarname
            print("Preparing to install model with tarname: ",tarname)
            if not os.path.isfile(ltarname):
                print("Model file not found in work directory:",tarname)
                print("Exiting...")
                sys.exit(1)
            else:
                print("Model tar file found in work directory:",ltarname)
            installConfigMakeInstall(tarname, ucvmpath, "model", the_model)
        except Exception as e:
            eG(e, "Error installing model " + model + ".")

# Now that the models are installed, we can finally install UCVM!
print("\nInstalling UCVM software...")

print("\nRunning aclocal")
callAndRecord(["aclocal", "-I", "./m4"])
print("\nRunning automake")
callAndRecord(["automake", "--add-missing", "--force-missing"])
print("\nRunning autoconf")
callAndRecord(["autoconf"])

print("\nRunning ./configure for UCVM")
 
### ONLY bring in libraries that were installled..
ucvm_conf_command = ["./configure", "--enable-silent-rules" ]

for library in librariesToInstall:
    the_library = config_data["libraries"][library]
    if "UCVMConfigureFlags" in the_library and the_library["UCVMConfigureFlags"] != "":
       flags = the_library["UCVMConfigureFlags"].split(" ")
       ucvm_conf_command += flags

for model in modelsToInstall:
    the_model = config_data["models"][model]
    
    # We need to append the ucvm configure flags.
    if "UCVMConfigureFlags" in the_model and the_model["UCVMConfigureFlags"] != "" :
      flags = the_model["UCVMConfigureFlags"].split(" ")
      ucvm_conf_command += flags
     
ucvm_conf_command.append("--prefix=" + ucvmpath)

if dynamic_flag == False:
    ucvm_conf_command.append("--enable-static")
if user_dynamic_flag == True:
    ## no op
    print("no need to add dynamic flag")
#    ucvm_conf_command.append("--enable-dynamic")
if use_iobuf == True:
    ucvm_conf_command.append("--enable-iobuf")
 
#if "NetCDF" in librariesToInstall:
#    ucvm_conf_command.append("--enable-netcdf")
#    ucvm_conf_command.append("--with-netcdf-include-path=" + ucvmpath + "/lib/netcdf/include")
#    ucvm_conf_command.append("--with-netcdf-lib-path=" + ucvmpath + "/lib/netcdf/lib")
#    ucvm_conf_command.append("LDFLAGS=-L" + ucvmpath + "/lib/hdf5/lib")
    
#ucvm_conf_command.append("UCVM_INSTALL_PATH=" + ucvmpath)

##needs to replace all ${UCVM_INSTALL_PATH} with ucvmpath
ucvm_conf_command_new = []
for cterm in ucvm_conf_command :
   n_cterm = cterm.replace('${UCVM_INSTALL_PATH}', ucvmpath)
   ucvm_conf_command_new.append(n_cterm)

callAndRecord(ucvm_conf_command_new, noshell = False) 

print("\nMaking UCVM")
callAndRecord(["make", "clean"])
callAndRecord(["make"])

if platform.system() == "Darwin" or platform.system() == "Linux" or dynamic_flag == True:
    makeBashScript(os.getcwd(), ucvmpath ,modelsToInstall, librariesToInstall)
    makePythonScript(os.getcwd(), ucvmpath ,modelsToInstall, librariesToInstall)
    makeDyLibNameChangeScript(os.getcwd(), ucvmpath, modelsToInstall, librariesToInstall)

print("\nInstalling UCVM")
callAndRecord(["make", "install"])
print("\nDone installing UCVM!")

sys.stdout.write("\nThank you for installing UCVM.\n")
sys.stdout.flush()

if platform.system() == "Darwin" or platform.system() == "Linux" or dynamic_flag == True:
    print("Now edit your ~/.bashrc file to call "+ ucvmpath.rstrip("/") + "/conf/ucvm_env.sh \n")
    print("   source " + ucvmpath.rstrip("/") + "/conf/ucvm_env.sh \n")
    print("This will set the required UCVM environment variables.")
    print("Then log out, and log in, move to tests directory, and run the tests\n")
    print("   $ cd " + ucvmpath.rstrip("/") + "/tests ")
    print("   $ ./run-testing \n")
    print("This will run the UCVM unit and acceptance tests. If all tests pass, ")
    print("UCVM is correctly installed and ready to use on your computer.")
    print("To try out ucvm, once the tests pass, run an example query.\n")
    print("   $ ucvm_query -f "+ ucvmpath+"/conf/ucvm.conf -m cvms < " + ucvmpath+ "/tests/inputs/test_latlons.txt\n")
    print("You will then see the following output:\n\nUsing Geo Depth coordinates as default mode.")
    print(" -118.0000    34.0000      0.000    280.896    390.000       cvms    696.491    213.000   1974.976       none      0.000      0.000      0.000      crust    696.491    213.000   1974.976")
    print(" -118.0000    34.0000     50.000    280.896    390.000       cvms   1669.540    548.000   2128.620       none      0.000      0.000      0.000      crust   1669.540    548.000   2128.620")
    print(" -118.0000    34.0000    100.000    280.896    390.000       cvms   1683.174    603.470   2130.773       none      0.000      0.000      0.000      crust   1683.174    603.470   2130.773")
    print("-118.0000    34.0000    500.000    280.896    390.000       cvms   3097.562   1656.495   2354.105       none      0.000      0.000      0.000      crust   3097.562   1656.495   2354.105")
    print(" -118.0000    34.0000   1000.000    280.896    390.000       cvms   3660.809   2056.628   2443.042       none      0.000      0.000      0.000      crust   3660.809   2056.628   2443.042")


try:
    f = open('./setup_log.sh', 'w')
    f.write(shell_script)
    f.close()
except OSError as e:
    eG(e, "Saving setup_log.sh.")

# Write out a installation json file (expanded from setup.list)
try:
    f = open('./setup_install.list', 'w')
    f.write(json.dumps(config_data,indent=2,sort_keys=True))
    f.close()
except OSError as e:
    eG(e, "Saving setup_install.list.")

print("\nInstallation complete. Installation log file saved at ./setup_log.sh\n")
