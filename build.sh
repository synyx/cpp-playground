#!/bin/bash

# dependencies
if [ ! -d "lib/gtest-1.7.0" ]; then
	cd lib
  	curl -L https://github.com/google/googletest/archive/release-1.7.0.zip -o gtest-1.7.0.zip
  	unzip gtest-1.7.0.zip
  	rm gtest-1.7.0.zip
  	cd ..
fi

# clean
rm -r build

# build
mkdir build
cd build

cmake ../ $1
make

# run tests
make test