#!/usr/bin/perl 

use strict; 
use OPparams;
use QuarkModelAssign; 
use ExtractedStates; 
use File::Basename;
use XML::Dumper; 

die "usage: $0 <mode 0 qm, 1 pn > " unless $#ARGV == 0 ; 

our $mode = $ARGV[0];

our $hybrid_line_number = init_hybrid_params(); 

my @ops = @{ ExtractedStates::grab_all() }; 

# sort the operators by momentum 
my @moms = ( "p000" , "p100"); # , "p110" , "p111" , "p200" ); 
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

# make spectral plots for each momentum considered
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
    my $key = sort_operators( $op ) ;
    push @{ $particles{$key} } , $op unless ! exists $particles{$key}; 
    $particles{$key} = [$op] unless exists $particles{$key};
  }

  my $dat = &write_data_files( $f , \%particles ); 
  my $gp = &write_gnuplot_file( $f , $dat , "foo" ) ; 


  system ( "gnuplot -persist $gp" ); 

}

sub write_gnuplot_file
{
  my ($f, $dat , $line_styles) = @_; 

  my $dir = "tmp";
  mkdir $dir;
  my $gp =  $dir . "/" . $f . ".gp"; 
  open GNU , ">" , $gp ; 

  print GNU "set terminal x11 enhanced \n";
  print GNU xtic_function(); 
  print GNU "unset key \n";
  print GNU "unset linetype 0 \n";
  print GNU "unset linetype 1 \n";
  print GNU "unset linetype 2 \n";
  print GNU "unset linetype 3 \n";
  print GNU "unset linetype 4 \n";
  print GNU "unset linetype 5 \n";
  print GNU "unset linetype 6 \n";
  print GNU "unset linetype 7 \n";
  print GNU "unset linetype 8 \n";
  print GNU "set style fill solid .5 border -1\n";
  print GNU "set title \"Spectrum($f)\" \n";
  print GNU "set ylabel \"a_{t} m_{h}\"\n";
  print GNU "set xlabel \"channel\"\n";
  print GNU "plot \"$dat\" u (\$1+\$6):2:4:3:7 w boxxyerrorbars lc variable, \\\n";
  print GNU "\"$dat\" u (\$1 + \$6 + 0.4):2:8 with labels font \",8\"\n";
  print GNU "set xr [GPVAL_DATA_X_MIN - 0.1 : GPVAL_DATA_X_MAX + 0.1] \n";
  print GNU "set yr [0: GPVAL_DATA_Y_MAX + 0.1]\n";
  print GNU "replot \n";

  close GNU ; 

  return $gp; 
}


sub write_data_files
{
  my ($f,$href) = @_; 
  my %particles = %{ $href };

  my $dir = "tmp";
  mkdir $dir;
  my $dat = $dir . "/" . $f . ".dat"; 

  open OUT , ">" , $dat ;

  my $xpos = 0; 
  my $color = 1; 
  foreach my $key ( sort { sort_function($a) <=> sort_function($b) } keys %particles ) 
  {
    $xpos++; 
    foreach my $operator ( @{ $particles{$key} } )
    {
      my $ref = sort_function($key); 
      my $string = @{$ref}[0] . " " .  $operator->mass() . " 0.1 " . $key . " " . 0.1*(1 - rand(2)) . " ";
      $string .= state_color_function( $key ,  $operator ) ; 

      my $qm_assign = ""; 
      if( $mode == 0 )
      {
        $qm_assign = $operator->quark_model_assignment()->par() if $operator->quark_model_assignment(); 
      }
      elsif ( $mode == 1) 
      {
        $qm_assign = $operator->pid(); 
      }

      print OUT $string . " $qm_assign \n";
    }
  }

  close OUT; 

  return $dat; 
}

#
#
# OPERATOR SORTING FUNCTIONS 
#
#
sub sort_function
{
  my $id = shift; 
  return function_callback( $id , "T"  ); 
}

sub xtic_function
{
  return function_callback( "foo" , undef ); 
}

#
#
# PICK SORTING METHOD
#
#


sub sort_operators
{
  my $op = shift; 
#  return sort_operators_name($op); 
  return sort_operators_JPC($op); 
}


