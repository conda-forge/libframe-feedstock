#!/bin/bash

find . -name CMakeLists.txt

mkdir -p build
pushd build

cmake .. \
	-DCMAKE_INSTALL_PREFIX=${PREFIX} \
	-DCMAKE_INSTALL_LIBDIR="lib"
cmake --build . --config Release -- -j${CPU_COUNT}
ctest -V
cmake --build . --config Release --target install
