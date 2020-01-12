// Copyright 2018 - 2020, Robert Farmer
// SPDX-License-Identifier: GPL-2.0-or-later

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>
#include "chmod.h"

int c_chmod(const char * restrict pathname,  struct permissions * mode){
	mode_t _mode;
	
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
	
	
	return chmod(pathname, _mode);
}