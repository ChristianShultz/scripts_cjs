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


  my $pion_proj7_p000_E = OPparams->new();
  $pion_proj7_p000_E->pid("pion_proj7");
  $pion_proj7_p000_E->irrep("E");
  $pion_proj7_p000_E->irrep_stem("E");
  $pion_proj7_p000_E->mom("p000"); 
  $pion_proj7_p000_E->twoI_z(2); 
  $pion_proj7_p000_E->ncfg(535);
  $pion_proj7_p000_E->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $pion_proj7_p000_E->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/EmM");
  $pion_proj7_p000_E->t0(9);
  $pion_proj7_p000_E->state(1); 
  $pion_proj7_p000_E->tz(10);
  $pion_proj7_p000_E->phaser(1.);
  $pion_proj7_p000_E->hybrid(1); 
  $pion_proj7_p000_E->spin(2);
  $pion_proj7_p000_E->quark_model_assignment(QuarkModelAssign::qm_assign("3S1xB->2"));

  my $pion_proj7_p000_T2 = OPparams->new();
  $pion_proj7_p000_T2->pid("pion_proj7");
  $pion_proj7_p000_T2->irrep("T2");
  $pion_proj7_p000_T2->irrep_stem("T2");
  $pion_proj7_p000_T2->mom("p000"); 
  $pion_proj7_p000_T2->twoI_z(2); 
  $pion_proj7_p000_T2->ncfg(535);
  $pion_proj7_p000_T2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $pion_proj7_p000_T2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/T2mM");
  $pion_proj7_p000_T2->t0(8);
  $pion_proj7_p000_T2->state(1); 
  $pion_proj7_p000_T2->tz(10);
  $pion_proj7_p000_T2->phaser(1.);
  $pion_proj7_p000_T2->hybrid(1);
  $pion_proj7_p000_T2->spin(2);

