.. important:: In March of 2020, DCIP3D v5.5 was released with the intention of replacing v5.0. Online documentation is primarily intended for v5.5, although any differences in input file formats between v5.0 and v5.5 are documented when necessary.


.. _example:

Examples
========

Version 5.5
-----------

Here, the program libraries for DCIP3D v5.5 will be used to:

    - Create conductivity and chargeability models on a tensor mesh
    - Forward model DC and IP data
    - Generate near-surface interface weights for DC/IP inversion
    - Invert DC and IP data to recover conductivity and chargeability models, respectively

Zip folders containing all necessary files can be downloaded here:

    - - `Download and open the zip folder containing the entire DCIP3D v5.0 example <https://github.com/ubcgif/dcip3d/raw/master/assets/dcip3d_v5p5_example.zip>`__ (if not done already)

The full example is parsed into 6 sections:

.. toctree::
    :maxdepth: 1

    Create tensor models <example/create_model>
    DC Forward modeling <example/dcfwd>
    IP Forward modeling <example/ipfwd>
    Near Surface Interface Weights <example/interface_weights>
    DC Inversion <example/dcinv>
    IP Inversion <example/ipinv>



Version 5.0 Legacy Example
--------------------------

We also have a legacy example that was created with DCIP3D v5.0. The results of this example can be reproduced with DCIP3D v5.5 but it will require some alteration of the input files.

	- `Download zip file for legacy example <https://github.com/ubcgif/dcip3d/raw/master/assets/dcip3dv5_example.zip>`__


The full example is parsed into 5 sections:

.. toctree::
        :maxdepth: 2

        Introduction <example_legacy/introduction>
        DC Forward Modeling <example_legacy/dcfor>
        IP Forward Modeling <example_legacy/ipfor>
        DC inversion <example_legacy/dcinv_example>
        IP inversion <example_legacy/ipinv_example>
        Version Comparison <example_legacy/versioncomparison>


