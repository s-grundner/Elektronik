# 8 Methoden / Funktionen
(Funktionen/Unterprogramme/Prozeduren). Methoden dienen zur Kapselung von Programmteilen. Dadurch wird die Software besser lesbar. Methoden können wiederholt ausgeführte Progammteile beinhalten und damit das Programm vereinfachen. Eine Methode führt Operationen aus und benötigt dazu (eventuell) Informationen. Diese Information muss der Methode beim Aufruf mitgegeben werden (Aufrufparameter). Manche Methoden haben auch ein Ergebnis. Dieses Ergebnis kann als Rückgabewert der aufrufenden Hierarchie zurückgegeben werden.

**<u>Beispiel:</u>** es soll innerhalb eines Programms eine Sinus-Funktion berechnet werden. Berechnet wird der Sinus z.B. mit einer Tabelle. Zwischen den angegebenen Punkten wird interpoliert. Wird diese Implementierung direkt ins Hauptprogramm eingebaut, wird das Programm sehr unübersichtlich für einen sehr einfachen Rechenschritt.
Daher wird eine Methode erstellt mit dem Namen **sin**. Damit ein sin-Wert berechnet werden kann muss ein Winkel als Aufrufparameter mitgegeben werden. Sinnvoll wird ein Fließkommawert sein, also **sin(doubleWert)**. Diese Methode liefert auch ein Ergebnis. Dieses Ergebnis (der Sinus-Wert) wird ebenfalls ein Fließkommawert sein: **doubleWert = sin( doubleWert )**.

**[Zugriffs-Modifikator] Rückgabetyp Methodenname([Aufrufparameter]) {**
​	*Methoden-Körper*
​	return *Rückgabewert*
**}**

Die erste Zeile ist der Kopf/die Deklaration der Methode.

- Zugriffs-Modifikator (kommt später noch genauer):
  - public static    Methode kann von überall aufgerufen werden (und benötigt kein Objekt) - ist dann eine Funktion.
- Rückgabetyp:
  Kann jeder Datentyp sein (int, String, double, Arrays ...). Wenn die Methode kein Ergebnis an den Aufrufer zurückgeben soll, so ist das mit dem Schlüsselwort **void** statt des Datentyps kennzuzeichnen. Dann entfällt die *return*-Anweisung.
- Methodenname:
  Eindeutige und aussagekräftige Bezeichnung der Methode. In Java beginnen Methodennamen mit einem Kleinbuchstaben.
- Aufrufparameter:
  Können beliebig viele Parameter mit jeweils beliebigen Datentypen sein.
- Methoden-Körper:
  Hier wird der Programmcode implementiert
- *return*-Anweisung:
  mit diesem Befehl wird der Wert an die aufrufende Instanz zurück übergeben. Der Wert der zurückgegeben wird muss genau den gleichen Typ haben wie im Kopf als Rückgabetyp deklariert wurde (ansonsten meldet der Compiler einen Fehler).


Die Implementierung einer Methode muss innerhalb einer Klasse erfolgen.

**<u>Beispiel 1:</u>**

```java
public static int addiere(int summand1, int summand2) {
  int summe = summand1 + summand2;
  return summe;
}
```

Die Methode summiert 2 Summanden. Um die Summe berechnen zu können, werden 2 Parameter benötigt - Summand1 und Summand2. Die Berechnung: *summe = summand1 + summand2*. Das Ergebnis *summe* wird an den Aufrufer zurückgegeben. *summe* ist vom Typ *int* und genauso wurde der Rückgabetyp im Kopf deklariert (*int* vor *addiere*).

Verwendet kann die Methode so werden:

```java
int s = addiere(1, 2);
```

Wenn die Programmausführung an diese Stelle kommt, wird zuerst der rechte Teil der Zuweisung ausgeführt, in diesem Fall wird hier in die Methode *addiere* gesprungen, dem Parameter *summand1* wird der 1er zugewiesen und dem Parameter *summand2* wird der 2er zugewiesen. Die Rechnung 1 + 2 erfolgt und das Ergebnis 3 wird aus der Methode zurückgegeben. Damit wird die rechte Seite der Zuweisung, der Term "addiere(1, 2)" durch 3 ersetzt. Somit wird s = 3.

