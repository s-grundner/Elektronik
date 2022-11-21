# 5 Entwurfsmuster - Übungen

## Logger - Singleton (c++157)

Erstellen Sie mit Hilfe eines Singletons eine Möglichkeit in ein Log-File zu Protokollieren. Die Idee ist, dass auf ein Log von jeder Stelle im Programm aus zugegriffen werden kann und zwar:

- ohne sich kümmern zu müssen ob die Datei schon offen ist oder nicht
- ohne die Datei in jede Funktion/Klasse mit übergeben zu müssen

main.cpp:

```c++
int main() {
	Singleton &s1= Singleton::getInstance();
	Singleton &s2= Singleton::getInstance();

    s1.log("S1> Hi from s1 :-)");
    s2.log("S2> Hi s1");
    Singleton::getInstance().log("> Ich mag auch mal");
    return 0;
}
```

liefert in der Log-Datei:

```
Opening File ...
S1> Hi from s1 :-)
S2> Hi s1
> Ich mag auch mal
... Closing File
```

Sehen Sie sich Singleton an in:
https://de.wikibooks.org/wiki/C%2B%2B-Programmierung:_Entwurfsmuster:_Singleton

## Formen - Factory (c++158)

Eine einfache Form-Factory hat die folgende Struktur:

![Pattern_Factory_Formen](bilder/Pattern_Factory_Formen.png)

Dabei ist die Fabrik nicht weiter abstrahiert sondern eine konkrete Klasse. Verwendet wird die Fabrik auf diese Art:

```c++
#include <list>
#include "FormFactory.h"

int main() {
  FormFactory ff;
  std::list<Form*> myList;	// ganz wichtig *: Form ist ein Interface

  myList.push_back(ff.baueForm("Kreis"));
  myList.push_back(ff.baueForm("Rechteck"));
  myList.push_back(ff.baueForm("Dreieck"));
  myList.push_back(ff.baueForm("Rechteck"));

  for(auto it=myList.begin(); it != myList.end(); it++)
    (*it)->draw();

  return 0;
}
```

womit generiert wird:

```
Hallo aus der      Kreis::draw()         Methode.
Hallo aus der      Rechteck::draw()      Methode.
Hallo aus der      Dreieck::draw()       Methode.
Hallo aus der      Rechteck::draw()      Methode.
```

In der obigen `main` ist ersichtlich: die Klassen Rechteck, Kreis und Dreieck können gänzlich unbekannt sein. Wenn eine weitere Form eingebaut wird bleibt das Hauptprogramm (der Klient) damit unverändert.

Aufgabe: Erstellen Sie die notwendigen Klassen.

## Restaurant - Factory (c++154)

Im folgenden Beispiel wird auch die Factory abstrahiert. Der Übersicht wegen wird hier alles in einer Datei dargestellt.

main.cpp:

```c++
#include <iostream>
#include <string>
#include <memory>

// Abstraktes Produkt
class ProductMahlzeit {
};

// konkretes Produkt - Pizza
class ProductPizza : public ProductMahlzeit {
public:
    ProductPizza() {
        std::cout << "Pizza gebacken." << std::endl;
    }
};

// konkretes Produkt - Wurst
class ProductWurst : public ProductMahlzeit {
public:
    ProductWurst(const std::string& beilage) {
        std::cout << "Rostwurst gebraten." << std::endl;
        if (!beilage.empty()) {
            std::cout << "Serviert mit " << beilage << std::endl;
        }
    }
};

// Abstrakter Erzeuger
class FactoryRestaurant {
protected:
    std::shared_ptr<ProductMahlzeit> mahlzeit;

    // Die abstrakte Factory-Methode, die von Erzeugern implementiert werden muss.
    virtual void MahlzeitZubereiten() = 0;

    virtual void BestellungAufnehmen() {
        std::cout << "Ihre Bestellung bitte!" << std::endl;
    }

    virtual void MahlzeitServieren() {
        std::cout << "Hier Ihre Mahlzeit. Guten Appetit!" << std::endl;
    }

public:
    // Diese Methode benutzt die Factory-Methode.
    void MahlzeitLiefern() {
        BestellungAufnehmen();
        MahlzeitZubereiten(); // Aufruf der Factory-Methode
        MahlzeitServieren();
    }
};

// konkreter Erzeuger für konkretes Produkt "Pizza"
class FactoryPizzeria : public FactoryRestaurant {
protected:
    // Implementierung der abstrakten Methode der Basisklasse
    virtual void MahlzeitZubereiten() {
        mahlzeit = std::make_shared<ProductPizza>();
    }
};

// konkreter Erzeuger für konkretes Produkt "Rostwurst"
class FactoryWurstbude : public FactoryRestaurant {
protected:
    // Implementierung der abstrakten Methode der Basisklasse
    virtual void MahlzeitZubereiten() {
        mahlzeit = std::make_shared<ProductWurst>("Pommes und Ketchup");
    }
};

int main() {
    FactoryPizzeria daToni;
    daToni.MahlzeitLiefern();

    FactoryWurstbude brunosImbiss;
    brunosImbiss.MahlzeitLiefern();
}
```

