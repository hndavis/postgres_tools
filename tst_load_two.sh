#!/bin/sh 

while read line
do
	echo line=$line
	IFS=':' read -ra arr <<< "$line"
	echo "${arr[@]}"
	echo arr[0]= "${arr[0]}"
	echo arr[1]= "${arr[1]}"
done < table_names 
