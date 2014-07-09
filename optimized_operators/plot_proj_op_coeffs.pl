#!/usr/bin/perl

die "usage: $0 <weights.particle.list>" unless $#ARGV == 0; 

use strict;

# some global switch to turn off/on unit normalization
# NB: only undef is false since perl is dumb
# our $donorm = undef;  
our $donorm = "true";
our $saveplot = "true";

# the big list file
my $file = $ARGV[0];

# read data
open IN , "<" , $file || die $_; 
my @lines = <IN>;
close IN; 
chomp @lines; 

# init a hash
my %hash = ();


# process the data.. key is some optimized op name, dat is the interpolating field and weight
foreach my $line (@lines)
{
  my ($proj_op, $op, $weight) = split(/ /, $line);
  my $key = $proj_op;
  my $dat = $op . " " . $weight;
  push @{ $hash{$key} } , $dat if exists $hash{$key};  
  $hash{$key} = [$dat] unless exists $hash{$key};
}

# our standard rng naming and a tmp dir
my $tmp = "tmp";
my $rn = int(rand(1000));
mkdir $tmp;

# get the set of optimized operators
my @keys = keys %hash;

# make it do something pretty
print "extracting.. \n"; 

# the set of plots (one for each optimized operator) 
my @plots = (); 

# loop over each optimized operator and generate the plot 
foreach my $key (@keys)
{
  print $key . "\n";
  push @plots, make_gp($rn,$key,$hash{$key});  
}

# loop and run gnuplot
foreach my $plot (@plots)
{
  my @a = @{ $plot }; 
  my $p = $a[0]; 
  my $f = $a[1]; 
  system("/home/shultz/git-builds/gnuplot/bin/gnuplot -persist $p"); 
#  unlink $p; 
#  unlink $f; 
}


# make the plot script
#######################################################
#######################################################
#######################################################
sub make_gp
{
  my ($rn,$tag, $aref) = @_; 

  my @dat = @{$aref};

  my ($opr,$sgnr) = normalize(\@dat); 

  my %ops = %{$opr};
  my %sgns = %{$sgnr};
  my @keys = keys %ops; 

# a sort based on spins
  my @j0 = ();
  my @j1 = ();
  my @j2 = ();
  my @j3 = ();
  my @j4 = (); 

# assuming standard operator names __J#
  foreach my $key (@keys)
  {
    push @j0, $key if $key =~ m/__J0/;
    push @j1, $key if $key =~ m/__J1/;
    push @j2, $key if $key =~ m/__J2/;
    push @j3, $key if $key =~ m/__J3/;
    push @j4, $key if $key =~ m/__J4/;
  }

# set up a tag for this running of the perl script
  my $file = "tmp/".$tag . "_" .$rn;


# dump the data into a file for gnuplot
  my $fout = $file . "_" . ".dat";
  open DATOUT , ">" , $fout;

  my $xp = 0.; 
  my $j0f = dump_data($file,0,\@j0,\%ops,\%sgns);
  my $j1f = dump_data($file,1,\@j1,\%ops,\%sgns); 
  my $j2f = dump_data($file,2,\@j2,\%ops,\%sgns); 
  my $j3f = dump_data($file,3,\@j3,\%ops,\%sgns); 
  my $j4f = dump_data($file,4,\@j4,\%ops,\%sgns); 

  close DATOUT;


# make the plot
  my $plot = $file . ".gp";

  open OUT , ">" , $plot; 

  print OUT "set key noenhanced\n";
  print OUT "set bars fullwidth \n";
  print OUT "set style data histogram \n";
  print OUT "set style fill solid border -1 \n";
  print OUT "set style histogram errorbars gap 5 lw 1 \n";
  print OUT "set xtics nomirror rotate by -45 font \",8\"\n";
  print OUT "set title \"$tag\" \n";
  print OUT "set yrange [0:1.05] \n";
  print OUT "plot \"$fout\" u (column(0)):2:xtic(1), \\\n" ;
#                                #xval:ydata:boxwidth:color_index:xtic_labels
  print OUT "\"$fout\" u (column(0)):(\$2 + 0.02):4 with labels";


  if($saveplot)
  {
# looks like crap
#  my $png = $file . ".png";
# print OUT "\nset output \"$png\" \n";
#  print OUT "set term png\n";

    my $ps = $tag . ".eps";
    print OUT "\nset terminal postscript eps \n";
    print OUT "set output \"$ps\" \n";
    print OUT "replot"

  }


#print OUT "plot \"$fout\" using xticlabels(1):2:3   \n"; 

  close OUT; 


  my @r = ( $plot , $fout ) ; 

  return \@r; 
}


