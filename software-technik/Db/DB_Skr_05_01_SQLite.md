# 5.1 Tool - SQLite

## Installation (Windows)

- Download (32 oder 64 Bit) von **Precompiled Binaries for Windows**:

  <https://www.sqlite.org/index.html>

  und die Command-Line-Tools

- Der Download beinhaltet einfache ZIP-Dateien, es ist keine gesonderte Installation notwendig.

- Zur Verwaltung hilfreich ist *SQLiteBrowser*, dieser kann von <https://sqlitebrowser.org/> für jedes OS bezogen werden. Eine einfache Einleitung gibt's hier: <https://www.youtube.com/watch?v=2pbL7gTHMRw>

## Anwendung

```
> sqllite3.exe intro.db
SQLite version 3.29.0 2019-07-10 17:32:03
Enter ".help" for usage hints.
sqlite> create table employee(empid integer, name varchar(20));
sqlite> insert into employee values (100,'John Smith');
sqlite> select * from employee;
100|John Smith
sqlite> .quit

>
```

Mit dieser Folge wird ein Schema (Datenbank) **intro.db** erstellt (in eine gleichlautende Datei in diesem Verzeichnis). Wenn es dieses Schema schon gibt wird es geöffnet, ansonsten erstellt.

Mittels einer ebenfalls verfügbaren dll kann via Programm (aus Windows) darauf zugegriffen werden. Alternativ sind selbstverständlich auch ODBC-Treiber erhältlich.

- <https://www.devart.com/odbc/sqlite/DevartODBCSQLite.exe>  
  dieser Treiber ist frei allerdings nur für 30 Tage lizenziert.
- Freie Alternative:  
  <http://www.ch-werner.de/sqliteodbc/>



Auszug einiger, weniger Befehle in SQLite (.help), das Arbeiten in der DB erfolgt mittels SQL:

```
sqlite> .help
.cd DIRECTORY            Change the working directory to DIRECTORY
.changes on|off          Show number of rows changed by SQL
.check GLOB              Fail if output since .testcase does not match
.clone NEWDB             Clone data into NEWDB from the existing database
.databases               List names and files of attached databases
.dbinfo ?DB?             Show status information about the database
.dump ?TABLE? ...        Render all database content as SQL
.quit                    Exit this program
.read FILE               Read input from FILE
.tables ?TABLE?          List names of tables matching LIKE pattern TABLE
```

## Beispiel Einkauf

Um in der SQLite-DB das Einkauf-Projekt abzubilden:

```sql
sqlite3.exe my_einkauf.db
.read einkauf.sql
.quit
```

