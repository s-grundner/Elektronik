# 2 Netzwerke - Sockets

## Client/Server - Sockets

Der größte Teil der Kommunikation in Netzwerken findet zwischen Client- und Server-Prozessen statt.

![NW_ClientServerPrinzip](bilder/NW_ClientServerPrinzip.png)

Das Client-Server-Paar kann grundsätzlich mittels verschiedener Protokolle kommunizieren (solange beide das Gleiche verwenden).

Eine zentrale Frage im *Netzwerk*: *wie finden Client und Server zueinander?*

In sehr vielen Internet-Anwendungen wird sowohl Server- als auch Clientseitig entweder *TCP* oder *UDP* als Transportprotokoll verwendet. Manchmal wird auch direkt/roh auf *IP* aufgesetzt, entweder wenn kein Transportdienst benötigt wird, oder ein Transportdienst Teil der Anwendung selbst ist.

Für *UDP* und *TCP* werden deren *Portnummern* zur Identifikation verwendet. Standardapplikationen wie *FTP* oder *SMTP* bekommen Serverseitig *well-known-ports* (RFC). Lokale Portnummern eines Knotens werden vom Betriebssystem verwaltet.

Die Kombination von IP-Adresse und Portnummer wird als **Socket** bezeichnet. Eine Kommunikation Server-Client ist durch ein **Paar von Sockets** (Server-Socket, Client-Socket) definiert. Dadurch ist es möglich, dass zur gleichen Zeit zwei Clientprozesse gleichzeitig mit einem Server sprechen können.

Eine Socket-Interface-API wurde in den 1980er Jahren für UNIX-BSD (Berkeley Software Distribution) veröffentlicht. Mittlerweile ist es für viele Betriebssysteme verfügbar. Es bietet Verbindung zwischen Client und Server aufzubauen mittels TCP (Stream-Sockets), UDP (Datagram-Socket) oder direkt IP (Raw-Socket):

![NW_Socket_03](bilder/NW_Socket_03.png)

Die Unterstützung von Netzwerken/Internet ist allgemein Teil des Betriebssystems (wird oft als **TCP/IP-Stack** bezeichnet).

### TCP-Kommunikation

TCP garantiert den zuverlässigen Austausch von Daten (*verbindungsorientierte* Sockets). TCP-Sockets stellen erst eine Verbindung zu einem bestimmten Server her, tauschen dann Daten aus und schließen die Verbindung am Ende wieder.

In vielen Fällen bedient ein einzelner Server mehrere Clients. Dann wird der Server nach dem *accept()* einen neuen Prozess *forken* (abspalten) und mit dem Hauptthread weiter auf eine nächste Anfrage warten.

#### Server

Ein großer Unterschied zwischen Server und Client ist, dass ein Client für eine Verbindung lediglich 1 Socket benötigt. Soll ein Server nicht nur einen Client bedienen, dann benötigt der Server für jeden Client einen eigenen Socket. Für einen Serverseitigen Socket sind die folgenden Schritte notwendig. 

![Serversocket](bilder/NW_Socket_02.png)

Mit *accept* wird ein neuer Socket erzeugt (und es kann auf eine weitere Anfrage gewartet werden).

- Simple-Server: Ein einzelner Client kann sich auf einen Server verbinden.
- Forking/Spawning-Server: nach einem erfolgreichem Verbindungsaufbau (nach accept) wird die eigentliche Kommunikation in einen eigenen Prozess ausgelagert. Dazu wird im POSIX mittels fork() Systemaufruf gearbeitet (Telnet, FTP ...).
- Verbindungslose-Server: dieser Typ sendet nur eine einzige Nachricht bei einer Verbindungsanfrage durch einen Client. Typischerweise wird UDP verwendet (Beispiel Network-Time-Server...).

#### Client

Ein Client ist einer der beiden Endpunkt einer Kommunikation. Der grundsätzliche Ablauf einer Kommunikation ist in der folgenden Abbildung dargestellt:

![Clientsocket](bilder/NW_Socket_01.png)

#### Verbindungsaufbau

![Serversocket](bilder/NW_Socket_04.png)

