# stitching-demo
Demonstration of TERRA-REF image stitching process


```
# Get the first two rows of images for a date 
find  /data/terraref/sites/ua-mac/Level_1/rgb_geotiff/2017-05-29/ -type f -name "*left.tif" | sort | head -158 > input_list_small.txt


# For each full-size GeoTIFF file, rescale to 10% and create a JPG for display
for file in `head input_list_small.txt`
do 
    filename=`basename $file`
    path=`dirname $file`
    dirname=`basename $path`
    mkdir -p  small/2017-05-29/$dirname

    jpg=`basename $file .tif`

    gdal_translate -outsize 10% 10% $file small/2017-05-29/$dirname/$filename
    gdal_translate -of JPEG small/2017-05-29/$dirname/$filename small/2017-05-29/$dirname/$jpg.jpg
done

# Create VRT from input list
gdalbuildvrt  -srcnodata "-99 -99 -99" -overwrite -input_file_list input_list_small_head.txt output_small_head.vrt

# Create stitched GeoTIFF
gdal_translate --config GDAL_CACHEMAX 999 output_small_head.vrt small_head.tif

# Output PNG and JPG
gdal_translate -of PNG -scale -co worldfile=yes small_head.tif small_head.png
gdal_translate -of JPEG -scale -co worldfile=yes small_head.tif small_head.jpg
```
