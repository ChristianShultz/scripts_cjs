#!/usr/bin/perl

# make a params package since perl w/o using strict is scary 
package QSub;
use File::Copy;
use File::Basename; 

use strict;


# a cute little thing I found on the internet

sub __func__ {(caller(1))[3].'()'}

sub err_func
{
  my ($f,$l,$e) = @_; 
  print "ERROR: $f, line: $l\n  message: $e\n";
  die(); 
}

sub test_func
{
  &err_func(__func__ , __LINE__ , "string");
}


##############################################
#  make an instance of the class             #
##############################################
sub new
{
  my $invocant = shift;
  my $class = ref($invocant) || $invocant; 
  my $self =  {
    @_, #Override previous attrubutes 
  }; ## self

  return bless $self , $class; 
}


##############################################
## methods to access per-object data        ##
##                                          ##
## With args, they set the value.  Without  ##
## any, they only retrieve it/them.         ##
##############################################

#none 


##############################################
## class methods ( make scripts )           ##
##############################################

# some label that looks nice
sub generate_job_name
{
  &err_func(__func__,__LINE__,"expected 1 arg") unless $#_ == 1; 
  my ( $self, $outpath ) = @_; 
  my @junk = split /\// , $outpath; 
  return $junk[-3] . "_" . $junk[-1];
}

# parse the directory structure to get the delta t variable 
#
#     NB: THIS REQUIRES /some/path/dt#
sub generate_dt
{
  &err_func(__func__,__LINE__,"expected 1 arg") unless $#_ == 1; 
  my ( $self, $outpath ) = @_; 

  my @junk = split /\// , $outpath; 
  my $dt = $junk[-1];
  $dt =~ s/dt//g;

  return $dt; 
}


# main body script, always the same 
sub print_body
{
  &err_func(__func__,__LINE__,"expected 2 args") unless $#_ == 2; 
  my ( $self, $dt , $outpath ) = @_; 

  my $run_script = "run_redstar.3pt.pl";

  print OUT<<EOF;

if (\$?PBS_O_HOST != 0) then
  cd \$PBS_O_WORKDIR
  echo "PBS_JOBID = \$PBS_JOBID"
  echo "PBS_JOBNAME = \$PBS_JOBNAME" 
  echo "PBS_O_WORKDIR = \$PBS_O_WORKDIR"
  echo "PBS_NODEFILE"
  cat \$PBS_NODEFILE | uniq
endif

set file_prefix="szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per"
set list="sdb.list"
set run_script="\${PBS_O_WORKDIR}/$run_script"
set dt=$dt

if ( ! -e \$run_script ) then
  echo "\$run_script is not present"
  exit 0
endif


if (! -d "/volatile/Spectrum") then
  echo "Lustre is not present"
  exit 0
endif


#
# Decide if the job needs to be resubmitted.
#
if ( ! -f \${list} ) then
  echo "ERROR: file  \$list  does not exist"
  exit(11)
endif

set numseqno=`cat \$list | wc -l`

if ( \$numseqno == 0 ) then
  touch \${file_prefix}.done
  echo "The \$file_prefix sequence is finished"
  exit(0)
endif

set newseqno=`head -1 \$list | gawk '{print \$NF}'`

# Bump up to the next item in the list
cat \$list | awk 'NR>1{print \$0}' > list_\$\$
/bin/mv -f list_\$\$ \$list

# the output path 
set output_path = $outpath
set out = \$output_path/\${file_prefix}.out.dt\${dt}.npt.\${newseqno}
/bin/rm -f \$out \${out}.gz
touch \$out

echo "Stem= \$file_prefix  Cfg = \$newseqno" >> \$out

if (\$?PBS_O_HOST != 0) then
  echo "PBS_JOBID = \$PBS_JOBID" >> \$out
  echo "PBS_JOBNAME = \$PBS_JOBNAME"  >> \$out
  echo "PBS_O_WORKDIR = \$PBS_O_WORKDIR" >> \$out
  echo "PBS_NODEFILE" >> \$out
  cat \$PBS_NODEFILE | uniq >> \$out
endif

echo "DELTAT = \$dt " >> \$out 

echo "/scratch/ before run " >> \$out
ls -al /scratch >> \$out

set ds = `date`
echo "Starting chroma script at time=  \$ds"  >> \$out

time \$run_script \$newseqno \$dt \$output_path >> \$out

if ( \$status != 0) then
  echo "Some error in run for \$out at seqno=\$newseqno"
  echo \$newseqno >> \${list}.badlist
  exit 1
endif

set de = `date`
echo "Ending chroma script at time=  \$de"  >> \$out


echo "/scratch/ post run " >> \$out
ls -al /scratch >> \$out

EOF

}


