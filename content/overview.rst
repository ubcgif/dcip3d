.. _overview:

DCIP3D v5.5 Package Overview
============================

DCIP3D v5.5 is a program library that performs forward modeling and inversion of DC resistivity and IP data over a 3D distribution of electrical conductivity and chargeability. Arbitrary transmitter and receiver electrode configurations are modeled along with 3D surface topography with the numerical processing distributed over multiple computers.

The basic structure of v5.5 is similar to the first version released for UBC-GIF sponsors in 1998. However the improvements since the initial release are substantial. Here, we outline the contents of the DCIP3D v5.5 program library, the major milestone achievements up to v5.5 and information on licensing.


DCIP3D program library content
------------------------------

The main executable programs within the DCIP3D v5.5 program library are:

    - **dcipf3d:** used to forward model DC or IP data
    - **dcinv3d:** inverts DC data to recover a conductivity model
    - **ipsen3d:** construct the sensitivity matrix for the linearized IP problem
    - **ipinv3d:** inverts IP data to recover a chargeabitiliy model

The following Octree utility programs may also be helpful:

    - **blk3cell:** creates models on a tensor mesh
    - **make_wdat:** a utility for creating near-surface interface weights



Milestones of Past and Current DCIP3D Packages
----------------------------------------------

Version 5.5
^^^^^^^^^^^

- The use may now choose the behaviour of the reference model in the regularization. Either the reference model is implemented in the smallness term, or the reference model can be implemented in all terms (smallness and smoothness) in the model objective function.


Version 5.0
^^^^^^^^^^^

- Forward modeling of DC and IP data is carried out over arbitrary 3D structures. The model is specified in the mesh of rectangular cells, each with a constant value of conductivity. Topography is included in the mesh. The electrode locations can be anywhere within the model volume, including below the topography to simulate borehole surveys. Electrodes do not need to be located on cell nodes. The DC equations are numerically solved using a finite volume method.
- The inversion is solved as an optimization problem with the simultaneous goals of (i) minimizing a model objective function and (ii) generating synthetic data that match observations to within a degree of misfit consistent with the statistics of those data.
- By minimizing the model objective function, distributions of subsurface conductivity/chargeability are found that are both close to a reference model and smooth in three dimensions. The degree to which either of these two goals dominates is controlled by the user by incorporating prior geophysical or geological information into the inversion via reference models and additional weighting functions. Explicit prior information may also take the form of upper and lower bounds on the conductivity or chargeability in any cell.
- The regularization parameter (controlling relative importance of objective function and misfit terms) is determined in either of three ways, depending upon how much is known about errors in the measured data.
- The sensitivities are calculated and temporarily stored in memory rather than creating a large .mtx file.
- Implementation of parallel computing architecture (OpenMP) allows the user to take full advantage of multi-core processors on a CPU.

The initial research underlying this program library was funded principally by the mineral industry consortium \Joint and Cooperative Inversion of Geophysical and Geological Data" (1991 - 1997) which was sponsored by NSERC (Canada's National Science and Engineering Research Council) and the following 11 companies: BHP Minerals, CRA Exploration, Cominco Exploration, Falconbridge, Hudson Bay Exploration and Development, INCO Exploration & Technical Services, Kennecott Exploration Company, Newmont Gold Company, Noranda Exploration, Placer Dome, and WMC.

Version 2.1
^^^^^^^^^^^

DCIP3D version 2.1 and earlier are not long supported and will not be documented here. However it is important to note improvements that were included in this version.

- Electrodes can be located anywhere and are not restricted to mesh node locations. This greatly enhances the usability of the code and allows for more uniform meshes with fewer cells to be used in the modeling.
- A linearized forward modeling of IP data is available. The output is the sensitivity multiplied by the chargeability. In this case, "chargeability" data can be the true dimensionless chargeability, or any of the other chargeability units that are commonly used, eg. pfe, mV/V, mrad etc.
- **DCINV3D** now saves the model after each iteration. This allows additional flexibility when selecting an inverted model that is best suited for interpretation purposes, or possibly choosing a starting model for a subsequent inversion.
- **IPINV3D** saves intermediate models for each Lagrange multiplier.
- The details of the model objective function can be controlled either with length scales or alpha parameters.
- An initial check is now carried out to determine if some data have an incorrect sign. Data signs are not changed but suspect data are identified in a new file (see end of section 2.2).
- In **DCINV3D**, when the sensitivities are calculated, they are temporarily stored in memory rather than in the file dcinv3d.mtx. Hence the large .mtx file is not created. This results in a significant gain in performance.
- **DCINV3D** and **IPSEN3D** output a file called sensitivity.txt that contains the average absolute value of the sensitivity matrix for each cell. This is useful to determine which portions of the model domain are sensitive to the survey.
- Each cell in a model can be set as \active" or \inactive" in the inversion process. In **DCINV3D**, inactive cells will be held at the value of the reference model. In the IP inversion, inactive cells will be set to zero.
- An upgraded pre-conditioner is used for the CG (Conjugate Gradient) solver for the Gauss- Newton equations. This enhances the performance of the DC resistivity inversion and it has an even larger impact upon the IP inversion.
- All floating-point arithmetic is now done in double precision. More accurate results are obtained.
- The code has been reorganized. Large working arrays are only allocated and used when needed. This results in reduced memory requirements.
- When calculating the sensitivity matrix G (in programs **DCINV3D**, **IPINV3D**, **DCIPF3D** with the ip option), the number of times a forward system must be solved is equal to the number of transmitters plus the number of receivers. To speed up the process of calculating G, if the same electrode location appears more than once in the data file, it is solution is stored in memory for future use.


Licensing
---------

There currently is no educational version of the program. Licensing for an unconstrained academic version is available if applicable; see the Licensing policy document.

NOTE: All academic licenses will be time-limited to one year. You can re-apply after that
time.

Licensing for commercial use is managed by third party distributors. Details are in the Licensing
policy document or on the webpage for DCIP3D.

Installing
----------

There is no automatic installer currently available for this package. Please follow the following steps in order to use the software.

#. Extract all files provided from the given zip-based archive and place them all together in a new folder such as

#. Add this directory as new path to your environment variables.

One additional note about installation:

-  Do not store anything in the "bin" directory other than executable applications and Graphical User Interface applications (GUIs).


.. DCIP3D v5.0: Highlights of changes from version 2.1
.. ---------------------------------------------------

.. The principal upgrades, described below, allow the new code to take advantage of current multi-core
.. computers and also provide greater flexibility to incorporate the geological information.

.. Improvements since version 2.1:
.. - A new projected gradient algorithm allows the user to implement bound constraints throughout the model.
.. - Fully parallelized computational capability (for both sensitivity matrix calculations and inversion calculations).

.. The input file now requires an extra line for the bounds, which can be two values (upper and
.. lower), or a file. Details of the structure of the input file and optional bounds files can be found within the manual.

Notes on computation speed
--------------------------

For large problems, DCIP3D v5.0 is significantly faster than the previous single processor inversion
because of the parallelization for computing the sensitivity matrix computation and inversion calculations. Using multiple threads for running the parallelized version resulted in sensitivity matrix calculation speedup proportional to the number of threads. The increase in speed for the inversion is substantial. It is strongly recommended to use multi-core processors for running the **DCINV3D** and **IPINV3D**. The calculation of the sensitivity matrix (G) is directly proportional to the number of data. The parallelized calculation of the n rows of G is split between p processors. By default, all available processors are used. There is a feature to limit p to a user-defined number of processors.