**<u>Beispiel 2:</u>**

```java
public static double getPi() {
  return 3.14;
} 
```

Diese Methode gibt die Zahl *Pi* zurück. Es wird kein Aufrufparameter benötigt, daher ist die Klammer im Kopf leer. Der Rückgabewert ist eine Fließkommazahl, die Zahl *Pi*.

Verwendet wird die Methode wie folgt:

```java
double umfang = 2 * getPi() * r;
```

Wenn die Programmausführung diese Zeile verarbeitet, wird zuerst in die Methode **getPi()** verzweigt, und das Ergebnis an die Stelle von *getPi* gesetzt. Damit wird im nächsten Schritt der Umfang berechnet.

**<u>Beispiel 3:</u>**

```java
public static void gruesse(String name) {
  System.out.println("Hallo " + name + "!");
} 
```

Diese Methode soll in der Konsole einen Gruß ausgeben. Zurückgeben muss die Methode nichts, das wird mit dem Schlüsselwort **void** angezeigt. Wird in der Methode ein *return* verwendet, dann meldet der Compiler einen Fehler.

Verwendet wird die Methode wie folgt:

```java
gruesse("Siegfried");
```

Natürlich funktioniert auch:

```java
String typ = "Herbert"
gruesse(typ);
```

Wenn die Programmausführung diese Zeile verarbeitet, wird in die Methode **gruesse(...)** verzweigt, und darin der Gruß "Hallo Herbert!" in der Konsole ausgegeben. Anschliessend wird das Programm in der folgenden Zeile fortgeführt.

**<u>Beispiel 4:</u>**

Eine Methode ist schon bekannt:

```java
public static void main(String[] args) {
    ...
}
```

Die main-Methode. In JAVA (wie in vielen anderen Programmiersprachen auch) wird die main-Methode automatisch beim Start des Programms ausgeführt. Zurückgegeben wird von der Methode nichts (void). Mit den Aufrufparametern können dem Programm von ausserhalb Informationen mitgegeben werden. Jedem Programm wird eine andere Anzahl von Parametern mitgegeben, daher wird ein String-Feld als Aufrufparameter mitgegeben.

**<u>Beispiel 5:</u>**

Addition zweier komplexer Zahlen. Eine Zahl ist als Feld mit 2 Elementen definiert. Das erste Element ist der Realteil, das zweite Element ist der Imaginärteil. Die beiden Teile sind Fließkommazahlen:

```java
public static double[] addiere(double[] c1, double[] c2) {
  double[] csum = new double[2];
  csum[0] = c1[0] + c2[0];		// Addition der Realteile
  csum[1] = c1[1] + c2[1];		// Addition der Imaginärteile
  return csum;
}
```

Aufruf:

```java
double[] cplxSumme = addiere(cplx1, cplx2);
```

Komplexe Zahlen beinhalten immer 2 Zahlen. Mit einem primitiven Rückgabewert könnte man lediglich den Real- oder Imaginärteil zurückgeben. Wird eine komplexe Zahl in ein Feld gekapselt, dann kann die komplette Zahl zurückgegeben werden.

## Mehrere Return-Anweisungen

Wenn die Programmausführung in einer Methode eine **return**-Anweisung ausführt, wird der Wert zurückgegeben und die Ausführung in dieser Methode sofort beendet. Sollten nach dieser Anweisung noch weitere Anweisungen folgen werden diese nicht mehr ausgeführt. Es können auch mehr als nur eine *return*-Anweisung eingebaut werden. Jede dieser Anweisung muss den im Kopf angegebenen Return-Typ entsprechen.

**<u>Beispiel:</u>**

Berechnung des Maximums zweier Zahlen:

```java
public static double max(double z1, double z2) {
  if (z1 > z2) {
    return z1;
  }
  return z2;
}
```

Wenn die erste Zahl größer als die zweite Zahl ist, dann wird sie sofort zurückgegeben und die Methode beendet. Daher wird die zweite *return*-Anweisung auch nicht ausgeführt, wenn sie nicht in einem *else*-Zweig steht.

Der Compiler prüft ob in jedem Pfad eine *return*-Anweisung steht. Sollte das nicht der Fall sein wird das Programm nicht übersetzt.

