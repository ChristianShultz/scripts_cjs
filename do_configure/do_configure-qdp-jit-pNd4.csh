#!/bin/tcsh -x

make clean
make uninstall
make distclean 

source $HOME/.MPI_ENV.csh
source $HOME/.CUDA_ENV.csh


if ( -f Makefile ) then 
  make clean
  make uninstall
  make distclean
endif 


../configure   \
  --prefix=$HOME/git-builds/qdp-jit/gpu-parscalar-Nd4 \
  --with-qmp=$HOME/git-builds/qmp/centos62 \
  --enable-parallel-arch=parscalar \
  --enable-filedb \
  --enable-Nd=4 \
  --enable-precision=single \
  --enable-largefile \
  --enable-parallel-io \
  --enable-dml-output-buffering \
  --disable-generics \
  --with-cuda=$CUDAHOME \
  CXXFLAGS=" -fopenmp -O3 -finline-limit=50000 -march=core2 -fargument-noalias-global -std=c++0x -D_GNU_SOURCE" \
  CFLAGS="-fopenmp -O3 -march=core2 -fargument-noalias-global -std=c99 -D_GNU_SOURCE" \
  CC=$MPIHOME/bin/mpicc \
  CXX=$MPIHOME/bin/mpicxx \
  --enable-openmpE \
  --host=x86_64-linux-gnu --build=none 


if ( $status != 0 ) then 
  echo "config failed"
  exit 1
endif

make install -j10

if ( $status != 0 ) then 
  echo "build failed"
  exit 1
endif

make clean

echo "YOU WIN!"
