# Autoconf/Automake binaries and headers
#
#
bin_PROGRAMS=

if UCVM_AM_ENABLE_CVMH
bin_PROGRAMS += run_ucvm_query_cvmh.sh
run_ucvm_query_cvmh_sh_SOURCES = run_ucvm_query_cvmh.sh
endif

if UCVM_AM_ENABLE_CVLSU
bin_PROGRAMS += run_ucvm_query_cvlsu.sh
run_ucvm_query_cvlsu_sh_SOURCES = run_ucvm_query_cvlsu.sh
endif

if UCVM_AM_ENABLE_IVLSU
bin_PROGRAMS += run_ucvm_query_ivlsu.sh
run_ucvm_query_ivlsu_sh_SOURCES = run_ucvm_query_ivlsu.sh
endif

if UCVM_AM_ENABLE_WFCVM
bin_PROGRAMS += run_ucvm_query_wfcvm.sh
run_ucvm_query_wfcvm_sh_SOURCES = run_ucvm_query_wfcvm.sh
endif

if UCVM_AM_ENABLE_ALBACORE
bin_PROGRAMS += run_ucvm_query_albacore.sh
run_ucvm_query_albacore_sh_SOURCES = run_ucvm_query_albacore.sh
endif

if UCVM_AM_ENABLE_CENCAL 
if UCVM_AM_ENABLE_CVMS5
bin_PROGRAMS += run_ucvm_query_cencal_cvms5.sh
run_ucvm_query_cencal_cvms5_sh_SOURCES = run_ucvm_query_cencal_cvms5.sh
endif
endif

if UCVM_AM_ENABLE_CVMSI
bin_PROGRAMS += run_ucvm_query_cvmsi.sh
run_ucvm_query_cvmsi_sh_SOURCES = run_ucvm_query_cvmsi.sh
endif

if UCVM_AM_ENABLE_CENCAL 
if UCVM_AM_ENABLE_CVMS
bin_PROGRAMS += run_ucvm_query_cencal_cvms.sh
run_ucvm_query_cencal_cvms_sh_SOURCES = run_ucvm_query_cencal_cvms.sh
endif
endif


all: $(bin_PROGRAMS)
############################################
# Special build targets
############################################
check: $(bin_PROGRAMS)
	@( cd ${prefix}/tests/ucvm; \
	for i in $(bin_PROGRAMS); do \
		./$${i}; \
	done \
	)

install: $(bin_PROGRAMS)
	mkdir -p ${prefix}/tests/ucvm
	for i in $(bin_PROGRAMS); do \
		cp $${i} ${prefix}/tests/ucvm; \
		echo "(cd ucvm; ./$${i})" >> ${prefix}/tests/run-testing; \
	done

clean: 
	rm -f *.o *~


