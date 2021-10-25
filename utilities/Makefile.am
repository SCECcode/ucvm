EXTRA_DIST = installed_models makegrid.sh run_ucvm.sh run_ucvm_query.sh time_mesh_generation.py

install: $(install_PROGRAMS)
	mkdir -p ${prefix}/utilities
	if ! test . -ef ${prefix}/utilities; then \
		for i in $(EXTRA_DIST); do \
			cp $${i} ${prefix}/utilities; \
		done \
	fi

clean:
	echo ""
