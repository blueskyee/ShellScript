#!/bin/bash

#DSP
date +"%R start repair dsp tables"
hive -e "MSCK REPAIR TABLE dspdata.traffic_log"

#EC
date +"%R start repair ec tables"
hive -e "MSCK REPAIR TABLE dmpdata.event_tracking"
hive -e "MSCK REPAIR TABLE dmpdata.event_tracking_ec_item_dt"
hive -e "MSCK REPAIR TABLE dmpdata.event_tracking_ec_parse_dt"
hive -e "MSCK REPAIR TABLE dmpdata.mapper_ec_client2member_dt"
hive -e "MSCK REPAIR TABLE dmpdata.ec_daily_come_from"
hive -e "MSCK REPAIR TABLE dmpdata.ec_checkout_data"
hive -e "MSCK REPAIR TABLE dmpdata.ec_rfm"
hive -e "MSCK REPAIR TABLE dmpdata.ec_time_uus"
hive -e "MSCK REPAIR TABLE dmpdata.ec_daily_funnel"
hive -e "MSCK REPAIR TABLE dmpdata.ec_hourly_comefrom_cvr"
hive -e "MSCK REPAIR TABLE dmpdata.ec_daily_pvconvert"
hive -e "MSCK REPAIR TABLE dmpdata.ec_comefrom_funnel"
hive -e "MSCK REPAIR TABLE dmpdata.social_account"

#App log
date +"%R start repair app log tables"
hive -e "MSCK REPAIR TABLE dmpdata.app_log_tw"
hive -e "MSCK REPAIR TABLE dmpdata.profile_device_response_basis_date"
hive -e "MSCK REPAIR TABLE dmpdata.profile_inventory_city_tw_date"
hive -e "MSCK REPAIR TABLE dmpdata.profile_inventory_country_app_date"
hive -e "MSCK REPAIR TABLE dmpdata.profile_inventory_country_date"
hive -e "MSCK REPAIR TABLE dmpdata.profile_inventory_region_hk_date"
hive -e "MSCK REPAIR TABLE dmpdata.profile_device_campaign_email_date"
hive -e "MSCK REPAIR TABLE dmpdata.profile_device_offer_category_date"
hive -e "MSCK REPAIR TABLE dmpdata.profile_device_brand_model_date"
hive -e "MSCK REPAIR TABLE dmpdata.profile_device_board_title_date"
hive -e "MSCK REPAIR TABLE dmpdata.profile_device_apps_ats_date"
hive -e "MSCK REPAIR TABLE dmpdata.profile_device_apps_adn_date"
hive -e "MSCK REPAIR TABLE dmpdata.profile_device_browser_dt"

#App detection
date +"%R start repair app detection tables"
hive -e "MSCK REPAIR TABLE dmpdata.profile_device_app_detection_date"
hive -e "MSCK REPAIR TABLE dmpdata.profile_device_app_detection_gaid_uu"

#3rd party data
date +"%R start repair 3rd party tables"
hive -e "MSCK REPAIR TABLE pardata.appsflyer_inapp_events"
hive -e "MSCK REPAIR TABLE pardata.appsflyer_installs"
hive -e "MSCK REPAIR TABLE pardata.appnexus_standard_feed"
hive -e "MSCK REPAIR TABLE pardata.tune_clicks_origin"
hive -e "MSCK REPAIR TABLE pardata.tune_events_origin"
hive -e "MSCK REPAIR TABLE pardata.tune_installs_origin"
hive -e "MSCK REPAIR TABLE pardata.tune_opens_origin"
hive -e "MSCK REPAIR TABLE pardata.tune_updates_origin"

#geoinfo
date +"%R start repair geoinfo tables"
hive -e "MSCK REPAIR TABLE dmpdata.profile_device_freqlocation_dt"
hive -e "MSCK REPAIR TABLE dmpdata.profile_device_freqlocation_dt_hr"

#ETL middle talbe
date +"%R start repair ETL middle tables"
hive -e "MSCK REPAIR TABLE dmpdata.imei_by_country_platform"
hive -e "MSCK REPAIR TABLE dmpdata.imei_from_app_log"
