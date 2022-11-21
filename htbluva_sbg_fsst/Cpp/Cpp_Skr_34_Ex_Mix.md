# Mix

### decltype

C++11

gibt den Datentyp eines Ausdrucks zurück:

```c++
int a;
decltype(a) b;		// b->int
```

C++14

```c++
const int x = 123;
auto y = x;           // y has type int
decltype(auto) z = x; // z has type const int, the declared type of x
decltype(x) w = 7;		// ohne "=7" funktioniert es nicht - const ohne = klappt nicht
```

mit dem Formular *decltype(auto)* wird für *const* automatisch auch *=123* mitkopiert, ist daher weniger problematisch als die erste Form.

### LPARAM

Die Bezeichnungen WPARAM und LPARAM stammen aus dem ersten  16-BitWindows. PARAM heißt Parameter und ist damit von der Funktion  abhängig. W steht für WORD (unter 16 bit-Windows 16 bit), L steht für  LONG (unter 16-bit Windows 32 bit). Das ist schon alles!

### auto

Es steht für einen unbekannten Datentyp, den der Compiler selbst  bestimmt. Am einfachsten versteht man es anhand eines Beispiels.

Man sollte dieses Konzept nicht mit der dynamischen Datentypzuweisung,  wie es sie beispielsweise in PHP gibt, verwechseln. C++ besitzt eine  statisch explizite Typisierung

auto soll(!) durchaus verwendet werden, damit kann die Änderungsfähigkeit verbessert werden und Fehler vermieden werden. Die Effizienz eines Programms leidet NICHT, auto wird zur Compile-Zeit übersetzt.

## lvalue, rvalue

Die Bezeichnung könnte davon kommen:

```c++
int i = 10;
```

l=links, r=rechts; *lvalue* ist links vom Gleichheitszeichen ein *rvalue* ist rechts vom Gleichheitszeichen. Ein *lvalue* benötigt eine *localization* im Speicher. Es muss irgendwo im Speicher liegen, sonst kann ja nichts hinein zugewiesen werden (ein *lvalue* kann auch *const* sein, dann kann man nicht reinschreiben). Ein *rvalue* muss keinen Speicherplatz haben, es kann eine temporäre Zahl sein:

```c++
int func() {
  return 10;  
}
...
int i = func();
```

Hier liefert auch *func* einen *rvalue*, es gibt keinen Speicherplatz, der adressiert werden könnte. der 10er ist temporär.

### Referenzen auf lvalue, rvalue

Auf einen *lvalue* kann einfach eine Referenz erstellt werden:

```c++
void myFunc(int &num) {...
```

damit wird einfach mit dem Speicherplatz gearbeitet in welchem die Variable *num* liegt. Dieser Aufruf akzeptiert keinen *rvalue*, von dem kann ja keine Adresse ermittelt werden.

Abhilfe kann sein:

```c++
void myFunc(const int &num) {...}

myFunc(10);
```

Mittels const kann auch ein rvalue übergeben werden. Damit wird eine Referenz auf eine extra temporär erstellte Variable erzeugt.

Es kann ebenfalls eine Referenz auf einen *rvalue* erstellt werden:

```c++
void myFunc(int &&num) {...
```

damit erhält man eine Fehlermeldung, wenn die Funktion mit einem *lvalue* aufgerufen wird.

Auf diese Art kann eine Funktion ermitteln ob sie mit einem *lvalue* oder einem *rvalue* aufgerufen wurde. Damit kann dann ein Wert direkt verwendet werden (*move-semantic*) (temporär-der würde ja sowieso gelöscht werden) oder ob er kopiert werden muss (*lvalue* kann ja woanders auch verwendet werden).

Sehr gute Videos:

https://www.youtube.com/watch?v=fbYknr-HPYE
https://www.youtube.com/watch?v=ehMg6zvXuMY
https://www.youtube.com/watch?v=OWNeCTd7yQE

## 



