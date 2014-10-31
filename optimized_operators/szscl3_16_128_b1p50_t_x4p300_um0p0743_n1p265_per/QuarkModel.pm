#!/usr/bin/perl

package QuarkModel; 
use strict; 
sub new 
{
  my $invocant = shift; 
  my $class = ref($invocant) || $invocant;
  my $self = {
    PAR=> undef, 
    @_, 
  }; 
  return bless $self , $class; 
}

sub par
{
  my $self = shift; 
  if(@_) { $self->{PAR} = shift;}
  return $self->{PAR};
}

1;
