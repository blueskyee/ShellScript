#!/bin/bash

# gzip file in sub folder recursively
for d in /spark-tmp0/TD/delivery_details_match/s3_sync_match/*/ ; do
    for d2 in $d*/; do
        for file in $d2*; do
           echo "archive file:"$file
           gzip $file
        done
    done
done


# a smarter way to archive files under current folder (gzip)
find . -type f ! -name '*.gz' -exec gzip "{}" \;

