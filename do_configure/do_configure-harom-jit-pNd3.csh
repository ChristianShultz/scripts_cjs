#!/bin/tcsh

source $HOME/.JITPTX_ENV.csh

if ( -f Makefile ) then 
  make clean
  make uninstall
  make distclean
endif

../configure \
  --prefix=$HOME/git-builds/harom-jitptx/parscalar-Nd3 \
  --with-qdp=$HOME/git-builds/qdp-jit/gpu-parscalar-Nd3 \
  --enable-jit \
  --host=x86_64-linux-gnu --build=none \
  CXXFLAGS=" $JITPTX_CXXFLAGS -fpermissive" \
  CFLAGS=" $JITPTX_CFLAGS -fpermissive" \
  CXX=$JITPTX_CXX \
  CC=$JITPTX_CC

if ( $status != 0 ) then 
  echo "configure failed"
  exit 1
endif

make install -j4

if ( $status != 0 ) then 
  echo "build failed"
  exit 1
endif

make clean

echo "YOU WIN!"
    #  --enable-testcase-runner=trivial \
