# 4 SQL - Übungen

## SQL - DML

Gegeben ist das folgende Diagramm:

![Fussball_DML](SQL_Fussball_DML.png)

Erstellen Sie die Struktur mittels SQL in die Datenbank *is_fussball*.

**Einfache SELECT**

- Liste alle Spieler (Name, Land, Position) aufsteigend sortiert nach Land.
- Wie viele Länder haben am Turnier teilgenommen?
- Liste alle Stadien (Stadt, AnzPlaetze) sortiert nach Stadt mit mehr als 50000 Plätzen.      
- Liste alle Stadien (Stadt, AnzPlaetze) sortiert nach AnzPlaetze
- Wie viele Personen fassen alle Stadien? 

**JOIN**

- Liste alle Spieler (Name, Land, Position), die zumindest 1 Tor erzielt haben.
- Liste alle Spieler (Name, Land, Position) aufsteigend sortiert nach Land, die verwarnt (Karte, Minute) wurden.
- Liste alle Spiele (MannschaftA, MannschaftB) inklusive der Kampfrichter (Name, Nationalität, Funktion).
- Liste alle Stadien, die zumindest einmal ausverkauft waren.      

**GROUP BY**

- Wieviele Zuschauer waren pro Spiel (MannschaftA, ManschaftB) durchschnittlich?
- Wieviele Zuschauer waren pro Stadion (Stadt, AnzPlaetze, durchschnittl. Besucher)     durchschnittlich?
- In welchem(n) Spiel(en) vielen die meisten Tore?
- Liste pro Spiel (MannschaftA, ManschaftB) die Tore (Spieler, Minute, Spielsituation).

**VIEW**

- Erzeuge die View v_spiel ( tag, stadion, zuschauer, MannschaftA, ManschaftB, ToreMannschaftA,     ToreMannschaftB, Kampfrichter)

**SQL-Stichworte:**

- Tabelle Erstellen: `CREATE TABLE TabellenName (Spalte1 Datentyp Constraint, ...);`
- Erstellen eines Suchindex: `CREATE INDEX IndexName ON TabellenName(Spaltenname, …);`
- Tabellenauszug: `SELECT Spalten FROM Tabellen WHERE Join-Bedingung [AND|OR einfache Bedingung ] ORDER BY Spalten;`
- Aufsummieren der Spalte2-Werte für Spalte1 Auswahl: `SELECT Spalte1, SUM(Spalte2) FROM Tabellen GROUP BY Spalte1 HAVING Bedingung;`
- Anzahl von Zeilen: SELECT COUNT(*) FROM Tabellen;
- Tabelle löschen: `DROP TABLE Tabelle;`
- Zeile Einfügen: `INSERT INTO Tabelle (Spalten) VALUES (Werte);`
- Werte Ändern: `UPDATE Tabelle SET Spalte= Wert WHERE Bedingung;`
- Zeilen Löschen: `DELETE FROM Tabelle WHERE Bedingung; `

## UNI

Erstellen Sie für die UNI-Datenbank folgende Queries

- Auflistung sämtlicher Vorlesung (Nr, Titel, SWS)

- Vorlesungsliste: Auflistung sämtlicher Vorlesungen samt haltenden Professoren (VNr, VTitel, SWS, ProfName, Raum)

- Mitarbeiterliste: Auflistung sämtlicher Mitarbeiter - Professoren und Assistenten - (PersNr, Name, Geburtsdatum) 

- Geburtstagsliste: Auflistung sämtlicher Mitarbeiter und Studenten (Name, Geburtsdatum) sortiert nach Datum (steigend)

- Hörerverzeichnis: Auflistung sämtlicher Studenten die eine Vorlesung besuchten (Name, MatrNr, Vorlesung) sortiert nach Vorlesungstitel

- Auflistung wie viele Studenten welche Vorlesung besuchen

- Auflistung der abgelegten Prüfungen (Studenten Name, MatrNr, Note, Fach, Prüfer)

- Auflistung der abgelegten Prüfungen (Studenten Name, MatrNr, Note, Fach, Prüfer) mit
  
  - zusätzlich dem Mittelwert der Note im jeweiligen Fach
  - zusätzlich dem Mittelwert des Studenten

- Ermitteln Sie ob die Prüfung *Mathematik III* für den Studenten *28106 Carnap* zulässig ist.

