.. _remeshoctreemodel:

remesh_octree_model
===================

This utility is used to convert a previoulsy created 3D octree model from one existing octree mesh to another existing octree mesh. The utility is called from a command prompt as following:

.. code-block:: rst

  remesh_octree_model mesh1 model1 mesh2 model2

Control parameters and input files
----------------------------------

The following parameters are required for this utility

mesh1
  Input octree mesh.

model1
  Input octree model.

mesh2
  Octree mesh to be used for remeshing.

model2
  Desired filename for remeshed octree model.

Output files
------------

model2
  The remeshed octree model, using the mesh defined as "mesh2".
