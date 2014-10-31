#!/bin/tcsh 

set CC=gcc 
set CXX=g++


../configure --prefix=$HOME/git-builds/hadron-singleThread \
  -with-tensor=$HOME/git-builds/tensor-singleThread

  make install -j10 


  make clean

  echo "you WIN" 
