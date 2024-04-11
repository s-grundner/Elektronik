---
tags:
  - DB
aliases:
  - SQL
  - SQLite
  - MySQL
  - PostgreSQL
  - Structured Query Language
subject:
  - fsst
source:
  - Roman Schragl
  - https://gitlab.com/fosy/htbluva_sbg_fsst/
created: 21st November 2022
---

# SQL

SQL (Structured Query Language) - ist eine Datenbanksprache zur Definition und zum Bearbeiten von Datenstrukturen und Beständen in relationalen Datenbanken. 

Es wird unterschieden zwischen Befehlen zur Datenmanipulation einer DB (DML) (z.B. Datensatz einfügen) und Befehlen zur Veränderung der Struktur (DDL) (z.B. Neue Tabellen-Spalte einfügen).

- Allgemein: bei SQL spielt die Groß-/Kleinschreibung keine Rolle.
- SQL ist zwar standardisiert :-) trotzdem hat jede Datenbank ihre Besonderheiten und Abweichungen von der Sprache :-(
- Jeder Befehl ist mit einem Semikolon ; zu beenden.
- Leerzeichen/Tabulatoren können nach Belieben eingefügt werden.
- Kommentare in SQL werden durch "--" eingeleitet und gelten bis zum Zeilenumbruch.

## Datentypen

Auch die Datentypen können von Datenbank zu Datenbank unterschiedlich sein.

- **character(n)**, **char(n)** String fester Länge mit n Zeichen
- **varchar2(n)**, **varchar(n)** String variabler Länge mit bis zu n Zeichen (Anzahl der Zeichen dient lediglich der Anzeigelänge)
- **integer**, **int** ganze Zahl
- **number(n,m)**, **decimal(n,m)** Festkommazahl mit n Stellen, (m nach dem Komma)
- **float(m)** Gleitkommazahlen
- **date** Datum-/Zeitangabe
- **long** Zeichenkette bis zu 2 GByte
- **raw** Binärstrings bis zu 255 Bytes
- **long raw** Binärobjekte bis zu 2 GByte (Soundfiles, Videos, …)

## DML - Data Manipulation Language

Für die folgenden Erklärungen hilft es mit einer Beispieldatenbank *my_einkauf* zu arbeiten:

![SQL_DML_01](assets/SQL_DML_01.png)

Sie können dafür folgendes Skript verwenden:

```sql
DROP DATABASE IF EXISTS my_einkauf;

CREATE DATABASE my_einkauf;

CREATE TABLE kunden (knr INT(10), kunde VARCHAR(20));
INSERT INTO kunden (kunde, knr) VALUES 
    ("Jim", 1),
    ("Bob", 2),
    ("Bill", 3),
    ("Joe", 4),
    ("Jenny", 5);

CREATE TABLE bestellungen (bnr INT(10), teil VARCHAR(20), knr INT(10), gr VARCHAR(3));
INSERT INTO bestellungen (bnr, teil, knr, gr) VALUES
    (71, "Milch", 1, "LM"),
    (72, "Birne", 2, "LM"),
    (73, "Apfel", 3, "LM"),
    (74, "Stift", 0, "OE"),
    (75, "Tinte", 0, "OE");
```

### SELECT

Mit *SELECT* kann eine neue Tabelle aus Teilen von anderen Tabellen gewählt werden.

```sql
SELECT knr FROM kunden;
```

Mit *FROM* wird angeführt, dass aus der Tabelle *kunden* die Spalte *knr* ausgewählt wird.

Als *FROM*-Tabelle können auch mehr als nur eine Tabelle angeführt werden. In einem solchen Fall wird jede Zeile einer Tabelle mit jeder Zeile der zweiten Tabelle kombiniert (nennt sich Kreuz-Produkt). Aus einer 8 zeiligen und einer 5 zeiligen Tabelle wird somit eine 40 zeilige Tabelle.

Direkt auf *SELECT* folgend werden die Spalten ausgewählt. Sie werden durch Beistrich getrennt. Wenn mehrere Tabellen mit *FROM* angegeben wurden, können die Spalten wie folgt zugeordnet werden: *kunden.knr*, *bestellungen.knr*. Mit * werden sämtliche Spalten einer Tabelle ausgewählt. Es gibt einige Funktionen die über mehrere Zeilen rechnen: AVG(Age), COUNT(Name), MAX(Gehalt), MIN(Urlaub), SUM(Preis). Wird vor der Spaltenwahl das Schlüsselwort DISTINCT gesetzt, dann werden keine doppelten Zeilen zurückgegeben (hilfreich wenn nur die unterschiedlichen Teil-Zeilen einer Tabelle benötigt werden).

```sql
SELECT teil, gr FROM bestellungen;
```

Damit wird eine Tabelle mit nur den beiden Spalten *teil* und *gr* zurückgegeben.

```sql
SELECT kunden.knr, bestellungen.bnr FROM bestellungen, kunden;
```

Hier wird eine Tabelle mit den Spalten *knr* und *bnr* generiert. Durch die zweite Tabelle wird jede knr aus *kunden* sooft ausgegeben wie *bestellungen* Zeilen hat ([Kreuzprodukt](Vektor.md)).

![SQL_DML_02](assets/SQL_DML_02.png)

Umbenennen von Spalten:

```sql
SELECT knr AS KundenNummer, Kunde AS KundenName FROM kunden;
```

Auf diese Art wird eine Tabelle erzeugt mit den Spalten *KundenNummer* und *KundenName*. Wenn Tabellen mittels Alias angesprochen werden sollen, dann wird das ohne AS gelöst (unterschiedlich je nach DB-System):

```sql
SELECT a.name1 AS name, a.persNr AS nummer FROM Angestellte a;
```

#### WHERE

```sql
SELECT teil FROM bestellungen WHERE gr=´OE´;
```

Mit der *WHERE*-Klausel können Zeilen ausgewählt werden. Nur wenn in einer Zeile die angeführte Bedingung erfüllt wird (*gr*="OE"), dann wird die Zeile auch zurückgegeben. Als Operatoren gibt es NOT, AND, OR, <, <=, >, >=, =, <>, [NOT] BETWEEN … AND, [NOT] in, [NOT] like, ALL, ANY, SOME, EXISTS, IS [NOT] NULL.

```sql
SELECT * FROM bestellungen WHERE bnr BETWEEN 72 AND 74;
```

Gibt eine Tabelle zurück in der sämtlicher Zeilen mit einer Bestellnummer zwischen 72 und 74 aus Tabelle Bestellungen.

#### GROUP BY

Gruppierung liefert für jeden unter *BY* angeführten Spaltenwert eine einzige Zeile:

```sql
SELECT * FROM bestellungen GROUP BY gr;
```

Damit werden sämtliche gr-Gruppen der Bestellungen in eine Tabelle gelistet. Die unterschiedlichen Werte werden nur einfach ausgegeben (nur einmal LM und einmal OE). Für die obige Tabelle ist hier das Ergebnis:

| bnr | teil  | knr | gr  |
| --- | ----- | --- | --- |
| 71  | Milch | 1   | LM  |
| 74  | Stift | 0   | OE  |

Mit Gruppierung können einfach Aufstellungen von unterschiedlichen Elementen gemacht werden (welche gr gibt es …). Mit den Mathematischen Funktionen können dabei auch sehr gut Teile gezählt werden:

```sql
SELECT gr, COUNT(bnr) AS AnzTeile FROM bestellungen GROUP BY gr;
```

Damit werden nicht über die komplette Tabelle die Bestellnummern gezählt, sondern nur über die jeweilige Gruppe, also hier nur über LM und über OE. Das Ergebnis:

| gr  | AnzTeile |
| --- | -------- |
| LM  | 3        |
| OE  | 4        |

#### JOIN

Mit JOIN im FROM eines SELECT können Tabellen miteinander kombiniert werden. Für JOIN gibt es unterschiedliche Varianten - INNER, RIGHT/LEFT und OUTER.

- INNER JOIN: für die Auswahl von Elementen die in beiden Teiltabellen vorhanden sind.  
  Ermittlung nur jener Kunden die auch eine Bestellung getätigt haben:
  
  ![SQL_JOIN1](assets/SQL_JOIN1.png)
  
  ```sql
  SELECT * FROM kunden JOIN bestellungen ON bestellungen.knr=kunden.knr;
  ```
  
  liefert diese Tabelle:
  
  ```
  knr    kunde    bnr     teil     knr
   1    Jim        1     Milch  1
   2    Bob        2     Birne  2
   3    Bill    3     Apfel  3
  ```
  
  Für INNER JOIN kann das gleiche Ergebnis mittels WHERE erzielt werden:
  
  ```
  SELECT * FROM kunden, bestellungen WHERE bestellungen.knr=kunden.knr;
  ```

- LEFT JOIN: Auswahl von sämtlichen Elementen aus der *linken* (erstgenannte) Tabelle. Wenn möglich werden die Datensätze mit Informationen der *rechten* Tabelle ergänzt.  
  Auflistung sämtliche Kunden, vorhandene Bestellungen werden beim Kunden angeführt:
  
  ![SQL_JOIN1](assets/SQL_JOIN2.png)
  
  ```sql
  SELECT * FROM kunden LEFT JOIN bestellungen ON bestellungen.knr=kunden.knr;
  ```
  
  ergibt:
  
  ```
  knr    kunde     bnr      teil     knr
   1    Jim          1      Milch       1
   2    Bob          2      Birne       2
   3    Bill      3      Apfel       3
   4  Joe    NULL   NULL   NULL
   5  Jenny  NULL   NULL   NULL
  ```

- RIGHT JOIN: Analog zu LEFT JOIN, in manchen DB-Systemen gibt es nur einen der beiden, der jeweilig anderen kann ja durch vertauschen der Reihenfolge ermittelt werden.  
  Sämtliche Bestellungen, wenn möglich komplettiert mit eventuell bestellenden Kunden (in diesem Beispiel gibt es interne Bestellungen - ohne Kunde):
  
  ![SQL_JOIN1](assets/SQL_JOIN3.png)
  
  ```sql
  SELECT * FROM kunden RIGHT JOIN bestellungen ON bestellungen.knr=kunden.knr;
  ```
  
  bringt:
  
  ```
  knr     kunde bnr    teil     knr
  1     Jim   1    Milch     1
  2     Bob   2    Birne     2
  3     Bill  3    Apfel     3
  NULL NULL  4    Stift    0
  NULL NULL  5    Tinte    0
  ```

- OUTER JOIN: Für die Darstellung sämtlicher Datensätze beider Tabellen, wenn möglich werden die Sätze aus beiden Tabellen kombiniert.  
  Sämtliche Kunden und sämtliche Bestellungen, wenn Möglich mit Zuordnung:

![SQL_JOIN1](assets/SQL_JOIN4.png)

```sql
SELECT * FROM kunden OUTER JOIN bestellungen ON bestellungen.knr=kunden.knr;
```

(für MySQL gibt's kein OUTER JOIN, Alternative: eine UNION aus LEFT und RIGHT JOIN)

Ergebnis:

```
knr     kunde     bnr      teil      knr
  1     Jim     1      Milch       1
  2     Bob     2      Birne       2
  3     Bill    3      Apfel       3
  4  Joe   NULL   NULL   NULL
  5  Jenny NULL   NULL   NULL
NULL NULL    4    Stift    0
NULL NULL    5    Tinte    0
```

Typische Anwendung dieser JOINs ist das Herausfinden von fehlenden Daten.

Ermitteln welcher Kunde keine Bestellung getätigt hat:

```sql
SELECT * FROM kunden LEFT JOIN bestellungen ON kunden.knr=bestellungen.knr WHERE bnr IS NULL
```

ergibt:

```
knr  kunde     bnr      teil     knr
  4  Joe   NULL   NULL   NULL
  5  Jenny NULL   NULL   NULL
```

oder auch umgekehrt, welche Bestellung ist keinem Kunden zugeordnet:

```sql
SELECT * FROM kunden RIGHT JOIN bestellungen ON kunden.knr=bestellungen.knr WHERE kunden.knr IS NULL
```

liefert:

```sql
  knr  kunde     bnr      teil     knr
  NULL NULL     4     Stift  0
  NULL NULL     5     Tinte  0
```

#### ORDER BY

Damit kann nach Spalten aufsteigend (ASC) oder absteigend (DESC) sortiert werden:

```sql
SELECT Name FROM GehListe ORDER BY Gehalt ASC, Ort DESC;
```

#### UNION

Mit Union können Tabellen einfach hintereinander gehängt werden und zwar unabhängig vom Inhalt (ob die Spalten passen oder nicht).

```sql
SELECT knr AS Nummer FROM kunden
UNION
SELECT bnr AS bnummer FROM bestellungen
```

liefert

| Nummer |
| ------ |
| 1      |
| 2      |
| 3      |
| 4      |
| 5      |
| 71     |
| 72     |
| 73     |
| 74     |
| 75     |

Damit die richtigen Spalten der beiden Tabellen richtig zueinander kommen ist nur die Reihenfolge im SELECT und nicht der Name entscheidend.

### INSERT

Einfügen von Zeilen, hier zwei auf einmal:

```sql
INSERT INTO bestellungen (bnr, teil, knr) VALUES
(´77´, ´Hose´, 5),
(´112´, ´Banane´, 7);
```

Sofern in der Tabelle nicht konfiguriert ist, dass ein Wert nie leer sein darf (NOT NULL) müssen die Elemente auch nicht gefüllt werden (in diesem Beispiel fehlt gr).

### DELETE

Mit *Delete* können Zeilen aus einer Tabelle gelöscht werden:

```sql
DELETE FROM bestellungen WHERE gr=´OE´;
```

Hier werden sämtliche Zeilen auf die die *WHERE*-Bedingung zutrifft gelöscht.

### UPDATE

Mit *Update* können Werte von Tabellen verändert werden.

```sql
UPDATE Personal SET Gehalt=1.10*Gehalt WHERE Gehalt < 3000;
```

Erhöht das Gehalt der Mitarbeiter mit <3000 um 10% (wird nicht sehr häufig vorkommen).

### Transaktionen

Unter einer Transaktion wird eine Zusammenfassung mehrerer SQL-Anweisungen verstanden. Diese Anweisungen werden von der Datenbank direkt hintereinander ohne Unterbrechung durchgeführt. Wenn also zwei Zugriffe auf eine Datenbank direkt hintereinander erfolgen müssen ohne dass dazwischen ein anderer Benutzer in die Datenbank eingreifen kann, dann werden sie zusammengefasst.

Eine Transaktion wird mit `START TRANSACTION;` begonnen.

Wenn ein Anweisungsblock (Transaktion) beendet und durchgeführt werden soll, wird das mit `COMMIT;` durchgeführt:

Alternativ zu *COMMIT* kann eine Transaktion rückgängig gemacht werden mit `ROLLBACK;`.

Bsp.:

```sql
START TRANSACTION;
DELETE FROM Angestellte WHERE persnr=1;
ROLLBACK;
```

Dieses Löschen des Datensatzes wird nicht ausgeführt da ein Rollback durchgeführt wurde. Sinnvollerweise wird ein *ROLLBACK* / *COMMIT* abhängig von einer Bedingung ausgeführt.

### Beispiel CD

(Schlechte) Auflisten sämtlicher Einträge (kombiniert):

```sql
SELECT * FROM CD,Kuenstler,Lieder;
```

Auflistung sämtlicher CDs mit Anführen des Interpreten:

```sql
SELECT * FROM Cd,Kuenstler WHERE Cd.IId=Kuenstler.IId;
```

Auflistung sämtlicher Titel mit Anführen des Interpreten und Albums:

```sql
SELECT * FROM ((cd INNER JOIN kuenstler ON cd.iid=kuenstler.iid) INNER JOIN lieder ON cd.cdid=lieder.cdid));
```

Verändern eines Interpreten-Namen (ist kein Schlüssel):

```sql
UPDATE Kuenstler SET Interpret='Anasti' WHERE Interpret='Anastacia';
```

Für Schlüsselelemente genau gleich, allerdings müssen sämtliche Fremdschlüssel eine Erlaubnis auf UPDATE beinhalten (kein RESTRICT …).

Löschen von Werten:

```sql
DELETE FROM Kuenstler WHERE Interpret='Anastacia';
```

Das funktioniert immer wenn der Interpret nicht verknüpft ist (noch keine CD hat …). Wenn er verknüpft ist, dann muss für diese Verknüpfung zum Beispiel ON_DELETE=NULL gesetzt sein, dann zeigt die Verknüpfung eben ins Leere.

## DDL - Data Definition Language

### Datentypen

| Typ          | Bedeutung                                          |
| ------------ | -------------------------------------------------- |
| INT          | Ganzzahl                                           |
| NUMERIC(x,y) | x stellige Zahl mit y Nachkommastellen             |
| CHAR(n)      | Zeichenkette mit fester Länge n                    |
| VARCHAR(n)   | Zeichenkette flexibler Länge mit maximal n Zeichen |
| BIT(n)       | n Bits                                             |
| DATE         | Datum (Jahr, Monat, Tag)                           |
| TIME         | Uhrzeit (Stunde, Minute, Sekunde)                  |
| DATETIME     | DATE und TIME                                      |

### Schema

Erstellen des Schemas *myDb* und für die weitere Verwendung aktivieren:

```sql
CREATE DATABASE myDb;
USE myDB;
```

Löschen des Schemas *myDb* (kein UnDo möglich):

```sql
DROP DATABASE myDb;
```

### Tabelle

#### Tabelle Erzeugen

1. Erzeugen der Tabelle *myTab* mit den beiden Spalten *myNum* und *myVal* im aktiven Schema (use *myDb*):
   
   ```sql
   CREATE TABLE myTab (myNum INT, myVal CHAR(20));
   ```

2. Erzeugen der Tabelle *myTab* mit den beiden Spalten *myNum* und *myVal* im aktiven Schema (use *myDb*). Hier wird eingeschränkt - *myNum* darf nicht leer sein (beim Befüllen Attribut nicht angegeben):
   
   ```sql
   CREATE TABLE myTab (
    myNum INT          NOT NULL,
    myVal CHAR(20)
   );
   ```
   
   Einschränkungen für ein Attribut (myNum) werden direkt hinter die Definition gehängt. Oder wenn die Werte Eindeutig sein müssen (aber kein Schlüssel):
   
   ```sql
   CREATE TABLE myTab (
    myNum INT          NOT NULL       UNIQUE,
    myVal CHAR(20)
   );
   ```

3. Wenn ein Attribut gleich als Schlüssel mit angegeben wird:
   
   ```sql
   CREATE TABLE myTab (
    myNum INT          PRIMARY KEY,
    myVal CHAR(20)
   );
   ```
   
   Ganz so einfach geht's leider nicht, wenn mehrere Spalten zusammen einen Primärschlüssel (der bekommt hier den Namen PK_myKey) bilden:
   
   ```sql
   CREATE TABLE myTab (
    myNum INT          PRIMARY KEY,
    myVal CHAR(20),
    CONSTRAINT PK_myKey PRIMARY KEY (myNum, myVal)
   );
   ```
   
   Es kann auch auf sich selbst referenziert werden:
   
   ```sql
   CREATE TABLE Personal(
       Persnr INT PRIMARY KEY,
       NAME CHAR(25) NOT NULL,
       Ort CHAR(15),
       Vorgesetzt INT REFERENCES Personal(
           ON DELETE SET NULL ON UPDATE CASCADE
       ),
       Gehalt NUMERIC(8, 2),
       Beurteilung CHAR
   );
   ```
   
   Jede Person der Personal-Tabelle hat hier eine Referenz auf eine andere Person, den Vorgesetzten.

#### Tabelle Löschen

Löschen von Tabellen funktioniert nur wenn nicht auf sie referenziert ist:

```sql
DROP TABLE myTab;
```

#### Tabelle Verändern

Im aktuell ausgewählten Schema (`use myDb`):

1. Spaltentyp oder Spaltenname ändern:
   
   ```sql
   ALTER TABLE myTab MODIFY COLUMN myVal VARCHAR(59);
   ALTER TABLE myTab CHANGE myVal myNewVal VARCHAR(50);
   ```

2. Spalte Löschen (die betroffene Spalte darf kein Schlüssel sein):
   
   ```sql
   ALTER TABLE myTab DROP COLUMN myVal;
   ```

3. Spalte Einfügen:
   
   ```sql
   ALTER TABLE myTab ADD COLUMN myVal VARCHAR(50);
   ```

4. Primärschlüssel Setzen (hier zwei Spalten gemeinsam):
   
   ```sql
   ALTER TABLE myTab ADD PRIMARY KEY (myNum, myVal);
   ```

5. Erzeugen eines Fremdschlüssels mit Namen FK_myVal_coolVal. Dafür muss es in Tabelle *myTab* eine Spalte *myVal* geben und in der Tabelle *coolTab* eine Spalte *coolVal* (mit gleichem Typ!):
   
   ```sql
   ALTER TABLE myTab ADD CONSTRAINT FK_myVal_coolVal FOREIGN KEY (myVal) REFERENCES coolTab(coolVal);
   ```
   
   das klappt nur wenn *coolVal* in der *coolTab* ein Primärschlüssel, sonst wäre nicht eindeutig auf welchen Datensatz verwiesen wird.
   
    Da durch das Löschen/Verändern eines Datensatzes der mittels Fremdschlüsselbeziehung verknüpft ist eine Inkonsistenz entstehen kann, können hier weitere Optionen mit angegeben werden:
   
   ```sql
   ALTER TABLE myTab ADD CONSTRAINT FK_myVal_coolVal FOREIGN KEY (myVal) REFERENCES coolTab(coolVal) ON DELETE RESTRICT ON UPDATE RESTRICT;
   ```
   
   Mit `ON DELETE` und `ON UPDATE` wird angegeben wie in diesem Fall zu verfahren ist:
   
   - soll das Löschen/Ändern untersagt werden *RESTRICT*
   - soll das Löschen/Ändern auch für den verknüpften Datensatz durchgeführt werden *CASCADE*
   - soll das Löschen/Ändern den Fremdschlüssel im verknüpften Datensatz auf NULL setzen *SET NULL*
   - soll das Löschen/Ändern im verknüpften Datensatz ignoriert werden (eventuelle Inkonsistenz) *NO ACTION*
   
   Alternativ kann die Beziehung beim Erstellen der Tabelle miterzeugt werden:
   
   ```sql
   ...,
   constraint fk_tab1_tab2
       foreign key (customer_id) references customer(id) on delete restrict, ...
   ```

### Index

Für Tabellen können *index* erstellt werden. Ein *index* dient lediglich dazu Suchabfragen zu beschleunigen. Wenn gewisse *select*-Anweisungen häufig zu erwarten sind, dann kann die Suche mittels eines *index* beschleunigt werden.

```sql
CREATE INDEX idx_pname
ON Persons (LastName, FirstName); 
```

Damit wird für die Tabelle *Persons* und die Spalten *LastName* und *FirstName* ein Index erzeugt. Wird nach einer Person mittels Vorund Nachname gesucht, erfolgt anschließend die Suche schneller als ohne Index.

### View

Views können wie Tabellen verstanden werden. In Sichten können neue Relationen erzeugt werden die aus Attributen von Tabellen bestehen. Damit können Tabellen zusammengefasst oder gefiltert werden. Praktisch sind Views wenn Rechte auf nur gefilterte Daten vergeben werden sollen.

```sql
CREATE VIEW myView AS SELECT k.knr,b.bnr FROM kunden k RIGHT JOIN bestellungen b ON b.knr=k.knr;
```

Mit diesem Befehl wird eine Tabelle *myView* erzeugt mit den Spalten *knr* und *bnr* die einen JOIN darstellen.

### Trigger

(ob eine Trigger-Config funktioniert hängt auch davon ab ob die DB eine Transactional (InnoDB) oder nicht (MyISAM) ist).

Mit Trigger können durch definierte Ereignisse Vorgänge ausgelöst werden.

```sql
CREATE TRIGGER Datum_Trigger
    AFTER INSERT
    ON Auftrag
BEGIN
    UPDATE Auftrag
    SET Datum=CurrentDate
END;
```

Dieser Trigger wird Ausgelöst wann immer ein *INSERT* für die Tabelle *Auftrag* ausgeführt wird und Verändert dann sämtliche Datum auf *CurrentDate*.

Beispiel Uni: es kann Vorlesungen geben, die Vorausgesetzt werden, um eine weitere Vorlesung besuchen zu dürfen (real wird das über die Prüfung sichergestellt - Mathe 2 erst wenn Mathe 1 positiv geprüft). Um sicherzustellen, dass kein Student eine Prüfung über eine Vorlesung die eine weitere voraussetzt ablegen kann, über welche der Student noch keine Prüfung abgelegt hat wird ein Trigger eingebaut:

```sql
CREATE TRIGGER `after_pruefen_insert`
AFTER INSERT ON `pruefen` 
FOR EACH ROW BEGIN
  IF EXISTS ( SELECT * FROM voraussetzen AS V
    LEFT JOIN ((SELECT * FROM pruefen WHERE MatrNr=NEW.MatrNr) AS P)
    ON V.VorausS=P.VorlNr
    WHERE V.VorlNr=NEW.VorlNr AND P.MatrNr IS NULL
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Pruefung hat Voraussetzungen!";
  END IF; 
END
```

Der Trigger **after_pruefen_insert** wird ausgelöst durch ein **insert** in der **pruefen**-Tabelle. Für jeden Datensatz (**ROW**) wird ausgeführt: Prüfung ob in der **voraussetzen**-Tabelle zur Vorlesung die mit insert eingetragen werden soll **NEW.VorlNr** eine **VorausS** existiert. Wenn Ja dann Prüfen ob diese nicht in der **pruefen**-Tabelle vorhanden ist. Wenn eben nicht, dann Fehlermeldung **45000** und Text. Damit wird in MySQL der Eintrag nicht durchgeführt. In anderen Datenbanken wird der Eintrag mit Rollback unterbunden.

Für MySQL kann die *BEGIN*-*END* Gruppe nur verwendet werden, wenn der Zeilenabschluss ';' nicht drinnen ist. Das kann damit erreicht werden indem dieser Abschluss geändert wird:

```sql
DELIMITER $$
SELECT * FROM xy$$
DELIMITER ;
```

Mit *DELIMITER* wird der Zeilenabschluss auf $$ verändert, damit wird diese Kombination in der Zeile danach anstatt des Semikolons verwendet, abschließend wird der Zeilenabschluss wieder zurück geändert. 

### Berechtigungen

1. Grant
   
   Gewährt Zugriffsrechte:
   
   ```sql
   GRANT SELECT, INSERT ON myTab TO me;
   ```
   
   Gewährt dem Benutzer *me* Zugriff auf SELECT und INSERT Befehle für die Tabelle *myTab*.
   
   Kombiniertes Erstellen eines Benutzers mit Rechten:
   
   ```sql
   grant create, drop, select,insert, update, delete 
   on mydatabase.* to myuser@localhost identified by 'passwort';
   ```

2. Revoke
   
   Umgekehrt zu Grant werden hier Rechte entzogen:
   
   ```sql
   REVOKE SELECT ON myTab FROM me;
   ```
   
   Hiermit wird das Recht auf SELECT wieder entzogen (für *me* auf Tabelle *myTab*).

Es gibt User und Gruppen (von Usern), Beispiel von Berechtigung über Gruppe:

```sql
-- c:\xampp\mysql\bin>mysql.exe -u root

-- Benutzer anlegen (Standard: keine Rechte)
DROP USER IF EXISTS 'schueler'@'localhost';
CREATE USER 'schueler'@'localhost' IDENTIFIED BY '1234';

-- Benutzer in der DB anzeigen:
SELECT USER FROM mysql.user;

-- Benutzergruppe erstellen
DROP ROLE IF EXISTS 'role1';
CREATE ROLE 'role1';

-- Zugriff auf Rolle erlauben
GRANT 'role1' TO 'schueler'@'localhost';

-- User der Rolle zuordnen
SET DEFAULT ROLE 'role1' FOR 'schueler'@'localhost';

-- der Gruppe SELECT auf Schema my_einkauf erlauben
GRANT SELECT ON my_einkauf.* TO 'role1';
```

Damit wird er Benutzer `schueler` mit dem Kennwort `1234` zur Gruppe `role1` hinzugefügt und hat dessen Rechte.

### Transaktionen

Es kann wichtig sein, dass Datenbankzugriffe in einer Abfolge passieren ohne dass dazwischen ein fremder Zugriff erfolgt. Wenn in einem Banksystem eine Umbuchung erfolgt, dann kann in einem ersten Schritt die Einzahlung auf das Zielkonto erfolgen und in einem zweiten Schritt die Abbuchung vom Quellkonto. Wird genau zwischen diesen beiden Zugriffen das Geld von beiden Konten behoben würde mehr Geld zur Verfügung stehen. Um solche Probleme zu vermeiden können Zugriffe in **Transaktionen** gekapselt werden:

```sql
START TRANSACTION;
SELECT name FROM products WHERE manufacturer = 'XYZ Corp';
UPDATE spring_products SET item = name;
COMMIT;
```

Der Bereich zwischen Start-Transaction und Commit wird als atomarer DB-Zugriff behandelt. Wenn eine solche Transaktion doch nicht durchgeführt werden soll, kann der komplette Zugriff innerhalb der Transaktion mit *ROLLBACK* rückgängig gemacht werden.

### Fehlermeldung Generieren

```sql
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Custom error'
```

## Referenzen

Dieses Dokument ist weit davon entfernt vollständig zu sein, gerade für SQL gibt es im Internet eine enorme Fülle an (sehr guter) Dokumentation.

- [https://www.w3schools.com/sql/default.asp](https://www.w3schools.com/sql/default.asp)

## Fragen

- Was bedeutet ein NULL-Attribut?
- Was wird mit dem DEFAULT-Schlüsselwort bewirkt?
- Muss ein Fremdschlüssel UNIQUE sein?
- Dürfen Fremdschlüssel NULL sein