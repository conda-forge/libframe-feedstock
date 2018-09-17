:: use local build folder
mkdir build
cd build

:: configure
cmake .. ^
	-G "%CMAKE_GENERATOR%" ^
	-DCMAKE_BUILD_TYPE:STRING=Release ^
	-DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
	-DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%"\bin
if errorlevel 1 exit 1

:: build
cmake --build . --config Release
if errorlevel 1 exit 1

:: install
cmake --build . --config Release --target install
if errorlevel 1 exit 1