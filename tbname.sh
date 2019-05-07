#!/bin/sh
basename "/efs/estimatesdata/oof_0.txt" | gawk '{split($0,a,"_"); print a[1]}'
