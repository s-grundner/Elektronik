# 6 Felder - Übungen

## FlipArr

- Definieren Sie ein 3 Elemente großes Array
- Lesen Sie die Werte eines Arrays von der Tastatur ein
- Drehen Sie das Array um und geben es aus

Beispiel-Ausgabe:

```
Element: 1
Element: 2
Element: 3
Eingegeben: [1,2,3]
Umgedreht:  [3,2,1]
```

## GetStat

- Lesen Sie die Werte eines Arrays von der Tastatur ein
- Geben Sie den Maximalen, Minimalen und den arithmetischen Mittelwert der Werte aus (einschließlich Pos.)

Beispiel-Ausgabe:

```
Element: 7
Element: 2
Element: 8
Maximum:  8 Pos: 2
Minimum:  2 Pos: 1
Mittelw.: 5.6
```

## SortArr

- Lesen Sie die Werte eines Arrays von der Tastatur ein
- Sortieren Sie die Werte des eingelesenen Arrays

Beispiel-Ausgabe:

```
Element: 7
Element: 2
Element: 8
Eingegeben: [7,2,8]
Umgedreht:  [3,2,1]
```

## ReadString (050)

- Durch das Einlesen von Zeichenketten mittels **fgets** wird auch ein Zeilenumbruch eingelesen (da ja die Eingabe mit \<Enter\> beendet wird):

  ```c
  fgets(str, 10, stdin);
  // Anpassung von str hier einfuegen
  printf("Der Text ohne Zeilenumbruch: _%s_", str);
  ```

- Ändern Sie den obigen Code so ab, dass die Variable str nicht mehr mit einem Zeilenumbruch endet. strlen(...)  gibt die Länge einer Zeichenkette exklusiv '\0' zurück.

- Beispiel-Ausgabe:

  ```
  Geben Sie einen Text ein: _Das ist eine Beispieleingabe ...
  _
  Der Text ohne Zeilenumbruch: _Das ist eine Beispieleingabe ..._
  ```

## Notendurchschnitt (051)

- Einlesen von 10 (Fließkomma-) Noten über die Konsole.

- Berechnung und Ausgabe des Notendurchschnitts.

- Beispiel-Ausgabe:

  ```
  Bitte geben Sie Ihre 10 Flieszkomma-Noten ein:
  1.0
  2.5
  1.0
  1.5
  2.0
  3.5
  1.0
  2.0
  1.5
  1.0

  Noten-Durchschnitt: 1.70
  ```

## Sieben Segment (052)

(Mikrocontroller)

- Schreiben Sie ein Programm das für eine dezimale Zahl die Ansteuerung von sieben digitalen Ausgängen einer Sieben-Segment-Anzeige berechnet. Die Segment-Nummerierung beginnt mit dem obersten Quer-Segment (Bit6), setzt sich entlang der Außensegmente im Uhrzeigersinn fort. Das letzte Segment ist der Querbalken in der Mitte (Bit0).

- Beispiel-Ausgabe:

  ```
  Geben Sie eine Zahl ein: 4
  Ansteuerung: 0x33
  ```

- Lösen Sie das Problem mittels einer Übersetzungstabelle

## Palindrom (053)

- Als Palindrom wird ein String bezeichnet, wenn er von Vorne und auch von Hinten gelesen gleich lautet. Beispiel: "otto".

- Schreiben Sie ein Programm das prüft ob eine eingegebene Zeichenkette ein Palindrom ist. Groß- und Kleinschreibung soll ignoriert werden.

- Beispiel-Ausgabe:

  ```
  Geben Sie eine Zeichenkette ein: Radar
  Die Zeichenkette ist ein Palindrom
  ```

  ```
  Geben Sie eine Zeichenkette ein: Huber
  Die Zeichenkette ist kein Palindrom
  ```

- Erweiterung: Leerzeichen sollen ignoriert werden:

  ```
  Geben Sie eine Zeichenkette ein: Anni mag Lehrer Helga Minna
  Die Zeichenkette ist ein Palindrom
  ```

## Cäsar-Verschlüsselung (054)

- Werden in einer Zeichenkette die einzelnen Zeichen um eine feste Zahl verschoben, dann wird das eine Cäsar-Verschlüsselung bezeichnet.

- Schreiben Sie ein Programm das Texte in entsprechender Art verschlüsselt.

- Beispiel-Ausgabe:

  ```
  Geben Sie den zu verschluesselnden Text ein: caesar
  Der Text mit um 3 verschobenen Zeichen lautet: fdhvdu
  ```

- Wird ein "Schlüssel" (Verschiebung) von 13 verwendet wird das auch als ROT13 (Rotation um 13) bezeichnet. Wird der Text anschließend ein zweites Mal verschlüsselt, dann ist der Text wieder unverschlüsselt. Damit kann das Programm einfach getestet werden.

## Buchstabenhäufigkeit (055)

