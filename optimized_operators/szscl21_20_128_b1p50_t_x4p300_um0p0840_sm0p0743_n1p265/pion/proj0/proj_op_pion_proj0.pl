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


####
# 
# NB: these are the t0,tz from the wiki
#
# in the case of the pion in flight we needed to 
# move down to 600cfg list to match to the rest 
# cfg list. We still use the same t0 and tz 
# from the wiki but this may introduce a very 
# slight systematic where the definition of the 
# pion is not consistent from the single particle 
# xml to what we use here. However if we actually 
# see any difference going from 603->600 cfgs we 
# have way bigger problems with this analysis
#
###

  my $pion_proj0_p000_A1 = OPparams->new();
  $pion_proj0_p000_A1->pid("pion_proj0");
  $pion_proj0_p000_A1->irrep("A1");
  $pion_proj0_p000_A1->irrep_stem("A1");
  $pion_proj0_p000_A1->mom("p000"); 
  $pion_proj0_p000_A1->twoI_z(2); 
  $pion_proj0_p000_A1->ncfg(600);
  $pion_proj0_p000_A1->spin(0);
  $pion_proj0_p000_A1->ensemble("szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265"); 
  $pion_proj0_p000_A1->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265_per/meson_2pt/n128_subduced_new/analysis/shultz/A1mp");
  $pion_proj0_p000_A1->t0(9);
  $pion_proj0_p000_A1->state(0); 
  $pion_proj0_p000_A1->tz(15);
  $pion_proj0_p000_A1->phaser(1.);
  $pion_proj0_p000_A1->recon_version("single_meson"); 
  $pion_proj0_p000_A1->nested(undef); 
  $pion_proj0_p000_A1->recon_ws(undef); 

  my $pion_proj0_p100_H0D4A2 = OPparams->new();
  $pion_proj0_p100_H0D4A2->pid("pion_proj0");
  $pion_proj0_p100_H0D4A2->irrep("D4A2");
  $pion_proj0_p100_H0D4A2->irrep_stem("H0D4A2");
  $pion_proj0_p100_H0D4A2->mom("p100"); 
  $pion_proj0_p100_H0D4A2->twoI_z(2); 
  $pion_proj0_p100_H0D4A2->ncfg(600);
  $pion_proj0_p100_H0D4A2->spin(0);
  $pion_proj0_p100_H0D4A2->ensemble("szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265"); 
  $pion_proj0_p100_H0D4A2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265_per/meson_2pt/n128_hel_2deriv/shultz/fits/pion/D4A2p.p001");
  $pion_proj0_p100_H0D4A2->t0(10);
  $pion_proj0_p100_H0D4A2->state(0); 
  $pion_proj0_p100_H0D4A2->tz(25);
  $pion_proj0_p100_H0D4A2->phaser(1.);
  $pion_proj0_p100_H0D4A2->recon_version("single_meson"); 
  $pion_proj0_p100_H0D4A2->nested(undef); 
  $pion_proj0_p100_H0D4A2->recon_ws(undef); 

  my $pion_proj0_p110_H0D2A2 = OPparams->new();
  $pion_proj0_p110_H0D2A2->pid("pion_proj0");
  $pion_proj0_p110_H0D2A2->irrep("D2A2");
  $pion_proj0_p110_H0D2A2->irrep_stem("H0D2A2");
  $pion_proj0_p110_H0D2A2->mom("p110"); 
  $pion_proj0_p110_H0D2A2->twoI_z(2); 
  $pion_proj0_p110_H0D2A2->ncfg(600);
  $pion_proj0_p110_H0D2A2->spin(0);
  $pion_proj0_p110_H0D2A2->ensemble("szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265"); 
  $pion_proj0_p110_H0D2A2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265_per/meson_2pt/n128_hel_2deriv/shultz/fits/pion/D2A2p.p011");
  $pion_proj0_p110_H0D2A2->t0(9);
  $pion_proj0_p110_H0D2A2->state(0); 
  $pion_proj0_p110_H0D2A2->tz(25);
  $pion_proj0_p110_H0D2A2->phaser(1.);
  $pion_proj0_p110_H0D2A2->recon_version("single_meson"); 
  $pion_proj0_p110_H0D2A2->nested(undef); 
  $pion_proj0_p110_H0D2A2->recon_ws(undef); 

  my $pion_proj0_p111_H0D3A2 = OPparams->new();
  $pion_proj0_p111_H0D3A2->pid("pion_proj0");
  $pion_proj0_p111_H0D3A2->irrep("D3A2");
  $pion_proj0_p111_H0D3A2->irrep_stem("H0D3A2");
  $pion_proj0_p111_H0D3A2->mom("p111"); 
  $pion_proj0_p111_H0D3A2->twoI_z(2); 
  $pion_proj0_p111_H0D3A2->ncfg(600);
  $pion_proj0_p111_H0D3A2->spin(0);
  $pion_proj0_p111_H0D3A2->ensemble("szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265"); 
  $pion_proj0_p111_H0D3A2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265_per/meson_2pt/n128_hel_2deriv/shultz/fits/pion/D3A2p.p111");
  $pion_proj0_p111_H0D3A2->t0(9);
  $pion_proj0_p111_H0D3A2->state(0); 
  $pion_proj0_p111_H0D3A2->tz(25);
  $pion_proj0_p111_H0D3A2->phaser(1.);
  $pion_proj0_p111_H0D3A2->recon_version("single_meson"); 
  $pion_proj0_p111_H0D3A2->nested(undef); 
  $pion_proj0_p111_H0D3A2->recon_ws(undef); 

  my $pion_proj0_p200_H0D4A2 = OPparams->new();
  $pion_proj0_p200_H0D4A2->pid("pion_proj0");
  $pion_proj0_p200_H0D4A2->irrep("D4A2");
  $pion_proj0_p200_H0D4A2->irrep_stem("H0D4A2");
  $pion_proj0_p200_H0D4A2->mom("p200"); 
  $pion_proj0_p200_H0D4A2->twoI_z(2); 
  $pion_proj0_p200_H0D4A2->ncfg(600);
  $pion_proj0_p200_H0D4A2->spin(0);
  $pion_proj0_p200_H0D4A2->ensemble("szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265"); 
  $pion_proj0_p200_H0D4A2->recon_dir("/work/JLabLQCD/LHPC/Spectrum/Clover/NF2+1/szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265_per/meson_2pt/n128_hel_2deriv/shultz/fits/pion/D4A2p.p002");
  $pion_proj0_p200_H0D4A2->t0(9);
  $pion_proj0_p200_H0D4A2->state(0); 
  $pion_proj0_p200_H0D4A2->tz(25);
  $pion_proj0_p200_H0D4A2->phaser(1.);
  $pion_proj0_p200_H0D4A2->recon_version("single_meson"); 
  $pion_proj0_p200_H0D4A2->nested(undef); 
  $pion_proj0_p200_H0D4A2->recon_ws(undef); 


  my @all_operators = (); 
  push @all_operators , $pion_proj0_p000_A1; 
  push @all_operators , $pion_proj0_p100_H0D4A2; 
  push @all_operators , $pion_proj0_p110_H0D2A2; 
  push @all_operators , $pion_proj0_p111_H0D3A2; 
  push @all_operators , $pion_proj0_p200_H0D4A2; 


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

  &make_proj_plots(\@plot_list,"pion_proj0");

  my $listfile = &finish_proj_xml(\@extracts,\@list_extracts,"pion_proj0"); 

  &write_radmat_xml(\@all_operators); 

  &serialize_ops_list( "pion_proj0.perl.xml" , \@all_operators ); 
