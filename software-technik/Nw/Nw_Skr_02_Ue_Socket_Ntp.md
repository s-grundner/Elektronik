

# Network Time Protocol (NTP)

Das NTP kann wesentlich mehr als hier besprochen. Hier werden nur kleine Teile als Auszug präsentiert.

Das NTP liegt auf dem UDP-Layer. Der Port für NTP ist 123. Der Ablauf den wir verwenden:

- Senden einer NTP-Client-Nachricht an einen NTP-Server
- Empfangen einer NTP-Server-Nachricht vom NTP-Server

In NTP gibt es nicht nur Client- und Server-Nachrichten wir verwenden allerdings nur diese. Vom NTP-Server erhalten wir (in der erwähnten Server-Nachricht) einen Sekunden-Zeitstempel (als Zeitstempel wird in der Informatik ein eindeutiger Zeitpunkt bezeichnet) gerechnet vom 1.1.1900.

Eine NTP-Nachricht ist so aufgebaut:

```c++
typedef struct
{
  uint8_t li_vn_mode;      // Eight bits. li, vn, and mode.
  // li.   Two bits.   Leap indicator.
  // vn.   Three bits. Version number of the protocol.
  // mode. Three bits. Client will pick mode 3 for client.

  uint8_t stratum;         // Eight bits. Stratum level of the local clock.
  uint8_t poll;            // Eight bits. Maximum interval between successive messages.
  uint8_t precision;       // Eight bits. Precision of the local clock.

  uint32_t rootDelay;      // 32 bits. Total round trip delay time.
  uint32_t rootDispersion; // 32 bits. Max error aloud from primary clock source.
  uint32_t refId;          // 32 bits. Reference clock identifier.

  uint32_t refTm_s;        // 32 bits. Reference time-stamp seconds.
  uint32_t refTm_f;        // 32 bits. Reference time-stamp fraction of a second.

  uint32_t origTm_s;       // 32 bits. Originate time-stamp seconds.
  uint32_t origTm_f;       // 32 bits. Originate time-stamp fraction of a second.

  uint32_t rxTm_s;         // 32 bits. Received time-stamp seconds.
  uint32_t rxTm_f;         // 32 bits. Received time-stamp fraction of a second.

  uint32_t txTm_s;         // 32 bits and the most important field the client cares about. Transmit time-stamp seconds.
  uint32_t txTm_f;         // 32 bits. Transmit time-stamp fraction of a second.
} ntp_packet;              // Total: 384 bits or 48 bytes.

```

Darin:

- im Element *li_vn_mode* ist der Mode 3 (Client) wenn wir als Client an den NTP-Server senden
- im Element *li_vn_mode* ist der Mode 4 (Server) wenn der NTP-Server retourniert
- im Element *li_vn_mode* ist die Version 4 (Version des NTP-Protokolls)
- txTm_s vom NTP-Server gibt die Anzahl der Sekunden zu der die Nachricht den NTP-Server verläßt seit dem 1.1.1900. In der Norm (RFC...) ist weiter definiert, dass der Abstand zwischen 1.1.1900 und 1.1.1970 *2.208.988.800 Sekunden* beträgt. Der 1.1.1970 ist der Beginn der UNIX-Zeitrechnung, bezogen auf diesen Tag sind viele Zeit/Datum-Funktionen in C/C++.

### Umrechnung NTP-Zeit -> unsere Zeit

Hier wir gezeigt wie die empfangene Sekunden-Zeit (Bruchteile werden vernachlässigt) umgerechnet wird.

- Die Zeit wird aus dem Netzwerk empfangen. Dort gilt die *Network*-Byte Order. Je nach Betriebssystem kann die Byte-Reihenfolge gleich oder anders sein. Die Funktion **ntohl** rechnet auf jedem System korrekt um (**N**etwork**T**o**H**ost  **L**ong).
- Diese 1900-Zeit wird auf 1970-Zeit umgerechnet
- Mit ctime wird die Zeitzone und die Formatierung in einen String erledigt

```
// Bit-Reihenfolge Netzwerk -> Host
packet.txTm_s = ntohl( packet.txTm_s );

// NTP-Zeit -> Unix-Zeit
time_t utcZeit = (time_t)(packet.txTm_s - 2208988800ull); // ull = unsigned long long

// ctime = Convert Time
// Umwandeln der UTC (globale Weltzeit) auf die lokale Zeit
printf( "Time: %s", ctime( (const time_t*) &utcZeit ) );
```

