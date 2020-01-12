#!/usr/bin/env python3

# Copyright 2018 - 2018, Robert Farmer
# SPDX-License-Identifier: GPL-2.0-or-later

import sys

# Makes template set of files


basename = sys.argv[1]

copyr = "Copyright 2018 - 2018, Robert Farmer"
spdx = "SPDX-License-Identifier: GPL-2.0-or-later"

comm_c = '// '
comm_f = "! "


with open('c'+basename+".c",'w') as f:
	print(comm_c+  copyr,file=f)
	print(comm_c + spdx,file=f)	
	print("",file=f)
	print('#include <stdlib.h>',file=f)
	print('#include <stdio.h>',file=f)
	print('#include <string.h>',file=f)
	print('#include "'+basename+'.h"',file=f)
	print("",file=f)
	print("int c_"+basename+"(const char * restrict ){",file=f)
	print("",file=f)
	print("}",file=f)
	
	
with open(basename+".h",'w') as f:
	print(comm_c + copyr,file=f)
	print(comm_c + spdx,file=f)
	print("",file=f)
	
	
with open(basename+".f90",'w') as f:
	print(comm_f + copyr_f,file=f)
	print(comm_f + spdx_f,file=f)
	print("",file=f)
	print("module m_"+basename,file=f)	
	print("    implicit none",file=f)
	print("",file=f)
	print("    private",file=f)
	print("    public :: "+basename,file=f)
	print("",file=f)
	print("    interface",file=f)
	print("",file=f)
	print("        function f_"+basename+"() bind(C,name='c_"+basename+"')",file=f)
	print("            use, intrinsic :: ISO_C_BINDING",file=f)
	print("",file=f)
	print("        end function f_"+basename,file=f)
	print("",file=f)
	print("    end interface",file=f)
	print("",file=f)
	print("    contains",file=f)
	print("",file=f)
	print("    integer function "+basename+"()",file=f)		
	print("",file=f)
	print("    end integer function "+basename,file=f)
	print("",file=f)
	print("end module m_"+basename,file=f)

