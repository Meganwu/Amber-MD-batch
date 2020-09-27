#!bash/bin
import os
import numpy as np
from pymol import *
with open('pdb-name','r') as f:
      for i in f.readlines():
          name=i

name=name.strip().split()
#cmd.save('test.pdb','chain '+'B ' + 'and ' + 'resn '+'SER')
#cmd.save('test.pdb',' 5ml3_protein '+ 'and ' + 'resn '+'SER')
name_p=[]
name_p=[str(x)+'_protein.pdb' for x in name]
def rmsol_p(name_p):
  for i in name_p:
     if os.path.exists(i): 
         cmd.load(i)
         cmd.remove('solvent')
         newname=i.split('_')[0]
         newnamew=i.split('.')[0]
         newname=newname+'.pdb'
         cmd.save(newname,newnamew)
     else:
         print "%s File is not accessible." % i
