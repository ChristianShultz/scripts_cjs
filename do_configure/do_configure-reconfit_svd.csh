#/bin/tcsh -x

if ( -f Makefile ) then 
  make clean
  make uninstall
  make distclean
endif

../configure \
  --prefix=$HOME/git-builds/reconfit_svd \
  CFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -march=nocona -fopenmp" \
  CXX="g++" \
  CXXFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -march=nocona -fopenmp" \
  LIBS="-lblas -llapack -lgfortran -lpthread" \
  --with-adat=$HOME/git-builds/adat \
    #  --with-adat=$HOME/git-builds/adat-master \
  --with-semble=$HOME/git-builds/semble \
  --with-jackFitter=$HOME/git-builds/jackFitter \
  --with-itpp=$HOME/git-builds/itpp

if ( $status != 0 ) then 
  echo "config failed"
  exit 1
endif

make install -j10 

if ( $status != 0 ) then 
  echo "build failed"
  exit 1
endif

make clean

echo "YOU WIN!"

