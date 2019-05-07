export RDSHOST="datacloud-estimates-postgres.cri6pfqp2oyz.us-east-1.rds.amazonaws.com"
export PGPASSWORD="$(aws rds generate-db-auth-token --hostname $RDSHOST --port 5432 --region us-east-1 --username ingres )"
