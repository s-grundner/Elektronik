# 6 Smart Pointer

Zeiger sind kennzeichnend für C/C++. In vielen anderen Programmiersprachen ist dieses Konzept nicht vorhanden. Der Grund sind häufig auftretende Fehler die sehr aufwändig zu finden/beheben sind und damit die Vorteile von Zeigern häufig zu zunichte machen. Typische Fehler:

- Dereferenzieren von nicht initialisierten Zeigern
- mehrfaches *delete* auf einen Zeiger
- verwitwete Objekte (Speicher-Lecks)

In C++ wurden aus diesem Grund intelligente (smart) Zeiger eingeführt. Durch die Möglichkeit in C++ Operatoren einschließlich *->* und * zu überladen kann einfach eine entsprechende Smart-Pointer-Klasse geschaffen werden.

## unique_ptr

**Exklusiver Zugriff** auf dynamisch erzeugte Elemente mittels Zeiger. Dabei wird sichergestellt, dass nur ein einziger Zeiger auf die Ressource verweist. Weiters wird die Ressource automatisch gelöscht, wenn kein Zeiger mehr auf sie zeigt (der Zeiger den Geltungsbereich verlässt). Es kann kein zweiter Zeiger auf die Ressource zeigen. Verwendung:

```c++
unique_ptr<   int    > myVar  (  new int{3}  );
```

(Diese Variante kann, vor allem wenn man es darauf anlegt, missbraucht werden daher) Besser (erst ab C++14):

```c++
unique_ptr<  int  > myPtr = make_unique<  int  >(  3  );
auto myPtr = make_unique<  int  >(  3  );
```

Beispiel:

```c++
#include<iostream>
#include<memory>

using namespace std;

class Resource {
public:
    Resource(int i) : id(i) { cout << "Konstruktor Resource(), Id=" << id << endl; }
    ~Resource() { cout << "Resource::Destruktor, Id=" << id << endl; }
    void hi() const { cout << "hier ist Resource::hi(), Id=" << id << endl; }
private:
    int id;
};
int main() {
    cout << "Zeiger auf dynamisches Objekt:" << endl;

    unique_ptr<Resource> p1(new Resource{1});

    cout << "Operator -> " ;
    p1->hi();

    cout << "Operator * " ;
    (*p1).hi();

    cout << "get " ;
    p1.get()->hi();

    // Kopieren des unique-Zeigers funktioniert nicht:
    Resource *p2;
    //p2 = (Resource*)p1;

    // Copy-Konstruktor gibt's nicht:
    //unique_ptr<Resource> p3(p1);

    unique_ptr<Resource> p4(new Resource(2));
    // p4 = p1;   // kopieren klappt nicht
    p4 = std::move(p1);     // hier wird Destruktor id=2 aufgerufen,
    // weil ab hier besitzerlos

    // Definieren eines Null-Zeigers
    unique_ptr<Resource> nullp((Resource * )0);
    // nullp->hi(); // Speicherzugriffsfehler!
}
```

Ausgewählte Methoden:

- *unique_ptr()* erzeugt ein Objekt, das nichts enthält, gleichbedeutend mit der Anweisung `unique_ptr<Resource> nullp((Resource*)0);` im obigen Programm. Das bedeutet ein *unique_ptr* ist nie undefiniert (er ist zumindest 0).
- *operator->()* Zugriff auf das enthaltene Objekt
- *operator*()* Zugriff auf das enthaltene Objekt
- *get() const* gibt genau wie *operator->()* den Zeiger auf das enthaltene Objekt zurück.
- *reset(ptr)* setzt den internen Zeiger auf *ptr*. Der Destruktor für das möglicherweise vorher enthaltene Objekt wird aufgerufen.
- *release()* setzt den internen Zeiger auf *NULL*. Achtung: Der Destruktor für das möglicherweise vorher enthaltene Objekt wird nicht aufgerufen! Mit *release* kann ein Objekt auf einen anderen Zeiger übertragen werden. Zum auflassen eines Zeigers ist es im Allgemeinen besser *reset(NULL)* zu verwenden.
- Ein *unique_ptr* und seine zugrunde liegende Ressource wird automatisch gelöscht wenn sein Gültigkeitsbereich verlassen wird.
- Mit dem *unique_ptr*-Member *move* kann ein Zeiger von einer Variable in eine andere verschoben werden (da *unique* kann er ja nicht kopiert werden).
- In *make_unique* kann eine Ressource erstellt/kopiert und einem *unique_ptr* zugewiesen werden (gibt's erst mit C++14).
- Zum Vertauschen von zwei Zeigern gibt's *swap*: `std::swap(p1, p2);`. In der *swap*-Implementierung gibt es kein Kopieren, das wird mittels *move* gelöst.

Verbogen werden kann in C++ immer:

```c++
  int *intPtr = (int*)p1.get();
  *intPtr = 7;		// Verändern des id-Werts
//oder:
  Resource *ptr = new Resource(17);
  unique_ptr<Resource> p5(ptr);
  p5.reset(ptr);         // Falsche Verwendung! Destructor wird aufgerufen
  unique_ptr<Resource> p6(ptr);// Falsche Verwendung! 2 unique_ptr zeigen auf das selbe Objekt
```

Damit kann ein Zeiger direkt in einen *unique_ptr* erzeugt werden (und mit diesem auch sein Wert verändert werden).

Daher Empfehlung: unique_ptr immer mittels make_unique erzeugen.

### unique_ptr und Arrays

*unique_ptr* können auch verwendet werden um mit Arrays zu arbeiten, für *make_unique* ist das Argument dann die Array-Größe:

```c++
unique_ptr<int[]> arrPtr = make_unique<int[]> (10);
```

Die Initialisierung kann nicht direkt bei der Erstellung vorgenommen werden.

## shared_ptr

![Cpp_SmartPtr_01](bilder/Cpp_SmartPtr_01.png)

Eine Erweiterung des *unique_ptr* ist der *shared_ptr*. Ansonsten grundsätzlich gleich, können auf Ressourcen auf die der *shared_ptr* zeigt, mehrere *shared_ptr* gleichzeitig zeigen. Ein *Referenzzähler* zählt dabei die Zugriffszeiger, die auf die Ressource zeigen. Zeigt kein einziger Zeiger mehr auf die Ressource, dann wird sie automatisch gelöscht.

```c++
// demo-shared_ptr-01.cpp 
// 
// g++ -std=c++11 demo-shared_ptr-01.cpp -o demo-shared_ptr-01.exe 
// ./demo-shared_ptr-01.exe 

#include <string> 
#include <memory> 
#include <iostream> 
using namespace std; 

class Person{ 
public: 
    Person(const string& name){ m_name = name; } 
    ~Person(){ cout << "Destructor of Person: " << m_name << endl; } 
    void printName(void){ cout << "Person: " << m_name << endl; } 
private: 
    string m_name; 
}; 

int main(int argc, char **argv){ 
    // shared_ptr creation 
    shared_ptr<Person> spMaxi(new Person("Maxi Mustermann")); 
    shared_ptr<Person> spSusi(new Person("Susi Musterfrau")); 
    shared_ptr<Person> spOther; 

    cout << "Assign spMaxi to spOther" << endl; 
    // -------------------------------------------------------------------
    spOther= spMaxi; 

    cout << "Calling printName() on spMaxi, spSusi, spOther ..." << endl; 
    // ------------------------------------------------------------------
    spMaxi->printName(); 		      // Dereferenzierung mit -> Operator 
    (*spSusi).printName(); 		    // Dereferenzierung * Operator 
    (spOther.get())->printName(); // Dereferenzierung mit get()

    // demo reset(), unique() 
    // -------------------------------------------------------------------
    cout << "Resetting shared_ptr spSusi ..." << endl; 
    spSusi.reset(); 

    cout << "Resetting shared_ptr spMaxi ..." << endl; 
    spMaxi.reset(); 

    cout << "Now spOther is " << (spOther.unique()? "unique":"a copy") 
        << " while spMaxi is " << (spMaxi? "not empty":"empty") << endl; 


    cout << "Leaving the program ..." << endl; 

    return 0; 
} 
```

Ausgabe:

```c++
Assigning spMaxi to spOther 
Calling printName() on spMaxi, spSusi, spOther ... 
Person: Maxi Mustermann 
Person: Susi Musterfrau 
Person: Maxi Mustermann 
Resetting shared_ptr spSusi ... 
Destructor of Person: Susi Musterfrau 
Resetting shared_ptr spMaxi ... 
Now spOther is unique while spMaxi is empty 
Leaving the program ... 
Destructor of Person: Maxi Mustermann
```

Beispiel:

```c++
#include<memory>
#include<iostream>
using namespace std;
class Ressource {
public:
    Ressource(int i) : id(i){}
    void hi() const { cout << "hier ist Ressource::hi(), Id=" << id << endl; }
    ~Ressource() { cout << "Ressource::Destruktor, Id=" << id << endl; }
private:
    int id;
};

int main() {
    cout << "Konstruktoraufruf" << endl;
    shared_ptr<Ressource> p1(new Ressource(1));
    cout << "Operator –> " ; p1–>hi();
    cout << "Operator * " ; ( ∗ p1).hi();
    cout << "Benutzungszähler: " << p1.use_count() << endl; // 1
    { // Blockanfang
        // zweiter shared_ptr für dasselbe Objekt
        shared_ptr<Ressource> p2(p1);
        cout << "Benutzungszähler p1: " << p1.use_count() << endl; // 2
        cout << "Benutzungszähler p2: " << p2.use_count() << endl; // 2
        p2–>hi();
    } // p2 wird zerstört
    cout << "Benutzungszähler p1: " << p1.use_count() << endl; // 1
    cout << " Objekt existiert noch: " ;
    p1–>hi();
    // Zuweisung
    shared_ptr<Ressource> p3(new Ressource(3));
    p3 = p1; // Ressource 3 wird freigegeben (delete), danach
    // verweisen beide auf das Objekt *p1
    p1–>hi();
    p3–>hi();
    // Null-Zeiger
    shared_ptr<Ressource> nullp((Ressource * )0);
    // nullp->hi(); // Speicherzugriffsfehler!
} // p3 und p1 werden zerstört
```

### shared_ptr und Arrays

*shared_ptr* und Arrays so wie bei den *unique_ptr* (funktioniert erst seit C++17).

## weak_ptr

*weak_ptr*-Objekte sind für Objekte gedacht, die bereits von *shared_ptr*-Objekten verwaltet
werden. Der Konstruktor:

```c++
template<class T>
weak_ptr(const shared_ptr<T>& ptr);
```

Der Unterschied zu *shared_ptr* ist, dass ein *weak_ptr* kopiert und zugewiesen werden kann. Der *weak_ptr*-Destruktor hat keine Wirkung auf das enthaltene Objekt. Im Gegensatz zu einem *shared_ptr* besitzt ein *weak_ptr* keine Ressource, er verweist nur auf sie. *weak_ptr* ist für Container geeignet. Der Sinn von *weak_ptr*-Objekten ist es, zyklische Datenstrukturen unterbrechen zu können. Wenn in einer zyklischen Datenstruktur ein Knoten auf den nächsten mit einem *shared_ptr* verweist, kann der Benutzungszähler bei keinem Knoten null werden, das heißt der Destruktor wird nicht aufgerufen. Ein einfaches Beispiel:

```c++
#include <iostream>
#include <memory>
using namespace std;
struct ZyklStruktur { // Konstruktor für das Beispiel nicht erforderlich
  ~ZyklStruktur() { cout << "Destruktor ~ZyklStruktur() aufgerufen" << endl; }
  weak_ptr<ZyklStruktur> nachbar; // *** siehe Text
};
void f() {
  ZyklStruktur * a1 = new ZyklStruktur;
  ZyklStruktur * a2 = new ZyklStruktur;
  // zyklische Struktur (gegenseitige Verweise) herstellen:
  a1–>nachbar = shared_ptr<ZyklStruktur>(a2);
  a2–>nachbar = shared_ptr<ZyklStruktur>(a1);
}
int main() {
  f();
}
```

Der Destruktor wird für die Objekte *a1 und *a2 aufgerufen – es gibt kein Problem.
Wenn aber die ***-markierte Zeile durch `shared_ptr<ZyklStruktur> nachbar;` ersetzt würde,
blieben sie, wenn *main()* nicht beendet würde, unerreichbar auf dem Heap! *weak_ptr*
besitzt die folgenden Methoden:

- *long use_count()* gibt *sptr.use_count()* zurück, wobei sptr das bei der Konstruktion verwendete *shared_ptr*-Objekt ist. Falls *sptr == NULL* ist, wird 0 zurückgegeben.
- *bool expired()* gibt *use_count() == 0* zurück.
- *shared_ptr<T> lock()* gibt das zugeordnete *shared_ptr*-Objekt zurück, falls vorhanden,
  andernfalls *shared_ptr()*.

Wichtig: wenn auf einen *shared_ptr* nur mehr ein *weak_ptr* zeigt wird die Ressource zerstört.

## auto_ptr

**auto_ptr** sind veraltet und sollen nicht mehr verwendet werden.

Sehr anschaulich ist die einfache Implementierung in der Standardbibliothek der Klasse *auto_ptr*:

```c++
template <typename T>
class auto_ptr{
    T* ptr;
public:
    explicit auto_ptr(T* p = 0) : ptr(p) {}
    ~auto_ptr()                 { delete ptr; }
    T& operator*()              { return *ptr; }
    T* operator->()             { return ptr; }
    // ...
};
```

- Das einzige Member-Attribut ist der einfache Zeiger *ptr*.
- Der Konstruktor initialisiert diesen Zeiger definiert auf Null. Es kann somit keinen undefinierten Zustand geben. Das Schlüsselwort *explicit* unterbindet eine implizite Typumwandlung. Wird diese mit einem *auto_ptr* versucht, wird ein Fehler ausgelöst.
- Der Destruktor stellt sicher, dass  das Obekt auf das der Zeiger zeigt gelöscht wird, wenn der Sichtbarkeitsbereich des Zeigers verlassen wird. Es kann kein unreferenziertes Objekt übrig bleiben.
- Mit der Operator-Überladungen kann ein *auto_ptr* gleich wie ein Standard-Zeiger verwendet werden.

Wird ein Smart-Pointer auf diese Weise implementiert gibt es auch Nachteile:

-  Es können nicht zwei Zeiger auf ein Objekt zeigen, das *Löschen* eines der Zeiger würde ein Zerstören des Objekts zur Folge haben.
- Dadurch kann ein Objekt auf dem so ein Zeiger zeigt nicht aus einer Funktion zurückgegeben werden. Dabei würde durch die Zerstörung des lokalen Zeigers das Objekt zerstört.

Gerade für die Verwendung von STL-Containern sind diese Nachteile gravierend, werden dort doch Elemente kopiert (doppelte Verwendung von Objekten).

*auto_ptr* sind nur bis zum C++11 Standard empfohlen. Ab da sind bessere Klassen verfügbar.

## RAII - Resource Acquisition Is Initialization

Smart Pointer verwalten ihre Ressourcen nach dem *RAII* Idiom. **RAII** = **R**esource **A**cquisition **I**s **I**nitialization: bezeichnet eine populäre Programmiertechnik. Sie sieht vor, dass die Ressourcenbelegung (Initialisierung) und Resourcenfreigabe explizit an die Lebensdauer eines Objekts gebunden ist. In C++ wird dafür mittels Konstruktor die Ressource initialisiert und mittels Destruktor wieder freigegeben.

## Referenz

- Einfache Einführung
  [<https://de.wikibooks.org/wiki/C%2B%2B-Programmierung/_Speicherverwaltung/_Smart_Pointer>](<https://de.wikibooks.org/wiki/C%2B%2B-Programmierung/_Speicherverwaltung/_Smart_Pointer>)

- Übersicht
  [<https://de.wikibooks.org/wiki/C%2B%2B-Programmierung/_Speicherverwaltung/_Zusammenfassung>](<https://de.wikibooks.org/wiki/C%2B%2B-Programmierung/_Speicherverwaltung/_Zusammenfassung>)
  
- Schöne Einführung
  https://www.grimm-jaud.de/index.php/blog/std-unique-ptr
  
  https://www.grimm-jaud.de/index.php/blog/std-shared-ptr

