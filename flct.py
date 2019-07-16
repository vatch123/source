import numpy as np
import math
from pyflctsubs import(
    endian,
    read_to_images,
    write_3_images,
    pyflct_plate_carree,
    pyflct,
)

__all__ = ["flct", ]


def flct(infile, outfile, deltat, deltas, sigma, quiet=False,
         biascor=False, thresh=0., absflag=False, skip=None, poff=0, qoff=0,
         skipon=0, interp=False, kr=None, pc=False, latmin=0, latmax=0.2,
         ):

    if quiet is True:
        verbose = False
    else:
        verbose = True

    if skip is not None:
        if skip <= 0:
            raise ValueError("Skip value must be greater than zero.")
        skipon = skip + math.abs(qoff) + math.abs(poff)

        if math.abs(poff) >= skip or math.abs(qoff) >= skip:
            raise ValueError("The absolute value of poff and qoff must be less than skip")

    if kr is not None:
        if kr <= 0. or kr >= 20.:
            raise ValueError("The value of kr must be between 0. and 20.")
        filter = 1

    ibe = endian()

    ier, nx, ny, f1, f2 = read_to_images(infile, 0)

    nxorig = nx
    nyorig = ny

    if sigma == 0:
        nx = 1
        ny = 1

    if skip >= nx or skip >= ny:
        raise ValueError("Skip is greater than the input dimensions")

    transp = 1

    vx = np.zeros((nx * ny,), dtype=float)
    vy = np.zeros((nx * ny,), dtype=float)
    vm = np.zeros((nx * ny,), dtype=float)

    if pc is True:
        ierflct, vx_c, vy_c, vm_c = pyflct_plate_carree(transp, f1, f2, nxorig, nyorig, deltat,
                                                        deltas, sigma, vx, vy, vm, thresh, absflag,
                                                        filter, kr, skip, poff, qoff, interp, latmin,
                                                        latmax, biascor, verbose)
    else:
        ierflct, vx_c, vy_c, vm_c = pyflct(transp, f1, f2, nxorig, nyorig, deltat, deltas, sigma, vx, vy,
                                           vm, thresh, absflag, filter, kr, skip, poff, qoff, interp,
                                           biascor, verbose)

    write_3_images(outfile, vx, vy, vm, nx, ny, transp)

    return ierflct
