# 5 Kontrollstrukturen - Übungen

## Sterne

- Lesen Sie eine ganze Zahl ein

- Geben Sie entsprechend viele Sterne aus

- Die Ausgabe würde für die Eingabe 5 so aussehen:

  ```
  Geben Sie eine ganze Zahl ein: 5
  *****
  ```

- Erweitern Sie das Programm:

  ```
  Geben Sie eine ganze Zahl ein: 5
  *
  **
  ***
  ****
  *****
  ```

- Erweitern Sie das Programm:

  ```
  Geben Sie eine ganze Zahl ein: 5
  *****
  ****
  ***
  **
  *
  ```

- Erweitern Sie das Programm:

  ```
  Geben Sie eine ganze Zahl ein: 5
  *
  **
  ***
  ****
  *****
  ****
  ***
  **
  *
  ```

- Erweitern Sie das Programm:

  ```
  Geben Sie eine ganze Zahl ein: 5
  *****
  *   *
  *   *
  *   *
  *****
  ```

## Begrüßung

Lesen Sie einen Namen ein und geben Sie in gerahmt wieder aus (1 Leerzeichen vor "Hallo" und 1 Leerzeichen nach "!"):

```
Geben Sie bitte Ihren Namen ein: Hans
***************
*             *
* Hallo Hans! *
*             *
***************
```

## NiM-Spiel

Spielregeln:

- verfügbar sind 21 Hölzchen, es spielen Spieler1 + Spieler2
- Spieler1 beginnt, das Programm fragt: "Spieler1: "
- der Spieler gibt ein wieviele Hölzchen er von den verfügbaren Hölzern nimmt (1,2 oder 3), dadurch wird die Anzahl der Hölzer reduziert und es erfolgt die Ausgabe:
  "Anzahl der Hölzer: xx"
- der nächste Spieler ist dran, das Programm fragt: "Spieler2:"
- ...
- wenn einer der beiden Spieler die Hölzer auf 0 reduziert ist er der Gewinner. Ausgabe: "Spieler x hat gewonnen, Gratulation"
- entnimmt ein Spieler weniger als 1 oder mehr als 3 Hölzer (oder mehr als verbliebene Hölzer), wird die Frage wiederholt.

```
 **  ***  ***   **     **
 * *  *    *    * *   * *
 * *  *    *    * *   * *
 *  * *    *    *  * *  *
 *  * *    *    *  * *  *
***  **   ***  ***  *  ***
Gegeben sind 21 Hölzer. Entnehmen Sie ab abwechselnd je 1,2 oder 3 Hölzchen. Wer als letztes Hölzchen entnimmt gewinnt das Spiel.
Hölzchen: 21
Spieler1: 2
Hölzchen: 19
Spieler2: 3
Hölzchen: 16
Spieler1: 1
Hölzchen: 15
Spieler2: 7
Spieler2: 2
Hölzchen: 13
Spieler1: 0
Spieler1: 3
Hölzchen: 10
Spieler2: 3
Hölzchen: 7
Spieler1: 3
Hölzchen: 4
Spieler2: 2
Hölzchen: 2
Spieler1: 2
Hölzchen: 0
Spieler1 hat gewonnen, Gratulation
```

Mögliche Erweiterungen:

- zu Beginn des Spiels wird Spieler1 und Spieler2 nach ihren Namen gefragt und von da an immer der Name anstatt Spieler1/Spieler2 ausgegeben
- weitere Erweiterung: vor Spielbeginn Eingabe mit wieviel Hölzchen gestartet wird und/oder wieviele Hölzchen mit jedem Zug genommen werden können
- weitere Erweiterung: bei Falscheingabe Ausgabe einer entsprechenden Warn/Fehlermeldung

## Groß Klein

- Einlesen eines Zeichens von der Tastatur
- Für einen eingegebenen Kleinbuchstaben wird der entsprechende Großbuchstabe ausgegeben
- Jedes andere Zeichen bleibt unverändert

```
Geben Sie ein Zeichen ein: a
A
Geben Sie ein Zeichen ein: q
Q
Geben Sie ein Zeichen ein: A
A
Geben Sie ein Zeichen ein: 8
8
Geben Sie ein Zeichen ein: (
(
```

- Fehlerprüfungen sind nicht notwendig (Eingabe von mehr als einem Zeichen)
- Mit Zeichen kann "gerechnet" werden:    `zeichen > 'a'` oder `zeichen <= 'z'` oder `zeichen++`