## Variable Anzahl an Aufrufparametern

Soll eine variable Anzahl von Parametern gleichen Typs übergeben werden, dann gibt es eine Sonderform:

```java
public static int addiere(int summand1, int... summand2) {
  int summe = summand1;
  for (int i = 0; i < summand2.length; i++) {
    summe += summand2[i];
  }
  return summe;
}
```

Diese Methode kann mit 2 oder beliebig vielen weiteren int-Parametern aufgerufen werden, z.B.:

```java
addiere(1, 2);
addiere(1, 2, 3);
addiere(1, 2, 3, 4);
```

Diese Erweiterung funktioniert nur wenn der Parameter als Letzter in der Liste angeführt wird (ansonsten können die Parameter nicht eindeutig zugewiesen werden). Innerhalb des Methoden-Körpers kann auf die Parameter wie auf ein Feld zugegriffen werden.

## Überladen von Methoden

Um Methoden voneinander unterscheiden zu können, müssen sich die Namen von Methoden voneinander unterscheiden. Häufig kommt es vor das ein und die selbe Funktionalität auf völlig unterschiedliche Aufrufparameter angewendet wird. In diesen Fällen ist es sinnvoll den Methoden den gleichen Namen zu geben. Welche der Methoden beim Aufruf ausgeführt wird, entscheidet sich anhand der Aufrufparameter. Im folgenden Beispiel wird zweimal die Methode addiere implementiert, der Methodenname ist gleich, die Aufrufparameter unterscheiden sich:

```java
public static int addiere(int summand1, int summand2) {
  return summand1 + summand2;
}

public static double addiere(double summand1, double summand2) {
  return summand1 + summand2;
}
```

Der Compiler kann somit klar unterscheiden, welche der beiden Methoden auszuführen ist:

```java
addiere(1, 2);			// Aufruf der Methode mit den int-Parametern
addiere(1.0, 2.0);		// Aufruf der Methode mit den double-Parametern
```

Der Compiler prüft den Inhalt der Methode nicht. Daher ist es grundsätzlich auch möglich eine komplett andere Funktionalität in gleichbenannte Methoden zu packen. Allerdings ist das nicht empfehlenswert.

Es wurden schon Methoden verwendet:

- System.out.println(). Es handelt sich hierbei um eine mehrfach überladene Methode. Man kann die Methode mit Nummern aber genauso auch mit Zeichenketten aufrufen:

  ```java
  System.out.println("Hallo");
  System.out.println(1.2);
  ```

  Die Methode hat keinen Rückgabewert. Die Definition der Methode kann so aussehen:

  ```java
  public void println(String s1) { ... }
  public void println(double num1) { ... }
  ```

- Math.random(). Diese Methode hat keine Aufrufparameter, gibt aber eine Fließkomazahl zurück. Eine Definition kann so aussehen:

  ```java
  public double random() { ... }
  ```

- Achtung der Aufruf von **Math.PI** erfolgt ohne Klammer, es handelt sich nicht um eine Methode, sondern eine Variable (in diesem Fall eigentlich eine Konstante). Methodenaufrufe können immer an einer Klammer erkannt werden.

## Call-By-Value / Call-By-Reference

Die Werte der Aufrufparameter die an eine Methode übergeben werden, werden beim Aufruf kopiert. Innerhalb der Methode kann mit diesen Werten gearbeitet werden. Ein Verändern der Werte in der Methode verändert die Werte außerhalb der Methode nicht. Man nennt diese Art des Aufrufs **Call-By-Value**. Im Gegensatz zu vielen andern Programmiersprachen gibt es in Java ausschließlich diese Art des Aufrufs.

In manchen anderen Programmiersprachen gibt es zusätzlich die **Call-By-Reference** Variante. Dadurch ist es möglich die Aufrufparameter innerhalb einer Methode zu verändern. In Java funktioniert das nicht (nie!).

**<u>Beispiel 1:</u>**

```java
public static void main(String[] args) {
  int s1 = 3;
  int s2 = 4;
  int summe = summiere(s1, s2);
  System.out.println("Summe von " + s1 + " und " + s2 + " ergibt " + summe);
}

public static int summiere(int s1, int s2) {
  s1 += s2;		// s1 wird verändert
  return s1;
}
```

