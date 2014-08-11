cmake_minimum_required (VERSION 2.6)
project (cpp-playground)

# project sources
add_library(MyModule src/modules/mymodule.cpp)
add_library(MyCalculator src/modules/mycalculator.cpp)

install (TARGETS MyModule DESTINATION bin)
install (FILES MyModule.h DESTINATION include)

install (TARGETS MyCalculator DESTINATION bin)
install (FILES MyCalculator.h DESTINATION include)

add_executable(cpp-playground src/programm.cpp)
target_link_libraries (cpp-playground MyModule)

# dependencies
add_subdirectory (lib/gtest-1.7.0) 
include_directories ("${PROJECT_SOURCE_DIR}/lib/gtest-1.7.0/include")

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