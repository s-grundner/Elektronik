# w2 Socket - Übungen

## C UDP Server/Client

![UDP](bilder/NW_Socket_UDP.png)

Der folgende Server kann gestartet werden und wartet auf eine Client-Anfrage. Der anschließend gezeigte Client sendet einen String und wird beendet.

### Serversoftware (c405)

Die Reihenfolge für einen UDP-Server:

WinTreiber Starten -> socket() -> bind() -> recvfrom() -> closesocket() -> WinTreiber Entladen:

```c
WSADATA wsaData;
WSAStartup(MAKEWORD(2,2), &wsaData);
...
int s = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
...
bind(s, (struct sockaddr *)&srvAddr, sizeof(srvAddr));
...
recvfrom(s, str, 100, 0, (struct sockaddr *)&cliAddr, &sz); // nach str mit 100 Bytes
...
closesocket(s);
...
WSACleanup();
```

Für *bind* muss eine Konfigurations-Struktur erzeugt werden, die beinhaltet: Protokoll (IPv4...), wer darf verbinden (IP ...) und auf welchem Port (Details hängen vom Protokoll ab). Da UDP ein Verbindungsloses Protokoll ist, wird in jedem *recvfrom* eine Struktur zurückgegeben mit der Information des verbindenden Clients.

Im folgenden Beispiel wird konfiguriert:

- AF_INET: IPv4
- INADDR_ANY: Clients mit beliebiger IP dürfen verbinden
- Port 51234

```c
#include <winsock2.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
  // Win Only: Treiber Starten ==========================
  WSADATA wsaData;
  printf("Treiber: %i\n", WSAStartup(MAKEWORD(2,2), &wsaData));

  // socket() ===========================================
  int s = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
  printf("socket:  %i\n", s);

  // bind() =============================================
  struct sockaddr_in srvAddr;
  srvAddr.sin_family = AF_INET;
  srvAddr.sin_port = htons(51234);
  srvAddr.sin_addr.s_addr = htonl(INADDR_ANY);

  printf("bind:    %i\n", bind(s, (struct sockaddr *)&srvAddr, sizeof(srvAddr)));

  // recvfrom() ===========================================
  struct sockaddr_in cliAddr;
  char str[100];
  int sz = sizeof(cliAddr);
  printf("recvfrom: %i\n", recvfrom(s, str, 100, 0, (struct sockaddr *)&cliAddr, &sz));
  printf("str:      %s\n", str);

  // close() ============================================
  closesocket(s);

  // Win Only: Treiber Beenden ==========================
  WSACleanup();
  return 0;
}
```

Kompiliert wird mit der Linker-Option *-lws2_32*.

### Clientsoftware (c406)

Die Reihenfolge für einen UDP-Client:

WinTreiber Starten -> socket() -> sendto() -> closesocket() -> WinTreiber Entladen:

```c
WSADATA wsaData;
WSAStartup(MAKEWORD(2,2), &wsaData);
...
int s = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
...
sendto(s, str, 100, 0, (struct sockaddr *)&srvAddr, sz); // versende 100 Bytes von str
...
closesocket(s);
...
WSACleanup();
```

Für *sendto* muss eine Konfigurations-Struktur erzeugt werden, die beinhaltet: Protokoll (IPv4...), an welchem Server gesendet werden soll (IP ...) und auf welchem Port (Details hängen vom Protokoll ab).

Im folgenden Beispiel wird konfiguriert:

- AF_INET: IPv4
- 127.0.0.1: eigener Rechner
- Port 51234

```c
#include <winsock2.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
  // Win Only: Treiber Starten ==========================
  WSADATA wsaData;
  printf("Treiber: %i\n", WSAStartup(MAKEWORD(2,2), &wsaData));

  // socket() ===========================================
  int s = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
  printf("socket:  %i\n", s);

  // sendto() ===========================================
  char str[100] = "Hallo Server!";

  struct sockaddr_in srvAddr;
  srvAddr.sin_family = AF_INET;
  srvAddr.sin_port = htons(51234);
  srvAddr.sin_addr.s_addr = inet_addr("127.0.0.1");
  int sz = sizeof(srvAddr);

  printf("sendto:  %i\n", sendto(s, str, 100, 0, (struct sockaddr *)&srvAddr, sz));

  // close() ============================================
  closesocket(s);

  // Win Only: Treiber Beenden ==========================
  WSACleanup();
  return 0;
}
```

Kompiliert wird mit der Linker-Option *-lws2_32*.

## C TCP Server/Client

### Serversoftware (c402)

![Serversocket](bilder/NW_Socket_02.png)

Einfacher Zugriff (ohne irgendwelche Fehlerprüfungen und mit direkten Zugriff in die Struktur) auf den Windows-Socket-Treiber. Damit das klappt muss mit **-lws2_32** gelinkt werden.

Für Server: socket()->bind()->listen()->accept()->...warten und kommunizieren ...->close()

```c
#define _WIN32_WINNT 0x0A00
#include <winsock2.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    // Win Only: Treiber Starten ==========================
    WSADATA wsaData;
    printf("WSAStartup(): % i\n", WSAStartup(MAKEWORD(2,2), &wsaData));

    // socket() ===========================================
    int s = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    printf("socket: % i\n", s);

    // bind() =============================================
    struct sockaddr_in srvAddr;
    srvAddr.sin_family = AF_INET;
    srvAddr.sin_port = htons(51234);
    srvAddr.sin_addr.s_addr = htonl(INADDR_ANY);
    //srvAddr.sin_addr.s_addr = inet_addr("127.0.0.1"); // nur von dieser

    printf("bind: % i\n", bind(s, (struct sockaddr*)&srvAddr, sizeof(struct sockaddr)));

    // listen() ===========================================
    printf("listen: % i\n", listen(s, 0));

    // accept() ===========================================
    struct sockaddr cliAddr;
    int size = sizeof(cliAddr);
    int comSock = accept(s, &cliAddr, &size);
    printf("accept: % i\n", comSock);
    printf("Request von: %s\n", inet_ntoa(((SOCKADDR_IN*)&cliAddr)->sin_addr));

    // close() ============================================
    printf("closesocket: % i\n", closesocket(s));
    printf("closesocket: % i\n", closesocket(comSock));

    // Win Only: Treiber Beenden ==========================
    printf("WSACleanup(): % i\n", WSACleanup());
    return 0;
}
```

Mit *Accept* wird ein neuer Socket *comSock* zurückgegeben. Dieser kann anschließend für die Kommunikation mit dem Client verwendet werden. Der ursprüngliche Socket *s* kann weiterverwendet werden um auf einen weiteren Client zu warten, dazu muss wieder *accept*  aufgerufen werden (in einem parallelen Thread/Prozess).

Vor *close* wird in einer "sinnvollen" Anwendung kommuniziert (send/recv).

### Clientsoftware (c403)

![Clientsocket](bilder/NW_Socket_01.png)

Einfacher Zugriff (ohne irgendwelche Fehlerprüfungen) auf den Windows-Socket-Treiber. Damit das klappt muss mit **-lws2_32** gelinkt werden.

Für Client: socket()->connect()->...Senden/Empfangen...->close()

```c
#define _WIN32_WINNT 0x0A00
#include <winsock2.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    // Win Only: Treiber Starten ==========================
    WSADATA wsaData;
    printf("WSAStartup(): % i\n", WSAStartup(MAKEWORD(2,2), &wsaData));

    // socket() ===========================================
    int s = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    printf("socket: % i\n", s);

    // connect() ==========================================
    struct sockaddr_in srvAddr;
    srvAddr.sin_family = AF_INET;
    srvAddr.sin_port = htons(51234);
    srvAddr.sin_addr.s_addr = inet_addr("127.0.0.1");

    printf("connect: % i\n", connect(s, (SOCKADDR*)&srvAddr, sizeof(SOCKADDR)));

    // close() ============================================
    printf("closesocket: % i\n", closesocket(s));

    // Win Only: Treiber Beenden ==========================
    printf("WSACleanup(): % i\n", WSACleanup());    return 0;
}
```

