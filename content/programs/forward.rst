.. _dcip_fwd:

Forward Modeling
================

The program **dcipf3d.exe** performs the 3D forward modelling of DC resistivity or IP data on tensor meshes.

Running the Program
^^^^^^^^^^^^^^^^^^^

To run the executable, open a command window and type the following:

.. figure:: images/run_fwd.png
     :align: center
     :width: 700

Essentially you are calling the path to the executable followed by the path to the :ref:`input file <dcip_input_fwd>` .

Setting Number of Threads with Open MPI
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Before running the executable, the number of threads used to carry out all simultaneous processes can be set with Open MPI. This is set in the command window **before** running the executable. To set the number of threads (*nThreads* ), use the following syntax:

    - Windows computer: "set OMP_NUM_THREADS=nThreads"
    - Linux (bash shell): "export OMP_NUM_THREADS=nThreads"
    - Linux (csh shell): "setenv OMP_NUM_THREADS nThreads"


Units
^^^^^

    - **DC data:** measured voltage normalized by the transmitter current (V/A)
    - **IP data:** Depends on the IP data type set in the :ref:`survey file <surveyFile>`, the data are either secondary voltage or apparent chargeability
    - **Conductivity model:** S/m
    - **Chargeability model:** intinsic chargeability - unitless from [0,1) 



Output Files
^^^^^^^^^^^^

The program **dcipf3d.exe** creates the following output files:

    - **dc3d.dat:** Predicted DC data (output if data type set to *dc* )

    - **ip3d.dat:** Predicted IP data (output if data type set to *ip* )

    - **ip3d_lin.dat:** Predicted IP data (output if data type set to *ipL*)

    - **obs.loc:** if the survey file used *surface format*, the code will output a general locations file that contains the elevations of the electrodes projected to the discrete topography.

    - **dcipf3d.log:** Log file which provides details about the parameters used in the forward modelling and diagnostic information about the results.



