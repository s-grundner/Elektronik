/**
* @file Wetterstation.h
* @brief die kurze
*
* die lange
**/

#ifndef WETTERSTATION_H
#define WETTERSTATION_H

#include <vector>
#include <algorithm>
#include <iostream>

#include "Subject.h"
#include "Observer.h"

/** 
* @class Wetterstation 
* 
* @brief Wetterstation ist ein konkretes Subjekt. Die Wetterstation misst
*        die Temperatur, Luftfeuchtigkeit und Luftdruck. Sie implementiert
*		 das Subject-Interface und implementiert daher die abstrakten Funktionen
*		 registerObserver, removeObserver und notifyObserver.
*		 Mittels setState-Funktion koennen die Werte veraendert werden.
* 
* Eine detailliertere Beschreibung der Klasse 
*/
class Wetterstation : public Subject {
    std::vector<Observer *> observers; // observers

    float temp = 0.0f;
    float humidity = 0.0f;
    float pressure = 0.0f;

public:

    void registerObserver(Observer *observer) override;

/** 
* @function removeObserver 
* 
* @brief Funktion zum Entfernen eines Beobachters aus der 
*        Beobachterliste.
* @param observer Beobachter der entfernt werden soll
* @return void
* Eine detailliertere Beschreibung der Klasse 
*/
    void removeObserver(Observer *observer) override;

    void notifyObserver() override;

    /**
     * Set the new state of the weather station
     * @param temp new temperature
     * @param humidity new humidity
     * @param pressure new pressure
     */
    void setState(float temp, float humidity, float pressure);

};

#endif // WETTERSTATION_H
