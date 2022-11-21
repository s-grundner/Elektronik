# 11.2 OOP Vererbung - Übungen

## Firma (120, 012)

- Erstellen Sie eine Klasse Person mit den Member *Name*

- Erstellen Sie eine Mitarbeiter-Person mit den zusätzlichen Member *Sozialversicherungsnummer*

- Erstellen Sie eine Kunde-Person mit den zusätzlichen Member *Rechnungen* (Feld mit Rechnungsnummern)

- Erstelle Sie eine Firma die eine variable Anzahl an Mitarbeitern und Kunden haben kann. In dieser Firma gibt es die Methoden:
  - Kunden mit Namen und Rechnungen ausgeben
  - Mitarbeiter mit Namen und Sozialversicherungsnummern ausgeben

Das folgende Testprogramm:

```java
class Program {
  public static void main(String[] args) {
    Firma f1 = new Firma();
    f1.addKunde("Müller");
    f1.addKunde("Maier");
    f1.addKunde("Huber");
    f1.rechnungEingeben("Müller", 1);
    f1.rechnungEingeben("Müller", 2);
    f1.rechnungEingeben("Maier", 1);
    f1.rechnungEingeben("Maier", 2);

    f1.addMitarbeiter("Kickor", 1234150799l);
    f1.addMitarbeiter("Sabno", 3452110601l);
    f1.addMitarbeiter("Heiner", 1134090277l);

    System.out.println("\n");
    System.out.println(f1.listMA());
    System.out.println("\n");
    System.out.println(f1.listKd());
  }
}
```

soll folgende Ausgabe liefern:

```c#

    Mitarbeiter-Name          SvNr
==================================
              Kickor    1234150799
               Sabno    3452110601
              Heiner    1134090277
----------------------------------



         Kunden-Name          ReNr
==================================
              Müller
                                 1
                                 2
               Maier
                                 1
                                 2
               Huber
----------------------------------
```

Aufgebaut werden soll die folgende Klassenstruktur:

```java
class Firma
{
  ArrayList mitarbeiter;
  ArrayList kunden;

  public Firma()
  public void addKunde(String name)
  public void rechnungEingeben(String name, int reNr)
  public void addMitarbeiter(String name, long svNr)
  public String listMA()
  public String listKd()
}

class Kunde extends Person {
  ArrayList rechnungen;
  public Kunde(String name)
  public String getRechnungsList()
  public void addRechnung(int reNr)
}

class Mitarbeiter extends Person {
  private long svNr;
  public Mitarbeiter(String name, long svNr)
  public String getString()
}

class Person {
  private String name;
  public Person(String name)
  public String getName()
}
```

## Rechtecke (,013)

- Erstellen Sie eine Klasse Rechteck und eine Klasse Quadrat. Überlegen Sie welche Klasse allgemeiner/genereller ist und welche Klasse spezieller ist und leiten Sie die speziellere Klasse von der Allgemeineren ab.
- Funktionen: getFlaeche(), getUmfang(), toString().
- Testen Sie die Klassen mit geeigneten Testfunktionen.

## Dreiecke (,014)

- Erstellen Sie die Klassen Dreieck, GleichsDreieck und GleichschDreieck. Überlegen Sie welche Klasse allgemeiner/genereller ist und welche Klasse spezieller ist und leiten Sie die speziellere Klasse von der Allgemeinen ab.
- Funktionen: flaeche(), umfang(), toString(), Konstruktoren.
- Testen Sie die Klassen mit geeigneten Testfunktionen.

## Punkte (,015)

- Erstellen Sie die Klassen Punkt2D und Punkt3D. Überlegen Sie welche Klasse allgemeiner/genereller ist und welche Klasse spezieller ist und leiten Sie die speziellere Klasse von der Allgemeinen ab.
- Funktionen: abstand() (=Abstand vom Ursprung), toString(), Konstruktoren.
- Testen Sie die Klassen mit geeigneten Testfunktionen

## Quader (,016)

- Erstellen Sie die Klassen Quader und Wuerfel unter Einbeziehung der Rechteck/Quadrat-Klassen. Überlegen Sie welche Klasse allgemeiner/genereller ist und welche Klasse spezieller ist und leiten Sie die speziellere Klasse von der Allgemeinen ab.
- Funktionen: oberflaeche(), volumen(), toString(), Konstruktoren.
- Testen Sie die Klassen mit geeigneten Testfunktionen.

## Spannungsteiler (,017)

- Erstellen Sie die spezielle Klasse SpgTlr und die generelle Klasse BelSpgTlr (Spannungsteiler und Belasteter Spannungsteiler). Die Widerstände r1, r2, rl und die Spannungen u1, u2, u stellen die Attribute dar.
- Funktionen: setU1() setU2(), setU(), ToString(), Konstruktoren
- Ein unbelasteter Widerstand kann durch einen sehr hohen Widerstandswert dargestellt werden (z.B. 1E99).
- Durch das Setzten einer Spannung werden automatisch die verbleibenden Spannungen neu berechnet.
- Testen Sie die Klassen mit geeigneten Testfunktionen.

## Bankkonto (,018)

- Erstellen Sie die Klassen GiroKonto mit den Attributen kontonummer (long), kontostand (double), geheimzahl (int) und die Methoden zahleEin(), zahleAus(), checkGehZahl(), drucke().
- Erstellen Sie die Klassen SparKonto mit den Attributen kontonummer (long), kontostand (double), sperrfrist (int) und den Methoden zahleEin(), zahleAus(), drucke().
- Erstellen Sie eine unterstützende Hirarchie.
- Testen Sie die Klassen mit geeigneten Testfunktionen.