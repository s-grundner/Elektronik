# 8 Methoden - Übungen

1. Erstelle je eine Methode zur Berechnung des Umfangs eines Kreises.

   ​

2. Erstelle eine Methode zur Berechnung des Umfangs und der Fläche eines Dreiecks (beides in einer Methode!). Überlade die Methode für gleichschenklige und für gleichseitige Dreiecke.

   ​

3. Erstelle eine Methode zur Berechnung des Umfangs und der Fläche eines Dreiecks (beides in einer Methode!). Schreibe die Methode so, dass für die Engabe von nur 2 Werten das Dreieck als gleichschenkliges interpretriert wird und für einen eingegebenen Wert als gleichseitiges Dreiecke interpretiert wird.

   ​

4. Erstelle eine Methode zur Berechnung des Umfangs eines Polygons (beliebig viele Seiten).

   ​

5. Erstelle Methoden zur Berechnung des Sinus eines Winkels. Ganzzahlige Winkeleingaben sollen als Grad-Winkel und andere als Radianten-Winkel interpretiert werden.

   ​

6. Erstelle eine Methode zur Berechnung der Lösung einer quadratischen Gleichung. Die Methode darf nicht reelle Lösungen vernachlässigen.

   ​

7. Erstelle eine Methode zum Finden eines Worts in einer Zeichenkette. Durch einen boolschen Parameter soll angegebene werden können ob die Groß-/Klein-Schreibung eine Rolle spielen soll oder nicht.

   ​

8. Erstelle die Methoden für die Addition / Subtraktion / Multiplikation / Division von komplexen Zahlen. Eine Komplexe Zahl ist ein Zahlenbündel (Real-/Imag.-Teil) und läßt sich gut in einem Feld mit zwei Elementen ablegen. Teste die Methoden für die komplexen Zahlen *z1 = (1 + j)* , *z2 = (1 + j)* und der Rechnung: *z1 - z2 * (z1 + z1/z2)*.

   ​

9. Erweitere das letzte Beispiel mit den Methoden getReal() und getImg() zur Ermittlung des Real-/Imaginärteils einer Komplexen Zahl.

   ​

10. Überlade die add-Methode um auch 3 komplexe Zahlen miteinander addieren zu können.

 ​

11. Überlade die add-Methode um beliebig viele komplexe Zahlen miteinander addieren zu können.

    ​

12. Eingabe von Zahlen unterschiedlicher Zahlensysteme. Estelle Methoden zum Einlesen von Zahlen unterschiedlicher Zahlensysteme: readBinNum(), readDecNum(), readHexNum(). Die Methoden sollen eine Eingabe solange wiederholen, bis gültige Werte eingegeben wurden.

   ​

13. Umrechnung von Zahlen unterschiedlicher Zahlensysteme. Erstelle die Methoden convBin2Dec(), convBin2Hex(), convDec2Bin(), convDec2Hex(), convHex2Bin(), convHex2Dec().

    ​

14. Ausgabe von Zahlen unterschiedlicher Zahlensysteme. Erstelle die Methode print() um binäre, dezimale und hexadezimale Zahlen auszugeben.

    ​

15. Definieren Sie für folgende Aufgaben die Methoden:

    Berechnung Notendurchschnitt von 3 Noten

    Berechnung Notendurchschnitt von beliebig vielenNoten

    Sortieren von 10 Zahlen der Größe nach

    Berechnung der 10 kleinsten Primzahlen

    Allgemein: Berechnung einer ganzzahligenZufallszahl, Vorgabe des Wertebereichs Min/Max

    Berechnung Parallelwiderstand, 2Widerstände parallel (Gleichspannungskreis)

    Berechnung Parallelwiderstand, 2 Widerständeparallel (Wechselspannungskreis)

    Berechnung der Lösungeneinerquadratischen Gleichung(für alle möglichen Fälle)

    Berechnung des BodyMassIndex

    Berechnung von Lottozahlen (6 aus 45)
    ​

16. 6 aus 45. Lese einen Tipp ein (readTipp() ). Berechne 6 Zufallslottozahlen (getRandNumArr() ). Sortiere das Tipp-Feld und das Feld mit den Zufallszahlen (sortArr() ). Vergleiche die beiden Felder und ermittle wieviele Werte im Tipp-Feld und im Zufallszahlen-Feld gleich sind (compArr() ). Erweiterung: wiederhole die Ziehungen bis ein Lotto-Sechser getippt wird. Berechne wie lang man Lotto spielen muss damit das passiert (2 Ziehungen pro Woche).

    ​

17. Umrechnung römische Zahlen in dezimale Zahlen in klassischer Variante und Rückumrechnung.
   1   = I
    5   = V
    10  = X
    50  = L
    100 = C
    500 = D
    1000 = M
    in der klassischen Variante bedeutet 4 -> IIII. Kleinere Ziffern dürfen nie links von größeren Ziffern stehen. Die Vielfachen von 5 können maximal einmal vorkommen.
    ​

