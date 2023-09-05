---
tags:
  - Cpp/STL
aliases: []
created: 5. September 2023
---

# Iteratoren

Um Container und Algorithmen möglichst flexibel (miteinander) einsetzen zu können, werden deren Schnittstellen üblicherweise als Iteratoren definiert. Beginnend kann vereinfacht ein Iterator als Zeiger auf die Teilelemente eines Containers verstanden werden. Mittels diesem kann durch die Struktur traversiert werden. Für diese Iteratoren sind unterschiedliche Operatoren verfügbar (++, * …). Die Algorithmen der [STL](Cpp_STL.md) arbeiten nicht direkt mit Containern sondern über Iteratoren (viel einfacher, der Algorithmus muss nur für einen Iterator entwickelt werden und funktioniert für alle Container).

>[STL](Cpp_STL.md)-Iteratoren: Referenz auf ein Container-Element. Bietet Zugriff in unterschiedliche Container auf einheitliche Weise.

- Iteratoren können erzeugt werden ohne mit einem Container verbunden zu sein.
- Ein Iterator kann mit einem Container verbunden werden (typisch *begin()* oder *end()*).
- Ein Iterator ist immer definiert, sobald ein Iterator über eine Containergröße hinausläuft, kann dies mit *end()* abgefragt werden.

Es werden Kategorien von Iteratoren unterschieden:

1. Input-Iterator: für das sequenzielle Lesen von Daten (Container, Datei, …). Ein Rückspringen (-- …) ist nicht definiert. Beispiel: wird aus einer Datei sequentiell gelesen, dann kann das Einlesen einer Position nur einmal erfolgen. Bei erneutem Einlesen wird automatisch der nächste Wert eingelesen.

2. Output-Iterator: für das sequenzielle Schreiben von Daten (Container, Datei, …). Kein Rückspringen möglich. Zum Schreiben in diesen Iterator wird der Dereferenzierungsoperator * verwendet:

   ```c++
   *output = Wert;
   ```

   Beispiel: analog zum Lesen einer Datei ist das beim Schreiben einer Datei. Wird ein Wert geschrieben, schreibt dir folgende Schreibe-Operation automatisch auf die folgende Position.

3. Forward-Iteratoren: kann sich nur vorwärts bewegen (kein -). Allerdings kann eine Position gespeichert werden (im Gegensatz zu Inund Output).  
   *forward_list*, ungeordnete assoziative Container (*unordered_set*, *unordered_…*)

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