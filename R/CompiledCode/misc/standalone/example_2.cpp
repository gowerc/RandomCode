//
// This file is to be compiled as a standalone shared library
// to be loaded into R on the fly (e.g. manually calling .Call() ) and
// not using the package interface
//
// See misc/standalone_ex.R
//


#include <R.h>
#include <Rinternals.h>

// Function to add two numbers using .Call()
extern "C" SEXP add_numbers_cpp(SEXP a, SEXP b) {
    double result = REAL(a)[0] + REAL(b)[0];
    return ScalarReal(result);
}

