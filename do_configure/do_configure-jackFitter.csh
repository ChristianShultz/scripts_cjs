#!/bin/tcsh
  
if ( -f Makefile ) then 
  make clean
  make uninstall
  make distclean
endif


../configure \
  --prefix=$HOME/git-builds/jackFitter \
    # --bindir=$HOME/bin \
  CFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -march=nocona -fopenmp -DUSE_OMP" \
  CXX="g++" \
  CXXFLAGS="-O3 -g -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -march=nocona -fopenmp -DUSE_OMP"  \
  LIBS="-lblas -llapack -lgfortran -lpthread" \
  --with-adat=$HOME/git-builds/adat  \
  --with-itpp=$HOME/git-builds/itpp

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
