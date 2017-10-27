# TERRA-REF image stitching demonstration

## Agave app

The ``/agave`` directory contains the Agave application definition for the stitching demo. The ROGER execution and storage environments are defined in the Cyverse tenant on the [Agave Togo](https://togo.agaveapi.co/) system.

## Jupyter notebook

The ``/jupyter`` directory contains a sample notebook demonstrating in-container exploratory analysis as well as launching the application on ROGER via the [Agave CLI](https://bitbucket.org/agaveapi/cli/).

## ROGER batch job

The ``roger`` directory contains the TORQUE/PBS job that can run on the ROGER HPC system to generate the stitched thumbnail for a given day.


