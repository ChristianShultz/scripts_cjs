#!/usr/bin/perl
use strict;

die "forall.pl <t0> <tZ> <state> <opslistfile> <opname> \n" unless $#ARGV == 4;

my $t0 = $ARGV[0];
my $tZ = $ARGV[1];
my $state = $ARGV[2];
my $opslistfile = $ARGV[3];
my $opname = $ARGV[4];

my $massfile = "mass_t0${t0}_state${state}_reordered.jack";

my $ii = 0;
open(OPSLIST, "< $opslistfile") || die("Could not open ${opslistfile}\n");
while(my $subopnameline = <OPSLIST>)
{
  chomp $subopnameline;
  my @subopnameline_split = split(/ /, "${subopnameline}");
  my $subopname = $subopnameline_split[1];

  my $file = "v_t0${t0}_state${state}_op${ii}_reordered.jack";

  my $command = "calcbc \" sqrt( 2 * ${massfile} ) * exp ( - ${massfile} * ${t0} / 2 ) * extract ( ${file} , ${tZ} ) \" | awk '{print \$2}' ";
  my $val = `${command}`;
  print "${opname} ${subopname} ${val}";
  $ii++;
}
close(OPSLIST);

