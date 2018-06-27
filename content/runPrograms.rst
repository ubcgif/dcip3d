.. _runPrograms:

Running the programs
====================

The DCIP3D library consists of three core programs and nine utilities.

Core Programs:

- ``DCIPF3D``: Forward model conductivity/chargeability models to calculate data.
- ``DCINV3D``: Invert 3D DC data to develop a conductivity models using a Gauss-Newton method
- ``IPSEN3D``: calculates the sensitivity matrix for the 3D IP inversion
- ``IPINV3D``: Invert 3D IP data to develop a chargeability models using a Gauss-Newton method

Utilities:

- ``MAKE_WDAT``: makes a weighting file for smoothing near surface zones of the model

This section discusses the use of these codes individually.

Introduction
------------

All programs in the package can be executed under Windows or Linux environments. They can be run by either typing the program name by itself, or followed by a control file in the command promp (Windows) or terminal (Linux). They can be executed directly on the command line or in a shell script or batch file. When a program is executed without any arguments, it will either print a simple message describing the usage or otherwise search for a proper control file name in the working directory. If this is the case, then the name of the corresponding control file (if changed by the user) will result in termination of the executable, followed by an error message. If the hard-coded name is used, the program will run.

Some executables require more than one input argument.

Execution on a single computer
------------------------------
The command format for use on a single processor is described below. Within the command prompt or terminal, any of the programs can be called using:

.. code-block:: rst

        program arg1 [arg2 ... argi]

where:

program
        is the name of the executable

argi
        is a command line argument, which can be a name of corresponding required or optional file. Typing **-inp** as the input file serves as a help function and returns an example input file. Some executables do not require input files and **program** should be followed by multiple arguments instead. This will be discussed in more detail later in this section for specific programs.

Each control file contains a formatted list of arguments, parameters and file names in a com-
bination and sequence specific for the executable, which requires this control file. Different control file formats will be explained further in the document for each executable. All files are in ASCII text format - they can be read with any text editor. Input and control files can have any name the user specifies.

**NOTE**: Formats of the files listed in this control file are explained :ref:`here <fileformats>`.

Programs
--------

.. toctree::
        :maxdepth: 1

        DCIPF3D <runprog/fwd>
        DCInv3D <runprog/dcinv>
        IPSEN3D <runprog/ipsen>
        IPInv3D <runprog/ipinv>
        MAKE_WDAT <runprog/weights>
