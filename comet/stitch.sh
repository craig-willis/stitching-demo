#!/bin/bash

DATE=$1

if [ -z $DATE ]; then
  echo "Must specify date"
  exit 1;
fi 

# Set the output directory
echo "Stitching $DATE"
output=/oasis/scratch/comet/$USER/temp_project/stitch/$DATE
mkdir -p $output
date


# Create the input file list
echo "CREATE INPUT FILE LIST"
find /oasis/scratch/comet/willis8/temp_project/rgb_geotiff/$DATE/ -type f -name "*left.tif" | sort > $output/file_list.txt
date

# Use parallel with 20 cores to generate the thumbnails
echo "CREATE THUMBNAILS"
mkdir -p $output/thumbnail
cat $output/file_list.txt  | parallel -j 20 "/oasis/scratch/comet/willis8/temp_project/stitching-demo/comet/translate.sh {} $output"
date


# Sort the thumbnails and create the VRT
find $output/thumbnail -type f | sort > $output/thumb_list.txt
cd $output
echo "BUILD VRT"
gdalbuildvrt -q  -srcnodata "-99 -99 -99" -overwrite -input_file_list thumb_list.txt stitch.vrt > /dev/null
date

# Generate a TIF from the VRT
echo "STITCH TIF FROM VRT "
gdal_translate -q --config GDAL_CACHEMAX 999 stitch.vrt stitch.tif
date

# Create the output and JPG
echo "CREATE PNG and JPG"
gdal_translate -q -of PNG stitch.tif stitch.png
gdal_translate -q -of JPEG stitch.tif stitch.jpg
date
