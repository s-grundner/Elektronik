# 9 STL - Übungen

Die Übungen sind ein wenig gruppiert (es gibt Überlappungen)

## Cont - *vector*-Stack (093)

Erzeugen Sie eine Stapel-Speicher-Klasse *CStack* zum Ablegen von Integer-Werten unter Verwendung eines Vektors.

main.c

```c++
CStack s;

s.push(1);
s.push(2);
s.push(3);
s.push(4);
s.push(5);
s.push(6);
s.push(7);
s.push(8);
s.push(9);
while (!s.empty()) cout << s.pop() << endl;
```

Die Ausgabe ist 9 .. 1.

## Cont - *set* Einführung

Erstellen Sie eine sortierte List von Schaltjahren seit 1900. Am einfachsten biete sich der Container *set* an. Geben Sie anschließend die Jahreszahlen in der Konsole aus:

```c++
set<int> mySet;		// wird automatisch aufwaerts sortiert
mySet.insert(1);
mySet.insert(5);
mySet.insert(10);
```

Ändern Sie das Beispiel so ab, dass die Jahreszahlen fallend sortiert sind, das kann im Template-Parameter mit angegeben werden:

```c++
set<int, greater<>> mySet2;	// wird automatisch abwaerts sortiert
```

## Cont - *set* Einführung (094)

Definition eines **set** Containers der lediglich int-Werte beinhaltet. Es werden doppelte Werte eingetragen (insert) und anschließend wird der komplette Inhalt ausgegeben:

```c++
#include <set>
...
set<int> mySet;
mySet.insert(5);
mySet.insert(4);
mySet.insert(2);
mySet.insert(3);
mySet.insert(1);
mySet.insert(5);	// doppelt -> ueberschreiben
mySet.insert(4);	// doppelt -> ueberschreiben
...
for(set<int>::iterator it = mySet.begin(); it != mySet.end(); it++)
  cout << *it << " ";
...
cout << endl << "Element 3:" << *(mySet.find(3)) << endl;
```

