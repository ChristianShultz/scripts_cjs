#!/usr/bin/perl

use strict; 
use warnings;
use POSIX; 


die("usage: $0 <mode 1->multiplot, 0->single graphs > <grep string>") unless ($#ARGV == 1);
my $mode = $ARGV[0];
my $str = $ARGV[1]; 

my @dat = `ls | grep $str `;

chomp @dat; 

my @stems = ();
my @ffs = (); 

foreach (@dat)
{
  my $stem = $_; 

  if ( $stem =~ "ff") 
  {
    push @ffs , $stem; 
  }
  else
  {
    push @stems , $stem;
  }
}

@stems = sort{do_split_last($a) <=> do_split_last($b)}  @stems;
@ffs = sort{do_split_last($a) <=> do_split_last($b)} @ffs; 

# front load ffs
@stems = (@ffs,@stems); 

#print @stems;

my %Q2 = ();

my $num = ceil(sqrt($#dat + 1)); 
my $maxnum = 3;

$num = $maxnum unless ($num < $maxnum);

my @chunks = @{ chunk($num,@stems) };

print "this is stupid $#chunks \n ";

#print @qs; 

mkdir ("tmp"); 

if($mode != 0)
{
  open MAP , ">" , "fname.map"; 
  my $map_count = 0; 

  foreach my $this_chunk (@chunks)
  {
    my @these_stems = @{$this_chunk};

    my $rn = int(rand(1000)); 

    open GNU , ">" , "tmp/plot_$rn.gp"; 


    print GNU "set multiplot layout $num , $num rowsfirst \n ";

    foreach my $stem (@these_stems)
    {

      my $cmdr = "calcbc \' real ( ${stem} ) \' > tmp/${stem}.dat.real";
      my $cmdi = "calcbc \' imag ( ${stem} ) \' > tmp/${stem}.dat.imag";

      system ( $cmdr ) == 0 || die($_ . " : cmd -> $cmdr");
      system ( $cmdi ) == 0 || die($_ . " : cmd -> $cmdi"); 

      my $ti = $stem; 
      print MAP $map_count . "->" . $ti . "\n"; 

      print GNU "set label 1\"";
      print GNU $map_count;
      print GNU "\" at graph 0.45,0.9 font \',8\' \n";


      print GNU "plot \'tmp/${stem}.dat.real\' using 1:2:3 w yerr title \'real\' lt 2, \\\n";
      print GNU " \'tmp/${stem}.dat.imag\' using 1:2:3 w yerr title \'imag\' lt 4 \n";

      ++ $map_count;
    }


    print GNU "unset multiplot";
    close GNU;

    system ("gnuplot -persist tmp/plot_$rn.gp") ;
  }

  close MAP; 
} 
else
{
  foreach my $stem (@stems)
  {
    my $rn = int(rand(1000)); 

    open GNU , ">" , "tmp/plot_$rn.gp"; 

    my $cmdr = "calcbc \' real ( ${stem} ) \' > tmp/${stem}.dat.real";
    my $cmdi = "calcbc \' imag ( ${stem} ) \' > tmp/${stem}.dat.imag";

    system ( $cmdr ) == 0 || die($_);
    system ( $cmdi ) == 0 || die($_); 

    print GNU "set label 1\"";
# split up the name to be 80 char then new line then next 80 char...
    my @chars = map substr($stem, $_, 1), 0 .. length($stem) -1; 
    my $idx = 0;
    foreach my $char (@chars) 
    { 
      if($idx == 50)
      {
        print GNU "\\n";
        $idx = 0; 
      }
      print GNU $char;
      $idx++; 
    }



    print GNU "\" at graph 0.45,0.9 font \',8\' \n";
    print GNU "plot \'tmp/${stem}.dat.real\' using 1:2:3 w yerr title \'real\', \\\n";
    print GNU " \'tmp/${stem}.dat.imag\' using 1:2:3 w yerr title \'imag\' \n";
    close GNU;

    system ("gnuplot -persist tmp/plot_$rn.gp") ;

  }

}


sub chunk
{
  my ($num,@stems) = @_; 
  my $n2 = $num*$num;
  my $nchunk = ceil($#stems/$n2); 
  my @chunks = ();

  for my $i(0..$nchunk-1)
  {
    my @this_chunk = ();

    for my $idx(0..$n2-1)
    {
      push @this_chunk , $stems[$i*$n2 + $idx] unless $i*$n2 + $idx > $#stems;
    }

#    print join(", ",@this_chunk) . "\n";

    push @chunks , \@this_chunk;
  }


  print join(",   ", @chunks);

  return \@chunks; 
}


sub do_split_last
{
  no warnings 'numeric';
  my $foo = $_[0];
  my @bar = split(/_/,$foo);
  return $bar[$#bar] + 9;
}

