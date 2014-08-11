#include "../../src/modules/mycalculator.h"
#include "../../src/modules/mymultiplier.h"
#include <gtest/gtest.h>

double MyMultiplier::multiply(double a, double b) {
    return 42.0;
}

TEST (addTest, AddsNumbers) { 
    MyMultiplier* myMultiplier = new MyMultiplier();
    MyCalculator* myObject = new MyCalculator(myMultiplier);

    double result = myObject->add(42, 1337);

    EXPECT_EQ (1379, result);
}

TEST (multiplyTest, MultipliesNumbers) { 
    MyMultiplier* myMultiplier = new MyMultiplier();
    MyCalculator* myObject = new MyCalculator(myMultiplier);

    double result = myObject->multiply(3.14, 42);

    ASSERT_DOUBLE_EQ (42.0, result);
}

int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}