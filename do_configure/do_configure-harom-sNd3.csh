#!/bin/tcsh -x


if (-f Makefile) then
  make clean
  make uninstall
  make distclean
endif


if (1) then 

  echo "NOT USING MPI \n" 
  source $HOME/scripts_cjs/do_configure/ST_ENV.csh 

../configure \
  --prefix=$HOME/git-builds/harom/scalar-Nd3 \
  --with-qdp=$HOME/git-builds/qdpxx/scalar-Nd3 \
  --host=x86_64-linux-gnu \
  --build=none  \
  CXXFLAGS="$STCXXFLAGS" \
  CFLAGS="$STCFLAGS" \
  CXX=$STCXX \
  CC=$STCC

else


source $HOME/.MPI_ENV.csh

../configure \
  --prefix=$HOME/git-builds/harom/scalar-Nd3 \
  --with-qdp=$HOME/git-builds/qdpxx/scalar-Nd3 \
  --host=x86_64-linux-gnu \
  --build=none  \
  CXXFLAGS="$MPICXXFLAGS -fpermissive" \
  CFLAGS="$MPICFLAGS " \
  CXX=$MPICXX \
  CC=$MPICC

endif  

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




