# 1 C2C++

## Compiler

- c:

  ```
  >gcc -c main.c
  >gcc main.o -o myProg.exe
  ```

- c++:

  ```
  >g++ main.cpp -o myProg.exe
  ```

## Symbolische Konstante

K&R-C kennt nur symbolische Konstanten, die mit Hilfe der Präprozessor-Direktive  *#define* definiert werden können.

```c
#define M 100
#define N 2*M
```

Im C-Quelltext, der dem Compiler übergeben wird, erscheinen an den Positionen,  an denen symbolische Konstanten standen, Literale (1, 0, 'a' ...). Symbolische Konstanten werden rein formal ersetzt, der Präprozessor ist nicht in der Lage, Typprüfungen durchzuführen.

### Der Typ-Modifizierer const
Mit ANSI-C wurde das Schlüsselwort *const* als so genannter *Typ-Modifizierer* eingeführt: Einer Variablen-Definition kann das Schlüsselwort *const* vorangestellt werden.  Der Wert der derart deklarierten Variablen muss während der Definition zugewiesen werden und kann nicht durch direkte Zuweisungen verändert werden.

Beispiel:

```c
const n = 100;             /* Typ  int  wird angenommen */
const float eps = 0.005;

const int* pc;             /* Zeiger auf konstanten Integer */
int* const cp;             /* konstanter Zeiger auf Integer */
```

Es handelt sich dabei jedoch nicht um echte Konstanten. Die Werte sind zwar nicht auf direktem Wege veränderbar, es gibt jedoch indirekte Wege zur Manipulation.

Beispiel:

```c
const int i = 5;
i = 10;                 /* !!! Fehler !!! */
i++;                    /* !!! Fehler !!! */
```

Das folgende Beispiel zeigt, dass es in C ohne großem Aufwand möglich ist, den Wert von Konstanten zu manipulieren:

```c
const int i = 5;	// Konstante i = 5

int *ptr = &i;		// Zeiger auf i
*ptr = 6;			// Wert von i via Zeiger verändern
```

Je nach C-Compiler funktioniert dieser Code. Zumindest erhält man die Warnung "*initialization discards 'const' qualifier from pointer target type*". Mit einem expliziten Cast kann auch das umgangen werden:

```c
const int i = 5;		// Konstante i = 5

const int *ptr = &i;	// Zeiger auf die Konstante i
*(int *)ptr = 6;		// vor dem Ändern wird auf einen Zeiger auf ein int gecastet
```

Im Gegensatz dazu wird in C++ der Inhalt des konstanten Werts nicht verändert (durch den Type-Cast gibt's aber ebenfalls keine Fehlermeldung).

Wird *const* im Zusammenhang mit anderen Deklarationsanweisungen verwendet, so ist sehr genau auf die jeweilige Wirkung zu achten.

Beispiel:
```c
const struct s { int a, b; } x;             //  x  konstant
struct s  y;                                //  y  nicht konstant

typedef const struct s { int a, b; } stype;
stype x;                                    //  x  konstant
stype y;                                    //  y  konstant
```

Beispiel:

```c
// test-const-ptr.c
// gcc test-const-ptr.c -o test-const-ptr.exe
#include <stdio.h>
int main(void){
  char* mybuf = "12345";
  char* yourbuf = "abcde";

  char* const const_buf_ptr = mybuf;     /* konstanter Zeiger */

  *const_buf_ptr = 'a';

  const_buf_ptr++;                       /* !!! Fehler !!! */         
  const_buf_ptr = yourbuf;               /* !!! Fehler !!! */
	
  return 0;
}
/* Ausgabe:
test-const-ptr.c: In function ‘main’:
test-const-ptr.c:14: error: increment of read-only variable ‘const_buf_ptr’
test-const-ptr.c:15: error: assignment of read-only variable ‘const_buf_ptr’
*/
```

Die Anwendungsmöglichkeiten von *const* in C und C++ unterscheiden sich ein wenig.
Beispiel:

```c
const int max = 255;
int array[max];       /* Erlaubt in C++, 
                         nicht zulaessig in den vielen C Systemen,
                         ausser C99 Standard */
```

In ANSI-C kann in dieser Situation nur mit Makros gearbeitet werden:

```c
#define max 255
int array[max];
```

Hier noch ein Beispiel mit Zeichenketten:

```c
#include <stdio.h>
int main(void){
  char* const p1 = "John";	// p1 ist const, wert "John" ist nicht const
  *p1 ='A';					// erlaubt
  //p1 = "abc"; 			// nicht erlaubt, weil p1 const ist
		
  const char* p2 = "Mary";	 // p2 ist nicht const, wert ist const
  //*p2 = 'C'; 				// nicht erlaubt, weil wert const
  p2 = "Margareth";  		// erlaubt, weil p2 nicht const ist

  return 0;
}
```
Hier wird deutlich: eine Zuweisung *p1 = 'A' verändert den ersten Buchstaben der Zeichenkette. p1 = "abc" legt das Zeichenketten-Literal in einem neuem Speicherbereich ab und weißt die Adresse zu.

### Fragen

Streichen Sie das Wort "*nicht*" an den richtigen Stellen durch:

1) 

