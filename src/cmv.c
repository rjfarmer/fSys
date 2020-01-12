// Copyright 2018 - 2020, Robert Farmer
// SPDX-License-Identifier: GPL-2.0-or-later

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include "mv.h"

int c_mv(const char * restrict src, const char * restrict dest ){
    int ret;
    
    ret = rename(src, dest);
    if ( ret != 0)
        return errno;
    
    return 0;
}
