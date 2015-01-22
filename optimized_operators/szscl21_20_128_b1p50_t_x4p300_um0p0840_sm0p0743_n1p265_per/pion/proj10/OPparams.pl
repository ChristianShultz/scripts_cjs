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
require "${basedir}/OPparams.work.multiparticle.pl";


my $spin = 0;
my $parity = "m";
my $twoI_z = 2; 
my $reconpath = "/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265_per/redstar/rho/rho_ff/ws_larger";
my $pid = "pion_proj10";
my $ncfg = 603; 
my $ensemble = "szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265";
my $outfile = "proj_op_${pid}.pl";

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






