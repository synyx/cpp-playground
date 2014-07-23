#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string>
#include "modules/mymodule.h"

int main (int argc, char *argv[])
{
  printf("invoked as %s\n", argv[0]);

  MyModule* myObject = new MyModule();
  std::string myStr = myObject->foo();
  myStr += "\n";
  
  printf(myStr.c_str());  

  return 0;
}