#!/bin/bash

# dependencies
if [ ! -d "lib/googletest-release-1.7.0" ]; then
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

# run tests with code coverage
make cpp-playground_coverage

# if code coverage report generation fails, run tests the old-fashioned way
if [ $? == 2 ]; then
	make test
fi