#!/usr/bin/perl


package ExtractedStates; 

use strict; 
use OPparams; 
use XML::Dumper; 

# the list of everything that is done 
sub grab_list
{

#  my @test = ( "pion/proj0/pion_proj0.perl.xml");
#  return \@test; 

# list of perl xml 
  my @fs = ( 
    "pion/proj0/pion_proj0.perl.xml",
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
