#!/bin/sh
sourcedir=/efs/estimatesdata
outdir=/home/204618-PowerUser/postgres/data
postgrescmddir=/home/204618-PowerUser/postgres

while read table_name 
do

	echo $table_name
	for entry in "${sourcedir}/${table_name}*"
	do	
		echo $entry
	done

done < "${postgrescmddir}/table_names"

