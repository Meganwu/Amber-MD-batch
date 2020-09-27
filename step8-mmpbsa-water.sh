#! /bin/bash
filename=`ls -d *MD/`
for i in $filename
do
     cd $i
     cp ../mmpbsa2.in    .
     MMPBSA.py  -O -i mmpbsa2.in -o FINAL_RESULTS_MMPBSA.dat -sp complex_vdw_bonded.prmtop  -cp complex.prmtop -rp protein.prmtop -lp lig.prmtop -y  complex_equil.mdcrd
     cd ..
done