18. Umrechnung römische Zahlen in dezimale Zahlen in moderner Variante und Rückumrechnung.
    1   = I
    5   = V
    10  = X
    50  = L
    100 = C
    500 = D
    1000 = M
    In der modernen Variante gilt: wenn eine kleinere Zahl links von einer größeren steht, dann ist sie abzuziehen: 4 -> IV. Erlaubt ist das nur für eine einzelne. Beispiele:

    **klassisch       modern     arabisch**
    IIII                     IV                 (4)
    XXXX                 XL                (40)
    LXXXX               XC                (90)
    LXXXXVIIII        XCIX             (99)

### Beispiele

1. Erstelle je eine Methode zur Berechnung des Umfangs eines Kreises.

   L:

   ```java
   public static double kreisUmfang(double radius) {
     return (2 * radius * Math.PI);
   }
   ```

   Aufruf:

   ```java
   double r = 10;
   double u = kreisUmfang(10);
   ```

2. Erstelle eine Methode zur Berechnung des Umfangs und der Fläche eines Dreiecks (beides in einer Methode!). Überlade die Methode für gleichschenklige und für gleichseitige Dreiecke.

   L:

   ```java
   public static double[] dreieckBerechnung(double a, double b, double c) {
     double u = a + b + c;
     double fl = Math.sqrt(u/2 * (u/2 - a) * (u/2 - b) * (u/2 - c)); // Satz von Heron
     return new double[] {u, fl};
   }

   public static double[] dreieckBerechnung(double a, double b) {     // Dreieck a,a,b
     return dreieckBerechnung(a, a, b);
   }

   public static double[] dreieckBerechnung(double a) {			// Dreieck a,a,a
     return dreieckBerechnung(a, a, a);
   }
   ```

   Aufruf:

   ```java
   double fl_1 = dreieckBerechnung(10.0, 9.0)[1];

   double u_2 = dreieckBerechnung(5.4)[0]; 
   ```

3. Erstelle eine Methode zur Berechnung des Umfangs und der Fläche eines Dreiecks (beides in einer Methode!). Schreibe die Methode so, dass für die Engabe von nur 2 Werten das Dreieck als gleichschenkliges interpretriert wird und für einen eingegebenen Wert als gleichseitiges Dreiecke interpretiert wird.

   L:

   ```java
   public static double[] dreieckBerechnung(double... a) {
     if (a.length == 1)
       return dreieckBerechnung(a[0], a[0], a[0]);
     if (a.length == 2)
       return dreieckBerechnung(a[0], a[0], a[1]);
     if (a.length == 3) {
       double u = a[0] + a[1] + a[2];
       double fl = Math.sqrt(u / 2 * (u / 2 - a[0]) * (u / 2 - a[1]) * (u / 2 - a[2])); // Satz von Heron
       return new double[] { u, fl };
     }
     System.out.println("PENG");
     return null;
   }
   ```

   Aufruf:

   ```java
   double fl_1 = dreieckBerechnung(10.0, 9.0)[1];

   double u_2 = dreieckBerechnung(5.4)[0]; 
   ```

4. Erstelle eine Methode zur Berechnung des Umfangs eines Polygons (beliebig viele Seiten).

   L:

   ```java
   public static double umfangPolygon(double... s) {
     double sum = 0;
     for (int i = 0; i < s.length; i++) {
       sum += s[i];
     }
     return sum;
   }
   ```

5. Erstelle Methoden zur Berechnung des Sinus eines Winkels. Ganzzahlige Winkeleingaben sollen als Grad-Winkel und andere als Radianten-Winkel interpretiert werden.

   L:

   ```java
   public static double sinus(int gradAngle) {
     return Math.sin(gradAngle / 180.0 * Math.PI);
   }
   public static double sinus(double radAngle) {
     return Math.sin(radAngle);
   }
   ```

   Aufruf:

   ```java
   double verh = sinus(90); 		// ergibt 1
   double verh = sinus(Math.PI/6);	// ergibt 0.5
   ```

6. Erstelle eine Methode zur Berechnung der Lösung einer quadratischen Gleichung. Die Methode darf nicht reelle Lösungen vernachlässigen.

   L:

   ```java
   public static double[] quagl(double a, double b, double c) {
     double x = b * b - 4 * a * c;
     if (x > 0) {
       double x1 = (-b + Math.sqrt(x)) / 2 / a;
       double x2 = (-b - Math.sqrt(x)) / 2 / a;
       return new double[] {x1, x2};
     }
     System.out.println("PENG");
     return null;
   }
   ```

7. Erstelle eine Methode zum Finden eines Worts in einer Zeichenkette. Durch einen boolschen Parameter soll angegebene werden können ob die Groß-/Klein-Schreibung eine Rolle spielt oder nicht.

   L:

   ```java
   public static boolean findeWort(String str, String wort) {
   	return str.toUpperCase().contains(wort.toUpperCase());
   }
   ```

   Aufruf:

   ```java
   System.out.println(findeWort("jodiwodi", "Di"));		// True
   ```

