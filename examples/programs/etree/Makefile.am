# Autoconf/Automake binaries and headers
#
#
bin_PROGRAMS=

if UCVM_AM_ENABLE_CVMH
bin_PROGRAMS += run_ucvm2etree_cvmh.sh
run_ucvm2etree_cvmh_sh_SOURCES = run_ucvm2etree_cvmh.sh
endif

run_ucvm2etree_cvmh.sh:

all: $(bin_PROGRAMS)
############################################
# Special build targets
############################################
check: $(bin_PROGRAMS)
	@( cd ${prefix}/tests/etree; \
	for i in $(bin_PROGRAMS); do \
		./$${i}; \
	done \
	)

install: $(bin_PROGRAMS)
	mkdir -p ${prefix}/tests/etree
	cp *_template ${prefix}/tests/etree
	for i in $(bin_PROGRAMS); do \
		cp $${i} ${prefix}/tests/etree; \
		echo "(cd etree; ./$${i})" >> ${prefix}/tests/run-testing; \
	done

clean: 
	rm -f *.o *~ *.conf *.e *.conf *.out


