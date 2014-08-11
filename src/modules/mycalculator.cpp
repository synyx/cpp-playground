#include "mycalculator.h"
#include "mymultiplier.h"

MyCalculator::MyCalculator(MyMultiplier* myMultiplier) {
    this->myMultiplier = myMultiplier;
}

double MyCalculator::add(double a, double b) {
    return a + b;
}

double MyCalculator::substract(double a, double b) {
    return a - b;
}

double MyCalculator::multiply(double a, double b) {
    return this->myMultiplier->multiply(a, b);
}


