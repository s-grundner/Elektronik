---
tags:
  - cpp/STL
aliases: []
created: 5. September 2023
---

# Container

Container sind für das Speichern von Objekten mittels Templates implementiert. Die Grundformen sind:

1. *array* - unveränderbares Array, sehr effizient
2. *vector* - veränderbare Arraygröße (nur am Ende), sehr effizient
3. *list* - Liste, an jeder Stelle veränderbar
4. *deque* in der Anwendung ähnlich wie *vector* (doppelt verkettete Liste)
5. *set* - Sammlung, geordnet, Einfügen und Löschen optimiert
6. *map* - Paarung Schlüssel/Wert, Schlüssel ist einzigartig
7. *unordered_set* - (und *_map*) - Hash-Tabellen. Ermöglichen sehr effizienten Zugriff auf einen Wert, dessen Position innerhalb des Containers mittels Hash-Funktion auf dem Schlüssel berechnet wird
8. *queue* - FIFO Speicher
9. *stack* - Stapel

> [STL](Cpp_STL.md)-Container: Klassen für die Sammlung von Daten.

## Allgemein

Für die Verwendung wird ein passender Header (fast immer genau der Name des Containers) inkludiert. Definition am Beispiel einer *list*:

```c++
#include <list>
...
list<int> myList;       // noch leere Liste von int-Objekten
```

*List* ist ein Container zum Speichern von gleichartigen Objekten. Um eine *List* für alle möglichen Datentypen anzubieten ist sie als Template-Klasse angeboten wodurch der Datentyp bei der Definition mit angegeben werden muss (hier *int*)

Unterscheidung:

- Sequentielle Container: Datenobjekte werden sequentiell abgelegt (Arrays und verknüpfte Listen), Zugriff über die Position (so etwas wie ein Index)  
  Beispiele: *array*, *vector*, *deque*, *list* und *forward_list*
- Assoziative Containerklassen: Daten werden durch Schlüsselelemente referenziert  
  Beispiele: *set* / *multiset* und *map* / *multimap*
- nicht geordnete Container (Hash-Tables): das Einsortieren von Werten erfolgt mittels Schlüssel, welche wiederum über eine Hashfunktion zugeordnet werden. Über die Hash-Funktion ist die Lage eines beliebigen Elements berechenbar -> sehr effizient.  
  Beispiele: *unordered set* / *multiset* und *unordered map* / *multimap*
- Containeradapter: diese Container haben keine Iteratoren  
  Beispiele: *stack*, *queue* und *priority_queue*

![](assets/STL_Container.png)

In den meisten Anwendungsfällen für einen sequentiellen Container sind *array* und *vector* die idealen Kandidaten. Gründe: schnellster Zugriff und kleinster Speicher-Overhead.

## Sequentielle Container

In diesen Containertypen werden die Daten in einer Reihenfolge abgelegt. Zu ihr gehören *array*, *vector*, *deque*, *list* und *forward_list*. Allgemein sind für diese Container (unter anderen) die folgenden Member verfügbar:

```c++
cont.capacity()			   // Max. Anzahl von (reservierten) Elementen (size=verwendet)
cont.empty()			   // Pruefung ob keine Elemente enthalten
cont.size()				   // Anzahl der aktuell enthaltenen Elemente
num = cont.max_size()	   // Anzahl der maximal moeglichen Elemente
val = cont.front()		   // Wert des 1ten Element
val = cont.back()		   // Wert des letzten Elements
cont[i]					   // ites Element (nicht fuer List - kein Rand. Acc.)
cont.at(i)				   // ites Element (nicht fuer List - kein Rand. Acc.)
    					   // mit Exception fuer out_of_range
it = cont.begin()		   // Iterator (ungefaehr Pointer) auf erstes Element
it = cont.end()			   // Iterator (ungefaehr Pointer) auf das Element nach dem letzten Element
```

Spezielle Methoden nur für manche Container:

```c++
// Random-Access-Container:
num = myArr.at(2);		// 3tes Element des Arrays (mit out_of_range-Exception)
num = myArr[2];			  // 3tes Element des Arrays (ohne Exception!)

// Erweiterbare/Reduzierbar (je nachdem ob vorne/hinten oder beides):
cont.push_back(elem)	// elem hinten an cont anfuegen
cont.emplace_back(elem)// wie push_back nur wird evtl. kein neues Element angelegt
cont.pop_back()			  // letztes Element entfernen (cont um 1 kleiner)
cont.push_front(elem)	// elem vorne in cont einfuegen
cont.pop_front()		  // erstes Element entfernen (cont um 1 kleiner)
cont.insert(it,elem)	// elem an Position it (Iterator) einfuegen
cont.insert(it,fst,lst)	// alle Elemente von fst..lst an Pos it einfuegen
						          // fst,lst sind Iteratoren eines Containers
cont.erase(it)			  // Position it (Iterator) entfernen
cont.erase(fst,lst)		// alle Elemente von fst..lst (Iteratoren) loeschen
cont.clear()			    // alle Elemente entfernen

num = cont.fill(7);	  // alle Elemente werden auf 7 gesetzt
cont1.swap(cont2);		// kompletter Arr-Inhalt von myArr und myArr2 werden getauscht
```

