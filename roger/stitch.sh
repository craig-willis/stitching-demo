#!/bin/bash

#PBS -l walltime=00:45:00
#PBS -l nodes=1:ppn=20
#PBS -q batch
#PBS -j oe
#PBS -o stitch.log
#PBS -m be
#PBS -M willis8@illinois.edu

module load gdal2-stack
module load parallel

cd $PBS_O_WORKDIR

if [ -z $DATE ]; then
  echo "Must specify date"
  exit 1;
fi 

# Set the output directory
echo "Stitching $DATE"
output=/projects/arpae/terraref/users/willis8/stitch/$DATE
mkdir -p $output
date


# Create the input file list
echo "CREATE INPUT FILE LIST"
find /projects/arpae/terraref/sites/ua-mac/Level_1/rgb_geotiff/$DATE/ -type f -name "*left.tif" | sort > $output/file_list.txt
date

# Use parallel with 20 cores to generate the thumbnails
echo "CREATE THUMBNAILS"
mkdir -p $output/thumbnail
cat  $output/file_list.txt  | parallel -j 20 "./translate.sh {} $output"
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
