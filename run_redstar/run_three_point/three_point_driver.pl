#!/usr/bin/perl
#
#  make sure that the i/o and result directories exist   
#

use strict; 
use ParamsDistillation; 
use QSub; 
use File::Basename;

die "usage: $0 <sub_script> <nsub> <sleepy_time> " unless $#ARGV == 2; 

# an instance of the qsub script generator class
my $script_gen = QSub->new(); 

# an instance of the Param "class" to hold lattice specific stuff
my $param = ParamsDistillation->new(); 

# configuration stuff
my $lattice = "szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per";
$param->stem($lattice);

# figure out what the matrix elem data is based on the directory structure
# /somepath/lattice/mat_elem/corrs/dt or however it gets rolled 
my $whereami = `pwd`; 
chomp $whereami;
my ($trash,$mat) = split  /$lattice/ , $whereami  ;
$mat = substr $mat , 1 ; 
print "mat = $mat\n";

#
# set up the work path 
my $dest_corr = $param->work_dir() . "/" . $param->stem(); 
$dest_corr .= "/meson_3pt_redstar/unsmeared_insertion/";
$dest_corr .= $mat;

#
# check that it exists
if ( ! -d $dest_corr ) 
{
  system ("mkdir -p $dest_corr") == 0 || die ("ERROR: The work dest, $dest_corr, does not exist and we cannot make it.\n$_") ; 
  # die ( "UNHOLY DEATH!" ) ; 
}
else
{
  print "dumping results to $dest_corr \n";
}



#
# output path 
my $output_dir = "/u/home/shultz/shultz_volatile/$lattice/$mat"; 

# check that it exists
if ( ! -d $output_dir ) 
{
  system ("mkdir -p $output_dir") == 0 || die ("ERROR: The work dest, $output_dir, does not exist and we cannot make it.\n$_") ; 
  # die ( "UNHOLY DEATH!" ) ; 
}
else
{
  print "dumping results to $output_dir \n";
}


my $qsub = $ARGV[0]; 
my $nsub = $ARGV[1];
my $nap = $ARGV[2]; 

my $script = $script_gen->make_script( $qsub , $output_dir ); 

system ( "chmod +x $script " ); 

&check_exe( $script , "main" ); 

for my $i (0..$nsub)
{
  system("qsub $script");
  sleep($nap); 
}



exit ( 0 ) ; 

sub check_exe
{
  my ($exe,$caller) = @_; 
  if ( ! -e $exe ) 
  {
    print " $exe does not exist! \n called by $caller \n";
    die("unholy death");
  }
}








