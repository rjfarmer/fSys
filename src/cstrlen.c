// Copyright 2018 - 2018, Robert Farmer
// SPDX-License-Identifier: GPL-2.0-or-later

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "strlen.h"

int c_strlen(const char * restrict c_str){
	return strlen(c_str);
}