# unit normalize and keep track of the sign
#######################################################
#######################################################
#######################################################
sub normalize
{
  my ($ref) = @_; 
  my @in = @{$ref};
  my @out = (); 
  my $largest = 0; 
  my %ops = (); 
  my %sign = (); 
  foreach my $elem (@in)
  {
    my ($op, $val) = split(/ /, $elem); 

    if($val < 0)
    {
      $ops{$op} = -$val;
      $sign{$op} = "-";
    }
    else
    {
      $ops{$op} = $val;
      $sign{$op} = "+";
    }

    if ($ops{$op} > $largest)
    {
      $largest = $ops{$op};
    }

  }

  my @keys = keys %ops;

  if($donorm)
  {
    foreach my $key (@keys)
    {
      my $foo = $ops{$key};
      $ops{$key} = $foo/$largest; 
    }
  }

  return (\%ops, \%sign); 
}

# dump the data into something gnuplot can read
#######################################################
#######################################################
#######################################################
sub dump_data
{
  my ($file,$j,$ky,$opv,$sg) = @_;

  my @keys = @{$ky};
  my %ops = %{$opv};
  my %sgn = %{$sg};

  foreach my $key (@keys)
  {
    print DATOUT $key . " " . $ops{$key} . " " . $j  . " " . $sgn{$key} . "\n"; 
  }

  return $#keys; 
}


