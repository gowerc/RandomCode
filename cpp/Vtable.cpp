

#include <iostream>

// struct base {
//     char x {'a'};
// };

// struct derived : public base {
//     char x {'b'};
//     char y {'c'};
// };

// int main() {
//     derived d;
//     std::cout << "Location of d          " << &d << "\n";
//     std::cout << "Address of base::x:    " << static_cast<void*>(&d.base::x) << "\n";
//     std::cout << "Address of derived::x: " << static_cast<void*>(&d.x) << "\n";
//     std::cout << "Address of derived::y: " << static_cast<void*>(&d.y) << "\n";

//     derived d;
//     std::cout << "Location of d          " << &d << "\n";
//     std::cout << "Address of base::x:    " << static_cast<void*>(&d.base::x) << "\n";
//     std::cout << "Address of derived::x: " << static_cast<void*>(&d.x) << "\n";
//     std::cout << "Address of derived::y: " << static_cast<void*>(&d.y) << "\n";
//     return 0;
// }


// struct base {
//     void virtual sleep() {};
//     char x {'a'};
// };

// struct derived : public base {
//     void virtual sleep() override { std::cout << "sleep2"<< std::endl;} ;
//     char x {'b'};
// };

// int main() {
//     derived d;

//     void (ob::*funcPtr)() = &ob::fun;
    
//     std::cout << "Location of d          " << &d << "\n";
//     std::cout << "Address of base::x:    " << static_cast<void*>(&d.base::x) << "\n";
//     std::cout << "..." << &d.base::sleep << std::endl;
//     std::cout << "Address of derived::x: " << static_cast<void*>(&d.x) << "\n";

//     return 0;
// }

#include <iostream>
#include <iomanip>




struct Base {
    int x;
    int y;
    virtual void fun() {std::cout << "hello world" << std::endl;};
    Base(int x, int y) : x(x), y(y) {};
};

struct Derived: public Base {
    int z;
    virtual void fun() {std::cout << "hello world2" << std::endl;};
    Derived(int x, int y, int z) : Base(x, y), z{z} {};
};


void print_memory(unsigned char * buffer, int size) {
    for (int i = 0; i < size; i++) {
        std::cout << std::setw(3 ) << static_cast<int>(buffer[i]) << " ";
    }
    std::cout << std::endl;
}

int main() {
    Base ob{ 1, 2};
    Base ob2{ 4, 5};
    Base *ob_ptr {new Derived{10, 20, 30}};
    
    print_memory( (unsigned char *)&ob, sizeof(Base));
    print_memory( (unsigned char *)&ob2, sizeof(Base));
    print_memory( (unsigned char *)ob_ptr, sizeof(Derived));

    return 0;
}
