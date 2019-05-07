#!/bin/sh -x
# relies on .pgpass in $HOME  dir
# contents :
# 	datacloud-estimates-postgres.cri6pfqp2oyz.us-east-1.rds.amazonaws.com:5432:postgres:ingres:ingres123
 
psql -U ingres -d postgres -h datacloud-estimates-postgres.cri6pfqp2oyz.us-east-1.rds.amazonaws.com <<EOF
select count(*) from ce_a;
EOF
