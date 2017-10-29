#!/bin/bash

module load singularity

IMAGE=/oasis/scratch/comet/$USER/temp_project/gdal-docker-comet.img

singularity exec $IMAGE /oasis/scratch/comet/$USER/temp_project/stitching-demo/comet/stitch.sh ${DATE}