### UDP-Kommunikation

Das UDP-Protokoll garantiert lediglich das Nachrichten korrekte Daten beinhalten. Es kann jedoch durchaus sein, dass nicht alle Pakete ankommen (oder die Reihenfolge nicht korrekt ist). UDP-Sockets sind *nicht verbindungsorientiert*. Bei UDP-Sockets wird nicht zuerst eine Verbindung mit einem Server hergestellt. Es wird ein Socket erstellt und anschließend ein Request direkt an einen Server geschickt. Da ja vorab keine Verbindung aufgebaut wurde, wird hier mit einer *sendto()* Funktion gearbeitet. Mit dieser Funktion wird der *Empfänger* mit angegeben. Analog dazu gibt es für den Empfang eine *recvfrom()* Funktion bei der nur Nachrichten eines bestimmten Empfängers angenommen werden. Auch bei UDP gilt es gibt Server und Clients. Der Server hat zusätzlich noch *bind()* mittels welchem der Port definiert wird.

Der Vorteil gegenüber der TCP-Kommunikation ist, dass dadurch eine stark reduzierte Datenmenge übertragen werden muss (es erfolgt kein Handshake mittels Checksummen...). Verwendet werden Datagramme für Daten bei denen es nicht unbedingt notwendig ist, dass sie ihr Ziel erreichen und große Datenmengen übertragen werden: Multimedia-Streams (im schlimmsten Fall Aussetzer) oder Computerspiele (im schlimmsten Fall ruckelnde Bewegungen von Spielfiguren).

![UDP](bilder/NW_Socket_UDP.png)

## Unterschiedliche OS

Für Standard-C sind keine Socket-Zugriffe verfügbar, daher muss mittels OS-APIs gearbeitet werden.

Soll unterschiedlicher Code für verschiedene Betriebssysteme kompiliert werden (etwa wie im folgenden unterschiedliche includes), kann das einfach mittels Compiler-Schalter gelöst werden:

```c++
#ifdef _WIN32
...
#elifdef _WIN64
...
#elifdef __unix__
...
#endif // _WIN32, _WIN64, __unix__
```

Die hier angeführten, verfügbaren Makros hängen vom Compiler ab. Die Kommunikation via Netzwerk machte es notwendig, dass Programme auf unterschiedlichen OS miteinander Kommunizieren. In den Netzwerkstandards ist etwa die Netzwerk-Byte-Folge definiert (Network-Byte-Oder). Auf dem Client oder Server weicht die Reihenfolge oft davon ab. Daher werden Adressen, Ports etc. immer über Konvertierungsfunktionen übergeben. Beispiel: hton (Host-To-Network ...)

### Windows

Für Windows muss eine Bibliothek mit eingebunden werden. Mittels dieser wird auf **ws2_32.dll** des Betriebssystems zugegriffen. In dieser Bibliothek ist eine volle Kompatibilität der Netzwerkzugriffe, wie sie in POSIX-Betriebssystemen gegeben sind, möglich.

- Es muss immer (zusätzlich zu allen anderen) mit **ws2_32.lib** gelinkt werden:

  ```
  g++ main.cpp -lws2_32
  ```

  In CMAKE muss dafür `CMakeLists.txt` angepasst werden (myExe ist der Name des Executables):

  ```
  if(WIN32)
    target_link_libraries(MyExe wsock32 ws2_32)
  endif()
  ```

- Im Programm muss der Header *winsock2.h* eingebunden werden. Für einige weitere notwendige Definitionen ist weiters der Header *ws2tcpip.h notwendig. Für diesen Header ist eine Definition der Windows-Version (0x0A00 = Windows10) notwendig:

  ```c++
  #define _WIN32_WINNT 0x0A00
  #include <winsock2.h>
  #include <ws2tcpip.h>
  ```
  
- für Winsock muss ein WSADATA-Objekt (Struktur) erstellt werden und *WSAStartup()* aufgerufen werden:

  ```c++
  WSADATA wsaData;
  
  int iResult = WSAStartup(MAKEWORD(2,2), &wsaData);  
  ```

  Mit diesem Aufruf wird die Verwendung von ws2_32.dll initialisiert. Sollte die Initialisierung funktionieren, dann wird *iResult = 0* zurückgegeben. Die *MAKEWORD*-Anweisung setzt die gewünschte Socket-Version auf Version 2.2.

