#!/bin/tcsh

if ( -f Makefile ) then 
  make clean
  make uninstall
  make distclean
endif 

../configure \
  --prefix=$HOME/git-builds/radmat \
  CFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -march=nocona -fopenmp" \
  CXX="g++" \
  CXXFLAGS="-O3 -g -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -march=nocona -fopenmp" \
  LIBS="-lblas -llapack -lgfortran -lpthread" \
  --with-adat=$HOME/git-builds/adat \
  --with-itpp=$HOME/git-builds/itpp \
  --with-semble=$HOME/git-builds/semble \
  --with-jackFitter=$HOME/git-builds/jackFitter

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

echo "WIN!"