Vor *close* wird in einer "sinnvollen" Anwendung kommuniziert (send/recv).

## C Select - Chat-Server (c400)

![NW_ClientServer](bilder/NW_ClientServer.png)

In vielen Anwendungen soll ein Server nicht nur einen Client bedienen, sondern gleichzeitig mehrere Clients. Für TCP-Socket-Lösungen kann der Server, wenn er mittels *accept* einen Socket für die Kommunikation erhält, die Kommunikation mit diesem in einen neuen Thread verschieben. Offensichtlich sind manche (zumindest Windows-API-) Socket-Funktionen nicht *Thread-Safe* (keine seriöse Angabe!). Probleme die grundsätzlich auftreten:

- recv() blockiert (haltet den Thread an), während es auf Anfragen wartet
- accept() blockiert, während es auf neue Clients wartet

Eine alternative Möglichkeit wird von den Betriebssystemen mittels *select*-API (POSIX) angeboten.

- Diese Funktion wird in einer Schleife aufgerufen
- Filedeskriptoren (FDs) also (auch) Sockets können dem Select mitgegeben werden
- Select blockiert - wenn es wartet steht der Thread an seiner Stelle
- Wenn Select wartet legt er sich schlafen
- Wenn Daten an den angegebenen File-Deskriptoren ankommen, dann wird die Applikation geweckt und arbeitet weiter

Die Select-Funktion wird mit Listen von zu überwachenden File-Deskriptoren gestartet. Wenn sie endet (ein Socket-Ereignis passiert), dann beinhalten die Listen nur mehr diejenigen Deskriptoren, die das Ereignis ausgelöst haben (daher Liste vor der Verwendung kopieren).

In UNIX-OS wird sehr viel mit File-Deskriptoren gelöst, so auch hier. Mittels Socket kann eine Netzwerkverbindung wie ein Dateizugriff verstanden werden - daher *File*-Deskriptoren.

Syntax *select*:

```c
int select(
    int nfds,
    fd_set FAR *readfds,
    fd_set FAR *writefds,
    fd_set FAR *exceptfds,
    const struct timeval FAR *timeout
);
```

- *nfds*: Nummer des größten, angegebenen FDs + 1 (ist nur für UNIX notwendig)

- *readfds*: Array mit Socket-Nummern die auf Lesbarkeit geprüft werden (Nachrichten ankommen)

- *writefds*: Array mit Socket-Nummern die auf Schreibbarkeit geprüft werden (Nachrichten ausgehend, wenn auf einen freien Ausgabeplatz gewartet wird)

- *exceptfds*: Array mit Socket-Nummern für die auf Exceptions geprüft werden soll

- *timeout*: Zeit die maximal gewartet werden soll

- *return*: Anzahl der auslösenden fds-Ereignisse, 0 wenn Timeout oder SOCKET_ERROR (-1) wenn Abbruch

  ```c
  struct timeval {
      long tv_sec
      long tv_usec
  };
  ```

Das oben verwendete *\*fd_set* ist tatsächlich nichts anderes als eine Liste von Socket-Nummern. Allerdings ist diese Liste in unterschiedlichen OS verschieden aufgebaut, es empfiehlt sich daher entsprechende Makros für die Arbeit damit zu verwenden:

```c
FD_ZERO(*set);      //	Löscht den Inhalt des fd_set's
FD_SET(s, *set);    //	Fügt den Socket s dem fd_set hinzu
FD_CLR(s, *set);    // 	Entfernt den Socket s aus dem fd_set
FD_ISSET(s, *set);  //	Prüft ob der Socket s im fd_set vorhanden ist
```

wobei *set* hier ein Zeiger auf ein *fd_set* ist und *s* der Socket.

Beispiel für die Verwendung der Hilfsfunktionen:

```c
FD_SET mySet;
SOCKET sock1;
SOCKET sock2;
int rc;

FD_ZERO(&mySet);              // fd_set leeren
FD_SET(sock1, &mySet);        // sock1 hinzufuegen
FD_SET(sock2, &mySet);        // sock2 inzufuegen
rc = FD_ISSET(sock1, &mySet); // rc = 1/TRUE weil sock1 in mySet
```

Typische Struktur:

![NW_Socket_Select](bilder/NW_Socket_Select.png)

Bis *listen* ist die Server-Initialisierung wie für Single-Client-Lösungen. Dann wird die File-Deskriptor-Struktur mit dem *listening Socket* initialisiert und eine Endlosschleife mit *select* gestartet. Bei jedem Verlassen von *select* wird der auslösende Socket ermittelt mit *FD_ISSET*. Je nach Ursache wird dann entweder ein neuer Client dazu genommen (*accept*-Pfad) oder eine Nachricht erhalten. Wenn die erhaltene Nachricht 0 zurückgibt bedeutet das, dass sich der zugehörige Client getrennt hat.

Chat-Server-Beispiel (c407):

Ein TCP-Server auf Port 51234 verbindet anfragende Clients und repliziert einkommende Botschaften an sämtliche verbunden Clients:

```c
#include <winsock2.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    // Win Only: Treiber Starten ==========================
    WSADATA wsaData;
    printf("Treiber: %i\n", WSAStartup(MAKEWORD(2,2), &wsaData));

    int listenFd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    // socket() ===========================================
    printf("socket:  %i\n", listenFd);

    // bind() =============================================
    struct sockaddr_in srvAddr;
    srvAddr.sin_family = AF_INET;
    srvAddr.sin_port = htons(51234);
    srvAddr.sin_addr.s_addr = htonl(INADDR_ANY);

    printf("bind:    %i\n", 
           bind(listenFd, (struct sockaddr *)&srvAddr, sizeof(srvAddr)));

    // listen() ===========================================
    printf("listen:  %i\n", listen(listenFd, SOMAXCONN)    );

    fd_set myFdList;
    FD_ZERO(&myFdList);
    FD_SET(listenFd, &myFdList);
    int maxFd = listenFd;
    //rc = ioctl(listen_Fd, FIONBIO, (char *)&on); // unblocking ein/aus

    while(1) {
        // cpyFd wird durch select veraendert - es werden nur die 
        // ausloesende FDs eingetragen daher kopieren:
        fd_set cpyFd = myFdList;
        int res = select(maxFd, &cpyFd, NULL, NULL, NULL);

        if (FD_ISSET(listenFd, &cpyFd)) {  // Neuer Client meldet sich am
                                           // Well-Known-Socket
            struct sockaddr_in cliAddr;
            int sz = sizeof(cliAddr);
            int cliSock = accept(listenFd, (struct sockaddr*)&cliAddr, &sz);
            printf("accept:  %i\n", cliSock);
            FD_SET(cliSock, &myFdList);
            if (cliSock > maxFd) maxFd = cliSock;
        }
        for (SOCKET i=1; i <= maxFd; i++) {
            if (i != listenFd) {
                if (FD_ISSET(i, &cpyFd)) {        // recv-Socket gefunden
                    char str[100];
                    res = recv(i, str, 100, 0);   // <- nicht blockierend
                    if (res <= 0) {
                        printf("socket %i hat sich abgemeldet\n", i);
                        closesocket(i);
                        FD_CLR(i, &myFdList);
                    } else {
                        str[res] = 0;
                        printf("%s", str);
                        for (SOCKET j=1; j <= maxFd; j++) {
                            if (FD_ISSET(j, &myFdList) && (j != listenFd) && (j != i)) {
                                send(j, str, res, 0);
                            }
                        }
                    }
                }
            }
        }
    }

    // close() ============================================
    closesocket(listenFd);

    // Win Only: Treiber Beenden ==========================
    WSACleanup();
    return 0;
}
```

