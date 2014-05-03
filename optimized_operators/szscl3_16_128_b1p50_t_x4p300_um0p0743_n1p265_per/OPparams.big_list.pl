#!/usr/bin/perl

use strict; 
use OPparams; 
use ExtractedStates; 
use File::Basename; 
use XML::Dumper; 

my @ops = @{ ExtractedStates::grab_all() }; 

my $dump = XML::Dumper->new(); 

$dump->pl2xml(\@ops,"states.big_list.xml"); 
