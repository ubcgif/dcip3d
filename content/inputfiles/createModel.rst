.. _dcip_input_model:

Create Model Input File
=======================

The file **blk3cell.inp** is used to construct models comprised of a set of rectangular blocks.
The user specifies the locations, dimensions and values for a set of blocks.
All undefined cells within the mesh are set to the background value. The format for this file is as follows:

.. tabularcolumns:: |C|C|C|

+----------------+-----------------------------------------------------------------------------------------------------------+----------------------------------------+
| Line #         | Parameter                                                                                                 | Description                            |
+================+===========================================================================================================+========================================+
| 1              |:math:`\sigma_b`                                                                                           | background conductivity/chargeability  |
+----------------+-----------------------------------------------------------------------------------------------------------+----------------------------------------+
| 2              |:math:`N`                                                                                                  | number of blocks                       |
+----------------+-----------------------------------------------------------------------------------------------------------+----------------------------------------+
| 3              |:math:`x_1^{(1)} \;\;  x_2^{(1)} \;\; y_1^{(1)} \;\; y_2^{(1)} \;\; z_1^{(1)} \;\; z_2^{(1)} \;\; m^{(1)}` | Block 1                                |
+----------------+-----------------------------------------------------------------------------------------------------------+----------------------------------------+
| 4              |:math:`x_1^{(2)} \;\;  x_2^{(2)} \;\; y_1^{(2)} \;\; y_2^{(2)} \;\; z_1^{(2)} \;\; z_2^{(2)} \;\; m^{(2)}` | Block 2                                |
+----------------+-----------------------------------------------------------------------------------------------------------+----------------------------------------+
| :math:`\vdots` |:math:`\vdots`                                                                                             | :math:`\vdots`                         |
+----------------+-----------------------------------------------------------------------------------------------------------+----------------------------------------+                                
|                |:math:`x_1^{(N)} \;\;  x_2^{(N)} \;\; y_1^{(N)} \;\; y_2^{(N)} \;\; z_1^{(N)} \;\; z_2^{(N)} \;\; m^{(N)}` | Block N                                |
+----------------+-----------------------------------------------------------------------------------------------------------+----------------------------------------+

where superscript :math:`(i)` for :math:`i=1,2,...,N` refers to a particular block. :math:`x_1,x_2,y_1,y_2,z_1` and :math:`z_2` define the nodes of each block and :math:`m` defines conductivity/chargeability value.
Below is an input file example for a conductive and a resistive block within a homogeneous background.


.. figure:: images/create_blk3cell_input_con.png
     :align: center
     :width: 700

     Example input file for creating tensor model (`Download <https://github.com/ubcgif/dcip3d/raw/master/assets/dcip_input/blk3cell_con.inp>`__ )



