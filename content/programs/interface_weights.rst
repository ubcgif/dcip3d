.. _dcip_weights:

Create Near-Surface Interface Weights
=====================================

The creation of near-surface interface weights is not required to run the inversion. By enforcing significant lateral smoothness in the top few layers however, the user can reduce the impact of near surface artifacts due to the high sensitivity of cells near electrodes.

Running the Program
^^^^^^^^^^^^^^^^^^^

To run the executable, open a command window and type the following:

.. figure:: images/run_interface_weights.png
     :align: center
     :width: 700

Essentially you are calling the path to the executable followed by the path to the :ref:`input file <dcip_input_weights>` .


Output File
^^^^^^^^^^^

The executable outputs a full :ref:`weights file <weightsFile>`. That is, the program outputs a file containing cell weights (all set to 1) and the interface weights for x, y and z faces.