#  my $pion_proj7_p100_H0D4A2 = OPparams->new();
#  $pion_proj7_p100_H0D4A2->pid("pion_proj7");
#  $pion_proj7_p100_H0D4A2->irrep("D4A2");
#  $pion_proj7_p100_H0D4A2->irrep_stem("H0D4A2");
#  $pion_proj7_p100_H0D4A2->mom("p100"); 
#  $pion_proj7_p100_H0D4A2->twoI_z(2); 
#  $pion_proj7_p100_H0D4A2->ncfg(535);
#  $pion_proj7_p100_H0D4A2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
#  $pion_proj7_p100_H0D4A2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/");
#  $pion_proj7_p100_H0D4A2->t0(-1);
#  $pion_proj7_p100_H0D4A2->state(-1); 
#  $pion_proj7_p100_H0D4A2->tz(-1);
#  $pion_proj7_p100_H0D4A2->phaser(1.);
#  $pion_proj7_p100_H0D4A2->spin(2);
#
#  my $pion_proj7_p100_H2D4B1 = OPparams->new();
#  $pion_proj7_p100_H2D4B1->pid("pion_proj7");
#  $pion_proj7_p100_H2D4B1->irrep("D4B1");
#  $pion_proj7_p100_H2D4B1->irrep_stem("H2D4B1");
#  $pion_proj7_p100_H2D4B1->mom("p100"); 
#  $pion_proj7_p100_H2D4B1->twoI_z(2); 
#  $pion_proj7_p100_H2D4B1->ncfg(535);
#  $pion_proj7_p100_H2D4B1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
#  $pion_proj7_p100_H2D4B1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/");
#  $pion_proj7_p100_H2D4B1->t0(-1);
#  $pion_proj7_p100_H2D4B1->state(-1); 
#  $pion_proj7_p100_H2D4B1->tz(-1);
#  $pion_proj7_p100_H2D4B1->phaser(1.);
#  $pion_proj7_p100_H2D4B1->spin(2);
#
#  my $pion_proj7_p100_H2D4B2 = OPparams->new();
#  $pion_proj7_p100_H2D4B2->pid("pion_proj7");
#  $pion_proj7_p100_H2D4B2->irrep("D4B2");
#  $pion_proj7_p100_H2D4B2->irrep_stem("H2D4B2");
#  $pion_proj7_p100_H2D4B2->mom("p100"); 
#  $pion_proj7_p100_H2D4B2->twoI_z(2); 
#  $pion_proj7_p100_H2D4B2->ncfg(535);
#  $pion_proj7_p100_H2D4B2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
#  $pion_proj7_p100_H2D4B2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/");
#  $pion_proj7_p100_H2D4B2->t0(-1);
#  $pion_proj7_p100_H2D4B2->state(-1); 
#  $pion_proj7_p100_H2D4B2->tz(-1);
#  $pion_proj7_p100_H2D4B2->phaser(1.);
#  $pion_proj7_p100_H2D4B2->spin(2);
#
#  my $pion_proj7_p100_H1D4E2 = OPparams->new();
#  $pion_proj7_p100_H1D4E2->pid("pion_proj7");
#  $pion_proj7_p100_H1D4E2->irrep("D4E2");
#  $pion_proj7_p100_H1D4E2->irrep_stem("H1D4E2");
#  $pion_proj7_p100_H1D4E2->mom("p100"); 
#  $pion_proj7_p100_H1D4E2->twoI_z(2); 
#  $pion_proj7_p100_H1D4E2->ncfg(535);
#  $pion_proj7_p100_H1D4E2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
#  $pion_proj7_p100_H1D4E2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/");
#  $pion_proj7_p100_H1D4E2->t0(-1);
#  $pion_proj7_p100_H1D4E2->state(-1); 
#  $pion_proj7_p100_H1D4E2->tz(-1);
#  $pion_proj7_p100_H1D4E2->phaser(1.);
#  $pion_proj7_p100_H1D4E2->spin(2);
#
#  my $pion_proj7_p110_H2D2A1 = OPparams->new();
#  $pion_proj7_p110_H2D2A1->pid("pion_proj7");
#  $pion_proj7_p110_H2D2A1->irrep("D2A1");
#  $pion_proj7_p110_H2D2A1->irrep_stem("H2D2A1");
#  $pion_proj7_p110_H2D2A1->mom("p110"); 
#  $pion_proj7_p110_H2D2A1->twoI_z(2); 
#  $pion_proj7_p110_H2D2A1->ncfg(535);
#  $pion_proj7_p110_H2D2A1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
#  $pion_proj7_p110_H2D2A1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/");
#  $pion_proj7_p110_H2D2A1->t0(-1);
#  $pion_proj7_p110_H2D2A1->state(-1); 
#  $pion_proj7_p110_H2D2A1->tz(-1);
#  $pion_proj7_p110_H2D2A1->phaser(1.);
#  $pion_proj7_p110_H2D2A1->spin(2);
#
#  my $pion_proj7_p110_H2D2A2 = OPparams->new();
#  $pion_proj7_p110_H2D2A2->pid("pion_proj7");
#  $pion_proj7_p110_H2D2A2->irrep("D2A2");
#  $pion_proj7_p110_H2D2A2->irrep_stem("H2D2A2");
#  $pion_proj7_p110_H2D2A2->mom("p110"); 
#  $pion_proj7_p110_H2D2A2->twoI_z(2); 
#  $pion_proj7_p110_H2D2A2->ncfg(535);
#  $pion_proj7_p110_H2D2A2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
#  $pion_proj7_p110_H2D2A2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/");
#  $pion_proj7_p110_H2D2A2->t0(-1);
#  $pion_proj7_p110_H2D2A2->state(-1); 
#  $pion_proj7_p110_H2D2A2->tz(-1);
#  $pion_proj7_p110_H2D2A2->phaser(1.);
#  $pion_proj7_p110_H2D2A2->spin(2);
#
#  my $pion_proj7_p110_H1D2B1 = OPparams->new();
#  $pion_proj7_p110_H1D2B1->pid("pion_proj7");
#  $pion_proj7_p110_H1D2B1->irrep("D2B1");
#  $pion_proj7_p110_H1D2B1->irrep_stem("H1D2B1");
#  $pion_proj7_p110_H1D2B1->mom("p110"); 
#  $pion_proj7_p110_H1D2B1->twoI_z(2); 
#  $pion_proj7_p110_H1D2B1->ncfg(535);
#  $pion_proj7_p110_H1D2B1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
#  $pion_proj7_p110_H1D2B1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/");
#  $pion_proj7_p110_H1D2B1->t0(-1);
#  $pion_proj7_p110_H1D2B1->state(-1); 
#  $pion_proj7_p110_H1D2B1->tz(-1);
#  $pion_proj7_p110_H1D2B1->phaser(1.);
#  $pion_proj7_p110_H1D2B1->spin(2);
#
#  my $pion_proj7_p110_H1D2B2 = OPparams->new();
#  $pion_proj7_p110_H1D2B2->pid("pion_proj7");
#  $pion_proj7_p110_H1D2B2->irrep("D2B2");
#  $pion_proj7_p110_H1D2B2->irrep_stem("H1D2B2");
#  $pion_proj7_p110_H1D2B2->mom("p110"); 
#  $pion_proj7_p110_H1D2B2->twoI_z(2); 
#  $pion_proj7_p110_H1D2B2->ncfg(535);
#  $pion_proj7_p110_H1D2B2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
#  $pion_proj7_p110_H1D2B2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/");
#  $pion_proj7_p110_H1D2B2->t0(-1);
#  $pion_proj7_p110_H1D2B2->state(-1); 
#  $pion_proj7_p110_H1D2B2->tz(-1);
#  $pion_proj7_p110_H1D2B2->phaser(1.);
#  $pion_proj7_p110_H1D2B2->spin(2);
#
#  my $pion_proj7_p111_H0D3A2 = OPparams->new();
#  $pion_proj7_p111_H0D3A2->pid("pion_proj7");
#  $pion_proj7_p111_H0D3A2->irrep("D3A2");
#  $pion_proj7_p111_H0D3A2->irrep_stem("H0D3A2");
#  $pion_proj7_p111_H0D3A2->mom("p111"); 
#  $pion_proj7_p111_H0D3A2->twoI_z(2); 
#  $pion_proj7_p111_H0D3A2->ncfg(535);
#  $pion_proj7_p111_H0D3A2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
#  $pion_proj7_p111_H0D3A2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/");
#  $pion_proj7_p111_H0D3A2->t0(-1);
#  $pion_proj7_p111_H0D3A2->state(-1); 
#  $pion_proj7_p111_H0D3A2->tz(-1);
#  $pion_proj7_p111_H0D3A2->phaser(1.);
#  $pion_proj7_p111_H0D3A2->spin(2);
#
#  my $pion_proj7_p111_H2D3E2 = OPparams->new();
#  $pion_proj7_p111_H2D3E2->pid("pion_proj7");
#  $pion_proj7_p111_H2D3E2->irrep("D3E2");
#  $pion_proj7_p111_H2D3E2->irrep_stem("H2D3E2");
#  $pion_proj7_p111_H2D3E2->mom("p111"); 
#  $pion_proj7_p111_H2D3E2->twoI_z(2); 
#  $pion_proj7_p111_H2D3E2->ncfg(535);
#  $pion_proj7_p111_H2D3E2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
#  $pion_proj7_p111_H2D3E2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/");
#  $pion_proj7_p111_H2D3E2->t0(-1);
#  $pion_proj7_p111_H2D3E2->state(-1); 
#  $pion_proj7_p111_H2D3E2->tz(-1);
#  $pion_proj7_p111_H2D3E2->phaser(1.);
#  $pion_proj7_p111_H2D3E2->spin(2);
#
#  my $pion_proj7_p200_H0D4A2 = OPparams->new();
#  $pion_proj7_p200_H0D4A2->pid("pion_proj7");
#  $pion_proj7_p200_H0D4A2->irrep("D4A2");
#  $pion_proj7_p200_H0D4A2->irrep_stem("H0D4A2");
#  $pion_proj7_p200_H0D4A2->mom("p200"); 
#  $pion_proj7_p200_H0D4A2->twoI_z(2); 
#  $pion_proj7_p200_H0D4A2->ncfg(535);
#  $pion_proj7_p200_H0D4A2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
#  $pion_proj7_p200_H0D4A2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/");
#  $pion_proj7_p200_H0D4A2->t0(-1);
#  $pion_proj7_p200_H0D4A2->state(-1); 
#  $pion_proj7_p200_H0D4A2->tz(-1);
#  $pion_proj7_p200_H0D4A2->phaser(1.);
#  $pion_proj7_p200_H0D4A2->spin(2);
#
#  my $pion_proj7_p200_H2D4B1 = OPparams->new();
#  $pion_proj7_p200_H2D4B1->pid("pion_proj7");
#  $pion_proj7_p200_H2D4B1->irrep("D4B1");
#  $pion_proj7_p200_H2D4B1->irrep_stem("H2D4B1");
#  $pion_proj7_p200_H2D4B1->mom("p200"); 
#  $pion_proj7_p200_H2D4B1->twoI_z(2); 
#  $pion_proj7_p200_H2D4B1->ncfg(535);
#  $pion_proj7_p200_H2D4B1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
#  $pion_proj7_p200_H2D4B1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/");
#  $pion_proj7_p200_H2D4B1->t0(-1);
#  $pion_proj7_p200_H2D4B1->state(-1); 
#  $pion_proj7_p200_H2D4B1->tz(-1);
#  $pion_proj7_p200_H2D4B1->phaser(1.);
#  $pion_proj7_p200_H2D4B1->spin(2);
#
#  my $pion_proj7_p200_H2D4B2 = OPparams->new();
#  $pion_proj7_p200_H2D4B2->pid("pion_proj7");
#  $pion_proj7_p200_H2D4B2->irrep("D4B2");
#  $pion_proj7_p200_H2D4B2->irrep_stem("H2D4B2");
#  $pion_proj7_p200_H2D4B2->mom("p200"); 
#  $pion_proj7_p200_H2D4B2->twoI_z(2); 
#  $pion_proj7_p200_H2D4B2->ncfg(535);
#  $pion_proj7_p200_H2D4B2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
#  $pion_proj7_p200_H2D4B2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/");
#  $pion_proj7_p200_H2D4B2->t0(-1);
#  $pion_proj7_p200_H2D4B2->state(-1); 
#  $pion_proj7_p200_H2D4B2->tz(-1);
#  $pion_proj7_p200_H2D4B2->phaser(1.);
#  $pion_proj7_p200_H2D4B2->spin(2);
#
#  my $pion_proj7_p200_H1D4E2 = OPparams->new();
#  $pion_proj7_p200_H1D4E2->pid("pion_proj7");
#  $pion_proj7_p200_H1D4E2->irrep("D4E2");
#  $pion_proj7_p200_H1D4E2->irrep_stem("H1D4E2");
#  $pion_proj7_p200_H1D4E2->mom("p200"); 
#  $pion_proj7_p200_H1D4E2->twoI_z(2); 
#  $pion_proj7_p200_H1D4E2->ncfg(535);
#  $pion_proj7_p200_H1D4E2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
#  $pion_proj7_p200_H1D4E2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/");
#  $pion_proj7_p200_H1D4E2->t0(-1);
#  $pion_proj7_p200_H1D4E2->state(-1); 
#  $pion_proj7_p200_H1D4E2->tz(-1);
#  $pion_proj7_p200_H1D4E2->phaser(1.);
#  $pion_proj7_p200_H1D4E2->spin(2);


  my @all_operators = (); 
  push @all_operators , $pion_proj7_p000_E; 
  push @all_operators , $pion_proj7_p000_T2; 
