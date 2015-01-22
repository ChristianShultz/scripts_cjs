#
# 
# WORK SCRIPT NEEDED BY OPperams.pl
#
#

use strict; 
use File::Basename;
use File::Copy;
use XML::Dumper;

#
##
###
###########
sub rep_list
{
  my ($spin , $parity) = @_; 

  print "generating irrep list for spin $spin , parity $parity \n";

  my %fcns = (); 

  $fcns{0} = \&rep_list_spin_0;
  $fcns{1} = \&rep_list_spin_1;
  $fcns{2} = \&rep_list_spin_2;
  $fcns{3} = \&rep_list_spin_3;
  $fcns{4} = \&rep_list_spin_4;

  my $ref = "";
  if ( exists $fcns{$spin} )
  {
    $ref = $fcns{$spin}; 
  }
  else
  {
    my @kys = keys %fcns; 
    die( "error, supported spins are " . @kys . "\n" );
  }

  return &$ref($parity);
}



#
##
###
###########
sub rep_list_spin_0
{
  my $parity = $_[0]; 

  my %ret = (); 
  my $rep = "";

  # etap = parity
  if ( $parity eq "p" )
  {
    $rep = "A1";
  }
  elsif ( $parity eq "m" )
  {
    $rep = "A2";
  }
  else
  {
    die ( " parity must be either p or m , parity : $parity ");
  }

  my %rest = (); 
  $rest{ "A1" } = "";

  my %D2 = (); 
  $D2{ "D2" . $rep } = "H0";

  my %D3 = (); 
  $D3{ "D3" . $rep } = "H0";

  my %D4 = (); 
  $D4{ "D4" . $rep } = "H0";


  $ret { "p000" } = \%rest; 
  $ret { "p100" } = \%D4; 
  $ret { "p110" } = \%D2; 
  $ret { "p111" } = \%D3; 
  $ret { "p200" } = \%D4; 

  return \%ret; 

}



#
##
###
###########
sub rep_list_spin_1
{
  my $parity = $_[0]; 

  my %ret = (); 
  my $rep = "";

  # etap = -parity
  if ( $parity eq "p" )
  {
    $rep = "A2";
  }
  elsif ( $parity eq "m" )
  {
    $rep = "A1";
  }
  else
  {
    die ( " parity must be either p or m , parity : $parity ");
  }

  my %rest = (); 
  $rest{ "T1" } = "";

  my %D2 = (); 
  $D2{ "D2" . $rep } = "H0";
  $D2{ "D2B1" } = "H1";
  $D2{ "D2B2" } = "H1";

  my %D3 = (); 
  $D3{ "D3" . $rep } = "H0";
  $D3{ "D3E2" } = "H1";

  my %D4 = (); 
  $D4{ "D4" . $rep } = "H0";
  $D4{ "D4E2" } = "H1";


  $ret { "p000" } = \%rest; 
  $ret { "p100" } = \%D4; 
  $ret { "p110" } = \%D2; 
  $ret { "p111" } = \%D3; 
  $ret { "p200" } = \%D4; 

  return \%ret; 

}


#
##
###
###########
sub rep_list_spin_2
{
  my $parity = $_[0]; 

  my %ret = (); 
  my $rep = "";

  # etap = parity
  if ( $parity eq "p" )
  {
    $rep = "A1";
  }
  elsif ( $parity eq "m" )
  {
    $rep = "A2";
  }
  else
  {
    die ( " parity must be either p or m , parity : $parity ");
  }

  my %rest = (); 
  $rest{ "T2" } = "";
  $rest{ "E" } = "";

  my %D2 = (); 
  $D2{ "D2" . $rep } = "H0";
  $D2{ "D2B1" } = "H1";
  $D2{ "D2B2" } = "H1";
  $D2{ "D2A1" } = "H2";
  $D2{ "D2A2" } = "H2";

  my %D3 = (); 
  $D3{ "D3" . $rep } = "H0";
  $D3{ "D3E2" } = "H1";
  $D3{ "D3E2" } = "H2";

  my %D4 = (); 
  $D4{ "D4" . $rep } = "H0";
  $D4{ "D4E2" } = "H1";
  $D4{ "D4B1" } = "H2";
  $D4{ "D4B2" } = "H2";


  $ret { "p000" } = \%rest; 
  $ret { "p100" } = \%D4; 
  $ret { "p110" } = \%D2; 
  $ret { "p111" } = \%D3; 
  $ret { "p200" } = \%D4; 

  return \%ret; 

}



