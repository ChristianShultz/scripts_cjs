#!/bin/bash

export LD_LIBRARY_PATH=/dist/gcc-4.6.3/lib64:/dist/gcc-4.6.3/lib:$LD_LIBRARY_PATH

ARGS=$*

case $MV2_COMM_WORLD_LOCAL_RANK in
0)
 CPUS="0,1"
 ;;
1)
 CPUS="2,3"
 ;; 
2)
 CPUS="4,5"
 ;;
3)
 CPUS="6,7"
 ;;
4)
 CPUS="8,9"
 ;;
5)
 CPUS="10,11"
 ;;
6)
 CPUS="12,13"
 ;;
7)
 CPUS="14,15"
 ;;
*) 
  echo LOCAL Rank cannot be bigger than 7
  exit 1
  ;;
esac

/usr/bin/numactl --physcpubind=${CPUS} ${ARGS}