## C Port-Scanner

Eine *Portscanner*-Software sucht nach verfügbaren Diensten an einer IP-Adresse. Da Port-Nummern üblicherweise bestimmten Diensten zugewiesen sind (80->HTTP), wird geprüft ob auf eine Verbindungs-Anfrage auf einer Portnummer geantwortet wird. Dafür gibt es unterschiedliche Methoden, eine sehr Einfache ist hier vorgestellt:

```c
#include <sys/types.h>
#include <winsock2.h>
#include <string.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
    struct sockaddr_in addr;
    struct servent *serv;
    int s, i;
    unsigned long begin, end, curr;

    if (argc < 3) {
        fprintf(stderr, "usage: %s <begin> <end>\n", argv[0]);
        return 1;
    }
    WSADATA wsaData;
    WSAStartup(MAKEWORD(2,2), &wsaData);

    begin = ntohl(inet_addr(argv[1]));
    end = ntohl(inet_addr(argv[2]));

    if (begin > end) {
        curr = end;
        end = begin;
        begin = curr;
    }

    for (curr = begin; curr <= end; curr++) { // from ip1..ip2
        addr.sin_addr.s_addr = htonl(curr);
        printf("%s:\n", inet_ntoa(addr.sin_addr));

        for (i = 0; i < 1024; i++) { // all ports 0..1024
            s = socket(PF_INET, SOCK_STREAM, 0);
            if (s == -1) {
                perror("socket() failed");
                return 3;
            }

            addr.sin_addr.s_addr = htonl(curr);
            addr.sin_port = htons(i);
            addr.sin_family = AF_INET;
            printf("%i\r", i);
            fflush(stdout);

            if (!connect(s, (struct sockaddr*)&addr, sizeof(addr))) {
                serv = getservbyport(addr.sin_port, "tcp");
                if (serv)
                    printf("%i (%s) open\n", i, serv->s_name);
                else
                    printf("%i (unknown) open\n", i);
            }
            closesocket(s);
        }
        WSACleanup();
        printf("----");
    }
    return 0;
}
```

Dabei wird lediglich mit *connect* geprüft ob eine Verbindung möglich ist. Wenn eine Verbindung möglich ist wird nicht nur die Portnummer ausgegeben sondern auch der Service der dieser Nummer zugeordnet ist.

## C TCP-Sniffer (cpp471)

Um Nachrichten zu empfangen die nicht an den Host adressiert sind muss der Adapter in den Promiscuous-Mode geschaltet werden. Voraussetzung ist, dass das überhaupt zulässig ist (abhängig von der Hardware) und dass der Benutzer die Anwendung als Admin betreibt.

- Bei der Erzeugung eines Sockets muss *SOCK_RAW* angegeben werden
- Anschießend muss mittels *WSAIoctl* in den Promiscuous-Mode geschaltet werden

Hier ein Beispiel wenn TCP-Pakete mit dem Zielport 51234 angezeigt werden sollen:

```c++
#include <winsock2.h>
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void translate_ip(DWORD _ip, char *_cip);
void get_this_machine_ip(char *_retIP);

#define LS_HI_PART(x)  ((x>>4) & 0x0F)
#define LS_LO_PART(x)  ((x) & 0x0F)
#define LS_MAX_PACKET_SIZE 65535
#ifndef SIO_RCVALL
#  define SIO_RCVALL    _WSAIOW(IOC_VENDOR,1)
#endif

// Nachrichten auf diesem Port Lesen:
#define PORT 51234

typedef struct _IP_HEADER_ {
    BYTE  ver_ihl;        // Version (4 bits) and Internet Header Length (4 bits)
    BYTE  type;           // Type of Service (8 bits)
    WORD  length;         // Total size of packet (header + data)(16 bits)
    WORD  packet_id;      // (16 bits)
    WORD  flags_foff;     // Flags (3 bits) and Fragment Offset (13 bits)
    BYTE  time_to_live;   // (8 bits)
    BYTE  protocol;       // (8 bits)
    WORD  hdr_chksum;     // Header check sum (16 bits)
    DWORD source_ip;      // Source Address (32 bits)
    DWORD destination_ip; // Destination Address (32 bits)
} IPHEADER;

typedef struct _TCP_HEADER_ {
    WORD  source_port;       // (16 bits)
    WORD  destination_port;  // (16 bits)
    DWORD seq_number;        // Sequence Number (32 bits)
    DWORD ack_number;        // Acknowledgment Number (32 bits)
    WORD  info_ctrl;         // Data Offset (4 bits), Rsrvd (6 bits), Ctrl bits (6 bits)
    WORD  window;            // (16 bits)
    WORD  checksum;          // (16 bits)
    WORD  urgent_pointer;    // (16 bits)
} TCPHEADER;

typedef struct _ICMP_HEADER_ {
    BYTE type;               // (8 bits)
    BYTE code;               // (8 bits)
    WORD checksum;           // (16 bits)
} ICMPHEADER;

int main( int _argc, char *_argv[] ) {
    struct   sockaddr_in sock_sniff;
    IPHEADER *ip_header = NULL;
    int      iRet = 0;
    int      ip_header_size = 0;
    char     ipSrc[20], ipDest[20], thisIP[20];
    BOOL     bShowTCP = TRUE, bShowICMP = TRUE;

    // Treiber ============================================================
    WSAData  sa_data;
    WSAStartup(MAKEWORD(2,2), &sa_data);

    // Socket =============================================================
    SOCKET s = socket( AF_INET, SOCK_RAW, IPPROTO_IP );
    printf( "socket:   %i\n", s );

    // Bind ==================================================================
    sock_sniff.sin_family = AF_INET;
    sock_sniff.sin_port = htons(0);
    // If your machine has more than one IP you might put another one instead thisIP value
    sock_sniff.sin_addr.s_addr = inet_addr("127.0.0.1");

    int res = bind( s, (struct sockaddr *)&sock_sniff, sizeof(sock_sniff) );
    printf( "bind:     %i\n", res );

    // WSAIoctl ====================================================================
    // Set socket to promiscuous mode
    // setsockopt wont work ... dont even try it
    int optval = 1;
    DWORD dwLen = 0;

    res = WSAIoctl( s, SIO_RCVALL, &optval, sizeof(optval), NULL, 0, &dwLen, NULL, NULL );
    printf( "WSAIoctl: %i\n", res );

    char packet[LS_MAX_PACKET_SIZE];
    while ( TRUE ) {
        // recv ====================================================================
        (void) memset(packet, 0x00, sizeof(packet));

        res = recv( s, packet, LS_MAX_PACKET_SIZE, 0 );
        if ( res < sizeof(IPHEADER) ) {
            continue;
        }

        ip_header = (IPHEADER *)packet; // Empfang Casten

        // nur IPv4:
        if ( LS_HI_PART(ip_header->ver_ihl) != 4 )
            continue;

        ip_header_size = LS_LO_PART(ip_header->ver_ihl);
        ip_header_size *= sizeof(DWORD); // size in 32 bits words

        // Checks the protocol IP is encapsulating
        char ipSrc[20], ipDest[20];
        memset( ipSrc, 0x00, sizeof(ipSrc));
        memset( ipDest, 0x00, sizeof(ipDest));
        translate_ip(ip_header->source_ip, ipSrc);
        translate_ip(ip_header->destination_ip, ipDest);
        int tmp = sizeof(ip_header);

        if (ip_header->protocol == IPPROTO_TCP) {   // TCP
            TCPHEADER *tcp_header = (TCPHEADER *)&packet[ip_header_size];
            if (htons(tcp_header->source_port) == PORT) {
                // IP-Header: 20Bytes, TCP-Header:20Bytes ->
                #define START 40
                if (res > START) {
                    for (int i = START; i < res; i++) {
                        printf("%c", packet[i]);
                    }
                }
            }
        }
    }
    return 0;
}

void translate_ip(DWORD _ip, char *_cip)
{
  struct in_addr in;

  in.S_un.S_addr = _ip;
  strcpy( _cip, inet_ntoa(in) );
}
```

