# Stitching on ROGER

Example PBS script for running the TERRA stitching process via direct qsub.  The ``stitch.sh`` script implements the following process:
* Generate a file list of "*left.tif" files for a particular date
* Run ``gdal_translate`` via GNU ``parallel`` to generate thumbnail images scaled to 10%
* Run ``gdalbuildvrt`` to generate a VRT from the thumbnail list
* Run ``gdal_translate`` to generate the stitched GeoTIFF, PNG and JPG files


To run via qsub:

``
qsub -v DATE=2016-10-25 stitch.sh
``

Monitor job status:

``
qstat -u <user>
``

The stitched output will be available under:

``
/projects/arpae/terraref/users/willis8/stitch/$DATE
``

The images can be easily viewed Cloud9 in the TERRA-REF Analysis Workbench.
