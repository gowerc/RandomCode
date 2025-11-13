
#
# Example of building and calling a shared library directly from R
# Without using the library interface
#
# Note that you first need to build the .so via:
#    R CMD SHLIB misc/standalone_ex.c
#

dyn.load("./misc/standalone/example1.so")



library.dynam()
getLoadedDLLs()


.Call("add_numbers_call", 2, 2)


dyn.load()


