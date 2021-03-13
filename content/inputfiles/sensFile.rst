.. _dcip_input_sens:

Sensitivity Weights
===================

Creating sensitivity weights is a 2-step process. The user must use the executable **dcsensitivity.exe** to approximate the RMS sensitivities of the problem, then use **sens2weights.exe** to create the sensitivity weights file.

Approximating Sensitivities
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The parameters used to approximate the sensitivities are defined in the following input file. The lines within the input file are as follows:


.. tabularcolumns:: |L|C|C|

+--------+----------------------------------------------------+---------------------------------------------------------+
| Line # | Parameter                                          | Description                                             |
+========+====================================================+=========================================================+
| 1      | :ref:`OcTree Mesh<dcip_sens_ln1>`                  | path to octree mesh                                     |
+--------+----------------------------------------------------+---------------------------------------------------------+
| 2      | :ref:`Survey File<dcip_sens_ln2>`                  | DC or IP survey file (locations of observations)        |
+--------+----------------------------------------------------+---------------------------------------------------------+
| 3      | :ref:`Conductivity Model<dcip_sens_ln3>`           | path to conductivity model                              |
+--------+----------------------------------------------------+---------------------------------------------------------+
| 4      | :ref:`Active Cells<dcip_sens_ln4>`                 | path to active cells model                              |
+--------+----------------------------------------------------+---------------------------------------------------------+
| 5      | :ref:`# Samples <dcip_sens_ln5>`                   | number of iterations used to approximate sensitivities  |
+--------+----------------------------------------------------+---------------------------------------------------------+
| 6      | :ref:`Method <dcip_sens_ln6>`                      | approximation method for sensitivity computation        |
+--------+----------------------------------------------------+---------------------------------------------------------+


.. figure:: ./images/create_sens_input.PNG
    :align: center
    :width: 700

    Example input file for computing sensitivities ( `Download <https://github.com/ubcgif/DCIPoctree/raw/master/assets/dcip_input/dcsens.inp>`__ ).


.. _dcip_input_sens_lines:

Line Descriptions
^^^^^^^^^^^^^^^^^

.. _dcip_sens_ln1:

    - **OcTree Mesh:** file path to the OcTree mesh file

.. _dcip_sens_ln2:

    - **Survey File:** This line defines the survey file. The general syntax is *LOC_XY|LOC_XYZ filepath*.

        - *LOC_XY|LOC_XYZ:* If the electrodes are all on the Earth's surface, use the flag *LOC_XY*. If the survey file contains any borehole measurements, use the flag *LOC_XYZ*.
        - *filepath:* This is the filepath to the survey/observations file. If the file is DC data format, you will compute sensitivities for the DC inversion. If the file is IP format, you will compute sensitivities for the IP inversion.

.. _dcip_sens_ln3:

    - **Conductivity Model:** On this line we specify the conductivity model for the sensitivity computation. On this line, there are 2 possible options:

        - Enter the path to a conductivity model (either starting model for DC inversion or background conductivity for IP inversion)
        - If a homogeneous conductivity value is being used, enter "VALUE" followed by a space and a numerical value; example "VALUE 0.01".

.. _dcip_sens_ln4:

    - **Active Topography Cells:** Here, the user can choose to specify the cells which lie below the surface topography. To do this, the user may supply the file path to an active cells model file or type "ALL_ACTIVE". The active cells model has values 1 for cells lying below the surface topography and values 0 for cells lying above.

.. _dcip_sens_ln5:

    - **# Samples:** This is the number of samples used to approximate the sensitivities. Somewhere between 5 and 20 samples are generally needed. A reasonable default value is 10. For more, see :ref:`theory section <theory_sensitivity_weights>` .

.. _dcip_sens_ln6:

    - **Method:** The method for approximating the sensitivity weights. The user enters a flag value of *1*, *2* or *3*:

        - (1) Hutchinson approach with :math:`v = \pm 1`
        - (2) Hutchinson approach with :math:`-1 < v < 1`
        - (3) Probing method


Sensitivities to Weights
^^^^^^^^^^^^^^^^^^^^^^^^

The parameters used to create a weights file from approximate sensitivities are defined in the input file below. The lines within the input file are as follows:


.. tabularcolumns:: |L|C|C|

+--------+----------------------------------------------------+---------------------------------------------------------+
| Line # | Parameter                                          | Description                                             |
+========+====================================================+=========================================================+
| 1      | :ref:`OcTree Mesh<dcip_sens2weights_ln1>`          | path to octree mesh                                     |
+--------+----------------------------------------------------+---------------------------------------------------------+
| 2      | :ref:`Sensitivities<dcip_sens2weights_ln2>`        | path to approximate sensitivities                       |
+--------+----------------------------------------------------+---------------------------------------------------------+
| 3      | :ref:`Active Cells<dcip_sens2weights_ln3>`         | path to active cells model                              |
+--------+----------------------------------------------------+---------------------------------------------------------+
| 4      | :ref:`Truncation Factor<dcip_sens2weights_ln4>`    | truncation factor                                       |
+--------+----------------------------------------------------+---------------------------------------------------------+
| 5      | :ref:`Smoothing Factor<dcip_sens2weights_ln5>`     | smoothing factor                                        |
+--------+----------------------------------------------------+---------------------------------------------------------+
| 6      | :ref:`Output Name<dcip_sens2weights_ln6>`          | output file name for sensitivity weights                |
+--------+----------------------------------------------------+---------------------------------------------------------+


.. figure:: ./images/sens2weights_input.PNG
    :align: center
    :width: 700

    Example input file for computing sensitivity weights model ( `Download <https://github.com/ubcgif/DCIPoctree/raw/master/assets/dcip_input/dcsens2weights.inp>`__ ).


.. _dcip_input_sens2weights_lines:

Line Descriptions
^^^^^^^^^^^^^^^^^

.. _dcip_sens2weights_ln1:

    - **OcTree Mesh:** file path to the OcTree mesh file

.. _dcip_sens2weights_ln2:

    - **Sensitivities:** file path to the approximate sensitivities output by **dcsensitivity.exe**

.. _dcip_sens2weights_ln3:

    - **Active Topography Cells:** Here, the user can choose to specify the cells which lie below the surface topography. To do this, the user may supply the file path to an active cells model file or type "ALL_ACTIVE". The active cells model has values 1 for cells lying below the surface topography and values 0 for cells lying above.

.. _dcip_sens2weights_ln4:

    - **Truncation Factor:** The dynamic range of the approximate sensitivities is very large (many orders of magnitude). But we are only interested in ensuring we do not cluster anomalous cells immediately near the electrodes. Thus we introduce a truncation factor for the weights; *a value between 0.01 and 0.1 is good*. The truncation factor defines the ratio between the largest and smallest weight value. And since the weights file is normalized so that a value of 1 is assigned to all unweighted cells:

.. math::
	truncation \; factor = \frac{w_{min}}{w_{max}} = \frac{1}{w_{max}}

.. _dcip_sens2weights_ln5:

    - **Smoothing Factor:** The distribution of sensitivities is very rough and can introduce artifacts in the inversion. To counteract this, the user may apply a smoothing filter. The smoothing factor is an integer value and denotes how many times the smoothing is applied. *A value between 1-4 seems to work best*.


.. _dcip_sens2weights_ln6:

    - **Output Name:** The output file name for the sensitivity weights file