#!/bin/bash

monitorhost="vpon-data-mysql.c3qoyo3nnife.ap-northeast-1.rds.amazonaws.com"
monitordb="data_monitor"
monitortable="monitor_table_basic_test"
monitoruser="root"
monitorpwd="123456"

environment='AWS'
storage_type='Hive'

mysql -N -h ${monitorhost} -u${monitoruser} -p${monitorpwd} ${monitordb} -e "select db_name,table_name from monitor_table_basic_test where environment='${environment}' and storage_type='${storage_type}'" | while read dbName tableName;
do
	echo "${dbName}::${tableName}"
done

