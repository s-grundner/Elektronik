# 3 Streams

Der Vorteil von Streams gegenüber den Ein-/Ausgabefunktionen von C ist die Typsicherheit. Mit der Überladung der Stream-Operatoren entscheidet der Compiler welche überladene Funktion verwendet wird.

## String-Streams

Zum Zusammensetzen von Strings aus gemischten Datentypen bieten sich die *stringstream*-Klassen aus *sstream.h* an, die wie ein Ein- beziehungsweise Ausgabestrom funktionieren und das Ergebnis in den Hauptspeicher schreiben. Out-Streams sind lediglich für das Schreiben in den Stream, In-Streams sind für das Lesen aus dem Stream. Statt dieser Streams können auch immer String-Streams für beidseitige Zugriffe verwendet werden.

### ostringstream

Streamen in einen String mittels *ostringstream*:

```c++
#include <sstream>		// notwendig fuer ostringstream
#include <string>
...
ostringstream ossVar;
ossVar << 4711 << " Koelnisch Wasser";
...
string stringVar = ossVar.str();
...
cout << stringVar;
```

Damit können Manipulatoren verwendet werden:

```c++
ostringstream ostr;
ostr << 10 << " = 0x" << hex << 10 << " = o"<< oct << 10;
cout << ostr.str() << endl;		// fuer Ausgabe stream mit .str() konv.
```

### istringstream

Umgekehrt kann mit der Klasse *istringstream* ein String in eine Zahl konvertiert werden:

```c++
#include <sstream>
...
std::istringstream issVar("123");

int num;
issVar >> num;

cout << num*2;
```

Beispiel:

```c++
#include <sstream>
#include <string>
...
int x;
double d;
string stringVar("123 3.14");
istringstream inputStream(stringVar);
inputStream >> x;
inputStream >> d;
cout << x;
cout << d;
...
```

Der String darf natürlich auch mehrere Werte enthalten, die dann einzeln ausgelesen werden.

## File-Streams

Sehr ähnlich der String-Streams stellt *fstream.h* die folgenden Klassen zur Verfügung:

```c++
std::ifstream
std::ofstream
std::fstream
```

### Öffnen/Schließen

Mit der *open*-Methode kann ein Datei-Stream zum Schreiben/Lesen geöffnet werden:

```c++
#include <fstream>
...
ofstream fileVariable1(dateiname);			// Variante 1
...
ofstream fileVariable2;				   		// Variante 2
fileVariable2.open(dateiname);
```

Der Datei-Stream *fileVariable1* bzw. *fileVariable2* kann genauso wie *std::cout* benutzt werden. Zusätzlich kann für die Datei ein zweiter Parameter angegeben werden:

```c++
.open(dateiname, ios::openmode)
```

Damit wird Lesen oder/und Schreiben festgelegt. Der Mode kann unter anderem `ios::in`, `ios::out`, `ios::app` (*append*), `ios::binary` sein.

Geschlossen werden Datei-Streams mit der *close*-Methode:

```c++
fileVariable.close();
```

### Schreiben in eine Datei

Beispiel: Schreiben der Quadratzahlentabelle in eine Datei.

```c++
#include <iomanip>			// fuer setw notwendig
#include <fstream>

const int MAX = 100;

int main(int argc, char *argv[]) {
  int i, sqr;
  ofstream file("c:\\temp\\squares.txt");	// Datei zum Schreiben Öffnen
  for (i = 1; i <= MAX; i++) {
    sqr = i * i;
    file << "Zahl: " << std::setw(4) << i << ", Quadrat:" << std::setw(8)
        << sqr << std::endl;	//setw: Zahl wird mit Breite 4 geschrieben
  }
  file.close();
}
```

### Lesen aus einer Datei

Das Lesen aus einer Datei funktioniert analog zum Lesen aus dem Stream cin. Wird aus einem Stream ein String gelesen wird bis zum nächsten *Whitespace* gelesen. Unter Whitespaces versteht man die Gruppe der nicht sichtbaren Zeichen: Leerzeichen, Zeilenumbruch, Tabulator ...

Beispiel: Zeilenweises Einlesen und manuelles Auftrennen der Strings.

```c++
// fgetline.cpp
#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main(int argc, char *argv[]) {
  char * filename = "telbook.txt";
  string::size_type idx;
  string line;
  string nickname, name, number;
  ifstream fi(filename);		// Datei zum Lesen Oeffnen
  while (getline(fi, line)) {	// Bis getline false liefert --> Dateiende
    idx = line.find(":");
    if (idx == string::npos) continue;
    nickname = line.substr(0, idx);
    line = line.substr(idx+1);
    idx = line.find(":");
    if (idx == string::npos) continue;
    name = line.substr(0, idx);
    number = line.substr(idx+1);
    cout << "<nickname>" << nickname << "</nickname>" << endl;
    cout << "<name>" << name << "</name>" << endl;
    cout << "<tel>" << number << "</tel>" << endl;
  }
  fi.close();
}
```

**Zeile Lesen:**

In Dateien ist es häufig hilfreich, wenn Zeilenweise eingelesen wird. Dafür gibt es die *getline*-Funktion:

- *std::getline(inStream, str)*: Lesen vom Stream *inStream* nach string str
- *inStream.getline(cstr, len)*: Lesen vom Stream *inStream* nach C-String cstr, maximal len Zeichen

als weiterer Parameter kann ein char-Delimiter angegeben werden. Bis zu diesem Delimiter wird in cstr eingelesen (an Stelle des Standard-Werts '\n').

Diese Funktionen liefern 0 im Fall, dass *eof()* gelesen wird (Strg-Z für Windows).

Zusätzlich werden diverse Flags gesetzt (*stream*.eof()):

- *eofbit*: Ende des Streams (End of File ...)
- *failbit*: Wenn ein ungültiges Zeichen gelesen wird (wie auch End of File)
- *badbit*: Ein sonstiger Fehler

Typische Anwendung: zeilenweise Lesen aus einer Datei. Mittels Stream-Operator << wird nicht bis zum Zeilenumbruch sondern bis zum nächsten Whitespace (Leerzeichen, Tabulator, Zeilenumbruch ...) gelesen.

### Fehlerbehandlung

Beim Öffnen eines File-Streams ist es sinnvoll auf Fehler zu prüfen:

```c++
ofstream myCoolFile;
myCoolFile.open("c:\\temp\\coolFile.txt", ios::out|ios::binary);
if (!myCoolFile) {
    // Dateizugriff fehlerhaft (nicht vorhanden, keine Rechte ...)
}
```

(in den hier angeführten Beispielen wird darauf verzichtet um die Code-Beispiele übersichtlich zu halten)

Alternativ mittels *Exception*:

```c++
#include <iostream>     // std::cerr
#include <fstream>      // std::ifstream

int main () {
  std::ifstream file;
  file.exceptions (std::ifstream::failbit | std::ifstream::badbit );
  try {
    file.open ("notExistingFile.txt");
    while (!file.eof())
        file.get();
    file.close();
  } catch (std::exception &e) {
    std::cerr << "Exception opening/reading/closing file\n";
  }

  return 0;
}
```

### Binäre Datei

Binärdatei: 0 wird als 0 geschrieben/gelesen.
Textdatei: 0 wird ASCII kodiert als 48 geschrieben/gelesen.

werden Dateien mit einem Editor geöffnet, dann konvertieren die meisten Editoren die gelesenen Bytes als ASCII kodierte Zeichen

Testen Sie:

```c++
ofstream file;
file.open("thatFile.bin", ios::out|ios::binary);

file.put(0);
file << 0;
```

Mit *put* wird das zu schreibende Byte geschrieben (ohne ASCII-Konvertierung). Mit << wird 0 ASCII kodiert geschrieben. Zum Schreiben von 100: ASCII kodiert wird ein Einser und 2 Nullen in die Datei geschrieben (3 Bytes). Binär wird die Zahl 100 geschrieben (1 Byte).

Für mehr als ein einzelnes Zeichen gibt es *write*: 

```c++
file.open("c:\\temp\\squares.txt", ios::out|ios::binary);

char buf[] = {1,2,3,4,5};
file.write(buf, 5);
```

Damit können etwa ganze Strukturen oder Felder geschrieben werden:

```c++
myStruct myStructElem = {"James", "Bond", 7, 1956};
file.open("c:/temp/myName.bin", ios::out|ios::binary);
file.write((char*)&myStructElem, sizeof(myStructElem));
```

Zum Lesen:

```c++
ifstream file;
file.open("thatFile.bin", ios::in|ios::binary);

file.get(zeichen);
cout << zeichen;
file.get(zeichen);
cout << zeichen;
```

Mit *get* wird binär eingelesen, d.h. ein A wird als 65 in die *char*-Variable eingelesen. Mit *cout* wird die *char*-Variable als Zeichen interpretiert und in ein 'A' umgewandelt.

Um wiederum mehrere Bytes auf einmal einzulesen:

```c++
ifstream file;
char buf[10];

file.open("thisFile.bin", ios::in|ios::binary);

file.read(buf, 10);
cout << buf;
```

Für obiges Strukturbeispiel:

```c++
myStruct myStructElem;
file.open("c:/temp/myName.bin", ios::in|ios::binary);
file.read((char*)&myStructElem, sizeof(myStructElem));
```

## Operatoren

### Einfügeoperator <<

Der Einfügeoperator schreibt den Wert eines String-Objekts auf einen Output-Stream.

```c++
cout << "Java Rocks" << endl;
```

### Extraktionsoperator >>

Der Extraktionsoperator ließt einen Charakter-String von einen Input-Stream.

```c++
cin >> str1;
```

## Referenzen

- Stream-Manipulatoren

  http://www.cplusplus.com/reference/library/manipulators/

  auf Deutsch:

  http://www.willemer.de/informatik/cpp/iostream.htm

- fstreams

  www.cplusplus.com/reference/fstream/

