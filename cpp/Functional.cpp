


#include <iostream>
#include <functional>

void greet(const std::string& name) {
    std::cout << "Hello, " << name << "!\n";
}


struct obj {
    int operator()(int) {
        return 5;
    }
};


int myfun(int x, int y) {
    return x / y;
}


int main() {
    std::function<void(const std::string&)> func = greet;
    void (*func2)(const std::string&) = greet;
    func("Alice"); // Calls greet("Alice")
    func2("Bob");
    

    // If you put "void" as the output type then functional
    // will automatically disgard the return value of your function
    // in order to match the signature
    std::function<void(int)> func3 = [](int x) {return x;};
    int (*func4)(int) = [](int x) {return x;};

    int (*fun)(int, int) = [](int x, int y) { return x + y;};

    // int (*func5)(int) = obj();
    std::function<int(int)> func52 = obj();

    std::function<double(int)> func6 = [](int x) {return 1.5f;};
    //int (*func6)(int) = [](int x) {return 1.5f;};

    // won't compile because void can't be put on stdout
    // std::cout << "Func3 = " << func3(10); 
    std::cout << "Func4 = " << func4(10) << std::endl;


    auto myfun_binded_1 = std::bind(myfun, 6, std::placeholders::_1);
    auto myfun_binded_2 = std::bind(myfun, std::placeholders::_1, 6);
    std::cout << myfun_binded_1(2) << std::endl;
    std::cout << myfun_binded_2(12) << std::endl;
    

    std::plus<int> add;
    std::cout << add(3, 4) << std::endl; // Outputs 7

    return 0; 
}

