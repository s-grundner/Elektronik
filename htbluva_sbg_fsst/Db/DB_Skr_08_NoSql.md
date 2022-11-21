# 8 NoSQL

![](C:\Daten\Skripten\Informatik\DB\bilder\NoSQL_Comic.png)

NoSQL = Not Only SQL. SQL wird als Sprache für die Kommunikation mit einer relationalen Datenbank verstanden. NoSQL-Datenbanken sind Nicht-Relationale-Datenbanken. Ursache für diese Entwicklung:

- ab einer gewissen Datenmenge (etwa >PetaByte) sind relationale Datenbanken technisch nicht mehr handhabbar - für viele Webanwendungen wie Google, Amazon, Facebook oder auch Mustererkennungen (Bilderkennung ...) ist die Datenmenge derart groß, dass relationale Datenbanken auf einem Einzelsystem nicht mehr verwaltbar sind. Daher gab es den Wunsch, Datenbanken auf mehrere Rechner verteilen zu können (auch auf kleine Rechner also Standard-Desktop-PC-Systeme)
- um in großen Datenbeständen schneller arbeitet zu können, sollen mehrere Rechner parallel an der Datenbank arbeiten können. Das wird von relationalen Datenbanken sehr eingeschränkt ermöglicht. Um die Datenbestände konsistent halten zu können wird mit Sperren (Locks) gearbeitet. Dadurch blockieren sich parallele Datenbank-Clients.
- relationale Datenbanken haben ein striktes Schema. Ein späteres Erweitern mit zusätzlicher Information ist unter Umständen mit sehr großen Aufwänden verbunden. In NoSQL-Datenbanken ist es kein Problem wenn unterschiedliche Datensätze unterschiedliche Attribute aufweisen.

> NoSQL = Not Only SQL. Darunter versteht man Nicht-Relationale-Datenbanken

## Kategorien

Das Gebiet NoSQL ist ein sehr großes und NoSQL ist gekennzeichnet über keine explizite Definition. Eine klare Kategorisierung ist daher nicht möglich. Üblicherweise wird oft auf diese Art unterschieden:

- Key / Value - kennzeichnend ist ein ganz einfaches Datenmodell. Jedes Element der Datenbank (Hash-Map) besteht aus einem Schlüssel und einem Wert. Welchen Typ oder welche Form die Elemente haben ist unterschiedlich. Eine einfache Variante: Key und Value sind je ein String. Der Value kann dabei gänzlich unterschiedliche Werte beinhalten.

  (Bsp. DynamoDB von Amazon)

- Column-Family-Systems - in klassischen relationalen Datenbanken wird ein Datensatz einer Relation nach dem anderen gespeichert (~zeilenweise). In einer Column-Based Struktur werden hingegen die Spalten unabhängig voneinander abgelegt (zusammen mit dem Key als Key-Value-Paar). Der Vorteil ergibt sich, weil in den meisten Fällen nicht auf alle Attribute bei einer Abfrage zugegriffen werden soll. Wenn Attribute keine Werte beinhalten (in RDBs NULL-Werte), dann müssen sie gar nicht gespeichert werden. Eventuell sollen nur Namen einer großen DB durchsucht werden, dann kann in einer reinen Name-Datei gesucht werden. Weiters können diese Daten häufig besser komprimiert werden (ähnliche Muster innerhalb einer Spalte). Dieses ablegen von Key-Value-Paaren kann dann noch weiter geschachtelt werden.

  (Bsp. Cassandra von Apache)

- Document-Store - es wird ein Dokument (klassisch wurden in Lotus Notes tatsächlich beliebige Dokumente abgelegt) nach dem anderen zusammen mit einer ID abgelegt. Oft werden anstatt der Dokumente strukturierte Daten im JSON, YAML oder ähnlichen abgelegt.

  (Bsp. MongoDB)

- Graphendatenbanken - in anderen Typen werden die Datensätze linear abgelegt. Ein Datensatz folgt einem Anderen. Die Reihenfolge ist durch den Typ festgelegt. In einer Graphendatenbank ist die Folge der Sätze ebenfalls mit Attributen hinterlegt. Dadurch ist dieser Typ für Daten zum Beispiel aus dem Geo-Bereich oder auch Molekülmodellierung bedeutend.

  (Bsp. SonesDB)

Wichtig: die hier angeführten Typen beziehungsweise Beispiele sind in keiner Weise wertend zu sehen. Wie sichtbar wird gibt es für die verschiedensten Arten von Problemfällen gewisse Datenbank-Typen die besonders gut geeignet sind.

