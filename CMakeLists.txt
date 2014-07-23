cmake_minimum_required (VERSION 2.6)
project (cpp-playground)

# project sources
include_directories ("${PROJECT_SOURCE_DIR}/src")
add_subdirectory (src) 

# test sources
include_directories ("${PROJECT_SOURCE_DIR}/test")
add_subdirectory (test) 

# ctest
enable_testing ()

add_test(MyModuleTest test/modules/MyModuleTest)