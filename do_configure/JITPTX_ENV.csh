if ( ! $?MY_JITPTX_ENV_SET ) then

  setenv MY_JITPTX_ENV_SET foobizzle

  setenv MPIHOME /usr/mpi/gcc/mvapich2-1.8
  setenv CUDAHOME /usr/local/cuda-5.0

  if ( ! $?PATH ) then 
    setenv PATH ""
  endif


  if ( ! $?LD_LIBRARY_PATH ) then 
    setenv LD_LIBRARY_PATH ""
  endif

  setenv PATH ${CUDAHOME}/bin:${MPIHOME}/bin:$PATH
  setenv LD_LIBRARY_PATH ${CUDAHOME}/lib64:${CUDAHOME}/lib:${MPIHOME}/lib:${MPIHOME}/lib64:/usr/lib64:/usr/lib:$LD_LIBRARY_PATH

  setenv PATH /dist/gcc-4.6.3/bin:$PATH
  setenv LD_LIBRARY_PATH /dist/gcc-4.6.3/lib64:/dist/gcc-4.6.3/lib:$LD_LIBRARY_PATH

  setenv CUDA_SM sm_35



  ### OpenMP
  # Open MP enabled
  #OMPFLAGS="-fopenmp -D_REENTRANT "
  #OMPENABLE="--enable-openmp"

  # Open MP disabled
  setenv JITPTX_OMPFLAGS ""
  setenv JITPTX_OMPENABLE ""

  ### COMPILER FLAGS
  setenv JITPTX_CXXFLAGS " ${JITPTX_OMPFLAGS} -O3 -finline-limit=50000 -march=core2  -fargument-noalias-global -std=c++0x -D_GNU_SOURCE"
  setenv JITPTX_CFLAGS " ${JITPTX_OMPFLAGS} -O3 -march=core2 -fargument-noalias-global -std=c99 -D_GNU_SOURCE"

  ### Make
  setenv JITPTX_MAKE "make -j 10"

  ### MPI
  setenv JITPTX_CC $MPIHOME/bin/mpicc
  setenv JITPTX_CXX $MPIHOME/bin/mpicxx



   setenv MAKE "make -j 10"

   echo MPI is `which mpicc`
   echo GCC is `mpicc --version`

endif
