# # -*- Autoconf -*-

# ----------------------------------------------------------------------
# SCEC_CHECK_USC_DISCOVERY_HOST
# ----------------------------------------------------------------------
AC_DEFUN([SCEC_CHECK_USC_DISCOVERY_HOST], [
  AC_MSG_CHECKING([if running on the USC Discovery cluster])
  scec_hostname=`echo $HOSTNAME`
  case $scec_hostname in
    discovery*.hpc.usc.edu)
      AC_MSG_RESULT([yes])
      ;;
    *)
      AC_MSG_RESULT([no])
      ;;
  esac
])
