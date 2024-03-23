---
tags: 
aliases:
  - Design Patterns
keywords: 
subject:
  - VL
  - Softwareentwicklung 2
semester:
  - SS24
  - B2
created: 29. November 2022
professor:
---
 

# Entwurfsmuster (Design-Patterns)

![InlineR|450](assets/GoF.png)

> [!info] Viele Probleme wurden schon gelöst, daher naheliegend: diese Lösungen für die Lösung eigener Probleme verwenden.
> Als Entwurfsmuster bereitgestellte Lösungsstrukturen sind **nicht auf Code-Ebene**.
> - Das Muster soll von der Sprache unabhängig einsetzbar sein $\gets$ *Softwaredesign*


> [!hint] Eine sehr bekannte Sammlung von Mustern ist von der **Gang of 4** (**GOF**).
> Sie haben in einem Klassiker 23 Muster definiert. Die von ihnen gesammelten Muster wurden Gruppiert:
> - *Erzeugungsmuster*: Singleton, Factory
> - *Strukturmuster*: Adapter, Decorator, Fassade
> - *Verhaltensmuster*: Observer, Strategie, Iterator

[[Erzeugungsmuster]]

## Observer

Ein Observer gehört zur Gruppe der **Verhaltensmuster**. Er wird verwendet um Veränderungen (an `mState`) an einem Objekt (Subject) an von diesem Objekt abhängige Objekte (`Observer`) weiter zu melden.

- Ein Observer muss sich zu diesem Zweck bei dem Subject anmelden:  
  Subject: Methode `registerObserver()`: damit wird ein weiterer Observer in eine Observer-Liste `mObserver` eingefügt (Aggregationsbeziehung)
- Ein Observer muss sich abmelden, wenn er nicht mehr informiert werden soll:  
  Subject: Methode `removeObserver()`: Entfernen eines Observer aus der Liste
- Subject: Methode `notify()`: nach jeder Veränderung ruft Subject diese selber auf und ruft damit für jeden gelisteten Observer die Methode `update()` auf.
  - Das Subject sendet in der `update()` Funktion sich selbst als Parameter oder die gewünschte Informationen (push-Variante).
  - Eine zweite Variante ist es, mit `update` den Observer darauf aufmerksam zu machen, dass es neue Daten gibt - diese können dann nach Bedarf mit einem Getter `getState` vom `ConreteSubject` abgerufen werden (pull-Variante).
- Observer: mit der `update()`-Methode wird die `getState()` Methode des Subject aufgerufen um die notwendigen Daten abzurufen.

Ein Observer ist eine *Eins-zu-Viele-Abhängigkeit* (Ein Subject <-> Viele Observer).

![img](assets/UML_Pattern_Observer.png)

c++-Beispiel:

<https://de.wikipedia.org/wiki/Beobachter_(Entwurfsmuster)>

## Iterator

Ein **Iterator** gehört zur Gruppe der Verhaltensmuster. Dieses Muster sei hier erwähnt, die Anwendung und Funktion ist in Standard-Template-Library für die Collections implementiert.

## Model-View-Control MVC

Das MVC-Pattern ist Keines der GoF, allerdings hat es sich für GUI-Anwendungen sehr bewährt. Dabei geht es darum graphische Kontrollelemente von der [Logik](../../../Mathematik/Aussagenlogik.md) zu trennen:

 ![img](assets/Pattern_MVC.png) 

Beispielhaft soll mittels einer Datenbankanwendung Listen in einer Applikation dargestellt werden. In einer ersten Implementierung würde das ein ständiges Wechselspiel von GUI-Events und Datenbankzugriffen zur Folge haben. Ein Problem entsteht, wenn die Anwendung auf einem anderem System (Linux, Windows, Mobil, Desktop …) laufen soll, dann muss die komplette Anwendung neu erstellt werden. Aber genauso wenn die Daten eine andere Struktur aufweisen.

Aus diesem Grund wird der angezeigte Teil (**View**) komplett vom Datensatz (**Modell**) getrennt. Damit die Daten in der View und im Modell gleich sind wird ein **Controller** benötigt, der kümmert sich um das Kopieren der Daten View<->Modell. Das kann als Ursache eine Veränderung der Datenquelle für das Modell haben (Datenbankzugriff …) oder ein Verändern der Daten auf der GUI-Seite (View) etwa durch eine Eingabe o.ä.

Vorteile:

- Änderungen in der Programmlogik haben keine Auswirkung auf die graphische Darstellung und können unabhängig erfolgen.
- Die Darstellung ist unabhängig von der (eventuell komplexen) [Logik](../../../Mathematik/Aussagenlogik.md) und kann unabhängig von den anderen Teilen verändert werden.

