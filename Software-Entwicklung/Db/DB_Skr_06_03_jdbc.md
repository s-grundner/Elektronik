# 6.3 Java Database Connectivity JDBC

Ähnlich der ODBC-Idee gibt es für Java eine Zwischenschicht - JDBC. Diese Schicht bietet ein einheitliche [Schnittstelle](../../digitaltechnik/{MOC}%20Schnittstellen.md) für die Anwendungsentwicklung an, womit die Anwendung unabhängig von der konkreten DB wird.

## [MySQL](DB_Skr_04_Sql.md) - Setup

Um den Ablauf zu zeigen wird das am [MySQL](DB_Skr_04_Sql.md)-Treiber gezeigt.

Java kann auf SQL-Datenbanken mittels eines Datenbankabhängigen Treibers zugreifen. Der Vorteil dieser Idee ist, dass bei Änderungen an der Datenbank oder einem Umstieg auf eine andere Datenbank nur auf einen passende Treiber umgestellt werden muss und das Programm gleich bleiben kann.

Der Treiber muss im richtigen Verzeichnis liegen oder CLASSPATH muss entsprechend angepasst werden. In Eclipse: Projekt->Eigenschaften->Konfiguration Bearbeiten->Klassenpfad->Benutzereingänge->Externe JARs hinzufügen->C:\program files\java\jdk1.8.0_181\lib\mysql-connector...jar

Für ältere Treiber (beispielhaft **mysql-connector-java-5.1.35-bin.jar**) wird die DB-URL so angegeben:

```java
String sDbUrl="jdbc:mysql://localhost:3306/is_uni";
```

Für neuere Treiber (beispielhaft **mysql-connector-java-8.0.13.jar**) muss die Zeit-Zone des DB-Servers mit angegeben werden:

```java
String sZone = "?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
String sDbUrl="jdbc:mysql://localhost:3306/is_uni" + sZone;
```

Für das entsprechende Projekt muss der gewählte Treiber (Connector) angegeben werden, in Eclipse: Project->Properties->Java Build Path->Add External JARs...->Auswahl der jar.

Ablage im Projekt-Verzeichnis oder im JDK-Verzeichnis.

## IntelliJ-IDEA

In IntelliJ-IDEA ist es hilfreich das Database-Navigator-Plugin zu installieren (File->Settings->Plugins ...). Für die Ultimate-Variante gibt per JetBrain ein Plugin.

Download den letzten Treiber von https://mariadb.com -> Download -> Connector -> Java-Connector. Die Jar-Datei im Projekt ablegen und referenzieren:

File->ProjectStructure->ProjectSettings->Modules->Dependencies->jar-Datei referenzieren.

## Maven

Mittels Maven kann für MariaDB gesetzt werden:

```
<dependencies>
    <dependency>
        <groupId>org.mariadb.jdbc</groupId>
        <artifactId>mariadb-java-client</artifactId>
        <version>3.0.8</version>
    </dependency>
</dependencies>
```

## DB-Zugriff

Verbinden mit der Datenbank *localhost:3306/is_uni* und den entsprechenden Zugriffsdaten. Es werden sämtliche Werte von bis zu 4 Spalten ausgegeben.

```java
import java.sql.*;

public class Hauptprog {
    public static void main(String[] args) throws Exception {
        String sDbUrl="jdbc:mysql://localhost:3306/is_uni";  //siehe Oben für neue Vers.
        String sUsr="root";
        String sPwd="";
        String sTable="professoren";

        Connection conn;
        Statement stmt;
        ResultSet rslt;

        conn = DriverManager.getConnection( sDbUrl, sUsr, sPwd );
        stmt = conn.createStatement();
        rslt = stmt.executeQuery("SELECT * FROM " + sTable);

        while( rslt.next() ) {
            System.out.printf("%-6s %-15s %-4s %-4s\n", rslt.getString(1), rslt.getString(2), rslt.getString(3), rslt.getString(4));
        }
        conn.close();
    }
}
```

In diesem Beispiel wird auf die angeführte Tabelle *sTable* in einer Datenbank *sDbUrl* zugegriffen und mit dem SQL-Befehl

```sql
SELECT * FROM professoren;
```

der komplette Inhalt abgerufen. Die Befehlsangabe erfolgt immer via der *Statement*-Methode *executeQuery* und das Ergebnis wird als *ResultSet* Objekt zurückgegeben. In diesem Beispiel werden ohne Prüfung die ersten 4 Spalten ausgegeben (die muss es in der Datenbank geben).

Mit entsprechender Bedatung kann das das Ergebnis dann so aussehen:

```
2125   Sokrates        226  c4  
2126   Russel          232  c4  
2127   Kopernikus      310  c3  
2133   Popper          52   c3  
2134   Augustinus      309  c3  
2136   Curie           36   c4  
2137   Kant            7    c4  
2138   Berger          214  c4
```

**SQL-Befehle ohne Tabellen-Antwort**

Befehle ohne Antwort können mit *executeUpdate* aufgerufen werden:

```java
Connection conn = DriverManager.getConnection( sDbUrl, sUsr, sPwd );

Statement stmt = conn.createStatement();
String str = "INSERT INTO tab1 (col1, col2) VALUES ('abc', 123);";

stmt.executeUpdate(str);
```

oder:

```java
Connection conn = DriverManager.getConnection( sDbUrl, sUsr, sPwd );
Statement stmt = conn.createStatement();

PreparedStatement st = conn.prepareStatement("DELETE FROM tab1 WHERE name = ?;");
st.setString(1,"joe");

st.executeUpdate();     // das "preparete" Statement wird ausgefuehrt
```

## [SQLite](DB_Skr_04_Sql.md)

Bis auf den Connector funktioniert der Zugriff auf eine SQLite-DB vollkommen identisch wie mit einer MySQL-DB.

- Download Connector (gilt für sämtliche OS):  https://mvnrepository.com/artifact/org.xerial/sqlite-jdbc  (hier sqlite-jdbc-3.39.3.0.jar).

- Ablegen unter `C:\Program Files\Java\jdk1.8.0_181\lib` (oder wohin auch immer später konfiguriert wird, eventuell direkt im Projekt).

- Unter den Einstellungen für das Java-Projekt wird dieser Connector hinzugefügt.

- Alternativ: Connector-Jar mittels Maven:
  
  ```
  <!-- https://mvnrepository.com/artifact/org.xerial/sqlite-jdbc -->
  <dependency>
      <groupId>org.xerial</groupId>
      <artifactId>sqlite-jdbc</artifactId>
      <version>3.39.3.0</version>
  </dependency>
  ```

- Anschließend kann für obige [MySQL](DB_Skr_04_Sql.md)-Beispiele der Connector angepasst werden:
  
  ```java
  String sDbUrl="jdbc:sqlite:c:\\myDir\\is_uni.db";
  ```
  
   Damit ist keine weiter Änderung notwendig.
