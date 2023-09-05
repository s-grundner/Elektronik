# Algorithmen

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

## Allgemein

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

## Anpassungen

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

Der Algorithmus kann [komplexe Zahlen](../../Mathe/mathe%20(3)/Komplexe%20Zahlen.md) nicht sortieren weil der < Operator dafür nicht definiert ist.

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

### Bibliothek

In der Bibliothek sind bereits unterschiedliche Arten von Vergleichen verfügbar. Diese funktionieren allerdings nur für Objekt-Elemente für die der < Operator verfügbar ist. Beispiele (<http://www.cplusplus.com/reference/functional/)> für diese Funktionsobjekte sind (für *int*-Elemente):

```c++
less<int>				... Vergleich steigend
greater<int>		... Vergleich fallend
```

### Funktionen

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

### Lambda-Ausdrücke

Gerade für diese Anwendungen wirkt es oft als zu aufwendig eine eigene Funktion zu definieren (an entfernter Stelle im Code) um sie nur einmal für den Vergleich mitzugeben. Für solche Zwecke eignen sich, gerade wenn der Funktionskörper sehr kompakt ist, Lambda-Ausdrücke. Dabei werden komplette Funktionen in einem Ausdruck ausgedrückt, als Struktur:

```c++
[capture](parameter)->ret{body}
```

in der eckigen Klammer (*capture*) können Umgebungsvariable für innerhalb der Funktion sichtbar gemacht werden. In der runden Klammer können der Funktion Parameter mitgegeben werden. Der Pfeil und *ret* geben den Typ des Rückgabewerts an, dieser kann einfach weggelassen werden, wenn aus dem *body* im return-Teil ersichtlich ist um welchen Typen es sich handelt. In *body* ist der Funktionskörper. Wenn der Member *v* von zwei Objekten der Klasse *cls* verglichen werden sollen würde der Lambda-Ausdruck so aussehen:

```c++
[](const cls &o1, const cls &o2){return (o1.v < o2.v);}
```

### Funktionsobjekte

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