Die Ausgabe (doppelte Werte gibt's nicht in set - sie werden nicht eingetragen) erfolgt sortiert:

```
1 2 3 4 5
Element 3:3
```

Verwenden Sie anstatt eines *set* ein *multiset*.

## Cont - *set* mit spezieller Sortierung (104)

Laut Referenz (<https://de.cppreference.com/w/cpp/container/set>) ist Set so definiert:

```c++
template<
    class Key,
    class Compare = std::less<Key>,
    class Allocator = std::allocator<Key>
> class set;
```

Das bedeutet der *Compare*-Typ kann definiert werden. Er ist offensichtlich so definiert, dass er auf die *less*-Klasse zugreift. Darin gibt es eine vergleichende Funktion die *true* zurückgibt, wenn ein erstes *Set*-Element kleiner als ein zweites *Set*-Element ist. (*allocator* gibt an wie Speicher alloziert wird, dieser wird nicht überschrieben)

Schreiben Sie eine Funktion die *int-Set*-Elemente so sortiert, dass geradzahlige Elemente vor ungeradzahligen Elementen liegen. Innerhalt der geradzahligen bzw. ungeradzahligen Elemente wird von klein nach groß sortiert. Also liefert:

```c++
set<int,cmp> mySet;
mySet.insert(10);
mySet.insert(13);
mySet.insert(16);
mySet.insert(19);
mySet.insert(11);
mySet.insert(14);
mySet.insert(17);
mySet.insert(20);
mySet.insert(12);
mySet.insert(15);

for(auto &elem:mySet) {
  cout << elem << " ";
}
```

die Ausgabe:

```c++
10 12 14 16 20 11 13 15 17 19
```

## Cont - *map* Einführung

Die Elemente einer *map* sind ein Schlüssel/Wert-Paar. Eine *map* ist nach dem Schlüssel sortiert. Definition:

```c++
map<int, string> myMap;
```

Der erste Wert (hier ein *int*) ist der Schlüsseltyp, der zweite der Typ des zu speichernden Werts (hier *string*). Auch für die Sortierung einer *map* kann ein Vergleich mit definiert werden. Dazu kann der Funktionsoperator überladen werden. Er muss zwei Werte vom Typ des Schlüssels aufnehmen und einen *bool*-Wert zurückgeben:

```c++
class comp {
public:
  bool operator()(const char* s1, const char* s2) const {
    return strcmp(s1, s2) < 0;
  }
};
```

Damit kann er für eine *map*-Definition verwendet werden, Sortiert wird hier in der *map* nach dem c-String-Schlüssel:

```c++
...
map<const char*, int, comp> myMap;
...
myMap["abc"] = 123;
```

## Cont - *map* Versicherung (095)

Hier wird ein *map* von Versicherungsnummern/Personen erzeugt. Die Daten werden nicht sortiert eingetragen.

```c++
#include <map>
...
map<int, string> versDaten;
versDaten[7] = "Huber";
versDaten[1] = "Maier";
versDaten[8] = "Albert";
versDaten[1] = "Mueller";		// 1 zum 2ten Mal -> update
versDaten[9] = "Mueller";		// Mueller doppelt -> kein Problem
...
for (map<int,string>::iterator it = versDaten.begin(); it != versDaten.end(); it++)
  cout << it->first << "\t" << it->second << endl;
...
cout << "Versicherter Nummer 8: " << versDaten.find(8)->second << endl;
cout << "Versicherter Nummer 7: " << versDaten[7] << endl;
```

Die Ausgabe erfolgt sortiert nach dem ersten Wert, dieser ist eindeutig und darf/kann nur einmal vorkommen, der zweite Wert wird geändert. Der zweite Wert ist nicht eindeutig, er darf mehrmals vorkommen:

```
1       Mueller
7       Huber
8       Albert
9       Mueller
Versicherter Nummer 8: Albert
Versicherter Nummer 7: Huber

```

## Cont - *multimap* Einführung (096)

Hier wird ein *multimap* von Versicherungsnummern/Personen erzeugt (Kopie letztes Beispiel). Die Daten werden nicht sortiert und mit doppeltem Schlüssel eingetragen.

```c++
#include <map>
...
multimap<int, string> versDaten;

versDaten.insert(make_pair(7, "Huber"));
versDaten.insert(make_pair(1, "Maier"));
versDaten.insert(make_pair(8, "Albert"));
versDaten.insert(make_pair(1, "Mueller"));
versDaten.insert(make_pair(9, "Mueller"));

for (map<int,string>::iterator it = versDaten.begin(); it != versDaten.end(); it++)
  cout << it->first << "\t" << it->second << endl;

cout << "Versicherter Nummer 1: " << versDaten.find(1)->second << endl;
```

Die Ausgabe erfolgt sortiert nach dem ersten Wert, dieser ist NICHT eindeutig und darf/kann mehrmals vorkommen:

```
1       Maier
1       Mueller
7       Huber
8       Albert
9       Mueller
Versicherter Nummer 1: Maier
```

## Cont - Base-Class-Pointer-Typ

Objekte unterschiedlicher Klassen können in einem *vector* gemeinsam gespeichert werden, wenn sie eine gemeinsame Basisklasse haben.

Beispiel: die Klassen *CAngestellte* und *CArbeiter* haben beide die Basisklasse *CPerson*. Im *vector*:

```c++
vector<CPerson> ma;
```

können Objekte beider Klassen gespeichert werden. Um Objektmember polymorph verwenden zu können muss ein Base-Class-Pointer abgelegt werden:

```c++
vector<CPerson*> ma;
```

## Cont - *priority_queue* (097)

Ein *priority_queue*-Container legt im einfachsten Fall Elemente sortiert ab. Gereiht werden die größten Einträge an erster Stelle.

```c++
#include <queue>
...
priority_queue<int> myQueue;
myQueue.push(7);
myQueue.push(2);
myQueue.push(4);
myQueue.push(1);
myQueue.push(1);
myQueue.push(5);

while (!myQueue.empty()) {
  cout << myQueue.top() << " ";		// lesen aus der queue
  myQueue.pop();					// loeschen aus der queue
}
```

liefert:

```
7 5 4 2 1 1
```

## Cont - Abweichende Priorisierung *priority_queue* (098)

Zum Verändern der Reihung kann eine Vergleichs-Klasse mit angegeben werden. Wenn Objekte einer Klasse Elemente der Queue sind dann ist das in jedem Fall notwendig, weil ja ansonsten keine Reihung erfolgen kann.

```c++
class CmyCls {
public:
  int m_p1;
  int m_p2;
  CmyCls(int a, int b):m_p1(a), m_p2(b){};
};

class MyClsCmp {
public:
  bool operator()(CmyCls& p1, CmyCls& p2) {
    if (p1.m_p1 < p2.m_p1) return true;	// Vergleich eines relevanten Members ...
    return false;
  };
};

int main()
{
  // Elemente: CmyCls-Objekte
  // Container: vector (prio_queue ist ja Adapter)
  // MyClsCmp: Vergleichsklasse
  priority_queue<CmyCls, vector<CmyCls>, MyClsCmp> myQueue;
  myQueue.push(CmyCls(100,11));
  myQueue.push(CmyCls(3,12));
  myQueue.push(CmyCls(6,13));
  myQueue.push(CmyCls(2,14));
  myQueue.push(CmyCls(5,15));

  while (!myQueue.empty()) {
    cout << myQueue.top().m_p2 << " ";
    myQueue.pop();
  }
  return 0;
}
```

liefert (sortiert/priorisiert nach dem nicht angezeigten Wert):

```
11 13 15 12 14
```

## Algo - sort

Mit *sort* können Strukturen sortiert werden:

```c++
#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    std::vector<int> myVec = {1, 5, 2, 8, 3, 7, 4, 6};

    for(auto elem:myVec)   std::cout << elem << " ";
    std::cout << std::endl;

    sort(myVec.begin(), myVec.end());

    for(auto elem:myVec)  std::cout << elem << " ";
    std::cout << std::endl;

    return 0;
}
```

Sortiert werden die Elemente, die durch die Iteratoren *myVec.begin()* und *myVec.end()* begrenzt werden.

Soll in umgekehrte Richtung sortiert werden, dann kann eine Funktion mitgegeben werden:

```c++
bool vergl(const int &a, const int &b) {
    return a < b;
}
...
sort(myVec.begin(), myVec.end(), func);
```

Diese Schreibweise kann mittels *Lambda*-Ausdrücken abgekürzt werden:

```c++
sort(myVec.begin(), myVec.end(),
     [](const int &a, const int &b)->bool{ return a<b; });
```

der Teil *->bool* darf weggelassen werden, durch die *return*-Anweisung ist der Rückgabewert definiert.

## Algo - binary_search/lower_bound

Mit *binary_search* kann bestimmt werden ob ein Element existiert (Feld muss sortiert sein), mit *lower_bound* das erste Element, dass größer als eine Schranke ist:

```c++
bool vergl(char a, char b) {
  if (a >= 'a' && a <= 'z') a = a-'a'+'A';	// Klein- ->Grossbuchstaben
  if (b >= 'a' && b <= 'z') b = b-'a'+'A';	// Klein- ->Grossbuchstaben
  return (a < b);
}
...
std::deque<char> myDeq = {'a', 'B', 'c', 'D', 'e', 'F', 'g', 'H'};

const char val = 'C';
if (binary_search(myDeq.begin(), myDeq.end(),     val,     vergl))
  std::cout << *lower_bound(myDeq.begin(), myDeq.end(),    val,     vergl) << std::endl;
```

hier wird mittels *binary_search* gesucht ob ein *c* in *myDeq* vorhanden ist. Wenn die Suche erfolgreich ist, dann wird der Iterator ermittelt und der Wert ausgegeben.

## Algo - *find_if* Einführung

*find_if* bietet zusätzlich die Möglichkeit eine Bedingung (ohne Parameter) für die Suche mit anzugeben. Etwa wenn in einer Liste nur Zahlen größer einem bestimmten Wert gefunden werden sollen. Hier ist *aList* eine Liste von Jahreszahlen und es wird nach dem ersten Schaltjahr gesucht:

```c++
struct isSchaltjahr {
  bool operator()(unsigned int year) const {
    if (0 == year % 400) return true;
    if (0 == year % 100) return false;
    if (0 == year % 4) return true;
    return false;
  }
};
...
list<int>::iterator firstSchJ = find_if(aList.begin(), aList.end(), isSchaltjahr());
```

## Algo - *find_if* Nummer 12

In einer *int*-Liste soll ein Element gesucht werden, dass größer als 12 ist. Als Funktion eignet sich *find_if*:

```c++
find_if(BeginIterator, EndIterator, BedingungFunktor)
```

Es wird in einem beliebigen Container von Begin nach End gesucht unter Prüfung der angegebenen Bedingung (*Funktor*).

```c++
class biggerThan {
  public:
    const int testValue;
    biggerThan(int x) : testValue(x) { }

    bool operator()(int val) const {
        return val > testValue;
    }
};

list<int>::iterator firstBig = find_if(aList.begin(), aList.end(), biggerThan(12))
```

Hier wird der *biggerThan*-Klasse im Konstruktor eine Zahl mitgegeben, wenn die Suche dann erfolgt wird mittels *Funktor*/ () Operator mit dieser Zahl verglichen.

## Algo - *for_each* (108)

Manche Algorithmen erlauben Funktionen als Argumente, hier zum Beispiel die *for_each*-Funktion:

```c++
void printElement(int value) {
  std::cout << "The list contains " << value << std::endl;
}

int main() {
  std::list<int> aList;
  ...
  std::for_each(aList.begin(), aList.end(), printElement);
}
```

Die Funktion arbeiten wieder mit einem Beginn- und End-Iterator und einer Funktion (oder *Funktor*) der bei jeder Wiederholung ausgeführt wird.

Beispiel mit einem *Funktor*, hier werden nur die geradzahligen Werte ausgegeben:

```c++
class CEven {
public:
  void operator()(int& x) {
    if (!(x%2))
      cout << x << " ";
  };
};

int main() {
  vector<int> myVec;
  myVec.push_back(1);
  myVec.push_back(2);
  myVec.push_back(3);
  myVec.push_back(4);
  myVec.push_back(5);
  myVec.push_back(6);

  for_each(myVec.begin(), myVec.end(), CEven());

  return 0;
}
```

Ab *C++11* ist eine wesentlich attraktivere Variante verfügbar (nicht-STL):

```c++
for(const int &elem : myList) { ... }
```

Damit wird aus einer Auflistung (*int*-Liste *myList*) von Elementen in jedem Durchlauf ein Element geliefert (hier eben *int*). Diese Konstruktion funktioniert für sämtliche iterative Listen die einen Iterator mit *.begin()* und *.end()* haben (also auch eigene Klassen).

## Algo - *find* (109)

In einem String-*vector* ist ein String zu suchen:

```c++
int main() {
  vector<string> myStrings;
  myStrings.push_back("Hallo");
  myStrings.push_back("wie");
  myStrings.push_back("geht's?");

  auto wo = find(myStrings.begin(), myStrings.end(), "wie");

  cout << wo->m_str;

  return 0;
}
```

Die Ausgabe liefert das gefundene *wie*. Wen die Liste nicht nur aus Elementen mit einfachen Datentypen besteht, dann funktioniert die Suche nicht direkt. Auch für Strings kann gewünscht sein, dass gefunden wird, unabhängig von der Groß-/Kleinschreibung. Dazu werden die Elemente in eine eigene Klasse *CItem* gepackt:

```c++
class CItem {
public:
  string m_str;
  CItem(string str):m_str(str){};
};

int main() {
  vector<CItem> myStrings;
  myStrings.push_back(CItem("Hallo"));
  myStrings.push_back(CItem("wie"));
  myStrings.push_back(CItem("geht's?"));

  auto wo = find(myStrings.begin(), myStrings.end(), "wie");

  cout << wo->m_str;

  return 0;
}
```

Dadurch wird eine Fehlermeldung ausgegeben: der == Operator ist für *CItem* nicht definiert. Es muss also der == Operator für *CItem* überladen werden. In *CItem* wird also der == Operator überladen:

```c++
bool operator==(const string &s2) {
  return (this->m_str == s2);
}
```

Damit ist die Funktion die Gleiche wie zuvor. Um Unabhängig von der Groß-/Kleinschreibung zu sein muss in die entsprechende Logik in den überladenen Operator eingebaut werden.

## Algo - *binary_search*

Wenn eine Liste schon sortiert ist (*set*, *map*, *priority_queue*), dann ist binäres Suchen wesentlich effizienter als sequenzielles Suchen. Diese Algorithmus-Suche gibt es mit unterschiedlichen Parametern, wir wollen wieder (siehe *find*) in einer Liste von Wörtern ein Wort suchen unabhängig von der Groß-/Kleinschreibung:

```c++
 auto res = std::binary_search(woerter.begin(), woerter.end(), "HaLlO", praed);
```

(*res* liefert nur *true*/*false*) Der letzte Parameter gibt eine Funktion für die Bedingung (Funktion oder *Funktor*) an, für Groß-/Kleinschreibung zum Beispiel:

```c++
bool praed(const string & ms1,const string & ms2) {
  string s1(ms1);
  for (auto & c: s1) c = toupper(c);
  string s2(ms2);
  for (auto & c: s2) c = toupper(c);
  if (s1.compare(s2) < 0) return true;
  return false;
}
```

Wenn lediglich geprüft werden soll ob ein Wort in der Liste vorkommt genügt dies Lösung. Wenn allerdings etwa durch die Lösungen gegangen werden soll, wenn etwa durch alle Personen einer Mitarbeiterliste mit einem bestimmten Namen durchgegangen werden soll, dann kann das erste Suchergebnis mit der Funktion *lower_bound* gefunden werden. Das letzte gefundene Element kann mit *upper_bound* ermittelt werden.

## Algo - *Transform* (Unär)

In Containern ist es oftmals notwendig Operationen mit allen Elementen auszuführen. Dafür kann die *transform*-Funktion (aus *\<algorithm\>*).

Gegeben ist eine Inkrement-Funktion:

```c++
int inc(int num) {
  return (num + 1);
} 
```

und ein einfaches Array:

```c++
int myArr[] = {1, 2, 3, 4, 5}; 
int len = sizeof(myArr)/sizeof(myArr[0]);
```

Zum Addieren von 1 zu jedem Element des Arrays mittels *transform*:

```c++
std::transform(myArr, myArr + len, myArr, inc);
```

Die Parameter dieser Funktion:

- Iterator auf das erste Quellelement (*myArr* ist ein Pointer)
- Iterator auf das letzte Quellelement (+1)
- Iterator auf das Zielelement (hier wird ins gleiche Feld geschrieben)
- Funktion die auf jedes Element ausgeführt wird. Diese Funktion muss unär sein - als genau einen Aufrufparameter haben, und der muss auf das Element des Felds passen

## Algo - *Transform* Binär

Es gibt die *transform* Funktion auch für binäre Operationen (Operationen mit 2 Operanten) . Im folgenden Beispiel sollen die Elemente von zwei Arrays miteinander addiert werden:

```c++
int myArr1[] = {1, 2, 3, 4}; 
int myArr2[] = {5, 6, 7, 8}; 
int len = sizeof(myArr1)/sizeof(myArr1[0]); 
int myArr[len];
```

Die Addition wieder mittels *transform*:

```c++
std::transform(myArr1, myArr1 + len, myArr2, myArr, plus<int>());
```

Hier hat die Funktion die Parameter wie im vorherigen Beispiel mit zusätzlich einem weiteren Iterator für den Beginn des zweiten Arrays. Die Funktion muss hier binär sein, also zwei Elemente als Parameter aufnehmen.

Bedingung: das zweite Array muss gleich viele Elemente für die Verarbeitung haben wie das Erste.

## Algo - Selection-Sort (009)

Sortieren Sie einen *vector* mit Personen nach dem Alter mittels *Selection-Sort*.

- Erstellen Sie eine Klasse *CPerson* mit den Membern *m_name*, *m_alter*
- Leiten Sie die Klasse *CAngestellte* von der Klasse *CPerson* ab
- Leiten Sie ebenfalls die Klasse *CArbeiter* von der Klasse *CPerson* ab
- Erstellen Sie die Member-Methoden *toString()*. Sie sollen eine Ausgabe der Form "Ang: Mueller Josef, 40" erstellen (Prefix: für Angestellte *Ang*, für Arbeiter *Arb*)
- Initialisieren Sie einige Objekte und fügen Sie diese in den vector ein (mittels Base-class-pointer)
- Sortieren Sie *vector* mittels eigener *Selection-Sort*-Funktion
- Stellen Sie sicher, dass bei Programmende sämtliche reservierten Speicherbereiche freigegeben wurden:
  - Löschen der Elemente aus der Liste aber auch:
  - Löschen der Elemente (Objekte) selber (sind ja nur als Pointer in der Liste)

main.cpp:

```c++
void selSort(vector<CPerson *> &pers);
void ausgabe(vector<CPerson *> pers);
void loeschen(vector<CPerson *> &pers);

int main()
{
  vector<CPerson *> personen;   // Base-Class-Pointer

  personen.push_back(new CAngestellter("Mueller Josef", 40));
  personen.push_back(new CAngestellter("Hofer Nikolaus", 22));
  personen.push_back(new CAngestellter("Maier Michael", 57));
  personen.push_back(new CArbeiter("Meister Bob", 35));
  personen.push_back(new CArbeiter("Berger Heinz", 20));

  cout << endl << " -unsortiert------------------------------" << endl;
  ausgabe(personen);

  selSort(personen);
  cout << endl << " -sortiert-nach-Alter---------------------" << endl;
  ausgabe(personen);

  leeren(personen);
  personen.clear();

  cout << personen.size();

  return 0;
}
```

## It - Einführung

STL-Iteratoren sollen es ermöglichen sämtliche Container-Objekte auf eine möglichst gleiche Art behandeln zu können. Ein einfaches Beispiel (es gibt viele Iterator-Funktionen):

```c++
#include<iostream> 
#include<iterator>
#include<vector>
using namespace std; 
int main() 
{ 
  vector<int> ar = { 1, 2, 3, 4, 5 }; 
      
  // Definition eines Iterators auf einen vector 
  vector<int>::iterator ptr; 
      
  // Anzeige des vectors mittels begin() und end() 
  for (ptr = ar.begin(); ptr < ar.end(); ptr++) 
    cout << *ptr << " "; 
      
  return 0;     
} 
```

hier wird in der Schleife nicht auf *ar* zugegriffen, sondern nur auf den Iterator *ptr*.

## It - Eigener Iterator (070)

In diesem Beispiel wird eine Suchfunktion *find* für ein klassisches *int*-Array verwendet.

1. Dabei wird ein eigener Iterator (einfacher Zeiger auf ein Array-Element) verwendet:

   ```c++
   #include <iostream>
   using namespace std;
   
   typedef const int *IteratorType; // Iterator als Zeiger
   
   IteratorType find(IteratorType begin, IteratorType end, const int& Value);
   
   int main() {
     const int ANZAHL = 100;
     int myContainer[ANZAHL];
     IteratorType begin = myContainer; // Zeiger auf Anfang
     IteratorType end = myContainer + ANZAHL; // Zeiger auf Ende+1
   
     for(int i = 0; i < ANZAHL; ++i) { // Conainer fuellen
       myContainer[i] = 2 * i;
     }
     int zahl = 18;	// gesucht wird 18
     
     IteratorType position = find(begin, end, zahl); // Aufruf mit Iteratoren
     
     if (position != end) {
       cout << "gefunden an Position " << (position - begin) << endl;  
     }
   }
   
   IteratorType find(IteratorType begin, IteratorType end, const int& Value) {
     while((begin != end)  &&  (*begin != Value))
       begin++;
     return begin;
   }
   ```

   Bemerkenswert:

   - der Suchalgorithmus kommt völlig ohne Kenntnis des Containers (*int*-Array) aus. Es wird lediglich ein Begin- und ein End-Pointer mitgegeben.
   - Voraussetzung: für die Iteratoren müssen die Operatoren *++*, *!=* und \* so definiert sein, dass sie auf das nächste Element wechseln, zwei Elemente vergleichen und Dereferenzieren können. Dann funktioniert dieser sequenzielle Suchalgorithmus für jede Containerorganisation.

2. Ändern Sie im nächsten Schritt die *find* Funktion so ab, dass sie für alle Datentypen funktioniert:

   ```
   template<typename Iterator, typename T>
   IteratorType find(const Iterator &begin, const Iterator &end, const T& Value) {
     while((begin != end)    &&    (∗begin != Value))
       begin++;
     return begin;
   }
   ```

   und den Aufruf der Funktion:
   `IteratorType position = find<const int ∗,int>(begin, end, zahl);`

3. Das obige Programm wird nun abgeändert, sodass anstatt des eigenen *int*-Containers ein *vector* verwendet wird und der entsprechende vordefinierte Iterator:

   ```c++
   #include <vector>
   #include <algorithm>	// fuer find()
   ...
   typedef vector<int>::const_iterator IteratorType;	// Iterator
   ...
   vector<int> myContainer(ANZAHL); // Container definieren
   ...
   IteratorType position = std::find(myContainer.begin(), myContainer.end(), zahl);
   ...
   cout << "gefunden an Position " << (position - myContainer.begin()) << endl;
   ```

Erkenntnis: auf diese Art kann eine eigene Funktion mit den STL-Containern über Iteratoren zusammenarbeiten. Mit Templates kann die Funktion sehr allgemein (generische Programmierung) erstellt werden.

## It - Input-Iterator (072)

Input-Iteratoren können nur in *Single-Pass*-Algorithmen (einmaliger Durchlauf) verwendet werden. Mit ihnen kann nur Lesend zugegriffen werden, das heißt ein Schreiben auf diesen Operator verursacht einen Fehler. Operatoren:

```
A == B		// Gleichheit
A != B		// Ungleichheit
*A			// Dereferenzierung
A->m		// Zugriff auf Element m
A++			// Inkrement -> zeigt aufs Folgeelement, auch ++A ist moeglich
```

Für was kann ein Input-Iterator verwendet werden? Mit *std::find* kann in einem Container gesucht werden, dabei wird nur gelesen, damit funktioniert er mit dem Input-Iterator.

Beispielhaft hier eine mögliche *Find*-Funktion:

```c++
template <typename InputIterator, typename T>
InputIterator find(InputIterator first, InputIterator last, const T& value) {
  while (first != last && *first != value) 
    first++;
  return first;
}
```

Damit dieser Algorithmus funktioniert muss `++` das folgende Element liefern, `*` dereferenzieren, `!=` Ungleichheit prüfen und `last` ein Iterator vergleichbar mit `first` sein.

- Einfacher Zeiger als Iterator:

  ```c++
  int dta[33];
  int *loc = ::find(dta, dta+33, 3);  // :: fuer eigens find ansatt algorithm-find
  ```

  oder als Iterator (mit `const` können die Werte auf welche die Zeiger zeigen nicht verändert werden):

  ```c++
  const int* first = dta;
  const int* last  = dta + 33;
  const int* loc = ::find(first, last, 7);
  ```

- Container-Iteratoren:
  Jeder Container aus der STL stellt einen Iterator zur Verfügung (die Möglichkeiten des Input-Iterators sind am Stärksten von allen eingeschränkt, daher funktioniert Jeder):

  ```c++
  std::vector<int>::iterator loc = std::find(myVec.begin(), myVec.end(), 3); 
  ```

## It - Output-Iterator (074)

Ein Output-Iterator wird verwendet um Daten sequentiell auszugeben. Beispielhaft hier ein Kopiervorgang:

```c++
template <typename InputIterator, typename OutputIterator>
OutputIterator copy(InputIterator first, InputIterator last, OutputIterator result) {
  while (first != last) 
    *result++ = *first++;
  return result;
}
```

Der Output-Iterator ermöglicht das Schreiben. Vergleichende Operatoren (`==`,`!=`) gibt es nicht, damit müsste ja gelesen werden.

- Einfacher Zeiger als Iterator:

  ```c++
  int dta[33];
  int newDta[33];
  ::copy(dta, dta+33, newDta);
  ```

- Container-Iteratoren:

  ```c++
  std::copy(dta, dta+100, newDta.begin());
  ```

- Output-Stream-Iterator. Beispiel:

  ```c++
  #include <iostream>
  #include <fstream>
  #include <iterator>
  #include <string>
  using namespace std;
  int main() {
    ifstream fin("input.txt");			// Eingabestrom fin
    ofstream fout("output.txt");		// Ausgabestrom fout
      
    istream_iterator<string> inIt(fin), end;
    ostream_iterator<string> outIt(fout,"\n");
    while (inIt != end)
      *outIt++ = *inIt++;
  }
  ```

  
  Damit wird aus der *input.txt*-Datei in die *output.txt*-Datei kopiert.

## It - Forward-Iterator (075)

Ein Forward-Iterator ist eine Verschmelzung der Input-/Output-Iteratoren. Der Zugriff ist sowohl Lesend als auch Schreibend. Es kann sich auch hier nur vorwärts durch den Container bewegt werden.

```
template <typename FIterator, typename T>
void replace(FIterator first, FIterator last, const T& old_value, const T& new_value) {
  while (first != last) {
    if (*first == old_value) 
      *first = new_value;
    ++first;
  }
}
```

Aufruf der analogen STL-Funktion (Ersetzen des Int 7 mit int 11 im int-Vektor):

```
std::replace(myVector.begin(), myVector.end(), 7, 11);
```
(Ein Forward-Iterator kann auch mittels Pointer realisiert werden)

## It - Bidirectional-Iterator (076)

Die Operatoren sind gleich wie beim Forward-Iterator. Zusätzlich gibt es den `--`-Operator mit dem sich Rückwärts bewegt werden kann.

```c++
template <class BidirectionalIterator, class OutputIterator>
OutputIterator reverse_copy(BidIterator first, BidIterator last, OutputIterator result) {
  while (first != last) 
    *result++ = *--last;
  return result;
}
```

Aufruf der analogen STL-Funktion:

```c++
std::list<int> myList;
 ....
std::vector<int> myVector(myList.size());
std::reverse_copy(myList.begin(), myList.end(), myVector.begin() );
```

Füllen Sie die Liste mit Ganzzahlen von 0 .. 32 und zeigen Sie die Elemente der Liste und des *vector*.

## It - Random-Access-Iterator (077)

Für manche Algorithmen sind Iteratoren notwendig für die nicht nur vor- oder rückwärts sequentiell zugegriffen werden kann sondern auch in größeren Schritten, ähnlich `arr[i+10]`. Auch eine Addition/Subtraktion von Iteratoren um die Anzahl der dazwischenliegenden Elemente zu ermitteln.

Zum Beispiel für ein Umdrehen eines Containerinhaltes:

```c++
template <typename RandomAccessIterator>
void mixup(RandomAccessIterator first, RandomAccessIterator last) {
  while (first < last) {
    std::iter_swap(first, first + randomInteger(last - first));
    ++first;
  }
}
```

Der verwendete Zufallsgenerator:

```c++
// return random integer greater than or equal to 0 and less than n
unsigned int randomInteger(unsigned int n) {
  return std::rand() % n;
}
```

Erstellen Sie einen *myVect*-*vector* mit 33 Elementen (0..32), führen Sie damit die *mixup*-Routine aus und geben Sie den *vector* davor und danach aus.

## It - Tastatur Einlesen (115)

Schreiben Sie ein Programm, das von der Tastatur eine Folge von Gleitkomma-Zahlen in einen Vektor-Container einliest und danach alle positiven Zahlen (in umgekehrter Reihenfolge) ausgibt. Möglicher Aufbau:

- Erstellen eines *istream_iterator* und verknüpfen mit dem Tastatureingabe-Streams *cin*
- Erstellen eines *vector* und Schreiben des eingelesenen Werts (es werden bewusst sämtliche eingelesene Werte in den *vector* geschoben)
- Sortieren des *vector* sodass positive Zahlen am Anfang des *vector*s.
- Suchen des Iterators an welchem die erste nicht positive Zahl zu finden ist
- Sortieren des Anfang-Teils des *vector*s bis zum Iterator mit der ersten nicht positiven Zahl
- Ausgabe der positiven Werte

## It - String Maniplation (116)

Schreiben Sie ein Programm, das von einer Textdatei *input.txt* alle Wörter (Strings) einliest und in einen Listen-Container abspeichert. Dann sollen alle großgeschriebenen Wörter des Containers durch entsprechend kleingeschriebene ersetzt werden.
Anschließend soll der Container-Inhalt auf eine Datei *output.txt* geschrieben werden. Die Reihenfolge der Wörter ist beizubehalten. Sie können für das Einlesen und das Ausgeben geeignete Stream-Iteratoren verwenden.

- Erstellen eines *istream-iterator* und Verknüpfen mit einem File-Stream-Iterator zum Lesen
- Erstellen einer *list* und schreiben der Wörter aus der Datei in die Liste (*push_back*)
- Durch die Liste kann mit einer *foreach* Schleife gegangen werden und dabei wird im String (ebenfalls ein Container) der erste Buchstabe (*.begin()*) mittels *tolower()* auf Kleinbuchstabe gesetzt
- Erstellen eines *ostream-iterator* und Verknüpfen mit einem File-Stream-Iterator zum Schreiben. 

## It - Einlesen einer Datei

Das einlesen einer Datei kann am elegantesten mittels Iteratoren erfolgen:

```c++
ifstream inFile("c:/temp/in.txt", ios::in);
vector<string> myContent((istream_iterator<string>(inFile)), istream_iterator<string>());
inFile.close();
```

in diesem Beispiel werden die Worte direkt als *string* in einen *vector* gelesen. Gleich funktioniert das natürlich auch in andere Container (*string*...) oder als *char*.

## It - Datei Kopieren (Stream-Iterator) (078)

Lesen Sie eine Text-Datei *input.txt* ein, Sortieren Sie die Elemente (Zeilen) und geben Sie den Text in eine Datei *output.txt* wieder aus.

Datei Einlesen, Sortieren und wieder als Datei schreiben:

```c++
#include <iostream>
#include <fstream>
#include <iterator>
#include <string>
#include <list>
#include <algorithm>

int main() {

  ...
  ifstream fin("c:\\temp\\input.txt");
  istream_iterator<string> inIt(fin), end;	// Eingabestrom-Iterator
  ..
    
  while(inIt != end) {		// Kopiere Eingabestrom nach Vector aList
    aList.push_back(*inIt);
    inIt++;
  }
  ...
  aList.sort();
  copy(aList.begin(),aList.end(),outIt);
}
```

## Klein/Groß (079,080)

Schreiben Sie ein Programm, das von einer Textdatei *input.txt* alle Wörter (Strings) einliest und in einen *vector*-Container kopiert. Verwenden Sie dazu einen Stream-Iterator.
Dann sollen alle großgeschriebenen Wörter des Containers durch entsprechend kleingeschriebene ersetzt werden. Verwenden Sie dazu *transform*. Anschließend soll der Container-Inhalt in eine Datei *output.txt* geschrieben werden. Die Reihenfolge der Wörter ist beizubehalten. Verwenden Sie für das Einlesen und das Ausgeben geeignete Stream-Iteratoren.

## Personenregister (105)

Personen werden in einer einfachen Klasse dargestellt:

```c++
class person {
public:
  person(int alter, string nname):m_alter(alter),m_nname(nname){};
private:
  int m_alter;
  string m_nname;
};
```

Mit dem Aufruf in der *main*-Funktion:

```c++
int main() {
  set<person> persReg;
  persReg.insert(person(30,string("Jim")));
  persReg.insert(person(31,string("Bob")));
  persReg.insert(person(29,string("Bill")));

  for(auto &elem:persReg) {
    cout << elem << " ";
  }
  return 0;
}
```

werden die Namen der Personen sortiert nach ihrem Alter ausgegeben:

```
Bill Jim Bob
```

Erweitern Sie die *person*-Klasse entsprechend:

- mit einer Überladung für den *<<*-Operator für die Ausgabe des Namens
- mit einer Überladung für den *<*-Operator für die Einfüge-Operation. Ein *set* ist nach den Elementen sortiert. Um die Position zu bestimmen wird der *<*-Operator verwendet. Mittels geeigneter Überladung wird die Reihung festgelegt (`bool operator<(const person b) const`).
- Alternativ könnte eine Klasse mit einem Vergleichs-Funktor eingebaut werden (set\<person,cmp\>) so wie im letzten Beispiel.

## Rechtschreibprüfung (101)

(Quelle Skriptum fh-konstanz)

Schreiben Sie ein Programm, das jedes Wort *w* einer Textdatei *input.txt* auf korrekte Rechtschreibung prüft, indem festgestellt wird, ob *w* in einem Wörterbuch *woerterBuch.txt* vorkommt. Falsch geschriebene Wörter werden in die Datei *output.txt* abgespeichert.

- Einlesen von *woerterBuch.txt* am Besten in ein *set*. Das wird automatisch sortiert und bietet einen effizienten Suchalgorithmus.
- Nachdem lediglich eine Rechtschreib- und keine Gramatikprüfung gesucht ist, spielt die Groß-/Kleinschreibung keine Rolle.

Einlesen aus der Wörterbuch-Datei und Ablegen im *set* (alphabetisch sortiert):

```c++
ifstream woerterbuch(wbPfad);
istream_iterator<string> inIt(woerterbuch), end;
while (inIt != end)
  wortListe.insert({*inIt++});
```

Das Suchen von Wörtern im Wörterbuch erfolgt mit der *find*-Methode. Um die Funktion`find()` so anzupassen, dass Groß-/Kleinschreibung keine Rolle spielt, wird der *<* Operator überladen:

```c++
struct MyStr { string val; };

bool operator<(const MyStr & p1, const MyStr & p2) {
  string s1(p1.val);
  for (auto & c: s1) c = toupper(c);
  string s2(p2.val);
  for (auto & c: s2) c = toupper(c);
  return s1.compare(s2);
}
...
set<MyStr> wortListe;
wortListe.insert({"Abt"});	// Einfuegen von "Abt"
```

Für die *find*-Funktion wird der *<* Operator verwendet, daher muss dieser Überladen werden. Der String wird in eine *struct* (oder Klasse) gepackt, da mit reinem Strings das Überladen sonst nicht funktioniert.



Text: <http://www.reinhardt-verlag.de/_pdf_media/uebung022441.pdf>

Wörterbucher im Text-Format: <https://www.j3e.de/ispell/igerman98/dict/>. Es empfiehlt sich die Sonderzeichen rauszulöschen und die Umlaute anzupassen.

## Partition

Ein gutes Beispiel für Partition kann hier gefunden werden:

<https://www.geeksforgeeks.org/stdpartition-in-c-stl/>

(das Beispiel zeigt außerdem den Sinn von Iteratoren auf)

## Funktor

Im Beispiel *Transform Unär* wurde jedes Element eines Feldes Inkrementiert. Soll die Zahl mit der die Elemente erhöht werden sollen vorgebbar sein, dann wäre ein Parameter für die dortige *inc*-Funktion wünschenswert (geht aber nicht).

Eine mögliche Lösung liefert das Überladen vom Funktionsoperator ():

```c++
class increment { 							// Der Functor 
private: 
  int num; 
public: 
  increment(int n) : num(n) {  }			// Konstruktor num = n

  int operator () (int arr_num) const { 	// Überladen des () Operators
    return num + arr_num; 
  } 
}; 
  
int main() { 
  int myArr[] = {1, 2, 3}; 
  int n = sizeof(myArr)/sizeof(myArr[0]); 
  int to_add = 5; 							// wir wollen hier 5 addieren
  
  transform(myArr, myArr + n, myArr, increment(to_add)); 
  
  for (int i = 0; i < n; i++) 				// Ausgabe
    cout << arr[i] << " ";
}
```

Der Functor ist eine abgekürzte Schreibweise für:

- das Erzeugen eines Objekts der Funktor-Klasse (hier *increment*) und
- das Ausführen der ()-Operation (die hier halt noch Überladen wird)

## Wörterbuch (114)

(Quelle: Skriptum fh-konstanz)

Schreiben Sie ein Programm, das jedes Wort *w* einer Textdatei *input.txt* auf korrekte Rechtschreibung prüft, indem festgestellt wird, ob *w* in einem Wörterbuch *woerterBuch.txt* vorkommt. Falsch geschriebene Wörter werden in die Datei *output.txt* abgespeichert.

Ein Wörterbuch: http://www.netzmafia.de/software/wordlists/deutsch.txt

Als Text kann aus dem Internet ein Text kopiert werden. Durchaus auch Texte aus dem Technischen Bereich, gespickt mit fremdsprachigen Fachbegriffen.

## Indexerstellung (113)

(Quelle: Skriptum fh-konstanz)

Schreiben Sie ein Programm, das für jedes Wort *w* einer Textdatei *input.txt* die Nummern der Zeilen ermittelt, in denen *w* vorkommt. Wörter und Zeilennummern sollen alphabetisch sortiert in eine Datei *output.txt* ausgegeben werden.

Beispiel *input.txt*:

```
das Haus
ist hoeher
als
das andere
Haus
```

erzeugt *output.txt*:

```
Haus	1, 5
als		3
andere	4
das		1, 4
hoeher	2
ist		2
```

Strategie:

beim Lesen eines Worts aus dem Text muss im Index nach diesem Wort gesucht werden, wenn es schon da ist wird die Zeile dazugefügt. Wenn nicht wird das Wort neu eingefügt -> *map* mit *key*=Wort und Value ist die Liste der Zeilen.

Diese Zeilenaufzählung kann mittels einem *vector* erfolgen oder wenn ganz einfach einem *string*.

## Adressbuch (112)

*Assoziative Container* eignen sich für schnelles Abfragen von Daten, die mit Schlüsseln arbeiten. Intern werden spezielle Datenstrukturen eingesetzt, um den Datenzugriff zu beschleunigen.

*set*, *map* verwenden *Unique Keys*, d.h. für jeden Schlüssel gibt es *nur einen* Datensatz.

Für einen Eintrag in ein Adressbuch kann die folgende Struktur verwendet werden:

```c++
class record {
public:
    record(string nn="", string vn="", long long int num=0, string mail="") :
        m_nName(nn), m_vName(vn), m_phone(num), m_mail(mail) {};

    friend ostream &operator<<(ostream &o, record e) {
        o << e.m_nName << " " << e.m_vName << " " << e.m_phone << " " << e.m_mail;
        return o;
    }

private:
    string m_nName;			    // Nachname
    string m_vName;			    // Vorname
    long long int m_phone;	    // Tel-Nr
    string m_mail;			    // Mail-Adr.
};
```

Die Daten sind klar: Name, TelNr und Mail Adresse. Konstruktoren weisen lediglich die Member zu. Der überladene *<* Operator dient für die Reihung im Telefonbuch, da die einzelnen Elemente nicht direkt miteinander verglichen werden können, wird hier festgelegt, dass die Reihung nur nach dem Nachnamen erfolgt. Der *<<* Operator wird überladen um eine einfache Ausgabe zu ermöglichen.

In einer einfachen Anwendung werden zuerst wenige Einträge eingefügt und ausgegeben:

```c++
// 1. Container map gewaehlt -> Schluessel/Wert-Paare
typedef map<string,record> addrBookT;
addrBookT myAdb;

cout << endl << "Adressbuch mit STL-map:" << endl;

// 2. Werte eintragen mit []-Operator und mit insert
myAdb.insert(make_pair("Huber", record("Huber", "Michael", 43664,"jim@knopf.at")));
myAdb.insert(make_pair("Maier", record("Maier", "Josef", 4337322,"john@doe.at")));
myAdb.insert(make_pair("Moser", record("Moser", "Johann", 4366333,"k@kinskey.at")));
myAdb.insert(make_pair("Hofer", record("Hofer", "Klaus", 436647443,"o@ompfdi.at")));
myAdb.insert(make_pair("Gruber", record("Gruber", "Michael", 437553,"p@pedski.at")));
myAdb.insert(make_pair("Mayr", record("Mayr", "Georg", 4366473,"t@mr.at")));
myAdb.insert(pair<string,record>("Kober", record("Kober", "Klaus", 112LL,"K.k@joen.de")));

// 3. Werte Anzeigen (Alphabetisch nach Schluessel sortiert
for(auto it:myAdb)				// for-each     it ist automatisch ein Element von myAdb
  cout << " " << it.first << "\t:\t" << it.second << endl;
```

anschließend wird nach einer Person gesucht. Das kann auf zwei Arten erfolgen:

- *find*: Sequenzielle Suche - beginnt von vorne bis es gefunden wird
- *lower_bound*: Binäre Suche - die funktioniert nur für bereits sortierte Felder - und genau sowas haben wir hier. *lower_bound* findet das Element welches an der Stelle liegt wo das gesuchte liegen sollte, wenn nicht vorhanden, dann ist es das nächste Element:

```c++
// 4.1 Suchen mittels find()
//-------------------------------------------------------------------
string suchStr("Kober");
cout << endl << "Suche nach \"" << suchStr << "\" (mit find):" << endl;

auto it = myAdb.find(suchStr);							// sequenzielle Suche
if (it != myAdb.end() )
  cout << " " << it->first << "\t:\t" << it->second << endl;
else
  cout << "\"" << suchStr << "\" wurde nicht gefunden." << endl;

// 4.2 Suchen mittels lower_bound()
//-------------------------------------------------------------------
suchStr = "Mayr";
cout << endl << "Suche nach \"" << suchStr << "\" (mit lower_bound):" <<endl;

it = myAdb.lower_bound(suchStr);						// binaere Suche
if (it != myAdb.end() && (it->first == suchStr))
  cout << " " << it->first << "\t:\t" << it->second << endl;
else
  cout << "\"" << suchStr << "\" wurde nicht gefunden." << endl;
```

Der Zugriff im Adressbuch kann mittels *[]* Operator erfolgen. Und schlussendlich werden sämtliche Datensätze gelöscht:

```c++
// 5. Zugriff mittels [] moeglich
//-------------------------------------------------------------------
string kbr("Kober");
cout << endl << "Zugriff mittels [" << kbr << "]:" << endl;
record kbrRec = myAdb[kbr];
cout << " Wert[" << kbr << "]:\t" << kbrRec << endl;

// 6. Loeschen
//-------------------------------------------------------------------
cout << "\nLoeschen:" << endl << "-------------------------------" << endl;
myAdb.erase ("Kober");      // nur Kober loeschen
myAdb.erase (myAdb.begin() );   // nur den Ersten loeschen
myAdb.erase (myAdb.begin(),myAdb.end() );   // alle (Beginn->Ende) Loeschen
if (myAdb.empty() )
  cout << " Das Adressbuch ist leer" << endl << endl;
```

In einer *map* kann direkt nur nach dem *key* gesucht werden (nach dem ist das Feld ja sortiert). Für die Suche nach einem Wert muss das mittels *find_if* erfolgen.

## WhatsDwn (105)

Für ein Chat-Programm wird die Kommunikation in einem *map* angelegt, jede Chat-Gruppe bekommt einen Namen:

```c++
multimap<string,chat> whatsDown;

whatsDown.insert({"dudes", chat("Joe","was los?")});
whatsDown.insert({"dudes", chat("Bob","hab verpennt, sitz gerade beim fruehstueck :-)")});
whatsDown.insert({"DieFirma",chat("Schef","Wieso sind Sie nicht in der Arbeit!")});
whatsDown.insert({"dudes", chat("Bob","Ver***** muss schnell weg _[:]o")});
whatsDown.insert({"dudes", chat("Joe","du schaffst das X)")});
whatsDown.insert({"DieFirma",chat("Bob","Der Bus ist ausgefallen und da ist ein Riesenstau, ich bin gleich da...")});

for (auto &elem:{"dudes","DieFirma"}) {
  cout << endl << "Chat ~" << elem << "~:" << endl;
  for (auto it = whatsDown.lower_bound(elem); it != whatsDown.upper_bound(elem); it++) {
    cout << " " << it->second << endl;
  }
}
```

Versvollständigen Sie das Programm, um folgende Ausgabe zu bewirken:

```
Chat ~dudes~:
 Joe> was los?
 Bob> hab verpennt, sitz gerade beim fruehstueck :-)
 Bob> Ver***** muss schnell weg _[:]o
 Joe> du schaffst das X)

Chat ~DieFirma~:
 Schef> Wieso sind Sie nicht in der Arbeit!
 Bob> Der Bus ist ausgefallen und da ist ein Riesenstau, ich bin gleich da...

```

In der *chat*-Klasse wird die Kommunikation in einem *vector* abgelegt.:

```c++
class chat {
friend ostream &operator<<(ostream &os, chat);
public:
  vector<chatEntry> m_chat;
  chat(string sender, string text) {
    m_chat.push_back(chatEntry(sender, text));
  };
};

```

## Vector - Optimierung (110)

Grundsätzlich wird die Verwendung von *vector* empfohlen. Es ist eine bewährte und sehr kompakte Struktur. Betrachten wir folgendes Programm:

```c++
#include <iostream>
#include <vector>

using namespace std;

class test {
  public:
  test(int v1, int v2) : val1(v1), val2(v2) {
    cout << "Creating ...\n";
  }
  int val1, val2;
};

int main() {
  vector<test> myList;
  myList.push_back(test{1,2});
  myList.push_back(test{3,4});

  return 0;
}
```

Das Programm ist sehr kurz und einfach. Bei der Ausführung kommt:

```
Creating ...
Creating ...
```

Es wurden zwei Objekte erzeugt, daher leuchtet die Ausgabe ein. Überlegen Sie sich ob die Verwendung effizient erfolgt.

Fügen Sie in die *test*-Klasse einen *Copy*-Konstruktor ein der, wie der Default-*Copy*-Konstruktor auch, einfach die Elemente kopiert. Geben Sie darin zusätzlich einen Text in der Kommandozeile aus ("Copying ..."). Wenn Sie das Programm ausführen sehen sie:

```
Creating ...
Copying ...
Creating ...
Copying ...
Copying ...
```

Es wurden also 3 mal Objekte durch Kopieren erzeugt.

- zwei Kopiervorgänge erscheinen logisch, sie sind notwendig da durch den Aufruf von *push_back* das Objekt in der Funktion an die *vector*-Adresse kopiert wird. Die Frage ist warum am Ende ein 3ter Kopiervorgang erfolgt.
- wenn ein *vector* in der Größe verändert wird, dann wird eine komplett neue Struktur im Speicher angelegt und die ursprünglichen Werte in den neuen *vector* kopiert und anschließend der neu eingefügte.

Dieser Ablauf ist also aus zweierlei Gründen nicht optimal. Wenn immer ein *push_back* aufgerufen wird, dann wird ein neuer Speicher reserviert und umkopiert. Wenn vorab bekannt ist, dass wie in diesem Beispiel sofort 2 Elemente in den Vektor kommen, dann kann der Vektor von Beginn an auf Größe 2 initialisiert werden:

```c++
myList.reserve(2);
```

Damit fällt die Notwendigkeit des Umkopierens weg. Allerdings müssen die beiden Objekte dann direkt auf die reservierten Plätze erstellt werden:

```c++
myList[0] = test{1,2};
myList.emplace_back(3,4);		// OHNE test!
```

hier sind zwei Möglichkeiten dargestellt wie die vorhandenen Plätze verwendet werden können. Die Funktion *emplace_back* versucht vorhandene, freie Plätze (durch *reserve* erstellt) zu verwenden und direkt darin die Objekte zu erstellen, sollte nicht genügend Platz sein, verhält es sich gleich wie *push_back*. Für den []-Operator muss selbst eine Bereichsprüfung berücksichtigt werden.

## String - Optimierung (111)

Die String-Klasse ist ein großer Vorteil, es gibt bereits eine große Menge an oft benötigten Funktionen mittels welcher viele häufig begangene Fehler vermieden werden können.

Hier ein einfacher Programm-Ausschnitt:

```c++
void print(const std::string &str) {
  std::cout << str << std::endl;
}

int main() {
  std::string name = "Johann-Sebastian Hinterhofholzner";
  print(name);

  return 0;
}
```

In diesem Programm wird ein String *name* angelegt und initialisiert. Dabei wird dynamisch Speicher reserviert um einen String aufzunehmen. String ist ein Container der seine Größe verändern kann und wird daher dynamisch auf dem Heap abgelegt. Die Klasse ist allerdings so entwickelt, dass wenn der String zu kurz ist (kleiner 16 Zeichen) dann wird er auf dem Stack abgelegt.

Dass der String eine dynamische Speicherreservierung beinhaltet kann gezeigt werden:

```c++
void* operator new(size_t size) {
  std::cout << "Allocating " << size << std::endl;
  return malloc(size);
}
```

Hier wird einfach der *new*-Operator überladen und eine Ausgabe eingebaut. Anschließend wird der Speicher tatsächlich mit der c-Funktion *malloc* reserviert (ist nicht sauber, klappt aber).

Wird das Programm ausgeführt, dann erhält man:

```
Allocating 34
Johann-Sebastian Hinterhofholzner
```

werden im Weiteren noch Elemente aus dem String kopiert:

```c++
std::string fName = name.substr(0,16);
std::string lName = name.substr(16+1,name.size()-1);
print(fName);
print(lName);
```

dann wird wiederum Speicher auf dem Heap reserviert:

```c++
Allocating 34
Johann-Sebastian Hinterhofholzner
Allocating 17
Allocating 17
Johann-Sebastian
Hinterhofholzner
```

In Summe kann das die Laufzeit eines Programms entscheidend verlangsamen. Und das nur weil der Vor- oder Nachname gelesen werden soll. In C kann in C-Strings mittels Pointer auf eine beliebige Position gezeigt werden und die entsprechende Zeichenanzahl angezeigt werden. Es werden eigene Copy-Konstruktoren und dynamisches Erzeugen von Objekten vermieden.

Ab C++17 ist gibt es *string_view*, damit kann mit Teilen von vorhandenen Strings gearbeitet werden (genau wie wenn direkt mit Zeigern gearbeitet wird):

```c++
std::string_view fName2(name.c_str(),16);
```

