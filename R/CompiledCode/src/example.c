#include <R.h>
#include <Rinternals.h>


// Example using .Call() interface
SEXP add_numbers_call(SEXP x, SEXP y) {
    double result = REAL(x)[0] + REAL(y)[0];
    return ScalarReal(result);
}