### UDP Übertragung

Hier für Windows (Linux, Treiber WSA... entfallen und closesocket->close)

```c++
//Windows-Treiber laden
WSADATA wsaData;
WSAStartup(MAKEWORD(2,2), &wsaData);
...
//socket ------------------------------------------------------------
int s = socket( AF_INET, SOCK_DGRAM, IPPROTO_UDP );
...
//sendto ------------------------------------------------------------
struct sockaddr_in serv_addr; // Server address data structure.
n = sendto(s, (char*)&packet, sizeof(ntp_packet), 0, (struct sockaddr *)&serv_addr, sizeof( serv_addr));
...
//recvfrom ----------------------------------------------------------
int sz = sizeof( serv_addr);
n = recvfrom(sockfd, (char*)&packet, sizeof(ntp_packet), 0, (struct sockaddr *)&serv_addr, &sz);

//close -------------------------------------------------------------
closesocket(s);
...
//WindowsTreiber entladen -------------------------------------------
WSACleanup();
```

### Listing (C++486)

```c++
#include <unistd.h>     // uint8 ...
#include <stdio.h>
#include <time.h>       // ctime ...
#include <winsock2.h>

#define NTP_TIMESTAMP_DELTA 2208988800ull

void error( char* msg ) {    // Fehlermeldung ausgeben und Programm beenden
  perror( msg );  // Print the error message to stderr.
  WSACleanup();
  exit( 0 );      // Quit the process.
}

int main( int argc, char* argv[ ] ) {
  WSADATA wsaData;
  WSAStartup(MAKEWORD(2,2), &wsaData);

  int portno = 123; // NTP UDP port number.

  char* host_name = (char*)"bevtime1.metrologie.at"; //us.pool.ntp.org"; // NTP server host-name.

  // Structure that defines the 48 byte NTP packet protocol.

  typedef struct {
    uint8_t li_vn_mode;      // Eight bits. li, vn, and mode.
    // li.   Two bits.   Leap indicator.
    // vn.   Three bits. Version number of the protocol.
    // mode. Three bits. Client will pick mode 3 for client.

    uint8_t stratum;         // Eight bits. Stratum level of the local clock.
    uint8_t poll;            // Eight bits. Maximum interval between successive messages.
    uint8_t precision;       // Eight bits. Precision of the local clock.

    uint32_t rootDelay;      // 32 bits. Total round trip delay time.
    uint32_t rootDispersion; // 32 bits. Max error aloud from primary clock source.
    uint32_t refId;          // 32 bits. Reference clock identifier.

    uint32_t refTm_s;        // 32 bits. Reference time-stamp seconds.
    uint32_t refTm_f;        // 32 bits. Reference time-stamp fraction of a second.

    uint32_t origTm_s;       // 32 bits. Originate time-stamp seconds.
    uint32_t origTm_f;       // 32 bits. Originate time-stamp fraction of a second.

    uint32_t rxTm_s;         // 32 bits. Received time-stamp seconds.
    uint32_t rxTm_f;         // 32 bits. Received time-stamp fraction of a second.

    uint32_t txTm_s;         // 32 bits and the most important field the client cares about. Transmit time-stamp seconds.
    uint32_t txTm_f;         // 32 bits. Transmit time-stamp fraction of a second.
  } ntp_packet;              // Total: 384 bits or 48 bytes.

  // Create and zero out the packet. All 48 bytes worth.
  ntp_packet packet = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
  memset( &packet, 0, sizeof( ntp_packet ) );

  // Set the first byte's bits to 00,011,011 for li = 0, vn = 3, and mode = 3. The rest will be left set to zero.
  *((char *) &packet + 0 ) = 0x23;
  // li_vn_mode = 00 100 011    (0010 0011)
  // li = 0  : leap indicator: deleting last minute of the current month
  // vn = 4  : version 3
  // mode = 3: client

  // Expected Return:
  // li_vn_mode = 00 100 100 // (0010 0100)
  // mode = 4: server

  //socket ------------------------------------------------------------
  // Create a UDP socket, convert the host-name to an IP address, set the port number,
  // connect to the server, send the packet, and then read in the return packet.
  int sock = socket( AF_INET, SOCK_DGRAM, IPPROTO_UDP ); // Create a UDP socket.
  if (sock < 0) error((char*)"ERROR opening socket" );

  struct hostent *server = gethostbyname( host_name );                    // Convert URL to IP.
  if (server == NULL) error((char*)"ERROR, no such host" );


  //sendto ------------------------------------------------------------
  // Zero out the server address structure.
  struct sockaddr_in serv_addr; // Server address data structure.
  memset((char*)&serv_addr, 0, sizeof( serv_addr ));;

  serv_addr.sin_family = AF_INET;

  // Copy the server's IP address to the server address structure.
  memmove((char*) &serv_addr.sin_addr.s_addr, (char*)server->h_addr, server->h_length);

  // Convert the port number integer to network big-endian style and save it to the server address structure.
  serv_addr.sin_port = htons( portno );

  int ret = sendto(sock, (char*)&packet, sizeof(ntp_packet), 0, (struct sockaddr *)&serv_addr, sizeof( serv_addr));
  if (ret < 0) error((char*)"Error writing to Socket");

  //recvfrom ----------------------------------------------------------
  int sz = sizeof( serv_addr);
  ret = recvfrom(sock, (char*)&packet, sizeof(ntp_packet), 0, (struct sockaddr *)&serv_addr, &sz);
  if (ret < 0) error((char*)"Error reading from Socket");

  packet.txTm_s = ntohl( packet.txTm_s ); // Time-stamp seconds.
  time_t txTm = (time_t) (packet.txTm_s - NTP_TIMESTAMP_DELTA);
  printf("Time: %s", ctime( (const time_t*) &txTm ));

  //close -------------------------------------------------------------
  ret = closesocket(sock);

  //WindowsTreiber entladen -------------------------------------------
  WSACleanup();

  return 0;
}
```

