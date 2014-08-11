#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string>
#include "modules/mymodule.h"
#include "modules/mymultiplier.h"
#include "modules/mycalculator.h"

int main (int argc, char *argv[])
{
  printf("invoked as %s\n", argv[0]);

  MyModule* myObject = new MyModule();
  std::string myStr = myObject->foo();
  myStr += "\n";
  
  printf(myStr.c_str());

  MyMultiplier* myMultiplier = new MyMultiplier();
  MyCalculator* myCalculator = new MyCalculator(myMultiplier);
  
  printf("%f\n", myCalculator->multiply(3.14, 42));

  return 0;
}