- Tragen Sie eine Prüfung ein die ohne eine Vorbedingung möglich ist

- Tragen Sie eine Prüfung ein die ohne eine Vorbedingung möglich ist

## Northwind

Nordwind ist eine sehr häufig referenzierte Beispiel-Datenbank für SQL-Beispiele (von Microsoft):

![SQL_northwind-erd](SQL_northwind-erd.png)

#### Einfache SELECT

Auflistung sämtlicher Angestellten (Vor-/Nachname)
SELECT First_Name, last_name
FROM employees;

Auflistung sämtlicher Kunden (Firmenname, Nachname, Tätigkeit, Telefonnummer)

Auflistung sämtlicher Angestellten (PersNr, Tätigkeit, Vorname, Nachname, Region)

Auflistung sämtlicher Zulieferer (Firmenname, Fax-Nummer, Tel-Nummer, Homepage)

#### ORDER BY

Auflistung sämtlicher Mitarbeiter sortiert nach Nachname
SELECT First_Name, Last_Name
FROM Employees
ORDER BY Last_Name, First_Name;

Auflistung sämtlicher Mitarbeiter (Titel, Vor-/Nachname) sortiert nach Tätigkeit und Nachname

Auflistung sämtlicher Mitarbeiter (Titel, Vor-/Nachname) sortiert nach Tätigkeit (steigend) und Nachname (fallend)

Auflistung sämtlicher Kunden (Firma, Nachname, Tätigkeit, Tel-Nummer) sortiert nach Tel-Nummer

Auflistung sämtlicher Mitarbeiter (Vor-/Nachname, Personalnummer) sortiert nach der Personalnummer

Auflistung sämtlicher Bestellungen (Nummer, Bestelldatum, Lieferdatum, Kundennummer, Zustelltarif) sortiert nach dem Preis (teuer nach billig)

Auflistung sämtlicher Lieferanten (Firmenname, Fax-/Tel-Nummer, Homepage, Land) sortiert nach Land (fallend) und Firmenname (steigend)

Auflistung sämtlicher Mitarbeiter (Tätigkeit, Vor-/Nachname) sortiert nach Tätigkeit (steigend) und Nachname (fallend)

Auflistung sämtlicher Produkte (Nummer, Name, Listenpreis in Dollar und in Euro)

#### WHERE

Operatoren:
=, <, >, >= ..., IS NULL, IS NOT NULL, BETWEEN 'A' and 'B', IN ('a','b','c'), LIKE 'M%', LIKE '%y%', LIKE 'N_'

Kombination der Operatoren:

- Alle auch mit NOT: NOT LIKE '%y%'
- AND, OR - in SQL: AND wird vor OR ausgeführt

Auflistung der Verkaufs-Mitarbeiter (*Representatives*) (Vor-/Nachname)
SELECT job_Title, First_Name, Last_Name
FROM Employees
WHERE job_title = 'Sales Representative';

Auflistung der Mitarbeiter deren Nachname mit einem N oder Höher beginnt (Vor-/Nachname)

Auflistung der Mitarbeiter (Vor-/Nachname) für welche keine Bemerkungen eingetragen sind

Auflistung der Mitarbeiter (Vor-/Nachname) für welche eine Bemerkungen eingetragen sind

Auflistung der Mitarbeiter deren Nachname mit einem N oder Höher beginnt (Vor-/Nachname) sortiert nach Vorname (steigend)

Auflistung der Kunden (Firma, Nachname) aus der Stadt Seattle

Auflistung der Bestellungen (Bestelldatum, Lieferdatum, Kundennummer, Preis) mit Bestelldatum '5.6.2006' (ein Datum wird in vielen Datenbanken in unterschiedlichen Formaten akzeptiert ...)

Auflistung der Mitarbeiter (Vor-/Nachname) die nicht aus den USA kommen

Auflistung der Bestellungen (PersNr, Bestell-Nr, Kunden-Nr, Bestelldatum, Lieferdatum) für die das Lieferdatum vor dem Bestelldatum eingetragen ist

Auflistung der Kunden (Firma, Nachname) bei denen keine Fax-Nummer angegeben ist, sortiert nach Firmenname (fallend)

Auflistung der Mitarbeiter (Vor-/Nachname, Stadt) die aus Seattle oder Redmond kommen

