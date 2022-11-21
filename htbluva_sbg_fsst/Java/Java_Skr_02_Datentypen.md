# 2 Datentypen

## Primitive Datentypen
Variable sind Platzhalter, deren Inhalt (Daten) im Lauf der Programmausführung verändert werden kann. Um eine Variable benutzen zu können, muss sie zuvor **definiert** werden. Das bedeutet, man muss der Variable einen bestimmten Datentyp zuschreiben (und Speicherplatz fürs Merken des Werts bereithalten). Verfügbar sind in Java folgende primitive Datentypen:

| Datentyp | Beschreibung               | Wertebereich / Beispiel                  |
| -------- | -------------------------- | ---------------------------------------- |
| boolean  | Boolescher Wert            | true, false                              |
| char     | einzelnes Zeichen (16 Bit) | Unicode-Zeichen,  'a', '?', '1', 'æ' ... |
| byte     | ganze Zahl (8 Bit)         | $-2^{7} ... 2^{7}-1$    (-128 ... 127)   |
| short    | ganze Zahl (16 Bit)        | $-2^{15} ... 2^{15} - 1$    (-32.768 ... 32.767) |
| int      | ganze Zahl (32 Bit)        | $-2^{31} ... 2^{31} - 1$    (-2.147.483.648 ... 2.147.483.647) |
| long     | ganze Zahl (64 Bit)        | $-2^{63} ... 2^{63} - 1$    (-9.223.372.036.854.775.808 ... 9.223.372.036.854.775.807) |
| float    | Fließkommazahl (32 Bit)    | $+/-3.40282347 · 10^{38}$,    $3.14159f$ |
| double   | Fließkommazahl (64 Bit)    | $+/-1.79769313486231570 · 10^{308}$,    $-1.79$ |

Java bietet neben den primitiven Datentypen noch Zeichenketten, Felder und Klassen an (dazu später).

Durch eine **Definition einer Variable** wird der Typ der Variable festgelegt und der dafür notwendige Speicherplatz im Arbeitsspeicher reserviert:

```java
int numVariable;
```

Für die Variable `numVariable` wird festgelegt, dass es sich um eine ganzzahlige, numerische Zahl handelt und im Speicher werden 32 Bit (4 Bytes) reserviert um den Zahlenwert speichern zu können.

Physikalischer Speicher beinhaltet immer einen Wert. Um einen definierten Programmablauf sicherstellen zu können werden Variable vor ihrer ersten Verwendung immer mit einem sinnvollen Wert befüllt. Dieser Vorgang wird **Initialisierung einer Variable** bezeichnet.

```java
int numVariable1;       // Definition der Variable (wird in Java automatisch auf 0 initialisiert)
int numVariable2 = 10;  // Definition der Variable und gleichzeitig Initialisierung auf 10
numVariable2 = 12;      // "einfache" Zuweisung
```

Die Definition und Initialisierung darf abgekürzt in einer Zeile erfolgen:

```java
int numVariable = 10;   // Definiere numVariable als 32 Bit Integer und initialisiere diesen mit 10
```

### Ganzzahlige Typen

Ganze Zahlen (ohne besondere Kennzeichnung) in einem Programm sind grundsätzlich vom Typ `int`. Durch ein Anhängen der Suffix `l` oder `L` wird eine *konstante Zahl* (sogenanntes **Literal**) zum Typ `long`.

```java
long bigNum;          // Definition
bigNum = 10L;         // Initialisierung, das L macht den 10er zu einem Long-10er
```

Zahlen können nicht nur in dezimaler Form eingegeben werden sondern auch in hexadezimaler Form durch das Präfix *0x*. Darstellungen in oktaler Form werden durch eine vorangestellte Null *0* gekennzeichnet (Achtung: leicht zu Übersehen).

```java
int numVariable;
numVariable = 10;       // Befuellen mit dezimal 10
numVariable = 0x10;	    // Befuellen mit 10hex = 16dez
numVariable = 010;	    // Befuellen mit 10oct = 8dez
```

### Fließkommazahlen

Fließkommazahlen werden durch unterschiedliche Darstellungen automatisch erkannt:

- Dezimalpunkt in einer Zahl (*1.2*) - *double*
- Exponent-Darstellung e, E (*1E-3*) - *double* (entspricht 0,001)
- angehängte Suffix d, D, f, F (*1f*, *3d*) - *float* oder *double*

Fließkommazahlen werden automatisch als *double* interpretiert. Ein *float* muss explizit durch den Suffix *f* oder *F* gekennzeichnet werden.

### Zeichentyp

Literale des Zeichentyps *char* werden durch einfache Hochkomma gekennzeichnet.

```java
char z;
z = 'A';       // Zeichen 'A'
```

Im Speicher wird für das Zeichen die entsprechende Unicode-Nummer für dieses Zeichen abgelegt (für 'A' wird 65 abgespeichert). Zeichen werden im Speicher immer als Nummern abgelegt. Man kann die Unicode-Nummern auch direkt eingeben:

```java
char z;
z = 65;       // Zeichen an der 65ten Stelle der Unicode-Tabelle ('A')
```

So kann mit Zeichen auch gerechnet werden:

```java
char z;
z = 65;         // Zeichen 'A' 
z = 65 + 1;     // Zeichen 'B'
z = 0x41;       // Zeichen 'A' (0x41 = 65)
z = '\u0041';   // Zeichen 'A' (u für Unicode, Zahl wird hexadezimal interpretiert)
```

