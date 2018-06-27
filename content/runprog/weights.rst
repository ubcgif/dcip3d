.. _weights:

MAKE_WDAT
=========

``MAKE_WDAT`` is a utility used to make a ``w.dat`` file that has smoothing in the x- and y-directions for the first few layers that underlie the topography surface. It suppresses the tendency of the algorithm to make highly variable structure in these top layers of the model.

**NOTE**: We stress that the above weighting should be applied with care. A strong horizontal smoothing can often eliminate horizontal changes in the conductivity, even if the earth model truly had these. The inclusion, and details, of the surface weighting therefore involves subjective decision by the u er. Without weighting, the model at the surface can be quite rough (due to electrod effects). On the other hand, local geology is also sometimes quite rough and hence the tr e earth model should exhibit a large heterogeneity.
The code is called by the command

.. code-block:: rst

		make_wdat mkw.inp

This utility works with an arbitrary input control file name and does not have to be "weight.inp".

Control parameters and input files
----------------------------------

The following shows the control file format:

.. figure:: ../../images/interfaceweights.PNG
	:align: center
	:figwidth: 75%

mesh
	The 3D mesh file used in the DC or IP inversion
topo
	A topography file that is in the general format. Use null to apply to the top layers of the mesh.

n
	An integer specifying the number of layers to implement the weighting. The air layers will not be weighted and the remaining portion of the model will have a weight of 1.

vals
	Values of weights for the n layers specied on the previous line.

name
	Name of output file that writes the topography in the discrete format.


**NOTE**: Formats of the files listed in this control file are explained :ref:`here <fileformats>`.

**NOTE**: A sample input file can be obtained by executing the following line in the command prompt:

.. code-block:: rst

        make_wdat -inp

Output files
------------

The program ``MAKE_WDAT`` outputs two files:

w.dat
	A 3D weighting file to use in the inversion

name
	The topography file in discrete format named from the last line in the input file. This file is not generated if the name line in the input file was null.

Example files
-------------

Here is an example of the MAKE WDAT input file that places extra weights the first six layers beneath the topography. The remaining weights for the model are 1 and the air cells do not get weighted. Additionally, the program returns topo.idx that can be used with the general observations format.

.. figure:: ../../images/interfaceweightsfile.PNG
        :figwidth: 75%
        :align: center