Auflistung der Kunden aus einem Bundesstaat der Form 'N_' (Nevada, New York)

#### Funktionen

COUNT(), SUM(), AVG(), MAX(), MIN() - diese Funktionen berechnen die Werte in den entsprechenden Spalten.

Berechnung der gesamten Anzahl der bestellten Teile der Bestellung mit der Nummer 31
SELECT SUM(quantity) AS GesamtMenge
FROM order_details
WHERE order_id=3;

Berechnung des durchschnittlichen Listenpreises sämtlicher Produkte

Berechnung des frühesten und spätesten Bezahldatum sämtlicher Bestellungen

#### GROUP

Fast immer wird Group gemeinsam mit einer Zahlenauswertung gemeinsam gemacht. Mit Having kann zusätzlich gefiltert werden

Ermitteln der Anzahl der Mitarbeiter pro Herkunft-Stadt
SELECT city, COUNT(id) AS AnzMitarbeiter
FROM employees
GROUP BY city;

Ermitteln der Anzahl der Mitarbeiter pro Herkunft-Stadt (nur wenn mehr als 2 Leut)
SELECT city, COUNT(id) AS AnzMitarbeiter
FROM employees
GROUP BY city
HAVING (COUNT(id) > 2);

#### Subqueries

Query im Query.

Ermitteln des Kunden der die Bestellung mit der Nummer 10290 aufgegeben hat (order und customer-Tabellen kombinieren)
SELECT company FROM customers WHERE id =
(SELECT customer_id FROM orders WHERE id=10290);

Ermitteln der Kunden die im Jahr 1997 bestellt haben
SELECT CompanyName FROM Customers WHERE CustomerID IN
(SELECT CustomerID FROM Orders WHERE OrderDate BETWEEN '1997-01-01' AND '1997-12-31');

#### JOIN

Auflistung der Mitarbeiter die einer Bestellung zugeordnet sind, sortiert nach Bestelldatum

```sql
SELECT employees.id, employees.last_name, employees.first_name, orders.id, orders.order_date FROM employees JOIN orders ON (employees.id = orders.employee_id) ORDER BY orders.order_date ASC;
```

Auflistung der Bestellnummern, des bestellenden Kunden und des betreuenden Mitarbeiters

Auflistung von Bestellnummern und den zugeordneten Bearbeitern für Bestellungen nach dem 12.3.2005

Auflistung der Anzahl von Produkten (Name und Anzahl) allerdings nur wenn die Anzahl geringer als 200 ist

Auflistung der Anzahl von Bestellungen seit 31.12.2007 pro Kunde. Allerdings nur, wenn die Anzahl größer/gleich 2 ist.

Auflösungen:

https://www.webucator.com/tutorial/learn-sql/subqueries-joins-unions.cfm

## Einkauf (06)

### Trigger

Das Einkauf-Schema soll erweitert werden.
![php_einkauf00](C:\Daten\Skripten\Informatik\DB\bilder\php_einkauf00.png)

Dazu soll in der Kunden-Tabelle das Attribut *numbest* eingefügt werden. Es soll die Anzahl der Bestellungen beinhalten. Grundsätzlich soll im Entwurf darauf geachtet werden dass das Datenbanksystem selbstständig auf die Konsistenz/Integrität achtet. Die Zahl eines Kunden ist mit den Einträgen in der Tabelle *bestellungen* verknüpft. Soviele Bestellung-Tupel ein Kunde hat, so groß soll die *numbest*-Zahl sein. Um diese Zahl immer korrekt zu halten hat das Setzen durch einen Trigger zu erfolgen:

- Trigger `t_numbest`

- Auslösen des Triggers durch Einfügen in die *bestellungen*-Tabelle - Vor oder Nach dem Einfügen spielt keine Rolle. Daher Wahl `AFTER INSERT`

- Der Wert wird gesetzt mit *Bisheriger Wert +1*:
  
  ```SQL
  UPDATE kunden SET numbest=(
      (SELECT numbest FROM kunden WHERE kunden.knr=NEW.knr)+1
      ) WHERE kunden.knr=NEW.knr;
  ```

### Verkäufer (07)

Fügen Sie eine weitere Tabelle *verkaeufer* ein. Die Struktur soll dadurch folgende Form bekommen:

![sql_einkauf00](C:\Daten\Skripten\Informatik\DB\bilder\sql_einkauf00.png)

