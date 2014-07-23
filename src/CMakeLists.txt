include_directories ("${PROJECT_SOURCE_DIR}/modules")
add_subdirectory (modules) 

add_executable(cpp-playground programm.cpp)
target_link_libraries (cpp-playground MyModule)