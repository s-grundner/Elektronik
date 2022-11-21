# 1 Netzwerke - Übungen

## ARP

Mit dem ARP wird einer IP-Adresse (IPv4) eine MAC-Adresse zugeordnet. Wenn eine Verbindung zu einer IP-Adresse aufgebaut werden soll und die MAC Adresse nicht bekannt ist, dann wird eine ARP Nachricht (ARP Request) mit der gesuchten IP und der MAC FF:FF:FF:FF:FF:FF gesendet. Nur derjenige Netzteilnehmer dessen IP mit der gesuchten übereinstimmt, antwortet und vervollständigt dabei mit der gesuchten MAC-Adresse (ARP Reply). Durch diese Antwort ist die physikalische Adresse bekannt und kann im eigenen Rechner gespeichert werden (ARP-Tabellen). Anzeige welche Zuordnungen (lokal) bekannt sind:

```
>arp -a

Schnittstelle: 192.168.137.1 --- 0x7
  Internetadresse       Physische Adresse     Typ
  192.168.137.254       ff-ff-ff-ff-ff-ff     statisch
  222.0.0.22            01-00-5a-00-00-16     statisch
  222.0.0.251           01-00-5a-00-00-fb     statisch
  222.0.0.252           01-00-5a-00-00-fc     statisch
  239.255.255.252       01-00-5e-7f-ff-fa     statisch

Schnittstelle: 10.0.0.4 --- 0x11
  Internetadresse       Physische Adresse     Typ
  10.1.2.1              68-65-59-05-93-fe     dynamisch
  10.1.2.3              34-24-87-4e-b9-ea     dynamisch
  10.1.2.138            30-33-f2-1b-11-c1     dynamisch
  10.1.2.255            ff-ff-ff-ff-ff-ff     statisch
  224.1.2.2             01-00-5a-00-00-02     statisch
  224.1.2.22            01-00-5a-00-00-16     statisch
  224.1.2.251           01-00-5a-00-00-fb     statisch
  224.1.2.252           01-00-5a-00-00-fc     statisch
  239.255.255.250       01-00-5a-7f-ff-fa     statisch
  255.255.255.255       ff-ff-ff-ff-ff-ff     statisch
```

Mittels `arp -d 100.10.10.3` kann ein (lokaler!) Eintrag gelöscht werden. Wird die Adresse anschließend angepingt, dann ist sie wieder in der Liste zu finden.

Ermitteln Sie die MAC-Adresse des eigenen Rechners. Finden Sie heraus ob es mehrere oder nur eine einzelne gibt (Windows:`ipconfig /all` oder `getmac`, Linux: `ifconfig`).

## Namensauflösung

(Windows und Linux)

Zugriff auf den DNS, ermitteln einer IP-Adresse eines entfernten Systems, zum Beispiel mittels `nslookup`:

```
c:\Windows>nslookup www.google.at
Server:  UnKnown
Address:  110.10.0.138

DNS request timed out.
    timeout was 2 seconds.
DNS request timed out.
    timeout was 2 seconds.
Nicht autorisierende Antwort:
Name:    www.google.at
Addresses:  2a00:1450:400d:808::2003
          172.217.20.3
```

Alternative mittels ping:

```
c:\Windows>ping www.google.at

Ping wird ausgeführt für www.google.at [172.217.20.3] mit 32 Bytes Daten:
Antwort von 172.217.20.3: Bytes=32 Zeit=22ms TTL=53
Antwort von 172.217.20.3: Bytes=32 Zeit=23ms TTL=53
Antwort von 172.217.20.3: Bytes=32 Zeit=21ms TTL=53
Antwort von 172.217.20.3: Bytes=32 Zeit=21ms TTL=53

Ping-Statistik für 172.217.20.3:
    Pakete: Gesendet = 4, Empfangen = 4, Verloren = 0
    (0% Verlust),
Ca. Zeitangaben in Millisek.:
    Minimum = 21ms, Maximum = 23ms, Mittelwert = 21ms
```

Ermitteln Sie die IP-Adresse des DNS-Servers und der Seite www.orf.at.

Mit `nslookup` kann auch umgekehrt, der Name zu einer IP ermittelt werden.

