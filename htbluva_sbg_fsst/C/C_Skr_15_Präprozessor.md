# 16 Präprozessordirektiven

Präprozessordirektiven werden nicht vom Kompiler übersetzt. Sie werden vor der Übersetzung vom Präkompiler verarbeitet, unter anderen gibt es:

- Makros - #define

  Beschreibung siehe unten.

- Einfügen von Dateien - #include

  Mit einer #include-Anweisung wird die folgende Datei an dieser Stelle einkopiert. Wird die Datei in spitzen Klammern  \<filename\>  angeführt, dann wird die Datei im Bibliothekspfad gesucht. Wird die Datei in doppelten Anführungstrichen "filename" angeführt, dann wird zuerst im Pfad der aktuellen Datei gesucht.

- Bedingte Übersetzung #if, #ifdef, #ifndef beziehungsweise #elif, #else und #endif

  Durch #if Anweisungen können dem Kompiler Programmteile ausgeblendet werden.

##Makros (#define)

- Werden durch das Schlüsselwort **#define** eingeleitet
- Präprozessor-Direktiven werden **vor** der Übersetzung (Kompilierung) des Programms ersetzt (durch den Präprozessor)
- Kann Parameter beinhalten *#define       MAX(x,y)     (x > y ? x : y)*

Bevor ein Programm übersetzt (kompiliert) wird läuft ein Präprozessor über den Quellcode und bereitet damit den Code vor. Dabei werden sämtliche Kommentare und Leerzeilen entfernt, es werden Inhalte der inkludierten Dateien (Schlüsselwort **#include**) einkopiert und eben auch Makros erweitert. Das Raute-Zeichen # leitet Anweisungen an den Präprozessor ein (daher Präprozessor-Direktiven).

## Definition

Makro werden mit dem Schlüsselwort **#define** definieren:

```c
#define MAXLEN 10
```

Mit dieser Definition werden im Quellcode sämtliche MAXLEN Terme im Quellcode durch die Zahl 10 ersetzt. Die Ersetzung ist nicht auf Zahlen beschränkt, es funktioniert auch:

```c
#define int unsigned char
int main() {
    int i = 0xFFFFFFFF;
    printf("%i", i);
}
```

Hier wird **int** durch **unsigned char** ersetzt (Makroname  vom ersten Buchstaben bis zum Leerzeichen). Der Kompiler gibt keinen Fehler aus. Code kann auf diese Weise sehr schnell unlesbar werden, daher werden Makros gesperrt groß geschrieben.

## Referenz

- Sehr gut:

  https://www.tutorialspoint.com/cprogramming/c_preprocessors.htm

## Fragen

- Definieren Sie ein Makro zur Ermittlung des Mittelwerts zwischen zwei Zahlen.
- Wie können Sie im Code eine Präprozessordirektive erkennen?