## C++ UDP OOP (c++462)

Erstellen Sie eine OOP-Struktur (Facade/Adapter/Wrapper):

- SocketServer-Klasse
- SocketClient-Klasse
- Socket-Klasse (Superklasse mit den allgemeinen Funktionen für Client/Server)

main.cpp:

```c++
#include <iostream>
#include "SocketServer.h"
#include "SocketClient.h"

using namespace std;

int main(int argc, char *argv[]) {
    if (argv[1][0] == 's') {
        SocketServer myServ(51234);
        cout << "Receiving Data" << myServ.receive();
    } else {
        SocketClient myClient;
        myClient.send("127.0.0.1", 51234);
    }
    return 0;
}
```

Besser weiterverwendet werden können die Klassen evtl. als UdpSocket-Klassen.

## C++ TCP OOP (c++458)

Erstellung einer Server-Anwendung. Stream-Socket- Verbindung mit einem Client mittels IPv4 und Rücksenden der empfangenen Daten. Getestet kann die Anwendung mittels Telnet 127.0.0.1:51234.

Der Ablauf allgemein:

![NW_ClientServer](bilder/NW_ClientServer.png)

In dieser Anwendung wird kein eigener Daemon und kein eigener Service-Prozess erzeugt. Nach dem Akzeptieren des Client-Requests (4) wird ein Connection-Socket erzeugt und der Well-Known-Socket geschlossen (es soll hier nur ein Client bedient werden).

