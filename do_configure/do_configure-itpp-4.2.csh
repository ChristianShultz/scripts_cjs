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
