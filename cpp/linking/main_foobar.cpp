#include "foobar.h"
#include <iostream>

int main() {
    int x{5};
    int y{x + 10};
    std::cout << y << std::endl;
    foobar();
}

