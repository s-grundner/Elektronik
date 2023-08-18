# 5.0 Unterschiedliche Anbieter

Unterschiedliche Datenbank-Systeme:

- Microsoft Access: Kleinst-Datenbanken. Datenbank+Datenbankmanagementsystem in einem. Große Nachteile: Rechteverteilung nicht gut möglich, mehrfach gleichzeitiger Zugriff nicht möglich (absolute No-Go für viele Systeme).
- DB2: komerziell, weit verbreitet im Großrechnerumfeld, sehr performant, aufwendig in der Wartung
- Oracle DB: komerziell, weit verbreitet, sehr performant, aufwendig in der Wartung
- MySQL: OpenSource, wurde aber von Oracle gekauft, sehr verbreitet.
- MariaDB: OpenSource, gegründet aus Befürchtung dass der Kauf von MySQL durch Oracle die Verfügbarkeit einschränkt. *Sehr* kompatibel zu MySQL.
- Microsoft SQL Server: komerziell, sehr gute Anbindung an Microsoft-Entwicklungstools (VS). Nicht so gut für Nicht-MS-OS verfügbar.
- SQLite: kleines Datenbanksystem, speziell für lokale Anwendungen konzipiert. Es kann vollständig in Anwendungen eingebettet werden (In-Memory) oder legt eine Datenbank in eine einzelne Datei ab.

Für sehr verbreitete Systeme sind eine Vielzahl an Management-Systemen verfügbar. Gerade da spielt Open-Source eine große Rolle, damit können einfach Tools von Drittanbietern entwickelt werden.

Neben diesen Relationalen Datenbanksystem gibt es natürlich eine große Zahl von anderen Systemen. Als Begriff sei hier nur NoSQL-Datenbanken erwähnt. Sie haben kein Tabellenorientiertes Design. No steht oft für Kein-SQL oder auch für NotOnly-SQL.

## Microsoft Access (Microsoft)

Access ist ein kleines relationales Datenbanksystem, das im Desktopbereich eingesetzt wird. Access wird als integrale Komponente der Suite *Microsoft Office* vermarktet. Das System bietet ein integriertes DBMS, wodurch MS-Office vertrauten Benutzern die Möglichkeit geboten ist, schnell kleine Anwendungen zu entwickeln. Microsofts ODBC (Open Database Connection), ein Standard zur Kommunikation mit relationalen Datenbanksystemen, macht es möglich, Access als Front-End zu Datenbanksystemen wie Oracle oder MySQL zu verwenden.

**Einsatzbereich:**
Kleine Datenbanken bis zu 2 GB. Es besteht die Möglichkeit, eine Datenbankdatei gleichzeitig zwischen 255 Benutzern zu teilen. Allerdings kann die gesamte Datenbank leicht kopiert werden (Sicherheitsproblem!), so dass sie praktisch nur im Umfeld vertrauter Mitarbeiter verwendet werden kann.

Im Linux Bereich sind in der LibreOffice-Suite **LibreOffice Base** verfügbar, das einen analogen Bereich abdeckt.

## MariaDB

MariaDB ist ein Fork vom Datenbanksystem MySQL. MariaDB wurde vom früheren MySQLHauptentwickler Ulf Michael Widenius gegründet, nachdem Sun Microsystems im Jahr 2012 von Oracle übernommen wurde.
MariaDB ist ein relationales Datenbankverwaltungssystem, welches als sogenanntes „Drop-in-Replacement“ für MySQL entwickelt wurde, d.h. es soll nach der Installation eine bereits bestehende MySQL Instanz ohne Nachteile ersetzen können und sofort lauffähig sein. Dies hat dazu geführt, dass viele, auch teilweise große Unternehmen von MySQL auf MariaDB gewechselt sind. MariaDB wird, genauso wie MySQL, aufgrund der guten Kompatibilität zu PHP3 oftmals für die Unterstützung von Webanwendungen genutzt.

MariaDB ist Teil von XAMPP (früher war MySQL Teil des Pakets).

Linux:

```
sudo apt-get install mariadb-client mariadb-server
```

### MariaDB auf dem RaspberryPi

Durch die OpenSource Strategie kann MariaDB auch auf einem RaspberryPi installiert werden:

```shell
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install mariadb-server mariadb-client
...
sudo mysql -u user -p
Enter password:
```

