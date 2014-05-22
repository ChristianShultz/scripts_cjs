#!/bin/tcsh 

# find the proj ops run the radmat database bit of it  

# bad list 
set pth = `pwd`
set badlist = $pth/$0.badlist

# check remove badlist 
if( -f $badlist ) then 
  rm $badlist 
endif

# loop over channels 
foreach chan ( pion rho a b ) 
# loop over projection index 
  foreach proj ( `seq 0 1 11` )
    set dir = $chan/proj$proj/radmat
  
    # skip missing sequences 
    if(! -d $dir ) then 
      continue 
    endif 
  
    # move in 
    pushd $dir
  
    # code to run 
    set f = mlap.csh 
  
    # run or bounce it to badlist 
    if (-f $f) then 
      ./$f 
    else
      echo "missing $f in $dir " >> $badlist 
    endif
  
    # move out 
    popd 
  
  end
end


exit 0 
