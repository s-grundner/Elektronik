---
tags: ["Netzwerke"]
aliases: ["IP", "IP-Adresse", "IP-Adressen"]
subject: ["ksn"]
source: ["Martin Aichriedler"]
---

# Internet Protokoll
## IPv4
### Aufbau eines IPv4-Paketes
![[IPv4.png|400]]

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
| 14.    | Datenbereich        |             | Daten der [[Transportschicht]] |


### Fragmentieren
# Tags
[Sockets](<https://de.wikipedia.org/wiki/Socket_(Software)>)
