# 9 Zeiger

## Allgemein

Zeiger = Referenz = Pointer = Adresse auf einen Speicherbereich. Auf dieser Adresse können Daten aber auch Code abgelegt sein.

Das Programm und die Daten (Variable, Konstante) sind im Speicher abgelegt. Der Speicher kann als linear adressierbarer Bereich gesehen werden in dem jede Variable und jede Zeile Code (Maschinencode) eine Adresse hat. In modernen Betriebssystemen (wie Windows) wird einem Prozess der gestartet wird (Das erstellte Programm ist z.B. so ein Prozess) ein eigener Speicherbereich zugeteilt. In diesem liegen grundsätzlich immer:

- der ausführbare Code - das Programm das ausgeführt wird und
- Daten - globale/lokale Variable, Konstante ...

Ein Bereich im Speicher kann mit einer Adresse angesprochen werden. Jedes Byte im Speicher hat eine eigene Adresse beginnend von 0x0000 0000 bis 0xFFFF FFFF (32 Bit).

## Adressoperator &

Um die Adresse unter der eine Variable abgespeichert ist zu ermitteln, dient der **Adressoperator &:**

```c
int a;
printf("%X", &a);
```

Hier wird die Adresse unter welcher der Wert der Variable abgelegt ist in hexadezimaler Form ausgegeben, zum Beispiel so:

```sh
60FF0C
```

Zur Ausgabe von Adressen gibt's zusätzlich auch den Formatspezifizierer **%p**:

```c
int a;
printf("%p", &a);
```

## Adressdatentyp

Um mit Adressen arbeiten zu können gibt es den Adressdatentyp. Die Größe dieses Datentyps hängt von der verwendeten Rechnerarchitektur, dem Betriebssystem und dem Compiler ab. Für uns gelten 32-Bit-Adressen (4 GB Adressraum). Von Windows werden uns 2 GB zur Verfügung gestellt (ist allgemein in Windows so).

```c
int *ptr1;
int* ptr2;
int * ptr3;
```

Man bezeichnet Adressen häufig als Zeiger oder Pointer da Adressen auf Daten *zeigen* bzw. *auf diese referenzieren*.  Sämtliche oben angeführte Formen sind zulässig. Zu Empfehlen ist die erste Form. Damit ist am deutlichsten ersichtlich, dass es sich bei ptr1 um einen Zeiger handelt.

```c
int* ptr1, ptr2;
```

In dieser Definition der Variablen ptr1 und ptr2 gilt: ptr1 ist eine Referenz und ptr2 ist eine Integer-Variable, daher ist die Schreibweise:

```c
int *ptr1, ptr2;
```

eindeutiger zu lesen. Noch besser ist beide Variablen in einer eigenen Zeile zu definieren.

Der Datentyp vor dem * gibt an welche Art von Daten an der entsprechenden Adresse liegen. In dem hier angeführten Beispielen sind die Daten an der Adresse als Integer zu interpretieren. Die Variable selbst wird dadurch nicht verändert. Sämtliche Variable hier:

```c
char *ptr1;
int *ptr2;
long long *ptr3;
```

sind gleich groß und zwar immer eine 4 Byte Adresse.

## Dereferenzierungsoperator *

Das Gegenstück zum Adressoperator ist der der Dereferenzierungsoperator. Mit ihm kann der Inhalt einer vorgegebenen Adresse ermittelt werden:

```c
int num = 3;
int *ptr;
ptr = &num;
```

Hier wird der Zeiger (die Adressvariable) auf num gesetzt. Die Adresse die die Variable ptr enthält ist genau die Adresse unter der der Wert von num abgelegt ist.

Auf den Wert der unter einer Adresse abgelegt ist kann direkt mit dem Dereferenzierungsoperator * zugegriffen werden:

```c
int num = 3;
int *ptr = &num;

printf("%d", *ptr);		// Ausgabe von 3
```

Hier wird direkt der Wert von num ausgegeben. Die Adresse die in ptr abgelegt ist ist ja die Adresse der num-Variable.

Schreiben an Adresse:

```c
int num = 3;
int *ptr = &num;
*ptr = 5;
printf("%d", num);	// Ausgabe von 5
```

## Rechnen mit Adressen

Mit Adressen kann gerechnet werden:

```c
char num = 3;
char *ptr = &num + 2

printf("%x", *ptr);
```

Hier wird die Adresse um 2 erfhöht. wohingegen für:

```c
int num = 3;
int *ptr = &num + 2

printf("%x", *ptr);
```

die Adresse wird um 8 erhöht. Wird eine Adressvariable inkrementiert, dann wird der Wert immer um die Größe des Inhalts erhöht.

<img src="./bilder/Zeiger1.png" width="500">

## Call-By-Value/Reference

Wiederhole das Unterkapitel im Kapitel Funktionen.

## Felder

Felder sind Variablen die aus gleichartigen Elementen besteht. Im Speicher sind diese Elemente direkt hintereinander abgelegt. Felder können daher sehr einfach über Zeiger angesprochen werden. Das erste Element (Index 0) kann mittels Adressoperator & ermittelt werden, die folgenden durch entsprechendes Anpassen der Adresse:

```c
int arr[] = {1, 2, 3, 4, 5};

int *ptr = &arr;		// ptr zeigt auf das 1te Element von arr

printf("%d\n", *ptr);	    // 1
printf("%d\n", *(ptr + 1));	// 2
printf("%d\n", *(ptr + 4));	// 5
```

Die Leseart für *(ptr + 1): Die Adresse wird um 1 erhöht und an dieser Erhöhten Adresse der Wert ermittelt. Zur Erinnerung: hier wird in Wahrheit die Adresse um soviel erhöht wie ein Element groß ist. Hier haben wir Integer als Element also 4 Bytes. Worauf geachtet werden muss: man kann ohne Warnung über die Feldgröße hinaus Werte lesen/schreiben.

