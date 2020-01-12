try:
	import unittest as unittest
except ImportError:
	import unittest2 as unittest
	
import os
import subprocess
import tempfile

import gfort2py as gf

os.chdir('test')
x=gf.fFort('../lib/libfSys.so','../include/fshell.mod',rerun=True)

class TestSystem(unittest.TestCase):
	def test_gfort2py(self):
		# Make sure it loaded correctly
		self.assertEqual(hasattr(x,'_funcs'),True)
		
class TestMkdir(unittest.TestCase):
	def test_make_empty(self):
		folder = tempfile.mkdtemp()
		os.rmdir(folder)
		x.mkdir(folder)
		self.assertEqual(os.path.isdir(folder),True)
		os.rmdir(folder)

	def test_make_existing(self):
		folder = tempfile.mkdtemp()
		x.mkdir(folder)
		self.assertEqual(os.path.isdir(folder),True)
		os.rmdir(folder)
		
	@unittest.skip("Broken for now")
	def test_make_p(self):
		f1 = tempfile.mkdtemp()
		folder=os.path.join(f1,'sub1','sub2','sub3')
		print(folder)
		x.mkdir_p(folder)
		self.assertEqual(os.path.isdir(folder),True)
		#os.rmdir(folder)
		
class TestMv(unittest.TestCase):
	def test_mv_same_folder(self):
		_, file_src = tempfile.mkstemp()
		_, file_dest = tempfile.mkstemp()
		os.remove(file_dest)
		x.mv(file_src, file_dest)
		self.assertEqual(os.path.isfile(file_dest),True)
		self.assertEqual(os.path.isfile(file_src),False)
		os.remove(file_dest)
		try:
			os.remove(file_src)
		except FileNotFoundError:
			pass

def suite():
    test_classes_to_run = [TestSystem, TestMkdir, TestMv]
    loader = unittest.TestLoader()
    suites_list = []
    for test_class in test_classes_to_run:
        suite = loader.loadTestsFromTestCase(test_class)
        suites_list.append(suite)

    big_suite = unittest.TestSuite(suites_list)    
    
    return big_suite

if __name__ == '__main__':
    runner = unittest.TextTestRunner()
    runner.run(suite())
