playground project to test out cpp build tool chain

[![Build Status](https://travis-ci.org/synyx/cpp-playground.svg?branch=master)](https://travis-ci.org/synyx/cpp-playground)

requirements: 
* development essentials
* cmake

optional:
* cppcheck && sonar-runner for sonar reports
* valgrind for memory leak analysis

to build project:

`$ ./build.sh`

each module test is executable itself, providing a lot more output:

`$ build/MyModuleTest`

to run sonar analysis:

`$ ./sonar.sh`

this requires...
* cppchecker & sonar-runner need to be on the PATH
* a sonarqube instance is expected to run at localhost:9000

to run a valgrind analysis for memory leaks, you need to build with debug symbols:

`$ ./build.sh -DCMAKE_BUILD_TYPE=Debug`

then run 

`$ valgrind --leak-check=full --show-leak-kinds=all build/cpp-playground`

this requires valgrind to be installed, of course

==========

cpp-playground is released under the MIT License. See the bundled LICENSE file for details
