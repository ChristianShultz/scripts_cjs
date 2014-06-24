#!/usr/bin/perl


use strict; 
use OPparams;
use ExtractedStates; 
use File::Basename;
use XML::Dumper; 

die ("usage $0 <op_name_sting or all>") unless $#ARGV == 0; 
my $op_substr = shift @ARGV; 

my @all_ops = @{ ExtractedStates::grab_all() }; 
my %irreps = (); 

# code we want to run 
my $exen = "proj_op_util";
my $exe = `which $exen`; 
chomp $exe; 
if( !!! -e $exe )
{
  die( "$exe doesn not exist or is not executable, looked for $exen \n" );
}

#ini file name 
my $inifile = "sfit.ini.xml";
my %op_hash; 
my @ops = (); 

if($op_substr eq "all")
{
  @ops = @all_ops; 
}
else
{
  foreach my $op ( @all_ops )
  {
    push @ops, $op if $op->op_name() =~ m/$op_substr/; 
  }
}

die("no ops present") if $#ops == -1; 


foreach my $op ( @ops )
{
  my %Z =  %{ get_all_Z_vals($op) };  
  my $op_index = get_best_Z( \%Z ); 
  my @ZB = @{ $Z{$op_index} }; 
  my $ZV = $ZB[0]; 
  my $ZE = $ZB[1]; 
  print "working on " . $op->op_name() . ", best Z = $ZV +/- $ZE , op $op_index \n";

  $op_hash{$op->op_name()} = [ $op, $ZV, $op_index , $ZB[2] ]; 
}

open RESULT , ">" , "op_phases.txt"; 
open BADPHASE , ">" , "op_phases.bad.txt"; 

my %particle_hash = (); 

foreach my $op_name ( sort { $a cmp $b } keys %op_hash ) 
{
  # get pars stored in the operator 
  my ($op,$Z,$idx,$Zjack) = @{ $op_hash{$op_name} }; 
  my $list = $op_name . ".list"; 

  # set up the move around 
  my $basedir = `pwd`;
  chomp $basedir; 
  my $recon_dir = $op->recon_dir(); 
  chdir $recon_dir || die(" unable to cd $recon_dir"); 

  # run a code
  system( "$exe sfit.ini.xml project_against $list $idx" ); 

  # get the amplitude from the fit
  my $tz = $op->tz(); 
  my $line = `calcbc ' exp_fit_amp0.jack / extract( $Zjack , $tz ) '`; 
  chomp $line; 
  my ($a,$phase,$phasee,$aa) = split(' ',$line); 

  my $op_phase = $op->phaser(); 

  # check phase
  if( $phase * $op_phase < 0. )
  {
    print BADPHASE $op->op_name() . " has unexpected phase , got $phase +/- $phasee, phaser $op_phase\n"; 
  }

  # get the z value 
  my $line2 = `calcbc ' extract( $Zjack , $tz ) ' `; 
  chomp $line2; 
  my ($b,$Z,$Ze,$bb) = split(' ',$line2); 

  print RESULT $op->op_name() . " $phase +/- $phasee $op_phase \n";
  print RESULT "             " . basename($Zjack) . " $Z +/- $Ze \n";

  # make some graphical output 
  my $op_id = $op->pid(); 
  my %tmp_h = (); 
  # copy if it exists
  %tmp_h = %{ $particle_hash{$op_id} } if exists $particle_hash{$op_id}; 
  # throw in the data
  $tmp_h{$op->op_name()} = [$phase,$phasee]; 
  # update the hash 
  $particle_hash{$op_id} = \%tmp_h; 

  chdir $basedir || die ( "unable to move back to $basedir"); 
}

close RESULT;
close BADPHASE; 

# now make some graphical ouput so I can visualize these numbers 
my $hash_dir = "op_phase_hash_data";
mkdir $hash_dir unless -d $hash_dir; 

# loop over species 
foreach my $particle ( keys %particle_hash ) 
{
  my $dfile = "$hash_dir/$particle";
  open OUT , ">" , $dfile; 
  my %little_h = %{ $particle_hash{$particle} }; 
  my $ct = 0;
  my $xtic = "set xtics ( "; 
  foreach my $op_check ( keys %little_h ) 
  {
    my ($val,$err) = @{$little_h{$op_check}}; 
    my $op_name_tic = replace_underscore_comma($op_check); 
    print OUT "$ct $op_name_tic $val $err \n"; 
    $xtic .= " \"$op_name_tic\" $ct ,";

    ++$ct; 
  }

  close OUT; 

  chop $xtic;
  $xtic = $xtic . ") nomirror rotate by -45 font \",8\"  \n"; 


  my $gfile = "$hash_dir/$particle.gp"; 
  open GP , ">" , $gfile; 
  print GP $xtic; 
  print GP "set style fill solid border -1 \n";
  print GP "set boxwidth 0.5 relative \n";
  print GP "plot \'$dfile\' u (\$0):3:4:xtic(2) w boxerrorbars \n"; 
  print GP "set xr [GPVAL_X_MIN -1 : GPVAL_X_MAX +1] \n";
  print GP "replot \n"; 
  close GP; 
  system( "gnuplot -persist $gfile ");

}

sub replace_underscore_comma
{
  my $string = shift; 
  $string =~ s/_/,/g; 
  return $string; 
}

sub get_all_Z_vals
{
  my ($op) = @_; 
  my %Zh = (); 

  my $basedir = `pwd`;
  chomp $basedir; 
  my $recon_dir = $op->recon_dir(); 
  chdir $recon_dir || die(" unable to cd $recon_dir"); 
  my $t0 = $op->t0(); 
  my $state = $op->state(); 
  my @fs = `ls t0${t0}/Z_tJackFiles/Zt_t0_${t0}_reorder_state${state}_*`;


  foreach my $z ( @fs )
  {
    chomp $z; 
    my ($j,$o) = split /_op/ , $z; 
    my ($n,$j2) = split /.jack/ , $o; 
    my $tz = $op->tz(); 

    my $line = `calcbc ' extract ( $z , $tz ) ' `; 
    my ($a,$zv,$ze,$aa) = split(' ',$line); 

    $Zh{$n} = [$zv,$ze,$z]; 
  }

  chdir $basedir || die ( "unable to move back to $basedir"); 

  return \%Zh; 
}

# look for a large well determined value 
sub get_best_Z
{
  my %Z = %{ $_[0] }; 
  my $best = 0; 
  my @t = @{ $Z{$best} }; 
  my $zb = $t[0];
  my $zbe = $t[1];

  foreach my $k ( keys %Z )
  {
    my @zz = @{ $Z{$k} };
    my @zzb = @{ $Z{$best} }; 

    my $zn = $zz[0]; 
    my $ze = $zz[1]; 


    if( abs($zb) < abs($zn) )
    {
      if( abs($ze/$zn) < 0.5 )
      {
        $best  = $k; 
        $zb = $zn; 
        $zbe = $ze; 
      }
    }
  }

  return $best; 
}
