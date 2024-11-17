#include <stdio.h>

void printBinary(unsigned int n) {
    for (int i = 31; i >= 0; i--) {
        printf("%d", (n >> i) & 1);
    }
}

void printFloatBinary(float num) {
    union {
        float f;
        unsigned int i;
    } u;
    u.f = num;
    
    // Print sign bit
    printf("Sign: ");
    printf("%d\n", (u.i >> 31) & 1);
    
    // Print exponent bits
    printf("Exponent: ");
    for (int i = 30; i >= 23; i--) {
        printf("%d", (u.i >> i) & 1);
    }
    printf("\n");
    
    // Print mantissa bits
    printf("Mantissa: ");
    for (int i = 22; i >= 0; i--) {
        printf("%d", (u.i >> i) & 1);
    }
    printf("\n");
}

int main() {
    float num = 1.5; // Example number
    printf("Floating-point number: %f\n", num);
    printf("Binary representation:\n");
    printFloatBinary(num);
    return 0;
}

