---
tags: ["Java", "Java/array", "Java/methoden"]
aliases: []
created: 29th November 2022
---

# Arrays - Felder

## Allgemein

Arrays bieten die Möglichkeit viele gleichartige Daten in einer Array-Variable zu speichern.

Die Definition erfolgt durch eckige Klammer nach dem Datentyp:

```java
int[] arr;
```

*arr* ist als Array-Variable definiert. Damit ist festgelegt, dass die Variable *arr* mehrere Integer-Nummern enthalten kann. Bevor ein Array verwendet werden kann muss es noch initialisiert werden (der Speicher für die Elemente reserviert werden):

```java
arr = new int[3];
```

Es wird ein Array mit drei Elementen angelegt. Jedes der drei Elemente ist vom Typ *int*. Der Zugriff auf die einzelnen Elemente erfolgt durch einen Index:

```java
arr[1] = 3;			// das 2te Element des arr-Arrays wird mit 3 beschrieben
int num = arr[0];	// der Variable num wird der Wert des 1ten Elements des arr-Arrays zugewiesen
```

Der Zugriff auf die drei Elemente des Arrays erfolgt mittels der Indizes [0], [1] und [2]. Die Zählung beginnt mit 0 und endet mit Anzahl der Elemente minus 1.

> Mit Arrays können mehrere Variablen gleichen Typs sehr einfach definiert und verarbeitet werden.

Es kommt vor, dass der Inhalt von Arrays schon bei der Definition bekannt ist. Dann kann die Definition und Initialisierung verkürzt erfolgen:

```java
int[] primZahlen = {1, 2, 3, 5, 7};
```

Ohne diese Verkürzung müsste der gleiche Code so aussehen:

```java
int[] primZahlen;
primZahlen = new int[5];
primZahlen[0] = 1;
primZahlen[1] = 2;
primZahlen[2] = 3;
primZahlen[3] = 5;
primZahlen[4] = 7;
```

> Grundsätzlich gilt: nach der Initialisierung kann die Anzahl der Elemente in einem Array nie mehr verändert werden 

> [!EXAMPLE] Namensliste:
  ```java
  String[] arrName = {"Sepp", "Franz", "Klaus", "Siegfried", "Herfried", "Sigmund"};
  System.out.println(arrName[3] + ", " + arrName[5]);			// Ausgabe: "Siegfried, Sigmund"
  arrName[3] = "Hias";									   // Überschreibe Siegfried mit Hias
  System.out.println(arrName[3] + ", " + arrName[5]);			// Ausgabe: "Hias, Sigmund"
  ```

> [!EXAMPLE] Preisliste:
  ```java
  double[] price = {1.2, 2.4, 1.1, 7.3};
  price[0] = price[3] - price[1];			// Ergebnis von (7.3-2.4) wird in das 1te Element geschrieben
  ```

> [!EXAMPLE] Hexadezimale Ziffern (lange Form):
  ```java
  char[] hexDigit = new char[16];
  hexDigit[0] = '0';
  hexDigit[1] = '1';
  hexDigit[2] = '2';
  hexDigit[3] = '3';
  hexDigit[4] = '4';
  hexDigit[5] = '5';
  hexDigit[6] = '6';
  hexDigit[7] = '7';
  hexDigit[8] = '8';
  hexDigit[9] = '9';
  hexDigit[10] = 'A';
  hexDigit[11] = 'B';
  hexDigit[12] = 'C';
  hexDigit[13] = 'D';
  hexDigit[14] = 'E';
  hexDigit[15] = 'F';
  ```

Ein Zugriff auf Elemente außerhalb der festgelegten Größe führt zu einem Fehler (*Exception in thread "main" java.lang.ArrayIndexOutOfBoundsException: xxx*) und wenn nicht explizit behandelt, zum Beenden des Programmes.

