.. _dcip_input_fwd:

Forware Modeling Input File
===========================

The forward problem is solved using the executable program **dcipoctree_fwd.exe**. The lines of input file are as follows:

.. tabularcolumns:: |L|C|C|

+--------+-------------------------------------------------------------------+-------------------------------------------------------------------+
| Line # | Description                                                       | Description                                                       |
+========+===================================================================+===================================================================+
| 1      | :ref:`Data Type<dcip_input_fwd_ln1>`                              | data being modeled: DC|IP|IPL                                     |
+--------+-------------------------------------------------------------------+-------------------------------------------------------------------+
| 2      | :ref:`OcTree Mesh<dcip_input_fwd_ln2>`                            | path to octree mesh file                                          |
+--------+-------------------------------------------------------------------+-------------------------------------------------------------------+
| 3      | :ref:`Survey File<dcip_input_fwd_ln3>`                            | path to survey file                                               |
+--------+-------------------------------------------------------------------+-------------------------------------------------------------------+
| 4      | :ref:`Conductivity Model<dcip_input_fwd_ln4>`                     | conductivity model                                                |
+--------+-------------------------------------------------------------------+-------------------------------------------------------------------+
| 5      | :ref:`Chargeability Model<dcip_input_fwd_ln5>`                    | chargeability model                                               |
+--------+-------------------------------------------------------------------+-------------------------------------------------------------------+
| 6      | :ref:`Active Topography Cells<dcip_input_fwd_ln6>`                | topography                                                        |
+--------+-------------------------------------------------------------------+-------------------------------------------------------------------+



.. figure:: images/create_fwd_input.png
     :align: center
     :width: 700

     Example input file for the inversion program (`Download <https://github.com/ubcgif/DCIPoctree/raw/master/assets/dcip_input/dcip_fwd.inp>`__ ).


Line Descriptions
^^^^^^^^^^^^^^^^^

.. _dcip_input_fwd_ln1:

	- **Data Type:** This line chooses the data which are modeled by the program:

		- *DC:* DC resistivity data are modeled. Although the line for the chargeability input file is ignore, something must be put there as a placeholder.
		- *IP:* DC resistivity data and IP data are modeled. IP data are modeled with a non-linear formulation.
		- *IPL:* DC resistivity data and IP data are modeled. IP data are modeled with a linear formulation.

.. _dcip_input_fwd_ln2:

    - **OcTree Mesh:** file path to the :ref:`OcTree mesh file <octreeFile>`

.. _dcip_input_fwd_ln3:

    - **Survey File:** On this line, we enter a flag *LOC_XY* or *LOC_XYZ*, followed by the file path to the :ref:`survey file<surveyFile>`. The flag tells the program whether the electrodes are only on the surface or whether there are borehole measurements.

    	- *LOC_XY filepath:* The electrodes are all on the Earth's surface. The vertical position is defined by the topography line.
    	- *LOC_XYZ filepath:* The survey file contains borehole data.

.. _dcip_input_fwd_ln4:

    - **Conductivity Model:** file path to the :ref:`conductivity model <modelFile>`

.. _dcip_input_fwd_ln5:

    - **Chargeability Model:** file path to the :ref:`chargeability model <modelFile>`

.. _dcip_input_fwd_ln6:

    - **Active Topography Cells:** Here, the user can choose to specify the cells which lie below the surface topography. To do this, the user may supply the file path to an active cells model file or type "ALL_ACTIVE". The active cells model has values 1 for cells lying below the surface topography and values 0 for cells lying above.

