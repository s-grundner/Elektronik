# 5 Überladen von Operatoren

In C++ können auch Operatoren überladen werden. Damit kann die Bedeutung von Operatoren für Objekte von eigenen Klassen definiert werden. Die Priorität von Operatoren kann nicht verändert werden.

Am Beispiel einer Klasse `Frac` soll der *+* Operator die Funktion einer Addition von zwei Brüchen übernehmen:

```c++
class Frac { ..... };

Frac z, a(3,4), b(2,3);  // Erzeugen von drei Frac-Objekten
z = a + b;               // z = 3/4 + 2/3
```

Gesucht ist ein *+* Operator der zwei Brüche miteinander addieren kann in der gewohnten Schreibweise `z = a + b`.

> Mit dem Operatorüberladen kann Standardoperatoren eine Bedeutung für eigene Klassen definiert werden.

Es gibt grundsätzlich zwei Möglichkeiten das Überladen zu implementieren:

## Überladen mit globaler Funktion

In der Implementierung wird für `z = a + b` eine globale Funktion (nicht Teil der `Frac`-Klasse) mit 2 Parametern. Der *+* Operator hat zwei Operanden, er ist eine binäre (2 Parameter erforderlich) Operation:

```c++
Frac operator+(Frac a, Frac b) {... return c;}   // c ist ein Frac
```

Die Funktion trägt den Namen *operator* gefolgt vom zu überladenen Operator.

Innerhalb dieser globalen Funktion kann allerdings nicht auf private-Member von a und b zugegriffen werden (hier können das Zähler und Nenner sein).

> Überladen mittels globaler Funktion: Zugriff auf private Member der Attribute nicht möglich.

**Einschränkung**: das globale Überladen eines Operators muss zumindest eine eigene Klasse beinhalten. Das ist also nicht möglich:

```c++
bool operator+(int a, int b) {...}
```

das klappt nur innerhalb einer Klasse.

## Überladen mit Methodenaufruf

Wird die Operator-Überladen-Methode innerhalb der Klasse `Frac` definiert, dann wird die binäre Operation *+* mit nur einem Aufrufparameter definiert (als erster Parameter wird immer die eigene Klasse angenommen): 

```c++
Frac operator+(Frac b) {... return c;}        //c ist ein Frac
```

Für diese Variante ist für den Aufruf immer ein Objekt *als Erster der beiden Parameter* notwendig:

```c++
z = a + b;        // die operator+ Funktion wird im Objekt a aufgerufen
```

Dadurch, dass die Methode innerhalb der Klasse definiert ist, kann auf die privaten Member zugegriffen werden.

> Überladen mittels Methodenaufruf: der erste Operator-Parameter muss den selben Typ wie die Methode beinhaltende Klasse sein.

Probleme gibt's hier allerdings, wenn eine Konstante als erster Parameter verwendet werden soll: `z = 3 + a;` der erste Parameter ist ja kein Objekt der Klasse `Frac`:

a) Fürs Überladen mit globaler Funktion (eine Typkonvertierung 3 in `Frac` muss verfügbar sein):

   ```c++
z = operator+(3,a);
   ```

d.h. 3 wird automatisch auf 3/1 konvertiert.

b)  Überladen mit Methodenaufruf: 

   ```c++
z = 3.operator+(a);   // kann nicht klappen !!!!!!, wenn dann a.operator+(3)
   ```

Grundsätzlich sind beide Varianten möglich. Allerdings gibt es Fälle (der eben gezeigte), bei denen die Methoden-Variante nicht möglich ist. Auf der anderen Seite haben globale Funktionen keinen Zugriff auf die Eigenschaften des Objektes und das kann für eine Berechnung durchaus notwendig sein.

Daher gibt's eine weitere Lösung:

## Überladen mittels Friend-Funktion

```c++
class Frac {
....
public:
    // den + Operator überladen
    friend Frac operator+(const Frac& , const Frac&);
    friend Frac operator+(long , const Frac&);
    friend Frac operator+(const Frac& , long);
    ....
}
```

