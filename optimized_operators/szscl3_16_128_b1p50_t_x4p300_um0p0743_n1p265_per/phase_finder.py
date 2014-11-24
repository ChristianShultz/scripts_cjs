import xml.etree.ElementTree as ET 
import os 
import commands 
import sys 
import operator

def my_sign( x ): 
  if( x > 0 ): 
    return "+  " + str(x) 
  return "-  " + str(x)


nargs = len(sys.argv) -1 
if nargs != 1 : 
  print "expected 1 arg, eg pion_proj0" 
  print "got " + str(nargs) + " args "
  sys.exit()

op_stem = sys.argv[1]


tree = ET.parse('weights.szscl3_16_128_b1p50_t_x4p300_um0p0743_n1p265_per.xml')
root = tree.getroot()

ops = root.findall("elem"); 
match_ops = {}

for op in ops: 
  key = op[0]
  val = op[1]

  name = key.find("name").text; 
  if not op_stem in name : continue 

  match_ops[name] = val


sub_matching = {}
size_list = {}
print "found "
for elem in sorted( match_ops ) :
  print elem
  val = match_ops[elem]
  op_list = {}
  lin_comb = val.findall("elem") 

  for operator in lin_comb: 
    irrep = operator.find("Key/Operators")
    op_name = irrep[0].find("name").text.split("_")
    op_name.pop()
    op_name = "_".join(op_name)
    coeff = float( operator.find("Val").text )
    op_list[op_name] = coeff 

    print op_name + " ---> " +  str(coeff) 

    if op_name in size_list: 
      size_list[op_name] += abs(coeff)
    else:
      size_list[op_name] = abs(coeff)


  sub_matching[elem] = op_list 


comp_ops = []
for elem in  sorted(size_list.items() , key=lambda x: x[1], reverse=True):
  key = elem[0] 
  print "checking key " , key 
  found = 0
  nele = len(sub_matching)
  for irrep in sub_matching:
    if key in sub_matching[irrep]:
      found = found + 1

  if found == nele: 
   comp_ops.append( key ) 


for comp_op in comp_ops: 
  print "comp op = " , comp_op 
  for irrep in sorted(sub_matching): 
    print "    " , '%22s' %  irrep , '%20s' %  comp_op , '%5s' % my_sign(sub_matching[irrep][comp_op]) 


  
  








