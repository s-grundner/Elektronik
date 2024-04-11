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

# Strukturmuster

## Adapter

Ein Adapter, auch Wrapper ist ein **Struktur-Muster**. Er wird verwendet um Schnittstellen anzupassen.

Problemstellung:

- Ein Client greift in einer gewissen Form auf eine Schnittstelle zu `request()`.
- Ein Dienst (Adaptee) bietet die Schnittstelle in einer anderen Form an `specificRequest()`
- Beide, Client und Dienst sollen nicht angepasst werden, der Zugriff trotzdem möglich sein

![invert_dark](UML_Pattern_adapter.png)

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
