#!/usr/bin/perl -w

use strict;

# blow up if you do something stupid
die ("usage: $0 <disp.list> <L_s> <mass=optional> <outfile=optional>") unless $#ARGV >= 1;

# pars
my $file = $ARGV[0]; 
my $L_s = $ARGV[1]; 
my $mass = undef; 
my $outgraph = "plot.eps";

# check read mass
if ( $#ARGV >= 2) 
{
  $mass = $ARGV[2]; 
}

# check read outfile
if ( $#ARGV == 3 ) 
{
  $outgraph = $ARGV[3];
}

##
# LOAD DATA 
##

# read data
open IN , "<" , $file;
my @lines = <IN>;
close IN;


# make a hash, key is int mom squared
# val is array of hashes 
my %mom_hash = ();

foreach my $line (@lines)
{
  # split into key val pair 
  my ($pp,$EE) = split /\s+/ , $line;

  # calc value
  my $calced = `calcbc ' $EE * $EE ' | awk \'{print \$2 " " \$3 }\' `;

  # kill newline 
  chomp $calced; 

  # get op name 
  my ($I2,$iz,$irrep,$row,$mom,$op,$suffic) = split /,/ , $EE; 

  # make a key 
  my $rep_op_k = $irrep . " " . $op; 

  # hash, key is fname , val is calc 
  my %datum = (); 
  $datum{$rep_op_k} = $calced; 

  # update mom_hash
  push @{$mom_hash{$pp}} , \%datum if exists $mom_hash{$pp}; 
  $mom_hash{$pp} = [\%datum] unless exists $mom_hash{$pp};

}

##
# DATA LOADED, MAKE GNUPLOT INPUTS 
##

my @mom_keys = sort{$a <=> $b} keys %mom_hash;

mkdir "tmp" unless (-e "tmp");
my $dat = "dispn_gnu.dat";
my $plot = "dispn_gnu.gp";

open OUT , ">" , $dat;
foreach my $p (@mom_keys)
{
  # pull down array of hashes 
  my @vals = @{$mom_hash{$p}};

  # this loops loops over all the irreps in a mom group (D2A1, D2B1, D2B2 etc)
  foreach my $val (@vals)
  {
    # this is a 1 elem array
    my @k = keys %{ $val }; 

    # pull down the variable calced above 
    foreach my $kk ( @k )
    {
      print OUT $p . " " . $val->{$kk} . " " . $kk . "\n";
    }
  }
}

close OUT;


##
# MAKE GNUPLOT SCRIPT
##


# basically plot the data and run some simple fits 
open PLOT , ">" , $plot;
print PLOT "set xrange[-0.1:4.1] \n";
print PLOT "t = 6.2831853 \n";
print PLOT "l = $L_s \n";
print PLOT "f = (t/l)*(t/l) \n";

print PLOT "m = $mass\n" unless ! $mass; 
print PLOT "g(x) = m*m + (f/(a*a))*x\n"; 

print PLOT "fit g(x) \'$dat\' using 1:2 via m,a \n" unless $mass;
print PLOT "fit g(x) \'$dat\' using 1:2 via a \n" unless ! $mass;


print PLOT "plot \'$dat\' using 1:2:3 w yerr ti 'E^2(p^2)' lt 1, \\\n";
print PLOT "g(x) ti sprintf(\"g=m^2 + x*(2pi/Ls/xi)^2, m=%.4f, xi=%.4f\", m, a)  \n";

print PLOT "set xr [GPVAL_DATA_X_MIN-0.1:GPVAL_DATA_X_MAX+0.1]\n";
print PLOT "set yr [GPVAL_DATA_Y_MIN-0.01:GPVAL_DATA_Y_MAX+0.01]\n";
print PLOT "replot \n";

print PLOT "set term x11 1\n";
print PLOT "plot \'$dat\' using 1:(sqrt(\$2)):3 w yerr ti 'E(p^2)' lt 5, \\\n";
print PLOT "sqrt( g(x) ) ti sprintf(\"g=root(m^2 + x*(2pi/Ls/xi)^2), m=%.4f, xi=%.4f\", m, a)  \n";
print PLOT "set xr [GPVAL_DATA_X_MIN-0.1:GPVAL_DATA_X_MAX+0.1]\n";
print PLOT "set yr [GPVAL_DATA_Y_MIN-0.01:GPVAL_DATA_Y_MAX+0.01]\n";
print PLOT "replot \n";


print PLOT "set terminal postscript eps color \n";
print PLOT "set out \'$outgraph\' \n";
print PLOT "replot \n";
print PLOT "set term pop \n";
close PLOT;

system("gnuplot -persist $plot");