- Nach dem Ende der Verwendung wird die Winsock-DLL entladen:

  ```c++
  int iResult = WSACleanup();    // Entladen Winsock-DLL, return 0 wenn OK
  ```

- für Optimierung bietet MS Defines an, mittels derer der Kompiliervorgang beschleunigt werden kann. Es werden dann einige Header nicht mit eingebunden (Kryptographische ...). Am einfachsten einfach setzen und probieren:

  ```
  #define VC_EXTRALEAN
  #define WIN32_LEAN_AND_MEAN
  ```

- Wenn in einem beliebigen Socket-Funktions-Aufruf ein Fehler auftritt, kann ein Fehlercode ausgelesen werden:

  ```c
  int r = WSAGetLastError();
  ```

**Zusammenfassend** bei Windows immer noch mit einbauen:

```c++
#include <winsock2.h>
#include <stdio.h>

int main() {
    WSADATA wsaData;

    int iResult = WSAStartup(MAKEWORD(2,2), &wsaData);
    if (iResult != 0) {
        printf("WSAStartup failed: %d\n", iResult);
        return 1;
    }

  	...
    iResult = WSACleanup();
    return 0;
}
```

und Linken mit **-lws2_32**.

### Unix/Linux

Es müssen folgende Header inkludiert werden:

```
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <arpa/inet.h>
#include <unistd.h>			// close()
```

Ein Fehlercode kann in UNIX-Systemen mittels der globalen Variable `errno` verarbeiten (Alternative zu Windows-*WSAGetLastError()*).

## Allgemein

Kommunikation über Netzwerke ist im Allgemeinen sehr kompliziert. Zur Entwicklung eines Programms welches im Netzwerk kommuniziert, ist es viel zu aufwändig die Netzwerksoftware jedes Mal aufs neue zu implementieren (bis hinunter zur HW-Ansteuerung).

Aus diesem Grund gibt es in modernen Betriebssystemen standardisierte Schnittstellen (APIs) mit welchen auf der Anwendungsebene gearbeitet werden kann, ohne sich um die darunterliegenden Schichten kümmern zu müssen. Ein Socket (kommt von Steckdose) ist damit eine Schnittstelle einer *End-To-End*-Verbindung.

Grundsätzlich bieten alle bedeutenden Programmiersprachen Bibliotheken für die Socket-Programmierung. Der Ablauf ist überall sehr ähnlich.

### Strukturen

- *sockaddr_in*

  mit dieser Struktur wird der Adresstyp, die Adresse und der Port spezifiziert (also der Socket).

	```c++
  struct sockaddr_in {
      short sin_family;
      u_short sin_port;
      struct in_addr sin_addr;
      char sin_zero[8]
  };
  ```
  
  - *sin_family*: meist *AF_INET* (AdressFamily-InternetProtocol)
  - *sin_port*: Port des Transport Protokolls
  - *sin_addr*: wiederum eine Struktur - beinhaltet die (IPv4) Adresse
  - *sin_zero[]*: reserviert - auf Null Setzen

- *in_addr*
  Struktur für die Spezifikation einer (IP-) Adresse.

  ```c++
  struct in_addr {
      uint32_t       s_addr;     /* address in network byte order */
  };
  ```

  - *s_addr*: IP-Adresse, wichtig: in Netzwerk-Byte-Order (die Byte-Order ist auf unterschiedlichen OS verschieden -> Konvertieren).

  Im Allgemeinen ist die Adresse nicht 32 Bit groß, das hängt selbstverständlich von den Protokollen ab (z.B. IPv4 oder IPv6). Daher werden die Strukturen in ihrer Verwendung immer nur als Zeiger mit der Größe übergeben. Je nach gewähltem Protokoll wird die Struktur dann entsprechend gecastet.
  
