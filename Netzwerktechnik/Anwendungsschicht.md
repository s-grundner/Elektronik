---
tags:
  - ComputerNetzwerke
aliases:
  - Application Layer
created: 30th August 2023
---

# Anwendungsschichten (OSI-Layer 5-7)


## Protokolle der Anwendungsschichten

|                               | Protokoll                     | Beschreibung                                                                                                                                                | Port                 |
| ----------------------------- | ----------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------- |
| [DHCP](../Protokolle/DHCP.md) |                               |                                                                                                                                                             |                      |
| [DNS](../DNS.md)              |                               |                                                                                                                                                             |                      |
| [FTP](../Protokolle/FTP.md)   |                               |                                                                                                                                                             |                      |
| [HTTP](../Protokolle/HTTP.md) |                               |                                                                                                                                                             |                      |
| **NTP**                       | Network Time Protocol         | Protokoll zur Synchronisierung von Uhren                                                                                                                    | UDP, <br>Port 123    |
| **POP3**                      | Postoffice Protocol Version 3 | E-Mail-Protokoll zur Kommunikation zwischen E-Mail-Server und Client. Sehr einfach (ASCII) und eingeschränkt (Gegenstück: SMTP).                            | TCP, <br>Port 110    |
| **SMTP**                      | Simple Mail Transfer Protocol | E-Mail-Protokoll zur Kommunikation zwischen E-Mail-Server und Client. Kommunikation muss immer vom Sender initiiert werden (kann nicht vom Server starten). | TCP, <br>Port 25     |
| **SSH**                       | Secure Shell                  | Sichere Verbindung zur Remote-Ausführung von Programmen.                                                                                                    | UDP/TCP, <br>Port 22 |
| **telnet**                    |                               | Zeichenorientierter Datenaustausch, basierend auf TCP. Dient oft zur Fernsteuerung von Computern.                                                           | TCP,<br>Port 23      |

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
