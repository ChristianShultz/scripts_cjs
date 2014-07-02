#!/bin/tcsh 

set CC=gcc 
set CXX=g++

if (-f Makefile) then 
  make clean
  make uninstall
  make distclean
endif 

if ( ! -f ../configure ) then 
  pushd ..
  ./autogen.sh
  popd
endif 

../configure --prefix=$HOME/git-builds/tensor \
  --with-arpack \
  F77="gfortran" \
  --disable-mps \
  CFLAGS="-I /dist/scidac/atlas/include -DTENSOR_USE_ATLAS" \
  CXXFLAGS="-I /dist/scidac/atlas/include -DTENSOR_USE_ATLAS" \
  LDFLAGS="-L /dist/scidac/atlas/lib -lptlapack -lptcblas -latlas -lptlapack -lptcblas"
    #  LDFLAGS="-L /usr/lib64/atlas" LIBS="/usr/lib64/atlas/liblapack.so.3 /usr/lib64/atlas/libcblas.so.3 /usr/lib64/atlas/libatlas.so.3"

##  LDFLAGS="-shared -L /usr/lib64/atlas" LIBS="-llapack -lcblas -latlas"

make install -j10 

make clean

#CPRO_PATH="/opt/intel/composer_xe_2011_sp1.11.339"
#  CXXFLAGS="-shared -I $CPRO_PATH/include" \
#  CFLAGS="-shared -I $CPRO_PATH/include" \
#  LDFLAGS="-L $CPRO_PATH/mkl/lib/intel64 -L $CPRO_PATH/compiler/lib/intel64" \
#  LIBS="-lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread -lm"

#  CXXFLAGS="-I /opt/intel/composer_xe_2011_sp1.11.339/mkl/include" \
#  LDFLAGS="-L /opt/intel/composer_xe_2011_sp1.11.339/mkl"

#  LIBS="-llapack -lcblas -latlas"

# this line appears to work    LDFLAGS="-L /usr/lib64/atlas"  LIBS="-llapack -lcblas -latlas"


#  CXXFLAGS="-shared" CFLAGS="-shared" \
#  LIBS="/usr/lib64/atlas/libatlas.so.3 /usr/lib64/atlas/libclapack.so.3 /usr/lib64/atlas/libatlas.so.3 /usr/lib64/atlas/libcblas.so.3"

#  CXXFLAGS="-I /opt/intel/include" \
#  LDFLAGS="-L /opt/intel/mkl/lib/intel64" \

#  CC="gcc" \
#  CXXFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -march=core2 -funroll-all-loops -fpeel-loops" \
#  CFLAGS="-O3 -fargument-noalias-global -funroll-all-loops -fpeel-loops -march=core2" \
#  --with-arpack \
#  LIBS="-cblas" \
#  LDFLAGS="-L /usr/lib64/atlas" 
#  LIBS="-llapack -lcblas -latlas" 

#  LIBS="-llapack -lcblas -latlas" 
#   CFLAGS="-g -O1" 
#   CXXFLAGS="-g -O1"
