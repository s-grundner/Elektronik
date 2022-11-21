# 5.4 InfluxDB

Die Datenbank **InfluxDB** ist eine Zeitreihendatenbank. Die Grundidee: es werden Daten zeitlich nach der Reihe in einer Datenbank abgelegt. Gerade für Messtechnische oder statistische Erhebung ist diese Art von Vorteil. Die InfluxDB ist keine relationale Datenbank.

Die Elemente einer InfluxDB:

![](C:\daten\Skripten\Informatik\DB\bilder\InfluxDB.png)

- **Database**: Sammlung von zusammengehörenden Measurements
- **Measurement**: ist eine Tabelle zusammengehörender Daten. Eine Database kann aus mehreren Measurements bestehen. Entspricht einer Tabelle in einer relationalen Datenbank.
- **Retention Policy** (Speicher-Strategie): für jedes Measurement kann angegeben werden, wie lange die Daten behalten werden (anschließend gehen sie automatisch verloren) und auch wieviele Sicherungs-Kopien angelegt werden sollen. Mit **autogen** kann die Entscheidung an das DB-System übertragen werden (für unsere Test genügend).

In einem Measurement gibt's die folgenden Elemente:

- **Timestamp**: gibt's in dieser DB immer - jeder Datensatz wird automatisch mit einem Zeitstempel (RFC3339 UTC) abgelegt. Alles Andere ist frei konfigurierbar.
- **Field Key** und **Field Value**: entsprechen den Attributen in den relationalen DB. Der Key ist etwa die Überschrift (Spannung) und der Value der gemessene Wert (230).
-  **Tag Key** und **Tag Value**: erstmal das selbe wie die Field-Elemente. Der Unterschied: nach den Tag-Elementen kann effizient gesucht werden, nach den Field-Elementen muss die komplette Measurement durchsucht werden (Zeile für Zeile). Für die Tag-Elemente wird wohl ein eigener Index angelegt.
  In obigen Beispiel wurde beliebig der Entladestrom als Tag gewählt. Dadurch kann in dieser Tabelle sehr effizient nach einem bestimmten Entladestrom gefiltert werden. Die Aufteilung Tag<->Field kann beliebig erfolgen.
- **Point**: als Point wird eine einzelne Messung bezeichnet, also wie ein Datensatz.

## InfluxQL

