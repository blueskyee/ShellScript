#for (( i=52; i>0; i=i-1 ))
#do
#        date=`date +%Y-%m-%d --date="-${i} day"`
#        #w=$(($i+7))
#        #w_date=`date +%Y-%m-%d --date="-${w} day"`
#        echo "date: ${date}"
#        #echo "w_date: ${w_date}"
#done

d=2016-07-01
while [ "$d" != 2016-07-10 ]; do 
	echo "import data date:"$d
	sudo -u hood mysql -h 10.0.6.12 -uroot -p123456 db_profile -e "LOAD DATA LOCAL INFILE '/home/hood/profile_device_apps_adn_date/profile_device_apps_adn_date_${d}_sts_daily' into table profile_device_apps_adn_date_sts_daily" 
	sleep 5
	sudo -u hood mysql -h 10.0.6.12 -uroot -p123456 db_profile -e "LOAD DATA LOCAL INFILE '/home/hood/profile_device_apps_adn_date/profile_device_apps_adn_date_${d}_sts_all' into table profile_device_apps_adn_date_sts_all"
	sleep 5
	sudo -u hood mysql -h 10.0.6.12 -uroot -p123456 db_profile -e "LOAD DATA LOCAL INFILE '/home/hood/profile_device_apps_ats_date/profile_device_apps_ats_date_${d}_sts_daily' into table profile_device_apps_ats_date_sts_daily"
	sleep 5
	sudo -u hood mysql -h 10.0.6.12 -uroot -p123456 db_profile -e "LOAD DATA LOCAL INFILE '/home/hood/profile_device_apps_ats_date/profile_device_apps_ats_date_${d}_sts_all' into table profile_device_apps_ats_date_sts_all"
        sleep 5
	sudo -u hood mysql -h 10.0.6.12 -uroot -p123456 db_profile -e "LOAD DATA LOCAL INFILE '/home/hood/profile_device_board_title_date/profile_device_board_title_date_${d}_sts_daily' into table profile_device_board_title_date_sts_daily"
	sleep 5
	sudo -u hood mysql -h 10.0.6.12 -uroot -p123456 db_profile -e "LOAD DATA LOCAL INFILE '/home/hood/profile_device_board_title_date/profile_device_board_title_date_${d}_sts_all' into table profile_device_board_title_date_sts_all"
	sleep 5
	sudo -u hood mysql -h 10.0.6.12 -uroot -p123456 db_profile -e "LOAD DATA LOCAL INFILE '/home/hood/profile_device_brand_model_date/profile_device_brand_model_date_${d}_sts_daily' into table profile_device_brand_model_date_sts_daily"
	sleep 5
	sudo -u hood mysql -h 10.0.6.12 -uroot -p123456 db_profile -e "LOAD DATA LOCAL INFILE '/home/hood/profile_device_brand_model_date/profile_device_brand_model_date_${d}_sts_all' into table profile_device_brand_model_date_sts_all"
	sleep 5
	sudo -u hood mysql -h 10.0.6.12 -uroot -p123456 db_profile -e "LOAD DATA LOCAL INFILE '/home/hood/profile_device_campaign_email_date/profile_device_campaign_email_date_${d}_sts_daily' into table profile_device_campaign_email_date_sts_daily"
	sleep 5
	sudo -u hood mysql -h 10.0.6.12 -uroot -p123456 db_profile -e "LOAD DATA LOCAL INFILE '/home/hood/profile_device_campaign_email_date/profile_device_campaign_email_date_${d}_sts_all' into table profile_device_campaign_email_date_sts_all"
	sleep 5
	
	d=$(date -I -d "$d + 1 day")
done
