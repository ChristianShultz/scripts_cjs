#!/bin/tcsh

if ( -f Makefile ) then 
  make clean
  make uninstall
  make distclean
endif 

source $HOME/scripts_cjs/do_configure/MPI_ENV.csh

../configure \
  --prefix=$HOME/git-builds/qmp/centos62 \
  --with-qmp-comms-type=MPI \
  --with-qmp-comms-ldflags="" \
  --with-qmp-comms-libs="" \
  --with-qmp-comms-cflags="" \
  --host=x86_64-linux-gnu --build=none \
  CC=$MPICC \
  CFLAGS=" $MPICFLAGS " 


make install -j10  

if ( $status != 0 ) then 
  echo " build failed "
  exit 1
endif

make clean

echo "YOU WIN!"
