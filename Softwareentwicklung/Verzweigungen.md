# Verzweigungen

Verzweigung: bedingt ausführbarer Code (es muss eine Bedingung erfüllt sein damit ein Code ausgeführt wird). Wenn Programmteile nicht immer ausgeführt werden, dann müssen sie in einer Verzweigung stehen.

## if-Verzweigung

Damit verzweigt werden kann, muss eine logische Bedingung erfüllt sein. Die logische Bedingung ist ein **Ausdruck**. Dieser muss immer *true* als Ergebnis liefern damit eine Anweisung ausgeführt wird.

```java
if (Ausdruck)		// Ausdruck muss eine Berechnung sein, die ein logisches Ergebnis (true/false) liefert.
  Anweisung;		// true-Zweig: Wird nur ausgeführt wenn Ausdruck true liefert.
```

oder:

```java
if (Ausdruck)		// Ausdruck muss eine Berechnung sein, die ein logisches Ergebnis (true/false) liefert.
  Anweisung1;		// true-Zweig: Wird nur ausgeführt wenn Ausdruck true liefert.
else
  Anweisung2;		// false-Zweig: Wird nur ausgeführt wenn Ausdruck false liefert.
```

Zur Erinnerung: Anweisungen können durch Blöcke ersetzt werden.

> [!EXAMPLE] Beispiel (Java)
```java
if (monat == 2)
  System.out.println("Februar");
...
```

> [!EXAMPLE] Beispiel (Java)
```java
if (monat > 11)
  System.out.println("Dezember");
else
  if (monat > 10)
    System.out.println("November");
  else
    if (monat > 9)
      System.out.println("Oktober");
...
```

Strukturen wie diese sind oft notwendig, sind jedoch sehr schnell unübersichtlich.

## switch-Verzweigung

Die *switch*-Verzweigung ist speziell für Mehrfachverzweigungen. Grundsätzlich kann sie immer durch geschachtelte *if*-Verzweigungen ersetzt werden:

```java
switch (Ausdruck) {
  case Wert1: Anweisung1; break;
  case Wert2: Anweisung2; break;
  ...
  case WertN: AnweisungN; break;
  default: DefaultAnweisung; break;
}
```

*Ausdruck* in der Mehrfachverzweigung muss vom gleichen Typ sein wie *Wert1* … *WertN*. Damit *Anweisung1* ausgeführt wird, muss *Ausdruck* gleich *Wert1* sein. Damit *Anweisung2* ausgeführt wird muss *Ausdruck* gleich *Wert2* sein und so fort. Die *DefaultAnweisung* wird ausgeführt wenn *Ausdruck* keinem der Werte *Wert1* … *WertN* entspricht.

Der *default*-Fall ist optional, das bedeutet er darf entfallen.

> Achtung: wird kein *break* gesetzt, dann werden die folgenden Fälle mit ausgeführt bis zur nächsten *break* Anweisung oder bis die Verzweigung zu Ende ist.

> [!EXAMPLE] Beispiel (Java)
```java
switch (num) {
  case 10: System.out.println("Zehn");
  case 9: System.out.println("Neun");
  case 8: System.out.println("Acht");
  case 7: System.out.println("Sieben");
  case 6: System.out.println("Sechs");
  case 5: System.out.println("Fünf");
  case 4: System.out.println("Vier");
  case 3: System.out.println("Drei");
  case 2: System.out.println("Zwei");
  case 1: System.out.println("Eins"); break;
  default: System.out.println("Zahl zu groß");
}
```

Aufgrund der fehlenden *break* Anweisungen wird hier für `num = 5` ein Countdown von 5 beginnend ausgegeben. Analog für sämtliche anderen Nummern von 1 bis 10. Nach der Ausgabe von *Eins* wird die Verzweigung mit *break* verlassen. Enthält *num* eine Nummer größer 10, dann wird *Zahl zu groß* ausgegeben.

> Switch-Case-Verzweigungen immer dann, wenn vielfach gleichartige Verzweigungen gesucht.
>
> If kann Switch-Case immer ersetzten --> kann übergeführt werden.
