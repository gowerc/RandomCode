

# Download Catch2 and execute its CMake configuration
# In particular this creates the Catch2::Catch2WithMain target
# which contains the needed include directories that our test scripts need
FetchContent_Declare(
    Catch2
    GIT_REPOSITORY https://github.com/catchorg/Catch2.git
    GIT_TAG v3.4.0
)
FetchContent_MakeAvailable(Catch2)


# Create a test executable
add_executable(tests test_math.cpp)

# Add Catch2 and math libraries to our test script (note that the "math" target)
# Is defined from the parent CMakeLists.txt
target_link_libraries(tests PRIVATE Catch2::Catch2WithMain math)



add_executable(tests2 test_math2.cpp)
target_link_libraries(tests2 PRIVATE Catch2::Catch2WithMain math2)

# Catch extension has `catch_discover_tests` function
# which will automatically discover all Catch2 `TEST_CASES()` and convert them
# into CTest tests
include(Catch)
catch_discover_tests(tests)
catch_discover_tests(tests2)
