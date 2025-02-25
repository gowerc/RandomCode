


cmake -S . -B build  &&
    cmake --build build  &&
    bin/main


# List options
ctest --help

# Run all tests in build directory
ctest --test-dir build

# Only run tests whose labels meet a regex
ctest --test-dir build -R "test_cpp_[1-2]"
ctest --test-dir build -R "test_bash_[1-2]"
ctest --test-dir build -R "test_python_1"

# Run tests in parallel (2 processes)
ctest --test-dir build -j 2
