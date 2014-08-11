#include "mymultiplier.h"

class MyCalculator
{
private:
    MyMultiplier* myMultiplier;
    
public:
    MyCalculator(MyMultiplier* myMultiplier);
    double add(double a, double b);
    double substract(double a, double b);
    double multiply(double a, double b);
};