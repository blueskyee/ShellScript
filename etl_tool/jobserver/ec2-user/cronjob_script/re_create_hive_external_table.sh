#!/bin/bash
#Author: Henry Chen
#Date: 2017/03/13
#Latest Update: 2017/03/13
#Description:
#	Re-create Hive external table to fix meta(partition data size) not align with row data on S3       
#       --input: Hive table list from RDS, which should execute "sync_table_list_from_hive.sh" to get Hive table list to RDS.


monitorhost="vpon-data-mysql.c3qoyo3nnife.ap-northeast-1.rds.amazonaws.com"
monitordb="data_monitor"
monitortable="monitor_table_basic_test"
monitorschematable="monitor_table_schema"
monitorparttable="monitor_table_partition"
monitoruser="root"
monitorpwd="123456"

environment='AWS'
storage_type='Hive'
table_type='EXTERNAL_TABLE'
test_db='temp'

table_schema_content='./log/table_schema.output'
create_script='./log/table_create_script.sh'
cp /dev/null ${table_schema_content}
cp /dev/null ${create_script}

mysql -N -h ${monitorhost} -u${monitoruser} -p${monitorpwd} ${monitordb} -e "select db_name,table_name from ${monitortable} where environment='${environment}' and storage_type='${storage_type}' and table_type='${table_type}'" | while read dbName tableName;
do
	#hive -e "show create table ${dbName}.${tableName}" | awk -F'TBLPROPERTIES' '{print $1}' >> ${table_schema_content}
	echo `hive -e "show create table ${dbName}.${tableName}"` | awk -F' TBLPROPERTIES' '{print $1}' | sed -e "s/\`//g" > ${table_schema_content}
	echo "hive -e \"drop table "${dbName}.${tableName}"\"" >> ${create_script}
	echo "hive -e \""`cat ${table_schema_content}`"\"" >> ${create_script}
	echo "hive -e \"msck repair table "${dbName}.${tableName}"\"" >> ${create_script}
done

chmod 755 ${create_script}
sh ${create_script} > ${create_script}.log

