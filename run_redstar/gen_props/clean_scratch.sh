#!/bin/bash

ls -al /scratch | grep shultz | awk '{print $9}' | xargs -I qq /bin/rm /scratch/qq
