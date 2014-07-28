#!/usr/bin/perl


# a parameter package for optimized operators with a 
# tie in for radmat operator state overlaps 
#
# 

package OPparams;
use strict;

sub new
{
  my $invocant = shift; 
  my $class = ref($invocant) || $invocant; 
  my $self = {
    T0 => undef,
    STATE => undef,
    TZ => undef, 
    REP => undef,
    REPSTEM => undef, 
    MOM => undef,
    TWOIZ => undef,  
    PID => undef, 
    NCFG => undef,
    ENSEMBLE => undef,  
    RECONDIR => undef,
    PHASER => undef, 
    HYBRID=> undef, 
    ENERGY=> undef, 
    SPIN=> undef, 
    QUARK_MOD => undef,
    @_,
  }; ## self 

  return bless $self , $class; 
}

#
# WITH an arg sets the variable
#
# WITHOUT and arg fetches the variable
#

sub t0 {
  my $self = shift; 
  if (@_) {$self->{T0} = shift}
  return $self->{T0}
}

sub state {
  my $self = shift; 
  if (@_) {$self->{STATE} = shift}
  return $self->{STATE}
}

sub tz {
  my $self = shift; 
  if (@_) {$self->{TZ} = shift}
  return $self->{TZ}
}

sub irrep {
  my $self = shift; 
  if (@_) {$self->{REP} = shift}
  return $self->{REP}
}

sub irrep_stem {
  my $self = shift; 
  if (@_) {$self->{REPSTEM} = shift}
  return $self->{REPSTEM}
}

sub mom {
  my $self = shift; 
  if (@_) {$self->{MOM} = shift}
  return $self->{MOM}
}

sub twoI_z {
  my $self = shift; 
  if (@_) {$self->{TWOIZ} = shift}
  return $self->{TWOIZ};
}

sub pid {
  my $self = shift; 
  if (@_) {$self->{PID} = shift}
  return $self->{PID}
}


sub ncfg {
  my $self = shift; 
  if (@_) {$self->{NCFG} = shift}
  return $self->{NCFG}
}
sub ensemble {
  my $self = shift; 
  if (@_) {$self->{ENSEMBLE} = shift}
  return $self->{ENSEMBLE}
}

sub recon_dir {
  my $self = shift; 
  if (@_) {$self->{RECONDIR} = shift}
  return $self->{RECONDIR};
}

sub phaser {
  my $self = shift; 
  if (@_) {$self->{PHASER} = shift;}
  return $self->{PHASER};
}

sub hybrid {
  my $self = shift; 
  if (@_) {$self->{HYBRID} = shift;}
  return $self->{HYBRID};
}

sub spin {
  my $self = shift; 
  if(@_) {$self->{SPIN} = shift; }
  return $self->{SPIN};
}

sub mass {
  my $self = shift; 
  if(@_) {$self->{ENERGY} = shift}; 
  return $self->{ENERGY};
}

sub quark_model_assignment{
  my $self = shift; 
  if(@_) {$self->{QUARK_MOD} = shift};
  return $self->{QUARK_MOD};
}

#
#
# parameterless methods
#
#

sub op_name
{
  my $self = shift; 

  my $s = $self->pid() . "_" . $self->mom() . "_" . $self->irrep_stem(); 

  return $s; 
}


## quick utility 
#

sub split_mom 
{
  my $p = shift;
  my @c = split "" , $p ; 
  # drop first char and put spaces btwn mom components
  return $c[1] . " " . $c[2] . " " . $c[3] ;  
}

sub calc_mass
{ 
  my $self = shift; 

  my $massf = $self->recon_dir() . "/t0" . $self->t0(); 
  $massf .= "/MassJackFiles/mass_t0_" . $self->t0() . "_reorder_"; 
  $massf .= "state" . $self->state() . ".jack"; 

  my $s = `calc $massf | awk '{ print \$2 " " \$3 }'`;
  chomp $s; 
  
#  my ( $e , $ve ) = split /\s+/ , $s ; 
#  print $massf . "\n" . $e . " +/- " . $ve . "\n"

  $self->mass($s); 
}




sub write_mass_overlap_xml
{
  my $self = shift; 

  my $op = $self->op_name(); 
  my $f = $op . ".mass_overlap.xml";
  my $db = $op . ".sdb";
  my $twoI_z = $self->twoI_z(); 
  my $mom = split_mom($self->mom()); 
  my $t0 = $self->t0(); 
  my $ncfg = $self->ncfg(); 
  my $pid = $self->pid();
  my $phaser = $self->phaser(); 



  
  my $massdir = $self->recon_dir() . "/t0" . $t0 . "/MassJackFiles";
  my $massf = "mass_t0_" . $t0 . "_reorder_" . "state" . $self->state() . ".jack"; 

 (  my $zf = $massf  ) =~ s/mass/operator_normalization/;

  # where do we live right now
  my $local_base_dir = `pwd`; 
  chomp $local_base_dir;  

  # move to mass dir 
  chdir $massdir || die ("unable to move $massdir");  

  my $overlap_command = "ensbc '$zf = 2 *  $massf'";
  system($overlap_command) == 0 || die("cant do $overlap_command"); 
  
  # move back out 
  chdir $local_base_dir || die ("unable to move $local_base_dir"); 


  open OUT , ">" , $f; 

  print OUT <<EOF;
<?xml version="1.0"?>

<Params>
  <mass_file>$massdir/$massf</mass_file>
  <overlap_file>$massdir/$zf</overlap_file>
  <ncfg>$ncfg</ncfg>
  <resize>false</resize>
  <isProjected>true</isProjected>
  <phase_real>$phaser</phase_real>
  <phase_imag>0.</phase_imag>
  <dbname>$db</dbname>
  <pid>$pid</pid>
  <LG>true</LG>
  <t0_extract>$t0</t0_extract>
  <redstar>
    <CGs>
    </CGs>
    <Operators>
      <elem>
        <name>$op</name>
        <smear></smear>
        <mom_type>$mom</mom_type>
      </elem>
    </Operators>
    <creation_op>false</creation_op>
    <smearedP>true</smearedP>
    <mom>$mom</mom>
    <row>1</row>
    <twoI_z>$twoI_z</twoI_z>
  </redstar>
</Params>

EOF

  my %hash = (); 
  $hash{$f} = $db;

  return \%hash ; 
}


1;
