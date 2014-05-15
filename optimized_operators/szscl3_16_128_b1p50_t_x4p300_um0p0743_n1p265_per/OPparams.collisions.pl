#!/usr/bin/perl


use strict; 
use OPparams;
use ExtractedStates; 
use File::Basename;
use XML::Dumper; 

my @ops = @{ ExtractedStates::grab_all() }; 
my %irreps = (); 

foreach my $op ( @ops )
{
  my $irrep = basename( $op->recon_dir() ); 

  if ( exists $irreps{$irrep} )
  {
    check_update_collision( $irreps{$irrep} , $op ); 
  }
  else
  {
    my %h = (); 
    check_update_collision( \%h , $op ); 
    $irreps{$irrep} = \%h; 
  }
}

dump_res(\%irreps); 


#
#
#
#
#


sub dump_res
{
  my $hashr = $_[0]; 

  open OUT , ">" , "pulled_state_list.txt"; 

  foreach my $irrep ( sort {$a cmp $b} keys %{ $hashr } )
  {
    my %states = %{ $hashr->{$irrep} }; 
    my @ks = sort {$a <=> $b} keys %states; 
    my $nk = $#ks + 1; 
    print OUT "irrep: $irrep, pulled $nk states \n";

    foreach my $state ( @ks )
    {
      my $op = $states{$state}; 
      print OUT "   state $state -> " . $op->op_name() . "\n"; 
    }
  }

  close OUT ; 
}

sub check_update_collision
{
  my ($hashr , $op ) = @_; 
  
  my $state = $op->state(); 

  if( exists $hashr->{$state} )
  {
    my $op2 = $hashr->{$state}; 
    print "Collsion error for ops \n ";
    print  $op->op_name() . " is state " . $state . "in " . $op->recon_dir() ."\n"; 
    print  $op2->op_name() . " is state " . $op2->state() . "in " . $op2->recon_dir() ."\n"; 
    print " YOU SHOULD FIX THIS DUMMY \n"; 
  }
  else
  {
    $hashr->{$state} = $op; 
  }
}

