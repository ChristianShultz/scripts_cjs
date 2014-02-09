#!/bin/tcsh

if ( -f Makefile ) then 
  make clean
  make uninstall
  make distclean
endif

../configure \
  --prefix=$HOME/git-builds/adat \
  LIBS="-lblas -llapack -lgfortran -lpthread" \
  --with-itpp=$HOME/git-builds/itpp \
  CFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -march=opteron -fopenmp -DUSE_OMP" \
  CXXFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -march=opteron -fopenmp -DUSE_OMP -std=c++0x"

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
