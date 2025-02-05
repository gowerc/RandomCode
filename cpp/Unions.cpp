
#include <cstdint>
#include <iostream>
#include <cstring> 


union Data {
    std::uint16_t x;
    std::uint16_t y;
};

union Data2 {
    std::uint32_t x;
    struct {
        std::uint16_t y1;
        std::uint16_t y2;
    };
};

union stringish {
    char c[8];
    std::uint64_t x;
};



int main() {

    // 3407896 = 00000000001101000000000000011000 BE
    //         = 00011000000000000010110000000000 LE
    //         = 0001100000000000 0010110000000000 LE (2 * 16)
    //         = 0000000000011000 0000000000110100 BE (2 * 16)
    //         =        24                52  

    Data2 x{3407896};
    std::cout << x.y1 << std::endl;
    std::cout << x.y2 << std::endl;


    // 823472 = 11001001000010110000  BE
    //        = 00001101000010010011  LE
    //        = 00001101 00001001 00110000 LE  (3 * 8)
    //        = 10110000 10010000 00001100 BE  (3 * 8)
    //        =   176        144      12
    //        

    stringish mystring;
    mystring.x = 0;
    mystring.c[0] = 176;
    mystring.c[1] = 144;
    mystring.c[2] = 12;
    std::cout << mystring.x << std::endl;

    union { int x; int y; } myint { 12};
    std::cout << myint.y << std::endl;

}