#  push @all_operators , $pion_proj7_p100_H0D4A2; 
#  push @all_operators , $pion_proj7_p100_H2D4B1; 
#  push @all_operators , $pion_proj7_p100_H2D4B2; 
#  push @all_operators , $pion_proj7_p100_H1D4E2; 
#  push @all_operators , $pion_proj7_p110_H2D2A1; 
#  push @all_operators , $pion_proj7_p110_H2D2A2; 
#  push @all_operators , $pion_proj7_p110_H1D2B1; 
#  push @all_operators , $pion_proj7_p110_H1D2B2; 
#  push @all_operators , $pion_proj7_p111_H0D3A2; 
#  push @all_operators , $pion_proj7_p111_H2D3E2; 
#  push @all_operators , $pion_proj7_p200_H0D4A2; 
#  push @all_operators , $pion_proj7_p200_H2D4B1; 
#  push @all_operators , $pion_proj7_p200_H2D4B2; 
#  push @all_operators , $pion_proj7_p200_H1D4E2; 


  my @extracts = (); 
  foreach my $op (@all_operators)
  {
    push @extracts,  &run_extract_all_v_coeffs_svd($op); 
  }

  my $listfile = &convert_proj_to_xml(\@extracts,"pion_proj7"); 

  &make_proj_plots($listfile);

  &write_radmat_xml(\@all_operators); 
  
  &serialize_ops_list( "pion_proj7.perl.xml" , \@all_operators ); 