Man kann bei diesem Beispiel erkennen wie einfach Felder mit Zeigerarithmetik gebaut werden können (und auch tatsächlich vom Compiler so übersetzt werden). Aus diesem Grund funktioniert auch:

```c
int *ptr = arr;		// ohne &
```

Ein Zeiger kann immer auch als Feld behandelt werden:

```c
int i;
int *ptr = &i;
printf("%d", ptr[3]);
```

Hier wird dem Zeiger die Adresse der Variable i zugewiesen. Anschließend wird ptr[3] ausgegeben. Dafür wird die Adresse um 3 * sizeof(int) erhöht (Index 3). 

## Zeichenketten

In C sind Strings Felder von Zeichen. Daher gilt für Zeichenketten das Selbe wie für Felder. Die Elemente einer Zeichenkette sind Zeichen (1 Byte Char).

## Dynamische Speicherzuteilung

Das Problem von Feldern ist, dass sie keine Möglichkeit bieten ihre Größe während der Laufzeit zu verändern. Lösung: Speicher kann dynamisch angelegt werden. Dieser Speicher kann mittels Zeigern angesprochen werden:

```c
int *ptr;

ptr = (int*) malloc(10 * sizeof(int));	// 10 int reservieren (40 Bytes)
```

**void *malloc(size_t size):** (Memory Allocation)  Speicherplatz wird reserviert und die Adresse zurückgegeben. Als Parameter wird die *Größe in Bytes* angegeben. Der Rückgabewert ist vom Typ (void *) und wird auf den Typ gecastet für den der Speicher verwendet werden soll. **malloc()** initialisiert den Speicher nicht, d.h. was immer an dieser Speicher war bleibt dort, der Speicher wird lediglich reserviert.

**void *calloc(size_t anzahl, size_t groesse):** es wird Speicherplatz reserviert und dieser gleichzeitig auf 0 initialisiert:

```c
int *ptr;

ptr = (int*) calloc(10, sizeof(int));		// 10 int reservieren und auf 0 setzen
```

**void *realloc(void *zgr, size_t neuegroesse):** Vergrößern/Verkleinern eines Speicherbereichs:

```c
int *ptr;

ptr = (int*) calloc(10, sizeof(int));		 // 10 char reservieren und auf 0 setzen
ptr = (int*) realloc(ptr, 12*sizeof(int));   // Speicherbereich auf 12 Elemente erweitern
ptr = (int*) realloc(ptr, 9*sizeof(int));	 // Speicherbereich auf 9 Elemente verkleinern
```

Der Speicherbereich wird immer am Ende erweitert oder reduziert. Der Inhalt der ersten Elemente ist nicht betroffen. Reicht der Speicherplatz nicht aus um den Bereich zu vergrößern, dann wird der Speicher umkopiert sodass es sich ausgeht. Das bedeutet der zurückgegebene Zeiger kann eine andere Adresse bekommen.

**void free(void *zeiger):** Freigeben von reserviertem Speicherbereich:

```c
int *ptr;
ptr = (int*) malloc(10 * sizeof(int));	// 10 int reservieren (40 Bytes)
free(ptr);							   // Reservierter Speicher wird wieder freigegeben
```

Jeder mit **malloc()** oder **calloc()** reservierte Speicherbereich muss wieder freigegeben werden. Der Speicher bleibt ansonsten bis zum Ende des Programms reserviert. Unabhängig davon ob es den Zeiger auf den Speicher noch gibt oder nicht. Ein sehr häufiger Fehler sind sogenannte Speicherlecks/Memoryleaks aufgrund von nicht vollständig freigegebenem Speicher.

## Kommandozeilenargumente

Zum Mitgeben von Information beim Programmaufruf:

```c
int main(int argc, char *argv[]) { /* ... */ }
```

Im ersten Parameter steht die Anzahl der Parameter, im zweiten Parameter sind die Argumente zu finden.

Beispiel example.c:

```c
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
    int i;
    for (i = 0; i < argc; i++) {
        printf("%d: %s", i, argv[i]);
    }
    return 0;
}
```

ergibt für einen einfachen Aufruf:

```
0: example.exe
```

Üblicherweise wird als erster Parameter der Programmname übergeben (kann umgangen werden). Die folgenden Parameter werden durch Leerzeichen voneinander getrennt weiter im Feld abgelegt.

## Zeiger auf Funktionen

In C können Zeiger nicht nur auf Variablen gesetzt werden, sondern auch auf Funktionen. Im folgenden Beispiel wird ein Funktionszeiger namens **rechne** erstellt, welcher im Parameter eine **int** Zahl empfängt und als Rückgabe eine **long int** Zahl liefert. Dieser Zeiger wird zuerst auf eine Funktion namens **hoch2** gesetzt, welche das Quadrat einer Zahl ausrechnet. Danach wird der Zeiger auf eine Funktion namens **hoch3** gesetzt.

```c
long hoch2(int n) {
	return n * n;
}

long hoch3(int n) {
	return n * n * n;
}

int main() {
	long (*rechne) (int);   // rechne = Zeiger mit int-Parameter und long-Rueckgabe

	int zahl = 3;
	
	rechne = hoch2;		// rechne = Zeiger auf Fkt hoch2
	printf("%d hoch 2: %d\n", zahl, rechne(zahl));

	rechne = hoch3;		// rechne = Zeiger auf Fkt hoch3
	printf("%d hoch 3: %d\n", zahl, rechne(zahl));

	return 0;
}
```

Ausgabe:

```
3 hoch 2: 9
3 hoch 3: 27
```

