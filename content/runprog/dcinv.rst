.. _dcinv:

DCInv3D
===========

``DCInv3D`` performs the inversion of the DC resistivity data. Command line usage

.. code-block:: rst

        dcinv3d dcinv.inp [nThread]

where nThread is an optional integer argument to specify the number of OpenMP threads to use for the parallelization. If this value is missing, ``DCINV3D`` will use the maximum number of threads based on the processor. The input file, dcinv.inp is described below.

Control parameters and input files
----------------------------------

As a command line argument, ``DCInv3D`` requires an input file containing all parameters and files needed to carry out the inversion. The following shows the required format:

.. figure:: ../../images/dcinv.PNG
        :figwidth: 75%
        :align: center

maxit,irest
        Two integers containing the maximum number of Gauss-newton iterations to be performed (maxit) and how to start the inversion. There are two choices for irest:
                1. irest=0 Begins the inversion from scratch
                2. irest=1 Restarts the inversion from a previous iteration. The files ``dcinv3d.con``, ``dcinv3d.out``, and ``dcinv3d.log`` must be present for this option.

mode,par
        An integer specifying one of the two choices for determining the trade-off parameter (a real value):
                1. mode=1: the program chooses the trade off parameter by carrying out a line search so that the target value of data misfit is achieved (e.g.,  :math:`\phi_d= N`). the target misfit value is given by the product of par and the number of data, N. Normally, the value of par should be 1.0 if the correct standard deviation of error is assigned to each datum.
                2. mode=2: the user inputs the trade off parameter as defined by par.
                3. mode=3: the program calculates the trade-off parameter according to the L-curve criterion and par is ignored data The DC observation locations (with standard deviations).

mesh
        The 3D mesh.

topo
        Topography file or null for no topography (see section 3 for caveats with location and topography file types).

ini
        A conductivity model file, a single value denoted by using the flag VALUE (e.g., VALUE 0.001), or null to set the initial model to the reference model value
ref
        A chargeability model file, a single value denoted by using the ag VALUE (e.g., VALUE 0.001), or null to have DCINV3D compute the best fitting half space to use the reference model (and initial model if null is chosen as its option)

act
        The active cells model file or null to use all model cells (below the topography) as active

bounds
        The bounds flag can be one of three values:
                1. bounds=BOUNDS NONE: Do not use bounds
                2. bounds=BOUNDS CONST: Two values to set bounds throughout the entire model: bl and bu for the lower and upper bounds
                3. bounds=BOUNDS FILE: The bounds file

lengths
        Coefficients for the each model component for the model objective function from equation 12. :math:`\alpha_s` is the smallest model component. :math:`\alpha_x` Coefficient for the derivative in the easting direction. :math:`\alpha_y` is the coefficient for the derivative in the northing direction. The coefficient :math:`\alpha_z` is for the derivative in the vertical direction.
        If null is entered on this line, then the above four parameters take the following default values: :math:`\alpha_s` = 0:0001; :math:`\alpha_x` = :math:`\alpha_y` = :math:`\alpha_z` = 1:0. None of the alpha's can be negative and they cannot be all equal to zero at the same time.
        NOTE: The four coefficients :math:`\alpha_s`, :math:`\alpha_x`, :math:`\alpha_y` and :math:`\alpha_z` can be substituted for three corresponding length scales Lx, Ly and Lz. To understand the meaning of the length scales, consider the ratios :math:`L_x = \sqrt{\frac{\alpha_x}{\alpha_s}}`; :math:`L_y = \sqrt{\frac{\alpha_y}{\alpha_s}}`; :math:`L_z = \sqrt{\frac{\alpha_z}{\alpha_s}}`. They generally define smoothness of the recovered model in each direction. Larger ratios result in smoother models, smaller ratios result in blockier models. The conversion from 's to length scales can be done by:
        .. math::
                L_x = \sqrt{\frac{\alpha_x}{\alpha_s}}; L_y = \sqrt{\frac{\alpha_y}{\alpha_s}}; L_z = \sqrt{\frac{\alpha_z}{\alpha_s}}
                :label: length_scale