- Die Häufigkeit von unterschiedlichen Buchstaben in einem Text ist für unterschiedliche Buchstaben unterschiedlich groß. Angewendet wird dieses Wissen unter Anderem in der Entschlüsselung oder der Datenkompression.

- Schreiben Sie ein Programm das die Anzahl von Buchstaben in einem Text ausgibt.

- Beispiel-Ausgabe:

  ```
  Geben Sie einen Text ein: der salat ist fertig
  Buchstabenhaeufigkeit:
  a: 0.105
  d: 0.052
  e: 0.105
  f: 0.052
  g: 0.052
  i: 0.105
  l: 0.052
  r: 0.105
  s: 0.105
  t: 0.157
  ```

- Erweiterung: Groß-/Kleinschreibung soll gleichwertig sein

Mit Dateiumlenkung können größere Texte komfortabel aus Dateien eingelesen werden (ohne Zeilenumbruch).

Deutsche Texte haben statistisch eine deutliche Häufung des Buchstaben "e". Wird ein Cäsar-verschlüsselter Text auf das häufigste Zeichen durchsucht und die Verschiebung zum Buchstaben e berechnet, dann kann damit der Text entschlüsselt werden. Falls kein sinnvolles Ergebnis rauskommt kann es mit den nächst häufigen Zeichen untersucht werden. 

## SortUp (056)

- Erzeugen Sie ein Zufallszahlenfeld mit 100 Elementen

  ```c
  srand(time(NULL));		// Zufallsgenerator initialisieren
  int num = rand();	     // int - Zufallszahl erzeugen
  int num2 = rand() % 40;  // int - Zufallszahl zwischen 0 und 39
  ```

- Zeigen Sie das Feld in der Konsole an

- Sortieren Sie das Feld aufsteigend

- Zeigen Sie das Feld in der Konsole an

- Beispiel-Ausgabe:

  ```
  unsortiert: [1,7,91,8,2,17]
  sortiert:   [1,2,7,8,17,91]
  ```


## AstattO (057)

- Lesen Sie einen Text ein

- Ersetzen Sie sämtlich 'a' im Text mit 'o's und umgekehrt.

- Beispiel-Ausgabe:

  ```
  Geben Sie einen Text ein: Hallo
  a fuer o:                 Holla
  ```

- Tipp: Einlesen einer Zeichenkette mit `fgets(myString, 10, stdin)`, wobei 10 die Anzahl der maximalen Zeichen angibt und stdin den Stream von dem gelesen werden soll (stdin = Tastatur).


## StringTerm (058)

- Initialisieren Sie str1 = "Hallo Du Da"
- Initialisieren Sie str2 = "h"
- Lesen Sie einen String von der Tastatur direkt in str2 mit scanf(): `scanf("%s", str2);`
- Geben Sie den String str1 aus
- Führen Sie das Programm aus und geben "sowieso" ein.
- Was wird ausgegeben und warum?


## IdxOverrun (059)

- Untersuchen Sie das folgendes Programm, wie lange läuft es? Eventuell Verändert ein Verschieben von der `int i;` Zeile hinter die arr-Zeile (Auswirkung hängt von der IDE/Compiler ab).

  ```c
  #define LEN 50

  int i;
  int arr[LEN];

  for (i = 1; i <= LEN; i++) {
      arr[i] = i/10;
  }
  ```

## ReplaceMax (060)

-   Gegeben ist ein int-Feld arr = [2, 7, 5, 3, 8, 5, 6, 4, 2, 5]. Ersetze den höchsten Wert durch 99.

-   Geben Sie das resultierende Feld in der Form aus: **[2 7 5 3 99 5 6 4 2 5 ]**.

-   Beispiel-Ausgabe:

    ```
    Ursprungsfeld: [2, 7, 5, 3, 8, 5, 6, 4, 2, 5]
    Max->99:       [2, 7, 5, 3, 99, 5, 6, 4, 2, 5]
    ```


## ReplaceFieldCont (061)

- Gegeben ist eine Zeichenkette str1 = **"Liegt ein Auge auf dem Tresen ist ein Zombie dagewesen"**.

- In einer weiteren Zeichenkette str2 = **"aeiou"** sind Buchstaben gegeben die in der 1ten Zeichenkette durch einen Stern/Asterisk ***** ersetzt werden sollen.

- Nach der Ausführung stehen in der 1ten Zeichenkette: **"L\*\*gt \*\*n A\*g\* \*\*f d\*m Tr\*s\*n \*st \*\*n Z\*mb\*\* d\*g\*w\*s\*n"**.

- Beispiel-Ausgabe:

  ```
  Geben Sie einen Text ein: Liegt ein Auge auf dem Tresen ist ein Zombie dagewesen
  Codierung:                L**gt **n A*g* **f d*m Tr*s*n *st **n Z*mb** d*g*w*s*n
  ```


## ProfWarning (062)

