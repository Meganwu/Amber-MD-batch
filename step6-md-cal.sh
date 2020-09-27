#!/bin/bash

filename=`ls -d *MD/`
sander16='mpirun -np 12 sander.MPI'
for i in $filename
do
   cd $i
   $sander16 -O -i min.in -o min.out -p complex_vdw_bonded.prmtop -c complex_vdw_bonded.inpcrd -r complex_min.rst -ref complex_vdw_bonded.inpcrd 

   $sander16 -O -i heat.in -o heat.out -p complex_vdw_bonded.prmtop -c complex_min.rst -r complex_heat.rst -x complex_heat.mdcrd -ref complex_min.rst 

   $sander16 -O -i density.in -o density.out -p complex_vdw_bonded.prmtop -c complex_heat.rst -r complex_density.rst -x complex_density.mdcrd -ref complex_heat.rst
gzip-9 complex_density.mdcrd

   $sander16 -O -i equil.in -o equil.out -p complex_vdw_bonded.prmtop  -c complex_density.rst -r complex_equil.rst -x complex_equil.mdcrd 

   cd ..   
done

