#include "../../src/modules/mycalculator.h"
#include <gtest/gtest.h>

TEST (addTest, AddsNumbers) { 
    MyCalculator* myObject = new MyCalculator();
    double result = myObject->add(42, 1337);

    EXPECT_EQ (1379, result);
}

int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}