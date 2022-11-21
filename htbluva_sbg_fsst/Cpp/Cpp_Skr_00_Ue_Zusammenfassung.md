# C++ Zusammenfassung - Übungen

## Datentypen (610)

Schreiben Sie ein Programm das ermittelt wie groß bool, char, int Datentypen sind: Beispielausgabe:

```
Typ        Minimum         Maximum   Hex-Max
char :        -128             127        7f
short:      -32768           32767      7fff
int  : -2147483648      2147483647  7fffffff
```

wobei:

- um eine Feldbreite bei der Ausgabe definiert werden kann:

  ```c++
  #include <iomanip>
  ...
  cout << "xx" << setw(5) << 10 << "xx";			// Ausgabe "xx   33xx"
  ```

- Hexadezimal so angezeigt werden dann:

  ```c++
  cout << hex << "0x" << 10;									// Ausgabe: "0xa"
  ```

## Byteweise Zerlegen (611)

Schreiben Sie ein Programm, dass eine eingegebene int-Zahl in Ihre Bytes zerlegt, unter Verwendung eines `unsigned char` Pointers:

```
Geben Sie eine Zahl (in hexadezimaler Form) ein: 12ab34cd

Byte 1 (LSB): cd
Byte 2      : 34
Byte 3      : ab
Byte 4 (MSB): 12
```

Tipp:

- Einlesen von hex-Zahlen

  ```c++
  cin >> hex >> num;
  ```

- Konvertieren von Typen: 

  ```c++
  int num = (int)zeichen;
  ```

## Datei Verarbeitung

...

## Array Min/Max/Med

Schreiben Sie ein Programm dass aus einem Zufallszahlen-Array das Maximum/Minimum und den Mittelwert ermittelt.

Tipp:

- Zufallszahl:

  ```c++
  srand(time(0));				// Initialisierung
  int num = rand();			// Zufallszahl (meist zwischen 0 und 32767)
  num = rand() % 30;		// Zufallszahl zwischen 0 und 30
  ```

## Array Sortieren

Sortieren Sie ein Array mit Zufallszahlen. Verwenden Sie eine Funktion `sort(arr)` dafür.