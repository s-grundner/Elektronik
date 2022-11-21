---
tags: ["Netzwerke"]
aliases: ["Gateways"]
subject: ["ksn"]
source: ["Martin Aichriedler"]
---

# Gateways
Das Wort Gateway bezeichnet in der Informatik eine Komponente (Hard- oder Software), welche zwischen zwei Systemen eine Verbindung herstellt.

Gateways ermöglichen die Kommunikationzwischen Netzen, die auf unterschiedlichen Protokollen basieren.
Ein Gateway kann theoretisch auf allen [[OSI-Modell|OSI-Schichten]] Arbeiten
Als Gateway werden üblicherweise alle **Protokoll-Umsetzer** bezeichnet.

## Arbeitsweise
Die Arbeitsweise eines Gateways ist je nach Schicht im [[OSI-Modell]] sehr unterschiedlich:

| OSI-Layer                               | Beschreibung                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| --------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **[[Bitübertragungsschicht\|Layer 1]]** | Hier arbeiten Medienkonverter, welche z. B. elektrische in optische Signale umwandeln.<br> Auch Powerline-Adapter zählen zu den Gateways auf [[Bitübertragungsschicht\|Layer 1]].                                                                                                                                                                                                                                                                                                                                                        |
| **[[Sicherungsschicht\|Layer 2]]**      | Auf dem [[Sicherungsschicht\|Layer 2]] findet die Übersetzung zwischen unterschiedlichen Netzwerktypen statt, z. B. zwischen Ethernet und Token Ring. <br> Ab diesem Layer ist eine effektive Veränderung der transportierten Daten möglich.<br> So werden die Header von Ethernet durch ein Token von Token Ring ersetzt und umgekehrt.                                                                                                                                                                                                 |
| **[[Vermittlungsschicht\|Layer 3]]**    | In Netzwerken, welche eine Unterteilung in Subnetze wie bei [[Internet Protocol\|IP-Adressen]] vornehmen, arbeiten hier die Router.<br>Ein Router leitet Pakete zwischen den angeschlossenen Subnetzen weiter.<br>Das eigentliche Routing verändert dabei keinerlei Daten auf [[Vermittlungsschicht\|Layer 3]].<br>Eine Ausnahme davon stellt Network Address Translation dar, welche Daten auf [[Vermittlungsschicht\|Layer 3]] ändert.                                                                                                |
| **[[Vermittlungsschicht\|Layer 3]]**    | In Netzwerken, welche eine Unterteilung in Subnetze wie bei [[Internet Protocol\|IP-Adressen]] vornehmen, arbeiten hier die Router.<br>Ein Router leitet Pakete zwischen den angeschlossenen Subnetzen weiter.<br>Das eigentliche Routing verändert dabei keinerlei Daten auf [[Vermittlungsschicht\|Layer 3]].<br>Eine Ausnahme davon stellt Network Address Translation dar, welche Daten auf [[Vermittlungsschicht\|Layer 3]] ändert.                                                                                                |
| **[[Transportschicht\|Layer 4]]**       | Im TCP/[[Internet Protocol\|IP]]-Stack ist Port Address Translation ein häufiges Beispiel für ein Gateway.<br>Dabei werden Portnummern von TCP oder UDP in den transportierten Paketen ausgetauscht.<br> Ein anderes Beispiel für [[Transportschicht\|Layer 4]] Gateways ist die Terminierung von TLS-Verbindungen.<br>Das Gateway entschlüsselt dabei die ankommenden Pakete und leitet diese anschließend an ein anderes System weiter.<br>Für die Weiterleitung kann dabei ebenfalls Verschlüsselung mittels TLS zum Einsatz kommen. |
| **[[OSI-Modell\|Layer 5-7]]**                                         | Gateways auf diesen Layern nehmen eine Umsetzung zwischen unterschiedlichen Applikationsprotokollen vor,<br>z. B. von Fax zu E-Mail oder von analoger Telefonie zu VoIP.<br>Ein Gateway auf diesen Layern, das die Inhalte der Pakete untersucht und verändert, ohne eine Übersetzung in ein anderes Protokoll vorzunehmen,<br>wird als Application Layer Gateway oder häufiger als Proxy bezeichnet.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |

## Beispiele für Gateways
- USB to UART Bridge ([[Bitübertragungsschicht|Layer 1]] Gateway)
- Router Verbindet [[Local Area Network|LAN]] mit einem [[Wide Area Network]] (Gateway auf [[Vermittlungsschicht|Layer 3]])
# Tags
Wikipedia Eintrag zu [Gateway](<https://de.wikipedia.org/wiki/Gateway_(Informatik)>)