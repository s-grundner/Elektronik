---
tags: ["Netzwerke"]
aliases: ["Transport Layer", "Layer 4"]
subject: ["ksn"]
source: ["Martin Aichriedler"]
created: 6th April 2022
---

# Transportschicht (OSI-Layer 4)
## Aufgaben der Transportschicht
### Ports
## Adressierung der Transportschicht
Die Adressierung erfolgt in der Transportschicht mit [Sockets](Sockets)

## Protokolle der Transportschicht

1. [**UDP**](UDP.md) [User Datagram Protocol](UDP.md):

1. [**TCP**](TCP.md) [Transmission Control Protocol](TCP.md):
	- Verbindungsorientiertes Protokoll, es verbindet zwei Endpunkte miteinander.
	- Auch auf unzuverlässigen niedrigeren Schichten (etwa IP), kann damit sichergestellt werden, dass Daten ankommen.
	- Vor dem Senden wird die Menge an Daten *ausgehandelt*. Gesendet wird mit Sequence-Number.
	- Die Reihenfolge und Vollständigkeit wird damit gewährleistet.
	- Der Empfänger muss Erhalt bestätigen ansonsten wird erneut gesendet.
	- Endpunkte sind mittels IP-Adresse und Port definiert.
	- Ein TCP-Segment besteht aus einem Header (beinhaltet Src- und Dst-Port) und der Payload.

1. **TLS/SSL** Secure Sockets Layer (neu **T**ransport **L**ayer **S**ecurity):
	- Ende-zu-Ende-Verschlüsselung mittels symmetrischer Verschlüsselung (DES, AES...) und kryptografische Prüfsumme (SHA-1, MD5). TLS wird heute (unter Anderem) mit HTTPS, POP3S, SMTPS, FTPS eingesetzt (SSL wurde durch TLS ersetzt, die Abkürzung wird aber noch sehr häufig verwendet).
  Das TLS besteht wiederum aus zwei Schichten und wird häufig eher der 5ten Schicht zugerechnet. Es wird grundsätzlich über TCP gesehen (aber unter etwa HTTP).


Was wünschen wir uns von der Flusskontrolle:
- Garantierte Datenübertragung
- Einhaltung der korrekten Reihenfolge
- Unterstützung beliebig großer Datenübertragungen
- Der Sender soll das Netzwerk nicht überlassen

---
# Tags

<iframe width="560" height="315" src="https://www.youtube.com/embed/Vdc8TCESIg8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

![9-FS_ComputerNetze](../assets/Christian-Baun/9-FS_ComputerNetze.pdf)
