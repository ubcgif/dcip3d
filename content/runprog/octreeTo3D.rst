.. _octreeTo3D:

octreeTo3D
==========

This utility is designed to convert an existing octree model for an octree mesh into a tensor model for an existing tensor 3D mesh. The command usage is as following:

.. code-block:: rst

  octreeTo3D octreeMesh octreeModel 3Dmesh 3Dmodel

Control parameters and input files
----------------------------------

The following are the necessary inputs for this utility:

octreeMesh
  Input octree mesh.
  
octreeModel
  Input octree model based on above octree mesh.

3Dmesh
  Input tensor 3D mesh to convert model to.

3Dmodel
  Desired filename for created model.

Output files
------------

3Dmodel
  Output tensor 3D model for the above mentioned tensor 3D mesh (3Dmesh).
