#ifndef CALCULATOR_H
#define CALCULATOR_H

class Calculator
{
public:
    Calculator();
    int getA();
    int getB();
    int sum();
    int sum(int a, int b);
private:
    int a;
    int b;
};


#endif // CALCULATOR_H
