#include <map>
#include <vector>
#include <iostream>



int main () {
    std::pair<int, char> x{1, 'X'};
    
    // Copy
    auto [a1, b1] = x;
    std::cout << "a = " << a1 << ", b = " << b1 << std::endl;
    
    // Const Copy
    auto const [a2, b2] = x;
    std::cout << "a = " << a2 << ", b = " << b2 << std::endl;
    
    // Reference
    auto & [a3, b3] = x;
    b3 = 'Z';
    std::cout << "a = " << a3 << ", b = " << b3 << std::endl;
    
    // Const Reference
    auto const & [a4, b4] = x;
    std::cout << "a = " << a4 << ", b = " << b4 << std::endl;

    
    int z[] = {1, 2, 3, 4};
    auto [v1, v2, v3, v4] = z;
    
}