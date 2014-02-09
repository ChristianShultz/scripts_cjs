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

./drive_3pt_redstar_12kmi.pl $seqno $dt $outp $xml

if ( $status != 0 ) then 
  echo "some problem running code"
  exit 1
endif

set corr = "D2A2_pion.sdb${seqno}"
set dir = "corr_d"

if ( -d $dir ) then 
  rm -r $dir
endif

mkdir $dir
pushd $dir

ln -s ../$corr

dbutil $corr keysxml keys.xml
dbutil $corr get keys.xml

popd

