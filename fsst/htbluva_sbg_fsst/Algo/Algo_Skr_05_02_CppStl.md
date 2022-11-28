# 5.2 C++/STL-Listen

## array

array ist eine Hüllklasse (Wrapper) welche die C-Arrays verwendet und mit sinnvollen Methoden erweitert (begin, end, size ...). Diese Erweiterungen werden in den abgeleiteten Klassen (im Folgenden) verwendet.

```c++
// include array, iostream		using std

const size_t ANZAHL = 3;
array<int, ANZAHL> tabelle = {{ 9, –10, 5 }};
for(auto i = tabelle.begin(); i != tabelle.end(); ++i) { // Benutzung mit Iterator
  cout << ∗i << endl;
}
for(size_t i = 0; i < tabelle.size(); ++i) {
  cout << tabelle[i] << endl; // Benutzung wie ein c-array
}
// Benutzung wie ein Tupel
cout << get<0>(tabelle) << endl;
cout << get<1>(tabelle) << endl;
cout << get<2>(tabelle) << endl;
}
```

(eine `auto` Definition bewirkt, dass automatisch der Datentyp des Initialwertes angenommen wird.)

## vector

Siehe C++ Dokumentation. In der STL ist vector durch Arrays implementiert.

## list

Der Datentyp *list* aus der STL ist eine doppelt-verkettete Liste. Sie erlaubt damit das Einfügen und Entnehmen von Elementen an jeder Stelle mit konstanter Zeit.

```c++
// include list, showSequence    using std

list<int> L1, L2;
// Listen mit sortierten Zahlen füllen:
for(int i = 0; i < 5; ++i) {
  L1.push_back(2 ∗ i); // gerade Zahlen
  L2.push_back(2 ∗ i+1); // ungerade Zahlen
}
showSequence(L1); // 0 2 4 6 8
showSequence(L2); // 1 3 5 7 9
L1.merge(L2); // verschmelzen
showSequence(L1); // 0 1 2 3 4 5 6 7 8 9
showSequence(L2); // (leere Liste)
```

## deque

Abkürzung für *double ended queue*. Dieser Typ implementiert eine List an deren beiden Enden Elemente entnommen oder hinzugefügt werden können.

Implementiert wird eine deque als eine doppelt verkettete Liste von vectoren.

```c++
// include deque	using std

deque<int> dequeObj;

dequeObj.push_back(5);
dequeObj.push_back(6);

for(int i = 0; i < dequeObj.size(); i++)
  cout << dequeObj[i] << " ";
cout << endl;

dequeObj.push_front(4);
dequeObj.push_front(3);

for(int i = 0; i < dequeObj.size(); i++)
  cout << dequeObj[i] << " ";
cout << endl;

dequeObj.pop_back();

for(int i = 0; i < dequeObj.size(); i++)
  cout << dequeObj[i] << " ";
cout << endl;

dequeObj.pop_front();

for(int i = 0; i < dequeObj.size(); i++)
  cout << dequeObj[i] << " ";
cout << endl;
return 0;
}
```

Der große Unterschied zum vector-Typ ist, dass hier an beiden Enden effizient gelöscht/gelesen werden kann.

## stack

Dieser Kontainer erlaubt Ablage und Entnahme nur von einer Seite aus (FILO, LIFO). Ein Stack verwendet in der Implementierung vector, list oder deque-Typen.

```c++
// include stack, iostream		using std
int numbers[] = {1, 5, 6, 0, 9, 1, 8, 7, 2};
const int COUNT = sizeof(numbers)/sizeof(int);
stack<int> einStack;
cout << "Zahlen auf dem Stack ablegen:" << endl;
for(int i = 0; i < COUNT; ++i) {
  cout.width(6);
  cout << numbers[i]; // protokollieren
  einStack.push(numbers[i]);
}
cout << endl;
cout << "Zahlen vom Stack holen (umgekehrte Reihenfolge!), anz. und loesch.:" << endl;
while(!einStack.empty()) {
  cout.width(6);
  cout << einStack.top(); // obersten Wert anzeigen
  einStack.pop(); // Wert löschen
}
cout << endl;
```

## queue

Warteschlange. Erlaubt die Ablage auf einer Seite und die Entnahme auf der anderen Seite (FIFO).

```c++
// include queue, iostream			using std

int numbers[] = {1, 5, 6, 0, 9, 1, 8, 7, 2};
const int COUNT = sizeof(numbers)/sizeof(int);
queue<int> eineQueue;
cout << "Zahlen in die Warteschlange schreiben:" << endl;
for(int i = 0; i < COUNT; ++i) {
  cout.width(6);
  cout << numbers[i]; // protokollieren
  eineQueue.push(numbers[i]);
}
cout << endl;
cout << "Zahlen aus der Warteschlange holen, "
"anzeigen und löschen:" << endl;
while(!eineQueue.empty()) {
  cout.width(6);
  cout << eineQueue.front(); // ersten Wert anzeigen
  eineQueue.pop(); // Wert löschen
}
cout << endl;
```

## map

Ein map speichert Paare von (Schlüsseln, zugehörige Daten). Der Schlüssel muss eindeutig sein (nie doppelt). Ein map ist ein assoziativer Kontainer (Hash-Map) - die Daten werden durch Berechnung aus dem Schlüssel gefunden.

```c++
#include<map>
#include<string>
#include<iostream>
using namespace std;

// Zwei typedef s zur Abkürzung
typedef map<string, long> MapType; // Vergleichsobjekt ist less<string>()
typedef MapType::value_type ValuePair;
int main() {
  MapType aMap;
  aMap.insert(ValuePair( "Thomas" , 5192835));
  aMap.insert(ValuePair( "Werner" , 24439404));
  aMap.insert(ValuePair( "Manfred" , 535353));
  aMap.insert(ValuePair( "Heiko" , 635352723));
  aMap.insert(ValuePair( "Andreas" , 42536347));
  aMap.insert(ValuePair( "Karin" , 9273539));
  // Das zweite Einfügen von Heiko mit einer anderen Nummer wird
  // nicht ausgeführt, weil der Schlüssel schon existiert.
  aMap.insert(ValuePair( "Heiko" , 1000000));
  cout << "Ausgabe:\n" ; // sortiert
  auto iter = aMap.begin();
  while(iter != aMap.end()) {
    cout << ( ∗ iter).first << ’:’ << ( ∗ iter).second << endl; // Nummer
    ++iter;
  }
  cout << "Ausgabe der Nummer nach Eingabe des Namens\n" << "Name: " ;
  string derName;
  cin >> derName;
  cout << "Suche mit Iterator: " ;
  iter = aMap.find(derName); // O(log N)
  if(iter != aMap.end()) {
    cout << ( ∗ iter).second << endl;
  } else {
    cout << "Nicht gefunden!" << endl;
  }
  try {
    cout << "Suche mit at(): " << aMap.at(derName) << endl;
  } catch(const exception& e) {
    cout << "Nicht gefunden! Exception: " << e.what() << endl;
  }
}
```

## Referenzen

- deque
  [https://thispointer.com/what-is-stddeque-and-how-deque-works-internally/](https://thispointer.com/what-is-stddeque-and-how-deque-works-internally/)

- für Java

  [http://www.vogella.com/tutorials/JavaDatastructures/article.html](http://www.vogella.com/tutorials/JavaDatastructures/article.html)

## Fragen

- ?
