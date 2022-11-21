# Wiederholung C

### Datentypen

- char, int, short, long, float, double
- signed/unsigned

### Arrays/Felder

- Definition *int arr[]*
- Kann von jedem Typ gemacht werden (auch von Feldern, Strukturen ...)
- Index *0 .. n-1*
- Keine Prüfung auf Bereichsüberschreitung (IndexOutOfBoundsException)
- Sonderfall *Zeichen*-Feld (= String)

### Zeichenketten

- In C immer nur eine Folge von char-Zeichen

- Ende der Zeichenkette wird mittels 0-Zeichen dargestellt

- In *string.h* sind unter anderem folgende hilfreiche Funktionen verfügbar:

  - length()	(Länge **ohne** 0-Zeichen)

  - strcpy() Kopieren einer Zeichenkette (str1 = str2 kopiert nicht) einschließlich 0-Zeichen. Keine Prüfung ob Größe des Ziel-Strings groß genug.

  - strncpy() Kopieren von n Zeichen einer Zeichenkette, besser als strcpy() - kann Längenüberschreitung abfangen.

  - strcat() Anfügen einer Zeichenkette an eine andere.

  - strncat() Anfügen von maximal n Zeichen einer Zeichenkette an eine andere.

  - strtok() Ein Delimiter wird durch 0 ersetzt und ein Zeiger auf den Teilstring (token) zurückgegeben.

### Funktionen

- Funktionsdeklaration mittels Prototyp (Funktionskopf)
- Call-by-Value: Werte werden in Funktionsparameter einkopiert
- Call-by-Reference: Adressen von Variablen werden in Funktionsparameter einkopiert
- Parameter als einfache Datentypen (int, char ...), als Zeiger, Strukturen und als Felder
- Feldparameter werden als Zeiger übergeben. Ein sizeof() auf diese Parameter liefert immer die Zeigergröße (4) und nicht die Feldgröße (weil ja Zeiger nicht Feld)

### Zeiger

- Zeiger = Pointer = Adresse = Referenz
- Zeiger sind Adressen und daher immer gleich groß (4 Bytes), unabhängig worauf sie zeigen
- Definition mit dem \*-Operator: *int \*ptr*
- Zugriff auf die Adresse einer Variable mit dem &-Operator *&var*
- Zugriff auf den Wert der unter einer Adresse abgelegt ist mit dem \*-Operator *val = \*ptr*
- Felder sind Zeiger. Eine Feldvariable zeigt auf die Adresse des 1ten Elements des Feldes
- Dynamische Speicherreservierung und Freigabe *alloc/free*

### Makros

- Präprozessor-Direktive, werden vor der Übersetzung (Kompilierung) des Programms ersetzt (durch den Präprozessor)
- Kann Parameter beinhalten *#define       MAX(x,y)     (x > y ? x : y)*
- Keine Typprüfung in Makros (Nachteil gegenüber inline-Funktionen)

### Dateizugriff

- Ablauf Öffnen - Lesen/Schreiben - Schließen

### Module

- h-Dateien (Einbinden von Prototypen)
- c-Dateien (Implementierung der Funktionen)
- Modul: Daten + Funktionen, Programm: Summe von Modulen die für die Ausführung notwendig sind.