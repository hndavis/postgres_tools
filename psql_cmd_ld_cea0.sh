#!/bin/sh -x
# relies on .pgpass in $HOME  dir
# contents :
# 	datacloud-estimates-postgres.cri6pfqp2oyz.us-east-1.rds.amazonaws.com:5432:postgres:ingres:ingres123
 
psql -U ingres -d postgres -h datacloud-estimates-postgres.cri6pfqp2oyz.us-east-1.rds.amazonaws.com <<EOF
\copy ce_a from '/home/204618-PowerUser/postgres/data/ce_a.0.dat' with delimiter E'\t' NULL ''

EOF
