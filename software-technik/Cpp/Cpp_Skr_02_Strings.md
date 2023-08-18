# 2 Strings

Neben der C++-String-Klasse können Strings in C++ gleich wie in C behandelt werden (sogenannte *C-Strings*).

## C-Strings

In C werden Strings als *char*-Arrays vereinbart (Kette von Zeichen, "Zeichenkette"). Ein Character *char* ist 1 Byte groß. Die enthaltene Zahl enthält einen ASCII codierten Wert für ein darzustellendes Zeichen. In C/C++ ist der Zeichensatz eigentlich nicht definiert, der Standard gibt lediglich vor, welche Zeichen enthalten sein sollen. Der ASCII-Code definiert lediglich 7 der 8 verfügbaren Bits. Der String wird mit einem Nullbyte abgeschlossen. Das Array muss dafür ein Byte größer als die genutzte Stringlänge sein.

Werden unveränderliche Strings (Textkonstante, Literale) benötigt, kann ein *char*-Pointer erzeugt werden, der auf diese Textkonstante zeigt (es gibt keine Unterscheidung, ob ein *char*-Pointer auf ein einzelnes Zeichen oder einen String zeigt).

Eine weitere Möglichkeit ist das dynamische Erzeugen von Strings zur Laufzeit. Auch hier wird die Stringvariable als Pointer auf *char* vereinbart.

Ein C-String wird immer über die Referenz auf sein erstes Zeichen angesprochen, also über den Namen des *char*-Arrays oder die Pointervariable.

### Statische C-Strings

```c
char s1[11];		  // Str mit max 10 Zeichen, nicht init, s1 = ... funkt nicht
char s2[11] = "Hallo";// Str mit max 10 Zeichen, init, s2 = ... funkt nicht
char s3[3] = "abc";	  // Fehler beim Kompilieren: "abc\0" zu grosz
char s4[] = "C++";	  // Str mit 3 Zeichen, init, konst, s4 = ... funkt nicht
char *s5 = "Ada";     // Str mit 3 Zeichen, init, konst, strcpy(s5, "12") funkt nicht

char *s6;			  // Stringpointer, nicht init, strcpy(s6, ...) funkt nicht
s6 = "Stringliteral"; // Stringpointer zeigt auf konst String
```

(das hier Erwähnte ist in dieser Tiefe nicht im Standard definiert, aber in aktuellen Compiler/OS-Versionen üblich)

Zur Erinnerung (C-Arrays): wann immer ein Array teilinitialisiert wird, dann werden sämtliche Elemente zumindest auf 0 initialisiert: `char s2[100] = {'a'}` initialisiert 99 Elemente auf 0.

Für die Array-Variante der Definition von Strings gilt: der *char*-Pointer auf das erste Zeichen kann nicht verändert werden. Er zeigt immer auf die gleiche Speicherzelle. Daher funktionieren Zuweisungen wie `s2 = "Du da";` nicht, da ja der Zeiger auf die neue String-Konstante (Literal) zeigen müsste.

Die Zeigervariante der Definition ermöglicht im Gegensatz dazu, dass der Zeiger verändert werden kann. Allerdings wird kein Speicherplatz zum Verändern mit erzeugt, wodurch kein String einkopiert werden kann (außer es wird Speicher mit *malloc* mit reserviert). Korrekt müsste der Zeiger immer auf ein `const char` zeigen.

String-Literale ("...") sind immer vom Typ Array aus *const char* und werden immer automatisch mit '\0' (*EndOfString*) erweitert.

### Dynamische C-Strings, new-Operator

Um mittels Zeiger dynamisch mit Strings arbeiten zu können muss in C über Speicherreservierung (*malloc*) und Freigabe (*free*) gearbeitet werden. In C und C++ ist keine variable Array-Größe (Größendefinition durch Parameter oder Eingabe) erlaubt (erst ab C99 oder mit Spracherweiterungen).

