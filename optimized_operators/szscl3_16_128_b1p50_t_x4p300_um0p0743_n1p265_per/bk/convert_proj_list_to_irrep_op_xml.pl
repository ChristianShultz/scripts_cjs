#!/usr/bin/perl
#
# Take the output of extract_all_v_coeffs_svd.pl and turn it into xml in
# HadronNPartIrrepOp format suitable for projection coefficient xml input files
#

$, = ' ';               # set output field separator
##$\ = "\n";              # set output record separator
$\ = "";              # set output record separator

die "Usage: $0\n" unless @ARGV == 0;

#$mom_type = shift(@ARGV);

printf STDOUT <<EOF;
<?xml version="1.0"?>
<ProjectedOps>
EOF

$key = "";
$prev_key = "";

while($_ = <STDIN>)
{
  chomp $_;

  ($key, $op, $weight) = split(' ', $_);

  # Extract the mom_type from the key. Expect a projected op name.
  @oo = split('_', $key);
  $momm = $oo[2];

  die "Not a valid mom_type = $momm\n" unless ($momm =~ /^p.../);

  # Now turn it into an array
  $mom_type = substr($momm, 1);
  $px = substr($mom_type, 0, 1);
  $mom_type = substr($mom_type, 1);
  $py = substr($mom_type, 0, 1);
  $mom_type = substr($mom_type, 1);
  $pz = substr($mom_type, 0, 1);
  $mom_type = substr($mom_type, 1);

  $mom_type = "$px $py $pz";

 if ($key ne $prev_key)
  {
    if ($prev_key ne "")
    {
print STDOUT <<EOF;
    </Val>
  </elem>
EOF
    }

print STDOUT <<EOF;
  <elem>
    <Key>
      <name>$key</name> 
      <smear/>
      <mom_type>$mom_type</mom_type>
    </Key>
    <Val>
EOF
    
   $prev_key = $key;
  }

  print STDOUT <<EOF;
      <elem>
        <Key>
          <Operators>
            <elem>
              <name>$op</name>
              <smear/>
              <mom_type>$mom_type</mom_type>
            </elem>
          </Operators>
          <CGs/>
        </Key>
        <Val>$weight</Val>
      </elem>
EOF
  }

  print STDOUT <<EOF;
    </Val>
  </elem>
</ProjectedOps>
EOF

exit(0);

