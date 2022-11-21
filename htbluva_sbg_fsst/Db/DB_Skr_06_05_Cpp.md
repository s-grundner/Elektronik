# 6.5 C++

In C++ kann via ODBC (genau wie in C) auf eine DB zugegriffen werden. Es gibt für alle bedeutenden Datenbanken auch direkt C/C++-Treiber, diese weichen allerdings sehr stark voneinander ab. Aus diesem Grund ist eine ODBC Anbindung auf alle Fälle zu empfehlen.

## Zugriff auf Datenbanken aus Qt-C++

Der direkte Zugriff auf Datenbanken aus C++ ist stark von den verwendeten Treibern und der verwendeten Umgebung abhängig. Üblicherweise müssen dafür Treiberbibliotheken während der Laufzeit eingebunden werden.

Im QT-Framework sind Treiber für gängige Datenbanken vorhanden.

### Qt - SQLite (501)

In der Projektkonfiguration für QTCreator muss im Projekt die Option sql ergänzt werden:

```
QT += sql
```
Im Source müssen diese Bibliotheken dazu geladen werden:
```
#include <QtSql>
#include <QtSql/QSqlQuery>
```

Für die Initialisierung:

```
QSqlDatabase myDb = QSqlDatabase::addDatabase("QSQLITE");
myDb.setDatabaseName("c:/.../is_firma.db");        // Location of DB-File

if (myDb.open()) {																	// Open and Check for Access
	...// Connection established
} else ...// Fehler
```

Für ein Query:

```c++
QSqlQuery query;
query.exec("SELECT name, salary FROM employee WHERE salary > 50000");
```

Für DDL-Befehle genügt das. Mit exec (Execute) wird der Query ausgeführt. Für Abfragen (DML), die eine Tabelle zurückgeben, muss in Folge mit *next* gearbeitet werden:

```c++
// Standard-Init
QSqlDatabase myDb = QSqlDatabase::addDatabase("QSQLITE");
myDb.setDatabaseName("c:/temp/sqllite/is_firma.db");        // Location of DB-File

if (myDb.open()) {																	// Open and Check for Access
	// Connection established
}

QSqlQuery query("SELECT * FROM angestellte");				// Configure Query

// Optional: query.exec();

QString str = "";
for (int i = 0; i < query.record().count(); i++) {		// Column-Names
	str += query.record().fieldName(i) + "\t";
}
str += "\n";
while (query.next()) {
	for (int i = 0; i < query.record().count(); i++) {	// Values
  	str += query.value(i).toString() + "\t";
  }
	str += "\n";
}
// Output str ....

myDb.close();
```

In einem Record ist eine ganze Zeile der Tabelle enthalten. Mit *value(i)* kann die i-te Spalte ermittelt werden. Um zu wissen was in welcher Spalte ist gibt es die *fieldName(i)*.

### ModelView

Mittels einem Design-Pattern ähnlich dem Model-View-Control lässt sich in Qt komfortabel ein DB-Inhalt anzeigen. Die Idee des Patterns: möglichst starke Trennung der Daten und der Anzeige. In Qt gibt es mehrere Möglichkeiten, hier wird lediglich eine gezeigt:

```c++
QSqlDatabase myDb = QSqlDatabase::addDatabase("QODBC3");       //Wir wollen mit ODCB zugreifen
QString connectString = QStringLiteral(
    "DRIVER={MySQL ODBC 8.0 ANSI Driver};UID=root;PWD=;SCROLLABLERESULT=true;DATABASE=4ahbg_projekt");
myDb.setDatabaseName(connectString);
if (!myDb.open()) qDebug() << myDb.lastError().text();         //Versucht die Datei zu öffnen, sonst Fehler

// Erstellen des Modells - Verknüpfen mit der DB (hier myDb)
QSqlTableModel *model = new QSqlTableModel(this, myDb);
model->setTable("personal");			                        // Tabelle personal in der gewählten DB
model->setEditStrategy(QSqlTableModel::OnManualSubmit);			// <-- Siehe Unten
model->select();                                                // "Holvorgang"
model->setHeaderData(0, Qt::Horizontal, tr("Personal-Nummer"));	// Beschriftung der Spalten
model->setHeaderData(1, Qt::Horizontal, tr("Name"));            // sonst werden die Standardwerte
model->setHeaderData(2, Qt::Horizontal, tr("Abteilungsnummer"));// Übernommen

ui->myTable->setModel(model);									// QTableView auf der UI
ui->myTable->hideColumn(0); // don't show the ID				// Standard: Einfügen eines Index
```

In diesem Beispiel gibt's in der MySQL-Datenbank ein Schema `4ahbg_projekt` und darin eine Tabelle `personal`.