sub function_callback
{
  my ($p1,$p2) = @_; 
#  return sort_function_particle_name($p1,$p2); 
  return sort_function_particle_JPC($p1,$p2); 
}


#
#
# SORT OPERATORS BY PARTICLE NAME 
#
#


sub sort_operators_name
{
  my $op = shift; 
  my $pid = $op->op_name(); 
  my ( $name , @trash ) = split /_/ , $pid ; 

  print $pid . " " . $name . "\n"; 
  return $name; 
}


# cook up a sorting function and also use it for xtics 
sub sort_function_particle_name
{
  my ($f,$mode) = @_;

  my %hash = ();  
  my $bad_idx = [-2,7]; 
  $hash{"pion"} = [1,1]; 
  $hash{"rho"} = [2,2]; 
  $hash{"unknown"} = $bad_idx; 

  if ( $mode ) 
  {
    my $idx = $bad_idx; 
    $idx = $hash{$f} if exists $hash{$f};
    return $idx; 
  }
  else
  {
    my $s = "set xtics ( "; 
    foreach my $p ( keys %hash ) 
    {
      my $val = @{ $hash{$p} }[0];
      $s .= " \"$p\"  $val ,"; 
    }
    chop $s; 
    $s .= ") \n";
    return $s; 
  }
}



#
#
# SORT OPERATORS BY PARTICLE JPC
#
#


sub sort_operators_JPC
{
  my $op = shift; 
  my $pid = $op->op_name(); 
  my ( $name , @trash ) = split /_/ , $pid ; 

  my %hash = ();  
  my $bad_idx = -2; 
  $hash{"a"} = "++"; 
  $hash{"b"} = "+-"; 
  $hash{"pion"} = "-+"; 
  $hash{"rho"} = "--"; 

  my $ret = $op->spin(); 
  $ret .= $hash{$name} if exists $hash{$name};
  $ret .= $name unless exists $hash{$name};

  print $pid . " " . $ret . "\n"; 
  return $ret; 
}


# cook up a sorting function and also use it for xtics 
sub sort_function_particle_JPC
{
  my ($f,$mode) = @_;

  my %hash = ();  
  my $bad_idx = [-2,-2]; 

  $hash{"0-+"} = [1,1]; 
  $hash{"1--"} = [2,2]; 
  $hash{"2--"} = [3,3]; 
  $hash{"2-+"} = [4,3]; 
  $hash{"3--"} = [5,4]; 
  $hash{"4--"} = [6,5]; 
  $hash{"4-+"} = [7,5]; 


  $hash{"0++"} = [8,1]; 
  $hash{"1+-"} = [9,2]; 
  $hash{"1++"} = [10,2]; 
  $hash{"2++"} = [11,3]; 
  $hash{"3++"} = [12,4]; 
  $hash{"3+-"} = [13,4]; 
  $hash{"4++"} = [14,5]; 

  $hash{"0--"} = [15,1]; 
  $hash{"0+-"} = [16,1]; 
  $hash{"1-+"} = [17,2]; 
  $hash{"2+-"} = [18,3]; 
  $hash{"3-+"} = [19,4]; 
  $hash{"4+-"} = [20,5]; 
  $hash{"unknown"} = $bad_idx; 

  if ( $mode ) 
  {
    my $idx = $bad_idx; 
    $idx = $hash{$f} if exists $hash{$f};
    return $idx; 
  }
  else
  {
    my $s = "set xtics ( "; 
    foreach my $p ( sort {$hash{$a}[0] <=> $hash{$b}[0]} keys %hash ) 
    {
      my $val = @{ $hash{$p} }[0];
      $s .= " \"$p\"  $val ,"; 
    }
    chop $s; 
    $s .= ") \n";
    return $s; 
  }
}


#
#
# COLOR FUNCTIONS FOR PLOTTING
#
#


sub init_hybrid_params
{
  return -1;
}

sub state_color_function
{
  my ($key,$op) = @_; 

  my $c = sort_function( $key ); 
  my $lc = @{ $c }[1]; 
  if ( $op->hybrid() ) 
  {
    $lc = $hybrid_line_number; 
  }

  return $lc; 
}
