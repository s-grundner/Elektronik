# 6 Zeichenketten / Strings / Stringbuffer

Strings sind Zeichenketten (Aneinanderreihung von Zeichen). Definieren von Stringvariablen:

```java
import java.lang.String;

String s;
s = "Hallo";

System.out.print(s);			// Ausgabe ohne folgenden Zeilenumbruch
System.out.println(", Welt!");	// Ausgabe mit folgenden Zeilenumbruch

s += ", Welt!";					// Strings verketten (zusammenhängen) mit "+"
System.out.print(s);			// Ausgabe "Hallo, Welt!"
```

>  Strings können zur Laufzeit nicht mehr verändert werden.

(bei den dargestellten Änderungen wird jeweils ein neues String-Objekt angelegt) 

## Konvertierung

Oft müssen Zahlen in String und umgekehrt umgewandelt werden:

```java
static String valueOf(boolean b)
static String valueOf(char c)
static String valueOf(char[] c)
static String valueOf(double d)
static String valueOf(float f)
static String valueOf(int i)
static String valueOf(long l)
static String valueOf(Object obj)
```

Beispiel:

```java
int x = 17;
double pi = 3.14;
String ziffern = "4711";
int iZahl;
String dblString = "5.67"
double dblZahl;
String s1, s2;

s1 = String.valueOf(pi);
s2 = String.valueOf(x);

iZahl = Integer.parseInt(ziffern);
dblZahl = Double.parseDouble(dblString);
```

## Häufig verwendete Methoden

```java
String a = "abc" + "def";		// Verkettung (aneinanderhängen) von zwei Strings mit +

len = s.length();				// Anzahl der Zeichen im String s

// Teilstrings:
char z = s.charAt(7);			// 8tes Zeichen des Strings s (erste Stelle: 0)
String sub = s.substring(3,7);	// Teilzeichenkette vom 4ten bis zum 8ten Zeichen (exklusive)
String[] strArr = s.split(":");	// String s wird aufgeteilt an allen Stellen an denen ":" vorkommt


// Vergleiche:
boolean b = s.equals("Hallo");	// gibt true zurück, wenn der String s == "Hallo". Vergleich mittels == ist nicht möglich!
boolean b2 = s.equalsIgnoreCase("Hallo");	// gibt auch true zurück wenn s == "HaLLO"
boolean b3 = s.startsWith("Hey");	// Wenn s mit "Hey" beginnt, dann wird true zurückgegeben
boolean b4 = s.endsWith("You");		// Wenn s mit "You" endet, dann wird true zurückgegeben
int i1 = s.compareTo("Hallo");		// i1 = 0, wenn s == "Hallo"; i1 < 0, wenn s alphabet. vor "Hallo"; i1 > 0 sonst

// Suchen:
int j1 = s.indexOf("boa");			// gibt die Position von "boa" innerhalb von s zurück, wenn vorhanden; -1 sonst
int j1 = s.indexOf("boa",3);		// gibt die Position von "boa" innerhalb von s zurück, wenn vorhanden; -1 sonst. Suchbeginn beim 3ten Zeichen
int j1 = s.lastIndexOf("boa");		// gibt die Position von "boa" innerhalb von s zurück, Suche wird von hinten begonnen

// Ersetzen:
String s2 = s.toLowerCase();		// Großbuchstaben -> Kleinbuchstaben
String s3 = s.toUpperCase();		// Kleinbuchstaben -> Großbuchstaben
String s4 = s.replace('a', 'b');	// es werden alle 'a' in s durch 'b' ersetzt
```

## StringBuffer

Strings können zur Laufzeit nicht verändert werden. Sollte das erwünscht sein, dann kann statt eines Strings ein *StringBuffer* (*java.lang.StringBuffer*) verwendet werden:

```java
String s= "Dies ist eine Text";

StringBuffer sb = new StringBuffer(s);	// sb ist nun ein StringBuffer mit dem Text: Dies ist ....

StringBuffer str = new StringBuffer();	// ist auch möglich. str ist ein leerer StringBuffer
```

Methoden:

```java
StringBuffer sb= new StringBuffer("Hallo, ");

int len = sb.length(); 				// Liefert die Anzahl der Zeichen von sb

// Anhängen, Einfügen, Löschen:
sb = sb.append("Welt!");			// veraend. Buffer: "Hallo, Welt!"
sb = sb.append(4711);				// veraend. Buffer: "Hallo, Welt!4711"
sb = sb.insert(1, "i");				// veraend. Buffer: "Hiallo, Welt!4711"
sb = sb.deleteCharAt(2);			// veraend. Buffer: "Hillo, Welt!4711"
sb = sb.deleteCharAt(2, 7);			// Entfernt Zeichen 2 - 7

// Verändern:
sb.setCharAt(3, 'a');				// Ersetzt das Zeichen an der 4ten Stelle durch ein 'a'
sb = sb.replace(1, 3, "Hallo");		// Ersetzt die Zeichen 2-4 durch das Wort "Hallo"

// Konvertierung:
string myString = sb.toString();	// Wandelt den Buffer in ein String um

```

## Formatieren in Strings

Grundsätzlich:

```java
String str = String.format("%f", 3.3);		// fuer DE-Einstellung: 3,3
str = String.format("xxx%7.3xxx",2.34567);		// xxx  2,346xxx
str = String.format("xxx%7.3xxx",2.3);			// xxx  2,300xxx
```

Als Komma wird verwendet, was im Betriebssystem in Regionseinstellungen festgelegt wurde.

Erweitert:

```java
(new DecimalFormat("0.0####")).format(3)		// 3,0
(new DecimalFormat("0.0####")).format(3.43)		// 3,43
(new DecimalFormat("0.0####")).format(123.43)	// 123,43
(new DecimalFormat("0.0####")).format(0.43)		// 0,43
(new DecimalFormat(".0####")).format(0.345)		// ,345

```

## Referenzen

- Insel (deutsch):

  http://openbook.rheinwerk-verlag.de/javainsel9/javainsel_04_001.htm

- https://www.tutorialspoint.com/java/java_strings.htm

  

