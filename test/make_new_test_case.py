#!/usr/bin/env python3

# Copyright 2018 - 2020, Robert Farmer
# SPDX-License-Identifier: GPL-2.0-or-later

import sys

basename = sys.argv[1]
test_num =   sys.argv[2]

copyr = "Copyright 2018 - 2020, Robert Farmer"
spdx = "SPDX-License-Identifier: GPL-2.0-or-later"

comm_c = '// '
comm_f = "! "

def one_str(basename,test_num):
	with open(basename+"_"+str(test_num)+".f90",'w') as f:
		print(comm_f + copyr,file=f)
		print(comm_f + spdx,file=f)
		print('program test', file=f)
		print('	use fshell', file=f)
		print('	implicit none', file=f)
		print('	character(len=256) :: arg1', file=f)
		print('	call get_command_argument(1,arg1)', file=f)
		print('	write(*,*)', basename,'(arg1)')
		print('end program test')
	
def two_str(basename,test_num):
	with open(basename+"_"+str(test_num)+".f90",'w') as f:
		print(comm_f + copyr,file=f)
		print(comm_f + spdx,file=f)
		print('program test', file=f)
		print('	use fshell', file=f)
		print('	implicit none', file=f)
		print('	character(len=256) :: arg1', file=f)
		print('	character(len=256) :: arg2', file=f)
		print('	call get_command_argument(1,arg1)', file=f)
		print('	call get_command_argument(2,arg2)', file=f)
		print('	write(*,*)', basename,'(arg1, arg2)')
		print('end program test')
		
def two_str_flag(basename,test_num):
	with open(basename+"_"+str(test_num)+".f90",'w') as f:
		print(comm_f + copyr,file=f)
		print(comm_f + spdx,file=f)
		print('program test', file=f)
		print('	use fshell', file=f)
		print('	implicit none', file=f)
		print('	character(len=256) :: arg1,arg2,arg3', file=f)
		print('	logical :: flag = .false.', file=f)
		print('	call get_command_argument(1,arg1)', file=f)
		print('	call get_command_argument(2,arg2)', file=f)
		print('	call get_command_argument(3,arg3)', file=f)
		print('	if(arg3(0:0)=="1") flag=.true.', file=f)
		print('	write(*,*)', basename,'(arg1, arg2, flag)')
		print('end program test')
