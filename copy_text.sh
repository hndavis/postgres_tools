#!/bin/sh
table=$2
outpath=$3
count=1
table=ce_a
sourcedir=/efs/estimatesdata
outdir=/home/204618-PowerUser/postgres/data
postgrescmddir=/home/204618-PowerUser/postgres
echo "\copy ${table} from ${outdir}/${table}.${count}.dat with delimiter E'\t' NULL ''"
 
