#!/bin/bash

file=$1
output=$2

filename=`basename $file`
gdal_translate -q -co NUM_THREADS=ALL_CPUS --config GDAL_CACHEMAX 999 -outsize 2% 2% $file $output/thumbnail/$filename 