In C++ kann ein String dynamisch mit *new* reserviert werden (es wird empfohlen nur diese Variante anstatt *malloc* zu verwenden). Nach der Verwendung ist auf eine Freigabe mittels *delete* (anstatt *free*) zu achten.

```c++
#include <cstring>
...
char* dynString = new char[laenge];	// char-Arr der Groesse laenge wird angelegt und mit Zeiger verlinkt
dynString[0] = 'A';									// Zugriff zeichenweise
...
dynString[laenge-1] = '\0';

strncpy(dynString, vorhandenerString, maxLaenge);	// Kopieren mittels C-String-Meth
dynString[laenge-1] = '\0';  				// wenn vorh String zu Lange wird \0 nicht mitkopiert

delete [] dynString;								// Freigabe des reservierten Speichers
```

Hinweis *strncpy*:
Wenn der vorhandene String länger als die maximale Länge ist, ist das letzte kopierte Zeichen kein 0-Byte, womit die Länge des Zielstrings nicht mehr bestimmt werden kann. Deshalb sollte nachträglich das letzte Byte des Zielstrings definiert auf 0 gesetzt werden.

Beispielstrings:

```c++
#include <stdio.h>
#include <string.h>

int main() {
  char s1[11];
  char s2[11] = "Hallo";
  char s3[] = "C++";
  char *s4 = "Ada";
  char *s5 = NULL;

  printf("s1: <<%s>>\n", s1);
  printf("s2: <<%s>>\n", s2);
  printf("s3: <<%s>>\n", s3);
  printf("s4: <<%s>>\n", s4);
  s5 = "Java ist einfacher!"; // Stringpointer zeigt auf festen String
  printf("s5: <<%s>>\n", s5);

  s5 = new char[11]; // neuen String erzeugen und s5 drauf zeigen

  //strcpy(s5, "Visual Basic ist ganz simpel!");	// Bufferoverflow!!!
  strncpy(s5,"Visual Basic ist ganz simpel!", 11);	// Wert reinkopieren
  printf("s5: <<%s>>\n", s5);	// Schlussbyte fehlt!
  s5[10] = '\0';			// Nullbyte anhängen
  printf("s5: <<%s>>\n", s5);

  delete [] s5;	// mit <<new>> erzeugte Elemente muessen wieder geloescht werden
  return 0;
}
```

