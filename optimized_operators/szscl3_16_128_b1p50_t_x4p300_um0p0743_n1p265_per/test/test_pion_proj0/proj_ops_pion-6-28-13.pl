#!/usr/bin/perl -w
#
# this is some auto generated perl skeleton
# and should not be assumed to be correct or
# work in the way you think it should
#


use strict; 
use OPparams; 
use File::Basename;
use XML::Dumper; 

my $basedir = dirname($0); 

require "${basedir}/OPparams.work.pl";

my @all_ops = (); 


  my $pion_proj0_p000_A1 = OPparams->new();
  $pion_proj0_p000_A1->pid("pion_proj0");
  $pion_proj0_p000_A1->irrep("A1");
  $pion_proj0_p000_A1->irrep_stem("A1");
  $pion_proj0_p000_A1->mom("p000"); 
  $pion_proj0_p000_A1->twoI_z(2); 
  $pion_proj0_p000_A1->ncfg(535);
  $pion_proj0_p000_A1->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $pion_proj0_p000_A1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/A1mM");
  $pion_proj0_p000_A1->t0(7);
  $pion_proj0_p000_A1->state(0); 
  $pion_proj0_p000_A1->tz(17);
  $pion_proj0_p000_A1->phaser(1.);


  my $pion_proj0_p100_H0D4A2 = OPparams->new();
  $pion_proj0_p100_H0D4A2->pid("pion_proj0");
  $pion_proj0_p100_H0D4A2->irrep("D4A2");
  $pion_proj0_p100_H0D4A2->irrep_stem("H0D4A2");
  $pion_proj0_p100_H0D4A2->mom("p100"); 
  $pion_proj0_p100_H0D4A2->twoI_z(2); 
  $pion_proj0_p100_H0D4A2->ncfg(535);
  $pion_proj0_p100_H0D4A2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $pion_proj0_p100_H0D4A2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/D4A2M_mom1");
  $pion_proj0_p100_H0D4A2->t0(9);
  $pion_proj0_p100_H0D4A2->state(0); 
  $pion_proj0_p100_H0D4A2->tz(18);
  $pion_proj0_p100_H0D4A2->phaser(1.);


  my $pion_proj0_p110_H0D2A2 = OPparams->new();
  $pion_proj0_p110_H0D2A2->pid("pion_proj0");
  $pion_proj0_p110_H0D2A2->irrep("D2A2");
  $pion_proj0_p110_H0D2A2->irrep_stem("H0D2A2");
  $pion_proj0_p110_H0D2A2->mom("p110"); 
  $pion_proj0_p110_H0D2A2->twoI_z(2); 
  $pion_proj0_p110_H0D2A2->ncfg(535);
  $pion_proj0_p110_H0D2A2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $pion_proj0_p110_H0D2A2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/D2A2M_mom2.refit");
  $pion_proj0_p110_H0D2A2->t0(9);
  $pion_proj0_p110_H0D2A2->state(0); 
  $pion_proj0_p110_H0D2A2->tz(14);
  $pion_proj0_p110_H0D2A2->phaser(-1.);


  my $pion_proj0_p111_H0D3A2 = OPparams->new();
  $pion_proj0_p111_H0D3A2->pid("pion_proj0");
  $pion_proj0_p111_H0D3A2->irrep("D3A2");
  $pion_proj0_p111_H0D3A2->irrep_stem("H0D3A2");
  $pion_proj0_p111_H0D3A2->mom("p111"); 
  $pion_proj0_p111_H0D3A2->twoI_z(2); 
  $pion_proj0_p111_H0D3A2->ncfg(535);
  $pion_proj0_p111_H0D3A2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $pion_proj0_p111_H0D3A2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/D3A2M_mom3");
  $pion_proj0_p111_H0D3A2->t0(8);
  $pion_proj0_p111_H0D3A2->state(0); 
  $pion_proj0_p111_H0D3A2->tz(16);
  $pion_proj0_p111_H0D3A2->phaser(1.);


  my $pion_proj0_p200_H0D4A2 = OPparams->new();
  $pion_proj0_p200_H0D4A2->pid("pion_proj0");
  $pion_proj0_p200_H0D4A2->irrep("D4A2");
  $pion_proj0_p200_H0D4A2->irrep_stem("H0D4A2");
  $pion_proj0_p200_H0D4A2->mom("p200"); 
  $pion_proj0_p200_H0D4A2->twoI_z(2); 
  $pion_proj0_p200_H0D4A2->ncfg(535);
  $pion_proj0_p200_H0D4A2->ensemble("szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"); 
  $pion_proj0_p200_H0D4A2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per/redstar/isovector/analysis/shultz/D4A2M_mom4");
  $pion_proj0_p200_H0D4A2->t0(8);
  $pion_proj0_p200_H0D4A2->state(0); 
  $pion_proj0_p200_H0D4A2->tz(16);
  $pion_proj0_p200_H0D4A2->phaser(1.);



  my @all_operators = (); 
  push @all_operators , $pion_proj0_p000_A1; 
  push @all_operators , $pion_proj0_p100_H0D4A2; 
  push @all_operators , $pion_proj0_p110_H0D2A2; 
  push @all_operators , $pion_proj0_p111_H0D3A2; 
  push @all_operators , $pion_proj0_p200_H0D4A2; 


  my @extracts = (); 
  foreach my $op (@all_operators)
  {
    push @extracts,  &run_extract_all_v_coeffs_svd($op); 
  }

  my $listfile = &convert_proj_to_xml(\@extracts,"pion_proj0"); 

  &make_proj_plots($listfile);

  &write_radmat_xml(\@all_operators); 

  &serialize_ops_list( "pion_proj0.perl.xml" , \@all_operators);  
  




