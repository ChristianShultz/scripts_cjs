#!/usr/bin/perl


package ExtractedStates; 

use strict; 
use OPparams; 
use XML::Dumper; 

# the list of everything that is done 
sub grab_list
{
# list of perl xml 
  my @fs = ( 
    "a/proj0/a_proj0.perl.xml",
    "a/proj1/a_proj1.perl.xml",
    "pion/proj0/pion_proj0.perl.xml",
    "pion/proj1/pion_proj1.perl.xml", 
    "pion/proj2/pion_proj2.perl.xml", 
    "pion/proj4/pion_proj4.perl.xml", 
    "rho/proj0/rho_proj0.perl.xml", 
    "rho/proj1/rho_proj1.perl.xml", 
    "rho/proj2/rho_proj2.perl.xml", 
    "rho/proj3/rho_proj3.perl.xml" 
  ); 

  return \@fs; 

}

# pull down everything in from list
# then make them into OPparams
sub grab_all
{

# list of perl xml 
  my @fs = @{ grab_list() };  

  # move from xml to perl hashes 
  my $dump = XML::Dumper->new(); 

  # ops list to be returned 
  my @ops = (); 

  foreach my $f ( @fs ) 
  {
    my $ref = $dump->xml2pl( $f ) ; 
    push @ops , @{ $ref }; 
  }
  

  return \@ops;  
}



1;
