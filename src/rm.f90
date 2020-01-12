! Copyright 2018 - 2020, Robert Farmer
! SPDX-License-Identifier: GPL-2.0-or-later

module m_rm
    use fSystem
    implicit none

    private
    public :: rm_file, rm_dir

    interface

        function f_rm_file(filename) bind(C,name='c_rm_file')
            use, intrinsic :: ISO_C_BINDING
            character(kind=C_CHAR) :: filename(*)
        end function f_rm_file
        
        function f_rm_dir(folder) bind(C,name='c_rm_dir')
            use, intrinsic :: ISO_C_BINDING
            character(kind=C_CHAR) :: folder(*)
        end function f_rm_dir

    end interface

    contains

    integer function rm_file(filename)
        character(len=*), intent(in) :: filename
        
        rm_file  = f_rm_file(f_c_string(filename))
    end function rm_file
    
    
    integer function rm_dir(folder)
        character(len=*), intent(in) :: folder
        
        rm_dir  = f_rm_dir(f_c_string(folder))
    end function rm_dir

end module m_rm