### Server

Es gibt eine Vielzahl an Servern, etwa unter:
http://www.metrologie.at/messtechnische-fachbereiche/zeit/zeitsynchronisation-ueber-internet/

### Qt (485)

```c++
#include <QUdpSocket>
#include <QtEndian>
...
m_sock = new QUdpSocket();
connect(m_sock,SIGNAL(readyRead()),this,SLOT(readyRead()));
...
char arr[48] = {0};
arr[0] = 0x23;
QHostAddress adr = QHostInfo::fromName("bevtime1.metrologie.at").addresses().at(0);
m_sock->writeDatagram(arr, 48, adr, 123);

...
void MainWindow::readyRead() {
  char arr[48] = {0};
  m_sock->readDatagram(arr, 48);
  uint32_t datTim = *(uint32_t*)(&arr[40]);
  datTim = qFromBigEndian(datTim);
  datTim -= 2208988800ull;
  qDebug() << ctime((time_t*)&datTim);
  ui->txtNtpTime->setPlainText(ctime((time_t*)&datTim));
}
```

## NTP-Uhr (487)

Erstellen Sie ein Programm das eine graphische Uhr darstellt. Beispielhaft:

![](bilder/Nw_Ue_NtpUhr.png)

- Die Uhr soll im Sekunden-Takt aktualisiert werden
- Im Minuten-Takt soll die Uhrzeit mittels NTP aktualisiert werden

Tipps:

- Darstellung eines Bildes (PNG...) auf einem Widget:

  ```c++
  // QPainter p(this);
  QPixmap *pix = new QPixmap("c:/pics/zeiger.png");
  p.drawPixmap(100, 100, *pix);   // Draw at 100/100
  ```

- Transformieren von Darstellungen (Vorstellung: Zeichenblatt wird gedreht):

  ```c++
  p.translate(100, 100);
  p.rotate(sec * 6.0);		// Seconds -> Degree 60*6=360
  p.scale(0.7, 0.7);      // Scale Image
  p.drawPixmap(-22, -185, *pix);
  ```

  Wenn anschließend weitergezeichnet werden soll, dann zurückdrehen/skalieren (in umgekehrter Reihenfolge):

  ```c++
  p.scale(0.7, 0.7);      // Scale Image
  p.rotate(-sec * 6.0);		// Seconds -> Degree 60*6=360
  p.translate(-100, -100);
  ```

## Referenzen

- RFC-NTP
  https://tools.ietf.org/pdf/rfc5905.pdf
- Programm zu einem großen Teil von dieser Quelle:
  https://lettier.github.io/posts/2016-04-26-lets-make-a-ntp-client-in-c.html 
- Österreichische NTP-Server
  http://www.metrologie.at/messtechnische-fachbereiche/zeit/zeitsynchronisation-ueber-internet/
- NTP-Debugging
  https://weberblog.net/packet-capture-network-time-protocol-ntp/