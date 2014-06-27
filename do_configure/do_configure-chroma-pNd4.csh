#!/bin/tcsh -x


if (-f Makefile) then
  make clean
  make uninstall
  make distclean
endif


source $HOME/.MPI_ENV.csh

../configure \
  --prefix=$HOME/git-builds/chroma/parscalar-Nd4 \
  --with-qdp=$HOME/git-builds/qdp++/parscalar-Nd4 \
  --host=x86_64-linux-gnu \
  --build=none  \
  CXXFLAGS="$MPICXXFLAGS -fpermissive" \
  CFLAGS="$MPICFLAGS " \
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




