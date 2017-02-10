#!/usr/bin/env bash

# ROMS Building configuration file
if [[ -z "${ROMS_SRC}" ]]; then
  export ROMS_SRC=/group/pawsey0001/pryan/roms
fi
export MY_CPP_FLAGS=
export GIT_BRANCH=
export ROMS_APPLICATION=cwa
export USE_OpenMP=
export USE_MPI=on
export USE_MPIF90=on
export USE_LARGE=on
export USE_DEBUG=
export USE_NETCDF4=on
export ARPACK_LIBDIR=/group/pawsey0001/pryan/roms/Lib/ARPACK
export PARPACK_LIBDIR=/group/pawsey0001/pryan/roms/Lib/ARPACK
export SCRATCH_DIR=${ROMS_CONFIGDIR}/build
export BINDIR=${ROMS_CONFIGDIR}
export MY_HEADER_DIR=${ROMS_CONFIGDIR}
export MY_ANALYTICAL_DIR=${ROMS_CONFIGDIR}/include
export USE_ARPACK=on
export UPDATE_VARINFO=on
export USE_DAP=

# ROMS Definitions
# Set the compiler options
FC=ifort

if [[ ${FC} == "ifort" ]]; then
  export FORT=ftn
#  export NETCDF_INCDIR=/opt/cray/netcdf/4.3.0/INTEL/130/include
#  export NETCDF_LIBDIR=/opt/cray/netcdf/4.3.0/INTEL/130/lib
#  export HDF5_LIBDIR=//opt/cray/hdf5/1.8.11/INTEL/130/lib
#  export HDF5_INCDIR=/opt/cray/hdf5/1.8.11/INTEL/130/include
  export NETCDF_INCDIR=/opt/cray/netcdf/4.3.3.1/INTEL/140/include
  export NETCDF_LIBDIR=/opt/cray/netcdf/4.3.3.1/INTEL/140/lib
  export HDF5_LIBDIR=//opt/cray/hdf5/1.8.14/INTEL/140/lib
  export HDF5_INCDIR=/opt/cray/hdf5/1.8.14/INTEL/140/include
fi

if [[ ${FC} == "gnu" ]]; then
  export FORT=ftn
  export NETCDF_INCDIR=/opt/cray/netcdf/4.3.0/GNU/48/include
  export NETCDF_LIBDIR=/opt/cray/netcdf/4.3.0/GNU/48/lib
  export HDF5_LIBDIR=//opt/cray/hdf5/1.8.11/GNU/48/lib
  export HDF5_INCDIR=/opt/cray/hdf5/1.8.11/GNU/48/include
fi
