# 3 Bitoperatoren - Übungen

##  BitSetzen (006)

- Erstellen Sie eine int-Zufallszahl 
- Setzen Sie die geradzahligen Bitposition auf 1, belassen Sie die ungeradzahligen Bitpositionen auf dem Wert den sie haben.
  z.B. Zahl 0x0003 --> 0xAAAB
- Stellen Sie beide Zahlen binär dar


Hilfe: Zufallszahl

```c
    time_t t;			// fuer die Initialisierung

    srand(time(&t));	// Initialisierung
    int r = rand();		// ganzzahlige Zufallszahl zwischen 0 und MAX
    r = rand() % 15;    // ganzzahlige Zufallszahl zwischen 0 und 15
```

##  BitLöschen (007)

- Erstellen Sie eine int-Zufallszahl 
- Setzen Sie immer 2 Stellen hintereinander auf 0, dann 2 Stellen belassen, 2 Stellen auf 0 ...
  z.B. Zahl 0xF0FF --> 0xC0CC
- Stellen Sie beide Zahlen binär dar

##  SetAllBits (008)

- Erstellen Sie eine int-Zahl in der sämtliche Bits gesetzt sind (11111111...11111111b).

##  FlipNum (009)

- Es soll eine dezimale Zahl **num1** umgedreht werden. Aus 123 soll so 321, aus 592 soll 295 gemacht werden.

##  ToggleSign (010)

- Bilden Sie aus der int-Zahl **num1** eine negative Zahl ohne ein Minus zu verwenden (Zweierkomplement).
