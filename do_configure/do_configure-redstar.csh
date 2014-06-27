#!/bin/tcsh -x 


if ( -f Makefile ) then
  make clean
  make uninstall
  make distclean
endif

set CC=gcc
set CXX=g++
../configure --prefix=${HOME}/git-builds/redstar \
  CFLAGS="-O3 -fopenmp -DUSE_OMP"  \
    CXXFLAGS="-O3 -fopenmp -DUSE_OMP" \
      --with-adat=${HOME}/git-builds/adat \
      --with-itpp=${HOME}/git-builds/itpp \
      --with-hadron=${HOME}/git-builds/hadron


if ( $status != 0) then
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
