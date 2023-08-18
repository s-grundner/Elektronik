---
tags: ["Netzwerke"]
aliases: ["Layer 3", "Network Layer"]
subject: ["ksn"]
source: ["Martin Aichriedler", "Christian Baun"]
reference: []
created: 4th April 2022
last_edited: 11th April 2022
---

# Vermittlungsschicht (OSI-Layer 3)
## Aufgaben der Vermittlungsschicht
1. Sender
	- Segmente der [Transportschicht](Transportschicht.md) werden in Pakete unterteilt
2. Empfänger
	- Pakete in den Rahmen der [Sicherungsschicht](Sicherungsschicht.md) erkennen      
3. Logische Adressen ([IP-Adressen](Internet%20Protocol.md)) bereitstellen
4. Routing
	-  Ermittlung des besten Weges
5. Forwarding
	- Weiterleitung der Pakete zwischen logischen Netzen, also über physische Übertragungsabschnitte hinweg.

## Geräte der Vermittlungschicht
Die Geräte der Vermittlungsschicht unterbrechen die [Broadcastdomäne](Broadcastdom%C3%A4ne.md).

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

## Vermittlungs-Protokolle
- Dienen zur Weiterleitung und Wegbestimmung
	- Distanzvector-Routing-Potokolle
	- Link-State-Routing- Protokolle
- Diagnose und Fehlermeldung mit ICMP
- [IP](Internet%20Protocol.md)
- IPX
- DECnet

---
# Tags
## [OSI-Modell](OSI-Modell.md)
## [Christian Baun](http://www.christianbaun.de/)
![7-FS_ComputerNetze](7-FS_ComputerNetze.pdf)
![8-FS_ComputerNetze](8-FS_ComputerNetze.pdf)