Die Fremdschlüsselbeziehungen sind entsprechend zu Setzen.

- Listen Sie sämtliche Bestellungen samt deren Kunde und Verkäufer nur für Fälle in welchem ein Verkäufer und Kunde eingetragen ist(INNER JOIN). 
  
  ```sql
  SELECT * FROM bestellungen,verkaeufer,kunden WHERE bestellungen.knr=kunden.knr AND bestellungen.vnr=verkaeufer.pnr
  ```
  
  oder mit Join:
  
  ```sql
  SELECT * FROM bestellungen JOIN kunden ON bestellungen.knr=kunden.knr JOIN verkaeufer ON verkaeufer.pnr=bestellungen.vnr
  ```

- Listen Sie Kunden samt oder auch ohne Bestellung (LEFT JOIN).
  
  ```sql
  SELECT * FROM bestellungen LEFT JOIN kunden ON kunden.knr=bestellungen.knr
  ```

- Listen Sie sämtliche Kunden und sämtliche Bestellungen (FULL JOIN).
  
  ```sql
  SELECT * FROM bestellungen LEFT JOIN kunden ON kunden.knr=bestellungen.knr
  UNION
  SELECT * FROM bestellungen RIGHT JOIN kunden ON kunden.knr=bestellungen.knr
  ```
  
  Wichtig: beide Join liefern die gleichen Attribute in der gleichen Reihenfolge, daher können sie mittels Union direkt kombiniert werden.

- Listen Sie sämtliche Verkäufer samt oder auch ohne Bestellungen (RIGHT JOIN). 
  
  ```sql
  SELECT * FROM bestellungen RIGHT JOIN verkaeufer ON bestellungen.vnr=verkaeufer.pnr
  ```

## Invoices

Gegeben sei als Ausschnitt der Realität eine *Miniwelt Rechnungsschreiben*. Das Modell der Miniwelt dokumentiert sich in der folgenden Beispiel-Rechnung:

```
Hugo Müller
Gartenstr. 4a     65189 Wiesbaden
Rechnungsnummer:  R001        Kundennummer: K001     Datum: 2.1.2016
Rechnungsbetrag:  8.500,00

Pos.  ArtikelNr  Bezeichnung       Anzahl      E-Preis     G-Preis
---
 1    A002       Drucker MSP45       4         1.000,00    4.000,00
 2    A003       Bildschirm VGA      9           500,00    4.500,00
```

Die Geschäftsregeln der Miniwelt lassen sich wie folgt fassen: 
       1. Eine Rechnung geht genau an einen Kunden und existiert ohne Kunden nicht. 
     2. Ein Kunde kann keine, eine oder mehrere Rechnungen erhalten. 
     3. Eine Rechnung enthält mindestens eine Rechnungsposition. 
     4. Eine Rechnungsposition bezieht sich auf genau eine Rechnung und 

    existiert ohne Rechnung nicht.
     5. Eine Rechnungsposition betrifft genau einen Artikel und existiert ohne Artikel nicht.
     6. Ein Artikel kann in keiner, einer oder mehreren Rechnungen auftauchen.

Arbeitsanweisungen:
       1. Aufgabe: Erstelle ein vollständiges ER-Diagramm (Papier)
     2. Aufgabe: Erstelle ein vollständiges relationales Datenmodell in der Datei: is_invoice.sql

    (mit 1. create database, 2. create table, 3. Keys, 4. Constraints, 5. referentielle Integrität, 6. Testdaten).
    Tipp: siehe is_uni-mysql.sql
     3. Aufgabe: Zeige die SQL-Anweisung, welcher Artikel am meisten verkauft wurde.
     4. Aufgabe: Zeige die Redundanzfreiheit durch das Einhalten der 3. Normalform und 
    
    gib Definitionen zur 1. , 2. und 3. Normalform.

-- file: : is_invoice.sql
-- author: N.N.
-- date: 2017
-- demo zu sql
-- db: is_invoice
-- user: is_invoice oder is_invoice@localhost
-- pwd: comein
-- als root ausführen

drop database if exists is_invoice;
create database if not exists is_invoice;

grant create,drop, references, select,insert,update,delete 
on is_invoice.* to is_invoice@localhost identified by 'comein';

use is_invoice;

