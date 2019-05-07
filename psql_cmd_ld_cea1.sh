#!/bin/sh -x
psql -U ingres -d postgres -h datacloud-estimates-postgres.cri6pfqp2oyz.us-east-1.rds.amazonaws.com <./pload_text
