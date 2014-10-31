#!/bin/tcsh 


set stem="szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265_per"
set out="weights.${stem}.xml"
set list="weights.${stem}.list"


if (-f $out) then
  /bin/rm $out
endif

if (-f $list) then 
  /bin/rm $list 
endif 


touch $out

set header='<?xml version="1.0"?>\
<ProjectedOps>'

set footer='</ProjectedOps>'

echo $header:q >> $out  

foreach chan ( pion rho a b )
  foreach proj ( `seq 0 1 11` )
    set xml = $chan/proj$proj/weights.${chan}_proj$proj.xml


    if (! -f $xml) then 
      continue 
    endif

    print_nodeset $xml /ProjectedOps | head -n -2 | tail -n +5 >> $out

    set bob = $chan/proj$proj/weights.${chan}_proj$proj.plot.list 
    cat $bob >> $list 

  end 
end

echo $footer:q >> $out  

