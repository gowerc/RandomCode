//
// This file is to be compiled as a standalone shared library
// to be loaded into R on the fly (e.g. manually calling .Call() ) and
// not using the package interface
//
// See misc/standalone_ex.R
//


#include <R.h>
#include <Rinternals.h>

// Example using .C() interface
void add_numbers(double *x, double *y, double *result) {
    *result = *x + *y;
}

// Example using .Call() interface
SEXP add_numbers_call(SEXP x, SEXP y) {
    double result = REAL(x)[0] + REAL(y)[0];
    return ScalarReal(result);
}
