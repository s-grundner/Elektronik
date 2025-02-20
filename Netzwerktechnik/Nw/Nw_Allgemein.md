# 1 Netzwerke Allgemeines

- Netzwerk mit unterschiedlichen Komponenten:
  - Hersteller Windows(Linux/Unix …)
  - Computer/Server/IoT-Devices/Smartphone
- Kommunikation nur möglich wenn nicht nur eine Verbindung vorhanden ist, sondern zusätzlich Regeln eingehalten werden.

## Proprietäres/Offenes System

Grundsätzlich zwei Möglichkeiten ein Netzwerk zu gestalten:

- Proprietär: nur ein Hersteller für die gesamte Kommunikation (da ja von ihm definiert) - funktioniert sehr gut, da Komponenten gut aufeinander abgestimmt sind. Dadurch ist das System abgeschlossen und eben herstellerabhängig.
- Offene Systeme: genormte Protokolle und Schnittstellen sind notwendig. Dadurch austauschbare Teile, die beste Technik kann sich durchsetzen, unterschiedliche Herstellerlösungen arbeiten zusammen und können einfach ausgetauscht werden: Normierung von ISO als **OSI-Schichtenmodell**

## Netzwerk-Architektur

Es gibt unterschiedliche Formen der Architektur, welche verwendet wird, hängt von der konkreten Anwendung ab.

- [Peer-to-Peer](Peer-to-Peer.md)
- [Hub](Hub.md)
- [Switch](Switch.md)
- [Access Point](Access%20Point.md)
- [Router](Router.md)

### Client-Server-Architektur

In einer solchen (logischen) Struktur wird zwischen Server und Client unterschieden. Ein Server ist nicht zwangsläufig ein eigener Computer (Hardware), er ist vielmehr ein Dienst der zur Verfügung gestellt wird. Ein Client ist eine Software die einem Dienst anfordert. Grundsätzlich können unterschiedliche Server und Clients auf ein und dem selben Rechner zur gleichen Zeit laufen.

Beispiele für gängige Server-Anwendungen sind:

- Mail-Server (der liefert meinem Client-Mailprogramm Mails wenn abgefragt wird)
- Drucker-Server: wird etwas im Netzwerk gedruckt, dann sendet ein Druckertreiber (Client) an den Drucker-Server (eventuell Software nur im Drucker)
- Web-Server: ein Browser (Client) fragt nach einer Seite (beim Web-Server)
- [Datenbank](../../Softwareentwicklung/Datenbanken/Datenbank.md): eine Datenbankanwendung (php, c# …) kommuniziert mit einer [Datenbank](../../Softwareentwicklung/Datenbanken/Datenbank.md) (DB-Server)
- Applikation-Server: Anwendung laufen auf Server

Ganz wichtig damit das funktionieren kann: die Sprache im Netzwerk muss geregelt sein. Der Anwender möchte sich nicht darum kümmern -> Protokolle.

Komponenten:

- Client: Dienstanforderer

- Server: Diensterbringer
- Abwicklungsprotokoll, wird von beiden Partnern verstanden

=> Vorteil dieser Struktur: Client und Server können auf unterschiedlichen Plattformen (Betriebssystemen/Hardware) laufen.

Die Server-Client-Struktur hat sich für sehr viele Anwendungen durchgesetzt. Der Grund liegt in der Einfachheit und klaren Definition der Rollen.

### Protokolle der Anwendungsschicht (OSI5+)

- [DHCP](../Protokolle/DHCP.md)
- [DNS](../DNS.md)
- [FTP](../Protokolle/FTP.md)
- [HTTP](../Protokolle/HTTP.md)
- **NTP**	Network Time Protocol: Protokoll zur Synchronisierung von Uhren. Baut auf UDP, Port 123 auf.w
- **POP3**	Postoffice Protocol Version 3: E-Mail-Protokoll zur Kommunikation zwischen E-Mail-Server und Client. Sehr einfach (ASCII) und eingeschränkt (Gegenstück: SMTP). TCP Port 110.
- **SMTP**	Simple Mail Transfer Protocol: E-Mail-Protokoll zur Kommunikation zwischen E-Mail-Server und Client. Kommunikation muss immer vom Sender initiiert werden (kann nicht vom Server starten). TCP, Port 25.
- **SSH**		Secure Shell: Sichere Verbindung zur Remote-Ausführung von Programmen. UDP und TCP auf Port 22. Gibt's mittlerweile in Windows als App inkludiert.
- **telnet**	Zeichenorientierter Datenaustausch, basierend auf TCP. Dient oft zur Fernsteuerung von Computern. Port 23

Liste der Ports: <https://de.wikipedia.org/wiki/Liste_der_standardisierten_Ports>

**Ein möglicher/vereinfachter Ablauf beim Zugriff auf eine Webseite:**

- Ein Client-Rechner meldet sich in Netzwerk an: mittels **[DHCP](../Protokolle/DHCP.md)**-Discover wird nach einem [DHCP](../Protokolle/DHCP.md)-Server gefragt. [DHCP](../Protokolle/DHCP.md)-Server offerieren einen Lease (IP Adresse+Subnetz+Gateway) an. Der schnellste gewinnt und stellt die Daten zur Verfügung. Damit hat der Client eine Adresse.
- Auf dem Client-Rechner wird mittels Browser eine Webseite mittels **URL** ausgewählt.
- Der Client fragt bei seinem **DNS**-Server nach der zur URL gehörenden IP-Adresse.
- Mittels dieser IP-Adresse des Zielrechners Dadurch kann ein **HTTP**-Request geformt werden.
- Üblicherweise befindet sich der Ziel-Webserver außerhalb des eigenen Netzwerks. Daher wird mittels **ARP** die **MAC**-Adresse des eigenen Routers ermittelt (wenn nicht von früher bekannt). Der direkte Zugriff auf den Ziel-Webserver ist nicht möglich.
- Der HTTP-Request wird in einem **TCP**-Segment an den Ziel-Webserver gesendet. TCP garantiert die Ankunft. Dafür wird das TCP in ein **IP**-Paket verpackt und mittels **[Ethernet](../Ethernet.md)** und der vorher ermittelten **MAC**-Adresse an den Router gesendet.
- Der Router ermittelt wiederum mittels **ARP** die MAC-Adresse des Zielrechners und sendet die **IP**-Pakete dorthin. Die Teil-Pakete können dabei unterschiedliche Wege nehmen und in anderer Reihenfolge am Ziel ankommen. Wenn sie nicht vollständig ankommen wird das erkannt. Wenn die Pakete angekommen sind werden sie zum ursprünglichen **TCP**-Segment zusammengesetzt.
- Im Fall von Kommunikationsproblemen können Fehlermeldungen mittels **ICMP** übermittelt werden.

## Medizintechnische Netzwerk-Klassen

Im medizinischen Bereich:

- Netzwerkklasse A: allgemeine Computernetzwerke (Krankenhausinformationssysteme)

- Netzwerkklasse B: Computernetzwerke im klinischen Einsatz (z.B. Vernetzung klinische Abteilung mit zentralen medizinischen Bildarchiv)
- Netzwerkklasse C: hochsicherheitskritische klinische Bereiche, z.B. Monitoring in der Intesivmedizin. Diese Klasse ist (physisch) unabhängig von anderen Systemen zu verwirklichen.

## Anderes

- [[MAC]]	
- **Port**	Ports werden in Transport-Protokollen (TCP, UDP) verwendet um mehrere Kommunikationskanäle zur Verfügung zu stellen und grob zu zeigen um welchen Dienst es sich handelt (siehe oben).
- **Socket**	Ein durch eine RFC definierter Begriff (Socket ~ Steckdose). Ein Socket ist ein Bündel aus Quell-/Ziel-IP und -Port. Zusätzlich noch mit dem verwendeten Protokoll. Es ist damit ein API zwischen Transport und Anwendungsebene für die Anbindung mittels TCP/IP oder IrDA (praktisch).
- **Repeater**	Verbinden von Netzwerksegmenten auf OSI1. Verbundene Netze dürfen keine Zyklen haben (ansonsten können Pakete kreisen). Sie dienen als Verstärker, mit ihnen können daher Netzwerke räumlich vergrößert werden.
- **Bridge**	Eine Bridge arbeitet auf OSI2 (MAC-Schicht). Eine Bridge puffert Pakete und wirkt damit als Buffer bei Kollisionen. Sie übermittelt den Datenverkehr der von einem Netzwerk-Segment in das benachbarte muss und blockiert die anderen. Damit können Kollisionen reduziert werden und räumlich Netzwerke vergrößert werden.
- **Hub**	*einfachste* Komponente an Schnittstellen in einem Netzwerk. Ein Hub leitet Pakete an sämtliche an ihm angeschlossene Hosts weiter. Dadurch müssen sich an einen Hub angeschlossene Geräte die verfügbare Bandbreite immer teilen und sind nur für den Anschluss von wenigen Geräten sinnvoll. 
- **Switch**	Ähnlich wie ein Hub. Im Gegensatz zu diesem kann ein Switch aber mehrere Geräte zur gleichen Zeit miteinander verbinden. Ein Switch kommuniziert nur mit der adressierten Komponente, er kann aber auch an mehrere gleichzeitig übertragen.
- **Router**	Ein Router verbindet zwei oder mehrere logische Netze. Er arbeitet auf OSI3. In TCP/IP Übertragungen sind in Schicht 3 die Adressen enthalten womit der Router das Paket lenkt. Dazu bedient er sich einer Routing-Tabelle. Ein Router kann unterschiedliche Wege aufgrund Laufzeit auswählen und damit auch Redundanzen oder Lastverteilung durchführen. Router können [DHCP](../Protokolle/DHCP.md) (dynamisches Zuweisen von IP-Adressen an angeschlossene Komponenten) und NAT. Häufig können sie auch MAC oder IP Adressen filtern und haben eine Firewall integriert.
- **NAT**	Network Address Translation. Erfolgt auf dem Router. Übersetzung lokaler Netzwerkadressen in eine ~globale. Damit weiß ein Router welcher lokale Host welchen Dienst im Internet verwendet und kann dementsprechend die Replys durch routen.
- **Gateway**		Ein Gateway kann zwei Geräte bis in die Schicht 7 verbinden. Damit können Anwendungsprotokolle übersetzt werden. Zur Konvertierung eines TCP/IP in ein IBM-SNA wird ein MS-SNA-Server (Gateway) verwendet. Auf einem Host ist der Standard-Gateway diejenige Adresse an die Anfragen weitergeleitet werden, wenn sie nicht im lokalen Adressbereich liegen.
- **CSMA/CD** 	Carrier Sense Multiple Access/Collision Detect: Dieses Verfahren wird in [Ethernet](../Ethernet.md) (nur wenn nicht via Switch) und abgewandelt in WLAN Netzen eingesetzt. Dabei wartet ein Busteilnehmer der Senden möchte auf einen freien Bus. Wenn dieser frei ist beginnt er zu Senden und hört dabei gleichzeitig mit ob seine Daten auf dem Bus ankommen. Wenn nicht (etwa weil ein zweiter genau gleichzeitig zu Senden begonnen hat) wird die Sendung sofort beendet. Ein Zufallsgenerator ermittelt ab wann dieser Sender einen erneuten Sende-Versuch startet (mit Warten auf freien Bus). Dieses Verfahren wird im [Ethernet](../Ethernet.md) verwendet (als IEEE 802.3). In Drahtlosen Netzen werden andere Verfahren eingesetzt. Ein Teilnehmer welcher sendet, kann nicht gleichzeitig hören ob ein zweiter Teilnehmer sendet, daher wird hier häufig ein CSMA/CA (A für Avoidance) eingesetzt. Dabei wird vor dem Senden Gehört.
- **[Ethernet](../Ethernet.md)**	Kombination gewisser Protokolle und Hardware für kabelgebundene Netze. [Ethernet](../Ethernet.md) ist sowohl auf Layer 1 und Layer 2 festgelegt. [Ethernet](../Ethernet.md) kann die Basis für TCP/IP bilden.
- **PPP/PPPoE**	Point-to-Point Protocol: Verbindung über Wählleitung. oE bedeutet over [Ethernet](../Ethernet.md). Wird bei ADSL verwendet. Ist ein Übliches Protokoll für Internetprovider den Kunden gegenüber.
- **Firewall**	Kann etwa auf einem Router aktiv sein. Damit wird jede Übertragung aus dem Heimnetzwerk in das Internet direkt ermöglicht, in die umgekehrte Richtung werden allerdings nur Antworten durchgelassen (einfachster Fall).

## IP-Adresse

Um Geräte in einem IP-Netzwerk eindeutig adressieren zu können wird jedem Gerät eine logische IP-Adresse zugeordnet. Eine IP-Adresse besteht in **IPv4** aus **32 Bit**, damit sind >4 Mrd. Teilnehmer adressierbar. Da das in Zukunft zu wenig sein wird, wurde die Adresse für **IPv6** auf **128 Bit** erweitert. Die Darstellung von IPv4 Adressen: 4 Oktetten getrennt durch einen Punkt: `192.168.7.7`. Diese Schreibweise ist für IPv6 nicht praktisch da sie zu lange wird, daher wird die Adresse hier in doppelte Oktette in hexadezimaler Schreibweise zusammengefasst: `2001:0db8:85a3:0000:0000:8a2e:0370:7344` (führende Nullen werden oft weggelassen).

Eine IP-Adresse ist eine logische, wie bekommt ein Rechner eine IP-Adresse?

- Manuell: es wird eine Adresse auf dem Gerät eingestellt.
- Automatisch: die Adresse wird beim Start *dynamisch* zugewiesen ([DHCP](../Protokolle/DHCP.md))

Eine IP-Adresse setzt sich aus 2 Teilen zusammen: einem Netzwerkteil (für alle Rechner eines Subnetzes gleich) und einem Hostteil (damit werden die Rechner innerhalb eines Subnetzes unterschieden). Schreibweisen: `192.168.45.22/24` damit wird festgelegt: die ersten 24 Bit sind Netzwerkteil und die verbleibenden 8 Bit sind Hostteil (bis zu 256 Rechner/Drucker … möglich). Alternativ: Angabe einer Subnetzmaske für dieses Beispiel: `192.168.45.22` und `255.255.255.0` (=Subnetzmaske).

Gängige/Reservierte IPs:

```
192.168.0.0/16	Privat (klein)
127.0.0.0/8			Localnet (Kommunikation mit sich Selber)
10.0.0.0/8			Privat (sehr groß)
172.16.0.0/12 	Privat (groß)
255.255.255.255	Broadcast
```

Darstellung der eigenen Konfiguration (Windows):

```
ipconfig /all
```

- IPv4 und IPv6
- Subnetzmaske
- für jeden Netzwerkadapter
- Host / Router

Zuordnung IP-URL mittels DNS.

Zuordnung IP <-> MAC mittels ARP.

Wie findet ein IP Paket den Weg zum Zielrechner:

- Adresse im eigenen Subnet: wenn Rechner nicht bekannt: arp-Anfrage (Broadcast) nach MAC passend zu IP, nach Antwort wird das Paket direkt dorthin gesendet
- Adresse außerhalb des Subnets: das Datenpaket wird an die MAC-Adresse des Routers (Standard-Gateway) gesendet. Dieser kümmert sich um die Weiterleitung des Pakets.
- Der Router führt *Routing-Tabellen*, diese können statisch (von Hand) oder dynamisch erstellt worden sein. Für dynamisches Routing tauschen sich benachbarte Router miteinander aus um die entsprechende Information zu sammeln.

# Windows

Telnet aktivieren: <https://praxistipps.chip.de/windows-10-telnet-client-aktivieren-und-deaktivieren_92627> 









Poster:  
![img](assets/NW_Schichtenmodell_Poster.png)

## Referenzen

- Gute Protokoll-Zusammenfassung:

  <https://kompendium.infotip.de/netzwerktechnologie2-referenzmodelle-und-protokolle.html>

- Socket-Programmierung mit C#  
  <https://docs.microsoft.com/de-de/dotnet/framework/network-programming/sockets>

- Windows-Tools:  
  <https://kompendium.infotip.de/netzwerkbefehle-der-windows-kommandozeile.html>