Alternativ gibt's ähnlich dem hier gezeigten `QSqlTableModel` ein `QSqlQueryModel`, dann wird nicht die vorhandene Tabelle angezeigt, sondern das Ergebnis des Queries:

```c++
QSqlQueryModel *model = new QSqlQueryModel(this, myDb);
QSqlQuery qry;
qry.exec("Select pname from personal");        
model->setQuery (qry);
```

Die Model-View-Struktur hat den großen Vorteil, dass mittels Qt-Framework der gesamte DB-Schreib-/Lese-Zugriff erledigt wird. Mit der Einstellung

```c++
model->setEditStrategy(QSqlTableModel::OnManualSubmit);
```

kann gesteuert werden wie sich Änderungen in der Tabelle auswirken. Mit dieser Einstellung werden die Änderungen im UI erst übernommen wenn `modell->submitAll()` aufgerufen wird.  Wird die Zeile weggelassen, dann wird bei einer Veränderung in der Tabelle (View) automatisch in der Datenbank angepasst.

Um die Daten in der dargestellten Tabelle aus der DB upzudaten muss `modell->select()` aufgerufen werden.

### InMemory-DB (504)

SQLite ist eine Ein-Datei-Datenbank. Außerdem kann mit SQLite eine *InMemory*-Datenbank erzeugt werden. Das bedeutet die Datenbank wird nur im flüchtigen Speicher abgelegt. Dadurch können eine Vielzahl an Festplattenzugriffe eingespart werden (Effizienz).

Im obigen Programm muss dafür nur anstatt des DB-Pfades *:memory:* `myDb.setDatabaseName(":memory:");` eingetragen werden. Die DB wird bei Beendigung des Programms automatisch gelöscht.

```c++
#include <QCoreApplication>
#include <QDebug>

#include <QtSql>


using namespace std;

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");    // SQLite Treiber
    QString connectString =
                            ":memory:"
                            //"C:/temp/sqllite/sqlite-tools-win32-x86-3290000/is_uni.db"             ;

    // Oeffnen
    db.setDatabaseName(connectString);
    if (!db.open()) qDebug() << db.lastError().text();

    QSqlQuery query;

    db.exec("CREATE TABLE Professoren("
            "    PersNr INT PRIMARY KEY NOT NULL,"
            "    GName VARCHAR(255) NOT NULL,"
            "    Raum VARCHAR(20),"
            "    Rang VARCHAR(10),"
            "    GebDatum DATE NOT NULL"
            ");");

    db.exec("INSERT INTO Professoren(PersNr, GName, Rang, Raum, GebDatum)"
            " VALUES (2125, 'Sokrates', 'c4', 226, '1940-12-13');");
    db.exec("INSERT INTO Professoren(PersNr, GName, Rang, Raum, GebDatum)"
            " VALUES (2126, 'Russel', 'c4', 232, '1942-12-13');");
    db.exec("INSERT INTO Professoren(PersNr, GName, Rang, Raum, GebDatum)"
            " VALUES (2127, 'Kopernikus', 'c3', 310, '1941-02-14');");
    db.exec("INSERT INTO Professoren(PersNr, GName, Rang, Raum, GebDatum)"
            " VALUES (2133, 'Popper', 'c3', 052, '1940-12-17');");
    db.exec("INSERT INTO Professoren(PersNr, GName, Rang, Raum, GebDatum)"
            " VALUES (2134, 'Augustinus', 'c3', 309, '1940-12-24');");
    db.exec("INSERT INTO Professoren(PersNr, GName, Rang, Raum, GebDatum)"
            " VALUES (2136, 'Curie', 'c4', 036, '1939-01-01');");
    db.exec("INSERT INTO Professoren(PersNr, GName, Rang, Raum, GebDatum)"
            " VALUES (2137, 'Kant', 'c4', 007, '1940-07-13');");
    db.exec("INSERT INTO Professoren(PersNr, GName, Rang, Raum, GebDatum)"
            " VALUES (2138, 'Berger', 'c4', 214, '1926-06-20');");

    // Select-Query
    query = db.exec("SELECT * FROM professoren;");

    // While query is successful
    QString qstr("");
    for (int i = 0; i < query.record().count(); i++) {
        qstr += QString("%1").arg(query.record().fieldName(i),15);
    }
    qstr += "\n";
    while (query.next()) {
       for (int i = 0; i < query.record().count(); i++) {
           qstr += QString("%1").arg(query.value(i).toString(),15);
       }
       qstr += "\n";
    }
    db.close();

    qDebug() << qstr.toStdString().c_str(); qstr="";
}
```