drop table if exists customer;
create table customer(
    id int  primary key,
    name varchar(80) not null default 'Sepp Bastman',
    address varchar(80) not null default 'address n/a'
);

is_invoice.sql

```sql
--
-- demo zu sql: is_invoice.sql
-- db: is_invoice
-- user: is_invoice oder is_invoice@localhost
-- pwd: comein
-- als root ausführen

drop database if exists is_invoice;
create database if not exists is_invoice;

grant create,drop, references, select,insert,update,delete 
on is_invoice.* to is_invoice@localhost identified by 'comein';

use is_invoice;

drop table if exists customer;
create table customer(
    id int  primary key,
    name varchar(80) not null,
    address varchar(80) not null default 'address n/a'
);

drop table if exists product;
create table product(
    id     int primary key,
    description varchar(80) not null default 'desc n/a',    
    price    double not null default 1.0
);

drop table if exists invoice;
create table invoice(
    id int primary key,
    full_price double not null default 0.0,
    date date,

    customer_id int not null,

    constraint inv_cust_fk
    foreign key (customer_id) references customer(id) on delete restrict
);

drop table if exists invoice_position;
create table invoice_position (
    position int not null,
    number_of_items int not null default 1,

    product_id int not null ,
    invoice_id int not null ,

    constraint invpos_pk 
    primary key (product_id,invoice_id),

    constraint invpos_prod_fk 
    foreign key (product_id) references product(id) on delete restrict,

    constraint invpos_cust_fk 
    foreign key (invoice_id) references invoice(id) on delete restrict
);

commit;

-- insert customers 
insert into customer (id,name,address)
values (1, 'Bob Hoepe','road 1');

insert into customer (id,name,address)
values(2, 'Jim Kopf','road 2');

insert into customer (id,name,address) 
values(3, 'Jane Tazan','road 3');


-- insert products: computer, tablet, handy
insert into product values (1,'computer', 300.0);
insert into product values (2,'tablet', 100.0);
insert into product values (3,'handy', 50.0);


-- insert invoices
-- full_price can only be calculated on invoice closing

insert into invoice (id,full_price,date,customer_id)
values(1,1.0,'2016-12-10', 1);
insert into invoice (id,full_price,date,customer_id)
values(2,2.0,'2016-12-20', 2);
insert into invoice (id,full_price,date,customer_id)
values(3,3.0,'2016-12-30', 3);


-- insert sold: 11 computers and 2 tables

insert into invoice_position(position, number_of_items,product_id, invoice_id)
values (1, 10, 1, 1);
insert into invoice_position(position, number_of_items,product_id, invoice_id)
values (1, 1, 1, 2);
insert into invoice_position(position, number_of_items,product_id, invoice_id)
values (2, 2, 2, 2);


-- which products are best-sellers?

select description, product_id, sum(number_of_items) as countProduct
from invoice_position, product
where product.id= invoice_position.product_id
group by description, product_id
order by countProduct desc;
```

## Browserdata

Google Chrome legt viele Daten in lokalen *sqlite*-Datenbanken ab. Unter:

`C:\Users\****\AppData\Local\Google\Chrome\User Data\Default\History`

sind viele der Tabellen zu finden, dazu muss *SQLITE* heruntergeladen werden. Welche Daten in History liegen kann geprüft werden:

```
sqlite3.exe C:\Users\****\AppData\Local\Google\Chrome\User Data\Default\History
SQLite version 3.29.0 2019-07-10 17:32:03
Enter ".help" for usage hints.
sqlite>.tables
downloads                meta                     urls
downloads_slices         segment_usage            visit_source
downloads_url_chains     segments                 visits
keyword_search_terms     typed_url_sync_metadata
sqlite> .quit
```

### Mozilla Firefox

Analog zu Google Chrome legt auch Firefox viele Daten in einer *SQLITE*-Datenbank ab:

```
C:\Users\****\AppData\Roaming\Mozilla\Firefox\Profiles\@@@@@>sqlite3.exe places.sqlite
SQLite version 3.29.0 2019-07-10 17:32:03
Enter ".help" for usage hints.
sqlite> .tables
moz_anno_attributes    moz_historyvisits      moz_keywords
moz_annos              moz_hosts              moz_meta
moz_bookmarks          moz_inputhistory       moz_origins
moz_bookmarks_deleted  moz_items_annos        moz_places
sqlite> .quit
```
