
#include <R.h>
#include <Rinternals.h>

// Function to add two numbers using .Call()
extern "C" SEXP add_numbers_cpp(SEXP a, SEXP b) {
    double result = REAL(a)[0] + REAL(b)[0];
    return ScalarReal(result);
}

