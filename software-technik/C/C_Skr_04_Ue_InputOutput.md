## HTTP

Für einen HTTP-Request und -Response wird zuerst einmal ein bestätigter TCP-Verbindungsaufbau benötigt. Ein Request besteht aus:

- Anfangszeile, zum Beispiel

  ```
  GET /startseite.html HTTP/1.1
  ```

- Headerzeilen (optionale Anzahl) mit Name-/Wert-Paar getrennt durch Doppelpunkt, zum Beispiel

  ```
  host: www.htl-salzburg.ac.at
  User-Agent: Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; de; rv:1.8.0.4)
              Gecko/20060508 Firefox/1.5.0.4
  
  ```

- Leerzeile - immer mit `\r\n` 

- Nachricht (optional)

Ein Response:

- Statuszeile, zum Beispiel

  ```
  HTTP/1.1 200 OK
  ```

- Headerzeilen

  ```
  Server: Apache/2.0.49 (Linux/SuSE)
  Date: Thu, 13 Jul 2006 07:19:43 GMT
  Content-Type: text/html
  Connection: close
  
  ```

### Beispiel einer HTTP-Anfrage

Es wird eine Anfrage mittels Browser an einen Web-Server getätigt, die Anfrage wird vom Browser in Form eines HTTP-Requests getätigt. In Folge wird der HTTP-Nachricht ein TCP-Header vorangestellt (TCP-Paket), diesem wiederum ein IP-Header (IP-Datagramm) und letztlich diesem ein Ethernet II-Header. Dieses Paket wird dann gesendet:

![NW_Schichten_HTTP](assets/NW_Schichten_HTTP.png)

(das ist eine mögliche Übertragung)

In einem Browser wird der Link

```
http://deine-erste-homepage.com/muster1.htm
```

aktiviert. Die Aufzeichnung eines Ethernet II-Pakets:

```
3039f21b11c16057183a80090800
4500020959a240008006e71a0a0000045f8e4ea0
c87a00500f512e9680aaec8d50180201bf410000
474554202f6d7573746572312e68746d20485454502f312e310d0a486f73743a206465696e652d65727374652d686f6d65706167652e636f6d0d0a557365722d4167656e743a204d6f7a696c6c612f352e30202857696e646f7773204e542031302e303b2057696e36343b207836343b2072763a37322e3029204765636b6f2f32303130303130312046697265666f782f37322e300d0a4163636570743a20746578742f68746d6c2c6170706c69636174696f6e2f7868746d6c2b786d6c2c6170706c69636174696f6e2f786d6c3b713d302e392c696d6167652f776562702c2a2f2a3b713d302e380d0a4163636570742d4c616e67756167653a2064652c656e2d55533b713d302e372c656e3b713d302e330d0a4163636570742d456e636f64696e673a20677a69702c206465666c6174650d0a436f6e6e656374696f6e3a206b6565702d616c6976650d0a557067726164652d496e7365637572652d52657175657374733a20310d0a49662d4d6f6469666965642d53696e63653a204d6f6e2c2030312044656320323030382031343a32333a333320474d540d0a49662d4e6f6e652d4d617463683a202263632d343563666366346137653334302d677a6970220d0a43616368652d436f6e74726f6c3a206d61782d6167653d300d0a0d0a
```

In diesem Paket wurden lediglich Zeilenumbrüche eingefügt.

**Ethernet II**

Ethernet-Paket-Header:

```
30 39 f2 1b 11 c1 60 57 18 3a 80 09 08 00
```

- Destination-MAC: 30:39:f2:1b:11:c1
- Source-MAC: 60:57:18:3a:80:09
- Protokoll: 0800 - IPv4

Nach diesem Header folgt direkt das IP-Datagramm und nach diesem eine 4-Byte-Checksumme.

**IP**

Datagramm-Header:

```
45 00 02 09 59 a2 40 00 80 06 e7 1a 0a 00 00 04 5f 8e 4e a0
```

- Version: 4 - 4
- Header-Länge: 5 - 20 Bytes
- ...
- Protokoll: 6 - TCP
- Source-IP: 0a000004 - 10.0.0.4
- Destination-IP: 5f8e4ea0 - 95.142.78.160

Nach diesem Header folgt direkt das TCP-Paket.

**TCP**

