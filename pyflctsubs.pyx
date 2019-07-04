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

# def read_to_images(file_name, nx, ny, arr, barr, transpose=0):
    # return read2images(file_name, &nx, &ny, double **arr, double **barr, transpose)

def sign(value):
    return signum(value)

def endian():
    return is_large_endian ()
