playground project to test out cpp build tool chain

requirements: 
* development essentials
* cmake
* gtest
	* download from https://code.google.com/p/googletest/downloads/list and extract to lib/ subfolder

to build project:

```
$ mkdir build
$ cd build
$ cmake ../src
```

now build with

`$ make`

and run tests with

`$ make test`

each module test is executable itself, providing a lot more output:

`$ MyModuleTest`
