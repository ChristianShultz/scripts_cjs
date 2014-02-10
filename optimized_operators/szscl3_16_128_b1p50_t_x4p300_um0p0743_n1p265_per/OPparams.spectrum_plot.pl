#!/usr/bin/perl 

use strict; 
use OPparams;
use File::Basename;
use XML::Dumper; 

# list of perl xml 
my @fs = ( 
  "pion/proj0/pion_proj0.perl.xml",
  "pion/proj1/pion_proj1.perl.xml", 
  "pion/proj2/pion_proj2.perl.xml", 
  "rho/proj0/rho_proj0.perl.xml" 
); 

# move from xml to perl 
my $dump = XML::Dumper->new(); 

# ops list 
my @ops = (); 

# invert the serialization 
foreach my $f ( @fs ) 
{
 my $ref =  $dump->xml2pl( $f ); 
 push @ops , @{ $ref };
}

## what did we pull out
#print "extracted.. \n";
#
#foreach my $op ( @ops ) 
#{
#  print $op->op_name() . "\n";
#}

# sort the operators by momentum 
my @moms = ( "p000" ) ; # , "p100" , "p110" , "p111" , "p200" ); 
my %mom_hash = (); 

foreach my $p ( @moms ) 
{
  foreach my $op ( @ops ) 
  {
    if ( $op->op_name =~ $p ) 
    {
      push @{ $mom_hash{$p} }, $op  unless ! exists $mom_hash{$p} ; 
      $mom_hash{$p} = [$op] unless  exists $mom_hash{$p} ; 
    }
  }
}

# make spectral plots
foreach my $p ( keys %mom_hash ) 
{
  my @os = @{ $mom_hash{$p} };
  make_gnu_spectrum_plots( $p , @os );
}




sub make_gnu_spectrum_plots
{
  my ($f, @ops) = @_; 

  # split it up by particle name, eg rho , pion , etc
  my %particles = (); 
  foreach my $op ( @ops ) 
  {
    my $pid = $op->op_name(); 
    my ( $name , @trash ) = split /_/ , $pid ; 

    print $pid . " " . $name . "\n"; 
    
    push @{ $particles{$name} } , $op unless ! exists $particles{$name}; 
    $particles{$name} = [$op] unless exists $particles{$name};
  }


  my $dir = "tmp";
  mkdir $dir;
  my $dat = $dir . "/" . $f . ".dat"; 

  open OUT , ">" , $dat ;

  my $xpos = 0; 
  my $color = 1; 
  my $xtics = "set xtics (";
  foreach my $key ( sort { sort_function($a) <=> sort_function($b) } keys %particles ) 
  {
    $xpos++; 
    $xtics .= "\"$key\" $xpos ,";  
    foreach my $operator ( @{ $particles{$key} } )
    {
      my $string = $xpos . " " .  $operator->mass() . " 0.1 " . $key . " " . 0.2*rand(1) . " " . $xpos;  
      print OUT $string . "\n";
    }
  }
  chop $xtics; 
  $xtics .= ")\n";

  close OUT; 

  my $gp =  $dir . "/" . $f . ".gp"; 
  open GNU , ">" , $gp ; 

  print GNU "set terminal x11 enhanced \n";
  print GNU "unset key \n";
  print GNU "set style fill solid .5 border -1\n";
  print GNU "set title \"Spectrum($f)\" \n";
  print GNU "set ylabel \"a_{t} m_{h}\"\n";
  print GNU "set xlabel \"hadron\"\n";
  print GNU $xtics; 
  print GNU "plot \"$dat\" u (\$1+\$6):2:4:3:7 w boxxyerrorbars lc variable \n";

  close GNU ; 

  system ( "gnuplot -persist $gp" ); 

}


sub sort_function
{
  my $f = shift; 
  my %hash = ();  
  
  $hash{"pion"} = 1; 
  $hash{"rho"} = 2; 

  my $idx = 10; 
  $idx = $hash{$f} if exists $hash{$f};
  return $idx; 
}

