#!/bin/bash

declare -a dates=("2016-05-06" "2016-05-07" "2016-05-24" "2016-06-04" "2016-06-11" "2016-06-25")

> reload_etl_by_dates.log

for i in "${dates[@]}"
do
	echo "sudo -u hood /bin/sh /home/hood/profile_device_app_detection_date/run_profile_device_app_detection_date_recovery.sh ${i} &>/home/hood/profile_device_app_detection_date/run_profile_device_app_detection_date_recovery.log" >> reload_etl_by_dates.log 
	sudo -u hood /bin/sh /home/hood/profile_device_app_detection_date/run_profile_device_app_detection_date_recovery.sh ${i} &>/home/hood/profile_device_app_detection_date/run_profile_device_app_detection_date_recovery.log
	sleep 60s
done
