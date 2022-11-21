# 6.4 Open Database Connectivity ODBC

Ein ODBC-Treiber bietet eine Programmierschnittstelle für Datenbanksysteme. Mit dieser standardisierten Schnittstelle kann mittels SQL auf unterstützte Datenbanken zugegriffen werden. Der Vorteil von dieser Lösung ist, dass eine DB-Anwendung unabhängig von der speziellen Datenbank entwickelt werden kann. Die Einstellung auf die spezifische Datenbank erfolgt im Treiber.

## MySQL-DB

### Treiber-Einstellung am Beispiel MySQL-DB

Für die verwendete MySQL-Datenbank muss ein 32-Bit-ODBC-Treiber installiert werden. Dieser kann einfach im Internet bezogen werden. Für *Windows/MySQL* etwa unter https://cdn.mysql.com//Downloads/Connector-ODBC/8.0/mysql-connector-odbc-8.0.18-win32.msi.

Nach der Installation des notwendigen Treibers wird dieser mit `odcbad32.exe` gestartet (ODBC-Datenquellen-Administrator) für 32 Bit. Im Reiter *System-DSN* wird eine Datenquelle hinzugefügt. Es wird der entsprechende Treiber (MySQL ODBC 8.0 ANSI Driver) ausgewählt. Für die zu verbindende Datenbank werden nun die Einstellungen getätigt:

```
Data Source Name: 	myOdbc
TCP/IP: 			localhost
Port:				3306
User:				root
Password:			
Database:			is_uni
```

Die Werte müssen für die konkrete Anwendung angepasst werden. Die Datenbank kann nur ausgesucht werden, wenn eine Verbindung über die eingestellten Parameter möglich ist. Die hier frei gewählte Bezeichnung *myOdbc* wird später für die Verbindung benötigt.

### C Beispielprogramm (300,301)

In diesem einfachen Beispiel werden sämtlicher Datensätze einer Tabelle gelesen und in der Kommandozeile ausgegeben. Es wird davon ausgegangen, dass das erste Element des Datensatzes eine Nummer ist (num). Für die Funktion muss eine ODBC-Verbindung mit dem Namen `lokaleSqLiteDb` angelegt werden:

```c
#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include <odbcinst.h>
#include <sql.h>
#include <sqlext.h>
#include <string.h>

...

SQLCHAR _odbcName[] = "lokaleSqLiteDb";    // Name of the ODBC-Treibers
SQLCHAR _dbUser[] = "root";
SQLCHAR _dbPw[] = "";
SQLCHAR sqlStatement[256]= "SELECT * FROM kunden";

SQLHENV   henv  = SQL_NULL_HENV;   // Environment
SQLHDBC   hdbc  = SQL_NULL_HDBC;   // Connection handle
SQLHSTMT  hstmt = SQL_NULL_HSTMT;  // Statement handle
SQLRETURN retcode;

// Allocate environment handle
SQLAllocHandle(SQL_HANDLE_ENV, SQL_NULL_HANDLE, &henv);
// Set the ODBC version environment attribute
SQLSetEnvAttr(henv, SQL_ATTR_ODBC_VERSION, (SQLPOINTER*)SQL_OV_ODBC3, 0);

// Allocate connection handle
SQLAllocHandle(SQL_HANDLE_DBC, henv, &hdbc);
// Set login timeout to 5 seconds
SQLSetConnectAttr(hdbc, SQL_LOGIN_TIMEOUT, (SQLPOINTER)5, 0);

// Connect to data source <<<<< hier Paramter anpassen
SQLConnect(hdbc, _odbcName, SQL_NTS, _dbUser, SQL_NTS, _dbPw,SQL_NTS);

// Allocate statement handle.
SQLAllocHandle(SQL_HANDLE_STMT, hdbc, &hstmt);
// Execute the command.
SQLExecDirect(hstmt, sqlStatement, SQL_NTS);

while (SQLFetch(hstmt) == SQL_SUCCESS) {
	SQLLEN lenNum;
    SQLINTEGER num;
	SQLGetData(hstmt, 1, SQL_C_LONG, &num, 0, &lenNum);
	printf("%6i\n", num);
}
              
SQLFreeHandle(SQL_HANDLE_ENV, henv);
```

In diesem Beispiel wird vollkommen auf eine Fehlerprüfung verzichtet. Sämtliche Funktionen geben einen SQLRETURN-Returncode zurück. Dieser kann ausgewertet werden.

Für die Parameter henv, hdbc und hstmt wird jeweils ein Allozieren mittels `SQLAllocHandle` vorgenommen.

Für den Build-Prozess muss mit der Option `-lodbc32` kompiliert zu werden:

```
gcc main.c -o readDb.exe -lodbc32
```