Obwohl die Variable s1 innerhalb der Methode **summiere** verändert wird, wird in der Konsole `Die Summe von 3 und 4 ergibt 7` ausgegeben. In diesem Beispiel lauten die Variablennamen s1 innerhalb und außerhalb der Methode sogar gleich, trotzdem wird der Wert von s1 außerhalb der Methode nicht durch die Methode verändert - für die Methode wird ja eine Kopie des Werts (also 3) angelegt.

**<u>Beispiel 2:</u>**

Probiert man folgendes Beispiel aus:

```javascript
public class Felder12_CallByValue {
  public static void main(String[] args) {
    int[] arr = {0, 1};
    System.out.println(Arrays.toString(arr));
    swap(arr);
    System.out.println(Arrays.toString(arr));
  }
	
  public static void swap(int[] numArr) {
    int temp = numArr[0];
    numArr[0] = numArr[numArr.length-1];
    numArr[numArr.length-1] = temp;
  }
}
```

so erhält man:

```java
[0, 1]
[1, 0]
```

Es wird also der Wert von *arr* innerhalb der Methode verändert. Obwohl es so scheint handelt es sich hier ebenfalls um einen *Call-By-Value* Wert. Eine Feldvariable ist allerdings ein Referenz-Typ, also eine Adresse auf die Feldelemente. Beim Aufruf der Methode *swap* wird hier ebenfalls der Wert der Variable kopiert, also die Adresse auf die Feldelemente. Da innerhalb der Methode die Elemente unter der Adresse verändert werden, werden gleichzeitig die Elemente des Felds der aufrufenden Instanz verändert.

Da Objekte in Java ebenfalls Referenz-Typen sind, verhalten sich Methodenaufrufe mit Objekten als Aufrufparameter gleich wie in diesem Feld-Beispiel.

## Wann Nun?

Für was / wann sollen Methoden nun verwendet werden?

- Methoden bieten die Möglichkeit Software übersichtlicher zu gestalten. Wird Software-Code über mehrere Bildschirmseiten hinaus, ist der Code sehr schnell nicht mehr in seiner gesamten Funktion überblickbar. Mit Methoden kann und soll der Code kompakt und übersichtlich gehalten werden. Die Lesbarkeit steigt natürlich nur, wenn die Benennung der Module entsprechend sinnvoll gestaltet wird. Im folgenden Beispiel kann sehr schnell erfasst werden was die Software macht. Und das auch wenn unbekannt ist, wie die einzelnen Teile implementiert sind:

  ```java
  dateiOeffnen("c:\\temp\\thisAndThat.txt");
  arr = dateiInFeldKopieren();
  arr = feldSortieren(arr);
  dateiSchreiben();
  dateiSchliessen();
  ```