#
##
###
###########
sub rep_list_spin_3
{
  my $parity = $_[0]; 

  my %ret = (); 
  my $rep = "";

  # etap = -parity
  if ( $parity eq "p" )
  {
    $rep = "A2";
  }
  elsif ( $parity eq "m" )
  {
    $rep = "A1";
  }
  else
  {
    die ( " parity must be either p or m , parity : $parity ");
  }

  my %rest = (); 
  $rest{ "T1" } = "";
  $rest{ "T2" } = "";
  $rest{ "A2" } = "";

  my %D2 = (); 
  $D2{ "D2" . $rep } = "H0";
  $D2{ "D2B1" } = "H1";
  $D2{ "D2B2" } = "H1";
  $D2{ "D2A1" } = "H2";
  $D2{ "D2A2" } = "H2";
  $D2{ "D2B1" } = "H3";
  $D2{ "D2B2" } = "H3";

  my %D3 = (); 
  $D3{ "D3" . $rep } = "H0";
  $D3{ "D3E2" } = "H1";
  $D3{ "D3E2" } = "H2";
  $D3{ "D3A1" } = "H3";
  $D3{ "D3A2" } = "H3";

  my %D4 = (); 
  $D4{ "D4" . $rep } = "H0";
  $D4{ "D4E2" } = "H1";
  $D4{ "D4B1" } = "H2";
  $D4{ "D4B2" } = "H2";
  $D4{ "D4E2" } = "H3";


  $ret { "p000" } = \%rest; 
  $ret { "p100" } = \%D4; 
  $ret { "p110" } = \%D2; 
  $ret { "p111" } = \%D3; 
  $ret { "p200" } = \%D4; 

  return \%ret; 

}


#
##
###
###########
sub rep_list_spin_4
{
  my $parity = $_[0]; 

  my %ret = (); 
  my $rep = "";

  # etap = parity
  if ( $parity eq "p" )
  {
    $rep = "A1";
  }
  elsif ( $parity eq "m" )
  {
    $rep = "A2";
  }
  else
  {
    die ( " parity must be either p or m , parity : $parity ");
  }

  my %rest = (); 
  $rest{ "T1" } = "";
  $rest{ "T2" } = "";
  $rest{ "A1" } = "";
  $rest{ "E" } = "";

  my %D2 = (); 
  $D2{ "D2" . $rep } = "H0";
  $D2{ "D2B1" } = "H1";
  $D2{ "D2B2" } = "H1";
  $D2{ "D2A1" } = "H2";
  $D2{ "D2A2" } = "H2";
  $D2{ "D2B1" } = "H3";
  $D2{ "D2B2" } = "H3";
  $D2{ "D2A1" } = "H4";
  $D2{ "D2A2" } = "H4";

  my %D3 = (); 
  $D3{ "D3" . $rep } = "H0";
  $D3{ "D3E2" } = "H1";
  $D3{ "D3E2" } = "H2";
  $D3{ "D3A1" } = "H3";
  $D3{ "D3A2" } = "H3";
  $D3{ "D3E2" } = "H4";

  my %D4 = (); 
  $D4{ "D4" . $rep } = "H0";
  $D4{ "D4E2" } = "H1";
  $D4{ "D4B1" } = "H2";
  $D4{ "D4B2" } = "H2";
  $D4{ "D4E2" } = "H3";
  $D4{ "D4A1" } = "H4";
  $D4{ "D4A2" } = "H4";


  $ret { "p000" } = \%rest; 
  $ret { "p100" } = \%D4; 
  $ret { "p110" } = \%D2; 
  $ret { "p111" } = \%D3; 
  $ret { "p200" } = \%D4; 

  return \%ret; 

}


