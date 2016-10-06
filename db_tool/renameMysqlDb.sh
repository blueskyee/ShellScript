#!/bin/bash
#> create database dsp_report;
#> grant ALL PRIVILEGES on dsp_report.* to 'root';

for table in `mysql -h vpon-data-mysql.c3qoyo3nnife.ap-northeast-1.rds.amazonaws.com -uroot -p123456 -s -N -e "use gil;show tables from gil;"`; do
	echo $table
	mysql -h vpon-data-mysql.c3qoyo3nnife.ap-northeast-1.rds.amazonaws.com -uroot -p123456 -s -N -e "use gil;rename table gil.$table to dsp_report.$table;";
done

#> drop database gil;
