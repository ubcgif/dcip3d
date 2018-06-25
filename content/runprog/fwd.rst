.. _fwd:

DCIPF3D
=============

This program performs the 3D forward modelling of DC resistivity and IP data over octree meshes. The parameters and files are the same for ``DCIPF3D``.

Control parameters and input files
----------------------------------

As a command line argument, ``DCIPF3D`` requires an input file containing all parameters and files needed to carry out the forward modelling calculations. This input control file is generally named **DCIP_octree_fwd.inp** and needs to be located in the working directory, from which ``DCIPF3D`` is executed.

The following is the input control file format:

.. figure:: ../../images/fwd.PNG
        :figwidth: 75%
        :align: center

type: DC | IP | IPL
        The DC option performs only DC forward modelling, while the IP option performs both DC and IP forward modelling. The IPL option calculates the IP data by multiplying the sensitivity matrix by the chargeability model. When the DC option is chosen, the chargeability model line is ignored.

mesh
        Name of the mesh file.

obs
       The observation locations.

model.con: conductivity model
        File containing the cell values of a conductivity model in S/m.

model.chg: chargeability model
        File containing the cell values of a chargeability model. Required only if the IP or IPL option is selected in the first line. This model must be provided in dimensionless units, ranging from [0,1).

topo: topography file
        Topography file or null for no topography (see section 3 for caveats with location and topography file types).

pot
        Output of potentials:
        - When pot=0, No output is performed.
        - When pot=1, The potentials of every cell are written to the file potentials x.txt where x is the current electrode pair number. This file can be viewed in meshTools3D.

tol
        This value indicates how well the forward modelled system is solved (1e-5 is a standard input)

vec
        Specifies how solution vectors are to be stored in the computer's memory. Use -1 to store all vectors in memory.

**NOTE**: Formats of the files listed in this control file are explained :ref:`here <fileformats>`.



Output files
------------

dc3d.dat
        The DC potential data

[ip3d.dat]
        The IP data (only if the IP option was set in the input file)

[ip3d_lin.dat]
        The IPL data (only if the IPL option was set in the input file)

model.con | model0.chg
        The conductivity and/or chargeability model that was used for forward modelling but now wwith the air cells removed.

obs.loc
        The surface electrode positions in three dimensions. Produced only if the surface locations format is used.

topo.idx
        The discrete topography file generated when a general topography and surface locations are used.

Example files
-------------

Example of a forward modelling input file:

.. figure:: ../../images/fwdexample.PNG
        :figwidth: 75%
        :align: center
