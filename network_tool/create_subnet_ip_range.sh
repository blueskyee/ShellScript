#!/bin/bash

for i in {16..48}
do
    for j in {0,16,32,48,64,80,96,112,128,144,160,176,192,208,224,240}
    do
	## subnet id
        echo "10."$i"."$j".0/20"
	#maxVal=$(expr $j + 15)
	### subnet ip range
	#echo "10."$i"."$j".1 - 10."$i"."$maxVal".254" 
	### subnet broadcast address
	#echo "10."$i"."$maxVal".255"
    done
done
