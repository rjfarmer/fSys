// Copyright 2018 - 2020, Robert Farmer
// SPDX-License-Identifier: GPL-2.0-or-later

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "mv.h"

int c_mv(const char * restrict src, const char * restrict dest ){
    return rename(src, dest);
}
