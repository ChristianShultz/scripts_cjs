#!/usr/bin/perl
#
# Convert projected op lists for pions using old adat ops into redstar ops
#
use strict;

die "cat STDIN | $0\n" unless scalar(@ARGV) == 0;

while(my $line = <STDIN>)
{
  chomp $line;
  my @F = split(/ /, "${line}");
  my $opname = $F[0];
  my $subopname = $F[1];
  my $val = $F[2];

  my $P = +1;

  # Gamma matrices
  if ($subopname =~ /a0x/ || $subopname =~ /a1x/ || $subopname =~ /b0x/ || $subopname =~ /b1x/)
  {
    $P *= +1;
  }
  elsif ( $subopname =~ /pionx/ || $subopname =~ /pion_2x/ || $subopname =~ /rhox/ || $subopname =~ /rho_2x/)
  {
    $P *= -1;
  }
  else
  {
    die "Unknown gamma matrix structure for op = $subopname\n";
  }

  # Derivatives
  if ($subopname =~ /xD0_/ || $subopname =~ /xD2_/)
  {
    $P *= +1;
  }
  elsif ($subopname =~ /xD1_/ || $subopname =~ /xD3_/)
  {
    $P *= -1;
  }
  else
  {
    die "Unknown gamma matrix structure for op = $subopname\n";
  }

  # The parity determines the redstar operator
  my $red_op;

  if ($P == +1)
  {
    $red_op = "a_${subopname}";
  }
  elsif ($P == -1)
  {
    $red_op = "pion_${subopname}";
  }
  else
  {
    die "Invalid parity P= $P\n";
  }
    
  printf "%s %s %g\n", ${opname}, ${red_op}, ${val};
}

exit(0);



