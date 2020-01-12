! Copyright 2018 - 2020, Robert Farmer
! SPDX-License-Identifier: GPL-2.0-or-later

module m_chmod
    use fSystem
    implicit none

    private
    public :: chmod, get_mode

    interface

        function f_chmod(filename, mode) bind(C,name='c_chmod')
            use, intrinsic :: ISO_C_BINDING, only: C_CHAR
            use fSystem
            integer(C_INT) :: f_chmod
            character(kind=C_CHAR) :: filename(*)
            type(permissions) :: mode
        end function f_chmod
        
        function f_get_mode(filename) bind(C,name='c_get_mode')
            use, intrinsic :: ISO_C_BINDING, only: C_CHAR
            use fSystem
            type(permissions) :: f_get_mode
            character(kind=C_CHAR) :: filename(*)
        end function f_get_mode

    end interface
    
    contains

    integer function chmod(filename, mode)
      character(len=*), intent(in) :: filename
      type(permissions), intent(in) :: mode
    
      chmod = f_chmod(f_c_string(filename), mode)

    end function chmod
    
    type(permissions) function get_mode(filename)
      character(len=*), intent(in) :: filename
    
      get_mode = f_get_mode(f_c_string(filename))

    end function get_mode

end module m_chmod
