#!/bin/tcsh

source $HOME/.JITPTX_ENV.csh

if ( -f Makefile ) then
  make clean
  make uinstall
  make distclean 
endif

../configure   \
  --prefix=$HOME/git-builds/qdp-jit/gpu-parscalar-Nd3 \
  --with-qmp=$HOME/git-builds/qmp/centos62 \
  --enable-parallel-arch=parscalar \
  --enable-filedb \
  --enable-Nd=3 \
  --enable-precision=single \
  --enable-largefile \
  --enable-parallel-io \
  --enable-dml-output-buffering \
  --disable-generics \
  --with-cuda=$CUDAHOME \
  CXXFLAGS=" $JITPTX_CXXFLAGS" \
  CFLAGS=" $JITPTX_CFLAGS" \
  CC=$JITPTX_CC \
  CXX=$JITPTX_CXX \
  --host=x86_64-linux-gnu --build=none 


if ( $status != 0 ) then 
  echo "config error" 
  exit(1)
endif

make install -j10

if ( $status != 0 ) then 
  echo "build error"
  exit(1) 
endif

make clean

echo "YOU WIN!"
