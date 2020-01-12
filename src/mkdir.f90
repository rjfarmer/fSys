! Copyright 2018 - 2020, Robert Farmer
! SPDX-License-Identifier: GPL-2.0-or-later

module m_mkdir
	use fSystem 
	implicit none
	
    private
    public :: mkdir, mkdir_p

	
	interface 
	  function f_mkdir_p(folder) bind(C,name='c_mkdir_p')
		 use, intrinsic :: ISO_C_BINDING, only: C_CHAR, C_INT
		 integer(C_INT) :: f_mkdir_p
		 character(kind=C_CHAR) :: folder(*)
	  end function f_mkdir_p
	  
	  function f_mkdir(folder) bind(C,name='c_mkdir')
		 use, intrinsic :: ISO_C_BINDING, only: C_CHAR, C_INT
		 integer(C_INT) :: f_mkdir
		 character(kind=C_CHAR) :: folder(*)
	  end function f_mkdir
	  
	end interface 
	

	contains
	
	integer function mkdir_p(folder)
	  character(len=*), intent(in) :: folder
	
	  mkdir_p = f_mkdir_p(f_c_string(folder))
	
	end function mkdir_p
	
	integer function mkdir(folder)
	  character(len=*), intent(in) :: folder
	
	  mkdir = f_mkdir(f_c_string(folder))
	
	end function mkdir

end module m_mkdir
