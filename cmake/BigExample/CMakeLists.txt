
# 3.13 needed for `target_link_directories()`
cmake_minimum_required(VERSION 3.13)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Define project + metadata
project(
    MyProject
    VERSION 1.0.3
    DESCRIPTION "My Awesome Project"
    LANGUAGES CXX
)

# Define target executible and the source file to generate it
add_executable(myexe src/main.cpp)


# Setup optional library "mylib" from nested directory
option(USE_MYLIB "Use my library>" ON)
if(USE_MYLIB)
    # Import the CmakeLists.txt file from the library directory
    add_subdirectory(external/mylib) 
    # Add the library target (defined in the subdirectory) to our exe
    # This automatically adds any PUBLIC include & link directories
    target_link_libraries(myexe PUBLIC mymath)
endif()

# Render dynamic configuration file
configure_file(include/version.h.in  include/version.h)


# gcc -I <dirs>
# To include rendered config file
target_include_directories(myexe PUBLIC ${PROJECT_BINARY_DIR}/include)


install(
	TARGETS myexe
	DESTINATION bin  # ${CMAKE_INSTALL_PREFIX}/bin
)


###################
#
# find_package
#    - this doesn't do anything in this example but just shows how
#      these functions work
#

# First example is based on the FindGit.cmake file which comes built into cmake itself
find_package(Git)
if (GIT_FOUND)
    message("NOTE: Found Git: ${GIT_EXECUTABLE} v${GIT_VERSION_STRING}")
endif()

# Second example is based on using a "FindASDF.cmake" module fine that we defined
# ourselves locally
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/")
find_package(ASDF MODULE)
if (ASDF_FOUND)
    message("NOTE: Found ASDF")
endif()


###################
#
# Conditional logic
#    - this doesn't do anything in this example but just shows how
#      these functions work
#

set(MYVAL 0)
while(MYVAL LESS 5)
	message(STATUS "MYVAL = ${MYVAL}")
	math(EXPR MYVAL "${MYVAL} + 1")
endwhile()

foreach(item IN ITEMS foo bar baz qux)
	message(STATUS "Item is: ${item}")
endforeach()

foreach(idx RANGE 5)
	message(STATUS "idx is: ${idx}")
endforeach()

