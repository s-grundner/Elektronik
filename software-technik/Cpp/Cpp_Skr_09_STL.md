## 9 STL - Standard Template Library

Häufig verwendete Funktionen wurden in dieser Bibliothek erstellt und, weil sinnvoll, in den ANSI/ISO Standard übernommen:

- Datenstrukturen/**Container** und Algorithmen

Die Container und Algorithmen sind im Standard-Namespace *std* definiert. Die folgenden Vorgaben wurden getroffen:

- möglichst für alle Datentypen verfügbar (**generisch** - Realisierung mittels Templates)
- möglichst **effizient**; selbstgeschriebenes soll nicht schneller sein
- möglichst alles betroffene wird **vollständig** abgedeckt
- möglichst einfach (**primitiv**). Kein Vereinen unterschiedlicher Lösungen
- möglichst **erweiterbar**

![](bilder/Stl_Overview.png)

Um Algorithmen möglichst von den Datenstrukturen/Containern unabhängig zu machen, sind die Algorithmen so entworfen, dass sie über einheitlich definierte Iteratoren funktionieren.

![](bilder/Stl_Allg.png)

## 9.1 Container

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

> STL-Container: Klassen für die Sammlung von Daten.

#### Allgemein

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

![](bilder/STL_Container.png)

In den meisten Anwendungsfällen für einen sequentiellen Container sind *array* und *vector* die idealen Kandidaten. Gründe: schnellster Zugriff und kleinster Speicher-Overhead.

#### Sequentielle Container

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

#### Assoziative Container

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

#### Containeradapter

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

Hier wird eine eigene Klasse definiert um die Reihung der Objekte zu definieren. Dazu muss der ()-Operator (*Funktor*) überladen werden. Die Parameter sind die beiden zu vergleichenden Elemente, der Rückgabewert ist *bool*. Hier werden die beiden Member-Attribute *.h* miteinander verglichen (die Klasse muss also *Friend* sein oder die Member *public* ...).

> Container-Adapter: Adaptieren vorhandene Container und erweitern die Funktionalität.

#### Spezielle Container

##### array

Die Klasse *array* ist ursprünglich nicht in der STL enthalten. Um für die STL-Funktionen auch für Standard-c-Arrays zu ermöglichen, wurde diese sogenannte *Wrapper*-Klasse eingeführt. Sie erweitert das Standard-c-Array mit für die STL notwendigen Funktionen und Iteratoren. 

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

##### string

Die *string*-Klasse war nicht Bestandteil der STL. Nachdem STL-Elemente in den Standard kamen wurden in der *string*-Klasse Methoden zugefügt um Strings für die STL kompatibel zu machen. Damit können sich Strings sehr ähnlich wie Container verhalten.

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

## 9.2 Iteratoren

Um Container und Algorithmen möglichst flexibel (miteinander) einsetzen zu können, werden deren Schnittstellen üblicherweise als Iteratoren definiert. Beginnend kann vereinfacht ein Iterator als Zeiger auf die Teilelemente eines Containers verstanden werden. Mittels diesem kann durch die Struktur traversiert werden. Für diese Iteratoren sind unterschiedliche Operatoren verfügbar (++, * ...). Die Algorithmen der STL arbeiten nicht direkt mit Containern sondern über Iteratoren (viel einfacher, der Algorithmus muss nur für einen Iterator entwickelt werden und funktioniert für alle Container).

>STL-Iteratoren: Referenz auf ein Container-Element. Bietet Zugriff in unterschiedliche Container auf einheitliche Weise.

- Iteratoren können erzeugt werden ohne mit einem Container verbunden zu sein.
- Ein Iterator kann mit einem Container verbunden werden (typisch *begin()* oder *end()*).
- Ein Iterator ist immer definiert, sobald ein Iterator über eine Containergröße hinausläuft, kann dies mit *end()* abgefragt werden.

Es werden Kategorien von Iteratoren unterschieden:

1. Input-Iterator: für das sequenzielle Lesen von Daten (Container, Datei, ...). Ein Rückspringen (-- ...) ist nicht definiert. Beispiel: wird aus einer Datei sequentiell gelesen, dann kann das Einlesen einer Position nur einmal erfolgen. Bei erneutem Einlesen wird automatisch der nächste Wert eingelesen.

2. Output-Iterator: für das sequenzielle Schreiben von Daten (Container, Datei, ...). Kein Rückspringen möglich. Zum Schreiben in diesen Iterator wird der Dereferenzierungsoperator * verwendet:

   ```c++
   *output = Wert;
   ```

   Beispiel: analog zum Lesen einer Datei ist das beim Schreiben einer Datei. Wird ein Wert geschrieben, schreibt dir folgende Schreibe-Operation automatisch auf die folgende Position.

3. Forward-Iteratoren: kann sich nur vorwärts bewegen (kein -). Allerdings kann eine Position gespeichert werden (im Gegensatz zu In- und Output).
   *forward_list*, ungeordnete assoziative Container (*unordered_set*, *unordered_...*)

4. Bidirektional-Iteratoren: wie Forward mit zusätzlichem Rückwärtsgehen.
   *list*, geordnete assoziative Container (*set*, *map*, *multiset*, *multimap*)

5. Random-Access-Iterator: wie bidirektional, zusätzlich mit direkten Zugriff auf beliebige Stellen mittels []-Operator.
   *array*, *vector*, *deque*, *string*

6. (Reverse-Iterator)

Definieren eines Iterators ohne Container:

```c++
list<int>::iterator it;  // Iterator fuer eine int-Liste (automatisch Bidirect. Iter.)
```

Zum Einfügen von Elementen in einem Container kommt es vor, dass nicht definierte Bereiche beschrieben werden sollen:

```c++
list<int> myList;				    // Definition List, ACHTUNG: ist 0 gross
list<int>::iterator it;			// bidirektionaler Iterator
it = myList.begin();
for (int i = 1; i <= 10; i++)
	*it++ = i*i;				      // Iterator Position NICHT DEFINIERT -> KEIN Einfuegen
```

Dafür werden Insert-Iteratoren (Einfüge-Iteratoren) (spezielle Output-Iteratoren) verwendet:

```c++
list<int> myList;				// Definition List, ACHTUNG: ist 0 gross
insert_iterator< list<int> > myInserter(myList,myList.end());   // Insert-Iterator

for (int i = 1; i <= 5; i++)		// Container mit Qudratzahlen fuellen:
  *myInserter++ = i*i;				// obwohl List 0 gross ist klappt das

cout << "Init. mittels Einfuege-Iterator  mit quadrat. Zahlen:" << endl;
for (list<int>::iterator it = myList.begin(); it != myList.end(); it++)
  cout << *it << endl;

list<int>::iterator it = std::find(myList.begin(),myList.end(),9);    	// 9 finden
insert_iterator< list<int> > aMiddleInserter(myList,it);		// Insert-Iterator
for (int i = 1; i <= 5; i++)			// vor 9 mit i fuellen
  *aMiddleInserter++ = i;

cout << endl << "Einfuegen von zusaetzlichen Zahlen:" << endl;
for (list<int>::iterator it = myList.begin(); it != myList.end(); it++)
  cout << *it << endl;
```

Für diesen Iterator wird automatisch die Member-Funktion insert() aufgerufen wenn eine Zuweisung erfolgt. Hier kann auch gesehen werden wie der Algorithmus *find* lediglich mit Iteratoren verwendet werden kann.

## 9.3 Algorithmen

In Algorithmen wird eine Sammlung von Funktion zur Verfügung gestellt, optimiert für die Arbeit mit den angebotenen Containern: Befüllen, Transformieren, Sortieren, Suchen, gängige Array-Funktionen und Zerlegen von Containertyp-Typen.

- Sortieren (von Container-Strukturen)
  - **sort**: Sortieren eines Containers, als Algorithmus wird zwischen unterschiedlichen Varianten je nach Feld gewählt
- Suchen (in Container-Strukturen)
  - **binary_search**: Binäre Suche in einem sortiertem Container
  - **find**: Suchen eines Elements
  - **lower_bound**: ermitteln des ersten Elements, das größer als eine gegebene Schranke ist
  - **upper_bound**: ermitteln des ersten Elements, das größer als eine gegebene Schranke ist
- Container-Manipulation
  - **reverse**: Umdrehen eines Containers
  - **max_element**: ermitteln des maximalen Wertes in einem Container
  - **min_element**: ermitteln des minimalen Wertes in einem Container
  - **accumulate**: aufsummieren der Elemente eines Containers (Vorgabe Startwert)
  - **count**: zählen von Elementen die einen gegebenen Wert haben
  - **.erase**: Löschen eines Elements an einer gegebenen Position
  - **next_permutation**: Arrangiert die Elemente so um, das die Kombination der Elemente der nächst höheren Anordnung entspricht (1,2,3 -> 1,3,2) 
  - **prev_permutation**: Arrangiert die Elemente so um, das die Kombination der Elemente der nächst niedrigeren Anordnung entspricht (2,1,3 -> 1,3,2) 
  - **distance**: Ermitteln des Indexes eines gegebenen Iterators
- Array-Algorithmen
  - **all_of**: Prüfung ob alle Elemente einer vorzugebenden Bedingung entsprechen
  - **any_of**: Prüfung ob mindestens ein Elemente einer vorzugebenden Bedingung entspricht
  - **none_of**: Prüfung ob kein Element einer vorzugebenden Bedingung entspricht
  - **copy_n**: Tiefe Kopie eines Containers in einen Zweiten
  - **iota**: Füllt aufsteigende Zahlen in einen Container ein beginnend mit einem vorgegebenen

### Allgemein

Für das Verständnis wird hier die *find*-Funktion gezeigt. Sie ermöglicht das Suchen von Elementen in Containern, hier einer Liste:

```c++
list<int>::iterator result = find(myLst.begin(), myLst.end(), 7);
```

Als Parameter wird ein Iterator auf das erste Element und auf das letzte (+1) Element mitgegeben. Auf diese Art kann *find* mit jedem Container arbeiten. Zurückgegeben wird ein Iterator mit der Position des gefundenen Elements oder auf das *end*-Element wenn die Suche nicht erfolgreich ist. Noch allgemeiner kann das mit *auto* geschrieben werden:

```c++
auto result = find(myCont.begin(), myCont.end(), contElem);
```

Zur vereinfachten Schreibweise (gerade wenn kein so allgemeiner/generischer Code gewünscht ist) sind die Algorithmen oft als Member verfügbar:

```c++
auto res = myList.find(7);		// 7 Suchen mit Member-Funktion
```

> Algorithmen sind immer so geschrieben, dass Sie mit jeder Art von Container auf die gleiche Weise zusammenarbeiten können. Also mittels Iteratoren.

### Anpassungen (107)

Da die Algorithmen mit allen Containern zusammenarbeiten können sollen, ist es manchmal notwendig Teile anpassen zu müssen. Um dieses Vorgehen zu erklären wird hier auf das Beispiel einer Sortierung eingegangen:

```c++
sort(myVec.begin(), myVec.end());	// sort(BeginIterator, EndIterator)
```

Wenn *myVec* ein *vector* mit Integer-Werten ist, dann ist die Sortierung trivial. Die Reihenfolge in welcher eine aufsteigende Sortierung zu erfolgen hat ist klar. Nicht eindeutig ist die Sache wenn die *vector*-Elemente Objekte einer Klasse sind. Es könnte eine Klasse *complex* bestehend aus den Membern *m_real* und *m_imag* sein. Die Sortierung könnte dann nach der Größe des Real-Teils oder des Imaginär-Teils sein. Genauso gut kann es auch der Betrag der Zahl sein.

Die Algorithmen versuchen allgemein möglichst ähnliche Schnittstellen zu bedienen, damit kann eine Verallgemeinerung einfacher erfolgen. Für Algorithmen wie *sort* müssen zwangsläufig Elemente eines Containers verglichen werden. Dabei wird nach Möglichkeit immer der < Operator verwendet. Auf Gleichheit kann ja etwa geprüft werden:

```c++
(!(x < y) && !(y < x))		// Nicht Groesser und Nicht Kleiner
```

Der folgende Aufruf verursacht einen Fehler (< Operator für *Complex* nicht definiert):

```c++
class Complex {
  ...
  float r;
  float i;
  ...
}
...
vector<Complex> myVec;
...
sort(myVec.begin, myVec.end());
```

Der Algorithmus kann komplexe Zahlen nicht sortieren weil der < Operator dafür nicht definiert ist.

Wird in der Klasse *Complex* der Operator < definiert:

```c++
bool operator<(Complex c) {
  float abs1 = this->r*this->r + this->i*this->i;
  float abs2 = c->r*c->r + c->i*c->i;
  return abs1 < abs2;
}
```

dann klappt die Sortierung, hier nach der Größe des Absolut-Betrags, der Komplexen Zahl. Auf diese Art kann die Sortierung auch leicht von steigend auf fallend verändert werden.

So kann das Verhalten der angebotenen Algorithmen stark angepasst werden. Auch kann für ein *int*-Feld die Sortierung umgedreht werden. Allerdings gibt der < Operator wenn er sonst wo verwendet wird eventuell nicht erwünschte Ergebnisse.

> Die Arbeit von Algorithmen kann, durch Überladen von speziellen Operatoren (je nach Algorithmus unterschiedlich), beeinflusst werden.

#### Bibliothek

In der Bibliothek sind bereits unterschiedliche Arten von Vergleichen verfügbar. Diese funktionieren allerdings nur für Objekt-Elemente für die der < Operator verfügbar ist. Beispiele (http://www.cplusplus.com/reference/functional/) für diese Funktionsobjekte sind (für *int*-Elemente):

```c++
less<int>				... Vergleich steigend
greater<int>		... Vergleich fallend
```

#### Funktionen

Weil es nicht immer möglich oder erwünscht ist Operatoren einer Klasse für die Arbeitsweise mit einer STL-Funktion zu überladen, kann für manche Funktionen, wie für *sort*, eine *Funktion* mitgegeben werden:

```c++
sort(myVec.begin(),     /* BeginIterator */
     myVec.end(),       /* EndIterator */
     myVecComp);        /* VergleichsFunktion */
