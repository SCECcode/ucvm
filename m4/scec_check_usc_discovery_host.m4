# # -*- Autoconf -*-

# ----------------------------------------------------------------------
# SCEC_CHECK_USC_DISCOVERY_HOST
# ----------------------------------------------------------------------
AC_DEFUN([SCEC_CHECK_USC_DISCOVERY_HOST], [
  AC_MSG_CHECKING([if running on the USC Discovery cluster])
  HOSTNAME=`hostname`
  case "$HOSTNAME" in
    discovery*.hpc.usc.edu )
      AC_MSG_RESULT([yes])
      ;;
    *)
      AC_MSG_RESULT([no])
      ;;
  esac
])