- *addrinfo*

  ```c++
  struct addrinfo {
      int              flags;
      int              family;
      int              socktype;
      int              protocol;
      socklen_t        addrlen;
      struct sockaddr *addr;
      char            *canonname;
      struct addrinfo *next;
  };
  ```

  - *flags*: Optionen die kombiniert werden können
  - *family*: gibt den Typ der Adresse an (*AF_INET*-IPv4, *AF_INET6*-IPv6, *AF_UNSPEC*-nicht näher definiert)
  - *socktype*: *SOCK_STREAM* oder *SOCK_DGRAM*
  - *protocol*: *IPPROT_UDP* oder *IPPROTO_TCP*
  - *addr_len*, *addr*: Zeiger auf die (eventuell 1te) Adresse des eben spezifizierten Typs 
  - *canonname*: (anerkannter) Name der Verbindung
  - *next*: mit der *addrinfo*-Struktur kann eine Liste gebaut werden. *next* verweist auf das nächste *addrinfo*-Element (oder ist NULL wenn nicht)

### GetAddrInfo

(Für Windows: include ws2tcpip.h) Für die Arbeit mit Sockets müssen obige Strukturen konfiguriert werden. Das übernimmt die Funktion *getaddrinfo()*:

```c++
int getaddrinfo(const char *node, const char *service, const struct addrinfo *hints, struct addrinfo **res)
```

- *node*: entweder Host-Name, Host-IP-Adresse (wenn Internet Protokoll) oder NULL für Server
- *service*: Portnummer (als String) oder Service-Name. Beispiel: "80" ist gleichbedeutend mit "http"
- *hints*: Einstellungen welcher Typ von Socket verwendet werden soll
- *res*: Zeiger auf eine Linked-List auf eine oder mehrere Addrinfo-Strukturen
- *return*: 0 wenn OK, Fehler können ansonsten mittels *gai_strerror* interpretiert werden (nicht Thread-Safe, besser Windows: *WSAGetLastError()*)

```c++
int iResult;
struct addrinfo hints;
struct addrinfo *servinfo;  			// will point to the results

memset(&hints, 0, sizeof hints); 	// make sure the struct is empty
hints.ai_family = AF_UNSPEC;     	// don't care IPv4 or IPv6
hints.ai_socktype = SOCK_STREAM; 	// TCP stream sockets
hints.ai_flags = AI_PASSIVE;     	// fill in my IP for me


if ((iResult = getaddrinfo("www.htl-salzburg.ac.at", "80", &hints, &servinfo)) != 0) {
  fprintf(stderr, "getaddrinfo error: %s\n", gai_strerror(iResult));
  exit(1);
  
  ...
  
freeaddrinfo(servinfo);
```

mit dem Parametern:

- *AF_UNSPEC*: nicht näher definiert, kann daher IPv4 oder IPv6 sein (alternativ z. B. *AF_INET* für IPv4)
- *AI_PASSIVE*: Adresse wird durch den Aufruf gegeben
- *SOCK_STREAM*: Stream-Socket (mehrfache Nachricht) im Gegensatz zu *Datagram* (einfache Nachricht)
- *gai_strerror*: Übersetzen eines Fehlercodes in einen String

Wenn die Verbindung nicht mehr benötigt wird, kann die allozierte Liste wieder mit *freeaddrinfo()* freigegeben werden.

Für eine Serveranwendung kann als erster Parameter *localhost* mitgegeben werden. Für eine Client-Anwendung (siehe Code) die Host-Adresse.

Die Auswertung des Ergebnisses kann beispielhaft so erfolgen (Variation je nach Protokoll), hier wird die IP-Adresse zu einer Host-Adresse ermittelt:

```c++
char adr[] = "www.google.at";
struct addrinfo hints;
struct addrinfo *servinfo;  			// will point to the results

memset(&hints, 0, sizeof hints); 	// make sure the struct is empty
hints.ai_family = AF_UNSPEC;     	// don't care IPv4 or IPv6
hints.ai_socktype = SOCK_STREAM; 	// TCP stream sockets
hints.ai_flags = AI_PASSIVE;     	// fill in my IP for me

if ((iResult = getaddrinfo(adr, "80", &hints, &servinfo)) != 0) {
  fprintf(stderr, "getaddrinfo error: %s\n", gai_strerror(iResult));
  exit(1);

}

printf("IP Addressen fuer %s:\n\n", adr);

for(addrinfo *p = servinfo;p != NULL; p = p->ai_next) {
  struct sockaddr_in *ipv4 = (struct sockaddr_in *)p->ai_addr;
  in_addr *addr = &(ipv4->sin_addr);

  // convert the IP to a string and print it:
  printf("  %s\n", inet_ntoa(*addr));
}

freeaddrinfo(servinfo);
```

