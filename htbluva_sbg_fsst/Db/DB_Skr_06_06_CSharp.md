# 6.6 C#

## Zugriff auf Datenbanken mittels C#

Die Zugriffsinformation auf einen spezielle Datenbankserver kann getestet werden im Visual Studio mittels Menüleiste -> Projekt -> Neue Datenquelle hinzufügen -> ...

Wenn dann eine verbunden wird, kann man sich den Verbindungsstring anzeigen lassen.

In modernen Applikationen wird oft eine lokale Kopie von entfernten Daten abgelegt. Der Vorteil dieser Art ist, dass nicht für jeden einzelnen Zugriff eine Verbindung zur entfernten Datenbank aufgebaut werden muss. Für sehr große Datenbanken oder nicht sehr häufige Zugriffe ist dieses Design allerdings nachteilhaft (viel Speicher notwendig, Zeit für das Kopieren):   **verbindungsloses <-> verbindungsorientiertes Arbeiten**

Die Klassen die sich mit dem Zugriff auf DBs befassen sind im **ADO.NET** Framework. Für Verbindungsloses Arbeiten gibt es Klassen in diversen Namensräumen  in **System.Data** zu finden. Für verbindungsorientiertes Arbeiten gibt es die Provider, für MS-SQL-Server sind die in den Namensräumen **System.Data.SqlClient**. Für alternative Anbieter gibt es weitere Namensräume bzw. müssen zum Teil Erweiterungen von den Datenbankherstellern geladen werden.

### XAMPP-MariaDB-Datenbank (205)

Aus Kompatibilitätsgründen funktioniert die hier angeführte MySQL-Vorgangsweise auch für MariaDB.

#### Vorbereitung (in der DB)

- Die MariaDB-Datenbank zeichnet sich durch eine sehr gute Kompatibilität zur MySQL-Datenbank aus, daher kann für diese DB in C# auf den MySQL-Connector zurückgegriffen werden.
- Für den Zugriff auf die MariaDB-XAMPP-Datenbank muss die DB vorher gestartet werden. Dazu das XAMPP Control-Panel starten und die Module *Apache* und *MySQL* Starten (Apache wird nur benötigt zum begleitenden Steuern mittels phpMyAdmin).
- Eingerichtet kann die DB via Browser mittels Klick auf MySQL-Admin (Start von phpMyAdmin). Um auf die DB zugreifen zu können muss ein Benutzer bekannt sein. Am Besten wird ein neuer Benutzer eingerichtet. Dazu in phpMyAdmin in der Menüleiste **Rechte** auswählen. In der Seite **Benutzerkonto hinzufügen** auswählen und einen Namen (**mgin**) und Passwort (**comein**) eingeben. Für Host wird hier localhost eingegeben, damit kann ausschließlich vom eigenen Rechner darauf zugegriffen werden. Abschließend müssen noch die Rechte eingetragen werden die der Benutzer erhalten soll.

#### Setup Visual Studio

