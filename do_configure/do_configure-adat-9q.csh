#!/bin/tcsh

if ( -f Makefile ) then 
  make clean
  make uninstall
  make distclean
endif

../configure \
  --prefix=$HOME/git-builds/adat-9q \
  --with-itpp=$HOME/git-builds/itpp \
  CC=gcc \
  CFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -march=native -fopenmp" \
  CXX=g++ \
  CXXFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -march=native -fopenmp -std=c++0x"
  #  LIBS="-lblas -llapack -lgfortran -lpthread"

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

echo "WIN" 
