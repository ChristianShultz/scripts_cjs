if (! $?MY_MPI_ENV_SET) then
  
  # only do this once so we dont make the paths super long
  setenv MY_MPI_ENV_SET foobizzle

  # where does mpi live
  setenv MPIHOME /usr/mpi/gcc/mvapich2-1.8
  
  #blank variable ?
  if( !  $?PATH  ) then
    echo "PATH was empty"
    setenv PATH ""
  endif

  #gcc & mpi
  setenv PATH ${MPIHOME}/bin:${PATH}
  setenv PATH /dist/gcc-4.6.3/bin:$PATH

  #blank variable ?
  if( !  $?LD_LIBRARY_PATH  ) then
    echo "LD_LIBRARY_PATH was empty"
    setenv LD_LIBRARY_PATH ""
  endif

  #gcc & mpi
  setenv LD_LIBRARY_PATH ${MPIHOME}/lib:${MPIHOME}/lib64:/usr/lib64:/usr/lib:${LD_LIBRARY_PATH}
  setenv LD_LIBRARY_PATH /dist/gcc-4.6.3/lib64:/dist/gcc-4.6.3/lib:$LD_LIBRARY_PATH
  
  setenv MPICXX $MPIHOME/bin/mpicxx
  setenv MPICC $MPIHOME/bin/mpicc
  
  ### COMPILER FLAGS
  # setenv MPICXXFLAGS "-O3 -finline-limit=50000 -march=core2  -fargument-noalias-global -std=c++0x"
  # setenv MPICFLAGS "-O3 -march=core2 -fargument-noalias-global -std=c99"

  setenv MPICXXFLAGS "-O3 -finline-limit=50000 -march=core2  -fargument-noalias-global"
  setenv MPICFLAGS "-O3 -march=core2 -fargument-noalias-global -std=c99" 

  # this needs to match the MPI numa junk 
   setenv OMP_NUM_THREADS 8 

   setenv MAKE "make -j 10"

   echo MPI is `which mpicc`
   echo GCC is `mpicc --version`

endif 
