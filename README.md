### Demo project to showcase C++ build tool chain

It contains of a very simple Application (Three classes and a main method), demonstrating:

* Cross-plattform Makefile generation using CMake
* Module unit testing using GTest
* CI with travis-ci
* Unit test code coverage reports with lcov
* Static code analysis with Sonarqube
* Memory leak analysis with valgrind

[![Build Status](https://travis-ci.org/synyx/cpp-playground.svg?branch=master)](https://travis-ci.org/synyx/cpp-playground)

#### Requirements
* Development Essentials (build-essential)
* CMake

##### Optional
* lcov for HTML code coverage reports
* cppcheck && sonar-runner for Sonar reports
* valgrind for memory leak analysis

#### Build

To build project:

`$ ./build.sh`

Each module test is executable itself, providing a lot more output:

`$ build/MyModuleTest`

#### Sonar

To run sonar analysis:

`$ ./sonar.sh`

This requires...
* cppchecker & sonar-runner need to be on the PATH
* A Sonarqube instance is expected to run at localhost:9000

#### Valgrind

To run a valgrind analysis for memory leaks, you need to build with debug symbols:

`$ ./build.sh -DCMAKE_BUILD_TYPE=Debug`

Then run 

`$ valgrind --leak-check=full --show-leak-kinds=all build/cpp-playground`

This requires valgrind to be installed, of course

==========

cpp-playground is released under the MIT License. See the bundled LICENSE file for details