Welcher DNS wird verwendet? Das kann ermittelt werden mit der Eingabe von `nslookup`. Wenn dabei Standardserver: unknown kommt, dann wird automatisch der DNS des ISP gewählt.

## Namensauflösung (c++452)

Namen können auf drei Arten angegeben werden: als 32Bit Zahl, als Text (www.google.at) oder als Nummernnotation ("192.1.1.2").

POSIX definiert Funktionen zum Umwandeln einer Form in die jeweils Andere:

- gethostbyname
- gethostbyaddr
- inet_ntoa
- inet_addr

![NW_AdrAusloesung](bilder/NW_AdrAufloesung.png)

Die im folgenden Beispiel verwendete Struktur **hostent** beinhaltet Information über einen Host (Name, IP ...). Die Struktur **in_addr** speichert die NP-Adresse (Union - Byte und Wort-Weise).

Im folgenden C++ Beispiel werden sie Verwendet (MS-Windows) (c++452):

```c++
// Programm wird mit Aufrufparametern aufgerufen:
// 1. www.google.at     --> gethostbyname wird aufgerufen
// 2. 172.217.16.99     --> gethostbyaddr wird aufgerufen
#define WINVER 0x0A00

#include <winsock2.h>     // gethostby...
#include <stdio.h>          // printf
#include <iostream>

using namespace std;

int main(int argc, char **argv) {

    // Declare and initialize variables

    WSADATA wsaData;
    DWORD dwError;
    int i = 0;
    struct hostent *remoteHost;
    char *host_name;
    struct in_addr addr;
    char **pAlias;

    // Validate the parameters
    if (argc != 2) {
        printf("Usage: %s ipv4address\n", argv[0]);
        printf(" or\n");
        printf("  %s hostname\n", argv[0]);
        printf("   to return the host\n");
        printf("  %s 127.0.0.1\n", argv[0]);
        printf("   to return the IP addresses for a host\n");
        printf("  %s www.google.com\n", argv[0]);
        return 1;
    }

    // Initialize Winsock ---------------------------------------
    if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0) {
        printf("WSAStartup() failed with error code %d\n", WSAGetLastError());
        return 1;
    }
    else
        printf("WSAStartup() should be fine!\n");

    host_name = argv[1];
    // If the user input is an alpha name for the host, use gethostbyname()
    // If not, get host by addr (assume IPv4)

    if (isalpha(host_name[0])) {
        // host address is a name
        printf("Calling gethostbyname() with %s\n", host_name);
        remoteHost = gethostbyname(host_name);
    } else {
        printf("Calling gethostbyaddr() with %s\n", host_name);
        addr.s_addr = inet_addr(host_name);
        if (addr.s_addr == INADDR_NONE)
        {
            printf("The IPv4 address entered must be a legal address!\n");
            return 1;
        } else
            remoteHost = gethostbyaddr((char *) &addr, 4, AF_INET);
    }

    if (remoteHost == NULL) {
        dwError = WSAGetLastError();
        if (dwError != 0) {
            if (dwError == WSAHOST_NOT_FOUND) {
                printf("Host not found!\n");
                return 1;
            } else if (dwError == WSANO_DATA) {
                printf("No data record found!\n");
                return 1;
            } else {
                printf("Function failed with error code %ld\n", dwError);
                return 1;
            }
        }
    }
    else {
        printf("Function returned:\n");
        printf("\tOfficial name: %s\n", remoteHost->h_name);
        for (pAlias = remoteHost->h_aliases; *pAlias != 0; pAlias++) {
            printf("\tAlternate name #%d: %s\n", ++i, *pAlias);
        }
        printf("\tAddress type: ");
        switch (remoteHost->h_addrtype) {
        case AF_INET:
            printf("AF_INET\n");
            break;
        case AF_INET6:
            printf("AF_INET6\n");
            break;
        case AF_NETBIOS:
            printf("AF_NETBIOS\n");
            break;
        default:
            printf(" %d\n", remoteHost->h_addrtype);
            break;
        }
        printf("\tAddress length: %d\n", remoteHost->h_length);

        i = 0;
        while (remoteHost->h_addr_list[i] != 0) {
            addr.s_addr = *(u_long *) remoteHost->h_addr_list[i++];
            printf("\tIP Address #%d: %s\n", i, inet_ntoa(addr));
        }
    }
    return 0;
}
```

