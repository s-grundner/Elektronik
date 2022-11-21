# 11.4 OOP - Weiteres - Übungen

## Ue_Komplex

Erstellen Sie die Klasse Komplex, sodass folgendes Programm funktioniert:

```java
Komplex a = new Komplex(3.0, 2.0);
Komplex b = new Komplex(a);
Komplex c;

c= a.add(b);	
System.out.println ("c= " + c.toString());
```

Die Ausgabe muss dann wie folgt aussehen:
```java
c= [6.0 + 4.0 j]
```
## Ue_Komplex_2

Benötigt wird ein Datentyp zum Speichern einer Komplexen Zahl.

L: eine komplexe Zahl besteht aus zwei Fließkommazahlen, daher benötigen wir eine Klasse mit zwei Fließkommazahlen:

```java
class Komplexe {
  public double realTeil;
  public double imagTeil;
}
```

In einem Programm kann dieser KomplexeZahl-Datentyp so verwendet werden:

```java
Komplex c1;
c1.realTeil = 1;
c1.imagTeil = 2;
```

## Ue_Komplex_3

1. Erstellen Sie einen Datentyp komplexe Zahl. Bei der Erstellung soll direkt ein Wert zugewiesen werden können. 

   L: ein Konstruktor wird während der Objekterstellung automatisch aufgerufen:

```java
class Komplex {
  public double realTeil;
  public double imagTeil;

  public Komplex(double re, double im) {
    realTeil = re;
    imagTeil = im;
  }
}
```

   Aufruf:

```java
Komplex c1;
c1 = new Komplex(1,3);     // durch new wird Objekt erstellt und Konstruktor aufgerufen
```
   oder abgekürzt:
```java
Komplex c1 = new Komplex(1,3);
```

2. auf die Member-Variablen soll nicht direkt zugegriffen werden können, ein Verändern soll durch eine Set-Methode gelöst werden. Dadurch kann die Member-Variable auf **private** gesetzt werden.

   L:
```java
class Komplex {
  private double realTeil;
  private double imagTeil;

  public Komplex(double re, double im) {
    realTeil = re;
    imagTeil = im;
  }
     
  public void Set(Komplex c) {
    realTeil = c.realTeil;
    imagTeil = c.imagTeil;
  }
}
```
Aufruf:
```java
Komplex c1 = new Komplex(1,3);
Komplex c2 = new Komplex(1,3);
c1.set(c2);                     // c1 wird auf gleichen Wert wie c2 gesetzt
c2.set(new Komplex(2,2));     // der Wert von c2 wird auf 2,2 gesetzt
```

## Ue_Komplex_4

Erstellen Sie eine Methode zum Quadrieren einer Komplexen Zahl.

## Ue_Show

1. Öffne die Datei **show.txt**
2. Gib alle Zeilen auf die Konsole aus, die mit dem Text <SHOW> beginnen.

Hier die Datei show.txt
```
<SHOW>Java Buch: www.javabuch.de
Echt super
<SHOW>C Buch: www.pronix.de
Aber das ist eine Pflicht-Site
<SHOW>Java Source: http://java-source.net/
Ein abolutes MUSS
```
Ausgabe:
```
Java Buch: www.javabuch.de
C Buch: www.pronix.de
Java Source: http://java-source.net/
```
## Ue_Roomtemp

Gegeben ist die Datei: **room-temp.txt**:
```
3
Schlafzimmer:20
Kueche:25
Keller:15
```
1. Lies die Daten in den Hauptspeicher ein 
2. Für alle Zimmer mit einer Temperatur über 19 Grad soll 
   der Text "Fenster öffnen" und der Raumname und die 
   aktuelle Raumtemperatur auf die Konsole ausgegeben werden.
3. Schreib die Funktion printDurchschnitt(), die von allen 
   Räumen die Durchschnittstemperatur berechnet und diese auf 
   die Konsole ausgibt.

Beispiel für die Ausgabe zur obigen room-temp.txt:
```
Fester öffnen:Schlafzimmer:20
Fester öffnen:Kueche:25
Durschnittstemperatur: 20
```

## Ue_Traffic
Gegeben ist die Datei **input.txt**:
```
Maserati,1000 kg,2 Persons
VM,800 kg,4 Persons
Bus,2500 kg,8 Persons
```
Die Ausgabe auf der Konsole soll folgendermaßen aussehen:
```
With 3 vehicles we transport 14 persons using 4300 kg.
So for 1 person we have to move about 307,14 kg 'vehicle weight'.
```

