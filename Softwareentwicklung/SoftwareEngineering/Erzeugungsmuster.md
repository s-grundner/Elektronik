---
tags:
  - Software-Engineering/DesignPattern
aliases: 
keywords: 
subject:
  - VL
  - Softwareentwicklung 2
semester:
  - SS24
  - B2
created: 23. März 2024
professor:
---
 

# Erzeugungsmuster

## Singleton

Ein Singleton ist ein **Erzeugungsmuster**. Es wird verwendet, wenn von einer Klasse immer nur maximal ein alleiniges Objekt erzeugt werden darf.

Typische Anwendung:

- Logging
- Treiber Objekte
- Caching

 Das Muster:

- nur 1 Objekt einer Klasse ist erzeugbar
- Konstruktor ist privat (-> ist nicht aufrufbar)
- die Klasse muss sich das eigene Objekt merken - statische Variable
- zur Erzeugung des 1 Objekts wird die statische Methode `getInstance()` erstellt:  
  - `public: static Singleton& getinstance(){…}`

diese gibt eine Referenz auf das einzige Objekt zurück

Vorteile gegenüber globalen Variablen:

- es kann eine Zugriffskontrolle realisiert werden
- es kann abgeleitet werden (Spezialisierung)

Oft wird dieses Pattern vereinfacht implementiert, dabei wird das eine Objekt als Attribut gespeichert und bei der Erstellung mittels If überprüft. Da dieser Vorgang kein einzelner Schritt ist, kann er im Fall von Multi-Threading zur Erstellung eines zweiten Objekts führen (Nicht-Thread-Sicher).

Allgemeine Lösung: die Funktion `getInstance` muss Thread-Sicher ausgeführt werden.

c++ Beispiel:

```cpp
class Singleton {
public:
	static Singleton& getInstance(){
		static Singleton instance;         // static: once Initialized -> kept
		return instance;
	}
private:
	Singleton() {}                         // Prohibition of "Singleton s;"
	Singleton(const Singleton&) {}         // Prohibition of Singleton s2(s1);
	Singleton& operator=(const Singleton&) { return *this; } // a copy by assign-operator
	~Singleton() {}
};

int main() {
	Singleton &s1= Singleton::getInstance();
	Singleton &s2= Singleton::getInstance();
    //Singleton s3= Singleton::getInstance(); 

    std::cout << "Adresse s1: " << &s1 << std::endl;
    std::cout << "Adresse s2: " << &s2 << std::endl;
	
    return 0;
}
```

s1 und s2 sind Referenzen auf ein und das gleiche Objekt. s3 löst einen Compiler-Fehler aus - damit würde s3 eine Kopie des Objekts sein.

In C++ ist Vorsicht geboten: es gibt in C++ standardmäßig einen Copy-Konstruktor. Wird der Standard-Konstruktor *private* gemacht, dann gibt es noch immer den Copy-Konstruktor. Dieser wird so verwendet:

```cpp
MyClass obj1;
MyClass obj2(obj1);		// Erzeugt eine Kopie des Objekts obj1
```

Daher ist (wie in obigem Beispiel) auch der Copy-Konstruktor `Singleton(const Singleton&)` auf *private* zu überschreiben (und damit zu blockieren).

## Factory

Ein *Factory-Pattern* (Fabriksmuster) gehört ebenfalls zu Gruppe der **Erzeugungsmuster**. Häufig wird ein Factory-Pattern als *abstrakte Fabrik* bezeichnet um den Unterschied zu einer Fabrikmethode (siehe Unten) deutlich zu machen. Dieses Pattern kann eingesetzt werden, wenn eine aufrufende Klasse nicht weiß, welche konkreten Klassen und wie diese Klassen zu instanziieren sind. Auch um diese Instanziierung aus Stil-Gründen zu verstecken.

- Mit diesem Pattern können die konkreten Implementierungen voneinander entkoppelt werden.
- Code modularer - die aufrufende Klasse muss den Typen der zu erzeugenden Klasse nicht kennen.
- Dadurch wird der Code wieder verwendbarer.

Aufbau:

- Ein Fabrik-Interface (Erzeuger) wird von einem Klienten (verwendendes Programm) eingebunden
- Eine konkrete Fabrik erzeugt konkrete Produkte durch die Implementierung mittels der abstrakten Schnittstellen. Die Klassen der konkreten Produkte sind die einzigen Stellen an denen die konkreten Produkt-Klassen eingebaut werden (Vorteil).
- Das konkrete Produkt implementiert das abstrakte Produkt-Interface, welches der Klienten aufruft
- Ein Klient fordert mittels der Schnittstellen der abstrakten Fabrik ein Produkt an.

Beispiel:

```
Auto *meins = new Bmw();
```

- Auto soll verwendet werden um flexibel zu bleiben
- auf der rechten Seite müsse wir ganz konkret ein Produkt angeben, wenn der Typ hier unterschiedlich sein kann, dann muss eine vielfache Verzweigung eingebaut werden. Gelöst werden kann diese starre Verbindung mittels Factory.

 ![invert_dark](UML_Pattern_Factory.png) 

Die hier dargestellte Factory ist eine vereinfachte Form für eine einzelne Fabrik. Erweitert wird dieses Pattern indem unterschiedliche Fabriken die gleichen Produktlinien erzeugen.

### Factory-Methode

Von einer Klasse ist kein Konstruktor verfügbar. Das Erstellen von Objekten der Klasse wird durch den Aufruf einer statischen *createNewInstance()*-Methode ermöglicht.

```
SomeObject o = SomeObjectFactory.createNewInstance();
```