Die Abfragen in einer InfluxDB erfolgen sehr ähnlich zu SQL. Die entsprechende Sprache ist in Anlehnung dazu InfluxQL (https://docs.influxdata.com/influxdb/v1.8/query_language/explore-data/#the-basic-select-statement).

Database erzeugen:

```
CREATE DATABASE TNNDB
SHOW DATABASES
USE TNNDB
```

InfluxDB ist keine realtionale Datenbank. In InfluxDB wird keine starre Tabellenstruktur vorgegeben.

Benutzerverwaltung und Rechtezuteilung:

```
CREATE USER "fsst" WITH PASSWORD 'comein'
GRANT ALL ON TNNDB TO fsst
```

Wenn eine Database erzeugt wurde, können einfach Daten eingefügt werden:

```
INSERT Solarpanel,"Entlade-I"=17.9      "Batt-U"=10,"Lade-I"=0
SHOW MEASUREMENTS
SHOW FIELD KEYS
SHOW TAG KEYS
```

hiermit wird ein Measurement *Solarpanel* entweder erweitert (wenn vorhanden) oder neu angelegt und die Daten zusammen mit einem Zeitstempel eingefügt. Die Werte welche direkt auf die Measurement folgen sind Tags, die anschließenden Werte sind Fields. Mit dem ersten Einfügen wird Measurement erzeugt und die "Attribute", welche mitgegeben werden. Bei jedem weiteren Einfügen können ohne weiteres zusätzliche oder nicht alle dieser Felder/Tags angegeben werden. Typen können allerdings nicht verändert werden (ein Point hat ein Field mit double, dann kann ein weiterer Point kein Field als String haben), ebenfalls kann ein Element nur entweder ein Tag oder ein Field sein.

In obigen Beispiel könnte eine Abfrage lauten (Anführungszeichen müssen verwendet werden, wenn der Name Sonderzeichen, hier -, beinhaltet):

```
USE TNNDB
SELECT "Batt-U", "Lade-I" FROM Solarmodul
```

oder etwa

```
SELECT * FROM TNNDB.autogen.Solarmodul
```

Hier wird ersichtlich, dass es zu einer Database mehrere Rentention Policies geben kann (die Datenbank mit mehreren Speicherdauern).

Eine **Where**-Clause analog zu jener in SQL gibt es ebenfalls.

## Installation InfluxDB

- Windows - Download und Extract
  https://portal.influxdata.com/downloads/  --> Windows-Binaries ... dort enweder den Link rauskopieren oder mittels Powershell:

  ```
  wget https://dl.influxdata.com/influxdb/releases/influxdb-1.8.5_windows_amd64.zip -UseBasicParsing -OutFile influxdb-1.8.5_windows_amd64.zip
  ```

  und entpacken:

  ```
  Expand-Archive .\influxdb-1.8.5_windows_amd64.zip -DestinationPath 'C:\Program Files\InfluxData\influxdb\'
  ```

- Erstkonfig - influxdb.conf editieren

  Manuell anlegen die Ordner (wo auch immer ...):

  ```
  C:\Users\roman\AppData\Roaming\influxdb\influx-data\data
  C:\Users\roman\AppData\Roaming\influxdb\influx-data\meta
  C:\Users\roman\AppData\Roaming\influxdb\influx-data\val
  ```

  Mittels Editor die Datei **influxdb.conf** anlegen (Ordner anpassen - evtl. mit Unix-CR abspeichern):

  ```
  [meta]
    # Where the metadata/raft database is stored
    dir = "C:\\Users\\roman\\AppData\\Roaming\\influxdb\\influx-data\\meta"
  [data]
    # The directory where the TSM storage engine stores TSM files.
    dir = "C:\\Users\\roman\\AppData\\Roaming\\influxdb\\influx-data\\data"
    wal-dir = "C:\\Users\\roman\\AppData\\Roaming\\influxdb\\influx-data\\val"
  [http]
    # Determines whether HTTP endpoint is enabled.
    enabled = true
  ```

- Starten DB+Server im Verzeichnis mit **influxd.exe** im Browser mittels `localhost:8086` Zugriff starten.

- Client: **influx.exe**

- Abfrage via HTTP-GET:

  ```
  http://localhost:8086/query?db=TTNDB&q=SELECT%20*%20FROM%20%22Solarmodul%22
  ```

## Installation Node-Red - InfluxDB - AddOn

https://flows.nodered.org/node/node-red-contrib-influxdb

Im Ordner von Node-Red (unter Windows kann das im Verzeichnis `c:\users\xxxxx\.node-red\` sein):

```
npm install node-red-contrib-influxdb
```

Beispiel (Import in Node-Red):

```json
[{"id":"70f5f647.0e57b8","type":"influxdb out","z":"dc3fb0b2.df903","influxdb":"e1dc092f.e02b78","name":"espmeasure","measurement":"espmeasure","precision":"","retentionPolicy":"","database":"espmeasure","precisionV18FluxV20":"ms","retentionPolicyV18Flux":"","org":"lesson","bucket":"measure","x":590,"y":340,"wires":[]},{"id":"62110329.7106cc","type":"function","z":"dc3fb0b2.df903","name":"Fields","func":"msg.payload = [{   // InfluxDB-Values\n    H: 52,\n    T: 20.2,\n    P: 1.2\n},{                // InfluxDB-Tags\n    loc: \"Schlafzimmer\",\n    type: \"bmp182\"\n}]\nreturn msg;","outputs":1,"noerr":0,"initialize":"","finalize":"","x":410,"y":340,"wires":[["70f5f647.0e57b8","3de19d84.119862"]]},{"id":"cefed6e.230e7a8","type":"inject","z":"dc3fb0b2.df903","name":"","repeat":"","crontab":"","once":false,"topic":"","payload":"","payloadType":"date","x":240,"y":440,"wires":[["62110329.7106cc","fc9df475.a4aa58"]]},{"id":"3de19d84.119862","type":"debug","z":"dc3fb0b2.df903","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","targetType":"msg","statusVal":"","statusType":"auto","x":610,"y":400,"wires":[]},{"id":"fc9df475.a4aa58","type":"influxdb in","z":"dc3fb0b2.df903","influxdb":"e1dc092f.e02b78","name":"in","query":"SELECT * FROM espmeasure","rawOutput":true,"precision":"","retentionPolicy":"","org":"lesson","x":430,"y":500,"wires":[["fdc2b192.0c4668"]]},{"id":"fdc2b192.0c4668","type":"function","z":"dc3fb0b2.df903","name":"result","func":"//msg.payload = \"Hallo Welt\"; //Math.random()*10;\nreturn msg.payload.results[0].series[0];","outputs":1,"noerr":0,"initialize":"","finalize":"","x":590,"y":500,"wires":[["c2da08e2.60e1d8"]]},{"id":"c2da08e2.60e1d8","type":"debug","z":"dc3fb0b2.df903","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"true","targetType":"full","statusVal":"","statusType":"auto","x":730,"y":500,"wires":[]},{"id":"3f54c86c.0dc56","type":"comment","z":"dc3fb0b2.df903","name":"InfluxDB Point Schreiben","info":"Schreiben in die InfluxDB\n- Die Datenbank muss laufen (auf localhost)\n- geschrieben wird immer der gleiche Point\n- Tags und Fields können in der Funktion ersehen werden","x":470,"y":280,"wires":[]},{"id":"bddd4082.2671b","type":"comment","z":"dc3fb0b2.df903","name":"InfluxDB Measurement Lesen","info":"Lesen aus der InfluxDB\n- die Datenbank muss laufen (localhost)\n- gelesen werden die Rohen Daten","x":660,"y":560,"wires":[]},{"id":"e1dc092f.e02b78","type":"influxdb","z":"","hostname":"localhost","port":"8086","protocol":"http","database":"ttndb","name":"Einf","usetls":false,"tls":"10d548aa.fc0ed7","influxdbVersion":"1.x","url":"http://localhost:8086","rejectUnauthorized":false},{"id":"10d548aa.fc0ed7","type":"tls-config","name":"","cert":"","key":"","ca":"","certname":"","keyname":"","caname":"","servername":"","verifyservercert":false}]
```

