#!/bin/tcsh 

set CC=gcc 
set CXX=g++


../configure --prefix=$HOME/git-builds/hadron-9q \
  -with-tensor=$HOME/git-builds/tensor-9q 

  make install -j10 


  make clean

  echo "you WIN" 