```c
const struct s { int a, b; } x;             /*  x  nicht konstant  */
struct s  y;                                /*  y  nicht konstant  */

typedef const struct s { int a, b; } stype;
stype x;                                    /*  x  nicht konstant  */
stype y;                                    /*  y  nicht konstant  */
```
2)
```c
int main(void){
	char* const p1 = "John";	// p1 ist nicht const, wert ist nicht const
	*p1 ='A';					        // nicht erlaubt
	p1 = "abc"; 				      // nicht erlaubt, weil p1 nicht const ist

	const char* p2 = "Mary";	// p2 ist nicht const, wert ist nicht const
	*p2 = 'C'; 					      // nicht erlaubt, weil wert nicht const
	p2 = "Margareth";  			  // nicht erlaubt, weil p2 nicht const ist

	return 0;
}
```

## struct

In C muss ein Strukturbezeichner immer mit dem Schlüsselwort *struct* zusammen verwendet werden:

```c
struct myStruc{ ... };
...
struct myStruc myVar;	// myVar ist eine Struktur-Variable, struc muss angef. werden
```

In C++ kann auf das Schlüsselwort (außer in der Definition) verzichtet werden:

```c++
struct myStruc{ ... };
...
myStruc myVar;	// myVar ist eine Struktur-Variable, struc MUSS NICHT angef. werden
```

Weiterer großer Unterschied: in C++ ist *struct* nahezu gleichbedeutend mit *class* (einer Klasse). Es gibt nur einen sehr feinen Unterschied: die Standard-Sichtbarkeit in einer *struct* ist *public* und für *class* *private* (das gilt auch beim Ableiten).

## Konsolenausgabe, Einlesen von Werten

Ausgabe in C: *printf*, Ein-/Ausgabe in C++: *cout*/*cin*

*cin*/*cout* sind *stream*-Objekte der Klassen *istream* und *ostream* der Bibliothek \<iostream\> (wie auch cerr und clog). Vorteil von den stream-Klassen gegenüber *printf*: Operatoren << >> können überladen werden.

Mit *stream*s wird in C++ mittels Stream-Operator gearbeitet "<<" und ">>". Häufig verwendete Formatspezifizierer:

- endl - EndLine/Zeilenumbruch und zusätzlich flushen des Buffers - dieses flushen kann teuer sein. Grundsätzlich ist "\n" zu bevorzugen
- dec - Ausgabe einer Zahl im Dezimalformat (cout << dec << 10;)
- oct - Ausgabe einer Zahl im Oktalformat (cout << oct << 10;)
- hex - Ausgabe einer Zahl im Hexadezimalformat (cout << hex << 16;)
- allgemein für cout [`std::cout.flags ( std::ios::right | std::ios::hex | std::ios::showbase );`]

siehe Referenz, z.B. http://www.cplusplus.com/reference/ios/ios_base/flags/

```c++
int var;
cout << "Geben Sie eine Zahl ein: " << endl;
cin >> var;
```
## Namespace

für größere Projekte ist eine Organisationsstruktur (ähnlich *package* in JAVA) geschaffen worden. Es kann in einem Projekt mehrere gleichbenannte Funktionen geben. Um zwischen den unterschiedlichen Funktionen unterscheiden zu können werden sie in Namensräumen implementiert bzw. über diese aufgerufen:

```c
namespace MeinBereich {
	Funktionen, Datentypen ...
}
```

 Aufruf über "Bereichsauflöser":

```c
MeinBereich::myFunc();
```
Alternativ:

```c
using MeinBereich;
using MeinBereich myFunc;
```
Wir verwenden sehr häufig *std*. Kürzer und komfortabler wirkt oft (gerade am Anfang) die Abkürzung

```cpp
using namespace std;
```

besser ist die Verwendung des Prefix *std::* weil es erstens die Zugehörigkeit einer Komponente besser darstellt und ein wichtiger Grund in größeren Projekten: wenn die *using* Variante in einem h-File verwendet wird ist sie automatisch in sämtlichen einbindenden Komponenten vorhanden und kann dort Funktionen unbemerkt überschreiben.

## Funktionsaufruf mit Standardwerten

Im Prototyp von C++ Funktionen können Standardwerte vorgegeben werden:

```c
void myFunc(int a = 3, int b = 2);		// oder: void myFunc(int = 3, int = 2 );    <-- ohne Variablename
```

So kann die Funktion auch ohne Parameter aufgerufen werden:

```c
myFunc();   // automatisch: a = 3, b = 2
```

oder auch:

```c
myFunc(4);	// a = 4 und automatisch: b = 2
```
Von Hinten beginnend können auch nur Teilen der Parameter Standardwerte vorgegeben werden:

```c++
void myFunc(int a, int b = 2); // damit muss zumindest a immer mitgegeben werden
```

## Variablen-Deklaration in for-Schleife

In C++ kann eine Variable auch im *for*-Schleifen-Kopf definiert werden:

```c
for (int i = 0; i < size; i++) { ... }
```

In *while*-Schleifen funktioniert das nicht.

## Zugriff auf überladene, globale Variable

