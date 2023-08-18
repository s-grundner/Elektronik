# 9 Sicherheit

Die Sicherheit beginnt beim Datenbank-System-Design

- Applikationen sollten sich mit der Datenbank nie als deren Eigentümer/Superuser (Root) verbinden/können. Dazu werden diese Administrator-Konten so angelegt, dass Sie nur Zugriff von localhost haben.
- Legen Sie für Zugriffe aus Applikationen eigene Benutzer an, die auch nur dürfen was sie können müssen.
- Datenbank- oder Geschäftslogik hat nichts in der Webapplikation verloren. Diese Logik gehört in die Datenbank selber in Form von Sichten, Triggern oder Regeln. Umso weniger die Datenbank nach außen von ihrem Aufbau verrät desto besser.

Datenbankverbindung

- Verbindung zwischen Server und Client mittels TLS - eine nicht verschlüsselte Verbindung kann einfach mitgelesen werden. Alle nennenswerten Datenbanksysteme (so auch MariaDB oder MySQL) bieten eine TLS Kommunikation.

Speichermodell

- Die Art eine Datenbank zu speichern kann ebenfalls verschlüsselt werden (Mcrypt, Mhash... anstelle von etwa InnoDB).

## SQL-Injection

Arbeiten Sie mit [./DB_09_Sicherheit/](./DB_09_Sicherheit/)

![](bilder/xkcd-bobby-tables.png)

## TLS für den XAMPP-Webserver

Vorweg: funktioniert nicht für die MariaDB. Die Datenbank muss selber auf TLS konfiguriert werden und das funktioniert nicht in der XAMPP-Umgebung.

### Erstellen einer *virtuellen Domäne*

In Windows erweitern der Datei c:\\windows\\system32\\drivers\\etc\\hosts:

```
127.0.0.1         suchServer.com www.suchServer.com
127.0.0.1         idx.suchServer.com
```

Die Adresse 127.0.0.1 ist immer der eigene Rechner, er wird vom DNS an sich selbst zurückgeschickt. localhost ist ähnlich, es ist der eigene Rechner der nicht nach außen übertragen wird.

Für xampp muss noch der Webserver konfiguriert werden. Dazu wird der folgende Teil in `C:\xampp\apache\conf\extra\httpd-vhosts.conf` eingefügt:

```
<VirtualHost *:80>
    ServerAdmin webmaster@suchserver.com
    DocumentRoot "C:/xampp/htdocs/suchserver.com"
    ServerName suchserver.com
</VirtualHost>
```

Der Standard Port für HTTP lautet 80. Das Verzeichnis `C:/xampp/htdocs/suchserver.com` muss es geben und darin ein `index.html`.

### Erstellen eines Zertifikats

Dazu müssen wir `C:\xampp\apache\makecert.bat` starten:

```
c:\xampp\apache>makecert.bat
Generating a RSA private key
.......................+++++
....+++++
writing new private key to 'privkey.pem'
Enter PEM pass phrase:
Verifying - Enter PEM pass phrase:
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:AT
State or Province Name (full name) [Some-State]:Salzburg
Locality Name (eg, city) []:Salzburg
Organization Name (eg, company) [Internet Widgits Pty Ltd]:HTBLuVA-Salzburg
Organizational Unit Name (eg, section) []:Elektronik & Techn. Informatik
Common Name (e.g. server FQDN or YOUR name) []:suchserver
Email Address []:webmaster@suchserver.com

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:suchserver
An optional company name []:suchserver
Enter pass phrase for privkey.pem:
writing RSA key
Signature ok
subject=C = AT, ST = Salzburg, L = Salzburg, O = HTBLuVA-Salzburg, OU = Elektronik & Techn. Informatik, CN = suchserver, emailAddress = webmaster@suchserver.com
Getting Private key
c:\xampp\apache\.rnd konnte nicht gefunden werden
        1 Datei(en) verschoben.
        1 Datei(en) verschoben.

-----
Das Zertifikat wurde erstellt.
The certificate was provided.

Drücken Sie eine beliebige Taste . . .
```

Damit wurde ein Zertifikat unter `C:\xampp\apache\conf\ssl.crt` und `C:\xampp\apache\conf\ssl.key`

Die Konfiguration des Webservers muss noch angepasst werden, dazu wird noch einmal die Datei `C:\xampp\apache\conf\extra\httpd-vhosts.conf` erweitert (für TLS ist der Standardport 443):

```
<VirtualHost *:443>
    ServerAdmin webmaster@suchserver.com
    DocumentRoot "C:/xampp/htdocs/suchserver.com"
    ServerName suchserver.com
	SSLEngine on
	SSLCertificateFile "conf/ssl.crt/server.crt"
	SSLCertificateKeyFile "conf/ssl.key/server.key"
</VirtualHost>
```

Damit ist die Konfiguration abgeschlossen. Allerdings akzeptiert der Browser die Seite noch nicht, da das Zertifikat selbst ausgestellt wurde. Um die Seite anzuzeigen muss für dieses Zertifikat eine Ausnahme eingetragen werden.

## XAMPP

XAMPP ist ein Werkzeug das eine sehr große Hilfe in der Entwicklung von Datenbanken darstellt. Allerdings muss klar sein, dass es nicht mit der Installation Sicher konfiguriert ist. Auf alle Fälle empfiehlt es sich in der Entwicklung den Webserver Apache nur auf localhost:80 zu konfigurieren. Weiters sind die MySQL-Benutzer (root) so zu konfigurieren, dass sie lediglich von localhost Zugriff haben.

## Referenzen

- SQL-Injection
  <https://www.php.net/manual/de/security.database.sql-injection.php>

- TLS für XAMPP
  <https://florianbrinkmann.com/4837/https-virtual-hosts-xampp/>

  

  

  

  

  ## 