Paket-Header:

```
c8 7a 00 50 0f 51 2e 96 80 aa ec 8d 50 18 02 01 bf 41 00 00
```

- Source-Port: c87a - 51322
- Destination-Port: 0050 - 80 (HTTP)
- Sequenz-Nummer: 0f512e96
- Acknowledgement-Nummer: 80aaec8d
- Länge: 5 - 20 Bytes
- Flags: 018
- ...

Nach diesem Header folgt direkt der HTTP-Inhalt.

**HTTP**

Nachricht:

```
0000   47 45 54 20 2f 6d 75 73 74 65 72 31 2e 68 74 6d
0010   20 48 54 54 50 2f 31 2e 31 0d 0a 48 6f 73 74 3a
0020   20 64 65 69 6e 65 2d 65 72 73 74 65 2d 68 6f 6d
0030   65 70 61 67 65 2e 63 6f 6d 0d 0a 55 73 65 72 2d
0040   41 67 65 6e 74 3a 20 4d 6f 7a 69 6c 6c 61 2f 35
0050   2e 30 20 28 57 69 6e 64 6f 77 73 20 4e 54 20 31
0060   30 2e 30 3b 20 57 69 6e 36 34 3b 20 78 36 34 3b
0070   20 72 76 3a 37 32 2e 30 29 20 47 65 63 6b 6f 2f
0080   32 30 31 30 30 31 30 31 20 46 69 72 65 66 6f 78
0090   2f 37 32 2e 30 0d 0a 41 63 63 65 70 74 3a 20 74
00a0   65 78 74 2f 68 74 6d 6c 2c 61 70 70 6c 69 63 61
00b0   74 69 6f 6e 2f 78 68 74 6d 6c 2b 78 6d 6c 2c 61
00c0   70 70 6c 69 63 61 74 69 6f 6e 2f 78 6d 6c 3b 71
00d0   3d 30 2e 39 2c 69 6d 61 67 65 2f 77 65 62 70 2c
00e0   2a 2f 2a 3b 71 3d 30 2e 38 0d 0a 41 63 63 65 70
00f0   74 2d 4c 61 6e 67 75 61 67 65 3a 20 64 65 2c 65
0100   6e 2d 55 53 3b 71 3d 30 2e 37 2c 65 6e 3b 71 3d
0110   30 2e 33 0d 0a 41 63 63 65 70 74 2d 45 6e 63 6f
0120   64 69 6e 67 3a 20 67 7a 69 70 2c 20 64 65 66 6c
0130   61 74 65 0d 0a 43 6f 6e 6e 65 63 74 69 6f 6e 3a
0140   20 6b 65 65 70 2d 61 6c 69 76 65 0d 0a 55 70 67
0150   72 61 64 65 2d 49 6e 73 65 63 75 72 65 2d 52 65
0160   71 75 65 73 74 73 3a 20 31 0d 0a 49 66 2d 4d 6f
0170   64 69 66 69 65 64 2d 53 69 6e 63 65 3a 20 4d 6f
0180   6e 2c 20 30 31 20 44 65 63 20 32 30 30 38 20 31
0190   34 3a 32 33 3a 33 33 20 47 4d 54 0d 0a 49 66 2d
01a0   4e 6f 6e 65 2d 4d 61 74 63 68 3a 20 22 63 63 2d
01b0   34 35 63 66 63 66 34 61 37 65 33 34 30 2d 67 7a
01c0   69 70 22 0d 0a 43 61 63 68 65 2d 43 6f 6e 74 72
01d0   6f 6c 3a 20 6d 61 78 2d 61 67 65 3d 30 0d 0a 0d
01e0   0a
```

- Anfrage

   In einem Browser wird der Link
   
   ```
   http://deine-erste-homepage.com/muster1.htm
   ```
   
   aktiviert. Der Browser wandelt diese Eingabe in eine 
   Anfrage an *deine-erste-homepage.com* nach */muster1.html*. Diese Anfrage wird auf TCP mit dem http-Standardport 80 gesendet:
   
