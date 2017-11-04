
## Agave

This directory contains the Agave applications for the ROGER and XSEDE Comet systems. Both execution and storage environments are defined in the Cyverse tenant on the [Agave Togo](https://togo.agaveapi.co/) system.

The ``comet`` Slurm wrapper uses the ``singularity`` module to load and run the stitching demo code.

The ``roger`` TORQUE/PBS wrapper uses local GDAL module to run the stitching demo.
