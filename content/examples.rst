.. _examples:

Introduction
============

In this section, we present forward modelling and inversion examples for both DC and IP data
types. The examples are freely available for download 3 MB and can also be found on the DCIP3D
website (without the exe files). The example is synthetic and is a 10
-m (0.1 S/m) block in a 1000

-m (0.001 S/m) half-space with a pyramid-shaped topography (Figure 5). For added complexity,
surface data on a 25-m grid is simulated along with borehole data so that the general data format
is required. The intrinsic chargeability of the block is 0.15 (Figure 6). The electrode locations are
denoted by the white dots in both Figures. After forward modelling, 5% Gaussian noise is added to
each data set to create the \observed" data sets. The uncertainties assigned are 5% of each datum
with a 0.0001
oor (for both DC and IP). The last section shows the differences between the old
code and version 5.0 with respect to the nodal-based finite difference scheme (shown in Figure 3).
The mesh used for the example is 26  26  23 and the file is given by

.. figure:: ../images/example/5prisms.png
	:align: center
	:figwidth: 50%

The five blocks are assigned conductivity and chargeability values, which are given in the table below.

.. figure:: ../images/example/table1.PNG
	:align: center
	:figwidth: 75%

DC resistivity and IP data are forward modelled for both surface and cross-borehole arrays using the ``DCIPoctreeFwd`` code. Three different electrode configurations were used for both DC and IP data types to show the benefits of a joint inversion using both surface and borehole data. Details of the three surveys are as follows:

1. Surface dataset: Pole-dipole arrays with a = 50 m (smallest potential electrode spacing) and n (potential electrode position) ranging from 1 to 6. Eleven east-west lines with a line spacing of 100 m were used to cover the core region of the model which is 1 square km. In total, 1089 observations were forward modelled using 209 current electrodes.

2. Borehole dataset: Pole-dipole arrays located within 4 boreholes, whose locations are specified in the table below. The data were simulated using a borehole array configuration in which the current electrode is moved down each of the 4 boreholes with 25 m steps to the depth of 350 m. This results in a total of 51 current electrode locations. For each of the current electrode locations, the potential electrode array, with a 50 m spread, was placed in each of the remaining three boreholes and moved down to a depth of 350 m at 25 m intervals, resulting in 1530 forward modelled observations.

.. figure:: ../images/example/table2.PNG
	:align: center
	:figwidth: 75%

3. Combined surface and borehole dataset: A combination of the above pole-dipole surface and borehole arrays, resulting in 260 current electrodes and 2619 total forward modelled observations.

Prior to inversion, 5% Gaussian noise was added to the forward modelled data, and uncertainties were assigned to be 5% of the data value plus a small floor.

The following pages describe the constant inversion parameters used and then the inversion of each dataset.

.. toctree::
        :maxdepth: 2

        Inversion parameters <exe5prism/param>
        DC inversion of surface data <exe5prism/dcsurf>
        IP inversion of surface data <exe5prism/ipsurf>
        DC inversion of borehole data <exe5prism/dcbore>
        IP inversion of borehole data <exe5prism/ipbore>
        DC inversion of combined data <exe5prism/dccomb>
        IP inversion of combined data <exe5prism/ipcomb>




