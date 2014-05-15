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
    "a/proj3/a_proj3.perl.xml",
    "a/proj4/a_proj4.perl.xml",
    "a/proj6/a_proj6.perl.xml",
    "a/proj7/a_proj7.perl.xml",
    "a/proj8/a_proj8.perl.xml",
    "a/proj10/a_proj10.perl.xml",
    "a/proj12/a_proj12.perl.xml",
    "b/proj0/b_proj0.perl.xml",
    "b/proj4/b_proj4.perl.xml",
    "b/proj5/b_proj5.perl.xml",
    "b/proj7/b_proj7.perl.xml",
    "b/proj8/b_proj8.perl.xml",
    "b/proj10/b_proj10.perl.xml",
    "pion/proj0/pion_proj0.perl.xml",
    "pion/proj1/pion_proj1.perl.xml", 
    "pion/proj2/pion_proj2.perl.xml", 
    "pion/proj4/pion_proj4.perl.xml", 
    "pion/proj6/pion_proj6.perl.xml", 
    "pion/proj7/pion_proj7.perl.xml", 
    "pion/proj9/pion_proj9.perl.xml", 
    "pion/proj11/pion_proj11.perl.xml", 
    "rho/proj0/rho_proj0.perl.xml", 
    "rho/proj1/rho_proj1.perl.xml", 
    "rho/proj2/rho_proj2.perl.xml", 
    "rho/proj3/rho_proj3.perl.xml",
    "rho/proj6/rho_proj6.perl.xml", 
    "rho/proj9/rho_proj9.perl.xml" 
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