- **Friend-Funktionen sind einfache Funktionen** (also keine Klassen/Objekt-Methoden).

- Friend-Funktionen werden vom Programmierer der Klasse in der Header-Datei mit dem **Schlüsselwort `friend`** deklariert.

- Dadurch können Friend-Funktionen **auf den private-Bereich** einer Klasse zugreifen (... Echte Freunde dürfen das ...).

> Überladen mittels Friends: Nachteil der globalen Variante behoben (Zugriff auf private Member) durch Definition der Funktion als Friend.

Als typisches Anwendungsbeispiel für Friend-Funktionen, gilt die Verwendung des Ausgabe-Operators `<<`. Der Grund: der *<<* -Operator für Ausgaben (in einen Stream) hat als ersten Parameter immer `ostream&` und kann daher nicht die eigene Klasse sein.

### Die Ausgabe << für eigene Klassen

Wir wollen das, aus den vorigen Kapiteln OOP-Klassen-Vererbung Projekt Firma/Company stammende `CAbteilung`s-Objekt namens `abteilung` auf `std::cout` ausgeben.

 ```c++
...
// ein ABTEILUNGsobjekt erstellen und die Personenobjekte einfügen
 
CAbteilung *abteilung = new CAbteilung("Programmierer-Abteilung");
 
abteilung->addMitarbeiter(ich);
abteilung->addMitarbeiter(sie);
abteilung->addMitarbeiter(er);
 
// statt der Verwendung von toString(), wollen wir,
// dass die Klasse sich vollständig in das C++ Konzept
// 'einbettet'
// cout << abteilung->toString() << endl;
 
cout << abteilung << endl;
...
 ```

Der Compiler macht aus dem Aufruf `cout << abteilung;`  folgendes:  `operator<<(cout, abteilung); `. Damit Ausgaben miteinander verkettet werden können, wird wiederum ein `ostream&` zurückgegeben.

Implementierung:

```c++
ostream& operator<<(ostream& ausgabe, const CAbteilung& a) {
    ausgabe << a.toString();
    return ausgabe;
}
```

Da das nicht in der *ostream*-Klasse implementiert wird muss diese Funktion global sein (& Operator notwendig, weil Copy-Konstruktor private).

> Das Überladen von Operatoren ermöglicht das Implementieren von einer eigenen Logik für eigene Operanden.

## Beispiele

- \+ Operator:

  ```c++
  Cls operator+(Cls a, Cls b) {return Cls(a.m_num + b.m_num);}    // global
  Cls operator+(Cls a) {return Cls(this.m_num + a.m_num);}        // Member-Funktion
  ```

- << Operator. Siehe Oben.

- Cast-Operator für bestehende Typen. `operator int() { return m_real; }` Der Aufruf kann erfolgen: `(int)x` oder nur `x` wenn sich ein int aus dem Kontext ergibt. Ein Cast-Operator kann auch für eigene Typen definiert werden.

- [] Operator. `int myClass::operator[](int pos) { ... }`. Dieser Operator bezieht sich immer auf ein Objekt (genauso wie die Zuweisungs (=), Funktions- (), Ptr (->) Operatoren).

- = Operator. Dieser Operator hat zwei Bedeutungen. Einerseits für Zuweisungen - Zuweisungsoperator. Wird dieser Operator jedoch verwendet um einen gerade erstelltes Objekt zu initialisieren ist es der Copy-Konstruktor.

- () Operator. *Funktor* Damit können Funktionen überladen werden. `void operator()(int a){...}`. Mit einem Aufruf `myClass(3)` wird dieser Funktor aufgerufen.

## Referenzen

- Gut zu lesende, deutsche Einführung
  <http://public.beuth-hochschule.de/~kempfer/skript_cpp/Kap11.html>
- Liste der überladbaren Operatoren
  https://en.cppreference.com/w/cpp/language/operators