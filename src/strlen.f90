! Copyright 2018 - 2020, Robert Farmer
! SPDX-License-Identifier: GPL-2.0-or-later

module m_strlen
    use, intrinsic :: ISO_C_BINDING
    implicit none
    
    private
    public :: strlen

    interface

        function f_strlen(c_str_ptr) bind(C,name='c_strlen')
            use, intrinsic :: ISO_C_BINDING
			integer :: f_strlen
			type(C_PTR), target, intent(in)  :: c_str_ptr
        end function f_strlen

    end interface

    contains

    integer function strlen(c_str_ptr)
		type(C_PTR), target, intent(in)  :: c_str_ptr

		strlen = f_strlen(c_str_ptr)
    end function strlen

end module m_strlen
