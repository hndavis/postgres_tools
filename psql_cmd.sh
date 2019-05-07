#!/bin/sh 
# relies on .pgpass in $HOME  dir
# contents :
# 	datacloud-estimates-postgres.cri6pfqp2oyz.us-east-1.rds.amazonaws.com:5432:postgres:ingres:ingres123





if [ "$#" -ne 1 ] 
then
	psql -U ingres -d postgres -h datacloud-estimates-postgres.cri6pfqp2oyz.us-east-1.rds.amazonaws.com
else

	sqlCmd=$1
	 psql -U ingres -d postgres -h datacloud-estimates-postgres.cri6pfqp2oyz.us-east-1.rds.amazonaws.com -c "$sqlCmd"
fi