funktioniert mit dem Geltungsbereichsoperator (Scope-Resolution-Operator / Bereichsauflöser):

```c
int var = 3;
void main() {
	int var = 4;
	var = ::var;	// lokales var wird mit globalem var (3) überschrieben
	...
```
## Inline-Funktionen

Mit dem Attribut *inline* ersetzt eine Funktion bei der Kompilierung den Aufruf (kein Sprung zur Funktion):

```c
inline int myFunc(int a, int b)
```

Das ist ähnlich einem Makro. Vorteil gegenüber Makro: es findet eine Compiler-Überprüfung statt (im Makro nicht). Weiters kann eine inline-Funktion Laufzeitvorteile bringen (kein Stack-Kopieren ...). Achtung: inline ist eine Empfehlung an den Compiler, der muss sich nicht unbedingt daran halten.

## Funktionen überladen

In C++ können Funktionen überladen werden.

## Einbinden von C-Code:

Soll eine C-Funktion eingebunden werden, dann ist als Attribut *extern "C"* vor die Funktion zu setzen. Dadurch wird dieser Programmteil mit einem C-Compiler übersetzt. Prototyp:

```c
extern "C" int comp( const void *a, const void *b);
```

Implementierung:

```c
extern "C" {
  int comp (const void *a, const void *b) {
    return strcmp( *(char **)a, *(char **)b);
  }
}
```
## Referenz-Operator

- Mit *int &a = b;* kann eine Referenz auf *b* erzeugt werden. Mit *a++* wird gleichzeitig *b* erhöht. Eine Referenz muss immer initialisiert werden. Das ist wie ein anderer Name auf die gleiche Variable.

- Referenzen als Rückgabetyp

  ````c++
  int &zahl() { return myval; }
  ````

  gibt eine Referenz auf die globale Variable *myval* zurück. Vorsicht bei Rückgabe einer Referenz auf eine lokale Variable. Wenn diese nicht mehr existiert ist die Referenz ungültig. Später werden wir sehen, diese Anwendung hat erst richtig Sinn, wenn dynamische Objekte erzeugt werden.

- Unterschied Referenz -> Pointer:

  - Pointer kann neu zugewiesen werden, Referenz nur bei der Initialisierung
  - Pointer hat eigenen Speicher für die Adresse, die Referenz nicht.

## Variablen Initialisierung

In C++ können alle Variable mit {} Initialisiert werden:

```c++
int num1{10};							// num1 <- 10
int num2{};								// Initialisiert num2 auf 0 (Default-Wert)

const char *str1{"abc"};   // str1 zeigt auf den const-char-String "abc" mit 0-Term.
const char str2[]{"abc"};  // str2 ist ein char-array "abc" mit 0-Term
string str3{"abc"s};       // str3 ist ein string "abc"

int *ptr{&num1};					 // ptr zeigt auf num1

int myArr[] {1,2,3,4,5};	 // myArr ist ein Array mit definierten Werten
```

In C++ ist ein "..."-String automatisch ein *const-char-C-String*. Um ihn als *C++ String* darzustellen wird ein *s* hinten angehängt "..."s.

Der Unterschied zwischen einer in C++ klassischen Initialisierung mittels Zuweisung und der {}-Initialisierung ist, das kein unbeabsichtigter Informationsverlust passieren kann:

```c++
int num1 = 3.14;		// kein Fehler 3.14 wird "locker" in einen int gecastet
int num2{3.14};			// FEHLER: narrowing - 3.14 passt nicht in int
```

Diese Prüfung kann auch später eingefordert werden:

```c++
num3 = {4.5+num1};	// FEHLER: narrowing - mit 4.5 wird das Ergebnis auf float gecastet
```

(

Alternative Initialisierungen:

```c++
int num = {1};  // Aufruf über Copy-Konstruktor
```

oder (diese Varianten sind allerdings *überholt* aber noch häufig anzutreffen.)

```c++
int num(1);
```

)

## Type-Cast

Auch wenn sie nach wie vor funktionieren, C-Type-Casts sind nicht gewünscht, es erfolgt keinerlei Prüfung ob eine Konvertierung sinnvoll ist oder fehlerhaft sein kann. In C++ gibts für diese Zwecke (neben weiteren) diese Alternative:

```c++
static_cast<NewType>(variable)
```

Das implizite Casten wird mit ebendieser Variante gelöst.

## Referenzen

- Gute Referenz

  http://www.cplusplus.com/
  
- Komplettes Referenzhandbuch
  https://de.cppreference.com/w/

## Fragen

- Wie unterscheidet sich ein *const* vor einer Integer-Definition in C von einer in C++?
- Was bewirkt ein *const* vor einer Zeiger-Definition?
- Wie funktioniert eine Ein-/Ausgabe in C++?
- Welche Funktion hat ein *Namespace*?
- Was bedeutet die Funktionsdefinition: `void myFunc(int a = 3, int b = 2);`?
- Wie kann in C++ auf überladene Variable zugegriffen werden?
- Wodurch unterscheidet sich eine *Inline*-Funktion von einer einfachen Funktion?
- Wie kann C-Code in C++ eingebunden werden?

