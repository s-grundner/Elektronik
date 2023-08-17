# 5 Kontrollstrukturen - Übungen

## ShortIf1

- Vergleichen Sie zwei Zahlen miteinander und geben Sie das Verhältnis aus:

  ```c
  int z1 = 5;
  int z2 = 4;

  printf("%i ist ",z1);

  // insert branch

  printf(" als %i",z2);
  ```

- Beispiel-Ausgabe:

   `5 ist groeszer als 4`

- oder so:

  `3 ist kleiner als 4`

## ShortIf2

- Lesen Sie eine Zahl ein und geben Sie aus ob sie gerade oder ungerade ist. Verwenden Sie eine kurze Verzweigung (?:).

- Beispiel-Ausgabe:

  ```sh
  Geben Sie eine Zahl ein: 35
  Die eingebene Zahl ist ungerade.
  ```

## CheckPrimzahl

Lesen Sie eine Zahl ein und Prüfen Sie ob es sich um eine Primzahl handelt.

- Zahl Einlesen
- Primzahlen: nur durch sich selbst oder 1 teilbar.
- Prüfen ob Zahl durch 2 teilbar, wenn ja -> Ende, keine Primzahl, sonst weiter
- Prüfen ob Zahl durch 3 teilbar, wenn ja -> Ende, keine Primzahl, sonst weiter
- ...
- Wenn Teiler die zu untersuchende Zahl erreicht, dann handelt es sich um eine Primzahl

- Beispiel-Ausgabe:

  ```
  Primzahlenprüfung
  Geben Sie eine Zahl ein: 13
  13 ist eine Primzahl
  ```

## CalcPrimzahlen (040)

- Lesen Sie eine Zahl ein und geben Sie sämtliche Primzahlen bis zu dieser Zahl aus

- Beispiel-Ausgabe:

  ```
  Primzahlenberechnung
  Geben Sie das Maximum ein: 12
  2, 3, 5, 7, 11,
  ```

## Potenzieren (041)

- Lesen Sie zwei Zahlen ein und berechnen und geben Sie (zahl1^zahl2) aus.

- Beispiel-Ausgabe:

  ```
  Potenzieren
  Geben Sie die Basis ein: 3
  Geben Sie den Exponenten ein: 4
  (3^4) = 81
  ```


## Prüfziffer (042)

- Viele Nummern (Strichcode, ISBN, Kreditkartennummern) beinhalten zur Sicherheit eine Prüfziffer mit der die Gültigkeit der Nummer geprüft werden kann. 

- Die einfachste Variante einer solchen Prüfziffer ist, dass sämtliche Ziffern aufsummiert werden (sogenannter Quersumme) und die niedrigste Stelle der Summe angehängt wird. Beispiel: die Summer der Ziffern der Nummer 123 beträgt 1+2+3=**6**. Die vollständige Nummer lautet daher 123**6**. Für die Nummer 999 beträgt die Quersumme 9+9+9=2**7**. Die Nummer einschließlich der Prüfziffer lautet daher 999**7**. Die letzte Stelle einer Zahl läßt sich mit Modulo 10 ermitteln: 27 % 10 = 7.

- Erstellen Sie ein Programm dass für eine eingelesene Zahl prüft ob sie aufgrund der Prüfziffer gültig ist. Wird 999**6** eingegeben ist diese Nummer ungültig, ebenfalls 123**5**.

- Beispiel-Ausgabe:

  ```
  Bitte geben Sie eine Zahl ein: 9997
  Die Zahl ist gueltig.
  ```

  ```
  Bitte geben Sie eine Zahl ein: 9993
  Die Zahl ist nicht gueltig.
  ```