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

require "${basedir}/OPparams.work.multiparticle.pl";

my @all_ops = (); 


  my $rho_proj0_p000_T1 = OPparams->new();
  $rho_proj0_p000_T1->pid("rho_proj0");
  $rho_proj0_p000_T1->irrep("T1");
  $rho_proj0_p000_T1->irrep_stem("T1");
  $rho_proj0_p000_T1->mom("p000"); 
  $rho_proj0_p000_T1->twoI_z(2); 
  $rho_proj0_p000_T1->ncfg(603);
  $rho_proj0_p000_T1->spin(1);
  $rho_proj0_p000_T1->ensemble("szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265"); 
  $rho_proj0_p000_T1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265_per/redstar/rho/rho_ff/ws_larger/T1mm_wr");
  $rho_proj0_p000_T1->t0(7);
  $rho_proj0_p000_T1->state(0); 
  $rho_proj0_p000_T1->tz(11);
  $rho_proj0_p000_T1->phaser(1.);
  $rho_proj0_p000_T1->recon_version("two_particle"); 
  $rho_proj0_p000_T1->nested(["pipi_I1.rest.xml","rho.rest.xml"]); 
  $rho_proj0_p000_T1->recon_ws("true"); 

  my $rho_proj0_p100_H0D4A1 = OPparams->new();
  $rho_proj0_p100_H0D4A1->pid("rho_proj0");
  $rho_proj0_p100_H0D4A1->irrep("D4A1");
  $rho_proj0_p100_H0D4A1->irrep_stem("H0D4A1");
  $rho_proj0_p100_H0D4A1->mom("p100"); 
  $rho_proj0_p100_H0D4A1->twoI_z(2); 
  $rho_proj0_p100_H0D4A1->ncfg(603);
  $rho_proj0_p100_H0D4A1->spin(1);
  $rho_proj0_p100_H0D4A1->ensemble("szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265"); 
  $rho_proj0_p100_H0D4A1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265_per/redstar/rho/rho_ff/ws_larger/D4A1m_p001_wr");
  $rho_proj0_p100_H0D4A1->t0(8);
  $rho_proj0_p100_H0D4A1->state(0); 
  $rho_proj0_p100_H0D4A1->tz(18);
  $rho_proj0_p100_H0D4A1->phaser(1.);
  $rho_proj0_p100_H0D4A1->recon_version("two_particle"); 
  $rho_proj0_p100_H0D4A1->nested(["pipi_I1.D4.p001.xml","single.I1.D4.p001.xml"]); 
  $rho_proj0_p100_H0D4A1->recon_ws("true"); 

  my $rho_proj0_p100_H1D4E2 = OPparams->new();
  $rho_proj0_p100_H1D4E2->pid("rho_proj0");
  $rho_proj0_p100_H1D4E2->irrep("D4E2");
  $rho_proj0_p100_H1D4E2->irrep_stem("H1D4E2");
  $rho_proj0_p100_H1D4E2->mom("p100"); 
  $rho_proj0_p100_H1D4E2->twoI_z(2); 
  $rho_proj0_p100_H1D4E2->ncfg(603);
  $rho_proj0_p100_H1D4E2->spin(1);
  $rho_proj0_p100_H1D4E2->ensemble("szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265"); 
  $rho_proj0_p100_H1D4E2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265_per/redstar/rho/rho_ff/ws_larger/D4E2m_p001_wr");
  $rho_proj0_p100_H1D4E2->t0(7);
  $rho_proj0_p100_H1D4E2->state(0); 
  $rho_proj0_p100_H1D4E2->tz(15);
  $rho_proj0_p100_H1D4E2->phaser(1.);
  $rho_proj0_p100_H1D4E2->recon_version("two_particle"); 
  $rho_proj0_p100_H1D4E2->nested(["pipi_I1.D4.p001.xml","single.I1.D4.p001.xml"]); 
  $rho_proj0_p100_H1D4E2->recon_ws("true"); 

  my $rho_proj0_p110_H0D2A1 = OPparams->new();
  $rho_proj0_p110_H0D2A1->pid("rho_proj0");
  $rho_proj0_p110_H0D2A1->irrep("D2A1");
  $rho_proj0_p110_H0D2A1->irrep_stem("H0D2A1");
  $rho_proj0_p110_H0D2A1->mom("p110"); 
  $rho_proj0_p110_H0D2A1->twoI_z(2); 
  $rho_proj0_p110_H0D2A1->ncfg(603);
  $rho_proj0_p110_H0D2A1->spin(1);
  $rho_proj0_p110_H0D2A1->ensemble("szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265"); 
  $rho_proj0_p110_H0D2A1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265_per/redstar/rho/rho_ff/ws_larger/D2A1m_p011_wr");
  $rho_proj0_p110_H0D2A1->t0(8);
  $rho_proj0_p110_H0D2A1->state(0); 
  $rho_proj0_p110_H0D2A1->tz(11);
  $rho_proj0_p110_H0D2A1->phaser(1.);
  $rho_proj0_p110_H0D2A1->recon_version("two_particle"); 
  $rho_proj0_p110_H0D2A1->nested(["pipi_I1.D2.p011.xml","single.I1.D2.p011.xml"]); 
  $rho_proj0_p110_H0D2A1->recon_ws("true"); 

  my $rho_proj0_p110_H1D2B1 = OPparams->new();
  $rho_proj0_p110_H1D2B1->pid("rho_proj0");
  $rho_proj0_p110_H1D2B1->irrep("D2B1");
  $rho_proj0_p110_H1D2B1->irrep_stem("H1D2B1");
  $rho_proj0_p110_H1D2B1->mom("p110"); 
  $rho_proj0_p110_H1D2B1->twoI_z(2); 
  $rho_proj0_p110_H1D2B1->ncfg(603);
  $rho_proj0_p110_H1D2B1->spin(1);
  $rho_proj0_p110_H1D2B1->ensemble("szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265"); 
  $rho_proj0_p110_H1D2B1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265_per/redstar/rho/rho_ff/ws_larger/D2B1m_p011_wr");
  $rho_proj0_p110_H1D2B1->t0(7);
  $rho_proj0_p110_H1D2B1->state(0); 
  $rho_proj0_p110_H1D2B1->tz(10);
  $rho_proj0_p110_H1D2B1->phaser(1.);
  $rho_proj0_p110_H1D2B1->recon_version("two_particle"); 
  $rho_proj0_p110_H1D2B1->nested(["pipi_I1.D2.p011.xml","single.I1.D2.p011.xml"]); 
  $rho_proj0_p110_H1D2B1->recon_ws("true"); 

  my $rho_proj0_p110_H1D2B2 = OPparams->new();
  $rho_proj0_p110_H1D2B2->pid("rho_proj0");
  $rho_proj0_p110_H1D2B2->irrep("D2B2");
  $rho_proj0_p110_H1D2B2->irrep_stem("H1D2B2");
  $rho_proj0_p110_H1D2B2->mom("p110"); 
  $rho_proj0_p110_H1D2B2->twoI_z(2); 
  $rho_proj0_p110_H1D2B2->ncfg(603);
  $rho_proj0_p110_H1D2B2->spin(1);
  $rho_proj0_p110_H1D2B2->ensemble("szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265"); 
  $rho_proj0_p110_H1D2B2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265_per/redstar/rho/rho_ff/ws_larger/D2B1m_p011_wr");
  $rho_proj0_p110_H1D2B2->t0(7);
  $rho_proj0_p110_H1D2B2->state(0); 
  $rho_proj0_p110_H1D2B2->tz(17);
  $rho_proj0_p110_H1D2B2->phaser(1.);
  $rho_proj0_p110_H1D2B2->recon_version("two_particle"); 
  $rho_proj0_p110_H1D2B2->nested(["pipi_I1.D2.p011.xml","single.I1.D2.p011.xml"]); 
  $rho_proj0_p110_H1D2B2->recon_ws("true"); 

  my $rho_proj0_p111_H0D3A1 = OPparams->new();
  $rho_proj0_p111_H0D3A1->pid("rho_proj0");
  $rho_proj0_p111_H0D3A1->irrep("D3A1");
  $rho_proj0_p111_H0D3A1->irrep_stem("H0D3A1");
  $rho_proj0_p111_H0D3A1->mom("p111"); 
  $rho_proj0_p111_H0D3A1->twoI_z(2); 
  $rho_proj0_p111_H0D3A1->ncfg(603);
  $rho_proj0_p111_H0D3A1->spin(1);
  $rho_proj0_p111_H0D3A1->ensemble("szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265"); 
  $rho_proj0_p111_H0D3A1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265_per/redstar/rho/rho_ff/ws_larger/D3A1m_p111_wr");
  $rho_proj0_p111_H0D3A1->t0(8);
  $rho_proj0_p111_H0D3A1->state(0); 
  $rho_proj0_p111_H0D3A1->tz(17);
  $rho_proj0_p111_H0D3A1->phaser(1.);
  $rho_proj0_p111_H0D3A1->recon_version("two_particle"); 
  $rho_proj0_p111_H0D3A1->nested(["pipi_I1.D3.p111.xml","single.I1.D3.p111.xml"]); 
  $rho_proj0_p111_H0D3A1->recon_ws("true"); 

  my $rho_proj0_p111_H1D3E2 = OPparams->new();
  $rho_proj0_p111_H1D3E2->pid("rho_proj0");
  $rho_proj0_p111_H1D3E2->irrep("D3E2");
  $rho_proj0_p111_H1D3E2->irrep_stem("H1D3E2");
  $rho_proj0_p111_H1D3E2->mom("p111"); 
  $rho_proj0_p111_H1D3E2->twoI_z(2); 
  $rho_proj0_p111_H1D3E2->ncfg(603);
  $rho_proj0_p111_H1D3E2->spin(1);
  $rho_proj0_p111_H1D3E2->ensemble("szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265"); 
  $rho_proj0_p111_H1D3E2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265_per/redstar/rho/rho_ff/ws_larger/D3E2m_p111_wr");
  $rho_proj0_p111_H1D3E2->t0(8);
  $rho_proj0_p111_H1D3E2->state(0); 
  $rho_proj0_p111_H1D3E2->tz(16);
  $rho_proj0_p111_H1D3E2->phaser(1.);
  $rho_proj0_p111_H1D3E2->recon_version("two_particle"); 
  $rho_proj0_p111_H1D3E2->nested(["pipi_I1.D3.p111.xml","single.I1.D3.p111.xml"]); 
  $rho_proj0_p111_H1D3E2->recon_ws("true"); 

