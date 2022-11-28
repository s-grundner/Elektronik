# 4 OOP - Übungen

## Rectangle (010)

Erstellen Sie die Klasse Rectangle (cpp-, h-Datei) mit den Integer-Member-Variablen mLen und mWid, einem Konstruktor und der Methode toString(). Für ein 5x3 Rechteck soll die Methode toString() dabei folgende Ausgabe bewirken:

```
*****
*****
*****
```

Verwende einen Copy-Konstruktor zum Erstellen einer Kopie. Folgendes Hauptprogramm erzeugt obige Ausgabe:

```c++
Rechteck r1(5,3);
Rechteck r2(r1);
cout << r2.toString() << endl;
```

## Fraction (053)

Erstellen Sie die Klasse Fraction (mNumerator, mDenumerator) mit den Methoden:

```c++
Fraction(int num);
Fraction(int num, int deNum);
virtual ~Fraction();
Bruch mult(Fraction b2);
static Fraction mult(Fraction b1, Fraction b2);
Fraction div(Fraction b2);
static Fraction div(Fraction b1, Fraction b2);
Fraction add(Fraction b2);
static Fraction add(Fraction b1, Fraction b2);
Fraction sub(Fraction b2);
static Fraction sub(Fraction b1, Fraction b2);
Fraction cancel();
void print();
```

Folgendes Beispiel:

```c++
Fraction b1(100, 300);
Fraction b2(60, 14);
Fraction b3 = Fraction::sub(b1,b2);

b1.print();
cout << " - ";
b2.print();
cout << " = ";
b3.print();
```

soll diese Ausgabe erzeugen:

```
1/3 - 30/7 = -83/21
```

## Date (052)

Erstellen Sie die Klasse Date (mDay, mMonth, mYear) mit den Methoden:

```c++
Date(int t, int m, int j);
virtual ~Date();
std::string print();
static Date actualDate();
Date inc(); // Datum um 1 Tag erhöhen
Date dec(); // Datum um 1 Tag reduzieren
bool isLeap(int jahr);
std::string weekDay();
Date add(int tage);
Date sub(int tage);
```

Die Addition/Subtraktion eines Datums mit Tagen soll ein gültiges Datum erzeugen. Dabei sind die maximalen Monatstage und Schaltjahre zu berücksichtigen.

Das Hauptprogramm:

```c++
Date d1(2,1,1999);
d1 = d1.add(2).sub(4);
cout << d1.print() <<  ", " << d1.weekDay() << endl;
d1 = d1.sub(365).sub(365).sub(365).sub(365);
cout << d1.print() << ", " << d1.weekDay() << endl;
```

ergibt:

```
31.12.1998, Donnerstag
01.01.1995, Sonntag
```

Tipp:

```c++
#include <time.h>

time_t tim = NULL;
tm *pt;
time(&tim);              // Zeit abfragen/aktualisieren

pt = localtime(&tim);    // lokalisieren

mDay = pt->tm_mday;
mMonth = pt->tm_mon;
mYear = pt->tm_year + 1900;    // Jahr von 1900 aus gerechnet
```

## Pseudozufallsgenerator (013)

Es soll ein sogenannter Pseudozufallszahlengenerator erstellt werden, der zur wiederholten Erzeugung von Zahlen im Intervall [0,1] dient. Lange Folgen von generierten Zufallszahlen sollen im Intervall [0,1]  möglichst gleichverteilt sein. Erfahrungen haben gezeigt, dass sich mit der Funktion 

$f(x) = (a\cdot x) \% n$

mit $a = 16807$ und $n= 2^{31} -1$ (= 2147483647) gute Zufallszahlen generieren lassen.

**Algorithmus:**
​	a) Start mit beliebigem $x_0 ϵ \{1, ..., n-1\}$ (der sogenannte seed) und
​	b) erzeugen der nächsten Zufallszahl gemäß
​		$x_{i+1} = f(x_i)$   also    $x_{i+1} = (a\cdot x_i) \% n$ 

​	c) Um die Zufallszahl im Intervall $[0,1]$ zu liefern, wird die Zufallszahl durch n dividiert

**Hinweise zur Implementierung in C++:**

