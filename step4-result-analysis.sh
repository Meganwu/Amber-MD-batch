# result analysis failure or success
ligands=`ls -d *MD/`
fail=0
success=0
for j in $ligands
do
     cd $j
     if [ -f "complex_vdw_bonded.pdb" ]; then
        let success=$success+1
        echo  $j mol exist!  >> ../success.txt
     else
        let fail=$fail+1
        echo $j mol no exist!  >> ../fail.txt
     fi

     cd ..
done
#echo fail ${fail}  success $success  >> fail.txt

