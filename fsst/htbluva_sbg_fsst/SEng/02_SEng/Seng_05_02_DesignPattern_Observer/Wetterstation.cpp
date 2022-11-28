// wetterstation.cpp
#include "Wetterstation.h"

void Wetterstation::registerObserver(Observer *observer) {
    observers.push_back(observer);
}

void Wetterstation::removeObserver(Observer *observer) {
    // find the observer
    auto it = std::find(observers.begin(), observers.end(), observer);

    if (it != observers.end()) { // observer found
        observers.erase(it); // remove the observer
    }
}

void Wetterstation::notifyObserver() {
    for (Observer *observer : observers) { // notify all observers
        observer->update(temp, humidity, pressure);
    }
}

void Wetterstation::setState(float temp, float humidity, float pressure) {
    this->temp = temp;
    this->humidity = humidity;
    this->pressure = pressure;
    std::cout << std::endl;
    notifyObserver();
}
