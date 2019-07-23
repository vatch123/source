import flct
import pandas as pd
import numpy as np
vx, vy, vm = flct.flct(b'hashgauss.dat', b'testlevels.dat', 1, 1, 5, kr=0.5)
print(vx.reshape((201, 101)))

orig = np.array(pd.read_csv('testgauss_vx.csv', header=None))

assert np.allclose(orig, vx.reshape((101, 201)))