## Ue_Bruch

Erstellen Sie eine Klasse Bruch, sodass folgendes Programm funktioniert:

```java
Bruch a = new Bruch(3.0, 2.0);
Bruch b = new Bruch(a);
Bruch c;

c = a.mul(b);
System.out.println("c= " + c.toString());
```

Die Ausgabe muss dann wie folgt aussehen:

```java
c = [9.0 / 4.0]
```

## Ue_Rechteck

Erstellen Sie eine Klasse Rechteck, sodass folgendes Programm funktioniert:

```java
Rechteck a = new Rechteck(3.0, 2.0);						  // Länge = 3 mm, Breite = 2 mm
Rechteck b = new Rechteck(2.0);								 // Länge = 2 mm, Breite = 2 mm
Rechteck e = new Rechteck(b);								 // copy Konstruktor

double laenge = a.getLaenge();								// getter-Methode	--> 3
double breite = a.getBreite();								// getter-Methode   --> 2

double A = a.flaeche();

System.out.println(a.toString());
```

Die Ausgabe soll folgendermaßen aussehen:

```java
l = 3.0, b = 2.0, A = 6.0
```

## Ue_Rechteck_2

Erstellen Sie eine Klasse Rechteck, sodass folgendes Programm funktioniert:

```java
Rechteck a = new Rechteck(3.0, 2.0);						  // Länge = 3 mm, Breite = 2 mm
Rechteck b = new Rechteck(2.0);								 // Länge = 2 mm, Breite = 2 mm
Rechteck c = new Rechteck("Länge = 100 cm, Breite = 77.3 dm"); // Länge = 1000 mm, Breite = 7730 mm
                                                               // (soll für mm, cm, dm, m funktionieren)
Rechteck d = new Rechteck("Breite = 10 cm, Länge = 20 dm");	   // Länge = 2000 mm, Breite = 100 mm

double A = a.flaeche("mm²");

System.out.println(c.toString("dm"));
```

Die Ausgabe soll folgendermaßen aussehen:

```java
l = 10.0 dm, b = 77.3 dm, A = 773.0 dm²
```

## Ue_Taschenrechner

Erstellen Sie eine Klasse Taschenrechner mit den notwendigen Methoden und Attributen. Der Taschenrechner hat 2 Speicherplätze (A und B):

```java
Taschenrechner casio = new Taschenrechner();
casio.speichern('A',10);					// 10 auf Speicherplatz A speichern
double b = casio.add('A',3);				// b = 13

Taschenrechner ti = new Taschenrechner(casio);	// neuer Taschenrechner, Speicher kopieren
double b = casio.add(ti.getA(),3);				// b = 13

b = Taschenrechner.PI;							// b = 3.14159265...
```

## Ue_Messreihe

Erstellen Sie eine Klasse **Messreihe** mit den notwendigen Methoden und Attributen:

```java
Messreihe tempMessung = new Messreihe("Temperatur", 16.0, 37.8, 16.0, 28.0, 100.0);     // Methode kann beliebig viele 															                                        // double-Temperatur-Werte haben
double max = tempMessung.maxValue;
double mittelWert = tempMessung.mittelWert();
System.out.println(tempMessung.toString());
System.out.println(tempMessung.toString("K"));
System.out.println(tempMessung.toString("°F"));

Datei file = new Datei("c:/temp/tempreihe.csv");
file.save(tempMessung);
file.close();
```

Umrechnung in K und °F

die Ausgabe soll so aussehen:

```java
Temperatur = [16,0 °C; 37,8 °C; 16,0 °C; 28,0 °C; 100,0 °C]; Mittelwert = 39,6 °C; Maximalwert = 100,0 °C
Temperatur = [289,2 K; 311,0 K; 289,2 K; 301,2 K; 373,2 K]; Mittelwert = 312,7 K; Maximalwert = 373,2 K
Temperatur = [60,8 °F; 100,0 °F; 60,8 °F; 82,4 °F; 212,0 °F]; Mittelwert = 71,6 °F; Maximalwert = 132,0 °F
```

Die Daten der Messreihe sollen in eine csv-Datei geschrieben werden und dann mit Excel gelesen werden. Aufbau der Datei:

![Alt-Text](Messreihe.png)

## Ue_Datum

Erstellen Sie eine Klasse **Datum**, sodass folgendes Programm funktioniert:

