import unittest2 as unittest
import os
import subprocess

import gfort2py as gf

os.chdir('test')
x=gf.fFort('../lib/libfSys.so','../include/fshell.mod',rerun=True)

class TestFSys(unittest.TestCase):
	pass

if __name__ == '__main__':
    unittest.main()
