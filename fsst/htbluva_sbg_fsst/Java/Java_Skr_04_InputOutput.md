
4 Ein-/Ausgabe
====================

## Ausgabe

- Unformatiert

  Zum Ausgeben von Zeichen in der Konsole:

  ```java
  System.out.println("Die Anzahl der Haeuser: " + anzHaeuser);
  ```

  Die Methode *println* gibt einen Text in der Konsole aus. Mit dem + Operator können in Java einfach Strings (Text) verknüpft werden. Werden Strings und Nummern miteinander veraddiert, dann werden die Nummern zuvor in Texte umgewandelt.

- Formatierte Ausgabe:

  Zum Steuern wie Variablen-Werte in der Konsole ausgegeben werden sollen, eignet sich die *format*-Methode. Damit kann gesteuert werden ob eine Zahl etwa in hexadezimaler Schreibweise dargestellt werden soll. Für Fließkommazahlen kann damit auch die Anzahl der dargestellten Stellen vor/hinter dem Komma eingestellt werden.

  ```java
  System.out.format("Radius des Kreises r = %18.2f cm\n",r);
  ```

  Benötigt werden dafür Formatbezeichner. Der erste Parameter von format ist ein Text der Ausgegeben werden soll. Zum Kenntlich machen, dass eine Variable ausgegeben werden soll wird ein Platzhalter mit dem %-Zeichen eingeleitet. Beendet wird dieser Platzhalter mit einem Buchstaben der angibt als was die Variable zu interpretieren ist:

  - c Character (Zeichen)
  - d Dezimale Ganzzahl
  - f Fließkommazahl
  - x Hexadezimalzahl (mit Kleinbuchstaben)
  - s String

  Im Ausgabe-String können beliebig viele solche Platzhalter angeführt sein. Als weitere Parameter müssen in der format-Methode die darzustellenden Variable folgen in der Reihenfolge in der sie die Platzhalter befüllen sollen.

  Zwischen % und dem Buchstaben können noch weitere Angaben eingefügt werden wie die Anzahl der Stellen die freigehalten werden sollen für die Variable und die Anzahl der Stellen hinter dem Komma.

  Die Möglichkeiten Variablen zu formatieren sind sehr umfangreich, für besondere Fälle daher:

  https://docs.oracle.com/javase/10/docs/api/java/util/Formatter.html

## Eingabe

- *Scanner*

  Mit *next* wird die nächste Eingabe eingelesen:

  ```java
  Scanner sc = new Scanner(System.in);
  String eingabe = sc.next();
  sc.close();
  ```

- *BufferedReader*

  Von der Tastatur kann genau wie aus einer Datei mittels *BufferedReader* gelesen werden (siehe später, dann wird das hier auch klarer):

  ```java
  InputStreamReader isr = new InputStreamReader(System.in);
  BufferedReader br = new BufferedReader(isr);
  String eingabe = "";
  try {
    eingabe = br.readLine();
  } catch (IOException e) {
    // EingabeAbbruch
    e.printStackTrace();
  }
  ```

- *JOptionPane*

  Eine sehr kurze Art Daten vom Benutzer einzulesen ist mittels Fenster:

  ```java
  String s1 = JOptionPane.showInputDialog("Bitte Zahl eingeben: ",45);
  ```

  Hier wird eine Fenster geöffnet zum Erfragen einer Zahl, als Default-Vorschlag erscheint schon 45.

  Notwendig hier: `javax.swing.JOptionPane`.

Für sämtliche Methoden gilt: es werden Zeichen (Text) von der Tastatur eingelesen. Sollen Zahlen eingelesen werden, dann müssen diese aus dem eingelesenen Text extrahiert werden, etwa mit:

```java
int num = Integer.parseInt(s1);
```

