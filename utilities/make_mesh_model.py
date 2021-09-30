#!/usr/bin/env python3
import sys
import os
import time
#
# Generate the master out.grid
# Create a 3M point file of lat/lons - and write to ASCII file called out.grd.
# This file will be used as input to ucvm_query for medium scale test for images
#
if not os.path.exists("out.grd"):
  print("Creating grd.out file.")
  cmd="/app/ucvm/utilities/makegrid"
  print(cmd)
  os.system(cmd)
#
#
valid_model_strings = {"1d": 1,
"bbp1d":1,
"cca":1,
"wfcvm":1,
"albacore":1,
"cvlsu":1,
"ivlsu":1,
"cvms":1,
"cvmh":1,
"cvmsi":1,
"cvms5":1}

# Check model parameter
if len (sys.argv) < 2:
  print("Input format: % make_mesh_model.py cvms")
  sys.exit()
else:
  model_string = sys.argv[1]
#
# Check if model is valid
print("Model string: {}".format(model_string))
try:
  valid = valid_model_strings[model_string.strip()] 
except:
  print("Unknown model: {}".format(model_string))
  for key in valid_model_strings.items():
    print(key, valid_model_strings[key])
  sys.exit()

#
# Call each of the installed crustal models and time how
# long it takes to populate the models
#
#
#
start = time.time()
cmd="ucvm_query -f /app/ucvm/conf/ucvm.conf -m %s < out.grd > mesh_%s.out"%(model_string,model_string)
print(cmd)
os.system(cmd)
end = time.time()
print("Mesh extraction for model {} : {} seconds".format(model_string,(end-start)))