Für *kleine Projekte* kann verkürzt sowieso ein beliebiger Typ (relational oder NoSQL) gewählt werden. Entscheidende Kriterien werden dann sowieso die Frage nach Lizenzgebühren oder die Erfahrung mit einem speziellen Typ sein.

## Algorithmen und Protokolle

Für NoSQL-Datenbanken sind die folgenden Themen relevant (stark vom tatsächlichen Implementierung abhängig) - wobei manche der erwähnten Verfahren durchaus auch für relationale Datenbanken Anwendung finden:

- Map / Reduce
  Ganz Allgemein gibt es Funktionen die auf jedes Element einer Datenbank separat wirken (*Map*) und Funktionen die ein Ergebnis aufgrund mehrerer Elemente liefern sollen (*Reduce*). Beispielhaft sollen die Sternzeichen von Personen in einer DB ermittelt werden, diese werden unabhängig voneinander aus dem Geburtsdatum ermittelt. Soll ein Datensatz der Person mit Namen *Huber Hans* aus einer Datenbank ermittelt werden, dann wird durch den Datenbestand traversiert und der Name ermittelt und verglichen.

  Daraus folgernd, wird versucht jede notwendige Funktion mittels dieser beiden Varianten abzubilden. Map-Funktionen können logischerweise beliebig parallelisiert werden. Für Reduce Funktionen gilt das je nach konkreter Funktion nicht beliebig aber eventuell partiell. Das Unternehmen *Google* hat auf diese Art ein Programmiermodell für die nebenläufige Programmierung entwickelt (siehe auch https://de.wikipedia.org/wiki/MapReduce). 

  > Map / Reduce: Ansatz zur nebenläufigen Programmierung mit Datenbanken

- CAP-Theorem
  C=Konsistenz A=Verfügbarkeit P=Ausfalltoleranz
  Diese Aspekte sind für Datenbanken grundsätzlich wichtig. Wünschenswert: alle 3 sind maximal ausgeprägt. Man möchte möglichst sofort Daten verändern/lesen und bei einem technischen Fehler soll kein Schaden entstehen. Für relationale Datenbanken wurde der C-Aspekt als wichtigster Punkt gehandhabt. Logisch: Zugriff auf ein Bankkonto soll weltweit ohne Geld Verlust/Gewinn immer 100% Konsistent erfolgen. Für Web-Anwendungen (Facebook, Google) ist dieser Aspekt nicht so wichtig, beim Suchen mittels Google stört es den Anwender nicht, wenn eine gesuchte Seite in zwei gleichzeitigen Suche-Sessions einmal weiter vorne und ein zweites Mal weiter hinten aufscheint. Wesentlich wichtiger ist die Verfügbarkeit (Antwortgeschwindigkeit). Wenn auf eine Google-Anfrage 10 Minuten gewartet werden muss wird es schlicht nicht verwendet. Gleiches für Amazon: erhält ein Anwender innerhalb von 2 Sessions gleichzeitig zwei unterschiedliche Preise genannt (aufgrund etwa Parallel-Rechnens), dann wird das von Kunden akzeptiert. Wenn jeder Klick 1 Minute dauern würde, dann hätte sich Amazon nie auf dem Markt etabliert.

  In wissenschaftlichen Abhandlungen wurde dargestellt, dass es nie möglich sein kann sämtliche der drei genannten Aspekte gleichzeitig zu maximieren. Es können immer nur zwei Maximal sein, wohingegen der Dritte automatisch klein wird.

  Das für NoSQL-Datenbanken verwendete **BASE**-Modell berücksichtigt diese Erkenntnis und erlaubt eine Verschiebung der Prioritäten etwa hin zur Verfügbarkeit. In relationalen Datenbanken wird üblicherweise nach dem **ACID**-Prinzip gearbeitet (https://de.wikipedia.org/wiki/ACID). In diesem wird die Konsistenz als höchste Maxime behandelt.

  > CAP-Theorem: nur Zwei von C-A-P können groß sein, der Dritte ist automatisch gering.

- Consistant-Hashing
  Mittels Hash-Maps können Daten schnellst möglich auffindbar abgelegt werden (konstante Abrufzeit  O(1)  !!!  ). Wenn die Server-Struktur umgebaut wird (Erweitern oder Reduzieren), dann muss die Daten-Ablage neu verteilt werden. Das führt zu einem erheblichen Kopieraufwand. Um diesen zu Vermeiden, gibt es die Strategie *Consistent-Hashing*. (https://wikis.gm.fh-koeln.de/Datenbanken/ConsistentHashing)

  > Consistant-Hashing: Erweiterung von *einfachen* Hash-Maps um Systemumbau (Server-Struktur) mit geringem Kopieraufwand zu realisieren.

- Multiversion-Concurrency-Control (MVCC)
  Beim parallelen Schreiben in den selben Daten von Datenbeständen blockiert klassisch einer der Teilnehmer den anderen. Um die Blockade zu Vermeiden wird mit *versionierten* Transaktionen (Versionsnummer) gearbeitet. (https://wikis.gm.fh-koeln.de/Datenbanken/MVCC)

  > MVCC: Versionierung um Schreibkollisionen zu erkennen und Schreiben ohne Blockaden zu ermöglichen

- Vector-Clocks
  In verteilten Systemen kommt es vor, dass manche Teilnehmer Änderungen nicht erfahren. Bei Änderungen wird ein fortlaufender Zähler (Clock) mitgeführt. Damit kann aufgrund fehlender Zählerstände dieser Mangel erkannt werden und entsprechend letztgültige Stände übernommen werden. Der Name Vector rührt daher, dass die Zählerstände jedes einzelnen Clients behalten werden. (https://de.wikipedia.org/wiki/Vektoruhr)

  > Vector-Clocks: Mitführen eines Zählers um Übertragungsunterbrechungen zu Erkennen

- REST - Entwurfsmuster für verteilte Applikation (nicht nur Datenbanken). Üblicherweise wird REST mittels HTTP umgesetzt. (https://de.wikipedia.org/wiki/Representational_State_Transfer)

  > REST: API für die Kommunikation mit (zum Beispiel) einer Datenbank

## Document-Store Datenbank-Typ MongoDB

Eine MongoDB ist vom Typ Document-Store. In MongoDB werden die abgelegten Dokumente als *BSON* abgelegt. Ein BSON ist ein binäres JSON-Format. JSON ist ein reines Text-Format, damit die Verarbeitung wesentlich effizienter ist, wird die JSON-Struktur binär kodiert abgespeichert. Die Dokument-Sammlung wird als *Collection* bezeichnet. Beispielhaft wird eine Person abgelegt:

```
{
	"name" : "Huber",
	"age" : 28,
	"abschluesse" : ["Seepferdchen", "VS", "NMS", "HTL", "FS-B"]
}
```

Sie wird zusammen mit einer (automatisch generierten) Id abgelegt:

![mongodb_01](C:\Daten\Skripten\Informatik\DB\bilder\mongodb_01.png)

Als weitere Person kann in die selbe Collection eine zweite Person abgelegt werden:

```
{
    "name" : "Mayer",
    "groesse" : 180
}
```

Damit sieht die Collection so aus:

![mongodb_02](C:\Daten\Skripten\Informatik\DB\bilder\mongodb_02.png)

Die *id*s sind natürlich unterschiedlich, sie werden von der Datenbank generiert wenn die Collection eingefügt wird. Bemerkenswert ist hier, dass die Struktur eines Datenbankeintrags von den anderen abweichen kann/darf. Ein Vorteil ist klar ersichtlich: die Datenbank muss nicht aufwendig entworfen werden (Normalformen/ERD in relationalen Datenbanken).

### MongoDB-Kommandozeile

https://www.youtube.com/watch?v=bKjH8WhSu_E

Das Arbeiten mit der MongoDB-Kommandozeile ist relativ intuitiv:

```
> use MyDb
switched to db MyDb
> db.person.insertOne({name: "Huber",age: 28,abschluesse:["Seepferdchen","VS","NMS","HTL","FS-B"]})
{
        "acknowledged" : true,
        "insertedId" : ObjectId("5f285a2e17f3695fe67c5658")
}
> db.person.insertOne({name:"Mayer",groesse:180})
{
        "acknowledged" : true,
        "insertedId" : ObjectId("5f285a3a17f3695fe67c5659")
}
>
```

mit *use* wird die Datenbank gewählt mit welcher gearbeitet werden soll, wenn die Datenbank noch nicht existiert wird sie einfach erstellt. Wo wird die DB abgespeichert? Das kann erfragt werden:

```
db.serverCmdLineOpts()
```

Anschließend werden zwei Datensätze in die Collection *person* eingefügt. Hier gilt ebenfalls, wenn sie noch nicht existiert wird sie erzeugt.

Der MongoDB-Server gibt mit jedem Anlegen die erzeugte ID zurück.

```
> db.person.find()
{ "_id" : ObjectId("5f285a2e17f3695fe67c5658"), "name" : "Huber", "age" : 28, "abschluesse" : [ "Seepferdchen", "VS", "NMS", "HTL", "FS-B" ] }
{ "_id" : ObjectId("5f285a3a17f3695fe67c5659"), "name" : "Mayer", "groesse" : 180 }
> db.person.find({name:"Huber"})
{ "_id" : ObjectId("5f285a2e17f3695fe67c5658"), "name" : "Huber", "age" : 28, "abschluesse" : [ "Seepferdchen", "VS", "NMS", "HTL", "FS-B" ] }
>
```

Mit diesen beiden Anweisungen wird in der Datenbank gesucht. Die erste Anweisung entspricht der SQL-Anweisung `SELECT * FROM user;`. Die folgende Anweisung sucht nach dem Datensatz mit dem Namen *Huber* und entspricht der SQL-Anweisung `SELECT * FROM user WHERE name='Huber';`.



Bischen Mehr:

- Auflisten vorhandener Databases (https://docs.mongodb.com/manual/reference/command/listDatabases/):

  ```
  > db.adminCommand( {listDatabases:1})
  {
          "databases" : [
                  {
                          "name" : "MyDb",
                          "sizeOnDisk" : 40960,
                          "empty" : false
                  },
                  {
                          "name" : "admin",
                          "sizeOnDisk" : 40960,
                          "empty" : false
                  },
                  {
                          "name" : "config",
                          "sizeOnDisk" : 61440,
                          "empty" : false
                  },
                  {
                          "name" : "local",
                          "sizeOnDisk" : 73728,
                          "empty" : false
                  }
          ],
          "totalSize" : 217088,
          "ok" : 1
  }
  ```

- Auflisten vorhandener Collections (https://docs.mongodb.com/master/reference/command/listCollections/index.html):

  ```
  > db.runCommand( { listCollections: 1 } )
  {
          "cursor" : {
                  "id" : NumberLong(0),
                  "ns" : "MyDb.$cmd.listCollections",
                  "firstBatch" : [
                          {
                                  "name" : "person",
                                  "type" : "collection",
                                  "options" : {
  
                                  },
                                  "info" : {
                                          "readOnly" : false,
                                          "uuid" : UUID("b520c564-f76d-4262-ad1c-3c6d308f4c4a")
                                  },
                                  "idIndex" : {
                                          "v" : 2,
                                          "key" : {
                                                  "_id" : 1
                                          },
                                          "name" : "_id_"
                                  }
                          }
                  ]
          },
          "ok" : 1
  }
  ```

  hier ist die Collection *person* vorhanden.

- Auflisten sämtlicher vorhandener User:

  ```
  > db.runCommand( { usersInfo: 1 } )
  { "users" : [ ], "ok" : 1 }
  ```

  Hier wurde kein Benutzer angelegt.

### REST

https://www.youtube.com/watch?v=1VA0MPwFcyU

#### Installation Nodejs

- Download und Ausführen des msi von https://nodejs.org/de/. Dabei Auswahl für Installation der notwendigen Tools.

- In einer Kommandozeile sollte nun *npm* (Package-Manager für die weitere Installation) funktionieren

- Dann wird ein Verzeichnis angelegt und hineingewechselt

  ```
  mkdir c:\temp\node-mongo
  cd c:\temp\node-mongo
  npm init --yes
  npm install express
  npm install mongodb
  npm install -g nodemon
  ```

#### Erstes Skript

Erstellen des folgenden Skripts und Speichern unter **app.js**

```javascript
const express = require('express');
const app = express();

app.listen(3000, () => {
    console.log("startet");
});
```

Damit wird beim Start lediglich *startet* ausgegeben. Gestartet wird das Skript mit *nodejs*: 

```
nodemon app.js
```

Damit läuft die Anwendung. In einem Browser kann nun *localhost:3000* eingegeben werden (oben wurde Port 3000 angegeben). Damit wird *Cannot GET /* zurückgegeben.

#### GET-Response

Um auf einen *Get* zu reagieren wird **app.js** erweitert:

```javascript
app.get('/', (req, res) => {
    res.send("Welcome to REST :-)");
});
```

Nun kann mittels Browser auf *localhost:3000* die Antwort *Welcome to REST :-)* empfangen werden.

#### MongoDB-Zugriff

Für obiges MongoDB-Datenbank:

```javascript
// Preconditions for runnind this script:
// - mongodb has to run (server as service) on localhost
// - MyDb database
// - persons collection

const express = require('express');
const app = express();

app.get('/', (req, res) => {
    res.send("Welcome to REST :-)");
});

app.get('/api/personcollection', (req, res) => {
    const MongoClient = require('mongodb').MongoClient;
    const client = new MongoClient("mongodb://localhost:27017");

    client.connect(err => {
        const collection = client.db("MyDb").collection("person");
        collection.find().toArray((err, docs) => {
            if (err) throw err;
            res.send(docs);
        });
        client.close();
    });
});

app.listen(3000, () => {
    console.log("startet");
});
```

In einem Browser kann damit auf *localhost:3000/api/personcollection* abgefragt werden:

```
0:
	_id:	"5f285a2e17f3695fe67c5658"
	name:	"Huber"
	age:	28
	abschluesse:
		0:	"Seepferdchen"
		1:	"VS"
		2:	"NMS"
		3:	"HTL"
		4:	"FS-B"
1:
	_id:	"5f285a3a17f3695fe67c5659"
	name:	"Mayer"
	groesse:	180
```

#### C-REST (408)

Um mittels C-Programm auf das REST-API zuzugreifen:

```c
#define _WIN32_WINNT 0x0A00
#include <winsock2.h>
#include <stdio.h>
#include <stdlib.h>

int main()
{
    // Win Only: Treiber Starten ==========================
	WSADATA wsaData;
    printf("WSAStartup(): % i\n", WSAStartup(MAKEWORD(2,2), &wsaData));

    // socket() ===========================================
    int s = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    printf("socket: % i\n", s);

    // connect() ==========================================
    struct sockaddr_in srvAddr;
    srvAddr.sin_family = AF_INET;
    srvAddr.sin_port = htons(3000);
    srvAddr.sin_addr.s_addr = inet_addr("127.0.0.1");

    printf("connect: % i\n", connect(s, (SOCKADDR*)&srvAddr, sizeof(SOCKADDR)));

    char str1[] = "GET /api/personcollection HTTP/1.0\r\n\r\n";
    send(s, str1, strlen(str1), 0);
    char str2[1000];
    int len = recv(s, str2, 1000, 0);
    str2[len] = 0;
    printf("Received:\n==\n%s\n==\n", str2);

    // close() ============================================
    printf("closesocket: % i\n", closesocket(s));

    // Win Only: Treiber Beenden ==========================
    printf("WSACleanup(): % i\n", WSACleanup());    return 0;
}
```

### MongoDB Installation

- Download letzte Community-Version von https://www.mongodb.com/try/download/community

- Download der Datei (hier *mongodb-windows-x86_64-4.4.0-signed.msi*) in ein beliebiges Verzeichnis und Ausführen.

- Dabei wird ein Service *MongoDB* installiert (kann im Task-Manager unter Dienste gefunden werden beziehungsweise mit *Dienste* konfiguriert werden). *Compass* muss nicht unbedingt installiert werden.
  Wird die Service-Konfiguration geöffnet, dann ist dort ersichtlich mit welchen Parametern der Service gestartet wird. Standard: *C:\Program Files\MongoDB\Server\4.4\bin\mongod.cfg*. Darin ist zu finden: *dbPath: C:\Program Files\MongoDB\Server\4.4\data* . Mit dieser Angabe wird festgelegt wo die Datenbanken abgelegt werden.

  Unter der Dienste-Konfiguration ist es durchaus sinnvoll den Service auf *Manuell* zu setzten, ansonsten wird der Service immer automatisch mit Windows gestartet.

- Unter dem Programm-Verzeichnis (Standard: *c:\Program Files\MongoDB\Server\4.4\bin*) ist das MongoDB-Terminal *mongo.exe* zu finden. Wird das bei laufendem Server aufgerufen (aus der Kommandozeile), kann mit der Datenbank kommuniziert werden.

Zusammenfassend:

- msi Downloaden und installieren mit der Option Service installieren und ohne Option Compass
- in der Dienste-Konfig den Dienst auf Manuell schalten
- in einer Kommandozeile mongo.exe starten.

## Referenzen

....

- [https://www.w3schools.com/sql/default.asp](https://www.w3schools.com/sql/default.asp)