```java
Datum d1 = new Datum("25.1.2016");	 // Tag/Monat ein oder zweistellig und mit führendem Jahr: "2016.MM.TT"
d1.incT();						   // 26.1.2016
d1.incW();						   // 2.2.2016
d1.incM();						   // 2.3.2016
d1.incJ();						   // 2.3.2017
System.out.println(d1.toString("TTMMJJJJ"));	// TT, MM und JJJJ können beliebig vertauscht und weggelassen werden
System.out.println(d1.toString("TMJJ"));	    // TT, MM und JJJJ können beliebig vertauscht und weggelassen werden
```

Die Ausgabe soll folgendermaßen aussehen:

```java
02.03.2017
2.3.17
```

## Ue_Morse

Erstellen Sie eine Klasse Morse, sodass folgendes Programm funktioniert:

```java
Morse a = new Morse("SOS");
System.out.println(a.toString());
```

Die Ausgabe soll folgendermaßen aussehen:

```java
...---...
```

## Ue_Figuren

Erstelle die Klassen Rechteck, Figur, Dreieck, Kreis, Quadrat, DreieckGleichseitig, als sinnvolle Super- und Subklassen:

```java
ArrayList<Figur> lst = new ArrayList<Figur>();
		
lst.add(new Rechteck(10.0, 20.0));
lst.add(new Quadrat(15.5));
lst.add(new GleichseitDreieck(13.3));

for (Figur figur : lst) {
	System.out.println(figur.toString());
}
```

Soll folgendes bewirken:

```java
"class Abstract_Figure.Rechteck" Umfang = 60.0; Fläche = 200.0.
"class Abstract_Figure.Quadrat" Umfang = 62.0; Fläche = 240.25.
"class Abstract_Figure.GleichseitDreieck" Umfang = 39.900000000000006; Fläche = 76.59561683771473.
```

Wobei `getClass()` den Klassennamen zurückgibt.

Wichtig:

- Methoden müssen soweit möglich wiederverwendet werden.
- Verwende Abstrakte Klassen soweit möglich

## Ue_Quader

Erstellen Sie Definitionen der notwendigen Klassen/Methoden/Membervariable:

```java
Quader e = new Quader(2, 4, 5);
Quader u = new Quader((Rechteck) a, 5);
Quader x = new Quader("h=7cm, b=3m, l=5mm");
```

## Ue_Datum

Erstellen Sie Definitionen der notwendigen Klassen/Methoden/Membervariable:

```java
Datum x = new Datum();
Console.WriteLine(x.HEUTE);
```

## Ue_Kreis

Erstellen Sie Definitionen der notwendigen Klassen/Methoden/Membervariable:

```
Kreis a = new Kreis();
double u = Kreis.getUmfang(10);
```

## Ue_Pizza

Erstellen Sie Definitionen der notwendigen Klassen/Methoden/Membervariable:

```java
Pizza diavolo = new Pizza("Salami, Pfefferoni");
Console.WriteLine(Pizza.zutaten());
```

## Ue_Mitarbeiter

- Erstellen Sie eine Klasse **Mitarbeiter** zum Speichern eines Mitarbeiters. Jedem Mitarbeiter sind folgende Eigenschaften zuzuordnen:
  - Mitarbeiternummer
  - VName
  - NName
  - Urlaubskonto (Anzahl der Urlaubstage)


- Im Hauptprogramm wird ein neuer Mitarbeiter folgendermaßen angelegt:

  ```java
  Mitarbeiter Chef = new Mitarbeiter(123456789, "Hugo", "Müller");
  ```
```

  das Urlaubskonto wird bei der Neuanlegung immer auf 25 gesetzt. Wie muss die Klasse Mitarbeiter erweitert werden?


- Wenn der Mitarbeiter auf Urlaub geht, wird folgender Code ausgeführt:

  ```java
  Chef.NehmeUrlaub(5);			// 5 Tage Urlaub
