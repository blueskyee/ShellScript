#!/bin/bash

# sort, unique id in file; all files under this folder have the same schema: paltform, device_id
for d in /spark-tmp0/TD/delivery_details_match/s3_sync/*/ ; do
    #echo "$d"
    for d2 in $d*/; do
        #echo "$d2"
        new_d=`echo $d2 | sed -e "s/s3_sync/s3_sync_sort/g"`
        mkdir -p $new_d
        for file in $d2*; do
            echo "$file"
            new_f=`echo $file | sed -e "s/s3_sync/s3_sync_sort/g"`
            cat $file | sort | uniq > $new_f
        done
    done
done

# matching id; all files under this folder have been sorted and have unique row value
for d in /spark-tmp0/TD/delivery_details_match/s3_sync_sort/*/ ; do
    for d2 in $d*/; do
        new_d=`echo $d2 | sed -e "s/s3_sync_sort/s3_sync_match/g"`
        mkdir -p $new_d
        for file in $d2*; do
            echo $file
            new_f=`echo $file | sed -e "s/s3_sync_sort/s3_sync_match/g"`
            comm -1 -2 /spark-tmp0/TD/delivery_details_match/match_rate_check_sort_uniq_endline.csv $file > $new_f
        done
    done
done

# calculate match rate by segment
for d in /spark-tmp0/TD/delivery_details_match/s3_sync_sort/*/ ; do
    echo $d
    for d2 in $d*/; do
        for file in $d2*; do
            #echo $file
            match_f=`echo $file | sed -e "s/s3_sync_sort/s3_sync_match/g"`
            orig_row=`cat $file | wc -l`
            match_row=`cat $match_f | wc -l`
            #echo "segment row:"$orig_row
            echo $match_row
        done
    done
done

