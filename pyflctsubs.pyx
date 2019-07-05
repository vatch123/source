import numpy as np
cimport numpy as np
cdef extern from "flctsubs.h":
    void flct_f77__(int * transp, double * f1, double * f2, int * nx, int * ny,
        double * deltat, double * deltas, double * sigma, double * vx,
        double * vy, double * vm, double * thresh, int * absflag, int * filter,
        double * kr, int * skip, int * poffset, int * qoffset, int * interpolate,
        int * biascor, int * verbose)
    void flct_f77_(int * transp, double * f1, double * f2, int * nx, int * ny,
        double * deltat, double * deltas, double * sigma, double * vx,
        double * vy, double * vm, double * thresh, int * absflag, int * filter,
        double * kr, int * skip, int * poffset, int * qoffset, int * interpolate,
        int * biascor, int * verbose)
    void flct_f77(int * transp, double * f1, double * f2, int * nx, int * ny,
        double * deltat, double * deltas, double * sigma, double * vx,
        double * vy, double * vm, double * thresh, int * absflag, int * filter,
        double * kr, int * skip, int * poffset, int * qoffset, int * interpolate,
        int * biascor, int * verbose)
    int flct (int transp, double * f1, double * f2, int nx, int ny, double deltat,
        double deltas, double sigma, double * vx, double * vy, double * vm,
        double thresh, int absflag, int filter, double kr, int skip,
        int poffset, int qoffset, int interpolate, int biascor, int verbose)
    int readimage (char *fname, int *nx, int * ny, double **arr, int transp)
    int read2images (char *fname, int * nx, int * ny, double **arr, double **barr,
            int transp)
    int where (char *cond, int xsize, int ** index, int * length_index)
    int cross_cor (int init, int hires, int expand, double *arr, double *barr,
        double **absccor, int nx, int ny, double *shiftx, double *shifty, 
        int filterflag, double kr, double sigma)
    int writeimage (char *fname, double *arr, int nx, int ny, int transp)
    int write2images (char *fname, double *arr, double *barr, int nx, int ny,
        int transp)
    int write3images (char *fname, double *arr, double *barr, double *carr,
        int nx, int ny, int transp)
    int shift2d (double *arr, int nx, int ny, int ishift, int jshift)
    int maxloc (double *arr, int xsize)
    int minloc (double *arr, int xsize)
    int iminloc (int * arr, int xsize)
    int imaxloc (int * arr, int xsize)
    double r (double t)
    int interpcc2d (double *fdata, double xmiss, int nx, int ny, 
        double *xwant, int nxinterp, double *ywant, int nyinterp, double **finterp)
    int gaussfilt(double *filter, double *kx, double *ky, int nx, int ny, double kr)
    int make_freq(double *k, int ndim)
    int filter_image(double *arr, double *barr, double *outarr, double *outbarr,
        int nx, int ny, double kr)
    int is_large_endian()
    int byteswapflct (unsigned char *arr, int arrsize, int nbpw)
    int warp_frac2d(double *arr, double *delx, double *dely, double *outarr,
        int nx, int ny, int transp, int verbose)
    int flct_pc (int transp, double * f1, double * f2, int nx, int ny, double deltat,
        double deltas, double sigma, double * vx, double * vy, double * vm,
        double thresh, int absflag, int filter, double kr, int skip,
        int poffset, int qoffset, int interpolate, double latmin, double latmax,
        int biascor, int verbose)
    void flct_pc_f77__(int * transp, double * f1, double * f2, int * nx, int * ny,
        double * deltat, double * deltas, double * sigma, double * vx,
        double * vy, double * vm, double * thresh, int * absflag, int * filter,
        double * kr, int * skip, int * poffset, int * qoffset, int * interpolate,
        double * latmin, double * latmax, int * biascor, int * verbose)
    void flct_pc_f77_(int * transp, double * f1, double * f2, int * nx, int * ny,
        double * deltat, double * deltas, double * sigma, double * vx,
        double * vy, double * vm, double * thresh, int * absflag, int * filter,
        double * kr, int * skip, int * poffset, int * qoffset, int * interpolate,
        double * latmin, double * latmax, int * biascor, int * verbose)
    void flct_pc_f77(int * transp, double * f1, double * f2, int * nx, int * ny,
        double * deltat, double * deltas, double * sigma, double * vx,
        double * vy, double * vm, double * thresh, int * absflag, int * filter,
        double * kr, int * skip, int * poffset, int * qoffset, int * interpolate,
        double * latmin, double * latmax, int * biascor, int * verbose)
    int mc2pc(int transp, double *f, int nxinterp, int nyinterp, double umin,
        double umax, double vmin, double vmax, double ** finterp, int nx, int ny)
    int pc2mc(int transp, double *f, int nx, int ny, double lonmin, double lonmax,
        double latmin, double latmax, double ** finterp, int *nxinterp,
        int *nyinterp, double * vmin, double *vmax)
    double signum(double v)
    int shift_frac2d(double *arr, double delx, double dely, double *outarr,
        int nx, int ny, int transp, int verbose)
    void warp_frac2d_f77(double *arr, double *delx, double *dely, double *outarr,
        int *nx, int*ny, int *transp, int *verbose)
    void warp_frac2d_f77_(double *arr, double *delx, double *dely, double *outarr,
        int *nx, int*ny, int *transp, int *verbose)
    void warp_frac2d_f77__(double *arr, double *delx, double *dely, double *outarr,
        int *nx, int*ny, int *transp, int *verbose)
    void shift_frac2d_f77(double *arr, double *delx, double *dely, double *outarr,
        int *nx, int *ny, int *transp, int *verbose)
    void shift_frac2d_f77_(double *arr, double *delx, double *dely, double *outarr,
        int *nx, int *ny, int *transp, int *verbose)
    void shift_frac2d_f77__(double *arr, double *delx, double *dely, double *outarr,
        int *nx, int *ny, int *transp, int *verbose)

