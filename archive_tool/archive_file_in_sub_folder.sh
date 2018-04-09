#!/bin/bash

for d in /spark-tmp0/TD/delivery_details_match/s3_sync_match/*/ ; do
    for d2 in $d*/; do
        for file in $d2*; do
           echo "archive file:"$file
           gzip $file
        done
    done
done
