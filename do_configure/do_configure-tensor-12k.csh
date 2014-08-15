#!/bin/tcsh 

set CC=gcc 
set CXX=g++

if (-f Makefile) then 
  make clean
  make uninstall
  make distclean
endif 

if ( ! -f ../configure ) then 
  pushd ..
  ./autogen.sh
  popd
endif 

set atlasHome = /home/chen/QCDDev/RunHost/ATLAS_GCC

../configure --prefix=$HOME/git-builds/tensor-12k \
  --enable-threadsafe-deathtest \
  --with-backend=atlas \
  F77=gfortran \
  FFLAGS="-fopenmp -O2" \
  CXXFLAGS="-O3 -g -I$atlasHome/include/atlas -I$atlasHome/include -fopenmp" \
  LDFLAGS="-L $atlasHome/lib -llapack -lptcblas -latlas -lpthread"

make install -j10 

make clean
