#!/bin/tcsh -x 


if ( -f Makefile ) then
  make clean
  make uninstall
  make distclean
endif

set CC=gcc
set CXX=g++

../configure --prefix=${HOME}/git-builds/redstar-12k \
    CFLAGS="-O3 -fopenmp -march=core2 "  \
    CXXFLAGS="-O3 -fopenmp -march=core2 " \
    --with-adat=${HOME}/git-builds/adat \
    --with-hadron=${HOME}/git-builds/hadron-12k


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
