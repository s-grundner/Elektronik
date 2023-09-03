# 5.2 Tool - XAMPP

## Installation (Windows)

Die Installation ist sehr einfach:

- Download: [https://www.apachefriends.org/de/index.html](https://www.apachefriends.org/de/index.html)
- Installation: Installer mit Standardeinstellungen ausführen
- XAMPP legt viele Konfigurationen innerhalb der Programmstruktur ab, daher wird bei der Installation empfohlen das ausserhalb der Ordner `c:\program…` zu machen, evtl. unter `c:\xampp`.

Ab nun ist das XAMPP-Control-Panel verfügbar:

- Starten des Control-Panels von XAMPP

- In diesem Control-Panel sind die inkludierten Werkzeuge angeführt, für uns erstmal wichtig:
  
  - Apache - ein WebServer
  - MySQL - eine MariaDB-Datenbank (früher war's wohl eine MySQL-DB).
  
  Mittels der Konfig-Schaltflächen können Einstellungen für das entstprechende Werkzeug getroffen werden.  
  Mit den Starten-Schaltflächen können die Werkzeuge gestartet werden, ab diesem Zeitpunkt zeigen diese Schaltflächen *Stoppen*. Ab nun sind auch die Admin-Schaltflächen verfügbar. Mit diesen kann auf die Tools zugegriffen werden.
  
  Im unteren Bereich des Fensters werden Status-Meldungen ausgegeben. Solange die Meldungen schwarz/blau sind handelt es sich um Status-Information, erst wenn etwas rot geschrieben wird muss reagiert werden.

Wenn Apache und MySQL gestartet ist, dann kann mittels Admin bei MySQL die Datenbank mittels phpMyAdmin bearbeitet werden. Sollte sich dabei kein Browser öffnen dann die Adresse (üblicherweise `localhost/phpmyadmin`) in einen anderen Browser kopieren.

Das Programm funktioniert nur dann einwandfrei wenn es mit Admin-Rechten gestartet wird (sonst läßt es sich nicht richtig beenden, die Symbole funktionieren nicht immer …)

## Webserver Apache

Wenn der Apache-Web-Server gestartet wird ohne eine weitere Konfiguration zu verändern, dann ist er so konfiguriert, dass er nach außen verfügbar ist. Um das um zu konfigurieren, kann mittels Konfiguration in **httpd.conf**:

```
...
Listen  localhost:80
...
```

eingefügt werden. Damit wird der Server angewiesen, nur auf localhost-Anfragen zu reagieren.

In Linux is das htdocs-Verzeichnis in */opt/lampp/htdocs*. Um dort eigene Dateien abzulegen wird ein Link ins Homeverzeichnis abgelegt ($USER ist aktuelle Benutzer - der Name des Links):

```
mkdir ~/ORDNERNAME
sudo ln -s ~/ORDNERNAME /opt/lampp/htdocs/$USER 
```

Dieser Ordner kann dann mittels

```
http://localhost/BENUTZERNAME/
```

erreicht werden.

## phpMyAdmin

Ist ein freies Datenbank-Management-Tool. Der große Vorteil dieses Tools ist, dass keine Installation von Client-Seite zu erfolgen hat. Es läuft im Browser. 

Der linke Fensterteil beinhaltet die Datenbanken (Sammlung von Tabellen wird hier als Datenbank bezeichnet).

### Anlegen einer neuen Datenbank

Datenbank ist eigentlich nicht wirklich ein allgemein gleicher Begriff. Eigentlich ist die Gesamtheit der Datenbanken die Datenbank. Oft werden diese *Teildatenbanken* als Schema bezeichnet, um die Sache einfacher zu halten verwenden wir auch Datenbanken.

- linken Navigationsframe ganz oben **Neu** auswählen.
- **Name der Datenbank** eingeben (am Besten auf Umlaute/Sonderzeichen verzichten auch wenn teilweise akzeptiert)
- **Zeichensatz** angeben. Der ist vor allem für Vergleichoperationen/Suche in der Datenbank Entscheidend. Die Sortierung erfolgt in unterschiedlichen Zeichensätzen auch unterschiedlich. Am Besten immer utf8_general_ci angeben. Wichtig wird die Codierung wenn mittels Tools von aussen auf die Datenbank zugegriffen wird, dabei sollten sämtliche Werkzeuge die exakt gleiche Codierung verwenden.
- Mit Anlegen wird die Datenbank erstellt und ist (eventuell nach Drücken der Refresh Schaltfläche) im Navigationsbereich verfügbar.

### Anlegen einer neuen Tabelle

- Wird eine neue/leere Tabelle ausgewählt, dann wird nach einer neuen Tabelle gefragt. Wenn schon Tabellen in dieser Datenbank sind kann im Navigationsmenü auf **Neu** geklickt werden.
- **Name der Tabelle** eingeben und **Anzahl der Spalten** (kann später einfach verändert werden)
- Dann **Spalten eingeben** - Name und Typ mit der Länge des Typs. Eventuell weitere Einstellungen treffen und bestätigen (sämtliche Einstellungen können später einfach verändert werden)

Allgemein (nicht nur phpMyAdmin): es gibt reservierte Namen, diese werden nicht *empfohlen* zu verwenden. Da sind durchaus Begriffe wie Name oder Alter dabei.

### Verändern von Tabellen/Attributen

- Auswählen der betroffenen Tabelle im Navigationsbereich
- Im obigen Menü **Struktur** auswählen und für Änderungswünsche an der Tabelle anschließend wieder oben **Operationen** auswählen. Auf diese Weise können auch ganze Tabellen (samt Spalten UND Daten gelöscht werden).
- Für Änderungen an einer Spalte die Spalte auswählen und darunter Bearbeiten/Löschen ausführen.

### Primärschlüssel

- Auswählen der betroffenen Tabelle im Navigationsbereich
- Im obigen Menü **Struktur** auswählen
- Die Spalte(n) die Primärschlüssel sein sollen auswählen
- Unterhalb Primärschlüssel auswählen

Ab jetzt wird bei dieser Spalte immer ein gelber Schlüssel dargestellt

### Fremdschlüssel / Beziehungen

Verknüpfungen zwischen Spalten unterschiedlicher Tabellen. Eine Beziehung kann's nur geben wenn einer der beiden ein Schlüssel ist.  
Beispiel: in einer Tabelle gibt's eine Postleitzahl, in einer zweiten Tabelle soll zu der Postleitzahl der Ortname ermittelt werden. Das kann nur funktionieren, wenn in dieser zweiten Tabelle die Plz nur einmal vorkommen kann, ansonsten wäre es nicht klar welcher Ort gesucht ist.

- Auswählen der betroffenen Tabelle im Navigationsbereich
- Im obigen Menü **Struktur** auswählen
- Darunter auf **Beziehungsansicht** umschalten
- **Name** der Beziehung eingeben (jede Verknüpfung bekommt einen Namen)
- Die Spalte um die's geht aus der Tabelle in welcher man gerade ist auswählen.
- Anschließend die Spalte auswählen mit der Verknüpft werden soll auswählen: Datenbank/Tabelle/Spalte (diese Spalte muss ein Schlüssel sein)
- Auswählen was passieren soll wenn das Feld verändert/gelöscht werden soll: z.B. CASCADE bedeutet ebenfalls ändern/löschen …
- Speichern Drücken

Ab jetzt wird bei den beiden betroffenen Spalten immer ein grauer Schlüssel dargestellt (die Darstellung klappt manchmal nicht)

### Befüllen mit Daten

- Auswählen der betroffenen Tabelle im Navigationsbereich
- Im obigen Menü **Einfügen** auswählen
- Werte eintragen und OK drücken

### Rechte

Ganz wichtiges Thema: nicht Jeder soll alles dürfen, manche dürfen nur Lesen, andere zusätzlich Löschen wieder andere können ganze Tabellen löschen, Benutzer anlegen, Passwörter ändern …

**Benutzer hinzufügen**

- In der Leiste oben **Rechte** auswählen
- Unten **Benutzerkonto hinzufügen**
- Eintragen **Benutzername**, von welchem **Host** der Zugriff zulässig ist, das **Passwort** und dann welche Rechte dem Benutzer zugeteilt werden.

Das Bearbeiten oder Löschen eines Benutzers erfolgt ebenfalls in diesem Menü.

Um Einzustellen mit welchem Benutzer sich mit php angemeldet wird muss der Benutzer in der Datei `c:\xampp\phpMyAdmin\config.inc.php` eingetragen werden:

```
$cfg['Servers'][$i]['user'] = 'jim';
$cfg['Servers'][$i]['password'] = 'jimji';
$cfg['Servers'][$i]['AllowNoPassword'] = false;
```

#### Beispiel

- Aufruf von `localhost/phpmyadmin`
- Ändern des Passworts für den Benutzer **localhost@root** auf **myphppw**.
- Neues Laden von localhost/phpmyadmin: Fehlermeldung **Zugriff verweigert!**.
- Ändern des Passworts für Benutzer **root** in der Datei `c:\xampp\phpMyAdmin\config.inc.php` auf **myphppw**

Sinnvolle Konfiguration: root-Benutzer (der wirklich Alles darf) wird nur lokaler Zugriff (localhost) gewährt. Erstellen von weiteren Benutzern die nur die gewünschten Befugnisse bekommen. Wichtig: das Passwort für Root irgendwo notieren!

### Export

Zum Exportieren von Tabellen oder gesamten Datenbanken:

- Das zu exportierende Element im Naviationsbereich auswählen
- Im obigen Menü **Exportieren** auswählen
- Ein Export-Format auswählen - wenn das Element in einer anderen DB verwendet werden soll dann evtl. SQL
- Mit OK wird (üblicherweise) in den Browser-Download-Ordner exportiert.