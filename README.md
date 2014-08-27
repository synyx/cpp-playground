playground project to test out cpp build tool chain

[![Build Status](https://travis-ci.org/wicked539/cpp-playground.svg?branch=master)](https://travis-ci.org/wicked539/cpp-playground)

requirements: 
* development essentials
* cmake

optional:
* cppcheck && sonar-runner for sonar reports

to build project:

```
$ ./build.sh
```

each module test is executable itself, providing a lot more output:

`$ build/MyModuleTest`

to run sonar analysis:

```
$ ./sonar.sh
```

this requires...
* cppchecker & sonar-runner need to be on the PATH
* a sonarqube instance is expected to run at localhost:9000