#!/bin/tcsh -x

set xml = mass_overlap_xml_files.list
set create_db = mass_overlap_db_create
set merge_list = mass_overlap_sdbs.list
set merge = mass_overlap_db_combine 

set particle_db = b_proj0.sdb 

# make the little guys 
cat $xml | xargs -I qq $create_db qq

# make the big guy
set fl = `cat $merge_list | xargs`
$merge $particle_db $fl


set util = mass_overlap_db_util

# check dispersion relation
mkdir check 
pushd check 

$util ../$particle_db keysxml keys.xml 
$util ../$particle_db get keys.xml 

ls *_E > disp.list 

echo "Now run gnu_disp_plot.pl to check dispersion"


popd 
