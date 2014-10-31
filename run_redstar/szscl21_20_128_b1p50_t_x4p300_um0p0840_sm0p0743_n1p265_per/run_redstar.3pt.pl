#!/usr/bin/perl
#
# run redstar to generate 3pts for radmat 
#

use strict; 
use ParamsDistillation; 
use File::Basename;

die "usage: $0 <seqno> <delta_t> <output_path> <JLAB_ARCH>" unless $#ARGV == 3; 

my $seqno = $ARGV[0];
my $dt = $ARGV[1];
my $outpath = $ARGV[2];
my $jlab_arch = $ARGV[3]; 

# an instance of the Param "class" to hold lattice specific stuff
my $param = ParamsDistillation->new(); 

$param->redstar_version(7); 
$param->harom_version(1); 

# specify things that I want 
$param->seqno($seqno);
$param->num_vecs(128);       # max 
$param->nt_corr($dt + 1);  # this should avoid yet another way of mucking it up   
$param->L_t(128);         
$param->L_s(20);

# t_sources specifies sources
# delta_t specifies sinks 
#   this multiplies automatically and gets big quick 
$param->t_sources([0]);
$param->delta_t([$dt]);

# what correlators are we making
$param->npt_list_xml("npt.list.xml");

# configuration stuff
$param->config_type("SZINQIO");

my $lattice = "szscl21_20_128_b1p50_t_x4p300_um0p0840_sm0p0743_n1p265_per";
$param->stem($lattice);
my @proj_op = ("/u/home/shultz/optimized_operators/${lattice}/weights.${lattice}.xml");
$param->proj_op_xml(\@proj_op);
$param->convertUDtoL("true");   # this should be false if UD->S is true
$param->convertUDtoS("false");    # requires redstar version 5 or better 
$param->u_mass("-0.0840"); 
$param->d_mass("-0.0840"); 
$param->s_mass("-0.0743"); 

# run everything from scratch -- avoid any copying to  
#     lustre until we have a gen prop / perambulators
$param->scratchy(undef);

# be really noisy 
$param->verbose("true");
$param->diagnostic_level(1); 

# did we already make a bunch of unsmeared nodes? if so where are they 
my @unsmeared_nodes = ();
my $lustre_stem = $param->cache_dir() . "/" . $param->stem() ."/gen_props/gen_prop_dbs/dt${dt}/";
push @unsmeared_nodes , $lustre_stem . $param->stem() . ".CONN.isospin1.unsmeared_hadron_node.p000.sdb" . $seqno ; 

# this will override the redstar xml printing and try to copy @unsmeared_nodes up to scratch
$param->unsmeared_node_list(\@unsmeared_nodes); 

# write out xml 
my $redxml = $param->write_redstar_xml(); 
my $mesonxml = $param->write_meson_hadron_node_ini_xml();

# run gen graph 
&run_redstar_gen_graph($redxml,$outpath."/".basename($redxml).".gen.out"," ");

# build any nodes we need
&run_hadron_node_colorvec($mesonxml,$outpath."/".basename($mesonxml).".hadron_node.out",""); 

# multiply out nodes into correlators
&run_redstar_npt($redxml,$outpath."/".basename($redxml).".npt.out"," ");

# figure out what the matrix elem data is based on the directory structure
my $whereami = `pwd`; 
chomp $whereami;
my ($trash,$mat) = split  /$lattice/ , $whereami  ;
$mat = substr $mat , 1 ; 
print "mat = $mat\n";

# set up the work path 
my $scratch_corr = $param->scratch_seq_callback("output_sdb"); 
my $dest_corr = $param->work_dir() . "/" . $param->stem(); 
$dest_corr .= "/meson_3pt_redstar/unsmeared_insertion/";
$dest_corr .= $mat;
$dest_corr .= "/" . $param->stem() . ".qq_0.corr0.sdb" . $param->seqno(); 
$param->copy_back_rename_rcp($scratch_corr,$dest_corr);

exit ( 0 ) ; 




#
#
#   RUN CODE
#
#



sub ls_scratch 
{
  my $foo =   `/bin/ls -alh /scratch`;
  print " THIS IS SCRATCH \n $foo \n"; 
}


# so let the cluster decide how to thread itself
sub omp_info
{
  print "getting omp_info \n";

  my $num_thread = `grep '^processor' /proc/cpuinfo | wc -l ` ;
  chomp $num_thread; 
  $num_thread /= 2; 

  print "omp_num_thread = $num_thread\n";


  my $run = "env";
  $run .= " OMP_NUM_THREADS=$num_thread";
  $run .= " OMP_PROC_BIND=true"; 
  my $gomp = "0";
  for my $c (1 .. ${num_thread} -1)
  {
    $gomp .= " $c"; 
  }
  $run .= " GOMP_CPU_AFFINITY=\'${gomp}\'";

  print " OMP RUN INFO \n";
  print " num thread = $num_thread \n ";
  print " run = $run \n"; 

  my @r = (); 
  push @r , $run , $num_thread; 

  print "returning omp_info \n";
  return \@r ; 
}