> Sequentielle Container: Container-Elemente sind sequentiell (~nacheinander) abgelegt.

## Assoziative Container

Diese Container ordnen einem Wert einem Schlüssel zu, mittels dem auf den Wert zugegriffen werden kann. Das bedeutet jedes Objekt in diesen Containern besteht aus einem Schlüssel und einem Wert. *set* ist die einfachste Form, in diesem ist der Schlüssel gleichzeitig der Wert.

**set**: ist eine aufsteigend sortierte Ansammlung von gleichartigen Elementen (Realisiert mittels binärem Baum). Sie bieten keinen wahlfreien Zugriff über Iteratoren, sind aber bidirektional. Die Werte sind einzigartig (sind ja gleichzeitig die Schlüssel), es gibt keine doppelten Einträge.

```c++
set<int> mySet			  // Definition: Abspeichern von int-Werten (ist auch Schluessel)
mySet.insert(10)		  // Einfuegen des Elements mit Schluessel/Wert 10
it = mySet.find(10)		// Iterator auf das Element mit Schluessel 10 
```

Das Eintragen von gleichen Werten bleibt folgenlos, es wird lediglich nichts eingetragen.

`find()` liefert `.end()` wenn kein Element mit dem gesuchten Schlüssel gefunden wird.

***multiset***: Unterschied zu *set*: Mehrfach-Einträge möglich (z.B. mehrfach eintragen von 10)

***map***: ist eine aufsteigend sortierte Ansammlung von Schlüssel/Wert-Paaren (sortiert nach dem einzigartigen Schlüssel). *map* sind mittels binärem Baum realisiert.

```c++
map<int,string> myMap	// Definition Schluessel=int und Wert=string
myMap[2] = "Jim"		  // Neu Einfuegen oder Update des Elements mit Schl. 2
it = myMap.find(2)		// Iterator auf den Wert des Elements mit Schluessel 2
```

*find()* liefert *.end()* wenn nichts gefunden wird.

***multimap***: Unterschied zu *map*: der Schlüssel muss nicht eindeutig sein.

> Assoziative Container: Container-Werte sind mittels eigenem Schlüsselelement greifbar. 

## Containeradapter

Diese Templates sind keine eigenen Definitionen von Datenstrukturen, sondern setzen auf vorhandene Templates auf (z.B. *vector*) und adaptieren diese.

***stack***: Stapelspeicher, LiFo. Dieser setzt auf einen *vector* auf (kann ja auch nur einem Ende verändert werden)

***queue***: Schlange, FiFo. Setzt auf eine *deque* auf (kann an beiden Enden verändert werden)

***priority_queue***: *Priority-Queues* können genau gleich wie *Queues* verwendet werden. Bei jedem Einfügen wird die *Queue* neu sortiert, sodass die Elemente mit dem größten Element ganz am Anfang der *Queue* stehen. Dafür muss eventuell eine Vergleichsoperation definiert werden. Für die Verwendung der *priority_queue* muss der Header *queue* eingebunden werden.

Alle drei Klassen bieten keine *Iteratoren* an.

```c++
// Stapel:
myCont.push(elem)		    // Element in Stapel/Queue legen
elem = myStack.top()	  // oberstes Stapel-Element
elem = myQueue.front()	// fruehestes Queue-Element
elem = myQueue.back()	  // neueste Queue-Element
myCont.pop()			      // oberstes Stapel-El/fruehestes Queue-El loeschen
```

Wie erwähnt, funktioniert eine *Priority-Queue* genau wie eine *Queue*:

```c++
prioriy_queue<int> cont;						// Prioritaet: groesste Zahl zuerst
```

Für einfache Datentypen ist die Sache nicht weiter kompliziert.

Wenn der Element-Typ der Queue-Elemente eine Klasse ist, kann eine Prioritäten-Reihung nicht so einfach erfolgen. Es muss zusätzlich eine Priorisierung angegeben werden:

```c++
prioriy_queue  <MyCls,				// Datentyp eines Elements
				vector<MyCls>,		    // vector der abgelegten Typen (weil Adapter-Kl.)
				MyClsCmp			        // Vergleichsklasse
			   > cont;	            // damit Groesse von myCls definiert werden kann
```

