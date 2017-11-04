#!/bin/bash

date="2017-05-30"
for file in `find /data/terraref/sites/ua-mac/Level_1/rgb_geotiff/$date -name "*left.tif" | sort |  head -10`
do
   echo $dir
   filename=`basename $file`
   path=`dirname $file`
   dirname=`basename $path`
   echo $filename
   echo $dirname
   mkdir -p  $date/$dirname

   jpg=`basename $file .tif`

    gdal_translate -outsize 10% 10% $file $date/$dirname/$filename
    gdal_translate -of JPEG $date/$dirname/$filename $date/$dirname/$jpg.jpg
done
