
#include <iostream>

#include <initializer_list>

int main () {
    {
        struct Obj {
            int x;
        };
        std::cout << "\n------" << std::endl;
        std::cout << (Obj{}).x << std::endl;     // 0
        std::cout << (Obj{1}).x << std::endl;    // 1
    }
    {
        struct Obj {
            int x;
            Obj() = default;
        };
        std::cout << "\n------" << std::endl;
        std::cout << (Obj{}).x << std::endl;     // 0
        // std::cout << (Obj{1}).x << std::endl; // Compiler error
    }
    {
        struct Obj {
            int x;
            Obj() {};
        };
        std::cout << "\n------" << std::endl;
        std::cout << (Obj{}).x << std::endl;     // Gibberish
        // std::cout << (Obj{1}).x << std::endl; // Compiler error
    }

}