Die Vergleichklasse (Überladen des Funktionsoperators - *Funktor*):

```c++
class MyClsCmp {
public:
  bool operator()(MyCls& p1, MyCls& p2) {
    if (p1.h < p2.h) return true;	// Vergleich eines relevanten Members ...
    return false;
  }
}
```

Hier wird eine eigene Klasse definiert um die Reihung der Objekte zu definieren. Dazu muss der ()-Operator (*Funktor*) überladen werden. Die Parameter sind die beiden zu vergleichenden Elemente, der Rückgabewert ist *bool*. Hier werden die beiden Member-Attribute *.h* miteinander verglichen (die Klasse muss also *Friend* sein oder die Member *public* …).

> Container-Adapter: Adaptieren vorhandene Container und erweitern die Funktionalität.

## Spezielle Container

### Array

Die Klasse *array* ist ursprünglich nicht in der [STL](Cpp_STL.md) enthalten. Um für die [STL](Cpp_STL.md)-Funktionen auch für Standard-c-Arrays zu ermöglichen, wurde diese sogenannte *Wrapper*-Klasse eingeführt. Sie erweitert das Standard-c-Array mit für die [STL](Cpp_STL.md) notwendigen Funktionen und Iteratoren. 

```c++
array<int, 3> myArr2;
array<int, 4> myArr3 = {7, 8, 9, 6};	// mit Initialisierung (erst seit (c++ 17))
```

In einem *array* kann beliebig zugegriffen werden (*Random-Access*), neben den allgemeinen Memberfunktionen für sequentielle Container gibt es für *array* noch:

```c++
num = myArr.at(2);		// 3tes Element des Arrays (mit out_of_range-Exception)
num = myArr[2];			  // 3tes Element des Arrays (ohne Exception!)

num = myArr.fill(7);	// alle Elemente werden auf 7 gesetzt
myArr.swap(myArr2);		// kompletter Arr-Inhalt von myArr und myArr2 werden getauscht
myArr.empty();			  // Pruefung ob auf Groesse 0 definiert
num = myArr.max_size();	// Liefert genau die Anzahl von size() zurueck
```

Die Funktionen *size* und *max_size* haben die gleiche Funktion in *array*-Objekten. Ein *array* hat immer gleich viele Elemente, sie werden mit der Definition festgelegt, daher kann sich die Größe nicht verändern. Für die *empty*-Funktion gilt ebenfalls: ein *array* kann nie leer sein (außer es wurde 0-Groß definiert). Diese Funktionen sind nur da, um Kompatibilität mit anderen Klassen zu schaffen.

Betrachten wir einen Funktionsaufruf mit einem einfachen c-Array:

```c++
void myfunc(int *arr, int size) {}
...
int myArr[10];
myfunc(myArr, 10);
```

Funktionen mit c-Arrays als Parameter nehmen nur einen Zeiger auf das erste Element an. Die Größe muss separat mitgegeben werden und kann leicht unerkannte Fehler verursachen.

Zwei Lösungen mittels *array*:

```c++
void myfunc1(std::array<int, 10> arr) {}	// 1. 10 grosses Array wird erwartet
...
template <typename T>
void myfunc2(T& arr) {}						        // 2. generisch, nimmt "Alles" auf
...
std::array<int, 10> arr{};                                             
myfunc1(arr);
myfunc2(arr);
```

Die erste Lösung definiert vorab die notwendige Größe, wenn das zu wenig generisch ist dann kann mittels Template wie bei der zweiten Lösung gearbeitet werden.

> Allgemein: für einfache Arrays anstatt von *c-Arrays* immer *array* verwenden (wenn schon nicht *vector*).

### String

Die *string*-Klasse war nicht Bestandteil der [STL](Cpp_STL.md). Nachdem [STL](Cpp_STL.md)-Elemente in den Standard kamen wurden in der *string*-Klasse Methoden zugefügt um Strings für die [STL](Cpp_STL.md) kompatibel zu machen. Damit können sich Strings sehr ähnlich wie Container verhalten.

```c++
string myStr;

string::iterator it = myStr.begin();	// String-Iterator

myStr.insert(it, 'a');					// Einfuegen an Pos begin
myStr.insert(it, 'b');					// Einfuegen an Pos begin
myStr.insert(it, 'c');					// Einfuegen an Pos begin

myStr.push_back('1');					  // Einfuegen am Ende

cout << myStr;							    // Ausgabe cba1
```

Oder *algorithm*-Funktionen angewendet werden:

```c++
transform(myStr.begin(), myStr.end(), myStr.begin(), ::toupper);	// CBA1

sort(myStr.begin(), myStr.end());									                // 1ABC
```

liefert *CBA1*.