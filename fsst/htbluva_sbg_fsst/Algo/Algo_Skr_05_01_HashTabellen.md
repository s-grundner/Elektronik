# 5.1 Hash-Tabellen / Assoziative Listen

## Hash-Tabellen

Nachteil von einfachen Listen/Bäumen: die Suche erfolgt sequentiell um ein Element zu finden. Einfügen und Löschen von Elementen ist mit einem erhöhtem Aufwand verbunden.

Von diesem Aspekt aus Verbesserung:

- Einfaches Array zum Ablegen der Daten (Werte liegen im Speicher "nebeneinander")
- Die Position im Feld berechnet sich aus einem Element-Wert
- sehr effizient, wenn sich jedes Objekt eindeutig einem Index zuordnen lässt.

Beispiel: Element Nummer 7 ist zu finden an Position 7: arr[7]

### Hashfunktion

Vor der Erstellung einer Hash-Tabelle muss ein Teil eines Datenobjekts (wenn nicht nur reine Nummern abgelegt werden) als **Schlüssel** definiert werden. 

Zum Abspeichern steht ein $m$ Plätze großer Speicherbereich (**Behälter**) zur Verfügung (Index 0, 1, ... , m-1 -> **Hashadresse**).

Die Hashfunktion $h$ bildet den Wertebereich des Schlüssels auf den Index der $m$ Speicherplätze ab.

> Hashtabellen sind Arrays in welchen sich die Position im Array aus dem Schlüssel von Datenobjekten berechnet.



![](C:\daten\Skripten\Informatik\Algo\bilder\HashTable_01.png)

### Beispiel

- Bankkunden sollen in einer Hashtabelle gespeichert werden. Ein Datenobjekt besteht aus Name, Adresse, Kontonummer, ...
- Als Schlüssel wird die Kontonummer ktoNr (Teil des Datenobjekts) gewählt
- Es stehen uns 1000 Speicherplätze (=m) zur Verfügung

Eine Hashfunktion muss sämtliche möglichen Kontonummern auf die Zahlen 0 ... 999 abbilden.

Eine einfache Hashfunktion (Modulo-Operation): *h(ktoNr) = ktoNr  %  m​*

Problem: Es kann mehr Kontonummern als Speicherplätze geben.

###  Gute Hashfunktion

- möglichst wenige Objekte werden auf eine Adresse abgebildet. Werden mehre Objekte auf eine Hashadresse abgebildet, spricht man von einer **Kollision**.
- eine Hashfunktion wird als **perfekt** für eine Menge bezeichnet wenn sie ohne Kollision abbildet.
- eine gute Hashfunktion ist möglichst einfach zu berechnen

Ist die Hashfunktion nicht perfekt dann muss es möglich sein mit einer Hashadresse mehrere Objekte ablegen zu können.

- Dazu werden die Speicherplätze oft als Array von verketteten Listen definiert: **Hashverfahren mit Verkettung**. Kommt ein Eintrag auf einen Platz der schon besetzt ist, dann wird in der Liste auf diesem Platz ein neues Element eingefügt.
- in **offenen Hashverfahren** werden Objekte die an der Hashadresse keinen Platz finden (**Überläufer**) in einem anderen Behälter gespeichert. Das Array muss dazu groß genug sein. Die Reihenfolge wie Überläufer verschoben wird muss ebenfalls berechnet werden (unterschiedliche Methoden).

### Dynamische Hashverfahren

Mögliche Probleme einer Hashtabelle:

- wenige Objekte: schlechte Speicherausnutzung
- viele Objekte: lange Suchdauer (aufgrund Verkettung, Überläufer ...)

Verbesserung durch Reorganisation: Tabellengröße dynamisch, Hashfunktion anpassen, Umspeichern von Elementen. Am einfachsten wenn eine Mehrfachbelegung auftritt eine neue, größere Tabelle erzeugen und die Daten umkopieren.

## Assoziative Listen

- Assoziative Felder eignen sich dazu Elemente aus einer großen Menge an Daten zu ermitteln.

- Jedes Element wird durch einen eindeutigen **Schlüssel** identifiziert.


  ![](C:\daten\Skripten\Informatik\Algo\bilder\AssocList.png)

Beispiel Telefonbuch:

- ein Datenelement besteht aus Name (String) und Telefonnummer (String)

- Menge der Daten sind Viele dieser Datenelemente

- **Suchschlüssel** ist der Name (der muss eindeutig sein)

  Telefonbuch["Huber"] --> "0662/737373"

für C++:

```c++
map<string, string> telbuch;			// include map, using std

telbuch[ "Huber"  ] = "0500/712342";
telbuch[ "Maier"  ] = "0500/647382";
telbuch[ "Mueller"] = "0500/593882";
telbuch[ "Kaiser" ] = "0500/554432";

cout << telbuch[ "Maier" ];
```

Beispiel (C++):

```c++
// include iostream, map, string, iterator
// using 

map<string, int> mapOfWords;

// Element Eingeben
mapOfWords.insert(make_pair("Earth", 1));
mapOfWords["Moon"] = 10;
mapOfWords["Sun"] = 3;

mapOfWords["Earth"] = 4;	// Ersetzen eines Werts

// Durch ein map Iterieren und Ausgeben:
map<string, int>::iterator it = mapOfWords.begin();
while(it != mapOfWords.end()) {
    cout << it->first << " :: " << it->second << endl;
    it++;
}

// Pruefung ob Eingabe geklappt hat:
if(mapOfWords.insert(make_pair("Earth", 1)).second == false) {
    cout << endl << "'Earth' nicht eingef. (schon vorhanden)" << endl << endl;
}

// Element mit Schluessel Suchen:
if(mapOfWords.find("Sun") != mapOfWords.end())
    cout << "'Sun' gefunden: " << mapOfWords["Sun"] << endl;
if(mapOfWords.find("Mars") == mapOfWords.end())
    cout << "'Mars' nicht gefunden" << endl;
```

- Elemente Einfügen: Zugriff mit eckiger Klammer, dabei wird ein bereits vorhandener Schlüssel einfach Überschrieben. Mittels *.insert* wird ein bestehendes Element nicht überschrieben. Mit *.second* kann gleichzeitig geprüft werden ob das Element eingefügt wurde.
- Auch für maps in c++ gibt es Iteratoren: siehe Beispiel

Beispiel Java:

```java
Hashtable<String, Integer> numbers = new Hashtable<String, Integer>();
numbers.put("one", 1);
numbers.put("two", 2);
numbers.put("three", 3);

Integer n = numbers.get("two");		// To retrieve a number, use the following code:
if (n != null) System.out.println("two = " + n);
```

## Referenzen

- Einfache Einführung (für Java)
  [http://www.codeadventurer.de/?p=2091](http://www.codeadventurer.de/?p=2091)
- Gutes einführendes C-Beispiel
  [https://www.tutorialspoint.com/data_structures_algorithms/hash_table_program_in_c.htm](https://www.tutorialspoint.com/data_structures_algorithms/hash_table_program_in_c.htm)


## Fragen

- Welche Vorteile haben Hash-Tabellen gegenüber Listen?
- Was ist eine Voraussetzung für die Verwendung einer Hashtabelle?
- Was ist eine Hashfunktion?
- Was versteht man unter einer Kollision?
