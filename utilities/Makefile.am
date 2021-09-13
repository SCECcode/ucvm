bin_PROGRAMS = installed_models makegrid run_ucvm.sh run_ucvm_query.sh time_mesh_generation

install: $(bin_PROGRAMS)
	mkdir -p ${prefix}/utilities
	if ! test . -ef ${prefix}/utilities; then \
	for i in $(bin_PROGRAMS); do \
                cp $${i} ${prefix}/utilities; \
	fi

clean:
	echo ""
