#!/bin/tcsh -x


if ( -f Makefile ) then 
  make clean
  make uninstall
  make distclean
endif 

if (1) then 
  
  echo "NOT USING MPI \n" 

  ../configure \
    --prefix=$HOME/git-builds/chroma/scalar-Nd4 \
    --with-qdp=$HOME/git-builds/qdp++/scalar-Nd4 \
    --with-qmp=$HOME/git-builds/qmp/vanilla \
    --enable-lapack=lapack \
    --enable-Nd=4 \
    --enable-sse2 \
    --enable-parallel-arch=parscalar \
    --enable-testcase-runner=trivial \
    --enable-largefile \
    --enable-parallel-io \
    --enable-dml-output-buffering 

#  --enable-qmt=/dist/scidac/qmt/master/intel 
else
  
  source $HOME/.MPI_ENV.csh

  ../configure \
    --prefix=$HOME/git-builds/qdp++/scalar-Nd3 \
    --with-qmp=$HOME/git-builds/qmp/centos62 \
    --enable-Nd=3 \
    --enable-sse2 \
    --enable-parallel-arch=parscalar \
    --enable-testcase-runner=trivial \
    --enable-openmp \
    --enable-largefile \
    --enable-parallel-io \
    --enable-dml-output-buffering \
    CXXFLAGS="$MPICXXFLAGS -fopenmp" \
    CFLAGS="$MPICFLAGS -fopenmp -std=c99" \
    CXX=$MPICXX \
    CC=$MPICC 
endif

if ($status != 0) then 
  echo "configure failed" 
  exit 1
endif 

make install -j10

if ($status != 0) then  
  echo "build failed"
  exit 1
endif

make clean