#  my $rho_proj0_p200_H0D4A1 = OPparams->new();
#  $rho_proj0_p200_H0D4A1->pid("rho_proj0");
#  $rho_proj0_p200_H0D4A1->irrep("D4A1");
#  $rho_proj0_p200_H0D4A1->irrep_stem("H0D4A1");
#  $rho_proj0_p200_H0D4A1->mom("p200"); 
#  $rho_proj0_p200_H0D4A1->twoI_z(2); 
#  $rho_proj0_p200_H0D4A1->ncfg(603);
#  $rho_proj0_p200_H0D4A1->spin(1);
#  $rho_proj0_p200_H0D4A1->ensemble("szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265"); 
#  $rho_proj0_p200_H0D4A1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265_per/redstar/rho/rho_ff/ws_larger/D4A1m_p002_wr");
#  $rho_proj0_p200_H0D4A1->t0(6);
#  $rho_proj0_p200_H0D4A1->state(0); 
#  $rho_proj0_p200_H0D4A1->tz(7);
#  $rho_proj0_p200_H0D4A1->phaser(1.);
#  $rho_proj0_p200_H0D4A1->recon_version("two_particle"); 
#  $rho_proj0_p200_H0D4A1->nested(undef); 
#  $rho_proj0_p200_H0D4A1->recon_ws("true"); 

