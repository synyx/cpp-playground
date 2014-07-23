add_library(MyModule mymodule.cpp)

install (TARGETS MyModule DESTINATION bin)
install (FILES MyModule.h DESTINATION include)