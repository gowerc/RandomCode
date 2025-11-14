
##############
#
# showing the use of LD_LIBRARY_PATH and LIBRARY_PATH
# in the linker and loader
#
#
# In short
#    LIBRARY_PATH = 1st order deps in linker
#    LD_LIBRARY_PATH = >=2nd order deps in linker
#    LD_LIBRARY_PATH = all order deps in loader

unset LIBRARY_PATH LD_LIBRARY_PATH
export LIBRARY_PATH=./foo:./bar
g++ -fPIC -shared -o ./foo/libfoo.so foo/foo.cpp
g++ -fPIC -shared -o ./bar/libbar.so bar/bar.cpp
g++ -fPIC -shared \
    -I ./foo \
    -I ./bar \
    -l foo \
    -l bar \
    -o ./foobar/libfoobar.so \
    foobar/foobar.cpp


unset LIBRARY_PATH LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./foo:./bar
export LIBRARY_PATH=./foobar
g++ \
    -o bin/main_foobar \
    -l foobar \
    -I ./foobar \
    main_foobar.cpp


# Errors as won't search LIBRARY_PATH for 2nd order deps
unset LIBRARY_PATH LD_LIBRARY_PATH
export LIBRARY_PATH=./foobar:./foo:./bar
g++ \
    -o bin/main_foobar \
    -l foobar \
    -I ./foobar \
    main_foobar.cpp


unset LIBRARY_PATH LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./foobar:./foo:./bar
./bin/main_foobar




##############
#
# Experimenting with RPATH / RUNPATH
#
#

# Showing that library search path order is
#    LD_PRELOAD
#    RPATH
#    LD_LIBRARY_PATH
#    RUNPATH
# note that RPATH is deprecatiated and that 
# `-rpath` will set RUNPATH by default, need
# to use
#     -Wl,--disable-new-dtags
# to set RPATH instead of RUNPATH

g++ -shared -o ./liba/libmylib.so liba/mylib.cpp
g++ -shared -o ./libb/libmylib.so libb/mylib.cpp
g++ -shared -o ./libc/libmylib.so libc/mylib.cpp


g++  \
    main.cpp \
    -o ./bin/main \
    -L ./liba/ \
    -l mylib \
    -I ./liba/ \
    -Wl,-rpath,./liba


unset LD_PRELOAD
unset LD_LIBRARY_PATH
./bin/main   # A
export LD_LIBRARY_PATH=./libc/
./bin/main   # C
export LD_PRELOAD=./libb/libmylib.so
./bin/main   # B
unset LD_PRELOAD
unset LD_LIBRARY_PATH


ldd ./bin/main
readelf -d ./bin/main 





##############
#
# Experimenting with rpath-link
#
#


g++ -fPIC -shared -o ./foo/libfoo.so foo/foo.cpp
g++ -fPIC -shared -o ./bar/libbar.so bar/bar.cpp
g++ -fPIC \
    -shared \
    -I ./foo \
    -I ./bar \
    -L ./foo \
    -L ./bar \
    -l foo \
    -l bar \
    -o ./foobar/libfoobar.so \
    -Wl,-rpath,./bar:./foo \
    foobar/foobar.cpp


export LD_LIBRARY_PATH=./foobar:./foo:./bar
export LIBRARY_PATH=./foobar:./foo:./bar
unset LD_LIBRARY_PATH
unset LIBRARY_PATH


g++ \
    -o bin/main_foobar \
    -l foobar \
    -I ./foobar \
    -L ./foobar \
    -Wl,-rpath,./foobar \
    main_foobar.cpp


./bin/main_foobar


ldd ./bin/main_foobar
readelf -d ./bin/main_foobar
objdump -T ./bin/main_foobar
nm -D ./bin/main_foobar | grep " U "

ldd ./foobar/libfoobar.so
readelf -d ./foobar/libfoobar.so
objdump -T ./foobar/libfoobar.so