> In C++ können Strings gleich wie in C behandelt werden.
>
> Dynamische Strings können mit dem *new*/*delete*-Operator erzeugt und vernichtet werden.

## C++-Klasse *string*

In der Standard-Library ist die Klasse *string* enthalten (`#include <string>` und Namespace *std*), die das Arbeiten mit Zeigern überflüssig macht und Bereichsprüfungen vornimmt.

Erstellen von Strings:

```c++
string s0;                    // auch leere Strings duerfen erzeugt werden
string s1 = "Stringkonstante";// Einem C++-Str kann mittels C-String-Literal erzeugt werden.
string s2("Stringkonstante"); // gleichwertig
string s3 {'a'};              // Zeichen a
string s4 {s2};               // vollstaendige Kopie - Copy-Konstruktor
string s5 {7,'a'};            // aaaaaaa
string s6 {0};                // GEFAHR: Übergabe eines Nullpointers
```

Strings können mit den Operatoren + bzw. += verkettet werden (gleichbedeutend wie *append*). Allerdings muss zumindest ein Teilstring ein C++-String sein:

```c++ 
string stringVar("Hallo, ");
stringVar = stringVar + "Welt";
stringVar += "!!!!";
```

Frage: Warum funktioniert das Folgende nicht?

```c+
string stringVar;
stringVar = "stringkonstante1" + "stringkonstante2";
```

Antwort: Weil String-Literale C-Strings (*const char*) sind, für die der +-Operator nicht definiert ist.

Ein C++-String ist wie ein Feld organisiert, daher kann auf die einzelnen Elemente mittels Index zugegriffen werden:

```c++
string::size_type index;	// size_type entspricht unsigned int
...
char ch = stringVar[index];	// Achtung: keine Bereichspruefung - Alternative: stringVar.at(index)
```

Um die Länge einer Zeichenkette zu ermitteln kann die Methode *size* verwendet werden:

```c++
std::string::size_type len = stringVar.size();		// Laenge des Strings
```

Mit der *clear*-Methode kann eine Zeichenkette gelöscht werden.

### size - Länge eines String

Für die Länge eines Strings gibt es den eigenen Typ *size_type* - der ist in aktuellen Implementierungen ein *unsigned Integer*. Alternativ gibt es dafür einen Define *size_t*.

```c++
std::string::size_type len = stringVar.size();		// Laenge des Strings
```

### find - Suchen in einem String

Mittels *find*-Methode kann in einem String in ein String gesucht werden:

```c++
std::string suchstring("ll");
std::string stringVar="Hallo, ";
std::string::size_type index = stringVar.find(suchstring, 1);	// Suche Suchstring in stringVar beginnend an Pos 1

if (index == std::string::npos)
  cout << "nicht gefunden";
else
  cout << "gefunden, an der Stelle: " << index;
```

wird der String nach dem ersten Auftreten des Suchstrings durchsucht und der Anfangsindex zurück geliefert. Wird er nicht gefunden, ist der Rückgabewert die Konstante *std::string::npos* (ungültige Position).

Frage: Was wird im obigen Beispiel ausgegeben?

Antwort: *gefunden, an der Stelle: 2*

Ähnlich funktioniert die *rfind*-Methode. Diese Sucht nach dem letzten Vorkommen von links beginnend bis zur eventuell angegebenen Position.

### substr - Teilstring

Zum Ermitteln eines Teilstrings kann die *substr*-Methode verwendet werden. Der erste Parameter gibt den Beginn und der optionale, zweite Parameter gibt die Länge des Teilstrings an (wenn nicht vorhanden, dann bis ans Ende).

```c++
string str18 = "abcdefghi"
string str19 = str18.substr(6,2);
cout << str19 << endl; // "gh"
```

### insert - Einfügen

Mit der *insert*-Methode kann eine Zeichenkette an einer gewünschten Position in eine andere Zeichenkette eingefügt werden:

```c++
string s1 = "Hallo wie geht's?";
s1.insert(5, ", Hans");			// Hallo, Hans wie geht's?
```

### replace - Ersetzen

Mit der *replace*-Methode kann in einer Zeichenkette ein Teil durch eine weitere Zeichenkette ersetzt werden:

```c++
string s1 = "Hallo wie geht's?";
s1.replace(2, 15, "Welt!");			// an Pos. 2 werden 15 Zeichen ersetzt durch "Welt!": Hallo Welt!
```

### erase - Entfernen

Mit der *erase*-Methode können Teile aus einer Zeichenkette herausgeschnitten werden:

```c++
string s1 = "Hallo wie geht's?";
s1.erase(1,3);						// Loesche 3 Zeichen von 1 beginnend: "Ho wie geht's?"
```

Bei fehlender Längen-Angabe wird bis zum Ende der Zeichenkette ausgeschnitten.

### Konvertierungen

Um C-Strings in C++-Strings umzuwandeln, werden diese einfach im Konstruktor angegeben:

```c++
string cppString(cstringvar);	// c++-String-Variable  <-   c-String-Variable
string stringvar("Hallo");		// c++-String-Variable  <-   "Hallo"
string str; str = "C-String";	// C++-String Variable  <-   "C-String" 
```

Umgedreht erhält man einen C-String-Pointer auf einen C++String mittels der *c_str*-Methode.

```c++
char* cString = stringVar.c_str();
```

Numerische Konvertierungen:

```c++
x = stoi(s, p, b); 		// string s -> int x, mit b = Basis. In int Pointer p wird Anzahl der Zeichen zurückgegeben
x = stol(s, p, b);
x = stoul(s, p, b);		// long 
...					   // unsigned long, long long, unsigned long long, float, long double,
x = stoud(s, p);		// double
s = to_string(x);		// Konvertierung eines Gleitkomma- oder Ganzzahlwertes in einen String (ab C++11)
```

### Operatoren

#### Zuweisungsoperator =

Kopiert den Wert eines Strings in einen anderen String (echte Kopie, nicht nur Kopie einer Referenz).

```c++
std::string str1, str2, str3;
str1 = "Test string: ";   // c-string
str2 = 'x';               // single character
str3 = str1 + str2;       // string
```

#### Verkettungsoperator +, +=

Mit dem +-Operator können Zeichenketten verkettet werden:

```c++
std::string name ("John");
std::string family ("Smith");
name += " K. ";         // c-string
name += family;         // string
name += '\n';           // character
```

#### Vergleichsoperatoren ==, !=, <, >, <=, >=

Mit Vergleichsoperatoren können zwei Strings auf Gleichheit, Ungleichheit oder alphabetischer Reihenfolge geprüft werden.

#### Indexoperator []

Mit dem Indexoperator kann direkt auf ein Zeichen der Zeichenkette zugegriffen werden (Schreibend und Lesend). Bei Verwendung dieses Operators wird KEINE Bereichsüberprüfung vorgenommen (0 >= index > .size()). Alternative mit Bereichsüberprüfung:

```c++
string str = "Jack Black";
str.at(100);				// loest eine "out_of_range" Ausnahme aus
```

[] ist effizienter, .at() ist sicherer.

### Einlesen von Strings

#### cin - Wort

```c++
std::string str;
std::cin >> str;								// Jemand gibt "Hey there" ein
std::cout << str << std::endl;	// Ausgabe von "Hey"
```

*cin* liest nur bis zu einem *Whitespace* (Leerzeichen, Tabulator, Enter ...) ein. Sollen Strings samt Whitespaces eingelesen werden, dann kann das mittels Schleife passieren (dann ist allerdings nicht klar ob ein Tabulator oder ein Leerzeichen eingegeben wurde).

#### getline - Zeile

Zum Einlesen von mehr als einem Wort, bzw. wenn auch Whitespaces mitgelesen werden sollen, kann das mittels der Funktion *getline* erreicht werden.

```c++
std::string str;
getline(std::cin, str);
std::cout << str << std::endl;
```

Von *getline* gibt's auch eine komplett andere Variante, das hat *historische* Gründe.

### String Literale

Seit C++11 gibt's (unter anderen) das folgende **Raw-String**-Literal:

```c++
std::string str = std::string(R"(C:\temp\data.txt)");   // Raw-String-Literal
```

mit `R"(` und abschließenden `)"` wird eine Zeichenkette eingehüllt die nicht *interpretiert* werden soll - damit spielen Backslashes oder auch `"` innerhalb des Strings keine Rolle. Gerade für Reguläre Ausdrücke (später) erleichtern diese Literale die Lesbarkeit enorm. Wenn innerhalb des Strings zusätzlich noch etwa `)"` verwendbar sein soll, kann das auch angepasst werden, etwa so: `R"xyz(...")...)xyz"`.

## Wide-Character

Der ASCII-Zeichensatz bietet für viele moderne (und internationale) Anwendungen nicht genügend Zeichen. Ein Character hat 1 Byte und kann damit nur bis zu 256 verschiedene Zeichen codieren. Grundsätzlich codiert die Programmiersprache keine Zeichen.

- Wird über eine IDE ein Zeichen eingegeben, dann codiert die IDE das Zeichen je nach eingestellten Zeichensatz in die geöffnete Datei. Wenn die IDE auf einen UNICODE-Zeichensatz eingestellt ist (oft UTF-8), dann wird ein einfaches Sonderzeichen als mehrere Bytes abgelegt.
- Gibt ein C-Programm etwas an die Console, dann sind das Byte-Streams ohne zu Verstehen was die entsprechende Zahlenkombination steht. Wenn die Console die gleiche Codierung wie der Editor verwendet, dann gibt's mit der Darstellung kein Problem.

In vielen C-Varianten gibt es zusätzlich den Typen *wchar_t*

```c++ 
<stddef.h>
...
wchar_t z = L'a';		// L fuer Literal wchar_t

scanf("%lc", &z);

printf("%lc\n", z);
```

Die Größe von *wchar_t* ist nicht definiert und ist entweder 2 oder 4 Byte, je nach verwendetem Zeichensatz auf dem Zielsystem. Im kurzen Programmabschnitt können auch Sonderzeichen/Umlaute eingelesen werden und wieder ausgegeben werden. Als Literal dürfen sie nicht direkt eingegeben werden, da die Codierung des Source-Codes eine andere sein kann. 

In der Windows-Kommandozeile wird nicht der reine ASCII-Zeichensatz (7 Bit)verwendet, sondern eine Erweiterung (Codepage 850 bzw. DOS-Latin-1). Damit sind auch etliche europäische Sonderzeichen verfügbar.

Zusätzlich gibt's noch die Typen *char16_t* und *char32_t*. Sie bieten im Gegensatz zu *wchar_t* (Breite ist Systemabhängig) eine feste Breite. Die Literale dazu:

```c++
char      ->  'a'
wchar_t   ->  L'a'
char16_t  ->  u'a'
char32_t  ->  U'a'
```

### Wide-String

Analog zu den Wide-Character aus C gibt's in C++ die *wstring*-Klasse:

```c++
wstring str = L"Hallo\x96";
wcin >> str;				// Eingabe von äöüß moeglich
wcout << str << endl;   // oder wprintf...
```

Das End-Of-String-Zeichen ist dann ein *L'\0'*.

### Zeichensatztabellen

Standard-Strings (und auch c-Strings) sind nicht nach einem Zeichensatz kodiert. Sie beinhalten lediglich Nummern. Eine Interpretation welche Nummer welchem Zeichen entspricht erfolgt in der Ausführung (Kommandozeile ...) beziehungsweise in der IDE. Da in allen gängigen Codierungen (z.B. in Konsolen in Windows/UNIX/MaxOS ...) der Zahlenbereich der ASCII-Tabelle gleich codiert ist gibt's damit auch keine Probleme.

Der klassische C/C++ String gibt jedem Zeichen ein Byte. Um einen größeren Zeichensatz verarbeiten zu können, gibt es in modernen C/C++-Varianten neue Datentypen wie etwa *wchar_t* (w=wide). Das sind Zeichen mit einer Codierung die der Ausführungsumgebung entspricht. Damit können String-Literale definiert werden wie:

```c++
std::wstring str = L"Hallo Welt";
std::wcout << str << std::endl;
```

Abgeschlossen wird ein solcher mit einem Zeichen *L'\0'*. Je nach Zeichenkodierung gibt es unterschiedliche Zeichenliterale. Damit das direkt ausgegeben werden kann muss auch *cout* auf *wcout* verändert werden.

Beispiel (nur für Windows-Benutzer):

```c++
std::wstring str = L"Hall\x94" "chen Welt";
std::wcout << str << std::endl;
```

(https://www.torsten-horn.de/techdocs/encoding.htm) für die Windows-Kommandozeile ist für ö 0x94 zu verwenden (die Windows-Kommandozeile ist üblicherweise auf Codepage 850 eingestellt - das ist ebenfalls ein 1Byte Zeichensatz). Die Aufteilung des Strings ist notwendig da nach dem Code ein Leerzeichen notwendig ist.

## STL

Strings sind komplett an die STL angepasst. Daher ist eine Fülle weiterer Funktionen zusätzlich verfügbar - siehe Kapitel STL.

## Referenzen

- C++ String Literale
  https://en.cppreference.com/w/cpp/language/string_literal