
cmake_minimum_required(VERSION 3.10)
project(ExampleCTest)
set(CMAKE_CXX_STANDARD 17)


include(CTest)
enable_testing()

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)


add_executable(main tests/main.cpp)

add_test(NAME test_cpp_0 COMMAND main)
add_test(NAME test_cpp_1 COMMAND main "a")
add_test(NAME test_cpp_2 COMMAND main "a" "b")
add_test(NAME test_cpp_3 COMMAND main "a" "b" "c")
add_test(NAME test_cpp_4 COMMAND main "a" "b" "c" "d")


## Example showing it working with arbirary scripts
add_test(
    NAME test_bash_1
    COMMAND "${CMAKE_CURRENT_LIST_DIR}/tests/test.sh" "hi"
)
add_test(
    NAME test_bash_2
    COMMAND "${CMAKE_CURRENT_LIST_DIR}/tests/test.sh" "error"
)

add_test(
    NAME test_python_1
    COMMAND "python3" "${CMAKE_CURRENT_LIST_DIR}/tests/test.py"
)

# Define a regular expression to match the output of the stdout
# of a test that must match for the test to be considered
# a pass
add_test(
    NAME hello_world
    COMMAND "echo" "Hello World"
)
set_property(
    TEST hello_world
    PROPERTY PASS_REGULAR_EXPRESSION "Hello World"
)
# Other properites that can be set:
#     ENVIRONMENT "VAR1=value;VAR2=value"   # Sets environment variables during test
#     LABELS "label"    # Labels for logical grouping / execution
#     WILL_FAIL TRUE    # Test is regarded as passed if error code is non-0
#     PASS_REGULAR_EXPRESSION "regex"   # Regular expression to match stdout
#     FAIL_REGULAR_EXPRESSION "regex"   # Regular expression to match stdout



# There is an additional third argument to `add_test()`
# WORKING_DIRECTORY <dir>
# which can be used to set the working directory of the test


#
# When running `include(CTest)` it automatically runs
# `enable_testing()` unless if `BUILD_TESTING` has been set to "OFF"
# If `enable_testing()` is not called, then `add_test()` will not
# create any tests, but will still create the test executables
#
# A common workflow then is simply to have the following in your top most
# CMakeLists.txt file:
# ```
# include(CTest)
# if (BUILD_TESTING)
#     add_subdirectory(tests)
# endif()
#
# Where the `tests` directory contains the the CMakelists.txt that defines
# all of your tests
#


## Add Catch2
# include(Catch)
# add_executable(my_tests test.cpp)
# target_link_libraries(my_tests PRIVATE Catch2::Catch2WithMain)

## Register tests with CTest
## Helper function to convert each instance of `TEST_CASE` in catch2 into
## a CTest `add_test` call
# catch_discover_tests(my_tests)