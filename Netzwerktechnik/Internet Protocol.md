---
tags:
  - Netzwerke
aliases:
  - IP-Adresse
  - IP-Adressen
subject:
  - ksn
source:
  - Martin Aichriedler
---

# Internet Protokoll

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


## IPv4

### Aufbau eines IPv4-Paketes

![400](../_assets/IPv4.png)

| Nummer | Segment             | Größe (bit) | Beschreibung / Funktion        |
| ------ | ------------------- | ----------- | ------------------------------ |
| 1.     | Version             |             |                                |
| 2.     | IHL                 |             |                                |
| 3.     | Service             |             |                                |
| 4.     | Paketlänge          |             |                                |
| 5.     | Kennung             |             |                                |
| 6.     | Flags               |             |                                |
| 7.     | Fragment Offset     |             |                                |
| 8.     | Time to Live (TTL)  |             |                                |
| 9.     | Protokoll-ID        |             |                                |
| 10.    | Header-Prüfsumme    |             |                                |
| 11.    | IP-Adresse (Sender) |             |                                |
| 12.    | IP-Adresse (Ziel)   |             |                                |
| 13.    | Optionen / Füllbits |             |                                |
| 14.    | Datenbereich        |             | Daten der [Transportschicht](../Transportschicht.md) |

# Tags

[Sockets](<https://de.wikipedia.org/wiki/Socket_(Software)>)