-> (in `main`) keine Kenntnis der Klassen/Objekte notwendig.

## Auto - Factory

Hier das Beispiel eines Abstract-Factory-Patterns. Es gibt eine abstrakte Fabrik (`CarFactory`) und ein abstraktes Produkt (`Car`) mit abstrakten Varianten des Produkts (`Coupe` und `Suv`):

![Pattern_Factory_Cars](C:\daten\Skripten\Informatik\SEng\02_SEng\Bilder\Pattern_Factory_Cars.png)

Anwendung:

```java
public class main {
    public static void main(String[] args) {
        CarFactory myCarFact = new BmwCarFactory();
        Car myCar = myCarFact.createCar("SUV");
        
        System.out.println(myCar.getType());
    }
}
```

hier soll `BmwCarFactory` auch durch `AudiCarFactory` ersetzt werden können und SUV durch Coupe.

Die *Factory*s:

AudiCarFactory.java:

```java
public class AudiCarFactory implements CarFactory {
    public Car createCar(String carType) {
        if (carType.equals("SUV")) {
            return new BmwX6();
        else if (carType.equals("Coupe")) {
            return new BmwGt();
        else {
            return null;
        }
    }
}
```

BmwCarFactory.java:

```java
public class BmwCarFactory implements CarFactory {
    public Car createCar(String carType) {
        if (carType.equals("SUV")) {
            return new AudiQ7();
        else if (carType.equals("Coupe")) {
            return new AudiS7();
        else {
            return null;
        }
    }
}
```

CarFactory.java:

```java
public interface CarFactory {
    public Car createCar(String carType);
}
```

Die *Car*s:

AudiQ7.java:

```java
public class AudiQ7 implements Suv {
    public String getType() {
        return "Audi Q7 SUV";
    }
}
```

BmwX5.java:

```java
public class BmwX5 implements Suv {
    public String getType() {
        return "BMW X5 SUV";
    }
}
```

AudiS7.java:

```java
public class AudiS7 implements Coupe {
    public String getType() {
        return "Audi S7 Coupe";
    }
}
```

BmwGt.java:

```java
public class BmwGt implements Coupe {
    public String getType() {
        return "BMW GT Coupe";
    }
}
```

Suv.java:

```java
public interface Suv extends Car {
    
}
```

Coupe.java:

```java
public interface Coupe extends Car {
    
}
```

Car.java:

```java
public interface Car {
    public String getType();
}
```

Im `main` ist ersichtlich: es muss lediglich die abstrakte Form der Fabrik `myCarFact ` und ein abstraktes Produkt `myCar ` bekannt sein. Damit wird die Anwendung und die erzeugenden Klassen sehr deutlich entkoppelt.

## Wetterstation - Observer (150, 150_2)

Eine Wetterstation `ws` misst die Temperatur, Feuchte und den Luftdruck. Drei Klienten `one`, `two` und `three` werden bei jeder Temperaturänderung über die Änderung informiert.

Beispielhaft werden der Wetterstation hier in `main` die Wetterdaten per Tastatur eingetragen. Die drei Beobachter werden durch diese Änderung informiert. Anschließend wird der zweite Beobachter abgemeldet und erneut Daten eingelesen.

main.cpp:

```c++
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
```

Ausgabe:

```
Enter Temperature, Humidity, Pressure (seperated by spaces) << 20 60 1000

---Client (1) Data---   Temperature: 20 Humidity: 60    Pressure: 1000
---Client (2) Data---   Temperature: 20 Humidity: 60    Pressure: 1000
---Client (3) Data---   Temperature: 20 Humidity: 60    Pressure: 1000


Enter Temperature, Humidity, Pressure (seperated by spaces) << 21 65 1012

---Client (1) Data---   Temperature: 21 Humidity: 65    Pressure: 1012
---Client (3) Data---   Temperature: 21 Humidity: 65    Pressure: 1012
```

