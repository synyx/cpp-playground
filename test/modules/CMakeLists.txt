add_executable(MyModuleTest mymodule-test.cpp)
target_link_libraries (MyModuleTest MyModule)
target_link_libraries (MyModuleTest libgtest.a pthread)