# generate a mic batch script
sub make_script_mic
{
  &err_func(__func__,__LINE__,"expected 1 arg") unless $#_ == 1; 
  my ( $self, $outpath ) = @_; 

  my $fhandle = "mic.csh";
  my $id = $self->generate_job_name($outpath) . "_mic";
  my $dt = $self->generate_dt($outpath); 

  unlink $fhandle unless ! -f $fhandle;


  open OUT , ">" , $fhandle; 

  print OUT<<EOF;
#!/bin/tcsh -x
#PBS -N $id
#PBS -q testmic
#PBS -A Spectrum
#PBS -l walltime=30:00:00
#PBS -l nodes=4:mic
#PBS -j eo
EOF

  $self->print_body($dt,$outpath); 

  print OUT<<EOF;
if (\$?PBS_O_WORKDIR != 0) then
  /usr/local/bin/qsub $fhandle
endif

exit 0
EOF

  close OUT; 

  return $fhandle; 
}


# generate an ib 8c8 script
sub make_script_8c8
{
  &err_func(__func__,__LINE__,"expected 1 arg") unless $#_ == 1; 
  my ( $self, $outpath ) = @_; 

  my $fhandle = "ib.8c8.csh";
  my $id = $self->generate_job_name($outpath) . "_8c8";
  my $dt = $self->generate_dt($outpath); 

  unlink $fhandle unless ! -f $fhandle;


  open OUT , ">" , $fhandle; 

  print OUT<<EOF;
#!/bin/tcsh -x
#PBS -N $id
#PBS -q ib
#PBS -A Spectrum
#PBS -l walltime=48:00:00
#PBS -l nodes=8:cores8
#PBS -j eo
EOF

  $self->print_body($dt,$outpath); 

  print OUT<<EOF;
if (\$?PBS_O_WORKDIR != 0) then
  /usr/local/bin/qsub $fhandle
endif

exit 0
EOF

  close OUT; 

  return $fhandle; 
}


# generate an ib 16c16 script
sub make_script_16c16
{
  &err_func(__func__,__LINE__,"expected 1 arg") unless $#_ == 1; 
  my ( $self, $outpath ) = @_; 

  my $fhandle = "ib.16c16.csh";
  my $id = $self->generate_job_name($outpath) . "_16c16";
  my $dt = $self->generate_dt($outpath); 

  unlink $fhandle unless ! -f $fhandle;


  open OUT , ">" , $fhandle; 

  print OUT<<EOF;
#!/bin/tcsh -x
#PBS -N $id
#PBS -q ib
#PBS -A Spectrum
#PBS -l walltime=48:00:00
#PBS -l nodes=16:cores16
#PBS -j eo
EOF

  $self->print_body($dt,$outpath); 

  print OUT<<EOF;
if (\$?PBS_O_WORKDIR != 0) then
  /usr/local/bin/qsub $fhandle
endif

exit 0
EOF

  close OUT; 

  return $fhandle; 
}