Alternativ im CMake folgende Zeile einfügen:

```
LINK_LIBRARIES(odbc32)
```

### Qt-C++ Beispiel (503)

Mit obigen Einstellungen mittels Qt:

- das Qt-Projekt (pro-Datei) muss sql laden:

  ```
  QT += sql
  ```

- Cpp:
  es gibt viele Varianten via ODBC zuzugreifen: es wird die Treiberbezeichnung benötigt (*MySQL ODBC 8.0 ANSI Driver*)...

  ```c++
  #include <QCoreApplication>
  #include <QDebug>
  
  #include <QtSql>
  
  using namespace std;
  
  int main(int argc, char *argv[])
  {
      QCoreApplication a(argc, argv);
  
      QSqlDatabase db = QSqlDatabase::addDatabase("QODBC3");
      QString connectString = QStringLiteral(
          "DRIVER=MySQL ODBC 8.0 ANSI Driver;"
  // wenn Aenderungen von ODBC-Treiber-Einstellungen notwendig:
  //        "NAME=myOdbc;" 
  //        "DATABASE=is_uni;"
  //        "SERVERNODE=localhost:3306;"
            "UID=root;"
            "PWD=;"
          "SCROLLABLERESULT=true");
      db.setDatabaseName(connectString);
  
      if (!db.open()) qDebug() << db.lastError().text();
  // mit is_uni kann hier direkt in anderes Schema verlinkt werden
      QSqlQuery query = db.exec("SELECT * FROM is_uni.professoren;");
  
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

- Alternativ:

  ```c++
  #include <QCoreApplication>
  #include <QDebug>
  
  #include <QtSql>
  
  using namespace std;
  
  int main(int argc, char *argv[])
  {
      QCoreApplication a(argc, argv);
  
      QSqlDatabase db = QSqlDatabase::addDatabase("QODBC3");
      db.setDatabaseName("DataSourceName");				// hier wird der benannte ODBC-Treiber gewaehlt
  
      if (!db.open()) qDebug() << db.lastError().text();
  // mit is_uni kann hier direkt in anderes Schema verlinkt werden
      QSqlQuery query = db.exec("SELECT * FROM is_uni.professoren;");
  
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


## SQLite

Für SQLite gibt es ebenfalls Treiber, beispielhaft für Windows:

https://www.devart.com/odbc/sqlite/DevartODBCSQLite.exe

dieser Treiber ist frei allerdings nur für 30 Tage lizenziert.

Freie Alternative:

http://www.ch-werner.de/sqliteodbc/

### Qt-C++ / SQLite Beispiel (504)

Im obigen Qt-Beispiel muss lediglich der Connection-String angepasst werden (das ist ja die Idee von ODBC):

```c++
QSqlDatabase db = QSqlDatabase::addDatabase("QODBC3");
QString connectString = QStringLiteral(
  "DRIVER={Devart ODBC Driver for SQLite};"
  "Database=C:/.../is_uni.db;"
);
```

Ansonsten kann das obige Beispiel direkt übernommen werden. In SQL-Anweisungen muss die Angabe des Schemas unterlassen werden, in einer SQLite-Datei ist ja immer nur ein einzelnes Schema:

```c++
QSqlQuery query = db.exec("SELECT * FROM is_uni.professoren;");
```

hier muss `is_uni` entfernt werden.

## MS-Access / Qt

Auch auf eine MS-Access-DB kann mittels ODBC zugegriffen werden. Dabei wird auf die *.accdb* (früher auf die *.mdb*) Datei zugegriffen.

Aus Qt ist wichtig, dass für 32Bit-Anwendungen ein 32Bit-ODBC-Treiber und für 64Bit-Anwendungen ein 64Bit-ODBC-Treiber für MS-Access vorhanden ist. Leider lassen sich (auf einfache Weise) nicht beide Varianten gleichzeitig installieren.

Die Treiber können via:

https://www.microsoft.com/de-at/download/details.aspx?id=13255

bezogen werden.

Wenn der Treiber installiert wurde, dann kann via Qt / ODBC auf die DB zugegriffen werden:

```c++
QSqlDatabase m_db =  QSqlDatabase::addDatabase("QODBC");
qDebug() << m_db.lastError();

m_db.setDatabaseName("Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=C:/temp/myDb.accdb;Uid=Admin;Pwd=;");
```

Der *Connector-String* (letzte Zeile) kann bezogen werden:
https://www.connectionstrings.com/microsoft-access-accdb-odbc-driver/

## Referenz

- https://www.easysoft.com/developer/languages/c/examples/index.html
- https://docs.microsoft.com/de-de/sql/odbc/reference/syntax/odbc-reference?view=sql-server-2017

