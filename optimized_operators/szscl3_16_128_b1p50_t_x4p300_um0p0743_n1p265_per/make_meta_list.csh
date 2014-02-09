#!/bin/tcsh -x

set stem="szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"
set file="weights.${stem}.list"
set out="weights.${stem}.xml"

if (-f $file) then
  /bin/rm $file

  if ($status != 0) then 
  echo "error removing $file, do it by hand then rerun script"
  exit 1
endif

endif

touch $file

if (-f $out) then
  /bin/rm $out

  if ($status != 0) then 
  echo "error removing $out, do it by hand then rerun script"
  exit 1
endif

endif

foreach list (  pion/proj0/weights.pion_proj0.list \
                pion/proj1/weights.pion_proj1.list \
                pion/proj2/weights.pion_proj2.list \
                rho/proj0/weights.rho_proj0.list \
    )

    if (! -f $list) then 
    echo "error: $list does not exist"
    exit 1
  endif

  cat $list >> $file
end

set pl=convert_proj_list_to_irrep_op_xml.pl

if (! -f $pl) then 
echo "missing $pl"
exit 1
endif

cat $file | ./$pl > $out

if ( $status != 0 ) then 
  echo "$pl failed"
  exit 1
endif

exit 0 
