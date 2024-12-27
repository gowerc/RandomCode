


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


int main() {
    std::function<void(const std::string&)> func = greet;
    void (*func2)(const std::string&) = greet;


    // If you put "void" as the output type then functional
    // will automatically disgard the return value of your function
    // in order to match the signature
    std::function<void(int)> func3 = [](int) {return 1;};
    int (*func4)(int) = [](int) {return 1;};

    // This will NOT work:
    auto lambda = [](const std::string& name) { std::cout << "Hi, " << name << "!\n"; };
    func2 = lambda; // Error: lambdas are not function pointers.

    func("Alice"); // Calls greet("Alice")
    func2("Bob");

    return 0;
}

