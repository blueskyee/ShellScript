#!/bin/bash
###nohup sh data_load.sh > data_load.log 2>&1 &

d=2015-01-02
while [ "$d" != 2015-01-05 ]; do
    echo "import data date:"$d
    aws s3 cp s3://vpon.dmp.input.prod/adn.app_log/app_log_tw_pas/dt=${d}/${d}.tar /spark-tmp0/app_log_tw/${d}.tar
    tar -xvf /spark-tmp0/app_log_tw/${d}.tar
    aws s3 sync /spark-tmp0/app_log_tw/${d} s3://vpon.dmp.input.prod/adn.app_log/app_log_tw/dt=${d}
    rm -rf /spark-tmp0/app_log_tw/${d}
    rm /spark-tmp0/app_log_tw/${d}.tar
    d=$(date -I -d "$d + 1 day")
done

(hive -e "MSCK REPAIR TABLE dmpdata.app_log_tw")
