#include <iostream>
#include <string>
#include "spdlog/spdlog.h"
#include "spdlog/sinks/basic_file_sink.h"


#include "spdlog/fmt/ostr.h"  // Required for operator<< integration
#include "spdlog/fmt/fmt.h"


struct MyObj {
    int x {4};
    friend std::ostream& operator<<(std::ostream& os, const MyObj& p) {
        os << "Object(x: " << p.x << ")";
        return os;
    }
};

// Explicit template specalisation
// Sets a formatter for our object which simply inherts from fmt::ostream_formatter
// Means format on our object just returns the ostream
template <>
struct fmt::formatter<MyObj> : fmt::ostream_formatter {};


int main() {

    MyObj myob;
    std::cout << "Hello world" << std::endl;
    std::string x {fmt::format("{}", myob)};
    std::cout << x << std::endl;
    fmt::print("{}\n", myob);

    // 3rd arg = true -> Overwrite,  False -> Append
    auto file_logger = spdlog::basic_logger_mt("file_logger", "logs/app.log", true);


    file_logger->warn("Hello");
    file_logger->warn(myob);
    file_logger->warn(myob);
    file_logger->info("Hello again");
    
    
    spdlog::info("Welcome to spdlog!");
    spdlog::error("Some error message with arg: {}", 1);
    
    spdlog::warn("Easy padding in numbers like {:08d}", 12);
    spdlog::critical("Support for int: {0:d};  hex: {0:x};  oct: {0:o}; bin: {0:b}", 42);
    spdlog::info("Support for floats {:03.2f}", 1.23456);
    spdlog::info("Positional args are {1} {0}..", "too", "supported");
    spdlog::info("{:<30}", "left aligned");
    
    spdlog::set_level(spdlog::level::debug); // Set global log level to debug
    spdlog::debug("This message should be displayed..");    
    
    // change log pattern
    spdlog::set_pattern("[%H:%M:%S %z] [%n] [%^---%L---%$] [thread %t] %v");
    
    // Compile time log levels
    // Note that this does not change the current log level, it will only
    // remove (depending on SPDLOG_ACTIVE_LEVEL) the call on the release code.
    SPDLOG_TRACE("Some trace message with param {}", 42);
    SPDLOG_DEBUG("Some debug message");
}