## Rectangle - Adapter (159)

Ein Klient möchte eine myRectangle-Klasse erzeugen und dafür einen Punkt des Rechtecks und die Breite sowie die Höhe vorgeben.

Verfügbar ist allerdings nur eine Rectangle-Klasse die Rechtecke mittels zweier, diagonaler Punkte definiert:

```c++
class myRectangle {		// Necessary-Interface: draw by use of draw()
public:
    virtual void draw() = 0;
};

class Rectangle {		// Available Rectangle
public:
    Rectangle(int x1, int y1, int x2, int y2) { // Construktor with 2 points of the Rectangle
        m_x1 = x1;
        m_y1 = y1;
        m_x2 = x2;
        m_y2 = y2;
        cout << "Rectangle:  Construktor.  P1(" << m_x1 << "," << m_y1 << ") | P2("
          << m_x2 << "," << m_y2 << ")" << endl;
    }
    void oldDraw() {
        cout << "Rectangle:  oldDraw.  P1(" << m_x1 << "," << m_y1 << ") | P2("
          << m_x2 << "," << m_y2 << ")" << endl;
    }
private:
    int m_x1;
    int m_y1;
    int m_x2;
    int m_y2;
};

int main() {
    myRectangle *r = new RectangleAdapter(120, 200, 60, 40);
    r->draw();
}
```

Erstellen Sie eine passende RectangleAdapter-Klasse. Die Ausgabe bei der Programmausführung lautet dann:

```
Rectangle:  Construktor.  P1(120,200) | P2(180,240)
RectangleAdapter: Construktor.  P1(120,200), width = 60, height = 40
RectangleAdapter: draw.
Rectangle:  oldDraw.  P1(120,200) | P2(180,240)
```

## Bridge

In Java ist folgendes Brücken-Pattern zu implementieren:

 ![Bridge Pattern UML Diagram](bilder/Pattern_Bridge_Beispiel.jpg) 

Bridge-Implementierungs-Interface

Die Ausgabe, wenn BridgePatternDemo-main gestartet wird soll lauten:

```
Drawing Circle[ color: red, radius: 10, x: 100, 100]
Drawing Circle[  color: green, radius: 10, x: 100, 100]
```

Lösung:

*DrawAPI.java*

```java
public interface DrawAPI {
   public void drawCircle(int radius, int x, int y);
}
```

Ein konkreter Bridge Implementierungs-Klasse die das *DrawAPI* interface implementiert.

*RedCircle.java*

```java
public class RedCircle implements DrawAPI {
   @Override
   public void drawCircle(int radius, int x, int y) {
      System.out.println("Drawing Circle[ color: red, radius: " + radius + ", x: " + x + ", " + y + "]");
   }
}
```

*GreenCircle.java*

```java
public class GreenCircle implements DrawAPI {
   @Override
   public void drawCircle(int radius, int x, int y) {
      System.out.println("Drawing Circle[ color: green, radius: " + radius + ", x: " + x + ", " + y + "]");
   }
}
```

Erstellen der Abstrakten Klasse *Shape* die das *DrawAPI* Interface implementiert.

*Shape.java*

```java
public abstract class Shape {
   protected DrawAPI drawAPI;
   
   protected Shape(DrawAPI drawAPI){
      this.drawAPI = drawAPI;
   }
   public abstract void draw();	
}
```

Erzeugen der konkreten Klasse *Circle*, die das Shape-Interface implementiert.

*Circle.java*

```java
public class Circle extends Shape {
   private int x, y, radius;

   public Circle(int x, int y, int radius, DrawAPI drawAPI) {
      super(drawAPI);
      this.x = x;  
      this.y = y;  
      this.radius = radius;
   }

   public void draw() {
      drawAPI.drawCircle(radius,x,y);
   }
}
```

Verwenden der *Shape* und *DrawAPI* Klassen zum Zeichnen unterschiedlicher farbiger Kreise.

*BridgePatternDemo.java*

```java
public class BridgePatternDemo {
   public static void main(String[] args) {
      Shape redCircle = new Circle(100,100, 10, new RedCircle());
      Shape greenCircle = new Circle(100,100, 10, new GreenCircle());

      redCircle.draw();
      greenCircle.draw();
   }
}
```

(Beispiel von https://www.tutorialspoint.com/design_pattern/bridge_pattern.htm)