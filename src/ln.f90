! Copyright 2018 - 2020, Robert Farmer
! SPDX-License-Identifier: GPL-2.0-or-later

module m_ln
    use fSystem
    implicit none

    private
    public :: ln

    interface

        function f_ln(src, dest, force) bind(C,name='c_ln')
            use, intrinsic :: ISO_C_BINDING
            character(kind=C_CHAR) :: src(*), dest(*)
            logical(C_BOOL) :: force
        end function f_ln

    end interface

    contains

    integer function ln(src, dest, force)
        character(len=*), intent(in) :: src, dest
        logical, intent(in) :: force
        
        ln = f_ln(f_c_string(src), f_c_string(dest), logical(force,kind=C_BOOL))
        
    end function ln

end module m_ln