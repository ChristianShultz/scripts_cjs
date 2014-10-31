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
8)
 CPUS="16,17"
 ;;
9)
 CPUS="18,19"
 ;; 
10)
 CPUS="20,21"
 ;;
11)
 CPUS="22,23"
 ;;
12)
 CPUS="24,25"
 ;;
13)
 CPUS="26,27"
 ;;
14)
 CPUS="28,29"
 ;;
15)
 CPUS="30,31"
 ;;
*) 
  echo LOCAL Rank cannot be bigger than 15
  exit 1
  ;;
esac

/usr/bin/numactl --physcpubind=${CPUS} ${ARGS}