# generate an gpu script to run on the front end only!!
sub make_script_ib_FM
{
  &err_func(__func__,__LINE__,"expected 1 arg") unless $#_ == 1; 
  my ( $self, $outpath ) = @_; 

  my $fhandle = "ib.gpu_front_end.fermi.csh";
  my $id = $self->generate_job_name($outpath) . "_4Fm";
  my $dt = $self->generate_dt($outpath); 

  unlink $fhandle unless ! -f $fhandle;


  open OUT , ">" , $fhandle; 

  print OUT<<EOF;
#!/bin/tcsh -x
#PBS -N $id
#PBS -q gpu
#PBS -A Spectrumg
#PBS -l walltime=10:00:00
#PBS -l nodes=4:Fermi
#PBS -j eo
EOF

  $self->print_body($dt,$outpath); 

  print OUT<<EOF;
if (\$?PBS_O_WORKDIR != 0) then
  /usr/local/bin/qsub $fhandle
endif

exit 0
EOF

  close OUT; 

  return $fhandle; 
}


# generate an gpu script to run on the front end only!!
sub make_script_ib_c9g
{
  &err_func(__func__,__LINE__,"expected 1 arg") unless $#_ == 1; 
  my ( $self, $outpath ) = @_; 

  my $fhandle = "ib.gpu_front_end.c9g.csh";
  my $id = $self->generate_job_name($outpath) . "_4Fm";
  my $dt = $self->generate_dt($outpath); 

  unlink $fhandle unless ! -f $fhandle;


  open OUT , ">" , $fhandle; 

  print OUT<<EOF;
#!/bin/tcsh -x
#PBS -N $id
#PBS -q gpu
#PBS -A Spectrumg
#PBS -l walltime=10:00:00
#PBS -l nodes=1:c9g
#PBS -j eo
EOF

  $self->print_body($dt,$outpath); 

  print OUT<<EOF;
if (\$?PBS_O_WORKDIR != 0) then
  /usr/local/bin/qsub $fhandle
endif

exit 0
EOF

  close OUT; 

  return $fhandle; 
}

# generate an gpu script to run on the front end only!!
sub make_script_ib_c10g
{
  &err_func(__func__,__LINE__,"expected 1 arg") unless $#_ == 1; 
  my ( $self, $outpath ) = @_; 

  my $fhandle = "ib.gpu_front_end.c10g.csh";
  my $id = $self->generate_job_name($outpath) . "_4Fm";
  my $dt = $self->generate_dt($outpath); 

  unlink $fhandle unless ! -f $fhandle;


  open OUT , ">" , $fhandle; 

  print OUT<<EOF;
#!/bin/tcsh -x
#PBS -N $id
#PBS -q gpu
#PBS -A Spectrumg
#PBS -l walltime=10:00:00
#PBS -l nodes=1:c10g
#PBS -j eo
EOF

  $self->print_body($dt,$outpath); 

  print OUT<<EOF;
if (\$?PBS_O_WORKDIR != 0) then
  /usr/local/bin/qsub $fhandle
endif

exit 0
EOF

  close OUT; 

  return $fhandle; 
}


sub make_script
{
  &err_func(__func__,__LINE__,"expected 2 args") unless $#_ == 2; 
  my ( $self, $string, $output ) = @_;

  my %hash = (); 

  # SDB NAMES
  $hash{"mic"} = \&QSub::make_script_mic;
  $hash{"ib8"} = \&QSub::make_script_8c8;
  $hash{"ib16"} = \&QSub::make_script_16c16;
  $hash{"ib_FM"} = \&QSub::make_script_ib_FM;
  $hash{"ib_c9g"} = \&QSub::make_script_ib_c9g;
  $hash{"ib_c10g"} = \&QSub::make_script_ib_c10g;

  # black magic!
  if ( exists $hash{$string} ) 
  {
    print __func__ . ": running $string \n";
    return  &{ $hash{$string} }($self,$output) ; 
  }
  else
  {
    my @k = keys %hash; 
    print "ERROR: don't know what a $string is, a smarter set of choices is\n";
    foreach my $kk (@k) 
    {
      print $kk . "\n";
    }
    die ( "unholy death" );
  }
}






#require 

1; 
