
# Configure makefile (only re-run if CMakeLists changes)
cmake \
    -D CMAKE_VERBOSE_MAKEFILE:BOOL=ON \
    -D CMAKE_INSTALL_PREFIX=$HOME/.local \
    -D USE_MYLIB=ON \
    -S . \
    -B build

# Build exe
cmake --build build

# Run exe
./build/myexe

# Install exe
cmake --install build
myexe
