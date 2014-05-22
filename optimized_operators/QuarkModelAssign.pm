#!/usr/bin/perl 

package QuarkModelAssign; 
use QuarkModel; 
use strict; 

sub singlet_S_0
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{1}S_{0}");  
  return $foo; 
}


sub triplet_S_1
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{3}S_{1}");  
  return $foo; 
}

sub singlet_P_1
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{1}P_{1}");  
  return $foo; 
}


sub triplet_P_0
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{3}P_{0}");  
  return $foo; 
}

sub triplet_P_1
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{3}P_{1}");  
  return $foo; 
}

sub triplet_P_2
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{3}P_{2}");  
  return $foo; 
}


sub singlet_D_2
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{1}D_{2}");  
  return $foo; 
}


sub triplet_D_1
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{3}D_{1}");  
  return $foo; 
}

sub triplet_D_2
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{3}D_{2}");  
  return $foo; 
}

sub triplet_D_3
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{3}D_{3}");  
  return $foo; 
}


sub singlet_F_3
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{1}F_{3}");  
  return $foo; 
}


sub triplet_F_2
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{3}F_{2}");  
  return $foo; 
}

sub triplet_F_3
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{3}F_{3}");  
  return $foo; 
}

sub triplet_F_4
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{3}F_{4}");  
  return $foo; 
}


sub singlet_G_4
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{1}G_{4}");  
  return $foo; 
}


sub triplet_G_3
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{3}G_{3}");  
  return $foo; 
}

sub triplet_G_4
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{3}G_{4}");  
  return $foo; 
}

sub triplet_G_5
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{3}G_{5}");  
  return $foo; 
}





sub singlet_S_0_x_B_1
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{1}S_{0}xB_{1}");  
  return $foo; 
}


sub triplet_S_1_x_B_0
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{3}S_{1}xB_{1}");  
  return $foo; 
}

sub triplet_S_1_x_B_1
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{3}S_{1}xB_{1}");  
  return $foo; 
}

sub triplet_S_1_x_B_2
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{3}S_{1}xB_{1}");  
  return $foo; 
}



sub triplet_P_1_x_B_0
{
  my $foo = QuarkModel->new(); 
  $foo->par("^{3}P_{1}xB_{1}");  
  return $foo; 
}


sub qm_assign
{
  my $ky = shift; 
  my %assignments = (); 

  $assignments{"1S0"} = \&QuarkModelAssign::singlet_S_0;
  $assignments{"3S1"} = \&QuarkModelAssign::triplet_S_1;

  $assignments{"1P1"} = \&QuarkModelAssign::singlet_P_1;
  $assignments{"3P0"} = \&QuarkModelAssign::triplet_P_0;
  $assignments{"3P1"} = \&QuarkModelAssign::triplet_P_1;
  $assignments{"3P2"} = \&QuarkModelAssign::triplet_P_2;

  $assignments{"1D2"} = \&QuarkModelAssign::singlet_D_2;
  $assignments{"3D1"} = \&QuarkModelAssign::triplet_D_1;
  $assignments{"3D2"} = \&QuarkModelAssign::triplet_D_2;
  $assignments{"3D3"} = \&QuarkModelAssign::triplet_D_3;

  $assignments{"1F3"} = \&QuarkModelAssign::singlet_F_3;
  $assignments{"3F2"} = \&QuarkModelAssign::triplet_F_2;
  $assignments{"3F3"} = \&QuarkModelAssign::triplet_F_3;
  $assignments{"3F4"} = \&QuarkModelAssign::triplet_F_4;

  $assignments{"1G4"} = \&QuarkModelAssign::singlet_G_4;
  $assignments{"3G3"} = \&QuarkModelAssign::triplet_G_3;
  $assignments{"3G4"} = \&QuarkModelAssign::triplet_G_4;
  $assignments{"3G5"} = \&QuarkModelAssign::triplet_G_5;

  $assignments{"1S0xB->1"} = \&QuarkModelAssign::singlet_S_0_x_B_1;
  $assignments{"3S1xB->0"} = \&QuarkModelAssign::triplet_S_1_x_B_0;
  $assignments{"3S1xB->1"} = \&QuarkModelAssign::triplet_S_1_x_B_1;
  $assignments{"3S1xB->2"} = \&QuarkModelAssign::triplet_S_1_x_B_2;
  $assignments{"3P1xB->0"} = \&QuarkModelAssign::triplet_P_1_x_B_0;

  if(exists $assignments{$ky} ) 
  {
    return &{ $assignments{$ky} }(); 
  }
  else
  {
    my @k = keys %assignments; 
    print "unrecognized assignment: $ky, try one of  \n";
    foreach my $kk (@k)
    {
      print "$kk \n";
    }
  }


}

1;
