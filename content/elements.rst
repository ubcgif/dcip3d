.. _elements:

Elements of the program DCIP3D
==================================

The DCIP3D library consists of three core programs and nine utilities.

Core Programs:

- ``DCIPF3D``: Forward model conductivity/chargeability models to calculate data.
- ``DCINV3D``: Invert 3D DC data to develop a conductivity models using a Gauss-Newton method
- ``IPSEN3D``: calculates the sensitivity matrix for the 3D IP inversion
- ``IPINV3D``: Invert 3D IP data to develop a chargeability models using a Gauss-Newton method

Utilities:

- ``MAKE_WDAT``: makes a weighting file for smoothing near surface zones of the model

Each of the above programs requires an input file (or files) in order to run. Before detailing the procedures for running each of the above programs, we first present information about these general input/output files.

.. _fileformats:

General files for DCIP3D programs
-------------------------------------

**Input** files can have any user-defined name, while **output** files have restricted file names. Generall speaking, the filename extensions are not important. While the user can provide different file extensions for each file type (i.e. ``*.msh`` for mesh files, ``*.con`` for conductivity models), some users prefer to use the ``*.txt`` filename convention so that files are more easily read and edited in the Windows environment. There are ten general file types which are used by the different codes in DCIP3D library:

.. toctree::
        :maxdepth: 1

        Tensor mesh <files/tensormeshfile>
        Topography <files/topo>
        Observation/Location <files/dcipfile>
        Model <files/model>
        Weighting <files/weight>
        Bounds <files/bounds>
        Active model <files/activemodel>
