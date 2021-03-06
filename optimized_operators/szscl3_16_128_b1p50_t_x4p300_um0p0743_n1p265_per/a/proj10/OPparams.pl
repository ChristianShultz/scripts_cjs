#!/usr/bin/perl
#
# this gem writes out some skeleton perl
# code for projected operator creation and
# then might make some plots if it works
#



use strict;
use OPparams;
use File::Basename;
my $basedir = dirname($0); 
require "${basedir}/OPparams.work.pl";


my $spin = 3;
my $parity = "p";
my $twoI_z = 2; 
my $reconpath = "/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/";
my $pid = "a_proj10";
my $ncfg = 535; 
my $ensemble = "szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per";
my $outfile = "run_proj_ops_${pid}_${ensemble}.pl";
my %momhash = %{ &rep_list($spin,$parity) }; 

#
# write some perl code into outfile
#


unlink $outfile unless ! -f $outfile;  

open OUT , ">" , $outfile ; 

&print_header_perl();
&print_ops($pid,$twoI_z,$ncfg,$ensemble,$reconpath,$spin,\%momhash);
&print_trailer_perl($pid);

close OUT; 


chmod 0755 , $outfile;






