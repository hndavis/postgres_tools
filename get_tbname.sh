#!/bin/sh
basename $1 | gawk '{split($0,a,"_"); print a[1]}'
