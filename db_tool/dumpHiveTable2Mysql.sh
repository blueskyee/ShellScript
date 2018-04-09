#!/bin/bash

hive -e "
select * from temp.app_catg_preference_by_individual
" > ./app_catg_preference_by_individual.dump

(mysql -h "vpon-data-mysql.c3qoyo3nnife.ap-northeast-1.rds.amazonaws.com" --user=root --password=123456 tmp -e "LOAD DATA LOCAL INFILE './app_catg_preference_by_individual.d
