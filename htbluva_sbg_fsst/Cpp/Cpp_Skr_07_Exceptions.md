# 7 Exception Handling

## Behandlung von Fehlersituationen

Grundsätzlich gibt es zwei Arten von Fehlern:

1. Fehler die durch entsprechend hochwertige Lösung (Design, Test, Review ...) vermieden werden
2. Fehler, die im laufenden Betrieb jederzeit auftreten können

Für den 2. Fall gibt es in C++ eine Möglichkeit auf ein Auftreten zu reagieren. Beispiele für derartige Fehler:

- numerische Probleme (**Division durch 0**)  	
- Dateiprobleme (**Datei nicht gefunden**, zu wenige Datensätze, Medium beim Schreiben voll, kein Zugriff auf Laufwerk, Datei verschoben ...)  	
- Probleme mit Arrays (**zu kleine Dimensionierung**, Bereichsüberschreitung eines Index ...)  	
- Speicherprobleme (**zu wenig Speicher bei Reservierung**)

Diese Klasse von Fehlern wird in der Informatik als **Ausnahme** (Exception) bezeichnet. Im einfachsten Fall wird durch den Programmierer jede vorhersehbare Ausnahme berücksichtigt und entsprechend durch Fallunterscheidungen (Verzweigungen) reagiert.

Der Nachteil: es kann Übersehen werden auf ein mögliches Fehlverhalten zu reagieren. Mit dem Exception Handling kann für eine implementierte Funktion vorgeschrieben werden, dass eine Ausnahme zu behandeln ist.

## Exception Handling: try, catch, throw

Funktionen die ein Behandeln von Ausnahmen fordern können auf folgende Art eingebunden werden:

1. Die Funktion die eine Ausnahme/Exception verursachen kann, wird in einem **try** Block ausgeführt.
2. Im Fall dass keine Exception auftritt, wird der try-Block beendet und ohne Folgen verlassen.
3. Im Exception Fall wird sofort in einem **catch** Block verzweigt. In diesem Bock wird die Ausnahme-Behandlung durchgeführt und dann nach dem Block fortgesetzt. Wichtig ist dabei dass im *catch*-Block explizit die aufgetretene Ausnahme behandelt wird.
4. Alternativ kann der Fehler unbehandelt bleiben, die Funktion an dieser Stelle abgebrochen werden und der Fehler an die aufrufende Instanz weiter-"geworfen" werden (**throw**)
5. Eine Ausnahme kann mittels **throw** ausgelöst werden.

Beispiel try-catch:

```c++
...
try {
    func();			// kann eine Exception zurückliefern
} catch (Exception) {
    Fehlerbehandlung();
}
// Fall 1: keine Exception innerhalb func(): Programm ueberspringt catch-Block
// Fall 2: Exception innerhalb func(): Programm wird mit Fehlerbehandlung() fort
//         gesetzt
```

Beispiel Ausnahme auslösen:

```c++
void openfile(){
  FILE* file = fopen("notexistingfile.txt", "r");
  if(!file) {
    throw "Could not open file!"; // hier wird ein *string* geworfen
  }
}

int main(){
  try {
    openfile();
  } catch(const char* e){				// hier wird ein *string* gefangen
    printf("An error occured:\n%s\n", e);
  }
  return 0;
}
```

Mit *throw* kann ein beliebiges Datum (int Wert, ... Objekte oder Exception) mit übergeben werden. 

Gleichbedeutend:

```c++
void openfile() throw (const char*) {    // Bekanntgabe im Funktionskopf
  FILE* file = fopen("notexistingfile.txt", "r");
  if(!file) {
    throw "Could not open file!";
  }
}

int main(){
  try {
    openfile();
  } catch(const char* e){
    printf("An error occured:\n%s\n", e);
  }
  return 0;
}
```

*Achtung:* *const char\** ist nicht *char\**.

Mehrstufig:

