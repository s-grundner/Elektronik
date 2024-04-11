// wetterstation.h
#ifndef WETTERSTATION_H
#define WETTERSTATION_H

#include <vector>
#include <algorithm>
#include <iostream>

#include "Subject.h"
#include "Observer.h"

class Wetterstation : public Subject {
    std::vector<Observer *> observers; // observers

    float temp = 0.0f;
    float humidity = 0.0f;
    float pressure = 0.0f;

public:
    void registerObserver(Observer *observer) override;
    void removeObserver(Observer *observer) override;
    void notifyObserver() override;
    void setState(float temp, float humidity, float pressure);
};
#endif // WETTERSTATION_H
