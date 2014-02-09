#!/bin/tcsh -x

setenv PBS_NODEFILE "nodefile.node"

if ( -f $PBS_NODEFILE ) then 
  /bin/rm $PBS_NODEFILE 
endif

echo "qcd12kmi" > $PBS_NODEFILE

source $HOME/.MPI_ENV.csh

set seqno=1000 
set dt=28 
set outp=$HOME/shultz_volatile/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per
# set outp=.

set r = unsmeared.dt28.ini.xml

radmat_util gen_xml $r two_point

set xml = npt.list.xml

# chop the first line.. must be a better way
tail -n +2 $xml > tmp.xml
mv tmp.xml $xml


foreach x (`seq 1000 20 1190`) 

  ./drive_3pt_redstar_12kmi.pl $x $dt $outp $xml

  if ( $status != 0 ) then
    echo "code failed"
    exit 1 
  endif

end



