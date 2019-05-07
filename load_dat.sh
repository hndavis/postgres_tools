#!/bin/sh  
sourcedir=/efs/estimatesdata
outdir=/home/204618-PowerUser/postgres/data
postgrescmddir=/home/204618-PowerUser/postgres


echo "source dir is: $sourcedir"
while read  line 
do
    IFS=':' read -ra arr <<< "$line"
    table_name="${arr[0]}"
    file_prefix="${arr[1]}"
    count=0

  ##for entry in "$sourcedir"/*
  for entry in "$sourcedir/${file_prefix}"* 
  do
    echo entry= "$entry" 

    echo tablename= "$table_name"
    echo outdir= "$outdir"

    ./convert/convert "$entry"  > "${outdir}/${table_name}.$count.dat"
    echo count=$count
    echo "\copy ${table_name} from ${outdir}/${table_name}.${count}.dat with delimiter E'\t' NULL ''" > pload_text 
    psql -U ingres -d postgres -h datacloud-estimates-postgres.cri6pfqp2oyz.us-east-1.rds.amazonaws.com <pload_text
#    rm  "${outdir}/${table_name}.$count.dat"
      count=`expr $count + 1`
  done
done < table_names


