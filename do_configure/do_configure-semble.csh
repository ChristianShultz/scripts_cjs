#!/bin/tcsh

  if ( -f Makefile ) then 
    make clean
    make uninstall
    make distclean
  endif

../configure \
  --prefix=$HOME/git-builds/semble \
    CFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -march=nocona -fopenmp -g" \
    CXX="g++" \
    CXXFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -march=nocona -fopenmp -g" \
    LIBS="-lblas -llapack -lgfortran -lpthread" \
    --with-adat=$HOME/git-builds/adat \
    --with-itpp=$HOME/git-builds/itpp


if ( $status != 0 ) then 
    echo "config error"
    exit 1
endif

make install -j10 

if ( $status != 0 ) then 
    echo "build error" 
    exit 1
endif 


make clean 

echo "YOU WIN" 
