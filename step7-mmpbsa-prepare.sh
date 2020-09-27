#!/bin/bash

filename=`ls -d *MD/`
for i in $filename
do
   cd $i
   cp  ../extract_coords.mmpbsa   ../binding_energy.mmpbsa   .
   ligfirst=`sed -n '3p' complex_vdw_bonded.pdb | awk '{print $4}'`
   ligsec=`grep $ligfirst complex_vdw_bonded.pdb | tail -n 1|  awk '{print $2}'`
   let prostart=$ligsec+1
   iscl=`grep Cl-  complex_vdw_bonded.pdb`
   if [ -n "$iscl" ]; then
       noprostart=`grep "Cl-"  complex_vdw_bonded.pdb | head -n 1 | awk '{print $2}'`
       let proend=$noprostart-1
   else
       noprostart=`grep "WAT"  complex_vdw_bonded.pdb | head -n 1 | awk '{print $2}'`
       let proend=$noprostart-1
   fi

   comall=`grep WAT complex_vdw_bonded.pdb  | tail -n 1 | awk '{print $2}'`
   comall=$(echo $comall)
   ligsec=$(echo $ligsec)
   prostart=$(echo $prostart)
   proend=$(echo $proend)
   sed -i 's/NTOTAL                  52499/NTOTAL                  '"$comall"'/g' extract_coords.mmpbsa
   sed -i 's/LSTOP                   51/LSTOP                   '"$ligsec"'/g' extract_coords.mmpbsa
   sed -i 's/RSTART                  52/RSTART                  '"$prostart"'/g' extract_coords.mmpbsa
   sed -i 's/RSTOP                   5327/RSTOP                   '"$proend"'/g' extract_coords.mmpbsa

   cd ..   
done