1. Die unsigned long-Konstanten a und n werden als private Membervariablen gespeichert.
2. Die aktuelle Zufallszahl wird als private Membervariable unsigned long currentX gespeichert.
3. Der Defaultkonstruktor initialisiert die Variable currentX auf den Wert 123L.
4. Der allgemeine Konstruktor hat als Parameter mit dem Namen seed den Initialwert für die Variable currentX.
5. Die Methode double nextRand() liefert eine Zufallszahl im Intervall $[0,1]$. Sie berechnet aus der aktuellen Zufallszahl - entsprechend der obigen Formel - die neue Zufallszahl, speichert diese in currentX und gibt sie als Zahl im Intervall $[0,1]$ zurück.
6. Die Methode unsigned long nextIntRand(int limit) liefert eine Zufallszahl im Intervall $[0,limit[$. Sie ruft intern die Methode nextRand() auf und multipliziert diesen mit dem Parameter limit und gibt diesen Wert zurück.

main.cpp:

```c++
...
#include "pseudorandom.h"
int main(){
  int i;
  cout << endl << endl;
  //-------------------------------
  // Wuerfel
  const unsigned int NO_SIDES = 6;
  int no_rolls= 12000;
  int rollCount[NO_SIDES + 1];
  long seed;
  for (i = 1; i <= NO_SIDES; i++){
    rollCount[i] = 0;
  }
  // prompt for number of rolls
  cout << "Anzahl der Wuerfe: " ;
  cin >> no_rolls;
  // prompt for seed
  cout << "Anfangszahl (Seed) >= 1 angeben: " ;
  cin >> seed;
  PseudoRandom rollRnd(seed);
  // wuerfeln
  for (i = 1; i <= no_rolls; i++){
    int index= rollRnd.nextIntRand(NO_SIDES) + 1;
    rollCount[index]++;
  }
  cout << "WURF\tHAEUFIGKEIT\trelative HAEUFIGKEIT"<<endl;
  for (i = 1; i <= NO_SIDES; i++){
    cout << i << "\t" << rollCount[i];
    cout << "\t\t" << rollCount[i]/(double)no_rolls << endl;
  }
  cout << endl << endl;
  return 0;
}
```

## Prüfziffernberechnung (014)

Zur Kennzeichnung von Waren verwendet man den sogenannten EAN-Code (Europäische Artikel-Nummerierung mit 13 Ziffern). Bei Büchern ist die ISBN-Nummer üblich. Bei der letzten Ziffer der Nummer handelt es sich um eine sogenannte Prüfziffer, sodass z.B. einfache Eingabefehler erkannt werden können. Die Prüfziffer berechnet sich aus den übrigen Ziffern.

**ISBN-13**
Zur Berechnung der Prüfziffer bei der ISBN-13 werden alle zwölf Ziffern der noch unvollständigen ISBN addiert, wobei die Ziffern mit gerader Position (also die 2., 4. usw.) den dreifachen Wert erhalten.
Bsp: Eine 5 an 6. Stelle beispielsweise fließt als 15 in die Addition ein.
Von dem Ergebnis dieser Addition wird die letzte Stelle bestimmt, die dann von 10 subtrahiert wird.
Bsp: Also etwa 10 − 4 = 6 bei einem Additionsergebnis von 124.
Dieses Endergebnis ist die Prüfziffer. Ist das Endergebnis indessen 10, ist die Prüfziffer 0.
Formel zur Berechnung der Prüfziffer:
​	$ z_{13}=10−\left(Σ^{n=12}_{i=1} z_i\cdot 3^{(i+1) mod 2}\right) mod 10$
Das $(i+1) mod 2$ sorgt für die wechselnde Gewichtung von 1 und 3.
Erstreckt man die Summierung auch auf die Prüfziffer (n = 13), so erhält man bei einer fehlerfreien ISBN als Ergebnis 0.

Beispiel:
​	978-3-7657-2781-?
Lösung:

​	9 + 8 + 7 + 5 + 2 + 8 + 3 * (7 + 3 + 6 + 7 + 7 + 1) = 39 + 3 * 31 = 39 + 93 = 132
​	132 mod 10 = 2

​	10 − 2 mod 10 = 8	d.h. Die Prüfziffer ist 8

```c++
class Pruefziffer{
public:
  /**
  * Gibt an, ob die Prüfziffer der ISBN-Nummer gültig ist.
  * verwendet: calcPruefziffer_ISBN(string nummerISBN)
  * @param string nummerISBN: ISBN-Nummer (inkl. '-')
  * @return bool: true, wenn die errechnete Prüfziffer
  * gleich der letzten Ziffer der ISBN-Nummer ist
  */
(2) static bool isValid_ISBN(string nummerISBN){
	???????????
  }
  /**
  * Berechnet aus der ISBN-13 Nummer die Prüfziffer
  * @param string nummerISBN: ISBN-Nummer (inkl. '-')
  * @return char: errechnete Prüfziffer */
(4) static char calcPruefziffer_ISBN(string nummerISBN){
	????????????
    // löscht alle '-' Zeichen
    string nummer = getDigitsOnly(nummerISBN);
    // berechnet die Prüfziffer und gibt diese zurück
	????????????
  }
private:
  // lokale Hilfsfunktion
  // gibt einen string, der nur aus Ziffern besteht zurück
(2) static string getDigitsOnly(string nummer){
	???????????
  }
};
// ---------------------------------------------------------------
int main(){
  string isbn = string("978-0-30716-548-0");
  string isValid;
  cout << "ISBN: " << isbn << endl;
(1) isValid = ??????????isValid_ISBN(isbn) ? "true" : "false";
  cout << "Pruefziffer ist " << isValid << endl;
  return 0;
}
```

Hinweis:
double std::pow(double, int);
int isdigit(int);

## Shapes (055)

Erstellen Sie ein Zeichenprogramm mit dem QTCreator. Es soll das Zeichnen von Linien, Dreiecken, Vierecken und Kreisen möglich sein.

Die erstellten Formen sind in einem Array aufzunehmen (besser vector) um für ein repaint() die Formen updaten zu können. Dazu müssen sämtliche Formen von einer Stammklasse abgeleitet werden.

Ablauf beim Zeichnen einer Form:

- Auswahl was gezeichnet wird mittels Schaltfläche (oder Menüpunkt / Toolbaritem)
- Mit jedem Mausklick wird ein Punkt der Figur gesetzt.
- Wenn genügend Punkte gesetzt wurden, dann wird der Zeichenvorgang abgeschlossen.

## Account (011)

Erstellen Sie die Klasse Account mit den Membern:

- long long mAccNbr (IBAN)
- string mAccHolder
- double mAccBalance
- Konstruktor / Destruktor
- Getter/Setter
- toString() -> "kontonummer 10 Stellen       Kontoeigner 30 Stellen     Kontostand 10 Stellen "
- withdraw() -> abheben
- deposit() -> einlegen

und ein Testprogramm um die Klasse zu testen:

```c++
Konto k1(12345600, "Maier Joe");
k1.deposit(100);
k1.withdraw(50);
k1.deposit(30);
k1.withdraw(10);
k1.withdraw(10);
k1.withdraw(10);

cout << k1.toString() << endl;
```

generiert die Ausgabe:

```
Eroeffne Konto ...
12345600                        Maier Joe EUR     50.00
Zerstoere Konto ...
```

## Assoziation Bank (012)

Erstellen Sie die Klasse Bank mit den Membern:

- maxNumAccounts: statische Vorgabe wie viele Konten die Bank maximal verwalten kann
- string mBankName
- Account *mAccounts[maxNumAccounts]		(Aggregation/Komposition)
- Konstruktor / Destruktor
- getter/setter
- toString()
- addAccount(), delAccount
- deposit(double)
- withdraw(double)

Testprogramm:

```c++
#include <iostream>
using namespace std;
#include "account.h"
#include "bank.h"
int main() {
    cout << "!!!Cashbank International!!!" << endl;
    Bank* myBank = new Bank("Serious Cayman Trust");
    Account* k1 = new Account("J. P. Morgan",1000.0);
    Account* k2 = new Account("Marcus Goldman",1000.0);
    Account* k3 = new Account("Nathan Mayer Rothschild",1000.0);
  
    myBank->addAccount(*k1);
    myBank->addAccount(*k2);
    myBank->addAccount(*k3);
    cout << "Die Bank: VOR der Spesenberechnung *********\n";
    cout << myBank->toString() << endl;

    cout << "Die Bank: NACH der Spesenberechnung *********\n";
    myBank->withdraw(10.0);
    cout << myBank->toString();

    cout <<"Die Bank: NACH dem Loeschen von k3 *********\n";
    myBank->delAccount(*k3);
    cout << myBank->toString();
	
    delete k1;
    delete k2;
    delete k3;
    delete myBank;
    return 0;
}
```

- Die Spesen berechnen sich: Balance-Amount

UML-Diagramm:

<img src="bilder/Bankkonto_001.png" width="500px" />

In diesem Beispiel besteht eine **Assoziation** (Beziehung) zwischen den Klassen Bank und Account. Es gibt zwei Arten von Assoziationen: **Aggregation** (Account kann auch ohne Bank existieren) und **Komposition** (Account kann ausschließlich nur in einer Bank existieren).

## Bank/Account (064)

Es sind Teile eines Bank-Beispiels gegeben. Vervollständigen Sie die ausständigen .cpp-Source-Dateien.

- Bemerkenswert: der Account-Konstruktor ist private. Er kann daher allgemein von außerhalb der Klasse nicht aufgerufen werden. Hier wird das gelöst indem eine Friend-Klasse Bank definiert wird.
- Stellen Sie sicher, dass es jeweils einzigartige Kontonummern gibt. Dazu wird die **statische Variable** nextAccountNumber definiert. Sie ist in jedem Account-Konstruktor zu inkrementieren.

account.h:

```c++
/*
 * account.h
 *
 *  Created on: 15.09.2012
 *      Author: informatik
 */
#ifndef ACCOUNT_H_
#define ACCOUNT_H_

#include <string>
using namespace std;

class Account {
private:
	static int nextAccountNumber;

	int mAccNbr;
	string mAccHolder;
	double mAccBalance;

	friend class Bank;
	// only a Bank can create Accounts -> Friend

    Account(string accHolder, double accBalance);
	~Account();

public:
	double getBetrag() const;
	void setBetrag(double accBalance);

	const string& getAccHolder() const;
	void setAccHolder(const string& accHolder);

	int getNummer() const;
	void setNummer(int nummer);

	void withdraw(double amount);
	void deposit(double amount);

	string toString() const;
};
#endif /* ACCOUNT_H_ */
```

bank.h:

```c++
/*
 * bank.h
 *
 *  Created on: 15.09.2012
 *      Author: informatik
 */

#ifndef BANK_H_
#define BANK_H_

#include "account.h"

#include <string>
#include <vector>
using namespace std;

class Bank {
private:
	string m_name;
	vector<Account*> m_accounts;
public:
	Bank(string bankName);
	~Bank();

	const string& getName() const;
	void setName(const string& name);

	int addAccount(string name, double betrag);
	void delAccount(string name);

	Konto& getAccount(int nr);


	void deposit(double amount);  // for all accounts
	void withdraw(double amount); // for all accounts

	string toString() const;
};
#endif /* BANK_H_ */
```

main.cpp:

```c++
//============================================================================
// Name        : oop1-banksysteme-STLVector-static.cpp
// Author      : NAME
// Version     :
// Copyright   : open source
// Description : Bank, Account, private cons, friend class
//============================================================================
// g++ main.cpp account.cpp bank.cpp -o main.exe

// AUFGABE:
// ----------------------------------------------------------------------------
// Bringen Sie dieses Programm zum Laufen
// Klassen: Bank, Account

#include "account.h"
#include "bank.h"
#include <iostream>
using namespace std;

int main(){

	Bank *myBank;
	myBank = new Bank("Hofmann unlimited");

	cout << "\n\nDIE BANK -----------------"<<endl;
	cout << ">>> hier noch mit allen 3 Konten"<<endl;

	myBank->addAccount("Anton Hofmann", 100.0);
	myBank->addAccount("Beta Hofmann", 200.0);
	myBank->addAccount("Gamma Hofmann",300.0);

	cout << myBank->toString() << endl;
	cout << "\n\nDIE BANK -----------------"<<endl;
	cout << ">>> nach dem Loeschen v. Konto Anton Hofmann"<<endl;
	myBank->delAccount("Anton Hofmann");

	cout << myBank->toString() << endl;
	cout << endl;

	cout << "\n\nDIE BANK -----------------"<<endl;
	cout << ">>> nach dem Einfuegen v. Konto Omega Hofmann"<<endl;
	myBank->addAccount("Omega Hofmann", 900.0);

	cout << myBank->toString() << endl;
	cout << endl;

	cout << "\n\n"<<endl;
	cout << "-------------------------------------------------"<<endl;
	cout << " DEMO: FRIEND class "<<endl;
	cout << "-------------------------------------------------"<<endl;
	cout << " DEMO: Der Konstruktor der Klasse Account ist private "<<endl;
	cout << " DEMO: Nur die Bank kann diesen verwenden: siehe FRIEND CLASS"<<endl;

	//Account k1("Anton Hofmann", 123.0); 	// error, because cons is private

	int AccountNr= myBank->addAccount("Anton Hofmann", 100.0);
	myBank->getAccount(AccountNr).einlegen(9000.0);

	cout << myBank->toString() << endl;
	cout << endl;

	delete myBank;
    return 0;
}
```

**Hinweise zu *STL-vector*:**

m_accounts.size - Anzahl der Elemente im *vector*.
m_accounts[3] - 3tes Element des *vector*s. Achtung: keine Bereichsprüfung.
m_accounts.push_back(new Konto(...)) - Fügt ein neues Element am Ende ein.
m_accounts.back() - gibt das letzte Element des *vector*s zurück.
m_accounts.erase(m_accounts.begin() + 3) - Löscht das 4te Element aus dem *vector*.
Schleife über *vector*:

```c++
for(auto kt: m_accounts){   // auto: Automatisch korrekter Typ eines Elements
	kt.deposit(10.0);       // Einlegen von 10.0 € auf jedes Account
}
```