In der Datei `%windir%\System32\drivers\etc\hosts` (Linux: `/etc/hosts`) können Namen-Nummern-Zuordnungen erfolgen. Mittlerweile erfolgt diese Zuordnung über einen DNS-Server. Die hosts-Datei hat allerdings eine höhere Priorität, damit können Namen-Adressen umgeleitet werden (Eigene Website auf lokalen Server ...).

## Namensauflösung Qt

In Frameworks wie Qt sind viele Sachen komfortabler verfügbar (in der pro-Datei: `Qt += network`):

```c++
#include <QHostInfo>

// Eigener Hostname:    
qDebug() << QHostInfo::localHostName();

// Ausgabe der (ersten Adresse von www.google.at):
QHostInfo info = QHostInfo::fromName("www.google.at");
qDebug() << info.addresses()[0].toString();
```

## netsh / netstat

Mit `netsh` kann vieles konfiguriert werden

```
// Anzeigen sämtlicher gespeicherter WLAN-AccPoints :
> netsh wlan show profiles
// Sämtliche IP-Adressen anzeigen :
> netsh interface ipv4 show addresses
// Info zum WLAN :
> netsh wlan show interfaces
// Rechner als WLAN-Hotspot einsetzen :
> netsh wlan set hostednetwork mode=allow ssid=meinwlan key=meinwlan
> netsh wlan start hostednetwork
// Prüfen ob auf Port 3306 (MySQL-Standardport) eine Verbindung geöffnet ist :
> netsh int ipv4 show tcpconnections | find "3306"
// Prüfen welcher Port überhaupt offen :
> netstat -an
// Anzeigen der TCP Verbindungen welche die Zeichenfolge 51234 beinh. (siehe chat)
> netstat -anp TCP | find "51234"
```

Der Umfang dieses (Windows-Befehls) ist sehr groß, hier wird nicht weiter darauf eingegangen. (Linux: netstat)

## HTTP

<https://www.a-coding-project.de/ratgeber/http/einfuehrung>

- Ein Client fordert eine Verbindung an (Abfrage). Dafür wird eine Verbindung zwischen Client und Server aufgebaut, die wird auch gehalten bis zum Response, anschließend möglichst schnell wieder geschlossen.

Eine Anfrage kann so aussehen (GET):

```
GET /index.html HTTP/1.1
Host: www.html-world.de
User-Agent: Mozilla/5.0
Accept: image/gif, image/jpeg, */*
Connection: Keep-Alive
```

- Wie/Was/Wer - einfacher Abruf (Wie = GET, Was = *www.html-world.de*, Wer = Mozilla/5.0)
- ab der 2ten Zeile: Header (immer unterschiedlich)

für einen Abruf von `http://www.html-world.de/index.html`

- Aufsplitten Server/Datei

Antwort/Response:

```
HTTP/1.1 200 OK
Date: Thu, 15 Jul 2004 19:20:21 GMT
Server: Apache/1.3.5 (Unix)
Accept-Ranges: bytes
Content-length: 46
Connection: close
Content-type: text/html
       
<h1>Antwort</h1>
<p>Ich bin eine Antwort</p>
```

- Version/ResponseCode/ResponseCodeÜbersetzung
- Response-Header
- Leerzeile
- Entity-Bode (Seite als Text)

Abfrage-Arten: GET, POST, PUT, DELETE, LINK, UNLINK, TRACE, OPTIONS

### Browser

Der Inhalt des HTTP-Headers sieht folgendermaßen aus:

![](bilder/NW_http01.png)

### Telnet

Telnet ist ein Protokoll das direkt über TCP liegt. Damit können einfache TCP-Segmente als Zeichen formuliert werden. Zusätzlich gibt es eine Client-Anwendung die oft ebenfalls als Telnet bezeichnet wird.

**HTTP-Abfrage mittels Telnet**

Geben sie in der Kommandozeile ein zum Starten des Clients:

```
telnet
```

TCP-Anmeldung auf HTL-Salzburg auf Port 80:

```
o www.htl-salzburg.ac.at 80
```

TCP-Segmente (Leerzeichen müssen stimmen, Abschließen mit doppeltem \<Enter\>):

```
GET /startseite.html HTTP/1.1
host: www.htl-salzburg.ac.at

```

