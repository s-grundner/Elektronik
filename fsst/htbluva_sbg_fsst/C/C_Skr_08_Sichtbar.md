# 8 Sichtbarkeit, Lebensdauer und Gültigkeit

Von welchen Programmteilen aus kann auf welche Variable zugegriffen werden und wie lange werden Variable behalten? Grundsätzlich können die folgenden Typen unterschieden werden:

- lokale Variable - lebt nur in einem begrenzten Block, kein Zugriff von außerhalb
- lokal statische Variable - lebt von der Definition bis zum Programmende über den Block hinaus, Zugriff nur von innerhalb des Blocks
- globale Variable - lebt über das gesamte Programm-Leben, Zugriff von überall
- global statische Variable - lebt über das gesamte Programm-Leben, Zugriff nur in genau der Datei in welcher sie definiert wurde

## Lokale Variable

In Blöcken (geschwungene Klammern) definierte Variable sind bis zum Ende des Blocks sichtbar, dann wird der Speicherplatz freigegeben. Solche Variable sind nur *lokal* in diesem Bereich verfügbar. Wird dieser Code erneut ausgeführt (weil z.B. in einer Schleife), dann ist daher der Wert aus der letzten Ausführung nicht mehr verfügbar.

```c
int i = 10;
printf("%d\n", i); {        // 10
    int i = 11;             // neue, lokale Variable i
    printf("%d\n", i);      // 11
}                           // hier wird die neue Variable i freigegeben/geloescht
printf("%d\n", i);          // 10
```

Sind sonstige Variable mit der gleichen Bezeichnung verfügbar, werden diese durch lokale Variable verdeckt.

## Lokal STATIC

Lokale Variable = innerhalb geschwungener Klammern (Block). Lokal Statische Variable behalten ihren Wert auch bei einer Wiederkehr in den lokalen Bereich (technisch bedeutet `static`-Variable liegen *statisch* an der gleichen Speicheradresse). Also wie andere lokale Variable auch, kann auf diese nicht außerhalb ihres lokalen Bereichs zugegriffen werden. Beim Wiedereintritt in diesen lokalen Bereich, ist der Wert der statischen Variable der Selbe, wie nach der letzten Ausführung.

```c
void sum(int summand) {
    static int i = 0;      // Initialisierung, wenn statisch, dann nur beim ersten Aufruf relevant
    i += summand; 
    printf("Wert der Summe : %d\n",i);
}

int main(void) {
    sum(3);
    sum(4);
    sum(5);
    return 0;
}
```

Erzeugt eine Ausgabe 3-7-12. OBWOHL hier in der Methode mit i = 1 initialisiert wird! Diese Initialisierung der statischen Variable wird nur einmal aufgerufen - beim Ersten Mal.

Statische Variable werden somit offensichtlich nicht im Stack mit der lokalen Bereich (Funktion ...) abgelegt.

## Globale Variable

Alles was direkt in einer Datei (also außerhalb von Funktionen) ohne Schlüsselwort definiert wird, kann global verwendet werden. Das trifft auf Variablen genauso wie auf Funktionen zu. In einer zweiten Datei kann ebenfalls auf eine solche Variable zugegriffen werden, sie muss lediglich für den Compiler gleich definiert werden (am Besten immer mit extern).

Grundsätzlich gilt auch für C: **so lokal wie möglich, so global wie nötig**

## Global STATIC

Wenn eine Variable außerhalb von Funktionen (auch von main) als `static` definiert wird, dann sind diese Variable nicht mehr im gesamten Programm sichtbar, sondern nur mehr in der Datei in der sie sich befinden. Mit dem `static` Zusatz kann also verhindert werden, dass auf die Variable von außerhalb zugegriffen wird.



Weitere Spezifizierer, die Variablen-Verhalten beeinflussen:

## extern
Mit `extern` wird kein Speicherplatz reserviert, es wird lediglich geklärt wie die Variable (oder Funktion) aussieht (Deklaration <-> Definition).

```c
extern int num;      // irgendwo anders wurde fuer num als int Speicher reserviert
```

Damit kann ab dieser Definition die Variable *num* verwendet werden. Allerdings nur wenn die Variable *num*  tatsächlich definiert wurde.

Wird bei der Deklaration einer Variable oder Funktion die Speicherklasse nicht angeben, ist diese *automatisch extern* wenn sie schon an anderer Stelle definiert wurde.

Soll eine Variable/Funktion bewusst von einer anderen Stelle verwendet werden, dann immer das Schlüsselwort `extern` setzen. Damit kriegt man einen Fehler wenn die Variable/Funktion nicht existiert.

## volatile
Viele Compiler optimieren selbstständig den Code. Dabei kann der Compiler entscheiden, dass eine Variable nicht im Speicher sondern einem Register zu liegen kommt (Optimierung). Wenn das eigene Programm eine solche Variable allerdings dazu verwenden soll um Daten von z.B. einem anderem Prozess zu erhalten funktioniert das durch die Optimierung nicht mehr. Mit `volatile` wird dem Compiler mitgeteilt, dass die Variable auch von anderer Stelle verändert werden kann. Das gilt auch für Funktionen. `volatile`-Funktionen werden bei jedem Aufruf neu aus dem Hauptspeicher gelesen werden.

