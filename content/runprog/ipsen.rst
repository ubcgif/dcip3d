IPSEN3D
=======

This program calculates the sensitivity matrix for the inversion of IP data. Command line usage:

.. code-block:: rst

    ipsen3d ipsen.inp [nThread]

where nThread is an optional integer argument to specify the number of OpenMP threads to use for the parallelization. If this value is missing, IPSEN3D will use the maximum number of threads based on the processor. The input file, ipsen.inp is described below.

Input Files
-----------

The format for the IP sensitivity controle file, ``ipsen.inp``, is:

.. figure:: ../../images/ipsen.PNG
        :figwidth: 75%
        :align: center

data
    The IP observation locations (with standard deviations).

mesh
    The 3D mesh.

con
    A conductivity model file, a single value denoted by using the flag VALUE (e.g., VALUE 0.001). The name of this file will most likely be dcinv3d.con - the inverted conductivities from the DC resistivity data.

topo
    Topography file or null for no topography (see section 3 for caveats with location and topography file types).

act
    The active cells model file or null to use all model cells (below the topography) as active

wvltx
    A five-character string identifying the type of wavelet used to compress the sensitivity matrix.
    The types of wavelets available are Daubechies wavelet with 1 to 6 vanishing moments (daub1, daub2, and so on) and Symmlets with 4 to 6 vanishing moments (symm4, symm5, symm6). Note that daub1 is the Haar wavelet and daub2 is the Daubechies-4 wavelet. The Daubechies-4 wavelet is suitable for most inversions (and is used for the null option, while the others are provided for users' experimentation. If none is entered, the program does not use wavelet compression.

itol,eps
    An integer and a real number that specify how the wavelet threshold level is to be determined.

        1. itol=1: program calculates the relative threshold and eps is the relative reconstruction error of the sensitivity. A reconstruction error of 0.05 is usually adequate.

        2. itol=2: the user defines the threshold level and eps is the relative threshold to be used. If null is entered on this line, a default relative reconstruction error of 0.05 (e.g. 5%) is used and the relative threshold level is calculated (i.e., itol=1, eps=0.05).

        The detailed explanation of threshold level and reconstruction error can be found in :ref:`here <theory>`..

tol
    This value indicates how well the forward modelled system is solved (1e-5 is a standard input)

vec
    Specifies how solution vectors are to be stored in the computer's memory. Use -1 to store all vectors in memory.

**NOTE**: Formats of the files listed in this control file are explained :ref:`here <fileformats>`.

**NOTE**: A sample input file can be obtained by executing the following line in the command prompt:

.. code-block:: rst

        ipsen3d -inp

Output Files
------------

The program ``IPSEN3D`` outputs three files. They are:

ipinv3d.mtx
    The sensitivity matrix file to be used in the inversion. This file contains the sensitivity matrix, generalized depth weighting function, mesh, and discretized surface topog- raphy. It is produced by the program and it's name is not adjustable for output (although it can be re-named). It is very large and may be deleted once the work is completed.

sensitivity.txt
    Output after running ipsen3d. It contains the average sensitivity for each cell. This file can be used for depth of investigation analysis or for use in designing special model objective function weighting.

Discrete topography file
    if the observations are surface format and the topography is general format.

Example of ipsen.inp
--------------------
Below is an example of the control file for the IP sensitivity matrix calculation. The active cell model is active.mod, and the conductivity model is the recovered model from DCINV3D. No vectors are written out to file and the wavelet has a relative error of 2%.

.. figure:: ../../images/ipsenexample.PNG
        :figwidth: 75%
        :align: center
