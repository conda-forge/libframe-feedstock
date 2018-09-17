#!/bin/bash

# copy CMakeLists.txt from the recipe into the src
cp ${RECIPE_DIR}/CMakeLists.txt .

mkdir -p build
pushd build

cmake .. \
	-DCMAKE_INSTALL_PREFIX=${PREFIX} \
	-DCMAKE_INSTALL_LIBDIR="lib"
cmake --build . --config Release -- -j${CPU_COUNT}
ctest -V
cmake --build . --config Release --target install