Installation des Connectors (Download: <https://dev.mysql.com/downloads/windows/installer/8.0.html>).

- Erstellen eines C#-Projekts. Für den ersten Test genügt eine Konsolenanwendung.
- In C# wird ein sogenannter Connector benötigt um auf die Datenbank zugreifen zu können. Dazu:
  - Projektmappen-Explorer
  - im Kontext-Menü des Projekts->Hinzufügen->Verweis...->MySql.Data ausgewählen (und anhackerln!) und mit OK bestätigen (für andere Datenbanktypen muss ein entsprechender Connector eingestellt werden).
- Im Programm kann dann `using MySql.Data.MySqlClient;` eingefügt werden.

#### Maria/MySQL-DB Verbinden

Aufbau/Beenden der Verbindung zur DB:

```c#
using MySql.Data.MySqlClient;

...

string conString = "server=localhost; port=3306; username=mgin; password=comein; SslMode=none;";
MySqlConnection con = new MySqlConnection(conString);

con.Open();		// Verbinden

...	// Arbeiten mit der DB

con.Close();	// Trennen der Verbindung
```

Evtl. Benutzer **mgin**/Passwort **comein** anpassen. Der Port 3306 ist der MySQL-Standardport, sofern in MySQL (XAMPP) das nicht verändert wurde stimmt der.

Um Befehle mit dieser DB-Verbindung ausführen zu können wird ein MySqlCommand erzeugt:

```
MySqlCommand sqlCmd = con.CreateCommand();
```

Referenz: (<https://dev.mysql.com/doc/dev/connector-net/8.0/html/T_MySql_Data_MySqlClient_MySqlCommand.htm>)

Wenn in C# Text mit Anführungsstrichen verwendet werden soll, so erfolgt das mittels einfacher Anführungsstriche `'`.

#### SQL-Befehl ohne Query

Zum Ausführen von SQL-Befehlen ohne Auswertung eines Querys bei geöffneter Verbindung:

```c#
sqlCmd.CommandText = @"DROP DATABASE myDb;";
MySqlCommand sqlCmd = new MySqlCommand("DROP DATABASE myDb;", con);    // db loeschen
sqlCmd.ExecuteNonQuery();
```

Nach erfolgter Ausführung wird ein Integerwert zurückgeben der die Anzahl der erfolgreichen Operationen (eingefügte Zeilen ...) angibt oder -1 für nicht erfolgreiche Ausführung.

Zum Abfangen von Exceptions ist `cmd.ExecuteNonQuery()` in einen Try-Catch-Block einzubetten.

#### SQL-Befehl mit Query

Für Querys wird folgende Anweisung verwendet:

```c#
sqlCmd.CommandText = @"SELECT * FROM univerwaltungssystem.professoren;";
MySqlDataReader reader = sqlCmd.ExecuteReader();

while (reader.Read()) {
  Console.WriteLine(reader.GetInt32(0) + "\t" + reader.GetString(1) + "\t" + reader.GetString(2));
  //Console.WriteLine(reader.GetInt32("PersNr") + "\t" + reader.GetString("GName"));

}
```

Referenz: (<https://dev.mysql.com/doc/dev/connector-net/8.0/html/M_MySql_Data_MySqlClient_MySqlCommand_ExecuteReader.htm>)

<https://dev.mysql.com/doc/dev/connector-net/8.0/html/T_MySql_Data_MySqlClient_MySqlDataReader.htm>

Mit den Methoden `GetInt32(i)` oder `GetString(i)` wird das i-te Element entsprechend interpretiert (~schlechte~ Variante), besser `GetString("GName"), damit wird die Name-Spalte geholt unabhängig von der Reihenfolge.

### Access-Datenbank (201)

#### Vorbereitung

- Erzeugen und Speichern einer Beispiel-Access-DB mittels MS-Access und Speichern (.accdb - Datei).
- Damit aus C# mittels OleDB auf eine DB zugegriffen werden kann, wird ein ConnectionString benötigt. Für sämtliche Datenbanken kann dieser von "www.connectionstrings.com" bezogen werden. Für Access findet sich dort etwa: "`Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\myFolder\myAccessFile.accdb;Persist Security Info=False;`". Der Pfad muss durch den Ort der lokalen Access-DB ersetzt werden, z.B. `c:\mydb.accdb`.

#### MS-Access-DB Verbinden

Verbindung Herstellen (Personen1.accdb muss im gleichen Verzeichnis liegen wie die Anwendung, ansonsten absoluten Pfad):

```c#
using System.Data.OleDb;

...
    
String conct = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Daten\Skripten\DB\MSAccess\01_Einfuehrung.accdb;Persist Security Info=False;";
OleDbConnection con = new OleDbConnection(conct);

con.Open();		// Verbinden

... // Arbeiten mit der DB

con.Close();	// Trennen der Verbindung
```

#### SQL-Befehl ohne Query

```c#
con.Open();

OleDbCommand sql = con.CreateCommand();
sql.CommandText = "insert into person(name, [alter]) values('tmp', 45);";
// alter ist ein schluesselwort daher []
sql.ExecuteNonQuery();
con.Close();
```

#### SQL-Befehl mit Query

```c#
con.Open();
OleDbCommand sql = con.CreateCommand();
sql.CommandText = "select * from person;";
OleDbDataReader reader = sql.ExecuteReader();
tbAusgabe.Text = "";
while (reader.Read()) {
  for (int i = 0; i < reader.FieldCount; i++) {
	tbAusgabe.AppendText(" " + reader[i]);  // oder reader["alter"]
  }
  tbAusgabe.AppendText("\r\n");
}
reader.Close();
con.Close();
```

Die innere Schleife ist nur notwendig wenn alle Spalten gelesen werden sollen.

### Microsoft SQL Server Datenbank (202)

#### Vorbereitung (in SQL Server)

Die Konfiguration des MS-SQL-Servers erfolgt mittels *Microsoft SQL Server Managment Studio*. Damit ein Zugriff funktioniert muss der Server-Dienst natürlich gestartet sein, hier als MSSQLSERVER.

#### SQL-DB Verbinden

Als Data-Source muss die Adresse der DB angegeben werden. Mit Initial Catalog wird die DB angegeben auf die Verbunden werden soll. User-ID und Passwort muss mit den eingestellten Parametern der DB übereinstimmen:

```c#
using System.Data.SqlClient;
string conct = @"Data Source=NBI-RSCHRAGL;Initial Catalog=Northwind;User ID=sa;Password=passwort";

SqlConnection con = new SqlConnection(conct);
con.Open();		// Verbinden

... // Arbeiten mit der DB

con.Close();	// Trennen der Verbindung
```

#### SQL-Befehl ohne Query

Erstellen einer Tabelle:

```c#
con.Open();

SqlCommand sql = con.CreateCommand();
sql.CommandText = "CREATE TABLE myTab(myVal INT);";
sql.ExecuteNonQuery();

con.Close();
```

#### SQL-Befehl mit Query

Daten aus DB lesen:

```c#
con.Open();

SqlCommand sqlCmd = new SqlCommand("SELECT * FROM [dbo].[Testtabelle];", con);
SqlDataReader reader = sqlCmd.ExecuteReader();

tbAusgabe.Text = "";
tbAusgabe.Text = reader.GetName(0) + "\t" + reader.GetName(1) + "\r\n";

while (reader.Read()) {
  tbAusgabe.Text += reader.GetInt32(0) + "\t" + reader.GetString(1) + "\r\n";
}
reader.Close();

con.Close();
```

Die Daten werden im Textbox-Fenster tbAusgabe ausgegeben.

## Referenzen

- Connection Strings für Datenbanken:
  www.connectionstrings.com
- MySQL Befehls Referenz:
  https://dev.mysql.com/doc/dev/connector-net/8.0/html/T_MySql_Data_MySqlClient_MySqlCommand.htm
- Einführung in ADO.NET:
  <https://www.youtube.com/watch?v=aoFDyt8oG0k&list=PL6n9fhu94yhX5dzHunAI2t4kE0kOuv4D7>

- Tiefgehende C#-Datenbank Einführung für SQL-Server (Bernhard Baltes-Götz C# Skriptum V4):
  <https://www.uni-trier.de/fileadmin/urt/doku/csharp/v40/csharp4.pdf>
- MySQL-Namespace:
  <https://dev.mysql.com/doc/dev/connector-net/8.0/html/N_MySql_Data_MySqlClient.htm>