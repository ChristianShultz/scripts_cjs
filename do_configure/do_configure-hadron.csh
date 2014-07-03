#!/bin/tcsh 

set CC=gcc 
set CXX=g++


../configure --prefix=$HOME/git-builds/hadron \
  -with-tensor=$HOME/git-builds/tensor \
  CFLAGS="-I /dist/scidac/atlas/include -DTENSOR_USE_ATLAS  -O3 -fopenmp" \
  CXXFLAGS="-I /dist/scidac/atlas/include -DTENSOR_USE_ATLAS -O3 -fopenmp" \
  LDFLAGS="-L /usr/lib64/atlas" LIBS="/usr/lib64/atlas/liblapack.so.3 /usr/lib64/atlas/libcblas.so.3 /usr/lib64/atlas/libatlas.so.3"

  make install -j10 


  make clean

  echo "you WIN" 
