


cmake -S . -B build  &&
    cmake --build build  &&
    bin/main


# List options
ctest --help

# List available tests
ctest --test-dir build -N

# Run all tests in build directory
ctest --test-dir build

# Only run tests whose NAMES meet a regex
ctest --test-dir build -R "test_cpp_[1-2]"
ctest --test-dir build -R "test_bash_[1-2]"
ctest --test-dir build -R "test_python_1"

# Only run tests whose LABELS meet a regex
# Labels are set via `set_tests_properties(FastTest PROPERTIES LABELS "fast")`
ctest --test-dir build -L "fast"

# Only run tests whose labels don't meet a regex
ctest --test-dir build -E "test_cpp_.*"

# Run tests in parallel (2 processes)
ctest --test-dir build -j 2

# Show verbose output and extra verbose output to help diagnose problems
ctest --test-dir build --verbose         # or -V
ctest --test-dir build --extra-verbose   # or -VV 


# Show full output log (stdout/stderr) but only for tests that fail
ctest --test-dir build --output-on-failure


######## The following haven't been tested but are mentioned because
######## they look useful under certain circumstances

# Limit test execution to only 2 CPU cores
ctest --test-dir build --test-load 2

# Set runtime limits (seconds)
ctest --test-dir build --timeout 60

# Repeat a failing test up to a limit
ctest --test-dir build --repeat until-pass:3

# Run Coverage Tests (gcov/llvm-cov)
ctest --test-dir build -T Coverage

# Run Memory Checks (Valgrind)
ctest --test-dir build -T MemCheck
