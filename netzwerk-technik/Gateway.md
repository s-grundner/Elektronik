---
tags: ["Netzwerke"]
aliases: ["Gateways"]
subject: ["ksn"]
source: ["Martin Aichriedler"]
---

# Gateways
Das Wort Gateway bezeichnet in der Informatik eine Komponente (Hard- oder Software), welche zwischen zwei Systemen eine Verbindung herstellt.

Gateways ermöglichen die Kommunikationzwischen Netzen, die auf unterschiedlichen Protokollen basieren.
Ein Gateway kann theoretisch auf allen [OSI-Schichten](OSI-Modell.md) Arbeiten
Als Gateway werden üblicherweise alle **Protokoll-Umsetzer** bezeichnet.

## Arbeitsweise
Die Arbeitsweise eines Gateways ist je nach Schicht im [OSI-Modell](OSI-Modell.md) sehr unterschiedlich:

| OSI-Layer                               | Beschreibung                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| --------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **[Layer 1](Bit%C3%BCbertragungsschicht.md)** | Hier arbeiten Medienkonverter, welche z. B. elektrische in optische Signale umwandeln.<br> Auch Powerline-Adapter zählen zu den Gateways auf [Layer 1](Bit%C3%BCbertragungsschicht.md).                                                                                                                                                                                                                                                                                                                                                        |
| **[Layer 2](Sicherungsschicht.md)**      | Auf dem [Layer 2](Sicherungsschicht.md) findet die Übersetzung zwischen unterschiedlichen Netzwerktypen statt, z. B. zwischen Ethernet und Token Ring. <br> Ab diesem Layer ist eine effektive Veränderung der transportierten Daten möglich.<br> So werden die Header von Ethernet durch ein Token von Token Ring ersetzt und umgekehrt.                                                                                                                                                                                                 |
| **[Layer 3](Vermittlungsschicht.md)**    | In Netzwerken, welche eine Unterteilung in Subnetze wie bei [IP-Adressen](Internet%20Protocol.md) vornehmen, arbeiten hier die Router.<br>Ein Router leitet Pakete zwischen den angeschlossenen Subnetzen weiter.<br>Das eigentliche Routing verändert dabei keinerlei Daten auf [Layer 3](Vermittlungsschicht.md).<br>Eine Ausnahme davon stellt Network Address Translation dar, welche Daten auf [Layer 3](Vermittlungsschicht.md) ändert.                                                                                                |
| **[Layer 3](Vermittlungsschicht.md)**    | In Netzwerken, welche eine Unterteilung in Subnetze wie bei [IP-Adressen](Internet%20Protocol.md) vornehmen, arbeiten hier die Router.<br>Ein Router leitet Pakete zwischen den angeschlossenen Subnetzen weiter.<br>Das eigentliche Routing verändert dabei keinerlei Daten auf [Layer 3](Vermittlungsschicht.md).<br>Eine Ausnahme davon stellt Network Address Translation dar, welche Daten auf [Layer 3](Vermittlungsschicht.md) ändert.                                                                                                |
| **[Layer 4](Transportschicht.md)**       | Im TCP/[IP](Internet%20Protocol.md)-Stack ist Port Address Translation ein häufiges Beispiel für ein Gateway.<br>Dabei werden Portnummern von TCP oder UDP in den transportierten Paketen ausgetauscht.<br> Ein anderes Beispiel für [Layer 4](Transportschicht.md) Gateways ist die Terminierung von TLS-Verbindungen.<br>Das Gateway entschlüsselt dabei die ankommenden Pakete und leitet diese anschließend an ein anderes System weiter.<br>Für die Weiterleitung kann dabei ebenfalls Verschlüsselung mittels TLS zum Einsatz kommen. |
| **[Layer 5-7](OSI-Modell.md)**                                         | Gateways auf diesen Layern nehmen eine Umsetzung zwischen unterschiedlichen Applikationsprotokollen vor,<br>z. B. von Fax zu E-Mail oder von analoger Telefonie zu VoIP.<br>Ein Gateway auf diesen Layern, das die Inhalte der Pakete untersucht und verändert, ohne eine Übersetzung in ein anderes Protokoll vorzunehmen,<br>wird als Application Layer Gateway oder häufiger als Proxy bezeichnet.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |

## Beispiele für Gateways
- USB to UART Bridge ([Layer 1](Bitübertragungsschicht.md) Gateway)
- Router Verbindet [LAN](Local%20Area%20Network.md) mit einem [Wide Area Network](Wide%20Area%20Network.md) (Gateway auf [Layer 3](Vermittlungsschicht.md))
# Tags
Wikipedia Eintrag zu [Gateway](<https://de.wikipedia.org/wiki/Gateway_(Informatik)>)