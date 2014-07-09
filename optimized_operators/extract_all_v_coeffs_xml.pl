#!/usr/bin/perl
use strict;

die "$0 <output xml file>  <t0> <tZ> <opslistfile> <# states> <opname pattern> [<secondary op xml>...]\n" unless $#ARGV >= 6;

my $output_xml = shift(@ARGV);
my $t0 = shift(@ARGV);
my $tZ = shift(@ARGV);
my $opslistfile = shift(@ARGV);
my $state = shift(@ARGV);
my $opname = shift(@ARGV);

printf "Extract weights for projected op = $opname\n";

# Read source ops xml and make a map (source_opsmap)
my %source_opsmap = ();
foreach my $source_opsxml (@ARGV)
{
  die "File $source_opsxml does not exist\n" unless -f $source_opsxml;

  my $num_xml_source_ops = `print_nodeset ${source_opsxml} "/OpsList/elem" | grep "Nset is " | awk '{print \$NF}' `;
  chomp($num_xml_source_ops);
  print "Source ops xml file (${source_opsxml}) has ${num_xml_source_ops} ops\n";

  for(my $i=1; $i <= $num_xml_source_ops; $i++)
  {
    my $opnamekey =  `print_xpath ${source_opsxml} "/OpsList/elem[${i}]/OpNameKey"`;
    chomp $opnamekey;
    my $opxml_op = `print_nodeset ${source_opsxml} "/OpsList/elem[${i}]/Irrep/Operators" | head -n -1 | tail -n +4`;
    my $opxml_cg = `print_nodeset ${source_opsxml} "/OpsList/elem[${i}]/Irrep/CGs" | head -n -1 | tail -n +4`;
    my $opxml_tmp = "      " . $opxml_op . "      " . $opxml_cg;
    $source_opsmap{$opnamekey} = $opxml_tmp;
  }
}

# Start op xml
open(OUT_XML, "> $output_xml");

printf OUT_XML <<EOF;
<?xml version="1.0"?>
<ProjectedOps>
EOF


#
# Loop over all the lowest #states
#
# Need to know the overall mom_type
my $mom_type = &getMomType($opname);

printf OUT_XML <<EOF;
  <elem>
    <Key>
      <name>${opname}</name>
      <smear/>
      <mom_type>${mom_type}</mom_type>
    </Key>
    <Val>
EOF
  
my $massfile = "t0${t0}/MassJackFiles/mass_t0_${t0}_reorder_state${state}.jack";

# Loop over the operators for this state
my $ii = 0;
open(OPSLIST, "< $opslistfile") || die("Could not open ${opslistfile}\n");
while(my $subopnameline = <OPSLIST>)
{
  chomp $subopnameline;
  my @subopnameline_split = split(/ /, "${subopnameline}");
  my $subopname = $subopnameline_split[1];

  my $file = "t0${t0}/V_tJackFiles/V_t0_${t0}_reordered_state${state}_op${ii}.jack";

  my $command = "calcbc \" sqrt( 2 * ${massfile} ) * exp ( - ${massfile} * ${t0} / 2 ) * extract ( ${file} , ${tZ} ) \" | awk '{print \$2}' ";
  my $val = `${command}`; chomp $val;
#  print "${opname} ${subopname} ${val}";

  die "Key  $subopname  not in map of operator xml\n" unless defined $source_opsmap{$subopname};
  my $source_xml = $source_opsmap{$subopname};
  
  print OUT_XML <<EOF;
      <elem>
        <Key>
EOF

  print OUT_XML $source_xml;
  print OUT_XML <<EOF;
        </Key>
        <Val>$val</Val>
      </elem>
EOF

  $ii++;
}
close(OPSLIST);

print OUT_XML <<EOF;
    </Val>
  </elem>
EOF


print OUT_XML <<EOF;
</ProjectedOps>
EOF

close(OUT_XML);
exit(0);


sub getMomType
{
  my $key = $_[0];

  # Extract the mom_type from the key. Expect a projected op name.
  my @oo = split('_', $key);
  my $momm = $oo[2];

  die "Not a valid mom_type = $momm\n" unless ($momm =~ /^p.../);

  # Now turn it into an array
  my $mom_type = substr($momm, 1);
  my $px = substr($mom_type, 0, 1);
  my $mom_type = substr($mom_type, 1);
  my $py = substr($mom_type, 0, 1);
  my $mom_type = substr($mom_type, 1);
  my $pz = substr($mom_type, 0, 1);
  my $mom_type = substr($mom_type, 1);

  my $mom_type = "$px $py $pz";

  return $mom_type;
}




