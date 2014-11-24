#!/bin/tcsh -x


if (-f Makefile) then
  make clean
  make uninstall
  make distclean
endif


source $HOME/.MPI_ENV.csh

../configure \
  --prefix=$HOME/git-builds/harom/parscalar-Nd3 \
  --with-qdp=$HOME/git-builds/qdpxx/parscalar-Nd3 \
  --with-hadron=$HOME/git-builds/hadron-9q \
  --host=x86_64-linux-gnu \
  --build=none  \
  CXXFLAGS="$MPICXXFLAGS -fpermissive -fopenmp -std=c++0x" \
  CFLAGS="$MPICFLAGS -std=c99" \
  CXX=$MPICXX \
  CC=$MPICC


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