```
GET /muster1.htm HTTP/1.1\r\n
Host: deine-erste-homepage.com\r\n
Accept-Language: de,en-US;q=0.7,en;q=0.3\r\n
   \r\n
```

   1. Als Trennzeichen werden Leerzeichen (0x20) und \r\n (0x0d, 0x0a) verwendet
   2. Methode - hier *GET*
   3. Pfad der Ressource */muster1.html *
   4. Version des HTTP-Protokolls
   5. Es folgt der Header, das ist eine optionale Zusammenstellung von Informationen, das können unterschiedlich viele Angaben sein. Dieser Block wird mit einer leeren Zeile beendet.
   6. Nach dem Header kann ein Daten-Block folgen, für eine *GET*-Anfrage entfällt dieser Block (Für etwa einen *POST* wäre das Anders).

- Antwort
  Auf die obige Frage kann folgende Antwort folgen:

  ```
  HTTP/1.1 200 OK\r\n
  Server: Apache\r\n
  Date: Thu, 16 Oct 2018 06:02:55 GMT\r\n
  Last-Modified: Thu, 16 Oct 2017 06:02:55 GMT\r\n
  Content-Type: text/html\r\n
  Content-Length: 160\r\n
  \r\n
  <html>\r\n
  <head>\r\n
  <title>Hier steht der Titel der Homepage</title>\r\n
  </head>\r\n
  <body>\r\n
  Meine erste Homepage. Hier möchte ich euch etwas über mich, meine Freunde und meine Hobbies erzählen.\r\n
  </body>\r\n
  </html>\r\n
  ```

  diese Antwort hat wiederum eine unterschiedliche Anzahl von Elementen, hier sind nur wenige angeführt. Wichtig ist hier: *Content-Type* - damit wird hier mitgeteilt das der folgende *Content* ein HTML als Plain-Text folgt. Zusätzlich die Information *Content-Length* welche die Länge der Daten im direkt anschließenden Datenblock beschreibt, die Trennung ist wiederum ein zusätzlicher *\r\n*.

---
tags: ["c"]
aliases: []
created: 29th November 2022
---

# Ein-/Ausgabe - Übungen

##  Einführung scanf

- Lesen Sie eine Zahl mittels scanf() ein und geben Sie diese wieder in der Konsole aus:

  ```sh
  Bitte geben Sie eine Zahl ein: 34

  Sie haben 34 eingegeben!
  ```

  L:

  ```c
  int num;

  printf("\nBitte geben Sie eine Zahl ein: ");
  scanf("%d", &num);          // 1ter Parameter: Formatbezeichner, 2ter Parameter Variable MIT ADRESSOPERATOR &!

  printf("\nSie haben %d eingegeben!\n", num);
  ```

##  Datum Einlesen (021)

- Lesen Sie ein Datum in der Form TT.MM.JJJJ ein und geben es in der Form JJJJ-MM-TT wieder aus:

  ```sh
  Bitte geben Sie Ihr Geburtsdatum ein (TT.MM.JJJJ): 2.1.1999

  Ihr Geburtsdatum: 1999-01-02
  ```

  L:

  ```c
  int tag, monat, jahr;
  printf("Bitte geben Sie Ihr Geburtsdatum ein (TT.MM.JJJJ): ");

  scanf("%d.%d.%d", &tag, &monat, &jahr); 	// Nicht nur Ausgabe formatiert sondern auch Eingabe
  printf("\nIhr Geburtsdatum: %04d-%02d-%02d\n", jahr, monat, tag);
  ```

##  Mehrfach Einlesen (022)

- Lesen Sie mittels scanf() einen Buchstaben von der Tastatur ein.

- Lesen Sie einen zweiten Buchstaben mittels scanf() von der Tastatur ein.

