#!/bin/tcsh 

if ( -f Makefile ) then 
  make clean
  make uninstall
  make distclean
endif 


set CC=gcc 
set CXX=g++


../configure --prefix=$HOME/git-builds/colorvec-singleThread \
  --with-adat=$HOME/git-builds/adat \
  --with-hadron=$HOME/git-builds/hadron-singleThread \
  CFLAGS=" -O3 -fopenmp -DUSE_OMP" \
  CXXFLAGS=" -O3 -fopenmp -DUSE_OMP"

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

echo "YOU WIN!"
