#!/bin/bash

filename=`ls -d *MD/`
for i in $filename
do
   cp  ../MDynamic/*   $i
   cd $i
   watnum=`grep WAT complex_vdw_bonded.pdb | head -n 1 | awk '{print $5}'`
   let fixnum=$watnum-1
   sed -i "s/-371/-${fixnum}/" *.in  # replace restraintmask=':1-371'
   cd ..   
done