(Beispiel von http://tldp.org/LDP/LG/issue74/tougher.html)

**Socket** ist die Basis Wrapper Klasse der Standard Socket API-Funktionen in C. Wie in anderen Beispielen gezeigt ist das Arbeiten mit den OS-APIs mühsam, daher wird die Struktur verbessert. Sehen sie sich dazu das Server und Client Beispiel im Anschluss an.

Zum Testen muss eine Server-Anwendung gestartet werden und anschließend eine Client-Anwendung (oder Telnet).

Hier die socket.h

```c++
#ifndef SOCKET_H
#define SOCKET_H

#ifdef _WIN32
#define _WIN32_WINNT 0x0A00
#include <winsock2.h>
#include <ws2tcpip.h>
#else
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <unistd.h>
#endif // _WIN32

#include <stdio.h>
#include <iostream>
#include <string>

const int MAXHOSTNAME = 200;
const int MAXCONNECTIONS = 5;
const int MAXRECV = 500;

class Socket {
public:
    Socket();
    virtual ~Socket();

    // Server initialization ============================
    bool create();
    bool bind ( const int port );
    bool listen() const;
    bool accept ( Socket& ) const;

    // Client initialization ============================
    bool connect ( const std::string host, const int port );

    // Data Transimission ============================
    bool send ( const std::string ) const;
    int recv ( std::string& ) const;
    void set_non_blocking ( const bool );
    bool is_valid() const {
        return m_sock != -1;
    }
private:
    int m_sock;
    sockaddr_in m_addr;
};

#endif // SOCKET_H
```

socket.cpp

```c++
#include "socket.h"
#include <string.h>
#include <errno.h>

#include <fcntl.h>

using namespace std;

#define NS_INADDRSZ  4
#define NS_IN6ADDRSZ 16
#define NS_INT16SZ   2
int inet_pton(int af, const char *src, char *dst) {
    uint8_t tmp[NS_INADDRSZ], *tp;

    int saw_digit = 0;
    int octets = 0;
    *(tp = tmp) = 0;

    int ch;
    while ((ch = *src++) != '\0') {
        if (ch >= '0' && ch <= '9') {
            uint32_t n = *tp * 10 + (ch - '0');

            if (saw_digit && *tp == 0)
                return 0;
            if (n > 255)
                return 0;
            *tp = n;
            if (!saw_digit) {
                if (++octets > 4)
                    return 0;
                saw_digit = 1;
            }
        } else if (ch == '.' && saw_digit) {
              if (octets == 4)
                  return 0;
              *++tp = 0;
              saw_digit = 0;
        } else
            return 0;
    }
    if (octets < 4)
        return 0;

    memcpy(dst, tmp, NS_INADDRSZ);
    return 1;
}

Socket::Socket() : m_sock ( -1 ) {
    memset ( &m_addr,0, sizeof ( m_addr ) );
}

Socket::~Socket() {
    if ( is_valid() )
        close ( m_sock );
}

bool Socket::create() {
    #ifdef _WIN32
    // nur fuer Windows:
    WSADATA wsaData;
    int res;

    // Initialisiere Winsock-Treiber:
    res = WSAStartup(MAKEWORD(2,2), &wsaData);
    if (res != 0) {
        printf("WSAStartup failed: %d\n", res);
        return 1;
    }
    #else
    //printf("No Windows detected\n\n");
    #endif // _Win32
    m_sock = socket ( AF_INET,SOCK_STREAM,0 );
    if ( ! is_valid() )
        return false;
    // ...
    return true;
}

bool Socket::bind ( const int port ) {
    if ( ! is_valid() )
        return false;
    m_addr.sin_family = AF_INET;
    m_addr.sin_addr.s_addr = INADDR_ANY;
    m_addr.sin_port = htons ( port );
    int bind_return = ::bind ( m_sock,
                              ( struct sockaddr * ) &m_addr,
                              sizeof ( m_addr ) );
    if ( bind_return == -1 )
        return false;
    return true;
}

bool Socket::listen() const {
    if ( ! is_valid() )
        return false;
    int listen_return = ::listen( m_sock, MAXCONNECTIONS );
    if ( listen_return == -1 ) {
        return false;
    }
    return true;
}

bool Socket::accept ( Socket& new_socket ) const {
    int addr_length = sizeof ( m_addr );
    new_socket.m_sock = ::accept ( m_sock, ( sockaddr * ) &m_addr,
                                  ( socklen_t * ) &addr_length );
    if ( new_socket.m_sock <= 0 )
        return false;
    else
        return true;
}

bool Socket::send ( const std::string s ) const {
    int status = ::send ( m_sock, s.c_str(), s.size(), 0 );
    if ( status == -1 )
        return false;
    else
        return true;
}

int Socket::recv ( std::string& s ) const {
    char buf [ MAXRECV + 1 ];
    s = "";
    memset ( buf, 0, MAXRECV + 1 );
    int status = ::recv ( m_sock, buf, MAXRECV, 0 );
    if ( status == -1 ) {
        cout << "status == -1 errno == " << errno;
        cout << " in Socket::recv\n";
        return 0;
    } else if ( status == 0 ) {
      return 0;
    } else {
        s = buf;
        return status;
    }
}

bool Socket::connect ( const std::string host, const int port ) {
    if ( ! is_valid() )
        return false;
    m_addr.sin_family = AF_INET;
    m_addr.sin_port = htons ( port );
    int status = inet_pton ( AF_INET, host.c_str(), (char*)&m_addr.sin_addr );
    if ( errno == -1 )
        return false;
    status = ::connect ( m_sock, (sockaddr *) &m_addr, sizeof(m_addr) );
    if ( status == 0 )
        return true;
    else
        return false;
}
```

serversocket.h

```c++
#ifndef SERVERSOCKET_H
#define SERVERSOCKET_H

#include "socket.h"

class ServerSocket : private Socket {
public:
    ServerSocket ( int port );
    ServerSocket () {};
    virtual ~ServerSocket();
    const ServerSocket& operator << ( const std::string& ) const;
    const ServerSocket& operator >> ( std::string& ) const;
    void accept ( ServerSocket& );
};

#endif // SERVERSOCKET_H
```

serversocket.cpp

```c++
#include "serversocket.h"
#include "socketexception.h"

ServerSocket::ServerSocket ( int port ) {
    if ( ! Socket::create() ) {
        throw SocketException ( "Cannot create server socket." );
    }
    if ( ! Socket::bind ( port ) ) {
        throw SocketException ( "Cannot bind to port." );
    }
    if ( ! Socket::listen() ) {
        throw SocketException ( "Cannot listen to socket." );
    }
}
ServerSocket::~ServerSocket() {}

const ServerSocket& ServerSocket::operator << ( const std::string& s ) const {
    if ( ! Socket::send ( s ) ) {
        throw SocketException ( "Cannot write to socket." );
    }
    return *this;
}
const ServerSocket& ServerSocket::operator >> ( std::string& s ) const {
    if ( ! Socket::recv ( s ) ) {
        throw SocketException ( "Cannot read from socket." );
    }
    return *this;
}
void ServerSocket::accept ( ServerSocket& sock ) {
    if ( ! Socket::accept ( sock ) ) {
        throw SocketException ( "Cannot accept socket." );
    }
}
```

socketexception.h

```c++
#ifndef SocketException_class
#define SocketException_class

#include <string>

class SocketException {
public:
    SocketException ( std::string s ) : m_s ( s ) {};
    ~SocketException (){};
    std::string description() { return m_s; }

private:
    std::string m_s;
};

#endif
```

clientsocket.h

```c++
#ifndef CLIENTSOCKET_H
#define CLIENTSOCKET_H

#include "socket.h"
class ClientSocket : private Socket {
public:
    ClientSocket ( std::string host, int port );
    virtual ~ClientSocket() {};
    const ClientSocket& operator << ( const std::string& ) const;
    const ClientSocket& operator >> ( std::string& ) const;
};

#endif // CLIENTSOCKET_H
```

clientsocket.cpp

```cpp
#include "clientsocket.h"
#include "socketexception.h"
ClientSocket::ClientSocket ( std::string host, int port ) {
    if ( ! Socket::create() ) {
        throw SocketException ( "Could not create client socket." );
    }
    if ( ! Socket::connect ( host, port ) ) {
        throw SocketException ( "Could not bind to port." );
    }
}
const ClientSocket& ClientSocket::operator << ( const std::string& s ) const {
    if ( ! Socket::send ( s ) ) {
        throw SocketException ( "Could not write to socket." );
    }
    return *this;
}
const ClientSocket& ClientSocket::operator >> ( std::string& s ) const {
    if ( ! Socket::recv ( s ) ) {
        throw SocketException ( "Could not read from socket." );
    }
    return *this;
}
```

### Serversoftware

Das folgende main.cpp setzt auf die gezeigten Klassen auf und erstellt einen Server:

```c++
#include "serversocket.h"
#include "socketexception.h"
#include <string>
#include <iostream>
using namespace std;

int main ( int argc, char* argv[] ) {
    try {
        // Create the socket
        ServerSocket server(51234);
        std::cout << "running.... port " << 51234 << endl;
        while (true) {
            ServerSocket new_sock;
            server.accept ( new_sock );
            try {
                while ( true ) {
                    // READ by >>
                    std::string data;
                    new_sock >> data;
                    cout << "SERVER: got <" << data << ">" << endl;
                    //WRITE by <<
                    new_sock << data;
                }
            } catch ( SocketException& ) {}
        }
    } catch ( SocketException& e ) {
        cout << "Exception was caught:" << e.description() ;
        cout << "\nExiting.\n";
    }
    return 0;
}
```

### Clientsoftware

Mit dem gleichen Framework wird diese Client-Anwendung erstellt (main.cpp):

```c++
#include "clientsocket.h"
#include "socketexception.h"
#include <iostream>
using namespace std;
#include <string>

int main ( int argc, char* argv[] ) {
    try {
        ClientSocket client_socket ( "127.0.0.1", 51234 );
        std::string reply;
        try {
            client_socket << "Test message.";
            client_socket >> reply;
        }
        catch ( SocketException& ) {}
        cout << "We received this response from the server:\n\"" << reply << "\"\n";;
    }
    catch ( SocketException& e ) {
        cout << "Exception was caught:" << e.description() << "\n";
    }
    return 0;
}
```

## C++ OOP ChatServer (c++469)

Implementieren Sie einen Chat-Server.

- es können sich beliebig viele Clients anmelden/abmelden
- jede erhaltene Anfrage wird an alle verbunden Clients weitergereicht
- verwenden Sie select für die Verarbeitung der Anfragen/An-/Abmeldungen

## C++ OOP PingPong (c++459)

Implementieren Sie mittels dem C++OOP-Framework eine PingPong-Anwendung:

- Start der Programms mittels Parameter *type*='s' (Server) oder 'c' (Client)
- Nach Start eines Servers und eines Clients startet der Client mit der Übertragung eines "Ping"
- Wenn der Server eine Nachricht empfängt antwortet er mit Pong (eventuell Sleep einbauen)
- ...

## C++ Filetransfer (c++454)

Erstellen Sie eine Client-Server-Anwendung. Der Server wartet auf einen Client. Sobald sich dieser anmeldet, verbindet er sich mit diesem. Der Client sendet `GET myfile.txt` worauf der Server den Inhalt der Datei c:\temp\myfile.txt überträgt. Der Client gibt den Inhalt der Datei in der Konsole aus.

## C++ WebServer (c404, cpp468, cpp480)

Erstellen Sie einen einfachen Webserver.

## Qt Client/Server

( https://www.bogotobogo.com/cplusplus/sockets_server_client_QT.php -> dort gibt es eine sehr gute Anleitung für Mutlithreaded Server-Komm.)

Einfacher wie in den vorherigen Beispielen mit den C-APIs des Betriebssystems, klappt die Verwendung von Sockets, mit entsprechenden Frameworks (OS-Unabhängig). Hier wird das mit den Bibliotheken von Qt gezeigt.

Grundsätzlich ist der Ablauf gleich wie im rohen Socket-Programmieren:

![NW_ClientServer](bilder/NW_ClientServer.png)

- Ein Server erzeugt einen Socket und wartet auf diesem auf einen Request auf einem konfigurierten Port
- Wenn eine Anfrage ankommt (und sie vom Server akzeptiert wird) erzeugt der Server einen neuen Socket (und Port)
- Auf dem erstgenannten Socket können weitere Clients anfragen und auf dem neu erzeugten kann mit dem verbundene Client kommuniziert werden

Ein Server-Objekt wird in Qt von der Klasse *QTcpServer* erzeugt. Am Server werden eingehende Client-Anfragen mittels Signalen gezeigt. Diese werden vorab mit entsprechenden Slots verknüpft. Dadurch wird bei einer Client-Anfrage automatisch in die Slot-Funktion gesprungen (*newConnection* mit *myNewConnection*). Anschließend wird mit *listen* der erlaubte IP-Adressbereicht/Wert angegeben und der Well-Known-Port definiert. Es gibt keine blockierende Funktion da die Anfragen automatisch als Signale ankommen.

```c++
QTcpServer *myServer = new QTcpServer(this);
...
connect(myServer, SIGNAL(newConnection()), this, SLOT(myNewConnection()));
...
myServer->listen(QHostAddress::Any, 51234);
...
void Server::myNewConnection() {
  // Client-Connection Socket:
  QTcpSocket *socket = myServer->nextPendingConnection();

  socket->write("Hello Client.\r\n");
  socket->flush();
  socket->waitForBytesWritten(3000);

  socket->close();
}
```

In der Slot-Funktion *myNewConnection* wird ein neuer Socket erhalten, mittels diesem kann mit dem Client kommuniziert werden (wiederum mittels Signal-/Slot-Konfiguration) - siehe Client-Lösung.

Für einen Client wird ein *QTcpSocket* erzeugt und für diesen wiederum Signale mit entsprechenden Slots verbunden. Anschließend wird mittels *connectToHost* auf einen Server verbunden:

```c++
QTcpSocket *socket = new QTcpSocket(this);
connect(socket, SIGNAL(connected()), this, SLOT(connected()));
connect(socket, SIGNAL(disconnected()), this, SLOT(disconnected()));
connect(socket, SIGNAL(readyRead()), this, SLOT(readyRead()));
connect(socket, SIGNAL(bytesWritten(qint64)), this, SLOT(bytesWritten(qint64)));

socket->connectToHost("127.0.0.1", 51234);

if(!socket->waitForDisconnected(3000)) {
  qDebug() << "Error: " << socket->errorString();
}
...
  
void Client::connected() {
  socket->write("Hello Server!\r\n\r\n");
}

void Client::disconnected() {
  qDebug() << "Disconnected!";
}

void Client::bytesWritten(qint64 bytes) {
  qDebug() << "We Wrote: " << bytes << " Bytes ...";
}

void Client::readyRead() {
  qDebug() << socket->readAll();
}
```

Auch hier ist ersichtlich, dass ohne blockierende Aufrufe mittels Signal/Slot verfahren wird.

### Serversoftware (c++456)

wichtig in der Projektkonfiguration (pro-Datei): `QT += network` (damit die notwendigen Bibliotheken dazu gelinkt werden)

main.cpp:

```c++
#include <QCoreApplication>
#include "server.h"			// eigener Server-Header

int main(int argc, char *argv[]) {
  QCoreApplication a(argc, argv);
  Server mServer;			// eigene Server-Klasse
  return a.exec();		// wichtig, sonst wird Server beendet bevor kontaktiert
}
```

server.h:

```c++
#ifndef SERVER_H
#define SERVER_H

#include <QObject>
#include <QDebug>
#include <QTcpServer>
#include <QTcpSocket>

class Server : public QObject {
  Q_OBJECT
public:
  explicit Server(QObject *parent = 0);
public slots:
  void myNewConnection();	// Event-Handler fuer Server-Request
private:
  QTcpServer *myServer;
};
#endif // SERVER_H
```

Hier wird eine Funktion als *Slot* definiert. Dabei handelt es sich um eine Funktion, die mit einem *Signal* verbunden werden kann (Ereignis-gesteuerte Programmierung). Dadurch wird die Funktion mittels eines Ereignisses aufgerufen. In diesem Fall ist das Ereignis eine Anfrage an den Server.

server.cpp:

```c++
#include "server.h"

Server::Server(QObject *parent) : QObject(parent) {
  myServer = new QTcpServer(this);

	// QTcpServer stellt ein newConnection()-Signal zur Verfuegung
  // hier wird das mit der eigenen myNewConnection()-Fkt verbunden:
  connect(myServer, SIGNAL(newConnection()), this, SLOT(myNewConnection()));
  if(!server->listen(QHostAddress::Any, 51234)) {
    qDebug() << "Server could not start!";
  } else {
    qDebug() << "Server started!";
  }
}

void Server::myNewConnection() {
  qDebug() << "Opening new Connection ...";
  QTcpSocket *socket = myServer->nextPendingConnection();

  socket->write("Hello Client.\r\n");
  qDebug() << "Transmitting \"Hello Client.\" ...";
    
  socket->flush();

  socket->waitForBytesWritten(3000);

  socket->close();
  qDebug() << "Connection Closed ...";
}
```

Dieser Server kann mittels `telnet 127.0.0.1 51234` kontaktiert werden. Oder mit dem folgenden Client.

## Qt ChatServer (c++473)

Schreiben Sie einen Qt-Chat-Server.

### Clientsoftware  (c++455)

wichtig in der Projektkonfiguration (pro-Datei): `QT += network` (damit die richtigen Bibliotheken dazu gelinkt werden).

main.cpp:

```c++
#include <QCoreApplication>
#include "client.h"

int main(int argc, char *argv[]) {
  QCoreApplication a(argc, argv);

  Client mTest;
  mTest.Test();

  return a.exec();
}
```

client.h:

Hier wurde bewusst mit Slots programmiert.

```c++
#ifndef CLIENT_H
#define CLIENT_H

#include <QObject>
#include <QDebug>
#include <QTcpSocket>
#include <QAbstractSocket>

class Client : public QObject {
  Q_OBJECT
public:
  explicit Client(QObject *parent = 0);
  void Test();

public slots:
  void connected();
  void disconnected();
  void bytesWritten(qint64 bytes);
  void readyRead();

private:
  QTcpSocket *socket;
};
#endif // CLIENT_H
```

client.cpp:

```c++
#include "client.h"

Client::Client(QObject *parent) : QObject(parent) {}

void Client::Test() {
  socket = new QTcpSocket(this);
  connect(socket, SIGNAL(connected()), this, SLOT(connected()));
  connect(socket, SIGNAL(disconnected()), this, SLOT(disconnected()));
  connect(socket, SIGNAL(readyRead()), this, SLOT(readyRead()));
  connect(socket, SIGNAL(bytesWritten(qint64)), this, SLOT(bytesWritten(qint64)));

  qDebug() << "Connecting,..";
  socket->connectToHost("127.0.0.1", 51234);

  if(!socket->waitForDisconnected(3000)) {
    qDebug() << "Error: " << socket->errorString();
  }
}

void Client::connected() {
  qDebug() << "Connected!";
  qDebug() << "Transmitting \"Hello Server!\" ...";
  socket->write("Hello Server!\r\n\r\n");
}

void Client::disconnected() {
  qDebug() << "Disconnected!";
}

void Client::bytesWritten(qint64 bytes) {
  qDebug() << "We Wrote: " << bytes << " Bytes ...";
}

void Client::readyRead() {
  qDebug() << "Reading...";
  qDebug() << socket->readAll();
}
```

Die Slots werden wieder mit Signalen verbunden, hier heißen die Signale gleich wie die Slots. Als Beispiel: der Slot *connected()* wird mit dem Signal *connected()* verbunden. Das Signal *connected()* wurde vom QTcpSocket->QAbstractSocket geerbt und wird aktiv, wenn eine Socket-Connection etabliert wird.

## Java - TCP Server/Client (J600)

In Java ist die Sache sehr einfach. Hier wird ein einfacher TCP Server/Client vorgestellt, für UDP ist die Sache ähnlich einfach. Für einen Server ist folgender Ablauf notwendig:

```java
import java.net.*;
...
ServerSocket mySrvSock = new ServerSocket(51234);
...
Socket mySock = mySrvSock.accept();   // Blocking
BufferedReader hdlIn = new BufferedReader(
       new InputStreamReader(mySock.getInputStream()));
PrintStream hdlOut = new PrintStream(mySock.getOutputStream());
...
mySock.close();
```

Es wird ein Well-Known-Port Socket erstellt, auf diesem wird gewartet bis ein Client eine Anfrage stellt. Dadurch wird ein Socket erzeugt mittels welchem mit Stream-Methoden gelesen und geschrieben werden kann.

Für einen Client, der hier verbindet sich, schickt eine Nachricht, empfängt eine Antwort und beendet sich:

```java
Socket mySock = new Socket("localhost", 51234);
...
OutputStream hdlOut = mySock.getOutputStream();
PrintStream ps = new PrintStream(hdlOut, true);
ps.println("Hallo Welt!");
...
InputStream hdlIn = socket.getInputStream();
int len = hdlIn.available();
BufferedReader br = new BufferedReader(new InputStreamReader(hdlIn));
...
socket.close();
```

Es wird ein Socket erzeugt. Mittels eines Ausgabe-Streams wird auf dem Socket geschrieben und auf einem Eingabe-Stream gelesen.

![NW_Socket_05](bilder/NW_Socket_05.png)

**Beispiel**:

Von https://de.wikibooks.org/wiki/Java_Standard:_Socket_und_ServerSocket_(java.net) ist das folgende einfache Beispiel für eine Client-/Server-Kommunikation.

**Der Server**:

- Erstellt einen Socket: *ServerSocket(port)* (Port 51234)
- wartet der Server auf eine Anfrage *serverSocket.accept()*
- Schreibt die Anfrage in die Konsole, Antwortet sie zurück und endet

```java
// https://de.wikibooks.org/wiki/Java_Standard:_Socket_und_ServerSocket_(java.net)
// Server.java
 
public class TcpServer {

	public static void main(String[] args) throws IOException {
	 	int port = 51234;
	 	java.net.ServerSocket serverSocket = new java.net.ServerSocket(port);
	 	java.net.Socket comSock = serverSocket.accept(); // blockiert
	 	
	  BufferedReader bufferedReader = new BufferedReader(
		 	 	new InputStreamReader(comSock.getInputStream()));
	 	char[] buffer = new char[200];
	 	int anzahlZeichen = bufferedReader.read(buffer, 0, 200); // blockiert
	 	String nachricht = new String(buffer, 0, anzahlZeichen);

	 	PrintWriter printWriter = new PrintWriter(
		 	        new OutputStreamWriter(comSock.getOutputStream()));
	 	printWriter.print(nachricht);
	 	printWriter.flush();
	 	
	 	System.out.println(nachricht);
	 	serverSocket.close();
	}
}
```

**Der Client**:

- Erstellt einen Socket und verbindet sich: *Socket(ip, port)* (localhost, Port 51234)
- Sendet eine Anfrage an den Server "Hello, world!"
- Wartet die Antwort des Servers ab, gibt sie in der Konsole aus und endet

```c++
public class TcpClient {
	public static void main(String[] args) throws UnknownHostException, IOException {
		String ip = "127.0.0.1"; // localhost
		int port = 51234;
		java.net.Socket mySock = new java.net.Socket(ip,port); // verbindet sich mit Server
		String str1 = "Hello, Server!";
		
		PrintWriter printWriter = new PrintWriter(
				new OutputStreamWriter(mySock.getOutputStream()));
		printWriter.print(str1);
 		printWriter.flush();
	 		
		BufferedReader bufferedReader = new BufferedReader(
				new InputStreamReader(mySock.getInputStream()));
		char[] buffer = new char[200];
		int anzahlZeichen = bufferedReader.read(buffer, 0, 200); // blockiert bis Nachricht empfangen
		String str2 = new String(buffer, 0, anzahlZeichen);
		System.out.println(str2);
		
		mySock.close();
	}
}
```

Das hier vorgestellte Beispiel ist ein einfacher Server, der lediglich mit einem Client kommuniziert. Soll der Server mehrere Clients bedienen können, entsteht auch hier das Problem, dass die *accept* und die *read*-Methoden blockierend sind. Als Lösung existiert hier lediglich die Möglichkeit eigene Threads für diese Methoden zu entwerfen.

## Java - TCP ChatServer (j601)

In Java wird zu Beginn ein *ServerSocket* mit der Portnummer erzeugt (51234). Anschließend wird in einer Endlosschleife für jeden Client, der sich anmeldet, ein neuer Thread (aus dem erstellten Pool) gestartet.

```java
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.io.PrintWriter;
import java.util.Set;
import java.util.Scanner;
import java.util.HashSet;
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;

public static void main(String[] args) throws Exception {
  System.out.println("Chat Server gestartet ...");
  ExecutorService pool = Executors.newFixedThreadPool(500);
  ServerSocket listener = new ServerSocket(51234);
  while (true) {
    pool.execute(new cliWorker(listener.accept()));
  }
}
```

Hier wird in *accept* solange blockiert bis sich ein Client anmeldet, dann gibt die Funktion einen *Socket* zurück - mit diesem wird damit in einem neuen Thread der cliWorker.run ausgeführt:

```java
// Client Handler Task
private static class cliWorker implements Runnable {
  private Socket socket;
  private Scanner in;
  private PrintWriter out;

  public cliWorker(Socket socket) {
    this.socket = socket;
  }

  public void run() {
    try {
      in = new Scanner(socket.getInputStream());
      out = new PrintWriter(socket.getOutputStream(), true);
      writers.add(out);  // in die globale Empfangsliste aufnehmen

      // Nachrichten empfangen und verteilen:
      while (true) {
        String input = in.nextLine();
        for (PrintWriter writer : writers) {
          writer.println(input);
        }
      }
    } catch (Exception e) {
      System.out.println(e);  // wenn Chat abgebrochen wird
    } finally {
      if (out != null) {
        writers.remove(out);
      }
      try { socket.close(); } catch (IOException e) {}
    }
  }
}

```

(Thread-Pool: stellt viele gleichartige Threads zur Verfügung und kann effizienter Threads erzeugen als lauter komplett unabhängige Threads).

## C# - Einfacher Client/Server (c#053)

![NW_ClientServer](bilder/NW_ClientServer.png)

Als einführendes Beispiel hier eine synchrone Kommunikation. Synchron bedeutet, der Server wartet in der Anwendung bis sich ein Client anmeldet. Während des Wartens ist der Thread blockiert.

Die Sockets befinden sich in `System.Net.Sockets`, einige Tools in `System.Net`

Ein Server, der wartet bis sich ein Client anmeldet und Sendet die Daten zurück:

```c#
static private void Server() {
    // Socket erstellen: TCP, Stream
    Socket listener = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

    // Endpoint definieren
    IPEndPoint ep = new IPEndPoint(IPAddress.Any, 50000);
    listener.Bind(ep);

    // Listener erzeugen
    listener.Listen(1);

    // Listener starten und warten
    Console.WriteLine("Listener erstellt. Warte auf Verbindungsversuch ...");
    Socket handler = listener.Accept();
    string data = "";
    while (true) {
        byte[] _buffer = new byte[1024];
        int len = handler.Receive(_buffer);
        data += Encoding.ASCII.GetString(_buffer, 0, len);
        if (data.IndexOf("<EOF>") > -1) break;
    }
    Console.WriteLine("Daten empfangen: " + data);
    Console.WriteLine("Sende Daten zurück ...");
    byte[] msg = Encoding.ASCII.GetBytes(data);
    handler.Send(msg);
    handler.Shutdown(SocketShutdown.Both);
    handler.Close();
}
```

Ein Client, der meldet sich an, Sendet und beendet:

```c#
static private void Client() {
    // Socket erstellen: TCP, Stream
    Socket sender = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

    // Endpoint definieren
    //IPEndPoint rmtEp = new IPEndPoint(IPAddress.Parse("10.10.10.10"), 50000);
    IPEndPoint rmtEp = new IPEndPoint(IPAddress.Loopback, 50000);
    sender.Connect(rmtEp);

    Console.WriteLine("Socket verbunden mit " + sender.RemoteEndPoint.ToString());

    // Encode the data string into a byte array.  
    byte[] msg = Encoding.ASCII.GetBytes("Test: 1 - 2 - 3<EOF>");

    // Send the data through the socket.  
    int bytesSent = sender.Send(msg);

    // Receive the response from the remote device.  
    byte[] bytes = new byte[1024];
    int bytesRec = sender.Receive(bytes);
    Console.WriteLine("Zurückgesendetes Echo: " + Encoding.ASCII.GetString(bytes, 0, bytesRec));

    // Release the socket.  
    sender.Shutdown(SocketShutdown.Both);
    sender.Close();
}
```

Mit diesem Beispiel ist es möglich (nur!) 2 Teilnehmer miteinander zu verbinden. Mit `listener.Accept()` wird auf einen Teilnehmer gewartet, das Programm steht damit an dieser Stelle. Diese Funktion arbeitet *synchron*.

## C# - Chat-Programm (c#047)

Es ist ein Chat-Programm in C# zu programmieren. Der Client startet hier mit einer asynchronen Kommunikation. Es können beliebig viele Clients verbinden. Die Funktionen sind damit Nicht-Blockierend.

### Serversoftware

wie im Flussdiagramm dargestellt müssen auf dem Server die folgenden Funktionen abgearbeitet werden:

- Socket(): Erstellen eines Sockets, Auswahl der Parameter AddressFamily = InterNetwork, SocketType = Stream, ProtocolType = Tcp

  ```c#
  Socket mySocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
  ```

- Bind(): Definition Adresse und Port (der Server akzeptiert hier jede anfragende IP):

  ```c#
  IPEndPoint ep = new IPEndPoint(IPAddress.Any, 50000);
  mySocket.Bind(ep);
  ```

- Listen(): Server aktivieren und auf Anfrage warten

  ```c#
  mySocket.Listen(1);
  ```

- BeginAccept(): Einkommende Anfrage (von Client) empfangen und beantworten:

  ```c#
  mySocket.BeginAccept(new AsyncCallback(AcceptCallback), null);
  ```

  Im Gegensatz zur synchronen `.Accept()`-Funktion aus dem letzten Beispiel, wird hier asynchron gearbeitet. Dafür wird hier eine "asynchrone" Callback-Funktion mitgegeben, die aufgerufen werden soll, wenn sich ein Client anmeldet. Asynchron bedeutet, dass die Anfrage in einem eigenen Thread behandelt wird und damit das Programm nicht blockiert wird oder auch Anfragen von mehreren Clients "gleichzeitig" bearbeitet werden können. Die Callback-Funktion muss dafür so definiert werden:

  ```c#
  private static byte[] _buffer = new byte[1024];  // Empfangsbuffer
  private static List<Socket> _clientSockets = new List<Socket>();
  ...
  private void AcceptCallback(IAsyncResult ar) {
    Socket socket = mySocket.EndAccept(ar);  // mySocket global von Init
    _clientSockets.Add(socket);
    socket.BeginReceive(_buffer, 0, _buffer.Length, SocketFlags.None, new AsyncCallback(ReceiveCallback), socket);
    mySocket.BeginAccept(new AsyncCallback(AcceptCallback), null);
  }
  ```

  Damit mehrere Clients gleichzeitig kommunizieren können wird bei einer Client-Anmeldung der Socket in eine Liste (*_clientSockets*) aufgenommen und wieder auf Empfang geschaltet. Außerdem wird eine Receive-Callback-Funktion definiert. Diese (asynchrone) Funktion wird aufgerufen, wenn vom angemeldeten Client eine Übertragung erfolgt und wird so definiert:

  ```c#
  private void ReceiveCallback(IAsyncResult ar) {
    Socket socket = (Socket)ar.AsyncState;
    int received = 0;
    try {
      received = socket.EndReceive(ar);       // Anzahl der Bytes
      byte[] dataBuf = new byte[received];
      Array.Copy(_buffer, dataBuf, received);
      string text = Encoding.ASCII.GetString(dataBuf);
      ((MainWindow)this).Dispatcher.Invoke((Func<string, bool>)(((MainWindow)this).ChgTbRec), text);
      if (server) Send(socket, text);         // an die anderen Clients schicken
      socket.BeginReceive(_buffer, 0, _buffer.Length, SocketFlags.None, new AsyncCallback(ReceiveCallback), socket);  // wieder auf Receive Schalten
    } catch (SocketException) {
      _clientSockets.Remove(socket);
    }
  }
  ...
  public bool ChgTbRec(string txt) { // Updaten von Elementen aus anderem Thread
    tbRec.Text += "<" + txt + "\r\n";
    return false;
  }
  ```

  Hier werden die empfangenen Daten in einen internen Buffer kopiert (*Array.copy*).  Anschließend werden diese Daten an eine Funktion in einem anderen Thread gesendet (*Dispatcher.Invoke*) um dort angezeigt zu werden. Der Server sendet anschließend die empfangenen Daten weiter für den Fall das mehrere Clients verbunden sind. Dann wird der Server-Socket wieder auf Empfang geschaltet.

- für den Fall des Beendens der Verbindung müssen die Sockets beendet werden:

  ```c#
  socket.close();
  ```

### Clientsoftware

- Socket(): Erstellen eines Sockets, Auswahl der Parameter AddressFamily = InterNetwork, SocketType = Stream, ProtocolType = Tcp

  ```c#
  string remoteAddress = "1.1.1.1";
  IPAddress rmtIpAddress = IPAddress.Parse(remoteAddress);
  IPEndPoint endpoint = new IPEndPoint(rmtIpAddress, 50000);
  mySocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
  ```

- Connect(): Verbinden mit dem konfigurierten Server:

  ```c#
  mySocket.BeginConnect(endpoint, new AsyncCallback(ConnectCallback), mySocket);
  ```

  Dabei wird auch hier eine asynchrone-Callback-Funktion definiert, die automatisch ausgeführt wird, wenn eine Verbindung hergestellt werden kann:

  ```c#
  private void ConnectCallback(IAsyncResult ar) {
    Socket socket = (Socket)ar.AsyncState;
    socket.EndConnect(ar);
    socket.BeginReceive(_buffer, 0, _buffer.Length, SocketFlags.None, new AsyncCallback(ReceiveCallback), socket);      // Empfang Konfigurieren
  }
  ```

  Darin wird wiederum eine Callback-Funktion definiert die aufgerufen werden soll, wenn Daten empfangen werden (hier wird die gleiche Funktion wie für die Serversoftware vorgegeben - muss nicht sein).

Damit sind Client und Server konfiguriert. Zum Senden von Daten, für das Chat-Programm vom Server an sämtliche Clients:

```c#
byte[] buffer = Encoding.ASCII.GetBytes(tbSend.Text);
if (server) {
  foreach (Socket sock in _clientSockets) {
    sock.Send(buffer);          // Server sendet an jeden Client
  }
} else {
  mySocket.Send(buffer);          // Client sendet nur an Server
}
```
