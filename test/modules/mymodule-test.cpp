#include "../../src/modules/mymodule.h"
#include "gtest/gtest.h"

TEST (fooTest, SaysHelloWorld) { 
	MyModule* myObject = new MyModule();
  	std::string myStr = myObject->foo();

    EXPECT_EQ ("hello world", myStr);
}

int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}