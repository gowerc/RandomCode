
cmake -S . -B build
cmake --build build

# Run all TEST_CASES
ctest --test-dir ./build

# List all available TEST_CASE's
ctest --test-dir ./build -N

# Run tests selectively based on the TEST_CASE name
ctest --test-dir ./build -R "add"