#  my $rho_proj0_p200_H1D4E2 = OPparams->new();
#  $rho_proj0_p200_H1D4E2->pid("rho_proj0");
#  $rho_proj0_p200_H1D4E2->irrep("D4E2");
#  $rho_proj0_p200_H1D4E2->irrep_stem("H1D4E2");
#  $rho_proj0_p200_H1D4E2->mom("p200"); 
#  $rho_proj0_p200_H1D4E2->twoI_z(2); 
#  $rho_proj0_p200_H1D4E2->ncfg(603);
#  $rho_proj0_p200_H1D4E2->spin(1);
#  $rho_proj0_p200_H1D4E2->ensemble("szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265"); 
#  $rho_proj0_p200_H1D4E2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265_per/redstar/rho/rho_ff/ws_larger/");
#  $rho_proj0_p200_H1D4E2->t0(6);
#  $rho_proj0_p200_H1D4E2->state(0); 
#  $rho_proj0_p200_H1D4E2->tz(7);
#  $rho_proj0_p200_H1D4E2->phaser(1.);
#  $rho_proj0_p200_H1D4E2->recon_version("two_particle"); 
#  $rho_proj0_p200_H1D4E2->nested(undef); 
#  $rho_proj0_p200_H1D4E2->recon_ws("true"); 


  my @all_operators = (); 
  push @all_operators , $rho_proj0_p000_T1; 
  push @all_operators , $rho_proj0_p100_H0D4A1; 
  push @all_operators , $rho_proj0_p100_H1D4E2; 
  push @all_operators , $rho_proj0_p110_H0D2A1; 
  push @all_operators , $rho_proj0_p110_H1D2B1; 
  push @all_operators , $rho_proj0_p110_H1D2B2; 
  push @all_operators , $rho_proj0_p111_H0D3A1; 
  push @all_operators , $rho_proj0_p111_H1D3E2; 
# push @all_operators , $rho_proj0_p200_H0D4A1; 
#  push @all_operators , $rho_proj0_p200_H1D4E2; 


  my @extracts = (); 
  my @list_extracts = (); 
  my @plot_list = (); 
  foreach my $op (@all_operators)
  {
    # this one makes a list file for the plots
    push @plot_list , &run_extract_all_v_coeffs_svd($op); 

    # need to be careful about single vs multiparticle xml extraction
    # here , also always be wary of weighting shifting 
    if( ( $op->recon_version() eq "single_meson" )
      || ($op->recon_version() eq "ancient" ) )
    {
      push @list_extracts , &run_extract_all_v_coeffs_svd($op); 
    }
    else
    {
      push @extracts,  &run_extract_all_v_coeffs_xml($op); 
    }
  }

  &make_proj_plots(\@plot_list,"rho_proj0");

  my $listfile = &finish_proj_xml(\@extracts,\@list_extracts,"rho_proj0"); 

  &write_radmat_xml(\@all_operators); 

  &serialize_ops_list( "rho_proj0.perl.xml" , \@all_operators ); 