## Wort Groß/Klein

- Einlesen eines Worts von der Tastatur
- Die Buchstaben des Worts werden, wenn es sich um Kleinbuchstaben handelt, auf entsprechende Großbuchstaben umgewandelt
- Nicht-Buchstaben bleiben unverändert

```
Geben Sie ein Wort ein: Hallo
HALLO
Geben Sie ein Wort ein: DuDa
DUDA
Geben Sie ein Wort ein: JamesBond007
JAMESBOND007
```

- Fehlerprüfungen sind nicht notwendig

- Mit Zeichen kann "gerechnet" werden:    `zeichen > 'a'` oder `zeichen <= 'z'` oder `zeichen++`

- Ermitteln eines Zeichens des Worts:

  ```java
  String s1 = "Hallo";
  char ch = s1.toCharArray()[1];    // 2ter Buchstabe 'a' (Zaehlung beginnt mit 0)
  ch = s1.toCharArray()[0];         // 1ter Buchstabe 'H' (Zaehlung beginnt mit 0)
  ```

- Ermitteln der Anzahl der Buchstaben eines Worts:

  ```
  String s1 = "Schubidu";
  int len = s1.length();
  ```

## BMI

Berechnen Sie den BodyMassIndex:

```
BMI-Berechnung
==============
Geben Sie Ihre persönlichen Daten ein (Körpergröße[cm] Körpergewicht[kg]): 170 70
Ihr BMI beträgt 24.221453287197235 kg/m²
Der Wert liegt im Normalbereich.
```

## Widerstandsnetzwerk

Berechnen Sie den Ersatzwiderstand für die Schaltung:
R1 in Serie mit der Parallelschaltung von (R2 parallel zu R3).

```
Widerstandberechnung
********************
Geben Sie die Widerstandswerte (in kOhm) ein:
R1 [kOhm] = 2
R2 [kOhm] = 5,4
R3 [kOhm] = 1,33
Gesamtwiderstand Rg = 3,07 kOhm
```

- Ausgabe mit , anstatt .

  ```
  System.out.printf(Locale.GERMAN, "Num: %f", 1.2);
  // Gibt "Num: 1,2" aus
  ```

  Damit wird auf die Deutsche Schreibweise umgeschaltet. printf ist  eine "formatierte Ausgabe". Das %f ist ein Platzhalter für einen Fließkommawert. Dieser wird an den String als Parameter mitgegeben.

  Alternativ kann komplett auf eine andere Lokalisierung umgeschaltet (Oben nur für die eine Ausgabe) werden:

  ```
  Locale.setDefault(Locale.GERMAN);
  ```

- Anzeige von begrenzten Stellen hinter dem Komma

  ```
  DecimalFormat fmt = new DecimalFormat("0.##"); // 2 Stellen hinter Komma
  System.out.println("Zahl: " + fmt.format(1.33333333333333));
  // Gibt 1.33 aus
  ```

- Einlesen von Deutschen Komma-Trennern:

  ```
  String str = "1,333";
  NumberFormat f = 
  NumberFormat.getInstance(Locale.GERMAN);
  Number number = f.parse(str);
  double len = number.doubleValue(); // len = 1.333
  ```


## Mittelwert

Berechnen Sie den arithmetischen Mittelwert aus Ihren Zeugnisnoten:

```
╔═══════════════════╗
║ Notendurchschnitt ║
╚═══════════════════╝
Geben Sie die zu mittelnden Noten ein:
1 2 2 3 2 3 4 1 2 1 1 2 e
Der Notendurchschnitt beträgt:
2.0
```

Mit der Eingabe von "e" wird erkannt, dass Eingabe zu Ende ist

## ggT

Ermitteln Sie den größten gemeinsamen Teiler von 2 ganzen Zahlen:

```
Geben Sie 2 ganze Zahlen ein: 14 77
ggT(14,77) = 7
```

Stellen Sie sicher, dass die Berechnung auch für negative Zahlen funktioniert.

## kgV

Ermitteln Sie das kleinste gemeinsame Vielfache von 2 ganzen Zahlen:

```
Geben Sie 2 ganze Zahlen ein: 49 35
kgV(49,35) = 245
```

Stellen Sie sicher, dass die Berechnung auch für negative Zahlen funktioniert.

## Bruch

Berechnen Sie die Bruch-Addition:

```
Addition von 2 Brüchen
Geben Sie Z1 N1 Z2 N2 ein: 13 5 27 10
13/5 + 27/10 = 53/10
```

