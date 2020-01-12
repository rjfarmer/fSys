// Copyright 2018 - 2020, Robert Farmer
// SPDX-License-Identifier: GPL-2.0-or-later

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/sendfile.h>
#include <fcntl.h>
#include <unistd.h>
#include "cp.h"

int c_cp(const char * restrict src, const char * restrict dest){
    int in_fd, out_fd;
    int ret;
    off_t *offset;
    size_t file_size;
    
    offset = NULL;
    
    in_fd= open(src, O_RDONLY);
    if (in_fd < 0)
        return errno;

    file_size = fsize(src);
    if(file_size < 0)
        goto error;

    out_fd = creat(dest, S_IRUSR|S_IWUSR);
    if (out_fd < 0)
        goto error;    


    ret = sendfile(out_fd, in_fd, offset, file_size);
    if (ret < 0)
        goto error;
       

    close(in_fd);
    close(out_fd);
    return 0;


    error:
         if(in_fd >= 0)
            close(in_fd);
        if (out_fd >= 0)
            close(out_fd);
        return errno;
    
}

off_t fsize(const char * restrict filename) {
    struct stat st; 

    if (stat(filename, &st) == 0)
        return st.st_size;

    return -1; 
}
