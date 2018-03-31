#!/bin/bash

##extension from text to csv
for f in /spark-tmp0/TD/delivery_details_match/s3_sync/ad.preference/17011712/* ; do
    mv -- "$f" "${f%.text}.csv"
done
