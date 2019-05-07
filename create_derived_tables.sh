#!/bin/sh
#./psql_cmd.sh "truncate table pvafxmaxdate"

#./psql_cmd.sh "insert into pvafxmaxdate \
#select fxdata.currency, fxdata.currencypermid, fxdata.fxclose, fxdata.tradedate \
#from pvafx fxdata, (select currency, currencypermid, max(tradedate) maxdate from pvafx where currencypermid != 0 group by currency, currencypermid) fxmaxdates \
#where fxdata.currencypermid = fxmaxdates.currencypermid and fxdata.tradedate = fxmaxdates.maxdate;"

./psql_cmd.sh "drop table period_index_range"
./psql_cmd.sh "drop table open_periodic"
./psql_cmd.sh "create table open_periodic as \
   select \
   *,(periodindex + 1) as fperiodindex \
   from period_index \
   where periodicity = 3 \
   and expiredate is null;"

./psql_cmd.sh "create index open_periodic_idx_1 on open_periodic (estimatedid, periodtype, periodindex); \
               create index open_periodic_idx_2 on open_periodic (estimatedid, periodtype, fperiodindex);"


./psql_cmd.sh "create table period_index_range as \
   select \
   a.estimatedid, \
   a.periodtype, \
   COALESCE(b.prelimdate,date('0001-01-01')) prelimdate_start, \
   COALESCE(a.prelimdate,case when a.periodindex > 0 then date('9999-12-31') else a.periodend end) prelimdate_end, \
   COALESCE(b.periodend,date('0001-01-01')) periodend_start, \
   a.periodend as periodend_end, \
   a.periodindex \
   from open_periodic a \
   left outer join open_periodic b on a.estimatedid = b.estimatedid \
   and a.periodtype = b.periodtype \
   and a.periodindex = b.fperiodindex;"



./psql_cmd.sh "drop table period_index_max"

./psql_cmd.sh "create table  period_index_max\
 as select estimatedid, periodtype, max ( prelimdate_end ) as max_prelimdate, max( periodend_end) as max_periodend \
from period_index_range group by estimatedid, periodtype;"


./psql_cmd.sh "drop table ce_a_nts;"
./psql_cmd.sh "create table  ce_a_nts  as select * from ce_a where expiredate is null"

