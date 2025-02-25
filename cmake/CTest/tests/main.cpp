

#include <iostream>
#include <thread>
#include <chrono>

int main(int nargs,  char* args[]) {
    std::cout << "Starting Sleep" << std::endl;
    std::this_thread::sleep_for(std::chrono::seconds(1));
    std::cout << "Ending Sleep" << std::endl;
    std::cout << "nargs: " << nargs << std::endl;
    if (nargs <= 3) {
        return 0;
    }
    return 1;
}


