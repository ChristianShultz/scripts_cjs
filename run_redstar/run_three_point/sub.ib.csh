#!/bin/tcsh

if ( $#argv != 2 ) then 
  echo "usage: $0 <nsub> <script>"
  exit 1
endif

if ( ! -e $argv[2] ) then 
  echo "the script $argv[2] does not exist"
  exit 1
endif

foreach x (`seq 1 1 $argv[1]`)
  qsub $argv[2]
  sleep 1
end
