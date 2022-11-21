# 8 Module - Übungen

##  DoppeltEinbinden

- Erstellen sie ein Projekt mit den beiden C-Dateien main.c und modul1.c.

- main.c

  ```c
  #include "modul1.c"		// direkt c-Datei einkopiert

  int main() {
      return 0;
  }
  ```

- modul1.c

  ```c
  void func() {
  }
  ```

- Beim Übersetzten zeigt sich ein Fehler "multiple definition of 'func'"

- Warum?

L: beim Übersetzten wird modul1.c und main.c kompiliert. Beim Kompilieren von main.c wird wieder modul1.c eingebunden. Damit wird der gleiche Code ein zweites mal kompiliert. Damit wird eine zweite func-Funktion erstellt und das ist nicht erlaubt.

Durch die (bessere) Verwendung einer h-Datei ändert sich dabei nichts. Erst wenn das Grüst:

```c
#ifndef MODUL1_H_INCLUDED
#define MODUL1_H_INCLUDED

...

#endif // MODUL1_H_INCLUDED
```

um den Code gelegt wird, wird damit sichergestellt, dass ein Code-Teil nur einmal eingebunden wird.

##  StringLib (321)

Implementieren der folgenden String-Funktionen in ein eigenes Modul string.h und string.c.

für Details siehe https://de.wikibooks.org/wiki/C-Programmierung:_Zeichenkettenfunktionen#strncat

- Aneinanderhängen von Zeichenketten: char* **strcat**(char* s1, char *s2)
- Aneinanderhängen von Zeichenketten: **strncat**(...)
- Kopieren von Zeichenketten:  **strcpy**(...)
- Kopieren von Zeichenketten:  **strncpy**(...)
- Länge einer Zeichenketten:  **strlen**(...)
- Vergleichen von Zeichenketten:  **strcmp**(...)
- Vergleichen von Zeichenketten:  **strncmp**(...)

Testfunktionen:

```c
char str1[100] = "hallo";
char str2[] = " wie geht's";

// strcat
printf("\"%s\" + \"%s\" = ", str1, str2);
printf("\"%s\"\n", strcat(str1, str2));
```

##  Hangman (322)

Realisieren Sie das bekannte Wortratespiel auf dem Computer. Zeigen Sie zunächst von einem zu ratenden Wort für die einzelnen Zeichen jeweils nur Striche an. Anschließend fragt das Programm nach Buchstaben. Sollten die eingegebenen Buchstaben im zu ratenden Wort vorkommen, so werden die entsprechenden Positionen aufgedeckt, d.h. an dieser Stelle werden die tatsächlichen Zeichen angezeigt. Durch Eingabe eines #-Zeichens kann das Raten abgebrochen werden und die Eingabe des vollständigen Worts ist nun möglich. Stimmt das eingegebene Wort mit dem verdeckten Wort überein, ist das Spiel zu Ende, ansonsten wird wieder in den obigen Buchstabenratemodus zurückgekehrt. Für die Programmerstellung sind folgende Dateien gegeben:

- main.c		Hauptprogramm
	 hangman.c	Implementierung der notwendigen Funktionen
	 hangman.h	Schnittstellenbeschreibung von hangman.c
	 makefile		Zur Erstellung des Programms in der Kommandozeile

Erstellen Sie ein Projekt in Ihrer IDE und fügen die Dateien ein. Anschließend sind in den Funktionen die fehlenden Passagen zu vervollständigen.

Mit dem beigefügten makefile kann das Progamm main.exe aus der Kommandozeile erstellt werden:

```
mingw32-make
```

(In Linux wird das ausführbare Programm einfach mit make erzeugt)

Tipp Zufallszahl:

```c
time_t t;
srand((unsigned) time(&t));	// Initialisierung
...
num = rand()%WORDS;   // Zufallszahl zwischen 0 und WORDS
```

##  Taschenrechner (323)

Ältere HP-Taschenrechner arbeiteten mit umgekehrt polnischer Notation (UPN). Dabei sind für eine Rechenopertation zuerst sämtliche notwendige Operanten einzugeben (diese werden auf einem Stapel abgelegt) und anschließend der Operator. Als Beispiel für eine Addition: 3, 2, + für eine Addition 3+2.

Hier sind die Dateien test_taschenrechner.c, doubleStack.c und doubleStack.h gegeben. Sie sind in ein Projekt einzufügen und so anzupassen dass sie funktionieren.

##  MyAlgo (324)

Gegeben sind ein main-Programm und eine h-Datei mit Funktionen die in Main verwendet werden. Implementieren Sie die fehlenden Funktionen sodass das Programm funktioniert.

##  Fakultät (325)

Erstellen Sie eine Funktion fakultaet() zur Berechnung der Fakultät (mathematische Funktion dargestellt durch !) einer Zahl:

- n! = 1 \* 2 \* 3 \* … \* n

-         0! = 1                und                 1! = 1
-         Fakultät von negativen Zahlen ist nicht definiert (Rückgabe der Funktion von -1)

Erstellen Sie ein Hauptprogramm:

-         Einlesen einer ganzen Zahl kleiner 20 vom Benutzer
-         Berechnen sämtliche Fakultäten von 0 bis zur eingegebenen Zahl und schreiben dieser Werte in ein Array. Das Array kann starr 20 groß definiert werden.
-         Geben Sie sämtliche Fakultäten aus dem Feldes in der Konsole aus.

Beispielausgabe:

Geben Sie die Zahl ein bis zu der Fakultaeten berechnet werden sollen: 16
0! = 1
1! = 1
2! = 2
3! = 6
4! = 24
5! = 120
6! = 720
7! = 5040
8! = 40320
9! = 362880
10! = 3628800
11! = 39916800
12! = 479001600
13! = 6227020800

Verschieben Sie die Funktion fakultaet in ein eigenes Modul faku.c/faku.h

##  Multiplikation (326)

Erstellen Sie eine Funktion mult() zur Berechnung eines Produktes.

- Es wird nur ein einzelner Multiplikator an die Funktion übergeben. Dieser wird zu einer globalen Variable multipliziert und wiederum in der globalen Variable gespeichert.
- Die globale Variable wird mit 1 initialisiert

Erstelle Sie ein Hauptprogramm:

-         Einlesen einer ganzen Zahl vom Benutzer
-         Ausgabe des Produkts der eingelesenen Zahl mit der globalen Zahl

Beispielausgabe:

num = 1
Geben Sie eine Zahl ein: 3
num x 3 = 3
Geben Sie eine Zahl ein: 4
num x 4 = 12
Geben Sie eine Zahl ein: 2
num x 2 = 24
Geben Sie eine Zahl ein: 3
num x 3 = 72
Geben Sie eine Zahl ein: 1
num x 1 = 72
Geben Sie eine Zahl ein: 0

Verschieben Sie die Funktion mult in ein eigenes Modul mult.c/mult.h

- Die globale Variable soll nur mehr im Modul mult.c verfügbar sein

##  Groß-/Kleinschreibung (327)

Erstellen Sie eine Funktion lowup() zum Verändern der Groß-/Kleinschreibung von Zeichenketten:

- Großbuchstaben werden in Kleinbuchstaben und umgekehrt konvertiert.

Hauptprogramm:

- Einlesen einer Zeichenkette vom Benutzer
- Konvertieren der eingegebenen Zeichenkette mit lowup()
- Ausgabe der Zeichenkette

Beispielausgabe:

Geben Sie eine Zeichenkette ein: Das ist ein Beispielstring
 Verdreht: dAS IST EIN bEISPIELSTRING

Verschieben Sie die Funktion lowup in ein eigenes Modul lowup.c/lowup.h