#!/usr/bin/perl -w
#
# this is some auto generated perl skeleton
# and should not be assumed to be correct or
# work in the way you think it should
#

BEGIN{
  push ( @INC , "/u/home/shultz/optimized_operators") ; 
}

use strict; 
use OPparams; 
use File::Basename;

my $basedir = dirname($0); 

require "${basedir}/OPparams.work.pl";

my @all_ops = (); 


  my $a0_proj0_p000_A1 = OPparams->new();
  $a0_proj0_p000_A1->pid("a0_proj0");
  $a0_proj0_p000_A1->irrep("A1");
  $a0_proj0_p000_A1->irrep_stem("A1");
  $a0_proj0_p000_A1->mom("p000"); 
  $a0_proj0_p000_A1->twoI_z(2); 
  $a0_proj0_p000_A1->ncfg(535);
  $a0_proj0_p000_A1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $a0_proj0_p000_A1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/A1pM.shifted");
  $a0_proj0_p000_A1->t0(6);
  $a0_proj0_p000_A1->state(0); 
  $a0_proj0_p000_A1->tz(10);
  $a0_proj0_p000_A1->phaser(1.);


  my $a0_proj0_p100_H0D4A1 = OPparams->new();
  $a0_proj0_p100_H0D4A1->pid("a0_proj0");
  $a0_proj0_p100_H0D4A1->irrep("D4A1");
  $a0_proj0_p100_H0D4A1->irrep_stem("H0D4A1");
  $a0_proj0_p100_H0D4A1->mom("p100"); 
  $a0_proj0_p100_H0D4A1->twoI_z(2); 
  $a0_proj0_p100_H0D4A1->ncfg(535);
  $a0_proj0_p100_H0D4A1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $a0_proj0_p100_H0D4A1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/D4A1M_mom1");
  $a0_proj0_p100_H0D4A1->t0(-1);
  $a0_proj0_p100_H0D4A1->state(-1); 
  $a0_proj0_p100_H0D4A1->tz(-1);
  $a0_proj0_p100_H0D4A1->phaser(1.);


  my $a0_proj0_p110_H0D2A1 = OPparams->new();
  $a0_proj0_p110_H0D2A1->pid("a0_proj0");
  $a0_proj0_p110_H0D2A1->irrep("D2A1");
  $a0_proj0_p110_H0D2A1->irrep_stem("H0D2A1");
  $a0_proj0_p110_H0D2A1->mom("p110"); 
  $a0_proj0_p110_H0D2A1->twoI_z(2); 
  $a0_proj0_p110_H0D2A1->ncfg(535);
  $a0_proj0_p110_H0D2A1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $a0_proj0_p110_H0D2A1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/D2A1M_mom2");
  $a0_proj0_p110_H0D2A1->t0(-1);
  $a0_proj0_p110_H0D2A1->state(-1); 
  $a0_proj0_p110_H0D2A1->tz(-1);
  $a0_proj0_p110_H0D2A1->phaser(1.);


  my $a0_proj0_p111_H0D3A1 = OPparams->new();
  $a0_proj0_p111_H0D3A1->pid("a0_proj0");
  $a0_proj0_p111_H0D3A1->irrep("D3A1");
  $a0_proj0_p111_H0D3A1->irrep_stem("H0D3A1");
  $a0_proj0_p111_H0D3A1->mom("p111"); 
  $a0_proj0_p111_H0D3A1->twoI_z(2); 
  $a0_proj0_p111_H0D3A1->ncfg(535);
  $a0_proj0_p111_H0D3A1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $a0_proj0_p111_H0D3A1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/D3A1M_mom3");
  $a0_proj0_p111_H0D3A1->t0(-1);
  $a0_proj0_p111_H0D3A1->state(-1); 
  $a0_proj0_p111_H0D3A1->tz(-1);
  $a0_proj0_p111_H0D3A1->phaser(1.);


  my $a0_proj0_p200_H0D4A1 = OPparams->new();
  $a0_proj0_p200_H0D4A1->pid("a0_proj0");
  $a0_proj0_p200_H0D4A1->irrep("D4A1");
  $a0_proj0_p200_H0D4A1->irrep_stem("H0D4A1");
  $a0_proj0_p200_H0D4A1->mom("p200"); 
  $a0_proj0_p200_H0D4A1->twoI_z(2); 
  $a0_proj0_p200_H0D4A1->ncfg(535);
  $a0_proj0_p200_H0D4A1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $a0_proj0_p200_H0D4A1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/D4A1M_mom4");
  $a0_proj0_p200_H0D4A1->t0(-1);
  $a0_proj0_p200_H0D4A1->state(-1); 
  $a0_proj0_p200_H0D4A1->tz(-1);
  $a0_proj0_p200_H0D4A1->phaser(1.);



  my @all_operators = (); 
  push @all_operators , $a0_proj0_p000_A1; 
  push @all_operators , $a0_proj0_p100_H0D4A1; 
  push @all_operators , $a0_proj0_p110_H0D2A1; 
  push @all_operators , $a0_proj0_p111_H0D3A1; 
  push @all_operators , $a0_proj0_p200_H0D4A1; 


  my @extracts = (); 
  foreach my $op (@all_operators)
  {
    push @extracts,  &run_extract_all_v_coeffs_svd($op); 
  }

  my $listfile = &convert_proj_to_xml(\@extracts,"a0_proj0"); 

  &make_proj_plots($listfile);

  &write_radmat_xml(\@all_operators); 
