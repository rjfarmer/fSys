! Copyright 2018 - 2020, Robert Farmer
! SPDX-License-Identifier: GPL-2.0-or-later

module fSystem
	use m_strlen, only: strlen
    use, intrinsic :: ISO_C_BINDING
	implicit none
		
			
	type, bind(c) :: permission
	    logical(C_BOOL) :: r = .false.
	    logical(C_BOOL) :: w = .false.
	    logical(C_BOOL) :: e = .false.
	end type 
	
	type, bind(c) :: permissions
		type(permission) :: user, group, others
	end type 
		
	contains
	
	pure function f_c_string (f_str) result (c_str)
		use, intrinsic :: ISO_C_BINDING
		character(len=*), intent(in) :: f_str
		character(len=1,kind=C_CHAR) :: c_str(len_trim(f_str)+1)
		integer                      :: n, i
		
		n = len_trim(f_str)
		do i = 1, n
			c_str(i) = f_str(i:i)
		end do
		c_str(n + 1) = C_NULL_CHAR
	
	end function f_c_string 
	
	subroutine c_f_string (c_str_ptr, f_str) 
		use, intrinsic :: ISO_C_BINDING
		type(C_PTR), target, intent(in)  :: c_str_ptr
		character(len=:), allocatable, intent(out) :: f_str
		character, pointer, dimension(:) :: tmp => null()
		integer                          :: n, i
		
		n = strlen(c_str_ptr)
		allocate(character(len=n-1) :: f_str)
		f_str = ''
		
		call c_f_pointer(c_str_ptr, tmp, [n])
		
		do i = 1, n
			if (tmp(i) == C_NULL_CHAR) exit
		end do
	
		f_str = transfer(tmp(1:i-1), f_str)

	end subroutine c_f_string


end module fSystem
