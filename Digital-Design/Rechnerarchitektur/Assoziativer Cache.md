---
tags:
aliases:
subject:
  - VL
  - Rechnerarchitektur
semester: SS26
created: 21st June 2026
professor:
release: false
title: Assoziativer Cache
---

# Assoziativer Cache

> [!question] [Cache](Caches.md)

- Jedes Datum kann an jede Stelle im Cache geschrieben werden 
- Vollparalleler Vergleich der Adresse vom Hauptspeicher mit allen im Adressspeicher des Caches vorhandenen Adressen
- erfordert viel HW-Logik! 
- Besser Trefferquote 

**Keine feste Abbildung** der Hauptspeicher-Adressen auf die Cache-Adressen. Adresse wird parallel mit allen Tags im Caches verglichen.

- Aufwendige Logik für den parallelen Vergleich!
- Assoziative Speicher nur für kleine Cache-Größen

## Verdrängungsstrategien

- Szenario
	- Cache miss im assoziativen Cache
	- Alle Speicherbereiche des Caches belegt (Capacity Miss)
- Ausweg
	- verdränge Datum (Block) aus dem Cache
	- lade an seine Stelle das gerade benötigte Datum (Block)

Strategien:

| Strategie                   | Beschreibung                                                |
| --------------------------- | ----------------------------------------------------------- |
| Least Recently Used (LRU)   | verdränge das Datum, das am längsten nicht benutzt wurde    |
| Least Frequently Used (LFU) | verdränge das Datum, auf das am wenigsten zugegriffen wurde |
| First in, First out (FIFO)  | verdränge das Datum, das am längsten im Cache ist           |

## Beispiel

4-Bit Adressen (16 Speicherblöcke), assoziativer Cache, 4 Cacheblöcke, ein Block beinhaltet ein Wort

![600](../../_assets/Pasted%20image%2020260621195811.png)

### FIFO

![800](../../_assets/Pasted%20image%2020260621195727.png)

### LRU

![800](../../_assets/Pasted%20image%2020260621195843.png)



