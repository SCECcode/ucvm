# Autoconf/Automake binaries and headers

bin_PROGRAMS = ucvm2mesh mesh_strip_ijk mesh_op mesh_check mesh_translate

if UCVM_HAVE_MPI
bin_PROGRAMS += ucvm2mesh_mpi ucvm2mesh_mpi_layer
endif

if UCVM_HAVE_NETCDF
bin_PROGRAMS += mesh2netcdf mesh2hdf5
endif

# General compiler/linker flags
AM_CFLAGS = -I../ucvm
AM_LDFLAGS = -L../ucvm -lucvm ${LDFLAGS}

if UCVM_HAVE_MPI
AM_CFLAGS += -DUM_ENABLE_MPI
endif

# Dist sources
ucvm2mesh_SOURCES = ucvm2mesh.c um_config.c um_utils.c \
		um_mesh.c um_stat.c um_dtypes.h \
		um_config.h um_utils.h um_mesh.h um_stat.h
ucvm2mesh_mpi_SOURCES = ucvm2mesh_mpi.c um_config.c um_mpi.c \
		um_utils.c um_mesh.c um_stat.c um_dtypes.h \
		um_config.h um_mpi.h um_utils.h um_mesh.h um_stat.h
mesh_strip_ijk_SOURCES = mesh_strip_ijk.c um_mesh.c um_mesh.h
mesh_op_SOURCES = mesh_op.c um_mesh.c um_mesh.h
mesh_translate_SOURCES = mesh_translate.c um_mesh.c um_mesh.h
mesh_check_SOURCES = mesh_check.c um_mesh.c um_mesh.h
mesh2netcdf_SOURCES = mesh2netcdf.c um_mesh.c um_mesh.h
grid4corners_SOURCES = grid4corners.c 
mesh2hdf5_SOURCES = mesh2hdf5.c um_hdf5.c um_hdf5.h um_config.c um_config.h um_mesh.c um_mesh.h
mesh2csv = mesh2csv.c um_config.c um_config.h um_mesh.c um_mesh.h


all: $(bin_PROGRAMS)


############################################
# Executables
############################################

ucvm2mesh: ucvm2mesh.o um_config.o um_utils.o \
		um_mesh.o um_stat.o
	$(CC) -o $@ $^ $(AM_LDFLAGS)

ucvm2mesh_mpi: ucvm2mesh_mpi.o um_config.o um_mpi.o um_utils.o \
		um_mesh.o um_stat.o
	$(CC) -o $@ $^ $(AM_LDFLAGS)

ucvm2mesh_mpi_layer: ucvm2mesh_mpi_layer.o um_config.o um_mpi.o um_utils.o \
		um_mesh.o um_stat.o
	$(CC) -o $@ $^ $(AM_LDFLAGS)

mesh_strip_ijk: mesh_strip_ijk.o um_mesh.o
	$(CC) -o $@ $^ $(AM_LDFLAGS)

mesh_op: mesh_op.o um_mesh.o
	$(CC) -o $@ $^ $(AM_LDFLAGS)

mesh_translate: mesh_translate.o um_mesh.o
	$(CC) -o $@ $^ $(AM_LDFLAGS)

mesh_check: mesh_check.o um_mesh.o
	$(CC) -o $@ $^ $(AM_LDFLAGS)

mesh2netcdf: mesh2netcdf.o um_mesh.o
	$(CC) -o $@ $^ $(AM_LDFLAGS)

grid4corners: grid4corners.o
	$(CC) -o $@ $^ $(AM_LDFLAGS)

mesh2hdf5: mesh2hdf5.o um_hdf5.o um_config.o um_mesh.o
	$(CC) -o $@ $^ $(AM_LDFLAGS)

mesh2csv: mesh2csv.o um_config.o um_mesh.o
	$(CC) -o $@ $^ $(AM_LDFLAGS)



############################################
# Special build targets
############################################

clean:
	rm -f core *.o *~ $(bin_PROGRAMS)
