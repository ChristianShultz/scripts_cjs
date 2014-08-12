#!/usr/bin/perl 

use strict; 
use warnings; 

use OPparams;
use ExtractedStates; 
use File::Basename;
use XML::Dumper; 

my $basedir = dirname($0); 
require "${basedir}/OPparams.work.pl"; 

die( "usaged: $0 <channel> <rep> <pmom>" ) unless $#ARGV >= 2; 
my $channel = $ARGV[0]; 
my $rep = $ARGV[1]; 
my $mom = $ARGV[2]; 

my $output = undef; 
if( $#ARGV == 3 ) 
{
  $output = $ARGV[3]; 
}


print "read $channel $rep $mom \n";

# quantum numbers
my %chan_h = (); 
$chan_h{"pion"} = ["m","M"];
$chan_h{"rho"} = ["m","P"];
$chan_h{"a"} = ["p","M"];
$chan_h{"b"} = ["p","P"];


# boost pars 
my $LS = 16; 
my $xi = 3.44; 
my $pfac = 2*3.14159/$LS/$xi; 
my %boost_term = (); 

# set boost terms 
$boost_term{"p000"}  = 0.*$pfac*$pfac; 
$boost_term{"p100"}  = 1.*$pfac*$pfac; 
$boost_term{"p110"}  = 2.*$pfac*$pfac; 
$boost_term{"p111"}  = 3.*$pfac*$pfac; 
$boost_term{"p200"}  = 4.*$pfac*$pfac; 

# known quantum numbers 
die ( "unknown channel: $channel ") unless exists $chan_h{$channel};

# known boost 
die ( "unknown mom: $mom ") unless exists $boost_term{$mom};

# init pars 
our $hybrid_line_number = 6; 

#grab all ops
my @all_ops = @{ ExtractedStates::grab_all() }; 

# only pull down one copy in case of things 
# like spin 2 that get split across reps 
my %rest_ops = (); 

# find rest ops 
foreach my $op ( @all_ops ) 
{
  if ( $op->op_name =~ "p000" ) 
  {
    my $pid = $op->pid(); 
    $rest_ops{$pid} = $op unless exists $rest_ops{$pid}; 
  }
}

# split this thing up 
my %ops_by_channel = (); 

# keys are names like rho_proj1 
foreach my $op_key ( sort{$a cmp $b} keys %rest_ops )
{
  my $op = $rest_ops{$op_key}; 
  my $op_name = $op->op_name(); 
  my ($chan,$proj,$op_mom,$op_rep) = split /_/ , $op_name ;  

  # the quantum numbers for this channel 
  my @qn = @{ $chan_h{$chan} }; 

  # keys are things like p000 
  my $rep_hash_ref = &rep_list($op->spin(),$qn[0]); 
  my $mom_rep_hash_ref = $rep_hash_ref->{$mom}; 

  my @rep_names = keys %{ $mom_rep_hash_ref }; 
  my ($mass,$err) = split /\s+/ , $op->mass(); 
  
  # print "$op_name -> $mass \n";

  my $boosted_mass = sqrt( $mass*$mass + $boost_term{$mom}); 

  # shove them into an array, the array is the data of the hash 
  # the key is the rep stem 
  foreach my $rep_name ( @rep_names )
  {
    # append G-parity 
    my $rep_chan = $rep_name . $qn[1]; 
   
    if( exists $ops_by_channel{$rep_chan} ) 
    {
      push @{ $ops_by_channel{$rep_chan} }, [$op,$boosted_mass]; 
    }
    else
    {
      $ops_by_channel{$rep_chan} = [[$op,$boosted_mass]];
    }
  }
}

#do stuff if we can 
if( exists $ops_by_channel{$rep} )
{
  print "the following can go into $rep \n";

  foreach my $ele ( sort{ $a->[1] <=> $b->[1]} @{ $ops_by_channel{$rep} } )
  {
    # deref data 
    my ($op,$mass) = @{$ele}; 
    my $JPC = operator_JPC($op); 
    my $n = $op->op_name(); 

    print  " $JPC  $n $mass  \n";
  }

  my $f =  make_gnu_spectrum_data($ops_by_channel{$rep}); 
  do_gnuplot($f,$rep); 

}
else
{
  print "could not find $rep in the following list \n";
  foreach my $k ( keys %ops_by_channel )
  {
    print "$k \n";
  }
}



#
#
#
#
#
#


sub make_gnu_spectrum_data
{
  my @a = @{$_[0]}; 

  mkdir "tmp";
  my $f = "tmp/boosted_spectrum_gnu.dat";
  open DATA , ">" , $f; 

  my $sn = 1.; 

  foreach my $ele ( sort{ $a->[1] <=> $b->[1]} @a )
  {
    # deref data 
    my ($op,$mass) = @{$ele}; 
    my $JPC = operator_JPC($op); 
    my $x = 1 + $sn*0.25*rand(1.); 
    my $spn = $op->spin() ; 
    my $n = $op->op_name(); 
    $spn = $hybrid_line_number if $op->hybrid(); 

    print DATA "$x $mass $JPC $spn $n\n";

    $sn = -1.*$sn;
  }

  close DATA; 

  return $f; 
}

sub do_gnuplot
{
  my ($dat,$rep) = @_; 
  my ($gp,$junk) = split /\./ , $dat; 
  $gp .= ".gp"; 

  open GNU , ">" , $gp ; 

  print GNU "set terminal x11 enhanced \n";
  print GNU "set size ratio 2 \n";
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
  print GNU "unset xtics\n";
  print GNU "set object 1 rect from screen 0.90,0.85 to screen 0.95,0.90 fc lt 0 \n";
  print GNU "set object 2 rect from screen 0.90,0.75 to screen 0.95,0.80 fc lt 1 \n";
  print GNU "set object 3 rect from screen 0.90,0.65 to screen 0.95,0.70 fc lt 2 \n";
  print GNU "set object 4 rect from screen 0.90,0.55 to screen 0.95,0.60 fc lt 3 \n";
  print GNU "set object 5 rect from screen 0.90,0.45 to screen 0.95,0.50 fc lt 4 \n";
  print GNU "set object 6 rect from screen 0.90,0.35 to screen 0.95,0.40 fc lt $hybrid_line_number \n";
  print GNU "set label 1 at screen 0.915,0.87 \"J0\" front \n";
  print GNU "set label 2 at screen 0.915,0.77 \"J1\" front \n";
  print GNU "set label 3 at screen 0.915,0.67 \"J2\" front \n";
  print GNU "set label 4 at screen 0.915,0.57 \"J3\" front \n";
  print GNU "set label 5 at screen 0.915,0.47 \"J4\" front \n";
  print GNU "set label 6 at screen 0.915,0.37 \"Hyb\" front \n";
  print GNU "set style fill solid .5 border -1\n";
  print GNU "set title \"boosted rest -> $rep\" \n";
  print GNU "set ylabel \"a_{t} m_{h}\"\n";
  print GNU "plot \"$dat\" u 1:2:(0.3):(0.005):4 w boxxyerrorbars lc variable, \\\n";
  print GNU "\"$dat\" u (\$1+1):2:3 with labels\n";
  print GNU "set xr [GPVAL_DATA_X_MIN - 0.2 : GPVAL_DATA_X_MAX + 0.2] \n";
  print GNU "set yr [GPVAL_DATA_Y_MIN - 0.02: GPVAL_DATA_Y_MAX + 0.02]\n";
  print GNU "replot \n";

  if( $output ) 
  {
    print GNU "set term postscript eps enhanced \n"; 
    print GNU "set out \"$output\" \n";
    print GNU "replot \n";
  }


  close GNU; 

  system ( "/home/shultz/git-builds/gnuplot/bin/gnuplot -persist $gp" ); 
}



#
#
# OPERATOR  FUNCTIONS 
#
#
#


sub operator_JPC
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

  return $ret; 
}

