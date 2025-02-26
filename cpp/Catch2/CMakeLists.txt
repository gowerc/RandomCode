
cmake_minimum_required(VERSION 3.10)

project(testing_catch2)

set(CMAKE_CXX_STANDARD 17)           # Use C++17
set(CMAKE_CXX_STANDARD_REQUIRED ON)  # Enforce the standard
set(CMAKE_CXX_EXTENSIONS OFF)        # Disable compiler-specific extensions


include(CTest)
include(FetchContent)


add_library(math src/math.cpp)
target_include_directories(math PUBLIC include)

add_library(math2 src/math2.cpp)
target_include_directories(math2 PUBLIC include)


if(BUILD_TESTING)
    add_subdirectory(tests)
endif()

