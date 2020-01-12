// Copyright 2018 - 2020, Robert Farmer
// SPDX-License-Identifier: GPL-2.0-or-later

#define _XOPEN_SOURCE 500 // For FTW

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ftw.h>
#include <unistd.h>
#include <errno.h>
#include "rm.h"

int c_rm_file(const char * restrict filename){
	int ret;
	
	ret = remove(filename);
	if ( ret != 0)
		return errno;
	
	return 0;
}


int c_rm_dir(const char * restrict folder){
	int ret;
	
	ret = nftw(folder, unlink_path, 64, FTW_DEPTH | FTW_PHYS);
	if ( ret != 0)
		return errno;
	
	return 0;	
}

int  unlink_path(const char * restrict fpath, const struct stat *sb, int typeflag, struct FTW *ftwbuf){
	int ret;
	
	ret = remove(fpath);
	if ( ret != 0)
		return errno;
	
	return ret;
}	