```

Für *sort* ist eine Funktion mit 2 Parametern vom Typ der Container-Elemente notwendig mit einem *bool*-Rückgabewert. Die Funktion für das oben skizzierte Beispiel kann so aussehen:

```c++
bool cplxCmp(Complex c1, Complex c2) {
  return (c2 < c1);
}
```

Sie dreht die < Logik um, damit kann in umgekehrter Reihenfolge sortiert werden. Voraussetzung ist, dass wie oben, der < Operator definiert wurde. Damit kann Sortiert werden:

```c++
sort(myVec.begin, myVec.end(), cplxCmp);
```

> Die Arbeit von Algorithmen kann häufig auch durch eigene Funktionen konfiguriert werden.

#### Lambda-Ausdrücke

Gerade für diese Anwendungen wirkt es oft als zu aufwendig eine eigene Funktion zu definieren (an entfernter Stelle im Code) um sie nur einmal für den Vergleich mitzugeben. Für solche Zwecke eignen sich, gerade wenn der Funktionskörper sehr kompakt ist, Lambda-Ausdrücke. Dabei werden komplette Funktionen in einem Ausdruck ausgedrückt, als Struktur:

```c++
[capture](parameter)->ret{body}
```

in der eckigen Klammer (*capture*) können Umgebungsvariable für innerhalb der Funktion sichtbar gemacht werden. In der runden Klammer können der Funktion Parameter mitgegeben werden. Der Pfeil und *ret* geben den Typ des Rückgabewerts an, dieser kann einfach weggelassen werden, wenn aus dem *body* im return-Teil ersichtlich ist um welchen Typen es sich handelt. In *body* ist der Funktionskörper. Wenn der Member *v* von zwei Objekten der Klasse *cls* verglichen werden sollen würde der Lambda-Ausdruck so aussehen:

```c++
[](const cls &o1, const cls &o2){return (o1.v < o2.v);}
```

#### Funktionsobjekte

Der Nachteil von Funktionen ist, dass sie kein Erinnerungsvermögen besitzen. Wird die Funktion durch eine Klasse ersetzt dann können innerhalb des Objekts Member gespeichert werden.

Die letzte Möglichkeit ist, dass anstatt einer Funktion ein Funktionsobjekt mitgegeben wird. Ein Funktionsobjekt (Überladen des () Operators) kann so aussehen:

```c++
class CcplxCmp {
public:
  bool operator()(Complex c1, Complex c2) {
    return (c2 < c1);
  };
};
```

Für den sort-Vergleich wird ein Funktionsobjekt benötigt, dass zwei Elemente des zu sortierenden Containers aufnehmen kann und einen *bool*-Wert zurückgibt.

und der Aufruf:

```c++
sort(myVec.begin(), myVec.end(), CcplxCmp());
```

> Mittels überladenen Funktionsoperatoren in Klassen (Objekte davon werden dann abgekürzt als **Funktor** bezeichnet) kann die Arbeitsweise von Algorithmen eingestellt werden.

Der Vorteil der Funktor-Variante ist, dass dem Objekt Parameter mitgegeben werden können:

```c++
class CcplxCmp {
public:
  CcplxCmp(bool up) : m_up(up) {};
  bool operator()(Complex c1, Complex c2) {
    return (c2 < c1);
  };
  bool m_up;
};
...
sort(myVec.begin(), myVec.end(), CcplxCmp{true}); //  auf-
sort(myVec.begin(), myVec.end(), CcplxCmp{false}); // abwaerts-Sort
```

Als Algorithmen sind eine enorme Anzahl verfügbar und diese wiederum in einer großen Parametervielfalt. Hier wird aus diesem Grund nicht weiter auf spezielle Funktionen eingegangen.

## Hilfsstrukturen

In den Standard-Bibliotheken sind neben den STL-Elementen (Container, Algorithmen und Iteratoren) auch noch weitere hilfreiche Strukturen. In den *Utilities* etwa:

### Pair

Manchmal sollen zwei Werte immer miteinander geführt werden. Wesentlich schneller als mit einer Klasse oder Struktur geht das  mit einem *pair*:

```c++
#include <utility>
...
auto pp = make_pair(myVal, 5);	// pp besteht aus einem myVal-Typ und einem int
std::pair<int, float> p1;			  // p1 besteht aus einem int und einem float
std::pair<int, double> p2(42, 0.123);	// p2 int und double mit Initialisierung
```

Die Typen können beliebig sein. Der Zugriff auf die Werte erfolgt:

```c++
int num = pp.second;	// Lesen des zweiten Werts
float f1 = p1.second;	
p2.first = 4;					// Schreiben des ersten Werts
```

Der Zugriff erfolgt nur über *first*/*second*. Es gibt keine Benennung. *Pair* bietet die Operatoren `<`, `=` und `==` an, wenn sie für die Elemente verfügbar sind (für int gibt's `=`, für eine eigene Klasse evtl. nicht).

> Pair: Einfaches Bündeln zweier Elemente.

### Tuple

Gleich wie in einer Struktur können in einem *Tupel* mehrere Elemente abgelegt werden. Allerdings können die Elemente nicht mittels Bezeichnung sondern nur mittels Nummer (so wie ein Index) zugegriffen werden. Sie eignen sich zum schnellen Packen von Daten unterschiedlichen Typs.

- Definition eines *Tuples* coll mit den Elementen *char*, *int* und *float*

  ```c++
  #include <tuple>
  tuple<char, int, float> coll;
  ```

- Zuweisung mittels *make_tuple*:

  ```c++
  coll = make_tuple('z', 3, 5.4);
  ```

- Zugriff mittels *get()*:

  ```c++
  char z = get<0>(coll);
  int n = get<1>(coll);
  float f = get<2>(coll);
  ```

- Aber auch schreibend:

  ```c++
  get<2>(coll) = 1.3;
  ```

- Anzahl von Elementen mittels *tuple_size*:

  ```c++
  int size = tuple_size<decltype(coll)>::value
  ```

- Vertauschen von zwei Tuples coll1 und coll2 mittels *swap()*:

  ```c++
  coll1.swap(coll2);
  ```

- Entpacken von Tuples mittels *tie()*:

  ```c++
  char z;
  float f;
  tie(z, ignore, f) = coll;	// mittlerer (int) Wert wird nicht verwertet
  ```

> Tuple: Einfaches Bündeln von unterschiedlichen Elementen.

## Referenzen

- cppReferenz
  <https://en.cppreference.com/w/>
  
- Erklärung und Beispiele:

  http://www.ist.tugraz.at/_attach/Publish/Akswt04/STL_Robert_Fritz.pdf

- Kurz und sehr gut:
  https://www.codeproject.com/Articles/563/An-Introductory-STL-tutorial
