#!/usr/bin/perl 

use strict; 
use OPparams;
use ExtractedStates; 
use File::Basename;
use XML::Dumper; 

my @ops = @{ ExtractedStates::grab_all() }; 

my $p =  "p000";

foreach my $op ( @ops ) 
{
  if ( $op->op_name() =~ $p ) 
  {
    print $op->op_name();

    if ( $op->hybrid() ) 
    {
      print "*   ";
    }
    else
    {
      print "    "; 
    }

    print $op->mass() . "\n";

  }
}