Gute Beschreibung: [https://staticfloat.de/raspberry-pi/mariadb-10-auf-raspberry-pi-installieren/](https://staticfloat.de/raspberry-pi/mariadb-10-auf-raspberry-pi-installieren/)

Für die Installation vom Konfigurationstool phpMyAdmin:

```
sudo apt-get install phpMyAdmin
```

Ab nun kann mittels Browser mit dem gewählten Passwort unter folgender Url verbunden werden:

```
raspiIp/phpmyadmin
```

## MySQL (MySQL)

Relationale Datenbank aus dem Open-Source-Bereich. Viele Standardbefehle von SQL92 werden nicht unterstützt, um die Geschwindigkeit zu steigern.

**Einsatzbereich:**
Mittelgroße Datenbanken. Datenbanken mit einfachen Datenstrukturen, bei denen es vor allem auf die Zugriffsgeschwindigkeit ankommt. MySQL wird wie mSQL vorwiegend für Web-basierte Anwendungen verwendet. Diese Datenbank hat durch OpenSource eine sehr große Verbreitung erfahren.

Linux:

```
sudo apt-get install mysql
```

## SQL Server (Microsoft)

Ein von Microsoft vertriebenes Unternehmensdatenbanksystem. SQL Server zeichnet sich durch die enge Verbindung zu Microsofts Betriebssystem Windows und Microsofts Entwicklungsumgebungen wie Visual Basic und Visual C++ aus. SQL Server beinhaltet Datenanalyse (OLAP) und Datenbankverwaltungswerkzeuge. Es erlaubt die Verwendung von bis zu 64GB RAM und bis zu 32 parallelen Prozessoren.

**Einsatzbereich:**
Große Unternehmensdatenbanken.

## MongoDB (MongoDB) - Nicht Relational

MongoDB ist in der Programmiersprache C++ geschrieben und speichert Daten im **BSON-Format** (Binary JSON), das dem JSON-Format (JavaScript Object Notation) nachempfunden ist. Dank dieser Tatsache werden sämtliche JavaScript-Datentypen unterstützt, weshalb MongoDB die optimale Wahl für Node.js-Plattformen ist. MongoDB-Datenbanken enthalten eine oder mehrere Datensammlungen, die verschiedene Dokumente mit beliebig vielen und verschiedenartigen Datenfeldern verwalten.

MongoDB arbeitet, anders als MySQL, dokumentenorientiert und verfolgt entsprechend einen komplett anderen Ansatz bei der Speicherung der Daten, wobei die Grundstruktur gewisse Ähnlichkeiten aufweist:

- Anstatt in **Tabellen** werden die Daten in **Sammelmappen** (Collections) gespeichert.

- **Dokumente** im BSON-Format ersetzen die **Zeilen**, in diesen Dokumenten definierte Felder die Spalten der SQL-Tabellen.

- Ein Feld ist dabei immer ein Paar aus einem Schlüssel, der gleichzeitig den Namen des Feldes darstellt, und einem Wert. Dieser Wert kann für eine **Zahl**, ein **Wort** oder einen **Text**, aber auch für ganze Listen von Wörtern bzw. Zahlen oder eine komplette Datei stehen.

- Ein MongoDB-Dokument ist also eine **Sammlung von Schlüssel-Werte-Paaren**, so wie prinzipiell auch die MySQL-Tabellenzeile.

## Einrichten unterschiedlicher DB-Systeme

### Einrichten einer Access-Datenbank

- Installation mittels Office-Installationstool.

- In Access eine Access-DB (accdb) anlegen mit 2 Spalten: Namen, Alter. Diese DB mit ein paar Datensätzen befüllen.

- Damit der Zugriff auf MS-AccDb funktioniert muss evtl. die "Microsoft Office Access database engine" installiert werden:
  
  https://www.microsoft.com/de-de/download/confirmation.aspx?id=23734
  
  Ob das notwendig ist zeigt sich beim ersten Versuch eine Verbindung herzustellen und der Fehlermeldung "Microsoft.ACE.OLEDB.12.0'-Provider ist nicht auf dem lokalen Computer registriert."

### Einrichten einer MySql-Datenbank

- Download installer: https://dev.mysql.com/downloads/mysql (MySQL Server 8.0.12)
- Config Type: Development Computer, Windows Service Name: MySQL80, localhost:3306, root, Passwort: passwort
- Zum Prüfen der Installation: Ausführen von Dienste, darin den Service MySQL80 suchen, der muss auf "Wird ausgeführt" stehen.
- Zum Ausführen von MySQL aus der Command-Line: Pfad setzen, dann mittels "mysql -u root -p" ausführen. Alternativ wird eine mySQL Command-Line mit installiert.

Kommando-Zeile:

```
mysql -u root -p
show [databases](databases);
show tables;
use mydb;
...
```

### Einrichten Microsoft SQL Server

Installation Microsoft SQL Server:

- Download https://www.microsoft.com/de-de/sql-server/sql-server-downloads
- Starten und Auswahl "Benutzerdefiniert"
- Sprachwahl "Deutsch" und Standardpfad "C:\SQLServer2017Media"
- Die Installation benötigt zu diesem Zeitpunkt eine Internetverbindung, es wird ein relativ langer Download gestartet.

Im SQL Server Installation Center:

- New SQL Server stand-alone installation or add features to an existing installation
- ...
- ServerName: MSSQLSERVER
- Passwort: "passwort"

Installation des "SQL Server Management Studio":

- Download unter (https://docs.microsoft.com/de-de/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-2017)
- Installation

#### SQL Server Management Studio

- Starten und Verbinden mit "SQL Server-Authentifizierung", Anmeldename "sa" (Serveradministrator) und obiges Kennwort ("passwort"). Damit kann mit dem Server mittels dieser Daten verbunden werden. Ansonsten kann mittels Windows-Authentifizierung gearbeitet werden.
- Ab hier ist man mit dem Datenbanksystem verbunden. Sichtbar ist das links oben im Object-Explorer
- Unter [Databases](Databases)/System [Databases](Databases) sind viele Systemdatenbanken vorhanden, darin werden die angemeldeten Benutzer und ähnlicher Kram abgelegt.
- Erstellen einer neuen Datenbank: Object Explorer -> [Databases](Databases) -> New Database ...
- Databasename: "Northwind".
- Mit der Schaltfläche Script ganz oben kann ein Skript angezeigt werden, das die getroffenen Einstellungen vornimmt (der ganze Kram könnte auch via Skript erledigt werden).
  Mit OK im Einstellungsfenster kann die Northwind-DB (ohne Skript) angelegt werden. Das Skript im Hauptfenster kann geschlossen werden. Die neue Datenbank ist im Object-Explorer zu finden.
- In der Menüleiste kann mit New Query (neue Abfrage) ein Abfragefenster geöffnet werden.
- Eingabe von "CREATE TABLE Testtabelle (zaehler int);" und Menüleiste -> Execute (Ausführen) -> Commands completed successfully. Nach Refresh (F5) ist die Tabelle im Baum von Northwind zu finden.
  Auf diese Art wurde via SQL eine Tabelle erzeugt. Das klappt auch via Kontextmenü im Object-Explorer ( auch dort kann ein Skript angezeigt werden).

#### Verwaltung MS SQL Server

- Starten eines konfigurierten MS-SQL-Servers: Starten der Anwendung "Sql Server Configuration Managers". Unter SQL Server-Dienste gibts einen *SQL Server (MSSQLSERVER)* Dienst. Der muss laufen ansonsten mit Starten den Server starten.
- Beendet kann der Server entweder vom gleichen Ort oder unter dem "Microsoft SQL Server Management Studio" mit Beenden.

#### Remote-Zugriff auf SQL-Server einrichten

Sehr gute Beschreibung: [https://www.linglom.com/it-support/enable-remote-connection-on-sql-server-2008-express/](https://www.linglom.com/it-support/enable-remote-connection-on-sql-server-2008-express/)

### Einrichten einer SQLite-Datenbank

- Download Bundle-Zip (für entsprechendes OS):  https://www.sqlite.org/download.html  (3.30.1)

- Entzippen in einem Ordner aus welchem die DB betrieben werden soll

## Referenzen

- Erklärung und Beispiele:
  
  http://www.datenbanken-verstehen.de/

- MySQL
  
  http://isticktoit.net/wp-content/uploads/2013/09/kurs_forts2.pdf
