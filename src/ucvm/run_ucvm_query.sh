#!/bin/bash

## this is to run the ucvm_query with proper LD_LIBRARY_PATH and
## DYLD_LIBRARY_PATH that mac os seems to like to eliminate under
## SIP mode

# Process options
FLAGS=""
CONF=""

# Pass along any arguments to UCVM
while getopts 'hHm:p:c:f:z:bl:I:O:' OPTION
do
  if [ "$OPTION" == "O" ]; then
      OUT=$OPTARG
  elif [ "$OPTION" == "I" ]; then
      IN=$OPTARG
  elif [ "$OPTION" == "f" ]; then
      CONF=$OPTARG
      FLAGS="${FLAGS} -$OPTION $OPTARG"
  elif [ "$OPTARG" != "" ]; then
      FLAGS="${FLAGS} -$OPTION $OPTARG"
  else
      FLAGS="${FLAGS} -$OPTION"
  fi
done
shift $(($OPTIND - 1))

### run_ucvm_query.sh can be run with 'absolute' path to installed
### location 

if [ "$UCVM_INSTALL_PATH" ] ; then
  SCRIPT_DIR="$UCVM_INSTALL_PATH"/bin
  else
    SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
fi

## 
source ${SCRIPT_DIR}/../conf/ucvm_env.sh

if [ "$CONF" == "" ]; then
   if [ -f ./ucvm.conf  ]; then 
      FLAGS="${FLAGS} -f ./ucvm.conf"
   else
      if [ ! -z "${UCVM_INSTALL_PATH}" ]; then
          FLAGS="${FLAGS} -f ${UCVM_INSTALL_PATH}/conf/ucvm.conf"
      fi 
   fi
fi

if [ "$IN" != "" ]; then
  if [ "$OUT" != "" ]; then
      ${SCRIPT_DIR}/ucvm_query ${FLAGS} < $IN 1 >> $OUT 2>/dev/null 
  else
      ${SCRIPT_DIR}/ucvm_query ${FLAGS} < $IN
  fi
else
  ${SCRIPT_DIR}/ucvm_query ${FLAGS} 
fi

