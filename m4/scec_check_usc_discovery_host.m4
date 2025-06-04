# # -*- Autoconf -*-

# ----------------------------------------------------------------------
# SCEC_CHECK_USC_DISCOVERY_HOST
# ----------------------------------------------------------------------
AC_DEFUN([SCEC_CHECK_USC_DISCOVERY_HOST], [
  AC_MSG_CHECKING([if running on the USC Discovery cluster])
  scec_hostname=`echo $HOSTNAME`
  case $scec_hostname in
    discovery*.hpc.usc.edu)
      _scec_check_usc_discovery_host=yes
      AC_MSG_RESULT([yes])
      ;;
    *)
      _scec_check_usc_discovery_host=no
      AC_MSG_RESULT([no])
      ;;
  esac

# Finally, execute ACTION-IF-FOUND/ACTION-IF-NOT-FOUND:
  AS_IF([test x"$_scec_check_usc_discovery_host" = xyes], [
        ifelse([$2],,[AC_DEFINE(USE_USC_DISCOVERY,1,[Define if you are running on USC discovery.])],[$2])
        :
  ],[
        $3
        :
  ])

])dnl SCEC_CHECK_USC_DISCOVERY_HOST
