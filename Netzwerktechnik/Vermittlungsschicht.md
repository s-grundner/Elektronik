---
tags: ["Netzwerke"]
aliases: ["Layer 3", "Network Layer"]
subject: ["ksn"]
source: ["Martin Aichriedler", "Christian Baun"]
created: 4th April 2022
---

# Vermittlungsschicht (OSI-Layer 3)

> [!hint] logische Adressierung der Endgeräte.
> - Routing/Weg Findung zwischen Sender und Empfänger.
> - Auf dieser Schicht werden Pakete unabhängig voneinander von einem entfernten Punkt zwischen einem Zweiten transportiert.
> - Die logische Adressierung kann etwa die IP-Adresse sein.
> 
> Typisch: je nach Übertragungsweg (untere Ebenen) werden Datenpakete geteilt oder zusammengefasst (daher auch gepuffert), es wird ein Paket-Header mit Quelle-/Ziel-Adresse angehängt.

## Aufgaben der Vermittlungsschicht

|            |                                                                                                        |
| ---------- | ------------------------------------------------------------------------------------------------------ |
| Sender     | Segmente der [Transportschicht](Transportschicht.md) werden in Pakete unterteilt                       |
| Empfänger  | Pakete in den Rahmen der [Sicherungsschicht](Sicherungsschicht.md) erkennen                            |
| IP         | Logische Adressen ([IP-Adressen](Internet%20Protocol.md)) bereitstellen                     |
| Routing    | Ermittlung des besten Weges                                                                            |
| Forwarding | Weiterleitung der Pakete zwischen logischen Netzen, also über physische Übertragungsabschnitte hinweg. |

## Geräte der Vermittlungsschicht

Die Geräte der Vermittlungsschicht unterbrechen die [Broadcastdomäne](Broadcastdomäne.md).

### Router

*siehe Wikipedia Eintrag zu [Router](https://de.wikipedia.org/wiki/Router)*  
Router leiten Datenpakete zwischen Netzen mit eigenen logischen Adressbereichen weiter.
- Besitzt genau wie Hubs und Switche mehrere Schnittstellen
- Ermöglichen die Verbindung des [LAN](Local%20Area%20Network.md) mit einem [WAN](Wide%20Area%20Network.md)
	- zum Beispiel: via DSL oder 3G/4G Mobilfunk.

### Layer 3 Switch

(Router ohne [Wide Area Network](Wide%20Area%20Network.md)-Schnittstelle)

### [Gateways](Gateway.md) in der Vermittlungsschicht

[Gateways](Gateway.md) die auf der Vermittlungsschicht arbeiten, heißen auch **Mehrprotokoll Router** oder **Multiprotololl Router**.

Moderne Computernetze arbeiten fast ausschließlich mit dem [Internet Protocol](Internet%20Protocol.md).
- Darum ist eine Protokollumsetzung auf der Vermittlungsschicht heute meist nicht nötig.

Auch VPN-[Gateways](Gateway.md) (Virtual Private Network) können auf der Vermittlungsschicht arbeiten.
 - Sie ermöglichen über unsichere öffentliche Netze den sicheren Zugriff auf entfernte sichere Netze
 - Dienste (z.B. E-Mail), die nur innerhalb des sicheren Netzes zur Verfügung stehen, werden über eine getunnelte Verbindung genutzt.

## Protokolle der Vermittlungsschicht

> [!NOTE] Dienen zur Weiterleitung und Weg Bestimmung
> - Distanz Vector-Routing-Protokolle
> - Link-State-RoutingProtokolle

1. **IP** - Internet Protocol:
	- Versenden von Datenpaketen (Datagramm).
	- IP ist verbindungslos (kein Öffnen/Schließen einer Verbindung notwendig), es wird weggesendet und darauf vertraut, dass es ankommen wird.
	- IP garantiert kein Ankommen von Paketen oder die korrekte Reihenfolge von Paketen.
	- IP läuft üblich über mehrere Zwischenstationen.
	- Ein IP-Datagramm besteht aus einem Header (Version (IPv4…), Protokoll, Typ, Src-/Dst-Adressen, Checksumme, Länge …) und einem Datenblock mit maximaler Länge (TCP liegt komplett im Datenblock).

> [!WARNING] Diese Schicht ist nicht für Anwendungen zugänglich. Zum Senden eines IP muss die MAC-Adresse bekannt sein, Die Schicht unter dieser Schicht verwendet ARP um diese MAC-Adressen zu ermitteln.

1. **ICMP**	Internet Control Message Protocol: Austausch von Kontroll-/Fehlerpaketen. Ist Teil des IP. (ping verwendet Echo-Requests auf ICMP)





---

# Tags

## [OSI-Modell](OSI-Modell.md)

## [Christian Baun](http://www.christianbaun.de/)

![7-FS_ComputerNetze](assets/Christian-Baun-pdf/7-FS_ComputerNetze.pdf)  
![8-FS_ComputerNetze](assets/Christian-Baun-pdf/8-FS_ComputerNetze.pdf)
