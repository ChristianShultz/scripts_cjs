#!/bin/tcsh 

set CC=gcc 
set CXX=g++


../configure --prefix=$HOME/git-builds/hadron-12k \
  -with-tensor=$HOME/git-builds/tensor-12k

  make install -j10 


  make clean

  echo "you WIN" 