Für die Adressstrukturen gibt es eine Vielzahl von Helfer-Funktionen. Leider variieren diese Funktionen je nach verwendeten Betriebssystem.

### Socket()

Ein Socket kann einfach erstellt werden:

```c++
int socket(int domain, int type, int protocol);
```

(https://docs.microsoft.com/en-us/windows/win32/api/winsock2/nf-winsock2-socket)

- *domain*: *AF_UNSPEC*, *AF_INET* (IPv4), *AF_IPX*  und Anderen
- *type*: *SOCK_STREAM*, *SOCK_DGRAM* und Andere
- *protocol*: *IPPROTO_TCP* (TCP/IP), *IPPROTO_UDP* (UDP)
- *return*: Socket-Deskriptor oder *INVALID_SOCKET*-Code (Fehler kann anschließend mittels *WSAGetLastError()* ermittelt werden).

Beispielhaft sinnvoll:

```c++
int s1 = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP); //TCP/IP-IPv4 Stream
int s2 = socket(AF_INET6, SOCK_DGRAM, IPPROTO_UDP); //UDP Datagram IPv6
```

### bind()

Für Serveranwendungen wird mittels *bind()* ein Port konfiguriert auf welchen gewartet werden soll (muss vor einem *Listen()* ausgeführt werden:

```c++
int bind(int sock, struct sockaddr *serv_addr, int serv_addrlen);
```

- *sock*: von *Socket()*
- *serv_addr*, *serv_addrlen*: auf welche Sockets soll der Server reagieren - bestehend aus Adress-Familie, Host-Adresse und Port-Nummer
- return: 0 wenn OK, *SOCKET_ERROR* (-1) sonst (kann mittels WSAGetLastError ermittelt werden)

Beispiel:

```c
struct sockaddr_in srvAddr;
srvAddr.sin_family = AF_INET;
srvAddr.sin_port = htons(51234);
srvAddr.sin_addr.s_addr = htonl(INADDR_ANY);

bind(mySock, (struct sockaddr*)&srvAddr, sizeof(struct sockaddr));
```

Mit dieser Konfiguration darf jede IP verbinden (*INADDR_ANY*). Alternativ wenn nur lokal verbunden werden darf:

```c
srvAddr.sin_addr.s_addr = inet_addr("127.0.0.1");
```

### connect()

Client-Anwendungen verbinden sich mittels *connect()*. Damit wird eine Verbindung zu einem spezifizierten Socket hergestellt:

```c++
int connect(int sock, struct sockaddr *serv_addr, int addlen)
```

- *sock*: von *Socket()*

- *serv_addr*, *serv_addrlen*: Beschreibung der Verbindung.

- *return*: 0 wenn OK, *SOCKET_ERROR* (-1) sonst (kann mittels WSAGetLastError ermittelt werden)

### listen()

Konfiguriert auf wie viele Anfragen gewartet werden soll. Bevor *listen()* aufgerufen wird, wird *bind()* aufgerufen und nach *listen()* folgt ein *accept()*:

```c++
int listen(int sock, int backlog)
```

- *sock*: von *Socket()*
- *backlog*: maximale Anzahl der Client-Anfragen die in einer Queue auf Antwort warten können (0 nur der erste kann rein). Für maximale Anzahl: SOMAXCONN. Defines siehe https://docs.microsoft.com/en-us/windows/win32/api/winsock2/nf-winsock2-listen
- *return*: 0 wenn OK, *SOCKET_ERROR* (-1) sonst (kann mittels WSAGetLastError ermittelt werden)

Beispiel:

```c
listen(mySock, 0);
```

### accept()

Weckt bei ankommenden Verbindungsanfragen und erhält die Client-Verbindungsinformation:

```c++
int accept(int sock, struct sockaddr *serv_addr, int *addlen)
```

- *sock*: von *Socket()*
- *serv_addr*, *serv_addlen*: (Optionaler) Parameter für die Rückgabe der Sockets der Verbindungen. Die Art der Struktur hängt von der Art der Verbindung ab. Mit addlen kann die Funktion die Anzahl der Anfragen mitgeben.
- *return*: Socket-Descriptor wenn OK, *INVALID_SOCKET*-Code sonst (kann mittels WSAGetLastError ermittelt werden)

Wenn die Client-Verbindungsdaten nicht weiter verwertet werden:

```c++
int cSocket = accept(mySock, NULL, NULL);
```

Wenn doch, dann:

```c++
struct sockaddr_storage cAddr;
socklen_t addr_size = sizeof(cAddr);
int cSocket = accept(mySock, (struct sockaddr *)&cAddr, &addr_size);
```

### send()

Senden von Daten (Stream-Sockets):

```c++
int send(int sock, const void *msg, int msglen, int flags)
```

- *sock*: von *Socket()*
- *msg*: Zeiger auf zu übertragende Daten 
- *msglen*: Anzahl der zu übertragenden Bytes beginnend von msg-Zeiger
- *flags*: gibt an wie die Daten übertragen werden sollen (kann auf 0 gesetzt werden)
- *return*: Anzahl der übertragenen Bytes (kann auch kleiner als msglen sein). Wenn ein Fehler auftritt kann ein *SOCKET_ERROR* (-1) übertragen werden (kann mittels WSAGetLastError ermittelt werden)

### sendto()

Senden von Daten (Datagramm-Socket)

```c++
int sendto(int sock, const void *msg, int msglen, int flags, struct sockaddr *myAddr, int addlen)
```

- *sock*: von *Socket()*
- *msg*: Zeiger auf zu übertragende Daten 
- *msglen*: Anzahl der zu übertragenden Bytes beginnend von msg-Zeiger
- *flags*: gibt an wie die Daten übertragen werden sollen (kann auf 0 gesetzt werden)
- *myAddr*, *addlen*: Optionaler Parameter für die Rückgabe der Beschreibung der Verbindung. Die Art der Struktur hängt von der Art der Verbinung ab. Mit addlen kann eine maximale Länge mitgegeben werden (sizeof(myAddr)).
- *return*: Anzahl der übertragenen Bytes (kann auch kleiner als msglen sein). Wenn ein Fehler auftritt kann ein *SOCKET_ERROR* (-1) übertragen werden (kann mittels WSAGetLastError ermittelt werden)

### recv()

Empfangen von Daten (von Stream-Sockets):

```c++
int recv(int sock, void *msg, int msglen, int flags)
```

- *sock*: von *Socket()*
- *msg*: Zeiger auf ein Empfangs-Array 
- *msglen*: Anzahl der maximal zu empfangenden Bytes (msg-Größe)
- *flags*: gibt an wie die Daten übertragen werden sollen (kann auf 0 gesetzt werden)
- *return*: Anzahl der tatsächlich empfangenen Bytes. Wenn ein Fehler auftritt: *SOCKET_ERROR* (-1) (kann mittels WSAGetLastError ermittelt werden)

### recvfrom()

Empfangen von Daten (von Datagramm-Sockets)

```c++
int recvfrom(int sock, void *msg, int msglen, int flags, struct sockaddr *myAddr, int *addlen)
```

- *sock*: von *Socket()*
- *msg*: Zeiger auf ein Empfangs-Array 
- *msglen*: Anzahl der maximal zu empfangenden Bytes (msg-Größe)
- *flags*: gibt an wie die Daten übertragen werden sollen (kann auf 0 gesetzt werden)
- *myAddr*, *serv_addrlen*: Optionaler Parameter für die Rückgabe der Beschreibung der Verbindung. Die Art der Struktur hängt von der Art der Verbinung ab. Mit addlen kann eine maximale Länge mitgegeben werden (sizeof(myAddr))
- *return*: Anzahl der tatsächlich empfangenen Bytes. Wenn ein Fehler auftritt: *SOCKET_ERROR* (-1) (kann mittels WSAGetLastError ermittelt werden)

### close()

Schließen des Sockets

```c++
close(int sock)
```

- *sock*: von *Socket()*

Möglichkeit mit mehr Kontrolle: `int shutdown(int sock, int how)`.

In Unix funktioniert *close()* da hier die Strategie ist, Sockets wie Dateien zu behandeln. In vielen anderen Betriebssystemen funktioniert das nicht, oft klappt dann *closesocket()*.

### getpeername()

Ermitteln des Peers (zweiter Teilnehmer) am verbundenen Socket:

```c++
int getpeername(int sock, struct sockaddr *addr, int *addrlen)
```

- *sock*: von *Socket()*

- *addr*: Struktur mit der Adress-Information des Peers (zweiter Teilnehmers)

- *addrlen*: damit kann die Größe der Struktur an die Funktion mitgegeben werden

- *return*: 0 wenn kein Fehler aufgetreten ist, Sonst *SOCKET_ERROR* (-1) (kann mittels WSAGetLastError ermittelt werden)

### gethostname()

Ermitteln des Namens des Host-Rechners (auf dem das Programm läuft):

```c++
int gethostname(char *hostname, size_t size)
```

- *hostname*: Zeiger auf ein Array wohin der Name geschrieben wird

- *size*: Größe des Arrays (maximale Anzahl der zu schreibenden Zeichen)

- *return*: 0 wenn kein Fehler aufgetreten ist, Sonst *SOCKET_ERROR* (-1) (kann mittels WSAGetLastError ermittelt werden)

## Daten Aufbereitung

### Konvertierung IP-Adresse/Port

- Windows

  ```c++
  sockaddr_in RecvAddr;
  RecvAddr.sin_addr.s_addr = inet_addr("127.0.0.1");	// cstring->32bit-Ip
  
  inet_ntoa(((SOCKADDR_IN*)&cliAddr)->sin_addr); // 32bit-Ip->cstring
  ```

- Linux

  ```c++
  #include <arpa/inet.h>
  sockaddr_in RecvAddr;
  int res = inet_aton("127.0.0.1", &RecvAddr.sin_addr);
  ```

für beide gilt:

```c++
 RecvAddr.sin_port = htons(Port);    // host to networkByteOrder
```

### Übertragung

Um Daten im Netzwerk zu übertragen gibt es unterschiedliche Möglichkeiten:

- Übertragung als Text (zum Beispiel mit sprintf aufbereiten) - 
  Problem: eventuell schwierige Daten-Interpretation
- Übertragung der Rohdaten - Problem: wenn der Empfänger nicht exakt die gleiche Struktur verwendet ...
- Übertragung als Binärdaten

C-Strings werden mit '\0'  terminiert. Soll 0 übertragen werden, dann ist der String schon zu Ende. Daher werden Strings als **binäre Strings** übertragen. Dabei wird zuerst als erstes Byte die Länge des Strings Übertragen und anschließend der String.

Zahlen werden je nach System in unterschiedlicher Byte-Reihenfolge verarbeitet (little/big endian). Für die eindeutige Interpretation werden Zahlen in die **Netzwerk-Byte-Reihenfolge** konvertiert. Dabei helfen die Funktionen:

​	htons()	host to network short
​	htonl()	host to network long
​	ntohs()	network to host short
​	ntohl()	network to host long

## Referenzen

- Einführung
  www.beej.us/guide/bgnet/html
  
- Winsocket von MS
  https://docs.microsoft.com/en-us/windows/win32/winsock/creating-a-basic-winsock-application
  
- Gute Protokoll-Zusammenfassung:

  https://kompendium.infotip.de/netzwerktechnologie2-referenzmodelle-und-protokolle.html

- Socket-Programmierung mit C#
  <https://docs.microsoft.com/de-de/dotnet/framework/network-programming/sockets>

- Windows-Tools:
  
  ###### https://kompendium.infotip.de/netzwerkbefehle-der-windows-kommandozeile.html