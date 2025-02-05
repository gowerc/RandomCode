// #include <cstdint>
// #include <iostream>


// int main () {
//     // std::cout << "Hello world" << std::endl;
    
//     // double x = 1.2f;
//     // int y = x;
    
//     // double x2 = 1.2f;
//     // int y2 = (int)x2;


//     // int x3 = static_cast<int>(x2);
//     // std::cout << x3 << std::endl;


//     // reinterpret_cast<type*>(pointer)
//     // Largely used to switch between pointer types to tell it 
//     // to view the memory as a different type
//     int xc = 66;  // Decimal value for "B" in ascii
//     std::cout << reinterpret_cast<char*>(&xc) << std::endl;  // Prints "B" 
 

//     struct Animal {
//         virtual void speak() =0;
//     };

//     struct Dog : public Animal {
//         void speak() override {};
//     };

//     Animal* animal = new Dog();

//     Dog* dog = dynamic_cast<Dog*>(animal);

//     if (dog) {
//         std::cout << "It is a dog" << std::endl;
//     } else {
//         std::cout << "This Animal is not a Dog." << std::endl;
//     }

//     int y{200};
//     float x = static_cast<float>(y);
//     std::cout << x << std::endl;

// }


#include <iostream>

struct A {
    int x{1};
};

struct B {
    int y{2};
    B(int v): y{v} {};
    B(const A& a): B(a.x){};
};


int main() {
    A apple =  A{};

    B bananna = static_cast<B>(apple);
    std::cout << bananna.y << std::endl;

    return 0;
}
