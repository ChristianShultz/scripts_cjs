#!/bin/tcsh 

set stem="szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265_per"
set file="norms.${stem}.list"
set out = "norms.${stem}.sdb"

if (-f $file) then
  /bin/rm $file

  if ($status != 0) then 
    echo "error removing $file, do it by hand then rerun script"
    exit 1
  endif
endif

if (-f $out) then
  /bin/rm $out

  if ($status != 0) then 
    echo "error removing $out, do it by hand then rerun script"
    exit 1
  endif
endif


touch $file


foreach chan ( pion rho a b )
  foreach proj ( `seq 0 1 11` )
    set db = $chan/proj$proj/radmat/${chan}_proj$proj.sdb 


    if(! -d $chan/proj$proj ) then 
      continue 
    endif 

    if (! -f $db) then 
      echo " $db does not exist"
      continue 
    endif

    echo $db >> $file
  end
end


#RB 
#set exe = $HOME/git-builds/formfactor/bin/mass_overlap_db_combine
set exe = $HOME/arch/formfactor/bin/mass_overlap_db_combine

if ( ! -e $exe ) then 
  echo "executable $exe does not exist"
  exit 1
endif


set dbs = `cat $file | xargs`

$exe $out $dbs


if ( $status != 0 ) then 
  echo "db combine failed"
  exit 1
endif

exit 0 
