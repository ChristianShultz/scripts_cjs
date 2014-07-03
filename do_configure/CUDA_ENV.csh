if (! $?MY_CUDA_ENV_SET) then

  setenv MY_CUDA_ENV_SET foobizzle

  setenv CUDAHOME /usr/local/cuda-5.0

  if( !  $?PATH  ) then
    echo "PATH was empty"
    setenv PATH ""
  endif

  setenv PATH ${CUDAHOME}/bin:${PATH}
  setenv PATH /dist/gcc-4.6.3/bin:$PATH

  if( !  $?LD_LIBRARY_PATH  ) then
    echo "LD_LIBRARY_PATH was empty"
    setenv LD_LIBRARY_PATH ""
  endif

  setenv LD_LIBRARY_PATH ${CUDAHOME}/lib64:${CUDAHOME}/lib:/usr/lib64:/usr/lib:$LD_LIBRARY_PATH
  setenv LD_LIBRARY_PATH /dist/gcc-4.6.3/lib64:/dist/gcc-4.6.3/lib:$LD_LIBRARY_PATH

  # Kepler GK110
  setenv CUDA_SM sm_35     

endif 