```

  Wie muss die Klasse Mitarbeiter angepasst werden?

## Ue_Bankkunde

Erstellen Sie einen Datentyp **Bankkunde**. Der Datentyp enthält einen Vornamen, Nachnamen und eine Kundennummer.

L:

```java
class Bankkunde {
  public String vName;
  public String nName;
  public int kundennummer;
}
```

## Ue_Bankkonto

Erstellen Sie einen Datentyp **Bankkonto**. Der Datentyp enthält eine Kontonummer und einen Kontostand.

L:

```java
class Bankkonto {
  public String kontonummer;		// IBAN Nummer
  public double kontostand;		// aktueller Kontostand
}
```

## Ue_Bankkonto_2

Erstellen Sie einen Datentyp **Bankkonto**. Der Datentyp enthält eine Kontonummer, einen Kontostand und einen Kunden den Kontoinhaber. Zeige wie auf die Member-Objekte zugegriffen werden kann.

L:

```java
class Bankkonto {
  public String kontonummer;
  public double kontostand;
  public Bankkunde inhaber;
}
```

Zugriff:

```java
Bankkunde bkde = new Bankkunde();
Bankkonto kto = new Bankkonto();
kto.kontonummer = "AT535000040220053838";
kto.kontostand = 0.0;
kto.inhaber = bkde;
kto.inhaber.vName = "Sepp";
kto.inhaber.nName = "Hinterhofer";
kto.inhaber.kundennummer = 1;
```

## Ue_Bankkonto_3

Definieren Sie die Methode Konto:

```java
kunde = new Kunde("Huber", "Andreas");
adresse = new Adresse("","","5020","Salzburg");
datum = "1.12.2017";
Bankkonto k1 = new Bankkonto(1.2, kunde, adresse, datum):
```

## Ue_Punkt

Definitieren Sie die Methode Punkt:

```java
public void Kreis(Mittelpunkt p, double angle) {
  ...
}

...
Kreis(Punkt(1, 3), 270.0);
```
## Ue_Punkt_2
Definieren Sie die Methode Punkt:
```java
int x = Punkt(3, 4) + Punkt(1, 1);
```
## Ue_MaxValset
Vervollständigen Sie die Definitionen:
```java
private                       MaxValset(                                          ) {
  this.val1 = val1;
  Punkt a = new Punkt(val1, 3);
  Punkt b = new Punkt(2,5);
  int c = a.getLen(7);
  return b.getLen(8);
}
```
## Ue_Calc

Ergänzen Sie die Definitionen der folgenden Methode:

```java
public                calc(                 )
{
  this.name = name;
  this.alter = alter;
  
  return (alter > 18);
}
```

## Ue_GetAdcVal

Definieren Sie die Methode getAdcVal:

```java
Sensor pressSensLdf = new Sensor("Drucksensor", kennlinieLDF8);
Status s = getAdcVal("P1.1", 0.0, 3.3, pressSensLdf);
```
## Ue_Schaltjahr

Gegeben ist das folgende Programm:

```java
Datum geburtstag= newDatum("13,10,2015");
boolean bSchaltJahr=geburtstag.istSchaltjahr();
Datum next=geburtstag.getNaechstesJahrDatum();

System.out.println("Der nächsteGeb-Tag ist am " + next.toString());
        // BEACHTE: Ausgabe des Datums MUSS ineckigen Klammern erfolgen
        // zB: [13.10.2016]
```

Gesucht ist die Klasse Datum:
```java
     public class Datum{
        //Definition der private member data

        //Konstruktor

        // getter-Methode:getNaechstesJahrDatum

        // istSchaltjahr

        // toString

    }
```
**Hinweis:** Schaltjahr wenn das jahr durch 4 und nicht durch 100teilbar ist oder das jahr durch 400 teilbar ist dann ist es ein Schaltjahr

## Ue_Objekt

Objekt.java
```java
    public class Objekt{
        public static void main(String[] args){
            Main m1;
            m1= new Main();
            Main m2= new Main();
            m2.blabla();
            System.out.println(m1.blabla());
        }
    }
```
Main.java
```java
    public class Main{
        Main(){
            System.out.println(-2);
        }

        void Constructor(){      
        }
        public int blabla(){
            return -1;
        }
    }
```
Fragen:
a) Die Klasse Objekt beinhaltet .......... (Anzahl) Membervariablen.
b) Die Klasse Objekt beinhaltet .......... (Anzahl) Methoden.
c) Der Konstruktor der Klasse Objekt trägt die Bezeichnung
.....................
d) Die Klasse Main beinhaltet .......... (Anzahl) Membervariablen.
e) Die Klasse Main beinhaltet .......... (Anzahl) Methoden.
f) Der Konstruktor der Klasse Main trägt die Bezeichnung
.......................
g) Der Start von "java Main" führt zu folgender Ausgabe:





h) Der Start von "java Objekt" führt zu folgender Ausgabe:

