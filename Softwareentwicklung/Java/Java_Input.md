# Eingabe

## Scanner

  Mit *next* wird die nächste Eingabe eingelesen:

  ```java
  Scanner sc = new Scanner(System.in);
  String eingabe = sc.next();
  sc.close();
  ```

## BufferedReader

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

## JOptionPane

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