Dieses Konzept ist nach außen in Abwandlungen realisiert, so zum Beispiel in Qt-C++, Java-Swing oder C#-WPF (MVVM). Dort ist jeweils nur ein Modell für die GUI-Klasse (View) verfügbar, der Controller ist im View integriert.

### [Qt](../../Cpp/Qt.md)-ListView (156)

Allgemein hat es ja nicht viel Sinn dieses Konzept für ein einfaches Textfeld zu verwenden. Der Vorteil ist erst dann gegeben wenn es sich um größere Datenmengen handelt, für [Qt](../../Cpp/Qt.md) gibt es so etwa ein List-View (*QListView*) für die Darstellung einer Liste von Daten:

- Zuerst wird auf einem UI ein *View* *QListView* mit Namen *lstNamen* erstellt

- Als Modell wird eine Modell-Variable angelegt (zum Beispiel in *mainwindow.h*):

```cpp
QStringListModel *model;           // Modell
```

- Das *lstNamen-QListView* wird mit dem *model*-Modell verknüpft (z.B. im Konstruktor):

```cpp
model = new QStringListModel(this);
ui->lstNamen->setModel(model);     // ListView--Element vom GUI
```

- Damit können im Modell Elemente verändert werden:

```cpp
model->insertRows(0,3);						// 3 Elemente an Pos 0 einfügen
model->setData(model->index(0), "Hans");	// erstes Element
model->setData(model->index(1), "Fritz");
model->setData(model->index(2), "Klaus");
```

  Diese Veränderungen werden automatisch im GUI in der verknüpften Liste angezeigt.

In [Qt](../../Cpp/Qt.md) gibt es einige Elemente bei denen das möglich ist wie etwa auch in einer ComboBox. Nicht alle Elemente lassen es zu dass ein Modell verknüpft wird (sind dann private).

Vorteil: im Programm muss man sich nur um das Modell kümmern, dargestellt werden die Daten automatisch.

## Adapter

Ein Adapter, auch Wrapper ist ein **Struktur-Muster**. Er wird verwendet um Schnittstellen anzupassen.

Problemstellung:

- Ein Client greift in einer gewissen Form auf eine Schnittstelle zu `request()`.
- Ein Dienst (Adaptee) bietet die Schnittstelle in einer anderen Form an `specificRequest()`
- Beide, Client und Dienst sollen nicht angepasst werden, der Zugriff trotzdem möglich sein

![invert_dark](assets/UML_Pattern_adapter.png)

Ein Client greift auf `request()` von `Target` zu. Verfügbar für diese Anforderung ist lediglich `specificRequest` von `Adaptee`. Es wird eine *Adapter*-Klasse erstellt: 

```cpp
class Target {// Target-Interface with request()
public:
    virtual void request() = 0;
};

class Adaptee {  // Existing interface which specificRequest needs adapting
public:
    Adaptee() {
        cout << "Adaptee:  Construktor" << endl;
    }
    void specificRequest() {
        cout << "Adaptee:  specificRequest()" << endl;
    }
};

class Adapter: public Target, private Adaptee { // Adapter/Wrapper
public:
    Adapter() {
        cout << "Adapter: Construktor" << endl;
    }
    virtual void request() {
        cout << "Adapter: request()" << endl;
        specificRequest();
    }
};

int main() {
    cout << "main: creating Target." << endl;
    Target *my = new Adapter();
    cout << "main: Target.request()" << endl;
    my->request();
}
```

In `main` (Client) wird ein `Target` erstellt mittels `Adapter`. Der Client erhält eine Schnittstelle wie sie benötigt wird. Die Klasse`Adaptee` bleibt ebenfalls unverändert.

Beispielhaft gibt es in Java die Wrapper-Klasse *Integer* für den Datentypen `int`. Diese Klasse Kapselt (wrappt) den Datentyp in eine Klasse um etwa eine Liste erstellen zu können (Adapter-Funktion) und um zusätzliche Features anbieten zu können (Decorator).

Stream-Klassen sind ungebuffert, für die gebufferte Anwendung werden sie in Buffered-Stream-Klassen eingebettet.

## Referenzen

- Kompakte/Einfache Übersicht  
   <http://www.inztitut.de/blog/glossar/software-pattern/> 
- Sehr ausführliche und verständliche Ausführung  
   <https://www.philipphauer.de/study/se/design-pattern.php>
- Brücke  
   <https://www.tutorialspoint.com/design_pattern/bridge_pattern.htm>