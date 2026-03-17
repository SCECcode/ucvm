# GNU Automake config
#

EXTRA_DIST = configure 

SUBDIRS = aux-config conf \
	model/ucvm model/1d src/ucvm src/ucvm2etree \
	src/ucvm2mesh src/grd src/grd2etree src/patch \
	src/ecoalesce src/ecompact src/basin test examples man \
	src/ssh src/vs30 \
	utilities

TEST_SUBDIRS = test examples

#INCLUDES = $(default_includes)
AM_CPPFLAGS = $(default_includes)


runcheck: $(TEST_SUBDIRS)
	@for i in $(TEST_SUBDIRS); do \
	  (cd $${i}; make -s check;) \
	done


