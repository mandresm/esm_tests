#!/bin/bash -l
# Dummy script generated by esm-tools, to be removed later: 
set -e
module purge
module unload netcdf_c
module unload intel intelmpi
module load python/3.5.2
module load cmake/3.13.3
module load autoconf/2.69
module load nco
module load cdo
module unload intel intelmpi
module load intel/18.0.4 intelmpi/2018.5.288
module load libtool/2.4.6
module load automake/1.14.1
module unload gcc
module load gcc/4.8.2

export LC_ALL=en_US.UTF-8
export FC=mpiifort
export F77=mpiifort
export MPIFC=mpiifort
export CC=mpiicc
export CXX=mpiicpc
export MPIROOT="$(mpiifort -show | perl -lne 'm{ -I(.*?)/include } and print $1')"
export MPI_LIB="$(mpiifort -show |sed -e 's/^[^ ]*//' -e 's/-[I][^ ]*//g')"
export HDF5ROOT=/sw/rhel6-x64/hdf5/hdf5-1.8.14-parallel-impi-intel14/
export HDF5_C_INCLUDE_DIRECTORIES=$HDF5ROOT/include
export HDF5_ROOT=$HDF5ROOT
export NETCDFFROOT=/sw/rhel6-x64/netcdf/netcdf_fortran-4.4.2-parallel-impi-intel14/
export NETCDFROOT=/sw/rhel6-x64/netcdf/netcdf_c-4.3.2-parallel-impi-intel14/
export NETCDF_Fortran_INCLUDE_DIRECTORIES=$NETCDFFROOT/include
export NETCDF_C_INCLUDE_DIRECTORIES=$NETCDFROOT/include
export NETCDF_CXX_INCLUDE_DIRECTORIES=/sw/rhel6-x64/netcdf/netcdf_cxx-4.2.1-gcc48/include
export LAPACK_LIB='-mkl=sequential'
export LAPACK_LIB_DEFAULT='-L/sw/rhel6-x64/intel/intel-18.0.1/mkl/lib/intel64 -lmkl_intel_lp64 -lmkl_core -lmkl_sequential'
export PERL5LIB=/usr/lib64/perl5
export SZIPROOT=/sw/rhel6-x64/sys/libaec-0.3.2-gcc48
export ZLIBROOT=/usr
export OASIS3MCT_FC_LIB="-L$NETCDFFROOT/lib -lnetcdff"
export LD_LIBRARY_PATH=$NETCDFROOT/lib:$NETCDFFROOT/lib:$HDF5ROOT/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/sw/rhel6-x64/gcc/gcc-4.8.2/lib64:$LD_LIBRARY_PATH
export I_MPI_FABRICS=shm:dapl
export I_MPI_FALLBACK=disable
export I_MPI_SLURM_EXT=1
export I_MPI_LARGE_SCALE_THRESHOLD=8192
export I_MPI_DYNAMIC_CONNECTION=1
export DAPL_NETWORK_NODES=$SLURM_NNODES
export DAPL_NETWORK_PPN=$SLURM_NTASKS_PER_NODE
export DAPL_WR_MAX=500
export OMPI_MCA_pml=cm
export OMPI_MCA_mtl=mxm
export OMPI_MCA_coll=^ghc
export OMPI_MCA_mtl_mxm_np=0
export MXM_RDMA_PORTS=mlx5_0:1
export MXM_LOG_LEVEL=FATAL
export taken2from=fesom2_compile
export ENVIRONMENT_SET_BY_ESMTOOLS=TRUE


cd fesom-2.1
mkdir -p build; cd build; cmake -DFESOM_COUPLED=ON -DRECOM_COUPLED=ON ..; make install -j `nproc --all`
cd ..
