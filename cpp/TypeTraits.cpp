#include <string>
#include <iostream>
#include <type_traits>


// Exmaple of using is_same<> to check if a provided type is
// the same as the type we are expecting
// Note the need for constexpr to get the compiler to resolve the statements
// at compile time otherwise a compiler error will be thrown as `ints`
// don't have a size method
template <typename T>
void myfun(T x) {
    if constexpr (std::is_same<T, int>::value) {
        std::cout << "myfun - T is int" << std::endl;
    } if constexpr (std::is_same<T, std::string>::value) {
        std::cout << "myfun - T is string with length " << x.size() << std::endl;
    } else {
        std::cout << "myfun - T is not int" << std::endl;
    }
};



// Example of only allowing a template to be resolved for a specific type
// commonly used within classes to enable/disable methods based on the type
// In this case if `is_same<>::value` retuns true then `enable_if<>` returns
// void and the function is enabled, otherwise the function is disabled
template <typename T>
typename std::enable_if<std::is_same<T, int>::value, void>::type myfun2() {
    std::cout << "myfun2 - T is int" << std::endl;
};



int main () {

    int x {10};

    myfun<int>(1);
    myfun<float>(1.0);
    myfun<std::string>("hello world");
    std::cout << std::endl;

    // Example where `enable_if<>` is used to determine if a function is enabled    
    myfun2<int>();
    // myfun2<float>(); - Compiler error - no matching function for call to 'myfun2'
    std::cout << std::endl;


    // decltype(x) returns the type of a variable "x" e.g. `int` as many of the type traits
    // work on types not on variables
    std::cout << "Is myfun a function - " << std::is_function<decltype(x)>::value << std::endl;
    std::cout << "Is myfun a function - " << std::is_function<decltype(myfun<int>)>::value << std::endl;
    std::cout << std::endl;

    // Code to check if a variable is of a specific type
    std::cout << "Is is_same(x, int) - " << std::is_same<decltype(x), int>::value << std::endl;
    std::cout << std::endl;



    // Exmaple of converting between a base-type to its pointer variant
    using PointerType = std::add_pointer<decltype(x)>::type;          // Equivalent to int*
    using NonPointerType = std::remove_pointer<PointerType>::type;    // Equivalent to int
    std::cout << std::is_same<PointerType, int*>::value << "\n";      // true
    std::cout << std::is_same<NonPointerType, int>::value << "\n";    // true
    std::cout << std::endl;
}





