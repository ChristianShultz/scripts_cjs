#!/usr/bin/perl -w
#
# this is some auto generated perl skeleton
# and should not be assumed to be correct or
# work in the way you think it should
#


use strict; 
use OPparams; 
use File::Basename;

my $basedir = dirname($0); 

require "${basedir}/OPparams.work.pl";

my @all_ops = (); 


  my $vec_hyb_p000_T1 = OPparams->new();
  $vec_hyb_p000_T1->pid("vec_hyb");
  $vec_hyb_p000_T1->irrep("T1");
  $vec_hyb_p000_T1->irrep_stem("T1");
  $vec_hyb_p000_T1->mom("p000"); 
  $vec_hyb_p000_T1->twoI_z(2); 
  $vec_hyb_p000_T1->ncfg(535);
  $vec_hyb_p000_T1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $vec_hyb_p000_T1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/T1mM");
  $vec_hyb_p000_T1->t0(8);
  $vec_hyb_p000_T1->state(1); 
  $vec_hyb_p000_T1->tz(16);
  $vec_hyb_p000_T1->phaser(1.);

  my $vec_hyb_p100_H0D4A1 = OPparams->new();
  $vec_hyb_p100_H0D4A1->pid("vec_hyb");
  $vec_hyb_p100_H0D4A1->irrep("D4A1");
  $vec_hyb_p100_H0D4A1->irrep_stem("H0D4A1");
  $vec_hyb_p100_H0D4A1->mom("p100"); 
  $vec_hyb_p100_H0D4A1->twoI_z(2); 
  $vec_hyb_p100_H0D4A1->ncfg(535);
  $vec_hyb_p100_H0D4A1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $vec_hyb_p100_H0D4A1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/D4A1M_mom1");
  $vec_hyb_p100_H0D4A1->t0(8);
  $vec_hyb_p100_H0D4A1->state(3); 
  $vec_hyb_p100_H0D4A1->tz(16);
  $vec_hyb_p100_H0D4A1->phaser(1.);

  my $vec_hyb_p100_H1D4E2 = OPparams->new();
  $vec_hyb_p100_H1D4E2->pid("vec_hyb");
  $vec_hyb_p100_H1D4E2->irrep("D4E2");
  $vec_hyb_p100_H1D4E2->irrep_stem("H1D4E2");
  $vec_hyb_p100_H1D4E2->mom("p100"); 
  $vec_hyb_p100_H1D4E2->twoI_z(2); 
  $vec_hyb_p100_H1D4E2->ncfg(535);
  $vec_hyb_p100_H1D4E2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $vec_hyb_p100_H1D4E2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/");
  $vec_hyb_p100_H1D4E2->t0(-1);
  $vec_hyb_p100_H1D4E2->state(-1); 
  $vec_hyb_p100_H1D4E2->tz(-1);
  $vec_hyb_p100_H1D4E2->phaser(1.);

  my $vec_hyb_p110_H0D2A1 = OPparams->new();
  $vec_hyb_p110_H0D2A1->pid("vec_hyb");
  $vec_hyb_p110_H0D2A1->irrep("D2A1");
  $vec_hyb_p110_H0D2A1->irrep_stem("H0D2A1");
  $vec_hyb_p110_H0D2A1->mom("p110"); 
  $vec_hyb_p110_H0D2A1->twoI_z(2); 
  $vec_hyb_p110_H0D2A1->ncfg(535);
  $vec_hyb_p110_H0D2A1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $vec_hyb_p110_H0D2A1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/");
  $vec_hyb_p110_H0D2A1->t0(-1);
  $vec_hyb_p110_H0D2A1->state(-1); 
  $vec_hyb_p110_H0D2A1->tz(-1);
  $vec_hyb_p110_H0D2A1->phaser(1.);

  my $vec_hyb_p110_H1D2B1 = OPparams->new();
  $vec_hyb_p110_H1D2B1->pid("vec_hyb");
  $vec_hyb_p110_H1D2B1->irrep("D2B1");
  $vec_hyb_p110_H1D2B1->irrep_stem("H1D2B1");
  $vec_hyb_p110_H1D2B1->mom("p110"); 
  $vec_hyb_p110_H1D2B1->twoI_z(2); 
  $vec_hyb_p110_H1D2B1->ncfg(535);
  $vec_hyb_p110_H1D2B1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $vec_hyb_p110_H1D2B1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/");
  $vec_hyb_p110_H1D2B1->t0(-1);
  $vec_hyb_p110_H1D2B1->state(-1); 
  $vec_hyb_p110_H1D2B1->tz(-1);
  $vec_hyb_p110_H1D2B1->phaser(1.);

  my $vec_hyb_p110_H1D2B2 = OPparams->new();
  $vec_hyb_p110_H1D2B2->pid("vec_hyb");
  $vec_hyb_p110_H1D2B2->irrep("D2B2");
  $vec_hyb_p110_H1D2B2->irrep_stem("H1D2B2");
  $vec_hyb_p110_H1D2B2->mom("p110"); 
  $vec_hyb_p110_H1D2B2->twoI_z(2); 
  $vec_hyb_p110_H1D2B2->ncfg(535);
  $vec_hyb_p110_H1D2B2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $vec_hyb_p110_H1D2B2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/");
  $vec_hyb_p110_H1D2B2->t0(-1);
  $vec_hyb_p110_H1D2B2->state(-1); 
  $vec_hyb_p110_H1D2B2->tz(-1);
  $vec_hyb_p110_H1D2B2->phaser(1.);

  my $vec_hyb_p111_H0D3A1 = OPparams->new();
  $vec_hyb_p111_H0D3A1->pid("vec_hyb");
  $vec_hyb_p111_H0D3A1->irrep("D3A1");
  $vec_hyb_p111_H0D3A1->irrep_stem("H0D3A1");
  $vec_hyb_p111_H0D3A1->mom("p111"); 
  $vec_hyb_p111_H0D3A1->twoI_z(2); 
  $vec_hyb_p111_H0D3A1->ncfg(535);
  $vec_hyb_p111_H0D3A1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $vec_hyb_p111_H0D3A1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/");
  $vec_hyb_p111_H0D3A1->t0(-1);
  $vec_hyb_p111_H0D3A1->state(-1); 
  $vec_hyb_p111_H0D3A1->tz(-1);
  $vec_hyb_p111_H0D3A1->phaser(1.);

  my $vec_hyb_p111_H1D3E2 = OPparams->new();
  $vec_hyb_p111_H1D3E2->pid("vec_hyb");
  $vec_hyb_p111_H1D3E2->irrep("D3E2");
  $vec_hyb_p111_H1D3E2->irrep_stem("H1D3E2");
  $vec_hyb_p111_H1D3E2->mom("p111"); 
  $vec_hyb_p111_H1D3E2->twoI_z(2); 
  $vec_hyb_p111_H1D3E2->ncfg(535);
  $vec_hyb_p111_H1D3E2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $vec_hyb_p111_H1D3E2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/");
  $vec_hyb_p111_H1D3E2->t0(-1);
  $vec_hyb_p111_H1D3E2->state(-1); 
  $vec_hyb_p111_H1D3E2->tz(-1);
  $vec_hyb_p111_H1D3E2->phaser(1.);

  my $vec_hyb_p200_H0D4A1 = OPparams->new();
  $vec_hyb_p200_H0D4A1->pid("vec_hyb");
  $vec_hyb_p200_H0D4A1->irrep("D4A1");
  $vec_hyb_p200_H0D4A1->irrep_stem("H0D4A1");
  $vec_hyb_p200_H0D4A1->mom("p200"); 
  $vec_hyb_p200_H0D4A1->twoI_z(2); 
  $vec_hyb_p200_H0D4A1->ncfg(535);
  $vec_hyb_p200_H0D4A1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $vec_hyb_p200_H0D4A1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/");
  $vec_hyb_p200_H0D4A1->t0(-1);
  $vec_hyb_p200_H0D4A1->state(-1); 
  $vec_hyb_p200_H0D4A1->tz(-1);
  $vec_hyb_p200_H0D4A1->phaser(1.);

  my $vec_hyb_p200_H1D4E2 = OPparams->new();
  $vec_hyb_p200_H1D4E2->pid("vec_hyb");
  $vec_hyb_p200_H1D4E2->irrep("D4E2");
  $vec_hyb_p200_H1D4E2->irrep_stem("H1D4E2");
  $vec_hyb_p200_H1D4E2->mom("p200"); 
  $vec_hyb_p200_H1D4E2->twoI_z(2); 
  $vec_hyb_p200_H1D4E2->ncfg(535);
  $vec_hyb_p200_H1D4E2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $vec_hyb_p200_H1D4E2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/");
  $vec_hyb_p200_H1D4E2->t0(-1);
  $vec_hyb_p200_H1D4E2->state(-1); 
  $vec_hyb_p200_H1D4E2->tz(-1);
  $vec_hyb_p200_H1D4E2->phaser(1.);


  my @all_operators = (); 
  push @all_operators , $vec_hyb_p000_T1; 
  push @all_operators , $vec_hyb_p100_H0D4A1; 
  push @all_operators , $vec_hyb_p100_H1D4E2; 
  push @all_operators , $vec_hyb_p110_H0D2A1; 
  push @all_operators , $vec_hyb_p110_H1D2B1; 
  push @all_operators , $vec_hyb_p110_H1D2B2; 
  push @all_operators , $vec_hyb_p111_H0D3A1; 
  push @all_operators , $vec_hyb_p111_H1D3E2; 
  push @all_operators , $vec_hyb_p200_H0D4A1; 
  push @all_operators , $vec_hyb_p200_H1D4E2; 


  my @extracts = (); 
  foreach my $op (@all_operators)
  {
    push @extracts,  &run_extract_all_v_coeffs_svd($op); 
  }

  my $listfile = &convert_proj_to_xml(\@extracts,"vec_hyb"); 

  &make_proj_plots($listfile);

  &write_radmat_xml(\@all_operators); 
