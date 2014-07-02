#!/bin/tcsh -x


if (-f Makefile) then
  make clean
  make uninstall
  make distclean
endif


source $HOME/scripts_cjs/do_configure/MPI_ENV.csh

../configure \
  --prefix=$HOME/git-builds/chroma/parscalar-Nd4 \
  --with-qdp=$HOME/git-builds/qdpxx/parscalar-Nd4 \
    #  --enable-sse-wilson-dslash \
  --enable-sse2 \
  --enable-testcase-runner=trivial \
  --host=x86_64-linux-gnu \
  --build=none  \
  CXXFLAGS="$MPICXXFLAGS -fpermissive -fopenmp" \
  CFLAGS="$MPICFLAGS -fopenmp" \
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




