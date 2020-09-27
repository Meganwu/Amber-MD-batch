import os
with open('name.txt','r') as f:
      file=f.readlines()
      for i in file:
         name=i.strip().split('_')[0]
         proname=name+'.pdb'
         filename=name+'MD'
         os.system('mkdir  combine/%s ' % filename)
         os.system('cp  pure-protein/%s  combine/%s' % (proname, filename))
         os.system('cp  -a pure-ligand/succ-file/%s  combine/%s' % (i.strip(), filename))
         os.system('cp combine/%s/%s    combine/%s/clean.pdb' % (filename, proname, filename))
         os.system('cp combine/%s/*/lig.*   combine/%s' % (filename, filename))
         os.system('cp leap2.in  combine/%s' % filename)       
 
