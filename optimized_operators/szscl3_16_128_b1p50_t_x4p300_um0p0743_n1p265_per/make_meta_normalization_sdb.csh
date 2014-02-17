#!/bin/tcsh -x

set stem="szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"
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

foreach db (  pion/proj0/radmat/pion_proj0.sdb \
              pion/proj1/radmat/pion_proj1.sdb \
              pion/proj2/radmat/pion_proj2.sdb \
              rho/proj0/radmat/rho_proj0.sdb \
              rho/proj1/radmat/rho_proj1.sdb \
              rho/proj2/radmat/rho_proj2.sdb \
    )

    if (! -f $db) then 
    echo "error: $db does not exist"
    exit 1
  endif

  echo $db >> $file
end


set exe = $HOME/git-builds/radmat/bin/mass_overlap_db_combine

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
