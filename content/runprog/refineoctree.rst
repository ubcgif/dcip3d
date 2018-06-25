.. _refineoctree:

refine_octree
=============

This utility is designed to refine a previously created octree mesh at intermediate iteration steps to make it finer, given the corresponding octree conductivity or chargeability model. The idea is that a balance needs to be maintained between the accuracy of the forward model and the computational speed. It is therefore expected that on the first run, the data will be fit to an increased chifact on a rather coarse mesh. The mesh should be refined again so that at each refinement step, the data can be fit to a progressively decreasing chifact, which will eventually become 1.

Unlike the discretization process for the initial mesh (which was only dependednt on electrode locations), the post-refinement discretization will also be based on the curvature of the model. Regions with more abrupt physical property variatons will be discretized to a greater degree (although not smaller than the initial underlying base mesh).

To call this utility, use the following command from a command prompt:

.. code-block:: rst

  refine_octree refine_mesh.inp
  
This utility requires a control file (i.e., refine_mesh.inp) to exist in the working directory.

Control parameters and input files
----------------------------------

The following is the control file format:

.. figure:: ../../images/refineoctree.PNG
  :figwidth: 75%
  :align: center
  
The input paramers for the control file are:

LOG_MODEL | LIN_MODEL
  Linear versus logarithmically scaled model file. LOG_MODEL is typically used for DC conductivity models while LIN_MODEL is usually used for IP chargeability models.

input octree mesh file
  Filename for the initial octree mesh.

input octree model file
  Filename for the initial octree model.

output octree mesh file
  Desired filename for the refined octree mesh.

output octree model file
  Desired filename for the refined octree model.

Output files
------------

refine_mesh.log
  Log file specifying the parameters used by the refine_octree utility.

output octree mesh
  The refined octree mesh.

output octree model
  The refined octree model.
