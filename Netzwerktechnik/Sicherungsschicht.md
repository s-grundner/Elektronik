---
tags:
  - Netzwerke
aliases:
  - Data Link Layer
  - Layer 2
  - Netzzgangsschicht
subject:
  - ksn
created: 4th April 2022
---

# Sicherungsschicht (OSI-Layer 2)

> [!hint] Um Übertragungsfehler zu erkennen (und zu beheben), wird eine Datenflusskontrolle und eine Fehlererkennung und -Behebung implementiert.
> - Hier gibt es auch eine erste Adressierung von Paketen.
> - Die Übertragung findet hier zwischen benachbarten Knoten statt.
> - Mehrere Bits werden in einen Frame zusammengefasst.
> - Adressierung kann etwa über MAC-Adressen erfolgen.
> 
> Typisch: Management konkurrierender Zugriff, Daten-Bits zusammen mit Kontrollbits in Frames zusammengefasst

## Aufgaben der Sicherungsschicht

## Geräte der Sicherungsschicht

## Protokolle der Sicherungsschicht

- **ARP** Address Resolution Protocol:
	- Umsetzung von Hardware-Adresse (MAC) in eine IP-Adresse (für IPv4).
	- Die Übersetzung erfolgt mittels Tabellen oder via ARP (wenn kein Eintrag vorhanden).
	- Dabei wird mit einer Ziel-IP ein ARP-Request mit der unbekannten MAC Adresse 255.255.255.255 gesendet.
	- Die betroffene Station antwortet mit seiner IP und der gesuchten MAC.
	- Mit RARP wird umgekehrt die IP zu einer bekannten MAC-Adresse ermittelt. Unter Windows kann in der Konsole mittels `arp` auf die Zuordnungstabelle zugegriffen werden.

# Tags

![4-FS_ComputerNetze](../xEDU/xLiteratur/Netzwerke/Christian-Baun-pdf/4-FS_ComputerNetze.pdf)

![5-FS_ComputerNetze](../xEDU/xLiteratur/Netzwerke/Christian-Baun-pdf/5-FS_ComputerNetze.pdf)

![6-FS_ComputerNetze](../xEDU/xLiteratur/Netzwerke/Christian-Baun-pdf/6-FS_ComputerNetze.pdf)
