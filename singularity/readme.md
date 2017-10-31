# Singularity 
sudo singularity create -s 4096 ~/gdal-docker-comet.img
sudo singularity bootstrap ~/gdal-docker-comet.img docker.def
scp ~/gdal-docker-comet.img willis8@comet.sdsc.edu:/oasis/scratch/comet/willis8/temp_project
