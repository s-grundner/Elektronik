# 1 C++ Einführung - Übungen

## Ein-/Ausgabe Konsole (601)

Schreiben Sie ein Programm das

- eine Zahl einliest, Bsp.: `cin >> num;`
- Zahlen von 1 bis zur eingelesenen Zahl ausgibt, Bsp.: `cout << "x=" << num << endl;`

Beispielhafte Ausgabe:

```c++
Geben Sie eine Zahl ein bis zu welcher ausgegeben werden soll: 3

1
2
3
```

## Zufalls-Array (602)

- Erstellen Sie ein 2-dimensionales int-Array, Bsp: `int arr[3][5];`
- Die Größe der Dimensionen soll durch ein Makro gegeben sein, Bsp: `#define LENX 3`
  (alternativ kann die Größe eines Arrays mit Hilfe von `sizeof(arr)` bestimmt werden - das liefert die Größe des Arrays in Anzahl Bytes (!)).

- Befüllen Sie das Feld mit Zufallszahlen

  ```
  srand(time(nullptr));			  // Initialisierung (Seed)
  int zufall = rand() % 77;		// ganzzahlige Zufallszahl zwischen 0 und 77
  ```

- Geben Sie den Inhalt des Feldes aus und außerdem den größten und kleinsten Wert.
  Beispielhafte Ausgabe:

  ```
  Arr = [[1 2 6 ]
         [9 2 5 ]
         [3 7 10 ]
         [4 11 8 ]]
  Min = 1
  Max = 11
  ```

## Funktionen (602)

- Erweitern Sie das Programm "Zufalls-Array (602)", sodass jede Zahl im Array nur einmal vorkommt.
- Erstellen Sie dafür eine Funktion `bool avail(...)` die Prüft ob der Zufallswert schon vorhanden ist
- Nachdem die Implementierung funktioniert, versuchen Sie die Funktion ist in einer eigenen Datei (avail.cpp und avail.h) zu erstellen.

## Dateizugriff (603)

- Schreiben Sie den Text "Hallo\nwie\geht's?" in die Datei *myFile.txt*.
- Öffnen einer Datei: `FILE* fhdl = fopen("c:\\temp\\info.ini", "wt");`. wt = write Text; der erste Buchstabe steht für Zugriffsart: w=write, r=read, a=append, der zweite Buchstabe unterscheidet zwischen Text und Binär-Datei
- Schreiben eines Strings str in eine Datei: `fprintf(fhdl, "Hallo");`. fprintf funktioniert wie printf.
- Schließen einer Datei: `fclose(fhdl);`

- Lesen Sie anschließend den Text wieder ein und geben ihn in der Konsole aus
- Lesen aus einer Datei in einen String str: `char *fgets(str, 10, fhdl);` (eine Zeile jedoch maximal 10 Zeichen).
- Erkennen Ende der Datei: `eof(fhdl)`

