! Copyright 2018 - 2020, Robert Farmer
! SPDX-License-Identifier: GPL-2.0-or-later

module m_chmod
    use fSystem
    implicit none

    private
    public :: chmod

    interface

        function f_chmod(filename, mode) bind(C,name='c_chmod')
            use, intrinsic :: ISO_C_BINDING, only: C_CHAR
            use fSystem
            character(kind=C_CHAR) :: filename(*)
            type(permissions) :: mode
        end function f_chmod

    end interface
    
    contains

    integer function chmod(filename, mode)
      character(len=*), intent(in) :: filename
      type(permissions), intent(in) :: mode
    
      chmod = f_chmod(f_c_string(filename), mode)

    end function chmod

end module m_chmod
