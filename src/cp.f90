! Copyright 2018 - 2020, Robert Farmer
! SPDX-License-Identifier: GPL-2.0-or-later

module m_cp
    use fSystem
    implicit none

    private
    public :: cp

    interface

        function f_cp(src, dest) bind(C,name='c_cp')
            use, intrinsic :: ISO_C_BINDING
            character(kind=C_CHAR) :: src(*), dest(*)
        end function f_cp

    end interface

    contains

    integer function cp(src, dest)
      character(len=*), intent(in) :: src, dest
    
      cp = f_cp(f_c_string(src), f_c_string(dest))
    
    end function cp

end module m_cp
