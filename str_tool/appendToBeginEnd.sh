#!/bin/bash

#Add in the beginning of each line:
sed -e 's/^/string beofore each line/' file > output.txt

#Add in the end of each line:
sed -e 's/$/string after each line/' file > output.txt
