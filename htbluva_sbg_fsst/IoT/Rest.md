# Rest

Youtube-Serie: https://www.youtube.com/playlist?list=PL_OwzAze_jNslLV4Lv-8gxNN8bxO2VYSb

### Client-Server (Youtube1)

- Ein Server wartet
- Ein Client stellt eine Anfrage **Request**
- Der Server antwortet mit der **Response**

Grundsätzlich gibts vom Server nur Responses wenns einen Request gibt. Und auch umgekehrt auf jeden Request gibt es einen Response.

Wenn von diesem Schema abgewichen werden soll, dann etwa Peer-to-Peer Architektur. Dabei können Server/Client in anderer Abfolge senden/empfangen, etwa ein Server etwas ohne Anfrage senden.

### HTTP im TCP/IP Stack (Youtube2)

Ein Browser ist eine Anwender-Software. Sie implementiert lediglich die oberste Protokollschicht, für einen Browser also einen HTTP-Request. Dieser wird ans Betriebssystem übergeben. Dieses packt den HTTP-Request in ein TCP-Paket, dieses wiederum wird in ein IP-Paket gepackt. Je nach Anbindung wird das dann in Folge in einen Ethernet-Frame gepackt. Dieser wird ins Internet gesendet und kommt beim Server an. Dort wird wiederum die Schichten hochgelaufen bis ins HTTP-Protokoll welches vom Web-Server verarbeitet werden kann. Virtuell spricht der Brower also mit dem Web-Server in HTTP.

Komfortabler Weise muss die Anwendung (Browser+Webserver) lediglich das HTTP-Protokoll implementieren.

### URL - Uniform Resource Locator (Youtube3)

```
http://www.predict8.de/tag/REST.html
```

http: Schema (Protokoll)

Domain-Name-System für www.predict8.de:

- de: Top-Level-Domain (de, com, at ...)
- Domäne: predic8 (beantragen bei DNIC)
- mit der Domäne bekommt man die Erlaubnis diesen Bereich zu verwalten www, ftp, mail ...

Anschließend eine Art Pfad - war ursprünglich so gedacht, dass direkt im Dateisystem gebrowsed werden kann.

### HTTP-Request (Youtube4)

```
GET /tag/REST.html HTTP/1.1
Host: predict8.de:80
Connection: keep-alive
Accept: text/html,application/xhtml+xml,application/xml;...
User-Agent:
Referer: http://localhost:2000/
Accept-Encoding: gzip,deflate,sdch
Accept-Language: de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4
Cookie: JSESSIONID=2a986787614c ...


```

- Request-Line
  GET: da gibts auch POST, DELETE ...
  HTTP: Protokoll
  1.1: Version des HTTP-Protokolls

- Kopfzeilen
  Host-Adresse und Port (ganz früher hat auf einem Rechner jeder Server eine eigene IP bekommen, später Splitten mit Port)
  User-Agent: Browser-Info
  Referer: wo kommt die Anfrage her (wenn über Link auf die Seite ...)
  Accept-Encoding: Requester meint ich akzeptiere gezippte Dateien
  Accept-Language: Requester kann die angeführten Sprachen (q=Priorität)
  Cookie: ...

So eine HTTP-Anfrage kann auch via telnet ausgeführt werden:

```
telnet predict8.de 80
...
GET / HTTP/1.1
HOST: predict8.de

...
```

Der Server antwortet mit einem HTML.

### HTTP Response (Youtube5)

```
HTTP/1.1 200 OK
Server: Apache-Coyote/1.1
Accept-Ranges: bytes
ETag: W...
Last Modified: Tue, 04 Feb ...
Content-Type: text/html
Content-Length: 4517
Date: Thu, 06 Feb ...

<!DOCTYPE html
...
```

- Response-Zeile mit Protokoll, Version, und Statuscode mit Interpretation
- Server: wer spricht
- Content-Type: beschreibt was hinten dran für ein Format kommt, hier text/html (definierte Typen) Obertyp text, Subtyp html
- Content-Length: Anzahl der Bytes im Content
- Date ...
- ETag ... für Caching
- Last-Modified ... ebenfalls fürs Caching

### Resource und Representation (Youtube6)

Wird mittels URL ein Request abgesetzt, dann bereitet der Server Daten auf und sendet diese zurück. Das Aufbereiten kann sein: der Inhalt einer Datei wird kopiert und gesendet (z.B. .html) oder Daten aus einer Datenbank werden aufbereitet zurückgesendet oder das Ergebnis einer Skriptausführung. Allen ist jedoch gemeinsam: kaum sind die Daten des Responses empfangen, sind sie schon veraltet. Das bedeutet eine Repräsentation ist nichts anderes als eine Momentaufnahme zum Zeitpunkt der Abfrage. Dadurch können mehrere Clients gleichzeitig lose mit einem Server verbunden sein, durch das Kopieren sind Resourcen nicht blockiert.

Zustandslosigkeit: ein Server speichert keine Information über den Client.

### HTTP Methoden /Youtube7)

Beispiel:
Kontoservice mit den Operationen eroeffnen, ueberweisen, standAbrufen, sperren.

Wichtigsten HTTP-Methoden: GET, POST, PUT, DELETE

Die Methode wird mit einer Resource (URI) kombiniert:

Beispiel 1 Request (Frage nach dem Kontainer):

```
GET /einkauefe/ HTTP/1.1
```

Response:

```
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: 48

[ { "id": 1, "artikel": "TEE", "menge": 3 },
  { "id": 2, "artikel": "KAFFEE", "menge": 5 } ]
```

Beispiel 2 Request (Frage nach einem einzelnen Objekt):

```
GET /einkauefe/1/ HTTP/1.1
```

Response:

```
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: 24

{ "id": 1, "artikel": "TEE", "menge": 3 }
```

GET verändert nichts auf Serverseite - ist immer harmlos.

Beispiel 3 Request (Löschen eines Elements):

```
DELETE /einkauefe/1/ HTTP/1.1
```

Response:

```
HTTP/1.1 204 No Content
```

Beispiel 4 Request (Eintragen eines Elements):

```
POST /einkauefe/ HTTP/1.1
Content-Type: application/json
Content-Length: 24

{ "artikel": "TEE", "menge": 3 }
```

Response:

```
HTTP/1.1 201 Created
Location: http://predic8.de/einkaeufe/3/
```

### Postman REST-Client(8)

https://www.youtube.com/watch?v=VDWqFfwEIdM&list=PL_OwzAze_jNslLV4Lv-8gxNN8bxO2VYSb&index=8

Postman gibts als Addon für Chrome oder als Standalone-Applikation. Postman ist ein HTTP-Client mit dem können einfach Requests und Responses erzeugt und empfangen werden. (https://www.postman.com/downloads/)

### REST

REpresenational State Transfer: es wird eine Repräsentation deiner Resource übertragen.

1. Name (www.xyz.com/abc)
2. Ressource
3. Repräsentation (z. B. JSON-Struktur)
4. Uniform Interface - HTTP-Methoden GET, POST, PUT, DELETE
5. Verlinkung - Hypermedia as the Engine of Application State (hateoas) -> mit Responce-Repräs kommen Links mit. Durchs Verfolgen ändert sich der Zustand.

### Swagger

https://openapis.org  (Swagger wurde geändert auf OpenAPI)