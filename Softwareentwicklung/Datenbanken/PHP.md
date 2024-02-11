---
tags:
  - DB
aliases:
  - Personal Home Page Tools
  - Hypertext Preprocessor
created: 29. November 2022
---

# PHP

Hypertext Preprocessor (vormals Personal Home Page Tools)

- Skript-Sprache (wird mittels Interpreter ausgeführt)
- Freie Software unter PHP-Lizenz (freie Veränderung und Verwendung)
- Starke Unterstützung von Datenbanken
- Variablen werden nicht deklariert und können ihren Typ während der Laufzeit verändern.
- Der Quelltext wird NICHT AN den Webbrowser übermittelt, sondern direkt auf dem Server interpretiert.  
  Das Skript kann daher eine angeforderte Seite auf Serverseite verändern und Senden. Daher wird zur Ausführung wird ein Webserver (etwa Apache) und PHP (Interpreter, Bibliotheken …) benötigt. Werden Datenbankzugriffe ebenfalls benötigt, gibt es für diese gesamte Toolkette fertige Pakete - etwa XAMPP.
- PHP kann direkt in html integriert werden

# Vorbereitung

- Installation von XAMPP
- Zur möglichen Ausführung muss der XAMPP-Apache-Server laufen. Im Control-Panel wird dazu Apache auf Starten gesetzt (für DB-Zugriffe muss auch MySQL gestartet werden).
- Php-Skripte müssen unter c:\xampp\htdocs (sofern das Standardinstallationsverzeichnis c:\xampp akzeptiert wurde) abgelegt werden, dann können sie mittels Browser unter folgender URL aufgerufen werden: localhost/helloworld.php.

# HTML

PHP wird *üblicherweise* in HTML eingebettet. Ein Browser bekommt eine HTML-Seite von einem Server direkt (als Quelltext) gesendet. Die Interpretation (Darstellung) übernimmt der Browser. Für eine Datenbank-Anwendung ist es häufig notwendig Daten vom Benutzer einzulesen und an den Server zu senden. Diese Vorgehensweise wird gut von Formularen unterstützt.

## Form

Es wird *formulare.html* angelegt:

```php+HTML
<form action="formulare.php" method="post">
    <p>Server: <input type="text" size="20" name="server"/></p>
    <p>Database: <input type="text" size="20" name="db"/></p>
    <p>User: <input type="text" size="20" name="user" value="Uni"/></p>
    <p>Password: <input type="password" size="20" name="pw"/></p>
    <p><input type="submit" value="Start"/></p>
</form>
```

Beim Öffnen mit einem Browser werden diese Felder dargestellt (exakte Darstellung hängt vom Browser ab):

![einf_001.png](assets/php_einf_001.png)

In diesem Beispiel werden mit Drücken des Start-Buttons die Daten der vier Felder (Server/Datenbank/User/Passwort) an formulare.php (kommt weiter unten) übertragen.

- **form** Erstellt im HTML einen Formular-Bereich. Als Attribut ist hier **action** angeführt. Damit wird eine URL angegeben an welche die Daten des Forms gesendet werden sobald ein *submit* erfolgt. Als **method** gibt es post und get. Das beschreibt die Methode auf welche die Daten gesendet werden.
- **input**-Tags: Felder für Benutzer-Eingaben.
  - Mit **type** wird die Art der Eingabe angegeben. Es gibt: text (Textfelder), submit (Button zum Senden von Daten), [radio](../../HF_Technik/Rundfunk.md) (Radiobutton), checkbox (Checkboxen), password (wie Textfeld, Text wird nicht angezeigt), hidden (nur Übertragung von Daten)
  - Mit **value** können vorgegebene Werte mitgegeben werden
  - Mit **name** wird jedes Feld bezeichnet. Damit können gesendete Daten zugeordnet werden

In einfachen Formularen genügt eine Schaltfläche, die Action wird im Form-Tag angeführt. Für Forms mit mehreren Schaltflächen, die auf unterschiedliche PHP-Dateien verzweigen sollen, wird die Action direkt beim Input angeführt:

```html
<input type="submit" value="GO" formaction="Go.php" formmethod="post">
```

Button auf Link:

```html
<input type="button" value="Zurück" onclick="window.location='index.html'">
```

## Select-Liste

(kann auch in einem Form verwendet werden, mittels $_POST[list] wird dann der gewählte Wert zurückgegeben):

```php+HTML
<label>
    <select name="list" size="10">
        <option>Bruno</option>
        <option>Helgo</option>
        <option>Sandi</option>
    </select>
</label>
```

mit `<option value="val1">langer Text</option>` kann ein verschiedener Rückgabewert zurückgegeben werden. Wird das Form als Übergabe in ein PHP verwendet sind die Werte mit `$_POST['list'] == "Bruno"` prüfbar.

