// Copyright 2018 - 2020, Robert Farmer
// SPDX-License-Identifier: GPL-2.0-or-later

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include "ln.h"

int c_ln(const char * restrict src, const char * restrict dest, const int force){
    int ret;
    
    if( force==1 && access( dest, F_OK ) != -1 ) {
            ret = remove(dest);
            if ( ret != 0)
                return errno;
    }
    
    ret = symlink(src, dest);
    if ( ret != 0)
        return errno;
    
    return 0;
}
