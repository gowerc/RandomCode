
// Examples of trailing return types
// This is where we can specify the return type of a function
// after its signature definition.
// This is most useful in template functions where the return type
// might itself be a function or some property of the input object

// Also demonstrate the `decltype()` compile-time operator
// for accessing the types of input objects / expressions


#include <iostream>

struct Bob {
    using type = int;
    int x = 10;
};


struct Ben {
    using type = char;
    char x = 'a';
};

// Get type by extracting it from what has been explicitly declared in the object
template<typename T>
auto get_x(T obj) -> typename T::type {
    return obj.x;
}

// Get type by inferring it from the object member
template<typename T>
auto get_x2(T obj) -> decltype(obj.x) {
    return obj.x;
}

auto myfun(int x) -> int {
	return x + 1;
}

int main () {
    Bob obj1;
    Ben obj2;
    std::cout << get_x(obj1) << ", " << get_x(obj2) << std::endl;
    std::cout << get_x2(obj1) << ", " << get_x2(obj2) << std::endl;

    std::cout << myfun(4) << std::endl;
    
    auto x = [](int x) -> int {
        return x + 5;
    }(10);
    std::cout << x << std::endl;
}



