---
tags: []
aliases: ["TCP", "Transmission Control Protocol"]
subject: ["ksn"]
source: ["Martin Aichriedler"]
reference: []
created: 6th May 2022
last_edited: 6th May 2022
---

# TCP - Transmission Control Protocol
![TCPIP_im_Schichtenmodell.png](TCPIP_im_Schichtenmodell.png)
## TCP Segmentierung
Datenpakete werden *segmentiert*/aufgeteilt und nach der Übertragung wieder zusammengesetzt. Die Segmente werden mit einem **HEADER** versehen, indem wichtige Informationen, wie Steuer- und Kontrollelemente , enthalten sind.
Jedes Segment bekommt eine *Sequenznummer*, damit die Pakete wieder in die richtige Reihenfolge gebracht weredn können. 
**Fehlende werden neu gesendet und Doppelte aussortiert.**
## Aufbau des TCP Headers
![TCP_übertragung.png](TCP_%C3%BCbertragung.png)
- Im Header sind alle Infos enthalten, die für eine gesicherte Verbindung wichtig sind
- Header ist in 32-Bit-Blöcke aufgeteilt.
- Min. 5 Blöcke $\rightarrow$ min. 20 Byte

- Seq-Nr.: Nummer des aktuellem Segment. 
- Ack-Nr.: Nummer des nächsten Segments.
- Flags: Kennzeichnung bestimmter Zustände
	- ACK: Kennzeichnet die Gültigkeit der Ack-Nr. 
	- SYN: Verbindungsaufbau
	- FIN: (Final) Wenn alle Daten übertragen sind. Sender und Empfänger müssen es senden, erst dann ist die Übertragung beendet

### Verbindungsaufbau
"Three-Way-Handshake"
![TCO_trans_aufbau.png](TCO_trans_aufbau.png)
1. Verbindungswunsch wird geschickt (SYN)
2. Server bestätigt (ACK) und fragt Verbindungswunsch an (SYN)
3. Client Bestätigung (ACK) 
### Datenübertragung
![TCP_trans_daten](netzwerk-technik/assets/TCP_trans_daten.png)
Sender sendet Paket $\rightarrow$ Empfänger bestätigt.
### Verbindungsabbau
![TCP_trans_aufbau.png](TCP_trans_aufbau.png)
![TCP_trans_abbau.png](TCP_trans_abbau.png)
## Flusskontrolle (Flow Control)
### Stop-and-Wait
### Sliding Window
## Überlastkontrolle (Congestion Control)
Ursachen einer Überlasung
1. Empfängerkapazität
	- Empfangsbuffer voll $\rightarrow$ Daten können nicht schnell genug empfangen werden.
	- Bereits durch die Flusskontrolle gelöst.
1. Netzkapazität
	- 
---
# Tags