Mit einem css-Tag kann die Breite oder eine Scrollbar manipuliert werden:

` …size="10" style=width:300px;overflow:auto;>` 

## Table

```php+HTML
<table align="left" style="width:30%">
    <tr>
        <th align="left">Titel 1</th>
        <th align="left">Titel 2</th>
    </tr>
    <tr>
        <td>Val 1</td>
        <td>val 2</td>
    </tr>
    <tr>
        <td>Val 3</td>
        <td>val 4</td>
    </tr>
</table>
```

# PHP

Damit PHP-Dateien in einem Browser das gewünschte Ergebnis zeigen, wird ein Compiler/Interpreter benötigt. PHP ist eine Sprache die auf dem Server compiliert und interpretiert wird. Daher muss für das Testen/Ausführen von PHP-Dateien eine entsprechende Umgebung eingerichtet sein. Wir verwenden dafür XAMPP. Dieses Paket beinhaltet einen Webserver (Apache) und PHP.

- im XAMPP Control Panel wird der Webserver gestartet
- im Verzeichnis `c:\xampp\htdocs\` werden HTMLund PHP-Dateien abgelegt.
- mittels Browser kann auch von lokal darauf zugegriffen werden: `localhost\formulare.html`  
  Einfache html-Dateien können natürlich auch direkt im Browser dargestellt werden. Beim Anwählen einer einfachen Seite im Internet wird ja ebenfalls der pure html-Code dem Browser lokal zur Verfügung gestellt. PHP-Dateien werden im Gegensatz dazu vom Server verarbeitet und das resultierende html an den Browser geschickt.

Mit der einfachen PHP-Datei `formulare.php`:

```php+HTML
<?php
    echo $_POST['server'];
?>
```

Wird im Browser der Wert aus dem *Server*-Formular-Eingabe-Feld ausgegeben. Der PHP-Code wird bei Anforderung auf dem Server ausgeführt und das Ergebnis (hier nur das was hinter echo kommt) an den Browser gesendet.

Für html-Formulare die method="post" verwenden, sind die Werte der Formular-Felder im PHP verfügbar. Sie liegen in einem **assoziativen** Feld namens `$_POST`. Um den Wert des Feldelements mit Namen Server zu bekommen: `$_POST['server']`. Anders wie bei einem einfachen Array wird nicht mittels nummerischen Index zugegriffen sondern mittels einem Namen.

Der echo Befehl gibt einfach einen Text zurück, in diesem Fall den Wert des Server-Felds. Um die Form der Anzeige zu steuern kann man sich HTML-Code bedienen: 

```php+HTML
<?php
    echo "<p>***".$_POST['server']."***</p>";
?>
```

Üblicherweise wird Text nicht *so roh* ausgegeben, daher kann der gesamte PHP-Code in ein HTML eingebettet werden:

```php+HTML
<html>
    <head>
        <title>Erstes PHP-Beispiel</title>
    </head>
    <body>
        <center><h1>Ausgabe der Formulardaten</h1></center>
        <p><strong>Servername:</strong>
            <?php echo $_POST['server'];?>
        </p>
    </body>
</html>
```

- PHP-Code kann überall im HTML-Code eingebettet werden
- PHP-Code beginnt immer mit `<?php` und endet mit `?>`
- wenn PHP-Code in einer HTML-Datei eingebettet wird, dann wird die Datei mit *.php benannt.

## Übersicht

- Eingrenzung `<?php … ?>`

- Kommentare: `<!--` bis `-->`

- Datentypen: int, bool, double, string, array, object

- Variablen: Benennung von Variablen erfolgt IMMER mit führendem `$` - `$Var`

- Operatoren: zusätzlich zu den Bekannten gibt es `===` und `!==`

- Deklaration von Variablen: nicht erforderlich, Datentyp wird automatisch aus der Verwendung erschlossen

- Um den Zeichensatz einzustellen muss am Beginn des PHP-Skripts der gleiche Zeichensatz eingestellt werden wie in der verwendeten Datenbank (etwa um Umlaute/Sonderzeichen richtig darzustellen):
  
  ```php+HTML
  header("Content-Type: text/html; charset=utf8_general_ci");
  ```

Da sich Datentypen aus dem Kontext bestimmen kann `liefert 2=="2"` ein wahres Ergebnis. Um zu überprüfen ob der Datentyp und der Wert identisch ist, wird mittels `===` bzw. `!==` Operator geprüft.

## Felder

```php
$feld = array(0, 2, 4, 5, 6);
$feld[] = 7;                <!-- 7 wird hinten angefuegt -->
$feld[20] = 10;                <!-- 10 wird an 20 eingefuegt, dazwischenliegende leer --> 

foreach ($feld as $wert)    <!-- Element fuer Element kommt in $wert -->
    echo "<p>$wert</p>";