> Arrays sind eine Bündelung mehrerer Variable gleichen Typs in eine einzige Variable.
>
> Sämtliche Elemente eines Arrays haben den gleichen Typ.
>
> Die Elemente eines Arrays können über den Feldnamen und einem Index angesprochen werden.
>
> Einmal festgelegt, kann die Größe eines Arrays nicht mehr verändert werden.

## Im Detail 🔎

> [!WARNING] Arrays gehören nicht zu den primitiven Datentypen. Sie gehören zu den **Referenzdatentypen**. 

> Wie genau werden **primitive Datentypen**, z.B. `int num;`, im Rechner gespeichert?

Der definierte Variablenname *num* ist ein Platzhalter für einen Platz im Arbeitsspeicher des Rechners. Für diese Integer Variable würden 32 Bit (bzw. 4 Byte) Speicherzellen im Rechner reserviert. Reserviert bedeutet, er wird für den Inhalt von *num* verwendet (und von sonst niemanden).

Der Arbeitsspeicher bzw. das [Betriebssystem](../Operating%20Systems/Operating%20Systems.md) selber hat natürlich keine Namen wie *num* für den Speicherplatz. Um ein spezielles Bit im Speicherplatz ansprechen zu können benötigt man eine Adresse. Jeder Platz im Speicher bekommt eine eigene Nummer, damit kann auf einen konkreten Platz zugegriffen werden. Da das Arbeiten mit der Adresse selber sehr unübersichtlich wäre, bietet eine Programmiersprache Variablennamen anstelle von numerischen Adressen an.

Für unsere Wohnorte machen wir das ähnlich: Sepp wohnt in der *Viehwaldstätterstraße 17/2/3 / 4010 Linz / Österreich*, zu seinen Bekannten wird Sepp allerdings nie sagen "ich geh jetzt in die *Viehwaldstätterstraße 17/2/3 / 4010 Linz / Österreich*" sondern "ich geh jetzt *nach Hause*". Seine Freunde sagen "er geht *zu sich nach Hause*". 

(Real hat ein Bit keine eigene Adresse. Das hat zwei Gründe. Zum Einen benötigt man selten nur ein einzelnes Bit. Zum Anderen müsste es sonst sehr viele Adressen geben. Daher werden die Daten gebündelt adressiert: in einem 64 Bit [Betriebssystem](../Operating%20Systems/Operating%20Systems.md) (wie in aktuellen MS-Windows Versionen), bekommen 64 Bit eine gemeinsame Adresse. Einzelne Bits eines solchen 64 Bit QuadrupleWord (QWORD) können nicht direkt angesprochen werden.)

Diese *direkte* Art der Adressierung wird für sämtliche primitiven Datentypen verwendet. Im folgenden Beispiel ist eine Variable b = 107 gesetzt worden. Im Programm wird die Variable mit ihrem Namen b angesprochen, der Inhalt der Variable (107) liegt hier an der Adresse 94. 

![05_Felder01|500](assets/05_Felder01.png)

Was versteht man nun unter **Referenzdatentypen**?

Bei primitiven Datentypen wird der Wert einer Variable direkt unter der Adresse abgelegt für die der Variablenname steht. Bei Referenzdatentypen wird der Wert der Variable nicht direkt unter der Adresse abgelegt. Statt dessen wird unter der Adresse eine weitere Adresse (eine Referenz) auf den Wert abgelegt.

Der Wert einer Referenzdatentyp-Variable ist also unter der Adresse abgelegt die an der Adresse der Variable liegt. Im folgenden Beispiel wird eine Referenzvariable (z.B. ein Feld) mit dem Namen r verwendet. An der Adresse (101) für die r steht ist nicht der Wert, sondern wieder eine Adresse (123). Unter dieser Adresse ist der eigentliche Wert der Referenzvariable abgelegt. Für eine Feldvariable also liegen ab dieser Adresse die Feldwerte.


![05_Felder02|500](assets/05_Felder02.png)

In vielen Fällen ist das Wissen über die Art der Adressierung unerheblich. In manchen Fällen erklärt es aber ansonsten seltsam anmutende Fälle:

```c#
int[] a = {1, 2, 3};
int[] b = a;
b[0] = 4;
System.out.println(a[0]);		// Ausgabe: "4"
```

Mit der Zuweisung `b=a` wird kein Array von a nach b kopiert, sondern die Referenz auf das a-Array als Referenz in b gesetzt. In beiden Variablen steht die gleiche Adresse. Dadurch zeigt sowohl a wie auch b auf das gleiche Feld. Eine Änderung in einem der beiden Arrays bewirkt eine Änderung im Anderen. Tatsächlich ist das Array hier nur einmal gespeichert.

Die Anweisung

```c#
int[] numArr;
```

reserviert somit lediglich den Speicherplatz zum Speichern der Adresse des Arrays. Der notwendige Speicherplatz für das Array selbst könnte ja auch noch nicht reserviert werden, es ist noch nicht bekannt wie groß das Array ist.

Erst mit

```java
numArr = new int[10];
```

ist klar: es werden 10 Elemente zu je 1 Integer benötigt und damit wird neben dem Speicherplatz für die Referenz nun auch 10x4 Byte für das Array reserviert (die abgekürzte Schreibweise macht das gleiche in einem Schritt).

Wird eine Feldvariable direkt ausgegeben:

```java
int[] numArr = {1, 2};
System.out.println(numArr);
```

dann wird folgendes ausgegeben:

```
[I@7abec8df
```

die eckige Klammer gefolgt vom I zeigt, dass es sich um ein Integer-Array handelt. Gefolgt wird diese Kennung von einer Art Adresse unter welcher der Feldinhalt abgelegt wird (mit dieser Zahl kann nichts angefangen werden).

> Primitive Datentypen: der Variablenname steht für eine Adresse unter der das Datum im Speicher abgelegt wird.
>
> Referenzdatentypen: der Variablenname steht für eine Adresse unter der eine Adresse abgelegt ist. Unter dieser Adresse ist das eigentliche Objekt (hier Feld) abgelegt.

## ForEach

Sehr häufig ist in Programmen mit Arrays folgende Struktur anzutreffen:

```java
int[] arr = {1, 2, 3, 4};

for (int i; i < arr.length; i++) {
  ...
}
```

Also eine For-Schleife die über ein Array läuft. Es gibt für diese spezielle Art von Schleifen eine Abkürzung, die sogenannte *foreach*-Schleife. Sie läuft genau so oft durch wie sich Elemente in einem Array befinden. Ein Zähler wird nicht benötigt:

```java
for (int element : arr) {
  System.out.println(element);
}
```

Das Schlüsselwort ist ebenfalls *for* (in anderen Programmiersprachen gibt's oft zur Unterscheidung ein *foreach*). Es folgt ein Parameter der vom gleichem Typ wie ein Element des Arrays sein muss und ein Name um den Wert verarbeiten zu können. In jedem Schleifendurchlauf wird mit der Variable *element* ein Element des Arrays *arr* zur Verfügung gestellt. Die Schreibweise ist ein wenig kürzer, der Nachteil dieser Abkürzung ist jedoch, dass kein Zähler zur Verfügung steht.

## Methoden Von Arrays

| Methode                | Beschreibung                                                     |
| ---------------------- | ---------------------------------------------------- |
| `arr.length`           | gibt die Anzahl der Elemente im Array arr zurück     |
| `Arrays.toString(arr)` | Wandelt das Array arr in einen String zur Ausgabe um |
| `Arrays.sort()`        | Aufsteigend sortieren                                |
| `Arrays.fill()`        | Array mit Daten füllen                               |
| `Arrays.copyOfRange()` | Teile eines Felds kopieren                           |

Neben `toString` bietet die Klasse `java.util.Arrays` eine Reihe hilfreicher Methoden zum Sortieren, Suchen, Kopieren (auch nur Teile) und Vergleichen an: