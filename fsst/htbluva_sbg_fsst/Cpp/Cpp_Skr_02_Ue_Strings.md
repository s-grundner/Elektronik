# 2 Strings - Übungen

## C++ mit C-Strings

### URL aufsplitten (003)

Zerlegen Sie einen URL, der von der Konsole eingelesen wird, mit Hilfe der C-Funktionen in seine einzelnen Bestandteile Protokoll, Server und Pfad.

Beispielhafte Ausgabe in der Konsole:

```
Url eingeben: http://rechner.org/pfad1/pfad2/datei.html

Protokoll: http
Server: rechner.org
Pfad: /pfad1/pfad2/datei.html
```

### String aufsplitten (004)

Zerlegen Sie einen QUERY_STRING, der von der Konsole eingelesen wird.

Aufbau:

Feldname=Wert&Feldname=Wert....

Beispielhafte Ausgabe in der Konsole:

```
QUERY_STRING eingeben:vorname=Max&nachname=Mustermann&tel=1234

Feldname: vorname
Wert: Max
Feldname: nachname
Wert: Mustermann
Feldname: tel
Wert: 1234
```

### C-Strings

Kopieren Sie in die folgenden Strings str1 und str2 den Wert von str *Hinweise, Beispiele und Einstellmöglichkeiten* ein:

```c++
char *str = "Hinweise, Beispiele und Einstellmöglichkeiten";
char str1[100] = "0123456789 123456789 123456789 123456789 123456789 123456789 ";
char *str2 = "0123456789 123456789 123456789 123456789 123456789 123456789 ";
```

verwenden Sie *strncpy* oder Zuweisungen dazu.

## C++ mit Stringklasse

### Read Text

Lesen Sie von der Tastatur einen Text (der Text darf auch Leerzeichen enthalten) ein. Wiederholen sie das Einlesen solange bis *q* eingegeben wird. Hängen Sie die eingelesenen Teile aneinander in eine String-Variable und geben Sie in der Kommandozeile aus.

### URL aufsplitten (005)

Beispiel: Auftrennen eines oder mehrerer URLs in ihre Bestandteile.

```c++
#include <iostream>
#include <string>

void splitUrl(std::string s) {
  std::string protocol, server, port, path;
  std::string::size_type pos, pos1;
  std::cout << "URL: " << s << std::endl;

  //Doppelpunkt suchen
  pos = s.find(":");
  if (pos != std::string::npos) {
    protocol = s.substr(0, pos);
  
    // ://überspringen
    s = s.substr(pos+3);
  } else {
    protocol = "http";
  }
  // Serversuchen Trennzeichen : oder /
  pos1 = s.find(":");
  pos = s.find("/");
  if (pos == std::string::npos) {
    server = s;
    port = "80";
    path = "/";
  } else if(pos1 != std::string::npos && (pos1 < pos)) {
    server = s.substr(0, pos1);
    port = s.substr(pos1 + 1, pos - pos1 - 1);
    path = s.substr(pos);
  } else {
    server = s.substr(0, pos);
    port = "80";
    path = s.substr(pos);
  }
  std::cout << "Protokoll:" << protocol << std::endl;
  std::cout << "Server:   " << server << std::endl;
  std::cout << "Port:     " << port << std::endl;
  std::cout << "Pfad:     " << path << std::endl;
}

int main(int argc, char *argv[]) {
  std::string s;
  for (int i = 1; i < argc; i++) {
    s = std::string(argv[i]);
    splitUrl(s);
  }
}
```

Jedes Kommandozeilenargument wird als URL (http://www.bestsiteever.com:80/one/two/index.html) betrachtet und einzeln aufgetrennt.

### String umkehren (006)

Kehren Sie einen eingegebenen String um:

Katze → eztaK

### Palindrom (007)

Prüfen Sie, ob ein String ein Palindrom ist. Ein Palindrom ergibt von vorn und von hinten gelesen das Gleiche (z.B. ANNA, STETS, OTTO).

### ISBN (008)

Bauen Sie einen ISBN-Prüfer. Lesen Sie dazu die ISBN als String ein (ohne Striche). Prüfsummenberechnung: 

https://de.wikipedia.org/wiki/Internationale_Standardbuchnummer

**Erweiterung:**

Erlauben Sie die Eingabe der Striche in der ISBN. Entfernen Sie diese vor der Prüfung.

## Tabelle

Gegeben sind folgende Arrays:

```c++
unsigned int cols = 5;
unsigned int rows = 4;
wstring head[cols] = {L"Montag", L"Dienstag", L"Mittwoch", L"Donnerstag", L"Freitag"};
wstring body[rows][cols] = {{L"RK", L"FSST",L"BESP",L"AM", L"AM"},
                            {L"E",  L"FSST",L"RK",  L"GSK",L"HWE"},
                            {L"KSN",L"HWE", L"",    L"NW", L"DIC"},
                            {L"DIC",L"HWE", L"D",   L"AM", L"KSN"},
                           };
```

Für diese Arrays ist ein Programm zu schreiben dass folgende Ausgabe generiert:

```c++
╔════════════╦════════════╦════════════╦════════════╦════════════╗
║   Montag   ║  Dienstag  ║  Mittwoch  ║ Donnerstag ║  Freitag   ║
╠════════════╬════════════╬════════════╬════════════╬════════════╣
║     RK     ║    FSST    ║    BESP    ║     AM     ║     AM     ║
║     E      ║    FSST    ║     RK     ║    GSK     ║    HWE     ║
║    KSN     ║    HWE     ║            ║     NW     ║    DIC     ║
║    DIC     ║    HWE     ║     D      ║     AM     ║    KSN     ║
╚════════════╩════════════╩════════════╩════════════╩════════════╝
```

- die Spaltenbreite soll dabei die Breite des längsten Textes in der entsprechenden Spalte sein
- die Inhalte sollen automatisch zentriert ausgerichtet sein
- Wenn die Anzahl der Zeilen oder Spalten verändert wird, dann soll das Programm weiter richtig darstellen

Die gezeigten Sonderzeichen für das Zeichnen der Tabelle sind auf Codepage 850 (eigentlich Standard in der Windows-Dos-Konsole) zu finden. Für Windows-Benutzer kann die Codepage aus dem Programm eingestellt werden:

```c++
system("chcp 850"); 	// chcp=ChangeCodepage - Windows-Kommandozeilen-Befehl
```

Mit *system* kann ein Befehl des Systems ausgeführt werden. Rückgaben des Befehls landen automatisch in der Kommandozeile. Das kann nicht unterdrückt werden. Die Ausgabe kann allerdings umgeleitet werden mit *>*:

```c++
system("chcp 850 > NUL");
```

Inhalt der Codepage 850: https://de.wikipedia.org/wiki/Codepage_850

(Umschalten auf UTF-8:

```
#ifdef _WIN32 
#include <io.h>
#include <fcntl.h>
#endif
...
#ifdef _WIN32 
_setmode(_fileno(stdout), _O_U16TEXT);  
#endif
```

)