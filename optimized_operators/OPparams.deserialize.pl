#!/usr/bin/perl 

use strict; 
use OPparams;
use File::Basename;
use XML::Dumper; 

my @fs = ( "pion_proj0.perl.xml" ); 

my $dump = XML::Dumper->new(); 
my @ops = (); 

foreach my $f ( @fs ) 
{
 my $ref =  $dump->xml2pl( $f ); 
 push @ops , @{ $ref };
}

foreach my $op ( @ops ) 
{
  print $op->op_name() . "\n";
}

