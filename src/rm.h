// Copyright 2018 - 2020, Robert Farmer
// SPDX-License-Identifier: GPL-2.0-or-later

#define _XOPEN_SOURCE 500 // For FTW

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ftw.h>
#include <unistd.h>

int c_rm_file(const char * restrict filename);
int c_rm_dir(const char * restrict folder);
int  unlink_path(const char * restrict fpath, const struct stat *sb, int typeflag, struct FTW *ftwbuf);