```c++
try{
   // zu behandelnder Code
} catch (int a) { //wenn ein int geworfen wird
} catch (double b) { //wenn ein double geworfen wird
} catch (char c) { //wenn ein char geworfen wird
} catch (...) { //... alle Anderen
}
```

### Beispiel 1

```c++
template<typename T, int N>
class array {
public:
...
  T at(int pos) {
    if (pos >= N)
    	throw std::out_of_range("array<T,N>::at: index is out of range");
      return *(m_dta+pos);
  }
private:
  int *m_dta;
};

int main()
{
    array<int,3> arr;

  try {
    cout << arr.at(7) << " ";
  } catch (std::out_of_range o) { //if the index is out of range
    std::cout << "OUT OF RANGE" << o.what(); //throw this exception
  }
  return 0;
}
```

### Beispiel 2

```c++
int main()
{
  try {
    throw std::overflow_error("Achtung Overflow...");
  } catch(char const *str) {				// throw "abc"
    cout << "str:" << str << endl;
  } catch (int num) {								// throw 1
    cout << "num:" << num << endl;
  } catch (std::overflow_error e) {	// throw std::overflow_error("abc")
    cout << "o:" << e.what() << endl;
  } catch (...) {										// Andere
    cout << "Irgendwas anderes" << endl;
  }
  return 0;
}
```

Diese Möglichkeiten gibt's. Als ISO-Standard-Exception gibt es:

```c++
logic_error
domain_error
invalid_argument
length_error
out_of_range
runtime_error
range_error
overflow_error
underflow_error
```

### Sämtliche Fehler

Zum Abfangen aller möglichen auftretenden Fehler gilt:

```c++
catch (...) {
```

# Assert

(behaupten) Um ein Programm zu beenden und Fehler bewusst aufzuzeigen können Assertion verwendet werden. Assertions sind *eher* für die Entwicklung gedacht. Während *produktiven* Betriebs sollten diese eigentlich nicht mehr auftreten und sind daher üblich deaktiviert oder ausgebaut.

## assert

Eingebaute *assert* sind nur aktiv, wenn das Programm im Debug-Mode Compiliert wird. Mit 

```c++
# define NDEBUG
```

(No-Debug) können alle *assert* deaktiviert werden.

*assert* hat einen boolschen Ausdruck als Parameter, wenn dieser *falsch* ist, dann wird das Programm zur Laufzeit abgebrochen:

```c++
#include <assert.h>
void print_number(int* myInt) {
  assert (myInt!=NULL);	// Funktion hat nur Sinn wenn Pointer valid
  printf ("%d\n",*myInt);
}
```

## static_assert

Um Fehler zur Compile-Zeit (anders als *assert*!) zu Prüfen, eignet sich *static_assert*. Es bedarf zweier Parameter, einen boolschen Ausdruck und einen String. Wenn der boolsche Ausdruch *falsch* ist, dann wird das Compilieren abgebrochen und der String ausgegeben:

```c++
template < typename T, int row, int col >
struct matrix{
   static_assert(row >= 0, "Row number must be >=0.");
   static_assert(col >= 0, "Column number must be >=0.");
   static_assert( row + col > 0, "Line plus Column must be >0.");
};
...
matrix<std::string,-13,4> strArray;
```

Die letzte Zeile hat als *row* einen Wert kleiner 0, daher ist die Prüfung *row>=0* falsch und das Übersetzen wird abgebrochen:

```
error: static assertion failed: Row number must be >=0.
```

*static_assert* werden schon während der Compilierung geprüft und haben daher keinen Einfluss auf das Laufzeitverhalten.

Für *static_assert* ist dieses Beispiel typisch - diese Assertion kann direkt in einer Template-Bibliotheks-Klasse eingebaut werden. Wenn jemand die Bibliotheksfunktion falsch verwendet, wird während dem Compilieren darauf hingewiesen.

## Referenzen

Eine effiziente Art und Weise auf Fehlersituationen in Programmen reagieren zu können.

- http://www.cpp-entwicklung.de/cpplinux3/cpp_main/cpp_mainch4.html

