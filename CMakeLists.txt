cmake_minimum_required (VERSION 2.6)
project (cpp-playground)

# project sources
add_library(MyModule src/modules/mymodule.cpp)
add_library(MyMultiplier src/modules/mymultiplier.cpp)
add_library(MyCalculator src/modules/mycalculator.cpp)

target_link_libraries (MyCalculator MyMultiplier)

add_executable(cpp-playground src/programm.cpp)
target_link_libraries (cpp-playground MyModule)
target_link_libraries (cpp-playground MyCalculator)

# dependencies
add_subdirectory (lib/googletest-release-1.7.0) 
include_directories ("${PROJECT_SOURCE_DIR}/lib/googletest-release-1.7.0/include")

# test sources
add_executable(MyModuleTest test/modules/mymodule-test.cpp)
target_link_libraries (MyModuleTest MyModule)
target_link_libraries (MyModuleTest gtest pthread)

add_executable(MyCalculatorTest test/modules/mycalculator-test.cpp)
target_link_libraries (MyCalculatorTest MyCalculator)
target_link_libraries (MyCalculatorTest gtest pthread)

# ctest
enable_testing ()

add_test(MyModuleTest MyModuleTest)
add_test(MyCalculatorTest MyCalculatorTest)

# code coverage
find_program(LCOV_PATH lcov)

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/CMakeModules)
if(CMAKE_COMPILER_IS_GNUCXX AND (NOT (${LCOV_PATH} STREQUAL "LCOV_PATH-NOTFOUND")))
    SET(CMAKE_CXX_FLAGS "-g -O0 --coverage")

    include(CodeCoverageAggregate)
    coverage_add_exec(MyModuleTest)
    coverage_add_exec(MyCalculatorTest)
endif()

# old cobertura code coverage, TODO: fix or remove
find_program(GCOVR gcovr)

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/CMakeModules)
if(CMAKE_COMPILER_IS_GNUCXX AND (NOT (${GCOVR} STREQUAL "GCOVR-NOTFOUND")))
    include(CodeCoverage)
    SET(CMAKE_CXX_FLAGS "-g -O0 -fprofile-arcs -ftest-coverage")
    SET(CMAKE_C_FLAGS "-g -O0 -fprofile-arcs -ftest-coverage")

    setup_target_for_coverage_cobertura(MyModuleTest_coverage MyModuleTest ../coverage-reports/coverage-MyModule)
    setup_target_for_coverage_cobertura(MyCalculatorTest_coverage MyCalculatorTest ../coverage-reports/coverage-MyCalculator)
endif()

