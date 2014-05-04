#!/usr/bin/perl 

use strict; 
use OPparams;
use ExtractedStates; 
use File::Basename;
use XML::Dumper; 

my @ops = @{ ExtractedStates::grab_all() }; 


foreach my $op ( @ops ) 
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