- Das zweite wesentliche Argument für die Verwendung von Methoden ist die Möglichkeit Code wiederverwenden zu können. Dadurch wird der gleiche Code mehrmals verwendet. Eventuell implementierte Fehler werden so schneller gefunden (Grundsätzlich: Fehler gibt's in der Softwareentwicklung IMMER und bei JEDEM!). Außerdem greifen Verbesserungen in einer Methode sofort für sämtliche, die Methode verwendende Code-Teile (bessere Wartbarkeit). Wiederum kann obiges Beispiel herangezogen werden: soll der Sortieralgorithmus für das Feld optimiert werden, so ist klar, dass das in der Methode *feldSortieren* zu erfolgen hat.

- Moderne Entwicklungsumgebungen (*Eclipse* ...) bieten zusätzlich sehr komfortable Hilfen an: die Methoden werden im Projektbaum (Paket-Explorer) dargestellt, bei jedem Aufruf einer Methode wird eine Hilfe zur Methode mit angezeigt.

Regel: so oft Methoden wie möglich.

> Methoden müssen immer innerhalb einer Klasse implementiert werden.
>
> Es können beliebige und beliebig viele Aufrufparameter in einer Methode definiert werden.
>
> Für den letzten Aufrufparameter kann eine variable Anzahl mit dem Zusatz "..." nach dem Datentyp angegeben werden.
>
> Es kann entweder keinen oder nur einen einzigen Rückgabewert geben. Der Rückgabewert kann allerdings auch ein Feld sein in dem mehrere Werte abgelegt werden können. Die Ausführung einer Methode wird sofort mit einer return-Anweisung beendet.
>
> Werden Methoden mit <u>gleicher</u> Funktion, gleichem Namen und unterschiedlichen Parametern implementiert, spricht man von **über<u>ladenen</u>** Methoden. Werden Methoden mit <u>unterschiedlicher</u> Funktion, gleichem Namen und unterschiedlichen Parametern implementiert, spricht man von **über<u>schriebenen</u>** Methoden. Grundsätzlich sollten Methoden nicht überschrieben werden.
>
> Methoden in JAVA sind immer Call-By-Value Aufrufe. Die Werte der Aufrufparameter werden beim Aufruf kopiert und eine Veränderung der Werte, hat keine Auswirkung auf die Werte der Parameter außerhalb der Methode.

## Kommandozeilenparameter

Soll einem Programm beim Start Informationen mitgegeben werden können, müssen Kommandozeilenparameter behandelt werden. Beispiele:

```
>xcopy source.txt dest.txt
```

Mit diesem Befehl in der DOS-Kommandozeile wird das Programm xcopy.exe gestartet. Als Parameter werden dem Programm zwei Strings mitgegeben. Den Namen der Quelldatei und den Namen der Zieldatei für den Kopiervorgang.

Ebenso funktioniert das bei Programmen wie Word.exe:

```
winword.exe mydoc.docx
```

Damit wird das Programm Word gestartet und aufgrund des mitgegebenen Parameters die Datei mydoc.docx gestartet. Wird ein Dokument direkt auf der Oberfläche mit einem Doppelklick geöffnet passiert genau das Gleiche: Windows hat für docx-Dateitypen die Anwendung winword.exe registriert, startet diese Anwendung und gibt ihr als Parameter den Pfad und Namen des angeklickten Dokuments mit.

### In Java

Der Einstiegspunkt eines Programms in Java ist die *main*-Methode. Werden dem Programm beim Start Information mitgegeben, sind diese als Parameter der Methode *main* verfügbar:

```java
public static void main(String[] args) {		// die Methode Main hat den Aufrufparameter args
}
```

*args* sind die Argumente der Funktion. Da  das Programm selbst keinen Einfluss auf die Anzahl der Argumente hat, ist der Typ ein Feld von Strings. Eventuelle Parameter werden vom 1ten Feldelement beginnend in das Feld gefüllt. Die Parameter werden beim Aufruf durch *Whitespaces* (Leerzeichen, Tabulatoren ...) getrennt.

Ein Beispiel:

```java
public static void main(String[] args) {		// die Methode Main hat den Aufrufparameter args
  System.out.println("1ter Parameter: " + args[0]);
  System.out.println("2ter Parameter: " + args[1]);
  System.out.println("3ter Parameter: " + args[2]);
}
```

Werden diesem Programm weniger als 3 Parameter mitgegeben, dann ist das Feld *args[]* entsprechend kleiner, wodurch eine *ArrayIndexOutOfBoundsException* ausgelöst wird. Daher ist an dieser Stelle immer eine Fehlerbehandlung angebracht:

```java
public static void main(String[] args) {		// die Methode Main hat den Aufrufparameter args
  if (args.length < 3) System.out.println("Fehler: Geben Sie 3 Parameter mit!");
  System.out.println("1ter Parameter: " + args[0]);
  System.out.println("2ter Parameter: " + args[1]);
  System.out.println("3ter Parameter: " + args[2]);
}
```

### Der Aufruf

In der Kommandozeile kann das Programm so aufgerufen werden:

```
>javac myprog.java

>java myprog Hallo wie geht's?
Hallo
wie
geht's?
```

In *Eclipse* können die Aufrufparameter zu Testzwecken ebenfalls eingestellt werden: Menüleiste->Ausführen->Ausführungskonfiguration->Argumente->Programmargumente.

In *Intellij IDEA* wird die Run/Debug-Konfiguration geöffnet und darin die *Program Arguments* gesetzt.