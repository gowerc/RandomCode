
cmake_minimum_required(VERSION 3.25)
project(ExternalProj)

set(CMAKE_CXX_STANDARD 17)          # Set Cpp version to be used

include(ExternalProject)

# Download and compile library setting MANUAL_TZ_DB=ON
# so we can provide our own tzdata library
ExternalProject_Add(
    date_external
    GIT_REPOSITORY https://github.com/HowardHinnant/date
    GIT_TAG v3.0.3
    PREFIX ${CMAKE_BINARY_DIR}/date
    INSTALL_COMMAND ""
    CMAKE_ARGS
        -DMANUAL_TZ_DB=ON
        -DBUILD_TZ_LIB=ON
)

# Extract out the location of the source and build directories
# of the external project/library
ExternalProject_Get_Property(date_external BINARY_DIR SOURCE_DIR)
set(DATE_SOURCE_DIR "${SOURCE_DIR}/include")
set(DATE_BINARY_DIR "${BINARY_DIR}")

# Define an imported static library target and add dependency
# to the external project (so that its built afterwards)
add_library(date STATIC IMPORTED)
add_dependencies(date date_external)

# Ensure that the directories exist at configure time so
# that `set_target_properties()` doesn't error
file(MAKE_DIRECTORY ${DATE_SOURCE_DIR})
file(MAKE_DIRECTORY ${DATE_BINARY_DIR})

# Add the library file and header directories to our imported target
set_target_properties(date PROPERTIES
    IMPORTED_LOCATION ${DATE_BINARY_DIR}/libdate-tz.a
    INTERFACE_INCLUDE_DIRECTORIES ${DATE_SOURCE_DIR}
)

# Add in additional dependency that the date library is dependent on
find_package(CURL REQUIRED)
target_link_libraries(date INTERFACE CURL::libcurl)

add_executable(main main.cpp)
target_link_libraries(main date)
