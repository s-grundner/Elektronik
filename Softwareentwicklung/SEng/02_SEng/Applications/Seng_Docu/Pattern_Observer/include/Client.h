/**
* @file Client.h
* @brief Kurze Beschreibung der Client.h-Datei
*
* Ausfuehrliche Beschreibung der Client.h-Datei. Hier
* werden die Details der Datei erklaert, was darin alles
* zu finden ist. Die Funktionen/Klassen werden ueblicherweise
* separat dokumentiert. Sollen diese nicht separat dokumentiert
* werden, dann koennen die etwa auf diese Art dokumentiert werden.
**/

#ifndef CLIENT_H
#define CLIENT_H


#include <iostream>

#include "Observer.h"

/** 
* @class Client 
* 
* @brief Client ist eine konkrete Observer-Klasse.
* 
* Client ist ein konkreter Observer, darin werden die abstrakten Funktionen
* der Observer-Klasse implementiert. Durch das Observer-Interface kann ein 
* zu beobachtendes Subject den Observer in eine Liste aufnehmen (wenn erase
* sich registriert).
*/
class Client : public Observer {

    int id;

public:
	/** 
	* @function Client 
	* 
	* @brief Konstruktor des Client.
	* @param id Id welche der Client erhaelt.
	* Im Konstruktor wird eine Id gesetzt um die Klienten unterscheiden zu
	* koennen.
	*/
    Client(int id);
	/** 
	* @function update 
	* 
	* @brief Setzten der Temperatur, Feuchte und Druck.
	* @param temp Temperatur in degC
	* @param humidity Feuchte in g/m^3
	* @param perssure Druck in bar
	*
	* Mit dieser Funktion kann das zu beobachtende Subject die Aenderung an
	* den Observer uebertragen.
	*/
    virtual void update(float temp, float humidity, float pressure) override;

};


#endif // CLIENT_H