#
##
###
###########
sub print_header_perl
{

  print OUT <<EOF
#!/usr/bin/perl -w
#
# this is some auto generated perl skeleton
# and should not be assumed to be correct or
# work in the way you think it should
#


use strict; 
use OPparams; 
use File::Basename;

my \$basedir = dirname(\$0); 

require "\${basedir}/OPparams.work.multiparticle.pl";

my \@all_ops = (); 

EOF

}



#
##
###
###########
sub print_single_op
{
  my ($pid, $rep , $rep_stem , $mom , $twoI_z, $ncfg , $ensemble , $recon_dir ,$spin ) = @_;  
  my $p = "\$${pid}_${mom}_${rep_stem}";


  print OUT <<EOF;

  my $p = OPparams->new();
  $p->pid(\"$pid\");
  $p->irrep(\"$rep\");
  $p->irrep_stem(\"$rep_stem\");
  $p->mom(\"$mom\"); 
  $p->twoI_z($twoI_z); 
  $p->ncfg($ncfg);
  $p->spin($spin);
  $p->ensemble(\"$ensemble\"); 
  $p->recon_dir(\"$recon_dir\");
  $p->t0(-1);
  $p->state(-1); 
  $p->tz(-1);
  $p->phaser(1.);
  $p->recon_version(\"single_meson\"); 
  $p->nested(undef); 
  $p->recon_ws(undef); 
EOF

  return $p; 
}


#
##
###
###########
sub print_ops
{

  my ($pid, $twoI_z, $ncfg , $ensemble , $recon_dir , $spin, $hashr ) = @_;  


  my %hash = %{ $hashr };
  my @kys = keys %hash; 

  @kys = sort { $a cmp $b } @kys; 

  my @all_ops = (); 

  foreach my $k (@kys)
  {
    #    print "working on $k \n";

    my $rephashr = $hash{$k};
    my %rephash = %{$rephashr};

    my @repkys = keys %rephash;

    @repkys = sort { $a cmp $b } @repkys;

    foreach my $rk (@repkys)
    {
      print "mom = $k rep = $rk \n"; 
      push @all_ops , &print_single_op($pid , $rk , $rephash{$rk}.$rk , $k, $twoI_z , $ncfg , $ensemble , $recon_dir , $spin); 
    }
  } 


  print OUT <<EOF;


  my \@all_operators = (); 
EOF



  foreach my $p (@all_ops)
  {
    print OUT <<EOF;
  push \@all_operators , $p; 
EOF
  }

}


#
##
###
###########
sub print_trailer_perl
{

  my $pid = shift; 

  print OUT <<EOF;


  my \@extracts = (); 
  my \@list_extracts = (); 
  my \@plot_list = (); 
  foreach my \$op (\@all_operators)
  {
    # this one makes a list file for the plots
    push \@plot_list , &run_extract_all_v_coeffs_svd(\$op); 

    # need to be careful about single vs multiparticle xml extraction
    # here , also always be wary of weighting shifting 
    if( ( \$op->recon_version() eq "single_meson" )
      || (\$op->recon_version() eq "ancient" ) 
      || (\$op->recon_version() eq "single_meson.convert") )

    {
      push \@list_extracts , &run_extract_all_v_coeffs_svd(\$op); 
    }
    else
    {
      push \@extracts,  &run_extract_all_v_coeffs_xml(\$op); 
    }
  }

  &make_proj_plots(\\\@plot_list,\"$pid\");

  my \$listfile = &finish_proj_xml(\\\@extracts,\\\@list_extracts,\"$pid\"); 

  &write_radmat_xml(\\\@all_operators); 

  &serialize_ops_list( \"$pid.perl.xml\" , \\\@all_operators ); 
EOF


}


#
##
###
###########
sub write_radmat_xml
{
  my $ref = shift; 
  my @all_ops = @{$ref};
  my %hash = (); 
  my $dir = `pwd`;
  chomp $dir;  
  my $rdir = $dir . "/radmat";
  mkdir $rdir unless -d $rdir;

  #move down
  chdir $rdir; 

  # a month later I am sorry for writing this..eww
  # six months later I'm no longer sure how it even works 
  foreach my $op (@all_ops)
  {
    my %h = %{ $op->write_mass_overlap_xml() };

    # hash slicing -- keys are op names which are unique
    # so this is a safe but cryptic operation 
    @hash{ keys %h } = values %h ; 
  }

  # make some lists so we can do that radmat thing later 
  open OUT , ">" , "mass_overlap_xml_files.list";
  foreach my $k (keys %hash)
  {
    print OUT $k . "\n";
  }
  close OUT; 

  open OUT , ">" , "mass_overlap_sdbs.list"; 
  foreach my $v (values %hash) 
  {
    print OUT $v . "\n";
  }
  close OUT; 

  #move back out
  chdir $dir; 
}



sub copy_file
{
  my ($f,$dest) = @_; 

  die ( "ERROR : $f doesnot exist \n" ) unless ( -f $f );


  if ( -f $dest ) 
  {
    unlink $dest; 
  }

  copy($f,$dest) || die ("could not copy $f to $dest \n $_");  

}


#
##
###
#

###########
# run the nested extract 
sub run_extract_all_v_coeffs_xml
{
  my $op = shift;
  my $base = `pwd`;
  chomp $base;  
  my $destdir = $op->recon_dir(); 

#  my $loc = "/u/home/rbriceno/git/scripts_cjs/optimized_operators/";
  my $loc = "$ENV{'HOME'}/git/scripts_cjs/optimized_operators/";
  my $exe = $loc ."extract_all_v_coeffs_xml.pl";
  my $t0 = $op->t0(); 
  my $tz = $op->tz(); 
  my $state = $op->state(); 
  my $opslistfile = "ops_phases";
  my $opname = $op->op_name(); 

  my $outfile = $opname . ".xml"; 
  my $secondary_xml = "";

  if(  $op->nested()  )
  {
    my @nest = @{$op->nested()}; 

    foreach my $nested (@nest)
    {
      $secondary_xml .= " $nested"; 
    }
  }

  my $run = "${exe} $outfile $t0 $tz $opslistfile $state $opname $secondary_xml > $outfile.log";

  chdir $destdir || die ( $_ ); 

  my $script =  "${opname}.extract_command.csh"; 
  open OP , ">" , $script; 
  print OP "#/bin/tcsh \n";
  print OP $run ." \n"; 
  close OP;

  # for some reason they go 0644 for me..
  chmod 0755 , $exe;
  chmod 0755 , $script; 

  system ( " ./${script} " ) == 0 || die ( "some problem for $run \n in $destdir \n" ) ; 


  chdir $base || die ( $_ );


  copy_file($destdir."/".$outfile , $outfile);

  return $outfile; 
}


#
##
###
###########
# a single particle extract, must be followed by a convert 
sub run_extract_all_v_coeffs_svd
{
  my $op = shift;
  my $base = `pwd`;
  chomp $base;  
  my $destdir = $op->recon_dir(); 

  my $loc = "$ENV{'HOME'}/git/scripts_cjs/optimized_operators/";
  my $exe = $loc ."extract_all_v_coeffs_svd.pl";
  my $t0 = $op->t0(); 
  my $tz = $op->tz(); 
  my $state = $op->state(); 
  my $opslistfile = "ops_phases";
  my $opname = $op->op_name(); 
  my $outfile = $opname . ".list"; 

  my $run = "${exe} $t0 $tz $state $opslistfile $opname > $outfile";

  if( $op->recon_version() eq "ancient" )
  {
    print "WARNING: using an ancient version of correlators\n";
    $exe = $loc . "extract_all_v_coeffs_ancient.pl";
    my $converter = $loc . "convert_old_to_new_pion_proj_list.pl";
    $run = "${exe} $t0 $tz $state $opslistfile $opname | $converter > $outfile";
  }

  if( $op->recon_version() eq "single_meson.convert")
  {
    print "WARNING: putting a pion prefix on all ops\n";
    my $converter = $loc . "convert_old_to_new_pion_proj_list.pl";
    $run = "${exe} $t0 $tz $state $opslistfile $opname | $converter > $outfile";
  }

  chdir $destdir || die ( "unable to move to $destdir" ); 

  my $script =  "${opname}.extract_command.csh"; 
  open OP , ">" , $script || die("unable to open $script in $destdir"); 
  print OP "#/bin/tcsh \n";
  print OP $run ." \n"; 
  close OP;

  # for some reason they go 0644 for me..
  chmod 0755 , $exe;
  chmod 0755 , $script; 

  system ( " ./${script} " ) == 0 || die ( "some problem for $run \n in $destdir \n" ) ; 


  chdir $base || die ( $_ );


  copy_file($destdir."/".$outfile , $outfile);

  return $outfile; 
}

#
##
###
###########

sub silly_split
{
  my ($f,$regrep,$index) = @_; 
  my @foo = split $f , /$regrep/ ; 
  return $foo[$index]; 
}



#
##
###
###########

sub finish_proj_xml
{
  my ( $xml_list, $list_list , $id ) = @_; 

  my @lists = @{$list_list};
  my @xmls = @{$xml_list}; 

  my $listf = "weights." . $id . ".list";
  my $xmlf = "weights." . $id . ".xml";

  unlink $listf unless ! -f $listf; 
  unlink $xmlf unless ! -f $xmlf; 

  open OUT , ">" , $listf; 

  foreach my $l (@lists)
  {
    open IN , "<" , $l; 
    print OUT while <IN>; 
    close IN; 
  } 

  close OUT; 

  # guard completely empty files, the xpath and nodeset codes
  # complain about </Key> synatax since they(we) are stupid 
  if( ! -z $listf ) 
  {
    my $tmp_xml = $listf . ".xml";
    my $loc = "$ENV{'HOME'}/git/scripts_cjs/optimized_operators/";
    my $exe = $loc . "convert_proj_list_to_irrep_op_xml.pl";
    die ("$exe not present") unless -f $exe;
    system (" cat $listf | ${exe} > $tmp_xml ") == 0 || die($_); 

    push @xmls , $tmp_xml;
  }


  open OUT , ">" , $xmlf; 
  print OUT <<EOF;
<?xml version="1.0"?>
<ProjectedOps>
EOF

  foreach my $xml (@xmls)
  {
    print "extracting $xml \n";
    my $gobs_of_xml = `print_nodeset $xml /ProjectedOps | tail -n +5 | head -n -2`;
    print OUT $gobs_of_xml; 
  }

  print OUT <<EOF;
</ProjectedOps>
EOF

  return $listf;  
}

#
##
###
###########
sub make_proj_plots
{
  my ($ref,$id) = @_; 
  my @lists = @{$ref};

  my $listf = "weights." . $id . ".plot.list";

  unlink $listf unless ! -f $listf; 

  open OUT , ">" , $listf; 

  foreach my $l (@lists)
  {
    open IN , "<" , $l; 
    print OUT while <IN>; 
    close IN; 
  } 

  close OUT; 

  my $loc = "$ENV{'HOME'}/git/scripts_cjs/optimized_operators/";
  my $exe = $loc . "plot_proj_op_coeffs.pl"; 

  die ( "$exe not present" ) unless -f $exe; 

  system ( " ${exe} $listf " ) == 0 || die ($_); 
}

#
##
###
###########
sub serialize_ops_list
{
  my ($f , $aref)  = @_; 

  my @mass_calc = (); 
  foreach my $op (@{$aref})
  {
    $op->calc_mass(); 
    push @mass_calc , $op;
  }

  my $dump = XML::Dumper->new(); 
  $dump->pl2xml( \@mass_calc , $f ); 
}

1;  # for require 
