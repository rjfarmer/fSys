// Copyright 2018 - 2020, Robert Farmer
// SPDX-License-Identifier: GPL-2.0-or-later

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>
#include <errno.h>
#include "chmod.h"

int c_chmod(const char * restrict pathname,  struct permissions * mode){
    mode_t _mode;
    int ret;
    
    _mode = 0;
    
    if(mode->user.r)
        _mode ^= S_IRUSR;
    if(mode->user.w)
        _mode ^= S_IWUSR;
    if(mode->user.e)
        _mode ^= S_IXUSR;    
        
    if(mode->group.r)
        _mode ^= S_IRGRP;
    if(mode->group.w)
        _mode ^= S_IWGRP;
    if(mode->group.e)
        _mode ^= S_IXGRP;    
        
    if(mode->others.r)
        _mode ^= S_IROTH;
    if(mode->others.w)
        _mode ^= S_IWOTH;
    if(mode->others.e)
        _mode ^= S_IXOTH;    
    
    
    ret = chmod(pathname, _mode);
    if ( ret != 0)
        return errno;
    
    return 0;
}

int c_get_mode(const char * restrict pathname,  struct permissions * mode){
    struct stat statRes;
    mode_t _mode;
    
    if (stat(pathname, &statRes) < 0)
        return errno;
        
    _mode = statRes.st_mode;
    
    if (_mode & S_IRUSR)
		mode->user.r = 1;
	if(_mode & S_IWUSR)
		mode->user.w = 1;
	if(_mode &  S_IXUSR)
		mode->user.e = 1;
 
    if (_mode & S_IRGRP)
		mode->group.r = 1;
	if(_mode & S_IWGRP)
		mode->group.w = 1;
	if(_mode &  S_IXGRP)
		mode->group.e = 1;
		
    if (_mode & S_IROTH)
		mode->others.r = 1;
	if(_mode & S_IWOTH)
		mode->others.w = 1;
	if(_mode &  S_IXOTH)
		mode->others.e = 1;    
        
    return 0;
}