def read_to_images(file_name, nx, ny, arr, barr, transpose=0):
    cdef np.ndarray[int, ndim=1, mode="c"] nx_c = np.asarray(nx, dtype = int, order="C")
    cdef np.ndarray[int, ndim=1, mode="c"] ny_c = np.asarray(ny, dtype = int, order="C")
    cdef np.ndarray[double, ndim=2, mode="c"] arr_c = np.asarray(arr, dtype = float, order="C")
    cdef np.ndarray[double, ndim=2, mode="c"] barr_c = np.asarray(barr, dtype = float, order="C")
    
    return read2images(file_name, <int *> nx_c.data, <int *> ny_c.data, <double **> arr_c.data, <double **> barr_c.data, transpose)


def write_3_images(file_name, arr, barr, carr, nx, ny, transpose):
    cdef np.ndarray[double, ndim=1, mode="c"] arr_c = np.asarray(arr, dtype = float, order="C")
    cdef np.ndarray[double, ndim=1, mode="c"] barr_c = np.asarray(barr, dtype = float, order="C")
    cdef np.ndarray[double, ndim=1, mode="c"] carr_c = np.asarray(carr, dtype = float, order="C")

    return write3images(file_name, <double *> arr_c.data, <double *> barr_c.data, <double *> carr_c.data, nx, ny, transpose)


def sign(value):
    return signum(value)


def endian():
    return is_large_endian ()


def pyflct_plate_carree(transpose, f1, f2, nxorig, nyorig, deltat, deltas, sigma, 
                      vx, vy, vm, thresh, absflag, filter, kr, skip, poffset,
                      qoffset, interpolate, latmin, latmax, biascor, verbose
):
    cdef np.ndarray[double, ndim=1, mode="c"] f1_c = np.asarray(f1, dtype = float, order="C")
    cdef np.ndarray[double, ndim=1, mode="c"] f2_c = np.asarray(f2, dtype = float, order="C")
    cdef np.ndarray[double, ndim=1, mode="c"] vx_c = np.asarray(vx, dtype = float, order="C")
    cdef np.ndarray[double, ndim=1, mode="c"] vy_c = np.asarray(vy, dtype = float, order="C")
    cdef np.ndarray[double, ndim=1, mode="c"] vm_c = np.asarray(vm, dtype = float, order="C")

    return flct_pc(transpose, <double *> f1_c.data, <double *> f2_c.data, nxorig, nyorig, deltat,
                   deltas, sigma, <double *> vx_c.data, <double *> vy_c.data, <double *> vm_c.data,
                   thresh, absflag, filter, kr, skip, poffset, qoffset, interpolate, latmin, latmax,
                   biascor, verbose)


def pyflct(transpose, f1, f2, nxorig, nyorig, deltat, deltas, sigma, 
                      vx, vy, vm, thresh, absflag, filter, kr, skip, poffset,
                      qoffset, interpolate, latmin, latmax, biascor, verbose
):
    cdef np.ndarray[double, ndim=1, mode="c"] f1_c = np.asarray(f1, dtype = float, order="C")
    cdef np.ndarray[double, ndim=1, mode="c"] f2_c = np.asarray(f2, dtype = float, order="C")
    cdef np.ndarray[double, ndim=1, mode="c"] vx_c = np.asarray(vx, dtype = float, order="C")
    cdef np.ndarray[double, ndim=1, mode="c"] vy_c = np.asarray(vy, dtype = float, order="C")
    cdef np.ndarray[double, ndim=1, mode="c"] vm_c = np.asarray(vm, dtype = float, order="C")

    return flct(transpose, <double *> f1_c.data, <double *> f2_c.data, nxorig, nyorig, deltat,
                deltas, sigma, <double *> vx_c.data, <double *> vy_c.data, <double *> vm_c.data,
                thresh, absflag, filter, kr, skip, poffset, qoffset, interpolate, biascor, verbose)
