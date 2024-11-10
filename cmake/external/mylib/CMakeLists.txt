
cmake_minimum_required(VERSION 3.13)
project(mymath)
add_library(mymath src/adder.cpp)
target_include_directories(mymath PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")

# set_target_properties(mymath PROPERTIES PUBLIC_HEADER include/adder.hpp)
# install(
# 	TARGETS mymath
# 	LIBRARY DESTINATION lib            # Where to install the .a
# 	PUBLIC_HEADER DESTINATION include  # Where to install the .h
# )