- Gegeben ist eine Zeichenkette str1 = 

  *"Lehrer sind immer nur am Schwaetzen tun den Eltern alles petzen. Besserwisser aus dem Buche immer nur auf Fehlersuche. Der Schulalltag ist gar nicht leicht wenn einen schon die Angst beschleicht. Das der Lehrer mit den Eltern spricht dann ist man wieder Boesewicht."*

- In einer zweiten Zeichenkette str2 = **"Lehrer"** ist eine Zeichenfolge gegeben die in str1 gesucht und ersetzt werden muss. Und zwar durch **"*"** und eine Folge von Beeps.

- Das Ergebnis soll so aussehen:
  *"\* sind immer nur am Schwaetzen tun den Eltern alles petzen. Besserwisser aus dem Buche immer nur auf Fehlersuche. Der Schulalltag ist gar nicht leicht wenn einen schon die Angst beschleicht. Das der \* mit den Eltern spricht dann ist man wieder Boesewicht."*

  Bei der "\*" Ausgabe wird gleichzeitig gebeept. Für einen Beep (Bell) gibt's einen ASCII Code.

- Beispiel-Ausgabe:

  ```
  str1 = "Lehrer sind immer nur am Schwaetzen tun den Eltern alles petzen. Besserwisser aus dem Buche immer nur auf Fehlersuche. Der Schulalltag ist gar nicht leicht wenn einen schon die Angst beschleicht. Das der Lehrer mit den Eltern spricht dann ist man wieder Boesewicht;
  str2 = "Lehrer"
  res = "* sind immer nur am Schwaetzen tun den Eltern alles petzen. Besserwisser aus dem Buche immer nur auf Fehlersuche. Der Schulalltag ist gar nicht leicht wenn einen schon die Angst beschleicht. Das der * mit den Eltern spricht dann ist man wieder Boesewicht."
  ```

## Spielfeld (063)

- Ein 2-Dimensionales Feld repräsentiert ein Spielfeld (Größe durch Defines: 8x10).

- Durch Eingabe einer Pfeil-Taste (getch-Funktion aus conio.h) wird die Position einer Spielfigur in diesem Spielfeld bewegt.

- Nach jedem Tastendruck wird das Feld ausgegeben.

- Beendet wird das Programm durch (einmaliges) Drücken der Esc-Taste.

- Beispiel-Ausgabe für runter-rechts-rechts-rechts-rauf:

  ```
  1 0 0
  0 0 0
  _______________

  0 0 0
  1 0 0
  _______________

  0 0 0
  0 1 0
  _______________

  0 0 0
  0 0 1
  _______________

  0 0 0
  1 0 0
  _______________

  1 0 0
  0 0 0
  _______________
  ```


## Passwort (064)

- Von der Tastatur wird ein Passwort eingelesen.

- Die eingegebenen Zeichen werden nicht direkt angezeigt sondern durch \* überdeckt.

- Zulässige Zeichen sind Buchstaben, Zahlen und Sonderzeichen. Nicht zulässig sind Tasten wie Pfeil-, Del-, und Funktionstasten also Zeichen die nicht angezeigt werden können.

- Die Eingabe wird mit \<Enter\> abgeschlossen.

- Das eingegebene Wort wird mit dem korrekten Passwort verglichen, wenn richtig wird das Programm beendet ansonsten wird erneut nach dem Passwort gefragt.

- Abgebrochen kann die Eingabe mit der \<Esc\>-Taste.

- Beispiel-Ausgabe:

  ```
  Geben Sie bitte das Passwort ein: *****
  Das eingegebene Passwort ist falsch.
  Geben Sie bitte das Passwort ein: *********
  Passwort korrekt.
  ```
  ```
  Geben Sie bitte das Passwort ein: *****
  Das eingegebene Passwort ist falsch.
  Geben Sie bitte das Passwort ein:
  Eingabe abgebrochen.
  ```

- Erweiterung: mit Backspace ist es möglich bisherige Eingaben zu korrigieren.

- Erweiterung: Erstellen eines Strings (eingegebenes Passwort hier EntryCode). user kommt aus einer zweiten Variable:

  ```
  Geben Sie bitte das Passwort ein: *********
  Passwort korrekt.
  Zugang mit: "user@EntryCode"
  ```

  Lösen mit strcat und sprintf.

## Produkt (065)

- Von der Tastatur wird mit fgets eine Zahl eingegeben (Fließkommazahl mit Beistrich als Dezimalzeichen) eingelesen.

- Von der Tastatur wird mit fgets eine zweite Zahl eingelesen.

- Ausgegeben wird das Produkt der ersten mit der zweiten Zahl (als Zahlen mit Dezimalpunkt).

- Beispiel-Ausgabe:

  ```
  Geben Sie die 1. Zahl ein: 123,4
  Geben Sie die 2. Zahl ein: 13
  123.4 x 13.0 = 1604.2
  ```