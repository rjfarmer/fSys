// Copyright 2018 - 2020, Robert Farmer
// SPDX-License-Identifier: GPL-2.0-or-later

// TODO: Work out which ones we dont need
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>   /* mkdir(2) */
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/types.h>
#include "mkdir.h"
#include "cutils.h"


int c_mkdir(const char * restrict path) {
    if (mkdir(path, S_IRWXU) != SUCCESS) {
        if (errno != EEXIST)
            return errno; 
    }
    return SUCCESS;
}


int c_mkdir_p(char * restrict path) {
    char *p; 
    int ret;

    /* Iterate the string */
    for (p = path; *p; p++) {
        if (*p == '/') {
            /* Temporarily truncate */
            *p = '\0';

			ret = c_mkdir(path);
            if(ret != SUCCESS)
                return ret;

            *p = '/';
        }
    }   
    ret = c_mkdir(path);
    if(ret != SUCCESS)
        return ret;

    return SUCCESS;
}
