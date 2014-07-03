if (! $?MY_COMPILE_ENV_SET) then
  
  # only do this once so we dont make the paths super long
  setenv MY_COMPILE_ENV_SET foobizzle

  
  #blank variable ?
  if( !  $?PATH  ) then
    echo "PATH was empty"
    setenv PATH ""
  endif

  
  setenv STCXX g++
  setenv STCC gcc
  
  ### COMPILER FLAGS
  # setenv MPICXXFLAGS "-O3 -finline-limit=50000 -march=core2  -fargument-noalias-global -std=c++0x"
  # setenv MPICFLAGS "-O3 -march=core2 -fargument-noalias-global -std=c99"

  # setenv STCXXFLAGS "-std=c++0x -O3 -finline-limit=50000 -march=core2  -fargument-noalias-global -fopenmp"
  setenv STCXXFLAGS "-O3 -finline-limit=50000 -march=core2  -fargument-noalias-global -fopenmp"
  setenv STCFLAGS "-std=c99 -O3 -march=core2 -fargument-noalias-global"


   setenv MAKE "make -j 10"

   echo GCC is `$STCXX --version`

endif 
