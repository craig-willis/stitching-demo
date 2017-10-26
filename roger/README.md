# Stitching on ROGER

Example PBS script for running the TERRA stitching process via direct qsub.

Submit job:

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
