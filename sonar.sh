#!/bin/bash

#cpp check
rm -rf cppcheck-reports
mkdir cppcheck-reports
cppcheck -v --enable=all --xml-version=2 -I src/modules src/programm.cpp src/modules/mycalculator.cpp src/modules/mymodule.cpp 2> cppcheck-reports/cppcheck-result-all.xml

#sonar runner
sonar-runner -X