8. Erstelle die Methoden für die Addition / Subtraktion / Multiplikation / Division von komplexen Zahlen. Eine Komplexe Zahl ist ein Zahlenbündel (Real-/Imag.-Teil) und läßt sich gut in einem Feld mit zwei Elementen ablegen. Teste die Methoden für die komplexen Zahlen *z1 = (1 + j)* , *z2 = (1 + j)* und der Rechnung: *z1 - z2 * (z1 + z1/z2)*.
   L:

   ```java
   ...
   static double[] add(double[] zahl1, double[] zahl2)
   ...
   static double[] sub(double[] zahl1, double[] zahl2)
   ...
   static double[] mul(double[] zahl1, double[] zahl2)
   ...
   static double[] div(double[] zahl1, double[] zahl2)
   ...  
   ```

9. Erweitere das letzte Beispiel mit den Methoden getReal() und getImg() zur Ermittlung des Real-/Imaginärteils einer Komplexen Zahl.
   L:

   ```java
   ...
   static double getReal(double[] zahl1)
   ...
   static double getImag(double[] zahl1)
   ...
   ```

10. Überlade die add-Methode um auch 3 komplexe Zahlen miteinander addieren zu können.

 L:

 ```java
 ...
 static double[] add(double[] zahl1, double[] zahl2, double[] zahl3)
 ...
 ```

11. Überlade die add-Methode um beliebig viele komplexe Zahlen miteinander addieren zu können.
    L:

    ```java
    static double[] add(double[] zahl1, double[]... zahl2)
    {
      double[] res = new double[] {zahl1[0], zahl1[1]};
      for (int i = 0; i < zahl2.length; i++) {
        res = add(res, zahl2[i]);
      }
      return res;
    }
    ```

    In diesem Beispiel wird zahl2 zu einem 2-dimensionalen Feld. Die 1te Dimension repräsentiert die Nummer der komplexen Zahl. Die 2te Dimension gibt den Real-/Imaginärteil an.
    ​

12. Eingabe von Zahlen unterschiedlicher Zahlensysteme. Erstelle Methoden zum Einlesen von Zahlen unterschiedlicher Zahlensysteme: readBinNum(), readDecNum(), readHexNum(). Die Methoden sollen eine Eingabe solange wiederholen, bis gültige Werte eingegeben wurden.
    ​

13. Umrechnung von Zahlen unterschiedlicher Zahlensysteme. Erstelle die Methoden convBin2Dec(), convBin2Hex(), convDec2Bin(), convDec2Hex(), convHex2Bin(), convHex2Dec().
    ​

14. Ausgabe von Zahlen unterschiedlicher Zahlensysteme. Erstelle die Methode print() um binäre, dezimale und hexadezimale Zahlen auszugeben.
    ​

15. Definieren Sie für folgende Aufgaben die Methoden:

    Berechnung Notendurchschnitt von 3 Noten

    Berechnung Notendurchschnitt von beliebig vielenNoten

    Sortieren von 10 Zahlen der Größe nach

    Berechnung der 10 kleinsten Primzahlen

    Allgemein: Berechnung einer ganzzahligenZufallszahl, Vorgabe des Wertebereichs Min/Max

    Berechnung Parallelwiderstand, 2Widerstände parallel (Gleichspannungskreis)

    Berechnung Parallelwiderstand, 2 Widerständeparallel (Wechselspannungskreis)

    Berechnung der Lösungeneinerquadratischen Gleichung(für alle möglichen Fälle)

    Berechnung des BodyMassIndex

    Berechnung von Lottozahlen (6 aus 45)
    ​

16. 6 aus 45. Lese einen Tipp ein (readTipp() ). Berechne 6 Zufallslottozahlen (getRandNumArr() ). Sortiere das Tipp-Feld und das Feld mit den Zufallszahlen (sortArr() ). Vergleiche die beiden Felder und ermittle wieviele Werte im Tipp-Feld und im Zufallszahlen-Feld gleich sind (compArr() ). Erweiterung: wiederhole die Ziehungen bis ein Lotto-Sechser getippt wird. Berechne wie lang man Lotto spielen muss damit das passiert (2 Ziehungen pro Woche).

    ​

17. Umrechnung römische Zahlen in dezimale Zahlen in klassischer Variante und Rückumrechnung.
    1   = I
     5   = V
     10  = X
     50  = L
     100 = C
     500 = D
     1000 = M
     in der klassischen Variante bedeutet 4 -> IIII. Kleinere Ziffern dürfen nie links von größeren Ziffern stehen. Die Vielfachen von 5 können maximal einmal vorkommen.
     ​

18. Umrechnung römische Zahlen in dezimale Zahlen in moderner Variante und Rückumrechnung.
    1   = I
    5   = V
    10  = X
    50  = L
    100 = C
    500 = D
    1000 = M
    In der modernen Variante gilt: wenn eine kleinere Zahl links von einer größeren steht, dann ist sie abzuziehen: 4 -> IV. Erlaubt ist das nur für eine einzelne. Beispiele:

    **klassisch       modern     arabisch**
    IIII                     IV                 (4)
    XXXX                 XL                (40)
    LXXXX               XC                (90)
    LXXXXVIIII        XCIX             (99)