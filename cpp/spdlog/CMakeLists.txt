
cmake_minimum_required(VERSION 3.13)

project(MyProj)


set(CMAKE_CXX_STANDARD 17)  # Use C++17
set(CMAKE_CXX_STANDARD_REQUIRED ON)  # Ensure the compiler supports this version
set(CMAKE_CXX_EXTENSIONS OFF)  # Use standard C++ (not GNU extensions)

add_executable(main main.cpp)

# Enable the CMake module to enable fetchcontent functionality
include(FetchContent)



FetchContent_Declare(
    spdlog
    GIT_REPOSITORY https://github.com/gabime/spdlog
    GIT_TAG v1.15.1
)
FetchContent_MakeAvailable(spdlog)
target_link_libraries(main spdlog)


### spdlog is dependent on fmt but comes with it pre-bundled
### so this block of code isn't needed
# FetchContent_Declare(
#     fmt
#     GIT_REPOSITORY https://github.com/fmtlib/fmt
#     GIT_TAG 11.1.3
# )
# FetchContent_MakeAvailable(fmt)
# target_link_libraries(main fmt)









