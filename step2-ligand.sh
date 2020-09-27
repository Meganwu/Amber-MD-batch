#! /bin/bash
for i in new
do
   cd $i
   ligands=`ls *pdb`
   for j in $ligands
   do
     b=`basename $j .pdb`
     mkdir   $b
     mv $j   $b
     cd $b
     antechamber -i $j  -fi pdb -o lig.mol2 -fo mol2 -c bcc -s 2
     parmchk2 -i lig.mol2 -f mol2 -o lig.frcmod
     tleap -f ../leap.in
     cd ..
    done
done

