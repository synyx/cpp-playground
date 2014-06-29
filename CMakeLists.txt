cmake_minimum_required (VERSION 2.6)
project (cpp-playground)

include_directories ("${PROJECT_SOURCE_DIR}/modules")
add_subdirectory (modules) 

add_executable(cpp-playground programm.cpp)
target_link_libraries (cpp-playground MyModule)

# run some tests
enable_testing ()

add_test (PrintsHelloWorld cpp-playground)
set_tests_properties (PrintsHelloWorld
  PROPERTIES PASS_REGULAR_EXPRESSION "hello world")