#include <iostream>
#include <vector>
#include <memory>
#include <cstdio>
#include "version.h"
#ifdef USE_MYLIB
    #include "adder.hpp"
#endif



int main() {

#ifdef USE_MYLIB
    std::cout << "Using mylib = " << mymath::adder(1 , 5) << std::endl;
#else
    std::cout << "No mylib available" << std::endl;
#endif
    std::cout << "Hello World!" << std::endl;
    std::cout << "On version "
              << MYPROJECT_VERSION_MAJOR
              << "."
              << MYPROJECT_VERSION_MINOR
              << "."
              << MYPROJECT_VERSION_PATCH
              << " and number = "
              << MYPROJECT_VALUE
              << std::endl;

    std::vector<int> x1{4};
    std::vector<int> x2(4);
    
    std::cout << x1.size() << std::endl;
    std::cout << x2.size() << std::endl;
    return 0;
}



