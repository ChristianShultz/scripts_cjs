#!/bin/tcsh 

if ( -f Makefile ) then 
  make clean
  make uninstall
  make distclean
endif 


set CC=gcc 
set CXX=g++


../configure --prefix=$HOME/git-builds/colorvec \
  -with-adat=$HOME/git-builds/adat \
  -with-itpp=$HOME/git-builds/itpp \
  -with-hadron=$HOME/git-builds/hadron \
  CFLAGS=" -O3 -fopenmp" \
  CXXFLAGS=" -O3 -fopenmp"

if ( $status != 0 ) then 
  echo "configure failed"
  exit 1
endif

make install -j10 

if ( $status != 0 ) then 
  echo "build failed" 
  exit 1
endif 

make clean
