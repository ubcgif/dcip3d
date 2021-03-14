.. _elements:

Elements of the DCIP3D package
==============================

This section provides a brief description of each program in the DCIP3D package. In addition, we describe the file formats for all input and supporting files used by the coding library.

Executables
-----------

The main executable programs within the DCIP3D program library are:

    - **dcipf3d:** used to forward model DC or IP data
    - **dcinv3d:** inverts DC data to recover a conductivity model
    - **ipsen3d:** construct the sensitivity matrix for the linearized IP problem
    - **ipinv3d:** inverts IP data to recover a chargeabitiliy model

The following Octree utility programs may also be helpful:

    - **blk3cell:** creates models on a tensor mesh
    - **make_wdat:** a utility for creating near-surface interface weights


Main Input Files
----------------

Here, we describe the main input files for executables contained with the DCIP3D coding package.

.. toctree::
    :maxdepth: 1

    Create tensor model <inputfiles/createModel>
    Forward modeling <inputfiles/forward>
    Near surface interface weights<inputfiles/interface_weights>
    DC inversion <inputfiles/dcinversion>
    IP sensitivity matrix <inputfiles/ipsensitivity>
    IP inversion <inputfiles/ipinversion>


Supporting Files
----------------

Here, we describe the formats of supporting files used to run DCIP3D executable files.

.. toctree::
    :maxdepth: 1

    Survey File <files/surveyFile>
    Predicted Data File <files/preFile>
    Observations File <files/obsFile>
    Topography File <files/topoFile>
    Model File <files/modelFile>
    Active Cells Model File <files/activeFile>
    Tensor Mesh File <files/meshFile>
    Weights Files <files/weightsFile>
    Bounds Files <files/boundsFile>