where length scales are dened in meters. When user-dened, it is preferable to have length
scales exceed the corresponding cell dimensions.
wvltx Ave-character string identifying the type of wavelet used to compress the sensitivity matrix.
The types of wavelets available are Daubechies wavelet with 1 to 6 vanishing moments (daub1,
daub2, and so on) and Symmlets with 4 to 6 vanishing moments (symm4, symm5, symm6).
Note that daub1 is the Haar wavelet and daub2 is the Daubechies-4 wavelet. The Daubechies-
4 wavelet is suitable for most inversions (and is used for the null option, while the others are
provided for users' experimentation. If none is entered, the program does not use wavelet
compression.
itol,eps An integer and a real number that specify how the wavelet threshold level is to be determined.
1. itol=1: program calculates the relative threshold and eps is the relative reconstruction
error of the sensitivity. A reconstruction error of 0.05 is usually adequate.
35
2. itol=2: the user denes the threshold level and eps is the relative threshold to be used.
If null is entered on this line, a default relative reconstruction error of 0.05 (e.g. 5%) is
used and the relative threshold level is calculated (i.e., itol=1, eps=0.05).
The detailed explanation of threshold level and reconstruction error can be found in Section
2.6 of this manual.
weight Name of the file containing weighting matrix. If null is entered, the default value of one is
used for no extra weighting.
idisk Integer
ag of zero or one to write the sensitivities to disk
1. idisk=0: Store the entire sensitivity matrix in memory. This option will be desired in
almost all cases.
2. idisk=1: Access the sensitivity matrix from memory when needed
tol This value indicates how well the forward modelled system is solved (1e-5 is a standard
input)
vec Species how solution vectors are to be stored in the computer's memory. Use -1 to store all
vectors in memory.


**NOTE**: Formats of the files listed in this control file are explained :ref:`here <fileformats>`.

**NOTE**: A sample input file can be obtained by executing the following line in the command prompt:

.. code-block:: rst

        DCInv3D -inp

**NOTE**: ``DCInv3D`` will terminate before the specified maximum number of iterations is reached if the expected data misfit is achieved or if the model norm has plateaued. However, if the program is terminated by the maximum iteration limit, the file ``dcinv3d.log`` and ``dcinv3d.out`` should be checked to see if the desired misfit (equal to chifact times the number of data) has been reached and if the model norm is no longer changing. If neither of these conditions have been met, then the inversion should be reevaluated.

Output files
------------

``DCInv3D`` saves a model after each iteration. The models are ordered: inv_01.con, inv_02.con, etc. Similarly, the predicted data is output at each iteration into a predicated data file: dpred_01.txt, dpred_02.txt, etc. The following is a list of all output files created by the program ``DCInv3D``:

inv.con
        Conductivity model from the latest inversion. The model is stored in :ref:`model format <modelfile>` and is overwritten at the end of each iteration.

DC_octree_inv.txt
        A log file in which all of the important information regarding the flow of the inversion is stored, including the starting inversion parameters, mesh information, details regarding the computation (CPU time, number of processors, etc), and information about each iteration (i.e., data misfit, model norm components, model norm, total objective function, norm gradient, and relative residuals at each :math:`\beta` iteration).

dpred.txt
        Predicted data from the recovered model in the latest iteration. The predicted data is in the :ref:`observation file format <dcipfile>`, with the final column corresponding to apparent conductivity (instead of standard deviation).

DC_octree_inv.out
        This file is appended at the end of each iteration and has 7 columns:

        beta (value of regularization parameter)

        iter (number of IPCG iteration in a beta loop)

        misfit (data misft * 2)

        phi_d (data misfit)

        phi_m (model norm)

        phi (total objective function equal to phi_d + beta*phi_m)

        norm g (gradient equal to -RHS when solving Gauss-Newton)

        g rel (relative gradient equal to :math:`||g||/||g_o||`

mumps.log
        A diagnostic log file output by the MUMPS package.


Example files
-------------

Example of a ``DCInv3D`` inversion input file:

.. figure:: ../../images/dcinvexample.PNG
        :figwidth: 75%
        :align: center




