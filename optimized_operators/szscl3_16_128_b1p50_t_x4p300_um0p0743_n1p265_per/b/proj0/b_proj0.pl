#!/usr/bin/perl -w
#
# this is some auto generated perl skeleton
# and should not be assumed to be correct or
# work in the way you think it should
#


use strict; 
use OPparams; 
use File::Basename;
use QuarkModelAssign; 

my $basedir = dirname($0); 

require "${basedir}/OPparams.work.pl";

my @all_ops = (); 


  my $b_proj0_p000_A1 = OPparams->new();
  $b_proj0_p000_A1->pid("b_proj0");
  $b_proj0_p000_A1->irrep("A1");
  $b_proj0_p000_A1->irrep_stem("A1");
  $b_proj0_p000_A1->mom("p000"); 
  $b_proj0_p000_A1->twoI_z(2); 
  $b_proj0_p000_A1->ncfg(535);
  $b_proj0_p000_A1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $b_proj0_p000_A1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/A1pP");
  $b_proj0_p000_A1->t0(9);
  $b_proj0_p000_A1->state(0); 
  $b_proj0_p000_A1->tz(10);
  $b_proj0_p000_A1->phaser(1.);
  $b_proj0_p000_A1->spin(0);
  $b_proj0_p000_A1->hybrid(1);
  $b_proj0_p000_A1->quark_model_assignment(QuarkModelAssign::qm_assign("3P1xB->0"));

  my @all_operators = (); 
  push @all_operators , $b_proj0_p000_A1; 


  my @extracts = (); 
  foreach my $op (@all_operators)
  {
    push @extracts,  &run_extract_all_v_coeffs_svd($op); 
  }

  my $listfile = &convert_proj_to_xml(\@extracts,"b_proj0"); 

  &make_proj_plots($listfile);

  &write_radmat_xml(\@all_operators); 
  
  &serialize_ops_list( "b_proj0.perl.xml" , \@all_operators ); 