- Geben Sie beide Eingaben wieder aus:

  ```sh
  Bitte geben sie den 1ten Buchstaben ein:a
  Bitte geben sie den 2ten Buchstaben ein:b

  Die beiden Buchstaben: a b
  ASCII-Codes: 97 98
  ```

  Wenn das Programm ausprobiert wird, sieht das Ergebnis wohl wie im Folgenden aus. Die 2te Eingabe wird übersprungen und die Ausgabe sieht so aus:

  ```sh
  Bitte geben sie den 1ten Buchstaben ein:a
  Bitte geben sie den 2ten Buchstaben ein:
  Die beiden Buchstaben: a

  ASCII-Codes: 97 10
  ```

  Was ist der Grund für dieses Ergebnis?

  L:

  ```c
  char a, b, temp;
  // Einlesen eines einzelnen Zeichens
  printf("Bitte geben sie den 1ten Buchstaben ein:");
  scanf("%c",&a);
  printf("Bitte geben sie den 2ten Buchstaben ein:");
  scanf("%c",&b);
  printf("\nDie beiden Buchstaben: %c %c\nASCII-Codes: %d %d\n", a, b, a, b);
  ```

  scanf() mit %c ließt ein einzelnes Zeichen ein. Wird ein Buchstabe eingegeben und anschließend \<ENTER\> gedrückt werden zwei Zeichen eingegeben. Der Buchstabe und das \<ENTER\>-Zeichen. Wird anschließend ein zweites mal nach einem einzelnen Zeichen mit scanf() gefragt, dann entnimmt diese Abfrage das \<ENTER\>-Zeichen aus dem Tastaturstream. scanf() wartet also gar nicht auf eine zweite Eingabe.

  Lösung: der Aufruf von `fflush(stdin)` leert den Tastaturstream (Eingabestream "stdin").

  Eine andere Lösung ist für die erste Eingabe `scanf("%c\n" &a);` einzulesen, dann holt das scanf das eingegebene Zeichen UND die Eingabetaste ab. Für das nächste scanf ist der Stream dann leer.

  Tipp: die gepufferten Streams können umgeleitet werden, siehe: https://de.wikibooks.org/wiki/Batch-Programmierung:_Batch-Operatoren

  also z.B. `xy.exe < c:\temp\in.txt` oder  `xy.exe < c:\temp\in.txt > c:\temp\out.txt` 

##  Tastendruck (023)

- Lesen Sie den Tastendruck mittels getch() solange ein bis die **z**-Taste gedrückt wird:

  ```sh
  Eingabe wird durch Taste "z" beendet.
  abc die Katz

  Process returned 0 (0x0)   execution time : 4.692 s
  Press any key to continue.
  ```

  L:

  ```c
  char c;
  printf("Eingabe wird durch Taste \"z\" beendet.\n");
  do {
      c = getch();
      printf("%c",c);
  } while (c != 'z');
  ```

##  Pfeiltasten (024)

- Lesen Sie den Tastendruck mittels getch() ein und geben nur Pfeiltasten aus:

  ```sh
  Benutze die Pfeiltasten oder druecke Esc zum Beenden!
  Rauf!
  Runter!
  Links!
  Rauf!
  Rauf!
  Links!
  ```

  (77=Rechts, 75=Links, 80=Runter, 72=Rauf, 27=ESC)

  L:

  ```c
  char c;

  printf("Benutze die Pfeiltasten oder druecke Esc zum Beenden!\n");
  do {
      c = getch();
      if (c == 77) printf("Rechts!\n");
      else if (c == 75) printf("Links!\n");
      else if (c == 80) printf("Runter!\n");
      else if (c == 72) printf("Rauf!\n");
  } while (c != 27);      // Esc
  ```

##  BufferedReadWrite (025)

- Lesen Sie den Tastendruck mittels **fgetc(stdin)** ein und gebe das Zeichen direkt mittels **fputc(stdout)** aus. Beenden Sie die Eingabe mit **fgetc(stdin) = EOF**. EOF steht für EndOfFile.

  ```sh
  Beendet werden kann die Eingabe nur durch Halten der ALT-Taste und gleichzeitiger Eingabe des ASCII-Codes 26 am Nummernblock der Tastatur. 26dez steht fuer EOF. Abschliessend muss Enter gedrueckt werden:
  Tschüss→

  Process returned 0 (0x0)   execution time : 29.503 s
  Press any key to continue.
  ```

  L:

  ```c
  int ch = 0;

  while (ch != EOF) {       // EOF für Windows: <ALT>+26
      fputc(ch, stdout);
      ch = fgetc(stdin);
  }
  ```


## Sterne 1 (026)

- Lesen Sie eine Zahl num von der Tastatur ein

- Geben Sie num viele Sterne * aus

  ```
  Geben Sie die Anzahl der * ein: 15
  ***************
  ```

##  Sterne 2 (027)

- Lesen Sie eine Länge und eine Breite von der Tastatur ein

- Geben Sie ein Rechteck aus:

  ```
  Geben Sie die Laenge und die Breite ein: 3.5
  *****
  *****
  *****
  ```