```

Felder sind Wertpaare, sie bestehen aus jeweils einem Index und einem Wert. Der Index muss keine Nummer sein, er kann genauso gut ein String sein (assoziative Felder):

```php
$feld = array(0=>0, 3=>7, "jim"=>4, "John"=>"Bill");
echo count($feld);            <!-- Anzahl der Elemente - hier 4 -->
echo $feld["John"];            <!-- Bill -->
echo $feld[3];                <!-- 7 -->
```

## Datenbank

### Aufbau Der Verbindung

Es gibt viele verschieden Hersteller von Datenbanken. Um den Zugriff aus PHP trotzdem einheitlich zu gestalten, ist in PHP eine zusätzliche Abstraktionsebene verfügbar: **PHP Data Object (PDO)**. Damit kann Software unabhängig vom Datenbankhersteller entwickelt werden, es muss lediglich ein entsprechender Treiber verfügbar sein (zum Beispiel php_pdo_mysql.dll). Aktiviert wird der Treiber in der Serverumgebung (dort läuft ja das PHP) in der php.ini-Datei, dort wird diese Zeile eingefügt:

```ini
extension=php_pdo_mysql.dll
```

Zum Herstellen der Verbindung (Server, User, Passwort entsprechend anpassen):

```php+HTML
$conn = new PDO("mysql:host=localhost;mydb","schueler","comein");
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$conn->setAttribute(PDO::ATTR_CASE, PDO::CASE_UPPER);
$conn->beginTransaction();        // bis commit
```

Für die Verbindung ist nur die erste Zeile erforderlich. Mit dem `$conn`-Objekt werden anschließend Attribute gesetzt und eine Transaktion gestartet. Das `$conn`-Objekt ist die Verbindung zur Datenbank (das PDO-Objekt).

### Select in Datenbank (Lesen)

Um einen SQL-Befehl (genauer eine Abfrage) abzusetzen wird ein Query ausgeführt. Zurückgegeben wird ein PDOStatement (\$stmt):

```php+HTML
$sql = "SELECT * FROM mydb.Mytable";
$stmt = $conn->query($sql);
$row = $stmt->fetch();
echo $row['COL1'];
```

mit jedem `fetch()` wird (maximal!) eine komplette Zeile der Ergebnistabelle zurückgegeben. Wenn keine Zeile erhalten wird, dann gibt `fetch()` ein `false` zurück:

```php+HTML
while ($row = $stmt->fetch()):
    echo "<p>".$row['COL1']."</p>";
endwhile;
```

Wichtig: der Spaltenname muss groß geschrieben werden. Es wird empfohlen die SQL-Anweisung nicht mit einem ; abzuschließen (es gibt Datenbanken die das mit einem Fehler quittieren). [es klappt auch `while ( … ) { … }`]

- Ermitteln des $i-ten Spaltennamens: `$stmt->getColumnMeta($i)['name']`
- Ermitteln der Spaltenanzahl: `$stmt->columnCount()`

### Insert in Datenbank (Schreiben)

Für Befehle ohne Rückmeldung (keine Anfrage …) gibt's zwei Möglichkeiten, **prepare - execute**

```php+HTML
$sql = "INSERT INTO cdsammlung.kuenstler (IId,Interpret,Gruendungsjahr) VALUES (?,?,?)";
$stmt = $conn->prepare($sql);
$stmt->execute(array('1111', 'Bob', '1888'));                
```

Das Schreiben kann mittels `prepare` und `execute` erfolgen. Das kann sehr hilfreich sein, wenn mehr als nur eine Zeile eingefügt werden soll.

Alternativ **exec**:

```
$sql = "INSERT INTO cdsammlung.kuenstler (IId,Interpret,Gruendungsjahr) VALUES ('2222','Bill','1777')";
$anzahl = $conn->exec($sql);            
```

`exec` gibt die Anzahl der betroffenen Datensätze (etwa bei Delete) zurück.

### Beenden Der DB-Verbindung

```php+HTML
$conn->commit();    // Transaktion beenden (beginTransaction)
$conn = null;        // Datenbankverbindung beenden (Obj freigeben)
```

Wenn die Transaktion zurückgesetzt werden soll wird anstatt von `commit` ein `rollback` ausgeführt.

## Fehlerbehandlung

Beim Verbinden mit der Datenbank wurde eingestellt, dass Fehler mit einer Exception zu behandeln sind.

```php+HTML
try {
    // DB-Zugriff
} catch (PDOException $e) {
echo "<p>PDO-Fehler in Zeile ", $e->getLine(), 
    " mit Code ", $e->getCode(), 
    "</p><p>Fehlertext: ", $e->getMessage(), "</p>";
} catch (Exception $e) {}
```

## Komplexe Datenbankzugriffe

Wenn auf eine Datenbank nicht nur mit wenigen/kurzen Zugriffen gearbeitet wird sondern sogar über mehrere HTML-Seiten hinweg muss die Information von einer Seite zur anderen mittels POST weitergereicht werden. Passwörter die auf diese Art weitergereicht werden sind von außen lesbar, daher ist das nicht zulässig. Für diese Zwecke gibt es in PHP **Sessions**. Eine Session kann in einem PHP-Skript mittels

```
session_start();
```

gestartet werden. Damit sind globale Variable verfügbar. In jeder teilnehmenden Seite muss die erste Anweisung ein `session_start()` sein um die Session aufrecht zu erhalten. Damit sind im assoziativen Feld `$_SESSION` globale Variable verfügbar.

![php_session](../assets/php_session.png)

# Beispiel Uni-Abfrage

Für diese Beispiel muss es die DB **is_uni** geben. In dieser DB muss eine Tabelle **is_professoren** mit den Attributen **name** und **raum** geben. Ansonsten muss die SQL-Anweisung entsprechend angepasst werden.

Suche des Raums eines Professors:

```php+HTML
<?php
    $prof = $_POST['profName'];

    // Verbindung aufbauen
    $conn = new PDO("mysql:host=127.0.0.1;dbname=is_uni", "me", "comein");
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $conn->beginTransaction();

    // arbeiten
    $sql = "SELECT Name, Raum FROM is_professoren WHERE Name=\"$prof\"";
    $stmt = $conn->query($sql);
    $row = $stmt->fetch();
    echo "<p>Professor \"$row[Name]\" ist in Raum $row[Raum] zu finden.</p>";

    // Arbeit confirmen
    $conn->commit();

    // Objekt löschen
    $conn = null;
