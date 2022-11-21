# 6.2 Node.js

- ist ein Interpreter für die Sprache Javascript der auf die Javascript-Runtime-V8 von Google-Chrome aufbaut - grundsätzlich können damit beliebige js-Dateien ausgeführt werden.

- Javascript ist ein Sprache die üblicherweise auf einem Client läuft. Mit Node.js ist es möglich Javascript-Code auf einem Server zu interpretieren (PHP läuft ebenfalls auf Serverseite).

- Node.js ist Event-gesteuert. Dadurch kann ein Non-Blocking-I/O Modell realisiert werden. Dadurch kann die Serveranwendung beliebige Anfragen parallel und voneinander unabhängig (Non-Blocking) bearbeitet werden.

  --> Programmieren von Event-Handlern

Hier wird nur sehr oberflächlich eingegangen auf den Zugriff auf eine Datenbank mittels Webserver mittels Node.js für:

- MySQL - Datenbanken
- MongoDB - Datenbanken

Hier erfolgt ein kurzer Überblick über den Zugriff auf eine Datenbank mittels Node.js Framework. Als Anwendung wird hier die dargestellte Serveranwendung eingeführt:

![REST_SysOverview_03](bilder/Nodejs.png)

Direkt einen Webserver mittels Node.js zu implementieren ist kein übliches Vorgehen. Mittels Node.js kann sehr komfortabel ein **REST-API** erstellt werden.

## Allgemein

### Installation Node.js

- Download und Ausführen des msi von https://nodejs.org/de/. Dabei Auswahl für Installation der notwendigen Tools.

- In einer Kommandozeile sollte nun *npm* (Package-Manager für die weitere Installation) funktionieren

- Dann wird ein Verzeichnis angelegt (in diesem Verzeichnis folgt die Entwicklung) und hineingewechselt

  ```
  mkdir c:\temp\myNode
  cd c:\temp\myNode
  npm init --yes
  npm install express
  npm install -g nodemon
  ```

  ab nun ist in Node.js Express verfügbar `var express = require('express');`

### Erstes Skript

(noch ohne DB-Zugriff)

Erstellen des folgenden Skripts und Speichern unter **app.js**

```javascript
const express = require('express');
const app = express();

app.listen(3000, () => {
    console.log("startet");
});
```

Damit wird beim Start in der Konsole lediglich *startet* ausgegeben. Gestartet wird das Skript mit *Node.js*: 

```
nodemon app.js
```

Damit läuft die Anwendung (nodemon liefert mehr Rückmeldung als nur node). In einem Browser kann nun *localhost:3000* eingegeben werden (oben wurde Port 3000 angegeben). Damit wird *Cannot GET /* zurückgegeben (GET ist noch nicht implementiert).

Alternativ kann mittels `node app.js` gestartet werden, dann werden keine Status-Nachrichten mit angezeigt.

- require: lädt ein Modul (hier das Modul express)
- Routes: darunter wird verstanden dass unterschiedliche Request unterschiedlich geroutet (behandelt) werden können. Die Requests können unterschiedlicher Art (Post, Get...) oder unterschiedlichem Pfad sein.

### Webserver

Mittels Node.js kann einfach auch ein Webserver realisiert werden. Dazu muss lediglich auf Anfragen auf Port 80 mit einem HTML geantwortet werden:

```javascript
const app = express();
var path = require("path");

app.listen(80, () => {                      // Port-80
    console.log("starting WebServer");      // Ausgabe in der Node-Konsole
});

app.get('/', (req, res) => {
    // Direkt ausgeben:
	// res.send("Welcome on nodejs-WebServer");
    // Alternativ eine Datei senden:
    res.sendFile(path.join(__dirname + '/public/index.html'));
});
```

Die Datei `index.html`  kann dazu im Ordner `public` im gleichen Pfad wie `app.js` abgelegt werden.

## MySQL

### Installation Node.js

- Download und Ausführen des msi von https://nodejs.org/de/. Dabei Auswahl für Installation der notwendigen Tools.

- In einer Kommandozeile sollte nun *npm* (Package-Manager für die weitere Installation) funktionieren

- Dann wird ein Verzeichnis angelegt (in diesem Verzeichnis folgt die Entwicklung) und hineingewechselt

  ```
  mkdir c:\temp\nodemysql
  cd c:\temp\nodemysql
  npm init --yes
  npm install express
  npm install mysql
  npm install -g nodemon
  ```

  ab nun ist in nodejs MySQL verfügbar `var mysql = require('mysql');`

### Verbinden mit der DB

```javascript
var mysql = require('mysql');

var con = mysql.createConnection({
    host     : 'localhost',
    user     : 'fsst',
    password : 'comein'
});
  
con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});
```

In aktuellen MySQL-Version muss für die Anmeldung als *Authentification Type=Standard* eingestellt sein.

### Arbeiten in der DB

Hier gibts die Tabelle *kurse* mit dem Attribut *Termin* darin (Groß-/Kleinschreibung muss stimmen):

```javascript
con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
    sql = "SELECT * FROM kurse";
    con.query(sql, function (err, results, fields) {
        if (err) throw err;
        console.log(results);
    });
    console.log(sql);
});
```

### Beenden der Verbindung

```javascript
connection.end();
```

## Mongo-Db

### Installation Node.js

- Download und Ausführen des msi von https://nodejs.org/de/. Dabei Auswahl für Installation der notwendigen Tools.

- In einer Kommandozeile sollte nun *npm* (Package-Manager für die weitere Installation) funktionieren

- Dann wird ein Verzeichnis angelegt (in diesem Verzeichnis folgt die Entwicklung) und hineingewechselt

  ```
  mkdir c:\temp\node-mongo
  cd c:\temp\node-mongo
  npm init --yes
  npm install express
  npm install mongodb
  npm install -g nodemon
  ```

  ab nun ist in nodejs MongDB verfügbar `var mongo = require('mongodb');`

### Verbinden mit der DB

```javascript
const MongoClient = require('mongodb').MongoClient;
const client = new MongoClient("mongodb://localhost:27017");

client.connect(err => {
	const collection = client.db("MyDb").collection("person");
	collection.find().toArray((err, docs) => {
		if (err) throw err;
		console.log(docs);
	});
});
```

### Beenden der Verbindung

```javascript
client.close();
```

## Referenzen

- node.js
  https://nodejs.org
- Gute, ganz allgemeine Einführung
  https://www.youtube.com/watch?v=6hcsrjooU0w

- MySQL

  https://github.com/mysqljs/mysql

- Sehr "lesbare" Einführung auf w3schools für MySQL/MongoDB

  https://www.w3schools.com/nodejs/nodejs_mysql.asp
  https://www.w3schools.com/nodejs/nodejs_mongodb.asp