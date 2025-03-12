
cmake_minimum_required(VERSION 3.25)
project(options)

# Will either be blank or the cache value as not yet defined
message( "OPT_A = ${OPT_A}" )


# # options can only be bool's (on/off or true/false)
# # Will set value + cache if no existing cache value exists
# # else will just defer to the cache value
# 
# message( "OPT_A = ${OPT_A}" )

# # Force sets the local variable (does not update the cache)
set(OPT_A "yes")
message( "OPT_A = ${OPT_A}" )


option(OPT_A "something opt_a" ON)
message( "OPT_A = ${OPT_A}" )

# # This is essentially equivalent to option (only difference is that option defaults
# # to off and  set supports non-bool types). Otherwise all behaviour is the same
# # e.g. only sets value if cache is blank
# set(OPT_A ON CACHE BOOL "Global variable")
# message( "OPT_A = ${OPT_A}" )


# # Force updates the cache to contain the specified value
set(OPT_A OFF CACHE BOOL "Global variable" FORCE)
message( "OPT_A = ${OPT_A}" )

#
# Cache = globally access variable scope that is preserved between runs
#         of cmake configuration  e.g.  cmake -S . -B build
#


