#!/usr/bin/perl -w
#
# this is some auto generated perl skeleton
# and should not be assumed to be correct or
# work in the way you think it should
#


####### NB: this state (the hybrid) was a bit difficult to extract
#           and was not always pulled from the same t0 as the 
#           other vector states 

use strict; 
use OPparams; 
use File::Basename;
use QuarkModelAssign;

my $basedir = dirname($0); 

require "${basedir}/OPparams.work.pl";

my @all_ops = (); 


  my $rho_proj3_p000_T1 = OPparams->new();
  $rho_proj3_p000_T1->pid("rho_proj3");
  $rho_proj3_p000_T1->irrep("T1");
  $rho_proj3_p000_T1->irrep_stem("T1");
  $rho_proj3_p000_T1->mom("p000"); 
  $rho_proj3_p000_T1->twoI_z(2); 
  $rho_proj3_p000_T1->ncfg(535);
  $rho_proj3_p000_T1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $rho_proj3_p000_T1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/T1mP");
  $rho_proj3_p000_T1->t0(9);
  $rho_proj3_p000_T1->state(4); 
  $rho_proj3_p000_T1->tz(13);
  $rho_proj3_p000_T1->phaser(-1.);
  $rho_proj3_p000_T1->hybrid(1.);
  $rho_proj3_p000_T1->spin(1.);
  $rho_proj3_p000_T1->quark_model_assignment(QuarkModelAssign::qm_assign("1S0xB->1"));


  my $rho_proj3_p100_H0D4A1 = OPparams->new();
  $rho_proj3_p100_H0D4A1->pid("rho_proj3");
  $rho_proj3_p100_H0D4A1->irrep("D4A1");
  $rho_proj3_p100_H0D4A1->irrep_stem("H0D4A1");
  $rho_proj3_p100_H0D4A1->mom("p100"); 
  $rho_proj3_p100_H0D4A1->twoI_z(2); 
  $rho_proj3_p100_H0D4A1->ncfg(535);
  $rho_proj3_p100_H0D4A1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $rho_proj3_p100_H0D4A1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/D4A1P_mom1");
  $rho_proj3_p100_H0D4A1->t0(9);
  $rho_proj3_p100_H0D4A1->state(5); 
  $rho_proj3_p100_H0D4A1->tz(13);
  $rho_proj3_p100_H0D4A1->phaser(1.);
  $rho_proj3_p100_H0D4A1->hybrid(1.);
  $rho_proj3_p100_H0D4A1->spin(1);


  my $rho_proj3_p100_H1D4E2 = OPparams->new();
  $rho_proj3_p100_H1D4E2->pid("rho_proj3");
  $rho_proj3_p100_H1D4E2->irrep("D4E2");
  $rho_proj3_p100_H1D4E2->irrep_stem("H1D4E2");
  $rho_proj3_p100_H1D4E2->mom("p100"); 
  $rho_proj3_p100_H1D4E2->twoI_z(2); 
  $rho_proj3_p100_H1D4E2->ncfg(535);
  $rho_proj3_p100_H1D4E2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $rho_proj3_p100_H1D4E2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/D4E2P_mom1");
  $rho_proj3_p100_H1D4E2->t0(8);
  $rho_proj3_p100_H1D4E2->state(10); 
  $rho_proj3_p100_H1D4E2->tz(11);
  $rho_proj3_p100_H1D4E2->phaser(1.);
  $rho_proj3_p100_H1D4E2->hybrid(1);
  $rho_proj3_p100_H1D4E2->spin(1);


  # also has largest overlap onto b_a1xD2_J1__J0_H0
  # but relatively small overlap onto b_a1xD2_J1__J2_H{0,2}
  my $rho_proj3_p110_H0D2A1 = OPparams->new();
  $rho_proj3_p110_H0D2A1->pid("rho_proj3");
  $rho_proj3_p110_H0D2A1->irrep("D2A1");
  $rho_proj3_p110_H0D2A1->irrep_stem("H0D2A1");
  $rho_proj3_p110_H0D2A1->mom("p110"); 
  $rho_proj3_p110_H0D2A1->twoI_z(2); 
  $rho_proj3_p110_H0D2A1->ncfg(535);
  $rho_proj3_p110_H0D2A1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $rho_proj3_p110_H0D2A1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/D2A1P_mom2");
  $rho_proj3_p110_H0D2A1->t0(9);
  $rho_proj3_p110_H0D2A1->state(11);
  $rho_proj3_p110_H0D2A1->tz(12);
  $rho_proj3_p110_H0D2A1->phaser(1.);
  $rho_proj3_p110_H0D2A1->hybrid(1);
  $rho_proj3_p110_H0D2A1->spin(1);


  my $rho_proj3_p110_H1D2B1 = OPparams->new();
  $rho_proj3_p110_H1D2B1->pid("rho_proj3");
  $rho_proj3_p110_H1D2B1->irrep("D2B1");
  $rho_proj3_p110_H1D2B1->irrep_stem("H1D2B1");
  $rho_proj3_p110_H1D2B1->mom("p110"); 
  $rho_proj3_p110_H1D2B1->twoI_z(2); 
  $rho_proj3_p110_H1D2B1->ncfg(535);
  $rho_proj3_p110_H1D2B1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $rho_proj3_p110_H1D2B1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/D2B1P_mom2");
  $rho_proj3_p110_H1D2B1->t0(8);
  $rho_proj3_p110_H1D2B1->state(7); 
  $rho_proj3_p110_H1D2B1->tz(10);
  $rho_proj3_p110_H1D2B1->phaser(1.);
  $rho_proj3_p110_H1D2B1->hybrid(1);
  $rho_proj3_p110_H1D2B1->spin(1);

  
  my $rho_proj3_p110_H1D2B2 = OPparams->new();
  $rho_proj3_p110_H1D2B2->pid("rho_proj3");
  $rho_proj3_p110_H1D2B2->irrep("D2B2");
  $rho_proj3_p110_H1D2B2->irrep_stem("H1D2B2");
  $rho_proj3_p110_H1D2B2->mom("p110"); 
  $rho_proj3_p110_H1D2B2->twoI_z(2); 
  $rho_proj3_p110_H1D2B2->ncfg(535);
  $rho_proj3_p110_H1D2B2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $rho_proj3_p110_H1D2B2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/D2B2P_mom2");
  $rho_proj3_p110_H1D2B2->t0(9);
  $rho_proj3_p110_H1D2B2->state(11); 
  $rho_proj3_p110_H1D2B2->tz(13);
  $rho_proj3_p110_H1D2B2->phaser(1.);
  $rho_proj3_p110_H1D2B2->hybrid(1);
  $rho_proj3_p110_H1D2B2->spin(1);


  my $rho_proj3_p111_H0D3A1 = OPparams->new();
  $rho_proj3_p111_H0D3A1->pid("rho_proj3");
  $rho_proj3_p111_H0D3A1->irrep("D3A1");
  $rho_proj3_p111_H0D3A1->irrep_stem("H0D3A1");
  $rho_proj3_p111_H0D3A1->mom("p111"); 
  $rho_proj3_p111_H0D3A1->twoI_z(2); 
  $rho_proj3_p111_H0D3A1->ncfg(535);
  $rho_proj3_p111_H0D3A1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $rho_proj3_p111_H0D3A1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/D3A1P_mom3");
  $rho_proj3_p111_H0D3A1->t0(10);
  $rho_proj3_p111_H0D3A1->state(6); 
  $rho_proj3_p111_H0D3A1->tz(11);
  $rho_proj3_p111_H0D3A1->phaser(1.);
  $rho_proj3_p111_H0D3A1->hybrid(1);
  $rho_proj3_p111_H0D3A1->spin(1);


  my $rho_proj3_p111_H1D3E2 = OPparams->new();
  $rho_proj3_p111_H1D3E2->pid("rho_proj3");
  $rho_proj3_p111_H1D3E2->irrep("D3E2");
  $rho_proj3_p111_H1D3E2->irrep_stem("H1D3E2");
  $rho_proj3_p111_H1D3E2->mom("p111"); 
  $rho_proj3_p111_H1D3E2->twoI_z(2); 
  $rho_proj3_p111_H1D3E2->ncfg(535);
  $rho_proj3_p111_H1D3E2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $rho_proj3_p111_H1D3E2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/D3E2P_mom3");
  $rho_proj3_p111_H1D3E2->t0(8);
  $rho_proj3_p111_H1D3E2->state(11); 
  $rho_proj3_p111_H1D3E2->tz(11);
  $rho_proj3_p111_H1D3E2->phaser(1.);
  $rho_proj3_p111_H1D3E2->hybrid(1);
  $rho_proj3_p111_H1D3E2->spin(1);

  my $rho_proj3_p200_H0D4A1 = OPparams->new();
  $rho_proj3_p200_H0D4A1->pid("rho_proj3");
  $rho_proj3_p200_H0D4A1->irrep("D4A1");
  $rho_proj3_p200_H0D4A1->irrep_stem("H0D4A1");
  $rho_proj3_p200_H0D4A1->mom("p200"); 
  $rho_proj3_p200_H0D4A1->twoI_z(2); 
  $rho_proj3_p200_H0D4A1->ncfg(535);
  $rho_proj3_p200_H0D4A1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $rho_proj3_p200_H0D4A1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/D4A1P_mom4");
  $rho_proj3_p200_H0D4A1->t0(7);
  $rho_proj3_p200_H0D4A1->state(6); 
  $rho_proj3_p200_H0D4A1->tz(11);
  $rho_proj3_p200_H0D4A1->phaser(1.);
  $rho_proj3_p200_H0D4A1->hybrid(1);
  $rho_proj3_p200_H0D4A1->spin(1);


  
  my $rho_proj3_p200_H1D4E2 = OPparams->new();
  $rho_proj3_p200_H1D4E2->pid("rho_proj3");
  $rho_proj3_p200_H1D4E2->irrep("D4E2");
  $rho_proj3_p200_H1D4E2->irrep_stem("H1D4E2");
  $rho_proj3_p200_H1D4E2->mom("p200"); 
  $rho_proj3_p200_H1D4E2->twoI_z(2); 
  $rho_proj3_p200_H1D4E2->ncfg(535);
  $rho_proj3_p200_H1D4E2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $rho_proj3_p200_H1D4E2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/D4E2P_mom4");
  $rho_proj3_p200_H1D4E2->t0(7);
  $rho_proj3_p200_H1D4E2->state(8); 
  $rho_proj3_p200_H1D4E2->tz(10);
  $rho_proj3_p200_H1D4E2->phaser(1.);
  $rho_proj3_p200_H1D4E2->hybrid(1);
  $rho_proj3_p200_H1D4E2->spin(1);




  my @all_operators = (); 
  push @all_operators , $rho_proj3_p000_T1; 
  push @all_operators , $rho_proj3_p100_H0D4A1; 
  push @all_operators , $rho_proj3_p100_H1D4E2; 
  push @all_operators , $rho_proj3_p110_H0D2A1; 
  push @all_operators , $rho_proj3_p110_H1D2B1; 
  push @all_operators , $rho_proj3_p110_H1D2B2; 
  push @all_operators , $rho_proj3_p111_H0D3A1; 
  push @all_operators , $rho_proj3_p111_H1D3E2; 
  push @all_operators , $rho_proj3_p200_H0D4A1; 
  push @all_operators , $rho_proj3_p200_H1D4E2; 


  my @extracts = (); 
  foreach my $op (@all_operators)
  {
    push @extracts,  &run_extract_all_v_coeffs_svd($op); 
  }

  my $listfile = &convert_proj_to_xml(\@extracts,"rho_proj3"); 

  &make_proj_plots($listfile);

  &write_radmat_xml(\@all_operators); 

  &serialize_ops_list( "rho_proj3.perl.xml" , \@all_operators ); 
