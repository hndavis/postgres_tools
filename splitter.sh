#!/bin/sh
gawk '{split($1,a,"\\";) print a[2] a[1]}'
