#!/bin/tcsh -x


if ( -f Makefile ) then 
  make clean
  make uninstall
  make distclean
endif 

  
source $HOME/scripts_cjs/do_configure/MPI_ENV.csh

../configure \
  --prefix=$HOME/git-builds/qdpxx/parscalar-Nd3 \
  --with-qmp=$HOME/git-builds/qmp/centos62 \
  --enable-Nd=3 \
  --enable-sse2 \
  --enable-parallel-arch=parscalar \
  --enable-testcase-runner=trivial \
  --enable-openmp \
  --enable-largefile \
  --enable-parallel-io \
  --enable-dml-output-buffering \
  CXXFLAGS="$MPICXXFLAGS -std=c++0x -fopenmp" \
  CFLAGS="$MPICFLAGS -fopenmp -std=c99" \
  CXX=$MPICXX \
  CC=$MPICC 

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