##  Sterne 3 (028)

- Lesen Sie eine Zahl num von der Tastatur ein

- Geben Sie ein Dreieck aus:

  ```
  Geben Sie die Anzahl der * ein: 6
  ******
  *****
  ****
  ***
  **
  *
  ```

##  Sterne 4 (029)

- Lesen Sie eine Zahl num von der Tastatur ein

- Geben Sie folgende Form aus:

  ```
  Geben Sie die Anzahl der * ein: 6
  ****** *
  ***** **
  **** ***
  *** ****
  ** *****
  * ******
  ```

##  Tabelle (030)

- Lesen Sie eine Länge und Breite einer Tabelle ein

- Geben Sie folgende Form aus:

  ```
  Geben Sie die Laenge und die Breite ein: 6.3
     |A|B|C|D|E|F|
   ---------------
    1| | | | | | |
    2| | | | | | |
    3| | | | | | |
   ---------------
  ```


##  LowerUpperCase (031)

- Ausgabe: "Geben Sie etwas ein (mit \<ENTER\> koennen Sie die Eingabe beenden): "
- Lesen Sie ein Zeichen von der Tastatur ein unterdrücken Sie die Ausgabe.
- Geben Sie eingegebene Kleinbuchstaben als Großbuchstaben aus, eingegebene Großbuchstaben als Kleinbuchstaben und Ziffern gestürzt:
  0->9, 1->8 ... 8->1, 9->0. Sämtliche andere Zeichen sollen als Stern ausgegeben werden.
- Wiederholen Sie den Vorgang bis die Eingabetaste gedrückt wird.

Hilfe:

- mit `int getch()` kann ein Zeichen ohne Ausgabe von der Tastatur eingelesen werden.

- mit `'A'-'a'` kann der Abstand zwischen dem Zeichen Groß-A und Klein-A in der ASCII Tabelle ermittelt werden.

- Ausführungs-Beispiel:

  ```
  Geben Sie etwas ein (mit <ENTER> koennen Sie die Eingabe beenden): hALLO*jAMES*bOND*992
  ```

##  Kommentare (032)

- In einer c-Quellcode Datei sollen die Kommentare /* .... */ gelöscht werden.
- Dazu zeichenweise von der Tastatur einlesen und ausgeben.
- Wenn ein /*-Tag kommt, dann wird begonnen nicht auszugeben. 
- Wenn ein */- Tag kommt, dann wird aufgehört die Ausgabe zu unterdrücken.
- Bei der Ausführung des Programms wird die Eingabe auf eine c-Quelldatei umgeleitet und die Ausgabe in eine Zweite

##  Atoi (020, 033)

- Es gibt die Standard-Funktion atoi welche eine numerische Zeichenkette in eine Nummer umwandelt. Schreiben Sie diese Funktion.

- Ausgabe des doppelten eingegebenen Werts

  ```c
  int z = 0;
  int num = 0;

  printf("Bitte geben Sie eine Zahl ein: ");
  while (z != '\n') {
    z = fgetc(stdin);  // Einlesen eines Zeichens nach dem Anderen

    // Einbau der Umrechnungslogik  
    
  }

    printf("\nDie doppelte Eingabe entspricht %d\n\n", num*2);
  ```

- Ausführungs-Beispiel:

  ```
  Bitte geben Sie eine Zahl ein: 1234
  Die doppelte Eingabe entspricht 2468
  ```

##  Hex2dec (034)

- Es gibt die Standard-Funktion hex2dec welche eine hexadezimale Zeichenkette in eine dezimale Nummer umwandelt. Schreiben Sie diese Funktion.

  ```c
  int z = 0;
  int num = 0;

  printf("Bitte geben Sie eine hexadezimale Zahl ein: ");
  while (z != '\n') {
    z = fgetc(stdin);

      
    // Einbau der Umrechnungslogik
      
      
  }
  printf("\nDie eingegebene hexadezimale Zahl entspricht dezimal \"%d\"\n\n", num);
  ```

- Ausführungs-Beispiel:

  ```
  Bitte geben Sie eine hexadezimale Zahl ein: AB34
  Die eingegebene hexadezimale Zahl entspricht dezimal "43828"
  ```

  
