# 7 Funktionen - Übungen

## StaticVariable (120)

- Was gibt dieses Programm aus (und warum)?

  ```c
  int i;
  for (i = 0; i < 5; i++) {
      int num = 5;
      num--;
      printf("%d\n", num);
  }
  ```

- Ändern Sie das obige Programm durch Hinzufügen von `static` so ab, dass eine Ausgabe wie folgt ausgegeben wird:

  ```
  4
  3
  2
  1
  0
  ```

## GlobalVariable (121)

- main.c:

  ```c
  #include "inc.h"
  int globVar;            // Definition 1
  int main() {
      inc();
      printf("\nmain:%d", --globVar);
      return 0;
  }
  ```
  
- inc.c:

  ```c
  int globVar;            // Definition 2
  void inc() {
      printf("\ninc: %d", ++globVar);
  }
  ```

- Hier wird zweimal *globVar* definiert. Wird der Code ausgeführt, dann sieht man, dass die gleiche Variable verwendet wird. Der Code wird auf diese Art sehr schlecht lesbar.

  Sollen Variable wirklich global verwendet werden, dann ist es besser sich zu überlegen wo genau die globale Variable definiert werden soll und an allen anderen Stellen die Variable als `extern` zu definieren:

  ```c
  extern int globVar;    // Bedeutet: globVar ist woanders als int definiert
  void inc() {
      printf("\ninc: %d", ++globVar);
  }
  ```

  Der Vorteil ist, dass damit geprüft wird ob es diese externe Variable auch wirklich gibt. Ohne extern könnte in main der Name der Variable unbeabsichtigt geändert werden und das Programm funktioniert immer noch.

## Add

- Addition von zwei double Zahlen add(a, b)
- Erstellen Sie die Funktion in einer eigenen Datei add.c, binden Sie die Datei über die Header-Datei add.h ein

main.c:

  ```c
#include <stdio.h>
#include <stdlib.h>
#include "add.h"

int main() {
    printf("%0.2f + %0.2f = %0.2f\n", 3.1, 4.5, add(3.1, 4.5));
    return 0;
}
  ```

## Increment

- Inkrement einer Zahl - Call-By-Reference
- Aufruf mit **inc(&num)** 
- Funktion in eigene Datei inc.c, Einbinden über die Header-Datei inc.h

main.c:

```c
...
int num = 3;
printf("%i\n", num);
int(&num);
printf("%i\n", num);
```

## Fakultaet

- Die Fakultät einer Zahl spielt in der Wahrscheinlichkeitsrechnung aber auch in Taylorreihen eine Rolle. Berechne die Fakultät einer ganzen Zahl:
  n! = 1 * 2 * 3 * .... * n
- Erstellen Sie die Funktion **int fact(int)** in einer eigenen Datei fact.c und binde Sie diese über eine Header-Datei ein.

## Power

- Berechnen Sie die Hochzahl einer Zahl **double power(double num, int pow)**
- Berücksichtigen Sie den Exponent 0.

## TempKonv

- Berechnen Sie die Temperatur in Fahrenheit aus der Temperatur in °C und umgekehrt.
  - TF = TC * 1,8 + 32	(**double degCtoDegF(double degC)**)
  - TC = (TF - 32) * 5/9	(**double degFtoDegC(double degF**)

## Schaltjahr

- Erstellen Sie eine Funktionen zur Berechnung ob ein eingegebenes Jahr ein Schaltjahr ist **boolean isSchaltjahr(int jahr)**

  - Ein Jahr ist ein Schaltjahr, wenn es restlos durch 4 teilbar ist (2000 ok)
  - Falls sich die Jahrzahl durch 100 restlos teilen lässt, ist es kein Schaltjahr (2000 nok)
  - Falls auch eine Teilung durch 400 ganzzahlig möglich ist, dann ist es ein Schaltjahr (2000 ok)

  Die Regeln sind in dieser Reihenfolge anzuwenden. Daher ist 2000 ein Schaltjahr.


## Kreisfläche

- Berechnen Sie die Kreisfläche in einer Funktion ohne einen Rückgabewert zu verwenden (globale Variable).
- Erstellen Sie die Funktion **void kreisFlaeche(double radius)** in einer eigenen Datei kreisFlaeche.c und binden Sie diese über eine Header-Datei ein.

## Zufallsfeld

- Erstellen Sie 3 Funktionen um ein Feld mit Zufallszahlen zwischen 0 und 100 (max. Größe 100) zu füllen:
  - mit statischer Variable **int* zufallsfeld(int groesse)**
  - mit mitgegebenem Feld **int* zufallsfeld(int *feld, int size)**
  - mit reservierten Speicher **int* zufallsfeld(int size)**

- Zufallszahl

  ```c
  srand(time(NULL));       // Seed mit ~Zufallszahl
  int zahl1 = rand() % 10; // Ganzzahlige Zufallszahl
  ```

## MemLeak

- Erstellen Sie eine Malloc-Funktion und "vergessen" Sie den Speicher freizugeben. Setzten Sie die Funktion in eine Schleife und beobachten Sie was passiert.
- Im Taskmanager (oder direkt in VS) kann der Speicherbedarf des Programms ermittelt werden.

## SortString

- Sortieren Sie die Zeichen einer Zeichenkette nach Alphabet, wobei Großbuchstaben eines Buchstaben gleiche Priorität wie Kleinbuchstaben haben. Zum Beispiel gilt für folgende Zeichenkette "aBAcb" sortiert --> "aABbc"
- Erzeugen Sie eine eigene Funktion in einer eigenen Datei.

