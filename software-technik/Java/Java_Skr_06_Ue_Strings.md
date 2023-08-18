# 6 Strings - Übungen

## Klein-/Großschreibung

Nach dem Einlesen eines Strings von der Konsole wird der String mit Großbuchstaben ausgegeben:

```
Geben Sie eine Zeichenkette ein: Hallo Welt
Groß:  HALLO WELT
Klein: hallo welt
```

Tipps:

- `str.toUpperCase()` und `str.toLowerCase()`

## Split

Zerteilen Sie einen String der Form *00:80:41:ae:fd:7e* in die Teile zwischen den Doppelpunkten und geben Sie die Werte in hexadezimaler und dezimaler Form aus:

```
String:   00:80:41:ae:fd:7e
Teile Hex: 0x00, 0x80, 0x41, 0xae, 0xfd, 0x7e
Teile Dez:    0,  128,   65,  174,  253,  126
```

Tipps:

- formatierte Ausgabe: `System.out.format("%03d", 17);` gibt die Zahl 17 so aus: `017` (3 stellig mit führenden 0); Hexadezimale Ausgaben: `%x`
- Hex-Zahl aus String konvertieren: `Integer.parseInt(str, 16)` (Zahlenbasis 16)

## IndexOf

In dem gegebenen String soll das Ergebnis ermittelt werden:

```
12,13.7.2012,WAC:Rapid;Res=0:1,7200
Rapid hat gegen WAC mit 1 zu 0 Toren gewonnen.
```

(der Sieger ist als erster anzuführen)

Im Fall eines Unentschiedens:

```
11,6.7.2012,KTA:Tirol;Res=2:2,1500
KTA hat gegen Tirol mit 1 zu 1 Toren unentschieden gespielt.
```

Tipps:

- `str.indexOf("Res=")` oder `str.indexOf(';')` oder `str.split(',')`

## Reihenfolge Tauschen

In einem gegebenen String mit 2 Worten wird die Reihenfolge der Worte vertauscht:

```
String: John Muller
Flip:   Muller John
```

## Umlaute

Umlaute sollen ersetzt werden:

```
Geben Sie einen String ein: düdeldü änd tröt trÖt
Änderung: duedeldue aend troet trOet
```

Große Umlaute werden verschieden zu kleinen Umlauten verändert.
