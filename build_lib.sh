#!/bin/bash

if [[ "$(uname)" == "Darwin" ]]; then
    echo "Running on macOS"

    cmake -GNinja -B build/debug/tracy -DCMAKE_INSTALL_PREFIX=./lib/debug/tracy -DTRACY_STATIC=ON -DCMAKE_BUILD_TYPE=Debug ext/tracy
    cmake --build build/debug/tracy --config Debug
    cmake --install build/debug/tracy --config Debug

    cmake -GNinja -B build/release/tracy -DCMAKE_INSTALL_PREFIX=./lib/release/tracy -DTRACY_STATIC=ON -DCMAKE_BUILD_TYPE=Release ext/tracy
    cmake --build build/release/tracy --config Release
    cmake --install build/release/tracy --config Release

    cmake -GNinja -B build/debug/profiler -DCMAKE_INSTALL_PREFIX=./lib/debug/profiler -DCMAKE_BUILD_TYPE=Debug ext/tracy/profiler
    cmake --build build/debug/profiler --config Debug
    cmake --install build/debug/profiler --config Debug


    cmake -GNinja -B build/release/profiler -DCMAKE_INSTALL_PREFIX=./lib/release/profiler -DCMAKE_BUILD_TYPE=Release ext/tracy/profiler
    cmake --build build/release/profiler --config release
    cmake --install build/release/profiler --config release

else
   echo "Not Running on macOS"
 
fi



	
