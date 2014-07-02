#!/bin/tcsh

if ( -f Makefile ) then 
  make clean
  make uninstall
  make distclean
endif 

source $HOME/scripts_cjs/do_configure/ST_ENV.csh 

../configure \
  --prefix=$HOME/git-builds/qmp/vanilla \
  --host=x86_64-linux-gnu --build=none \
  CXXFLAGS="$STCXXFLAGS" \
  CFLAGS="$STCFLAGS" \
  CXX=$STCXX \
  CC=$STCC

  #if ( $status != 0 ) then 
  #  echo " configure failed "
  #  exit 1
  #endif

make install -j10  

if ( $status != 0 ) then 
  echo " build failed "
  exit 1
endif

make clean

echo "YOU WIN!"