Die Antwort beginnt mit:

```
HTTP/1.1 200 OK
Date: Sun, 23 Feb 2020 08:35:49 GMT
Server: Apache
Cache-Control: must-revalidate, no-cache, no-store, private
Vary: Contao-Page-Layout
Contao-Page-Layout: desktop
X-Content-Type-Options: nosniff
Referrer-Policy: no-referrer-when-downgrade, strict-origin-when-cross-origin
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
Age: 0
Expires: Sun, 23 Feb 2020 08:36:00 GMT
Set-Cookie: PHPSESSID=dqm2enc8oc35tuqmcmabp4c70k; path=/; httponly
Content-Length: 40298
Connection: close
Content-Type: text/html; charset=utf-8

<!DOCTYPE html>
```

### OpenSSL

Für HTTPs:

```
C:\>openssl s_client -connect www.orf.at:443
....
GET / HTTP/1.1
HOST: www.orf.at
....
```

## HTTP-Abfrage Qt (c++476)

In neuen Qt-Versionen werden HTTP-Requests nicht mehr direkt abgesetzt sondern über den **Networkmanager**:

```c++
#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QNetworkAccessManager>
#include <QNetworkReply>

MainWindow::MainWindow(QWidget *parent)
  : QMainWindow(parent)
  , ui(new Ui::MainWindow)
{
  ui->setupUi(this);

  QNetworkRequest request;
  request.setUrl(QUrl("http://www.htl-salzburg.ac.at/startseite.html"));
  request.setRawHeader("host", "www.htl-salzburg.ac.at");

  QNetworkAccessManager *manager = new QNetworkAccessManager(nullptr);

  connect(manager, SIGNAL(finished(QNetworkReply*)), this,
	                          SLOT(replyFinished(QNetworkReply*)));

  manager->get(request);
}

MainWindow::~MainWindow() {
	delete ui;
}

void MainWindow::replyFinished(QNetworkReply* reply) {
	QString str = reply->readAll();
	ui->textBrowser->setHtml(str);
	ui->textEdit->setPlainText(str);
}
```

In diesem Beispiel wird direkt der Inhalt der HTL-Seite geladen und (als Text/HTML) angezeigt.

## HTTP-Abfrage (c#054)

HTTP-Zugriff via C#:

```c#
private static void tcpconnect() {
	byte[] buf = new byte[1024];
	string header = "GET /index.html HTTP/1.1\r\n" +
                  "Host: www.java2s.com\r\n" +
                  "Connection: close\r\n" +           /* alternativ keep-alive */
                  "User-Agent: Mozilla/5.0\r\n" +
                  "\r\n";

  var client = new TcpClient("www.java2s.com", 80);

  // send request
  client.Client.Send(System.Text.Encoding.ASCII.GetBytes(header));

  // get response
  int len = client.Client.Receive(buf);
  string response = System.Text.Encoding.UTF8.GetString(buf, 0, len);

  Console.WriteLine(response);
}
```

## HTTP-Datei-Download (c#055)

Mittels HTTP-GET können auch Dateien geladen werden:

```c#
String htlImg = "http://www.htl-salzburg.ac.at/files/HTL-Salzburg/content/grafiken/HTBLuVA_Salzburg_Logo.svg";
String imgPath = "c:\\temp\\htl_logo.svg";		// Pfad vorgeben

// Erzeugen eines HTTP-Request
HttpWebRequest httpRequest = (HttpWebRequest)WebRequest.Create(htlImg);
httpRequest.Method = WebRequestMethods.Http.Get;   // Get-Methode Einstellen

// Antwort des WebServers auf HTTP-Requests Lesen
HttpWebResponse httpResponse = (HttpWebResponse)httpRequest.GetResponse();
Stream httpResponseStream = httpResponse.GetResponseStream();

// Buffer fuer gestreamtes Lesen
int bufferSize = 1024;
byte[] buffer = new byte[bufferSize];
int bytesRead = 0;

// Lesen vom Server und Schreiben in Datei
FileStream fileStream = File.Create(imgPath);
while ((bytesRead = httpResponseStream.Read(buffer, 0, bufferSize)) != 0) {
    fileStream.Write(buffer, 0, bytesRead);
}
```
