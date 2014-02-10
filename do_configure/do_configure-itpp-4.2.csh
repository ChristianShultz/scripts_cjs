#!/bin/tcsh

if ( -f Makefile ) then 
  make clean 
  make uninstall
  make distclean 
endif

../configure \
    --prefix=$HOME/git-builds/itpp \
    --enable-static \
    --disable-shared \
    --disable-html-doc \
    --without-blas \
    --without-fft \
    --with-lapack=/usr/lib64/liblapack.a \
    LDFLAGS="-L/usr/lib64" \
    LIBS="-lblas -llapack -lgfortran"

if ( $status != 0 ) then 
  echo "configure failed"
  exit 1
endif

make install -j10 

if ( $status != 0 ) then 
  echo " build failed "
  exit 1
endif 

make clean 

echo "WIN"
