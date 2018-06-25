__param::

Inversion parameters
--------------------

For each of the experiments conducted, most of the inversion parameters were held constant for consistency. Some of these parameters are include:

octree_mesh
	159,772 cells on an underlying base mesh which is 128 x 128 x 64 cells and has a smallest cell size of 30 x 30 x 15 m.

reference model
	A uniforom halfspace with a conductivity of 0.001 S/m and a chargeability of 0.0001.

initial model
	Same as the reference model

active cells
	No topography is used and all model cells are active in this example. So the topography and model active cells are both set to ALL_ACTIVE.

cell weights
	No cells weights are used (NO_WEIGHTS)

interface weights
	No interface weights are used (NO_FACE_WEIGHTS)

beta
	Beta values are set to DEFAULT

alpha's
	Alpha coefficients are: :math:`\alpha_s = 1E-5, \alpha_x = \alpha_y = \alpha_z = 1`. This corresponds to a length scale of approximately 316 m in all directions.

chifact
	1

tol_nl
	1E-2

mindm
	1E-3

iter_per_beta
	2

tol_ipcg
	1E-2

max_iter_ipcg
	15

reference model change
	The reference model is not changed at each beta step (NOT_CHANGE_MREF)

smoothing
	The SMOOTH_MOD_DIF option was used in all inversions.

bounds
	For the DC data, NO_BOUNDS were applied. For the IP data, a positivity constraint was enforced using constant bounds (BOUNDS_CONST 0 1).