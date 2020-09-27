#!/bin/bash

filename=`ls -d *MD/`
for i in $filename
do
  cd $i
  sed -i "/ATOM.*H.*H/d"  clean.pdb
  tleap -f   ../../leap2.in
  cd ../
done

