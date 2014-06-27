#!/bin/tcsh -x 


if ( -f Makefile ) then 
  make clean
  make uninstall
  make distclean
endif

source $HOME/.JITPTX_ENV.csh

../configure   \
  --prefix=$HOME/git-builds/chroma-jitptx/parscalar-Nd4 \
    #  --with-qdp=$HOME/git-builds/qdp-jitptx-6-4-13/gpu-parscalar-Nd4 \
  --with-qdp=$HOME/git-builds/qdp-jit/gpu-parscalar-Nd4 \
  --with-qmp=$HOME/git-builds/qmp/centos62 \
  $JITPTX_OMPENABLE \
  CXXFLAGS="" \
  CFLAGS="" \
  CC=$JITPTX_CC \
  CXX=$JITPTX_CXX \
  --host=x86_64-linux-gnu --build=none \
  --enable-jit-clover \
  --with-cuda=$CUDAHOME

if ( $status != 0 ) then 
  echo "config failed"
  exit 1
endif

make install -j8


if ( $status != 0 ) then 
  echo "build failed"
  exit 1
endif

make clean

echo "YOU WIN!"
