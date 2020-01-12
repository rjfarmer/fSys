! Copyright 2018 - 2020, Robert Farmer
! SPDX-License-Identifier: GPL-2.0-or-later

module m_mv
    use fSystem
    implicit none

    private
    public :: mv

    interface

	function f_mv(src, dest) bind(C,name='c_mv')
			 use, intrinsic :: ISO_C_BINDING, only: C_CHAR, C_INT
			 integer(C_INT) :: f_mv
			 character(kind=C_CHAR) :: src(*), dest(*)
	end function f_mv

    end interface

    contains

    integer function mv(src, dest)
	  character(len=*), intent(in) :: src, dest
	
	  mv = f_mv(f_c_string(src),  f_c_string(dest))		

    end function mv

end module m_mv
