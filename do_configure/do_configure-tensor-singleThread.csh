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

set atlasHome = /dist/scidac/atlas

../configure --prefix=$HOME/git-builds/tensor-singleThread \
  --with-arpack \
  F77=gfortran \
  FFLAGS="-fopenmp -O2" \
  CXXFLAGS="-I$atlasHome/include" \
  CFLAGS="-I$atlasHome/include" \
  LDFLAGS="-L $atlasHome/lib "
  LIBS="-lptlapack -lptcblas -latlas"

make install -j10 

make clean