?>
```

mit einer passenden HTML-Seite:

```php+HTML
<html>
    <head>
        <title>Raumsuche</title>
    </head>
    <body>
        <form action="raumsuche.php" method="post" target="myiframe">
        <p>Professor: <input type="text" size="20" name="profName"/></p>
        <p>Es gibt: sokrates, russel, kopernikus, popper, augustin, curie, kant</p>
        <p><input type="Submit" value="Raum Suchen"/></p>

        </form>
        <iframe name="myiframe"></iframe>

    </body>
</html>
```

Es wird ein Input-Text-Feld **profName** erzeugt. Weiters ein Input-Submit-Feld (Button). Wenn diese Schaltfläche aktiviert wird, dann wird die Action **raumsuche.php** ausgeführt.

Die angegebene POST-Methode liefert sämtliche Werte aus dem form-Formular an das PHP. Dort sind diese Werte mittels $_POST abrufbar.

Im PHP wird auf den Wert von profName zugegriffen und mit diesem mittels SQL der Raum gesucht.

# Frameworks

## PHP-Frameworks

Dynamische Seiten (Inhalt etwa aus Datenbanken) direkt mit PHP zu erstellen ist sehr aufwendig (fehlerbehaftet). Gerade im Bereich Datenbanken ist die Rechteverwaltung sehr problematisch (Benutzer und Kennworte ablegen). Dabei können PHP-Frameworks sehr hilfreich sein. Als Beispiel sei hier das **yii-Framework** erwähnt. Frameworks können mittels Code-Generator einen Rahmen für gängige, häufig gewünschte Konfigurationen erzeugen.  
<www.yiiframework.com>

## CSS-Frameworks

In den oben gezeigten Darstellungen von Datenbankinhalten sieht die Tabellengestaltung sehr schlicht aus. Um das zu verbessern, wird nicht versucht mit HTML-Anweisungen die Darstellung zu verbessern (HTML-Inhalt und Design trennen!). Dadurch würde die HTML-Datei sehr schnell groß und unübersichtlich (schwer wartbar) werden. Ein weiterer großer Nachteil dieser Variante ist, dass die Gestaltung in jeder einzelnen HTML-Seite eines Webauftritts wiederholt werden muss. Soll das Design später geändert werden ist das eine aufwändige Sache. Daher wird das Design in eigene Dateien ausgelagert - den Cascading-Style-Sheets - CSS-Dateien.

Hier wird nicht weiter auf die Erstellung eingegangen (siehe etwa w3schools), wir können hier ganz einfach auf existierende CSS-Dateien verlinken. Es gibt in diesem Bereich eine Vielzahl an Frameworks die verwendet werden können.

Wir können im Header der HTML-Datei anführen:

```html
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.css">
```

damit erhalten wir ein anderes Design für unsere Tabellen.

# Referenzen

- Sehr, sehr nettes HTML und dazu gehörendes Portal: w3school  
  <https://www.w3schools.com/tags/tag_form.asp>
- PHP Allgemein  
  <https://www.php.net/manual/de/index.php>
- PHP-PDO-Manual aus erster Hand:  
  <https://www.php.net/manual/de/book.pdo.php>