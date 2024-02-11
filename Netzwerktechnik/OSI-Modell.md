---
tags: ["Netzwerke"]
aliases: ["OSI-Modell","OSI-Modells"]
subject: ["ksn"]
source: ["Martin Aichriedler"]
created: 4th April 2022
---

# OSI Referenzmodell

Das ISO/OSI-Referenzmodell (englisch Open Systems Interconnection model) ist ein Referenzmodell für Netzwerkprotokolle als Schichtenarchitektur. Es wird seit 1983 von der International Telecommunication Union (ITU) und seit 1984 auch von der International Organization for Standardization (ISO) als Standard veröffentlicht. Seine Entwicklung begann im Jahr 1977.

> [!INFO] Zweck des OSI-Modells ist es, Kommunikation über unterschiedlichste technische Systeme hinweg zu beschreiben und die Weiterentwicklung zu begünstigen.  
> Dazu definiert dieses Modell sieben aufeinanderfolgende Schichten (engl. layers) mit jeweils eng begrenzten Aufgaben. In der gleichen Schicht mit klaren [Schnittstellen](../Digitaltechnik/{MOC}%20Schnittstellen.md) definierte Netzwerkprotokolle sind einfach untereinander austauschbar, selbst wenn sie wie das [Internet Protocol](Internet%20Protocol.md) eine zentrale Funktion haben.

> [!WARNING] Früh wurde erkannt: Kommunikation ist komplex, daher:
> - zur Vereinfachung wird der komplexe (Kommunikations-) Vorgang in einfache Teilschritte aufgeteilt
> - jeder Teilschritt wird als Schicht ausgedrückt (-> 7 Schichten)
> - es werden Schnittstellen zwischen den Schichten definiert um erfolgreich zu kommunizieren. Zur Übertragung: Protokolle (=Definition der Regelwerke)
> - Datenübertragungen können grob in 3 Teile unterteilt werden:
> 	- Übertragungsweg (Kabel/[Funk](../HF-Technik/Rundfunk.md) …)
> 	- Protokoll: Definition wie der Übertragungsweg genutzt wird
> - Anwendung: stellt die Daten zur Verfügung/nimmt sie wieder entgegen
> - Beim Senden werden 7 Schichten von Oben (Anwendung) beginnend durchlaufen, beim Empfang werden ebenfalls 7 Schichten in umgekehrter Richtung durchlaufen

Die Idee ist sehr gut, allerdings haben sich vielfach die unteren Schichten als sehr grob erwiesen, die oberen Schichten als zu fein.

## Schichten

![Schichtenmodell Einführung](Nw/assets/NW_Schichtenmodell_Einf.png)

| Layer | Name (DE)                                           | Name (EN)                                   | Einheit  |
|:-----:| --------------------------------------------------- | ------------------------------------------- | -------- |
|   1   | [Bitübertragungsschicht](Bitübertragungsschicht.md) | [Physical Layer](Bitübertragungsschicht.md) | Bits     |
|   2   | [Sicherungsschicht](Sicherungsschicht.md)           | [Data Link Layer](Sicherungsschicht.md)     | Rahmen   |
|   3   | [Vermittlungsschicht](Vermittlungsschicht.md)       | [Network Layer](Vermittlungsschicht.md)     | Pakete   |
|   4   | [Transportschicht](Transportschicht.md)             | [Transport Layer](Transportschicht.md)      | Segmente |
|   5   | [Sitzungsschicht](Sitzungsschicht.md)                  | [Session Layer](Sitzungsschicht.md)                               |          |
|   6   | [Darstellungsschicht](Darstellungsschicht.md)          | [Presentation Layer](Darstellungsschicht.md)                          |          |
|   7   | [Anwendungsschicht](Anwendungsschicht.md)              | [Application Layer](Anwendungsschicht.md)                           |          |

1. Anwendung:
	- Dateieingabe und -Ausgabe; stellt Funktionen für die Anwendung zur Verfügung


> [!hint] Weitere Definitionen
> - Schichten 1-4: **Transportsystem** - stellt eine zuverlässige Übertragung sicher
> 
> - Schichten 5-7: **Anwendungssystem** - für dieses System ist eine komplette End-zu-End-Verbindung gewährleistet.
> 
> ![](Nw/assets/NW_Schichtenmodell.png)
> 
> Definition der Begriffe: Bits, Frames, Pakete, Segmente, Daten (siehe Bild): sind jeweils das Gleiche, kennzeichnen lediglich in welcher Schicht sie sich befinden. Zuordnung von (sehr gängigen) Protokollen zu den Schichten (siehe Bild).

## Reale Kommunikation

Die Kommunikation mittels eines Schichtenmodells wirkt so als kommuniziert etwa die Darstellungsschicht mittels eines Darstellungsprotokolls mit einem zweiten Teilnehmer der Darstellungsschicht (-> starke Vereinfachung). Unsichtbar ist eine Schicht dafür zuständig in die nächste Schicht zu übertragen. In jedem zwischengeschalteten Teilnehmer funktioniert das gleich. Bis in welche Ebene kommuniziert wird, hängt von der eingesetzten Komponente ab:

![NW_Schichtenmodell_Real](Nw/assets/NW_Schichtenmodell_Real.png)

Hier ist **Host A** mit **Router 1** verbunden. Dieser ist (via weiterer, hier nicht dargestellter Komponenten) wiederum mit einem weiterem **Router n** verbunden. In einem Router (in einem TCP/IP-Netzwerk) werden die empfangenen Daten bis in die Vermittlungsschicht ausgepackt, der Empfänger damit ermittelt, für den Weitertransport wieder entsprechend verpackt und weitergesendet.

## Internet-Protokollfamilie

- das OSI-Modell ist sehr komplex
- über die Jahre haben sich leichter implementierbare Protokolle (daher preiswerter) etabliert.
- das amerikanische Verteidigungsministerium hat eigene Lösungen erarbeitet


Internet-Protokollfamilie = TCP/IP-Protokollfamilie (nach den beiden Kern Protokollen) = DoD-Protokollfamilie (**D**epartment **o**f **D**efence), 4 Ebenen:  

 ![|inlineR|450](Nw/assets/NW_Schichtenmodell_IP.png)

> - **Application Layer** OSI-Layer 5,6, und 7; Nachricht bestehend aus Header und Daten.
> - **Transport Layer** OSI-Layer 4 und teilweise 5; Segment bestehend aus Header und Nachricht und 
> - **Internet Layer** OSI-Layer 3; Paket bestehend aus Header und Segment
> - **Network Access Layer** OSI-Layer 1, 2 und zum Teil 3; Frame bestehend aus Header und Paket

Die niedrigen Schichten beinhalten immer die kompletten oberen Schichten, erweitert um einen Schichtspezifischen Header. Der TCP-Header beinhaltet den Quell-/Ziel-Port, der IP-Header beinhaltet die Quell-/Ziel-IP-Adresse und die beiden [Ethernet](Ethernet.md)-Schichten darunter die Quell-/Ziel-MAC-Adressen (Achtung: Bild nicht maßstabgerecht):

![](Nw/assets/NW_Internetprotokollfam.png)

# Tags

[Christian Baun](http://www.christianbaun.de/)