# so let the cluster decide how to thread itself
sub minimal_omp_info
{
  print "getting omp_info \n";

  my $num_thread = `grep '^processor' /proc/cpuinfo | wc -l ` ;
  chomp $num_thread; 
  # $num_thread -= 1; 
  $num_thread /= 2; 

  print "omp_num_thread = $num_thread\n";

  my $run = "env";
  $run .= " OMP_NUM_THREADS=$num_thread";

  print " OMP RUN INFO \n";
  print " num thread = $num_thread \n ";
  print " run = $run \n"; 

  my @r = (); 
  push @r , $run , $num_thread; 

  print "returning omp_info \n";
  return \@r ; 
}

sub mpi_info
{
  my $num_thread = `grep '^processor' /proc/cpuinfo | wc -l ` ;
  chomp $num_thread; 
  $num_thread /= 2; 

  my $nodefile = $ENV{'PBS_NODEFILE'};

  my $num_nodes = `cat $nodefile | wc -l` ;
  chomp $num_nodes; 

  my $numa = $ENV{'HOME'};
  chomp $numa; 
  $numa .= "/scripts/numa_script_c8.sh"; 


  my $mpi = $ENV{'MPIHOME'};

  if ( $num_nodes != 8 ) 
  {
    print " num_nodes isnt the expected 8, $num_nodes \n";
    $num_nodes = 8;
  } 

  my $run = "${mpi}/bin/mpirun_rsh -rsh -np $num_nodes -hostfile $nodefile MV2_ENABLE_AFFINITY=0 OMP_NUM_THREADS=2 $numa";


  print " MPI RUN INFO \n";
  print " num thread = $num_thread \n ";
  print " nodefile = $nodefile  \n" ;
  print " num_nodes = $num_nodes  \n" ;
  print " numa = $numa  \n" ;
  print " mpihome = $mpi \n";
  print " run = $run \n"; 


  die ( " cant find numa script : $numa " ) unless -e $numa;

  my @r = (); 
  push @r , $run , $num_nodes; 
  return \@r ; 
}



sub run_redstar_npt
{
  print "runing redstar_npt \n";

  my ($input_file , $output_file) = @_;

  my $exe = ""; 
  if( $jlab_arch eq "12k" ) 
  {
    $exe = "/home/shultz/git-builds/redstar-12k/bin/redstar_npt";
  }
  elsif( $jlab_arch eq "9q" )
  {
    $exe = "/home/shultz/git-builds/redstar-9q/bin/redstar_npt";
  }
  else
  {
    die("jlab_arch = $jlab_arch is unknown"); 
  }

  my ($run,$num_nodes) = @{ &minimal_omp_info() }; 
  my $cmd = "$run $exe $input_file $output_file";

  if ( -f $output_file ) 
  {
    unlink $output_file; 
  }

  &check_exe($exe,"run_redstar_npt");

  print "RUNNING redstar_npt w/\n\n$cmd\n\n";

  system ( " $cmd " ) == 0 || die (" some error for redstar_npt, output : $output_file " ); 

  print "FINISHED REDSTAR_NPT \n\n "; 
  &ls_scratch(); 

}

sub run_redstar_gen_graph
{
  print "runing redstar_gen_graph \n";

  my ($input_file , $output_file, $options) = @_;

  my $exe = ""; 
  if( $jlab_arch eq "12k" ) 
  {
    $exe = "/home/shultz/git-builds/redstar-12k/bin/redstar_gen_graph";
  }
  elsif( $jlab_arch eq "9q" )
  {
    $exe = "/home/shultz/git-builds/redstar-9q/bin/redstar_gen_graph";
  }
  else
  {
    die("jlab_arch = $jlab_arch is unknown"); 
  }

  my ($run,$num_nodes) = @{ &minimal_omp_info() }; 
  my $cmd = "$run $exe $input_file $output_file ";

  if ( -f $output_file ) 
  {
    unlink $output_file; 
  }

  &check_exe($exe,"run_redstar_gen_graph");

  print "RUNNING redstar_gen_graph w/\n\n$cmd\n\n";

  system ( " $cmd " ) == 0 || die (" some error for redstar_npt, output : $output_file " ); 

  print "FINISHED REDSTAR GEN GRAPH \n\n";
  &ls_scratch();
}

sub run_hadron_node_colorvec
{ 

  my ($input,$output,$options) = @_; 

  my $exe = ""; 
  if( $jlab_arch eq "12k" ) 
  {
    $exe = "/home/shultz/git-builds/colorvec-12k/bin/hadron_node";
  }
  elsif( $jlab_arch eq "9q" )
  {
    $exe = "/home/shultz/git-builds/colorvec-9q/bin/hadron_node";
  }
  else
  {
    die("jlab_arch = $jlab_arch is unknown"); 
  }

  my ($run,$num_nodes) = @{ &minimal_omp_info() }; 
  my $cmd = "$run $exe $input $output";
  if( -f $output)
  {
    unlink $output; 
  }

  &check_exe($exe,"hadron_node"); 

  print "RUNNING colorvec code hadron_node w/\n\n$cmd\n\n";

  system(" $cmd " )  == 0 || die("some error for hadron_node, output: $output "); 
  print "FINISHED COLORVEC \n\n";
  &ls_scratch(); 

}

sub check_exe
{
  my ($exe,$caller) = @_; 
  if ( ! -e $exe ) 
  {
    print " $exe does not exist! \n called by $caller \n";
    die("unholy death");
  }
}








