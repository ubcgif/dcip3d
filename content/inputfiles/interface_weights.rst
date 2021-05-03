.. _dcip_input_weights:

Near-Surface Interface Weights
================================

Near-surface interface weights can be applied to force lateral smoothness in the top few layers of the model.
This is done to reduce artifacts related to the high sensitivities of cells near electrodes.
Near-surface interface weights are created using the executable program **make_wdat.exe**.
The lines for the input file are as follows:


.. tabularcolumns:: |L|C|C|

+--------+----------------------------------------------------+---------------------------------------------------------+
| Line # | Parameter                                          | Description                                             |
+========+====================================================+=========================================================+
| 1      | :ref:`Tensor Mesh<dcip_input_weights_ln1>`         | path to tensor mesh                                     |
+--------+----------------------------------------------------+---------------------------------------------------------+
| 2      | :ref:`Topography<dcip_input_weights_ln2>`          | topography                                              |
+--------+----------------------------------------------------+---------------------------------------------------------+
| 3      | :ref:`nLayer<dcip_input_weights_ln3>`              | number of layers                                        |
+--------+----------------------------------------------------+---------------------------------------------------------+
| 4      | :ref:`Interface weights<dcip_input_weights_ln4>`   | w1 w2 w3 ...                                            |
+--------+----------------------------------------------------+---------------------------------------------------------+
| 5      | :ref:`idx<dcip_input_weights_ln5>`                 | Override topography using idx file                      |
+--------+----------------------------------------------------+---------------------------------------------------------+



.. figure:: ./images/create_interface_weights_input.PNG
    :align: center
    :width: 700

    Example input file for creating near surface interface weights ( `Download <https://github.com/ubcgif/dcip3d/raw/master/assets/dcip_input/interface_weights.inp>`__ ).


.. _dcip_input_weights_lines:

Line Descriptions
^^^^^^^^^^^^^^^^^

.. _dcip_input_weights_ln1:

    - **Tensor Mesh:** file path to the :ref:`tensor mesh <meshFile>` file

.. _dcip_input_weights_ln2:

    - **Active Topography Cells:** Here, the user can choose to define the surface topography.

        - *null:* all cells lie below the surface topography
        - *topography file:* the user supplies the file path to a :ref:`topography file <topoFile>` which has the xyz locations for discrete topography


.. _dcip_input_weights_ln3:

    - **nLayer:** The number of layers down from the surface that interface weights will be applied.

.. _dcip_input_weights_ln4:

    - **Interface weights:** From the surface layer down, the user enters the values for the interface weights applied to each layer. For example, if the number of layers is *N=4*, the user may define this line as *40 20 10 5*. Interface weights will take topography into account. And generally, the weight value is decreased exponentially for each layer.

.. _dcip_input_weights_ln5:

    - **idx:** The user and override the topography file and use an *idx* formatted topography file instead. This functionality is not relevant to DCIP3D and should be kept as *null*.