# all credit to JJD, stolen code 
sub ident_op {
  # attempts to color code operators 
  my $op = $_[0];

  # fixing up jo's code, need to predeclare the 
  # rat's nest of variables since we are not 
  # abusing perls malfeatures 
  my $hadron = "";
  my $isospin = "";
  my $flavspin; 
  my $deriv; 
  my $spin; 
  my $type; 
  my $opname; 
  my $opstruct; 
  my $spinirrep; 
  my $flavdirac; 
  my @aflavdirac; 
  my $dirac; 
  my $flav; 
  my $flavrep; 

  # add another dimension to these maps for flavour rep (eventually)

  # baryon colors
  my %baryon_colors = 
  (
    'J1o2' => {'conv' => '"black"', 
      'hyb' => '"#A9A9A9"', 
      'D2J1A'=> '"#DCDCDC"', 
      'local'=>'"#708090"', 
      'lapl'=>'"#F0FFFF"'},
    'J3o2' => {'conv' => '"red"', 
      'hyb' => '"#FF1493"', 
      'D2J1A'=> '"#D2691E"', 
      'local'=>'"#A52A2A"'},
    'J5o2' => {'conv' => '"#228B22"', 
      'hyb' => '"#7FFF00"', 
      'D2J1A' => 
      '"#ADFF2F"' },
    'J7o2' => {'conv' => '"blue"', 
      'hyb' => '"#1E90FF"', 
      'D2J1A'=>'"#20B2AA"'}
  );

  # meson colors
  my %meson_colors = (
    'J0' => {'conv' => '"black"', 
      'hyb' => '"#A9A9A9"'},
    'J1' => {'conv' => '"red"', 
      'hyb' => '"#FF1493"'},
    'J2' => {'conv' => '"#228B22"', 
      'hyb' => '"#7FFF00"'},
    'J3' => {'conv' => '"blue"', 
      'hyb' => '"#1E90FF"'},
    'J4' => {'conv' => '"gold"'},
    'other' => {'other' => '"brown"'}    );

  my %colors = (%baryon_colors, %meson_colors);


  my @isoscalarnames = ('l', 's', 'octet', 'singlet', 'fl', 'fs', 'f1', 'f8', 'etal', 'etas', 'eta1', 'eta8', 'hl', 'hs', 'h1', 'h8', 'omegal', 'omegas', 'omega1', 'omega8');

  #baryon syntax   NucleonMG1g1MxD0J0S_J1o2_G1g1
  #meson syntax    b0xD1_J1__J1_T1 (old)   or   rho_rhoxD0_J0__J1_T1

  my @break = split('_', $op);
  my $irrep = &removeHelicity($break[-1]);

  if( ($irrep =~ /G/) || ($irrep =~ /H/) ||
    ($irrep =~ /D4E1/) || ($irrep =~ /D4E3/) ||
    ($irrep =~ /D3E1/) || ($irrep =~ /D3B/) ||
    ($irrep =~ /D2E/) ||
    ($irrep =~ /C4E/)) 
  {
    #its a baryon
    $hadron = "baryon";
    ($opname, $spin, $irrep) = split('_', $op);
    ($flavspin, $deriv) = split('x', $opname);
  }
  elsif( ($irrep =~ /A/) || ($irrep =~ /T/) || ($irrep =~ /E/) ||
    ($irrep =~ /D4A/) || ($irrep =~ /D4E2/) || ($irrep =~ /D4B/) ||
    ($irrep =~ /D3A/) || ($irrep =~ /D3E2/) ||
    ($irrep =~ /D2A/) || ($irrep =~ /D2B/) ||
    ($irrep =~ /C4A/)) 
  {
    #its a meson
    $hadron = "meson";
    ($opstruct, $spinirrep) = split('__', $op);
    ($spin, $irrep) = split('_', $spinirrep);
    ($flavdirac, $deriv) = split('x', $opstruct);

    @aflavdirac =  split('_', $flavdirac);

    $isospin = 1;

    if( scalar(@aflavdirac) == 1 )
    {
      # old op names
      $dirac = $aflavdirac[0];
    }
    else
    {
      $flav = $aflavdirac[0];
      $dirac = $aflavdirac[1];

      if (grep {$_ eq $flav} @isoscalarnames) {
        $isospin = 0;
      }
    }

  }
  else
  {
    # will probably be called for two-particle opes
    print "don't know how to deal with $op yet! coloring it brown \n";
    my $spin = "other";
  }

  # decided if baryon,meson,or other
  if($hadron eq 'baryon')
  {
    # flavor reps not used yet
    if($flavspin =~ m/Sigma8/ )
    {
      $flavrep = 8;
    }
    elsif($flavspin =~ m/Sigma10/ )
    {
      $flavrep = 10;
    }
    #need extra coloration to show flavor
    #grow the map

    #baryon deriv types
    $type = "conv";
    if( ($deriv eq 'D2J1S') || ($deriv eq 'D2J1M') ){ $type = "hyb"; }
    elsif( $deriv eq 'D2J1A'){ $type = "D2J1A"; }
    elsif( $deriv eq 'D0J0S'){ $type = "local"; }
#    elsif ($deriv eq 'D2J0S'){ $type = "lapl"; }
  }
  elsif($hadron eq 'meson')
  {
    # flavour reps not used yet
    if($isospin == 1)
    {
      #don't need coloring by flavor
    }
    else
    {
      #need extra coloration to show flavor
      #grow the map
    }

    # meson deriv types
    $type = "conv";
    if( ( $deriv eq 'D2_J1') || ($deriv eq 'D3_J132_J2') ||  ($deriv eq 'D3_J131_J0') 
      ||  ($deriv eq 'D3_J131_J1') ||  ($deriv eq 'D3_J131_J2') ) 
    { 
      $type = "hyb"; 
    }   

  }
  else
  {
    print "DON'T KNOW WHAT TO DO WITH THIS OPERATOR : ${op} -> brown \n";
    $type = "other";
  }


  my $color = $colors{$spin}{$type};
  return $color;
}



