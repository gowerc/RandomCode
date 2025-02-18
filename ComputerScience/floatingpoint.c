#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>
#include <math.h>

void printBinary(unsigned int n) {
    //  `>>` does a right bit shift e.g.  10 >> 2 means shift the bits of the
    // number 10 two places to the right. Values on the left are replaced with 
    // 0's  (undefined behaviour for signed numbers though normally the sign)
    // is maintained e.g. negative values are filled in with 1).
    //
    // Key effect is this mean the ith (or 2nd in the example) digit is now
    // in the least significant position (the right most position)
    //
    // & 1 means perform a bitwise and opporation with the number 1
    // e.g.   0000 0000 0000 0001  (for 16 bit numbers) essentially
    // meaning we are 0'ing out all bits execpt for the last one
    // meaning our resulting number of  (n >> i) & 1  is either 1
    // if the i'th digit was a 1 or 0 if the i'th digit was a 0
    //
    // We then loop over all 32 digits repeating this process to print the 
    // exact binary representation
    
    // Sign
    for (int i = 31; i >= 31; i--) {
        printf("%d", (n >> i) & 1);
    }
    printf(" ");  // add space for visual guide
    // Exponent
    for (int i = 30; i >= 23; i--) {
        printf("%d", (n >> i) & 1);
    }
    printf(" ");  // add space for visual guide
    // Mantissa
    for (int i = 22; i >= 0; i--) {
        printf("%d", (n >> i) & 1);
    }
}


void printFloatHex(float num) {
    // Union reads in just one bit of data (in this case we are providing
    //  f with the value of num) but then you can access the different elements
    // to reinterpret the raw binary as something else (in this case an 
    // unsigned-32 bit int)
    union {
        float f;
        uint32_t u;
    } f2u = { .f = num };

    printf ("Number : %f\nHex    : 0x%x \n", f2u.f, f2u.u);
    printf("Binary : ");
    printBinary(f2u.u);
    printf("\n\n");
}

int main() {
    float num = 10.625f;
    printFloatHex(num);
    printFloatHex(-10.625f);
    printFloatHex(NAN);
    printFloatHex(INFINITY);
    printFloatHex(-INFINITY);
    printFloatHex(0.0f);
    printFloatHex(-0.0f);
    printFloatHex(0.00000000000000000000000000000000000001175493f);
    printFloatHex(0.00000000000000000000000000000000000001175495f);
    return 0;
}