## Typumwandlung
Ein Zuweisung von Variablen eines Datentyps in eine Variable eines verschiedenen Datentyps bedarf einer Typumwandlung (Typecast). Grundsätzlich gibt es die beiden Möglichkeiten:

- explizite Typumwandlung
- implizite Typumwandlung

### Explizite Typumwandlung

Explizit kann ein Typ durch ein Voranstellen des Zieldatentyps in Klammern umgewandelt werden:

```java
byte numVarSmall = 10;
int numVarBig    = 15;
numVarSmall = (byte)numVarLong;	// interpretiere 15 aus numVarLang als Byte und weise dieses numVarKurz zu
```

Eine Zuweisung *großer Datentyp in kleiner Datentyp* schneidet die (eventuell) höherwertigen Stellen ab und weist die niederwertigen Stellen der Zielvariable zu. Sollte der ursprüngliche Wert zu groß für den Zieldatentyp sein, dann wird das Ergebnis falsch sein. Eine Prüfung durch den Compiler oder die Laufzeitumgebung erfolgt nicht.

Für ASCII kodierte Zeichen (nur 7 Bit der 16 Unicode möglichen werden verwendet) funktioniert folgender Code:

```java
byte numZeichen;
char zeichen = 'A';
numZeichen = (byte)zeichen;		// numZeichen = 65 nach dieser Zeile
```

wohingegen:

```java
byte numZeichen;
char zeichen = 0xAA41;
numZeichen = (byte)zeichen;		// numZeichen = 0x41 (AA weggeschnitten) = 65
```

Umwandlung von Literalen:

```java
int numGanzZahl = (int)17.3f;
int numZahl = (int)(4444444444444444f);		// numZahl = 2147483647 (= 0 x 7FFF FFFF)
```

Umwandlung von Berechnungsergebnissen:

```java
byte numZahl = (byte)(300 + 4);				// Setzen von entsprechenden Klammern
```

> Die explizite Umwandlung ist eine bewusst gesetzte Umwandlung durch ein Voranstellen des gewünschten Typs.

### Implizite Typumwandlung

Wird der Datentyp nicht explizit umgewandelt, so versucht Java den Datentypen automatisch anzupassen. Diese Umwandlung wird als implizite Umwandlung bezeichnet. Sie wird nur dann von Java ausgeführt, wenn der Zieldatentyp einen größeren Wertebereich hat als der Quelldatenbereich. In diesen Fällen können keine Daten verloren gehen. Die folgende Darstellung verdeutlicht welche Konvertierungen automatisch erfolgen können:

![Implizite Typumwandlung](./bilder/Datentypen_ImpliziterTypumwandlung.png)

In Pfeilrichtung ist jede Art der Umwandlung zulässig, so zum Beispiel *byte* → *short*, *byte* → *float* oder  *char* → *long*. Entgegen Pfeilrichtung wird eine Zuweisung sofort als Syntax-Fehler interpretiert:

```java
char zeichen = 'a';			// 2 Bytes im Speicher
short nummer = zeichen;		// 2 Bytes im Speicher (allerdings Vorzeichenbehaftet)
```

ergibt *Typabweichung: Konvertierung von char auf short nicht möglich*. Gleiches für *short* in ein *char*.

> Die implizite Typumwandlung ist eine automatisch von Java vorgenommene.

Für Berechnungen werden ganzzahlige Typen automatisch auf *int* konvertiert, sofern sie kürzer als ein *int* sind (*byte*, *short* und *char*):

```java
byte a = 3;
short b = 5;
short c = a + b;
```

Obwohl die Wertebereiche *short* oder *byte* ausreichen würden, wird für die Addition automatisch auf *int* konvertiert. Das Ergebnis der Addition ist somit ein *int* und kann nicht implizit in ein *short* umgewandelt werden. Die Operation liefert daher *Konvertierung von int auf byte nicht möglich*.

## Konvertierungen

Nummerisch → Nummerisch:

```java
int numInt = (int)numFloat;         // Nummerisch
```

Zeichen → Nummerisch:

```java
char zeichen = 'A';
short numShort = (short)zeichen;    // numShort = 65
short numByte = (byte)zeichen;      // numByte = 65
```

Oder:

```java
char zeichen = '3';
short num = zeichen - '0';          // dadurch: num = 3
```

Nummerisch → Zeichen:

```java
byte numByte = 65;
char zeichen = (char)numByte;       // zeichen = 'A'
```

Oder:

```java
byte num = 3;
char zeichen = num + '0';           // dadurch zeichen = '3'
```

String → Nummerisch:

```java
String zeichenKette = "123";
int numInt = Integer.parseInt(zeichenKette);            // numInt = 123
byte numByte = Byte.parseByte(zeichenKette);            // numByte = 123
long numLong = Long.parseLong(zeichenKette);            // numLong = 123

zeichenKette = "123.123456789e-10";
float numfloat = Float.parseFloat(zeichenKette);        // numFloat = 1.2312346E-8
double numDouble = Double.parseDouble(zeichenKette);    // numDouble = 1.23123456789E-8
```

Nummerisch → String:

```java
double numDouble = 1234.5e1;
String zeichenKette = "" + numDouble;     // zeichenKette = "12345.0"
...
```

Nummerisch → **formatierter** String:

```java
int numInt = 1234;
String zeichenkette = String.format("%x", numInt);   // zeichenkette = "0x4d2"
...
```

