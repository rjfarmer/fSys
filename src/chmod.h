// Copyright 2018 - 2020, Robert Farmer
// SPDX-License-Identifier: GPL-2.0-or-later

#include <stdio.h>
#include <sys/stat.h>

struct permission{
    _Bool r, w, e;
} permission;

struct  permissions {
    struct permission user,  group, others;
};


int c_chmod(const char * restrict pathname, struct permissions * mode);
int c_get_mode(const char * restrict pathname,  struct permissions * mode);
