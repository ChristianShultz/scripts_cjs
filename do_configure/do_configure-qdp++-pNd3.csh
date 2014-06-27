#!/bin/tcsh -x


if ( -f Makefile ) then 
  make clean
  make uninstall
  make distclean
endif 

if (0) then 
  
  echo "NOT SOURCING MPI_ENV \n" 
  set CC=/usr/mpi/gcc/mvapich2-1.8/bin/mpicc
  set CXX=/usr/mpi/gcc/mvapich2-1.8/bin/mpicxx

  ../configure \
    --prefix=$HOME/git-builds/qdp++/parscalar-Nd3 \
    --with-qmp=$HOME/git-builds/qmp/centos62 \
    --enable-Nd=3 \
    --enable-sse2 \
    --enable-parallel-arch=parscalar \
    --enable-testcase-runner=trivial \
    --enable-openmp \
    --enable-largefile \
    --enable-parallel-io \
    --enable-dml-output-buffering \
    CXXFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -march=core2 -funroll-all-loops -fpeel-loops -fopenmp" \
    CFLAGS="-O3 -fargument-noalias-global -funroll-all-loops -fpeel-loops -march=core2 -fopenmp -std=c99" \
    CXX="${CXX}" \
    CC="${CC}"

#  --enable-qmt=/dist/scidac/qmt/master/intel 
else
  
  source $HOME/.MPI_ENV.csh

  ../configure \
    --prefix=$HOME/git-builds/qdp++/parscalar-Nd3 \
    --with-qmp=$HOME/git-builds/qmp/centos62 \
    --enable-Nd=3 \
    --enable-sse2 \
    --enable-parallel-arch=parscalar \
    --enable-testcase-runner=trivial \
    --enable-openmp \
    --enable-largefile \
    --enable-parallel-io \
    --enable-dml-output-buffering \
    CXXFLAGS="$MPICXXFLAGS -fopenmp" \
    CFLAGS="$MPICFLAGS -fopenmp -std=c99" \
    CXX=$MPICXX \
    CC=$MPICC 
endif

if ($status != 0) then 
  echo "configure failed" 
  exit 1
endif 

make install -j10

if ($status != 0) then  
  echo "build failed"
  exit 1
endif

make clean

