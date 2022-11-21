#include <iostream>
#include "Wetterstation.h"
#include "Client.h"

int main() {
    Wetterstation ws;
    Client one(1), two(2), three(3);

    float temp, humidity, pressure;

    ws.registerObserver(&one);
    ws.registerObserver(&two);
    ws.registerObserver(&three);

    std::cout << "Enter Temperature, Humidity, Pressure (seperated by spaces) << ";
    std::cin >> temp >> humidity >> pressure;

    ws.setState(temp,humidity,pressure);

    ws.removeObserver(&two);

    std::cout << "\n\nEnter Temperature, Humidity, Pressure (seperated by spaces) << ";
    std::cin >> temp >> humidity >> pressure;

    ws.setState(temp,humidity,pressure);

    return 0;
}