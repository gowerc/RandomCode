
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

# There is an additional third argument
# WORKING_DIRECTORY <dir>
# which can be used to set the working directory of the test




## Add Catch2
# include(Catch)
# add_executable(my_tests test.cpp)
# target_link_libraries(my_tests PRIVATE Catch2::Catch2WithMain)

## Register tests with CTest
## Helper function to convert each instance of `TEST_CASE` in catch2 into
## a CTest `add_test` call
# catch_discover_tests(my_tests)