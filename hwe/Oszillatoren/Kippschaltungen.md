---
tags: []
aliases: []
subject: ["hwe"]
source: ["Siegbert Schrempf"]
reference: []
created: 3rd January 2023
---

# Kippschaltungen
- Taktfrequenz ist stark von Bauteiltoleranzen abhängig.
- Verwendbar bis etwa 1MHz
- Hochwertige Bauteile (Toleranzen, Temperaturdrift) für R und C
- Als Buffer sollte ein weiteres Gatter hinter dem Oszillator nachgeschaltet werden.
- Nachschalten eines T-FF zur Taktsymmetrierung.

> [!warning] Kippschaltungen sind durch die Steig-/Fallzeit der Flanken begrenzt (Slew):
> ![[Kippschalter-slew.png]]

# Schmitttrigger Kippschaltung
Die Frequenz wird von durch folgende Parameter beeinflusst:
- RC-Glied im Rückkoppelbereich ($\uptau$);
- Schaltschwellen (Threshhold) des Schmitttriggers ($U_{T}^{+} / U_{T}^{-}$)

Die Schmitttrigger Kippschaltungen ist eine Astabile Kippstufe

> [!hint] Schaltung
> ![[ST-Kippschalter.png|300]]

## Herleitung
![[ST-Diag.png|500]]

$$T=(t_{3}-t_{2})+(t_{2}-t_{1})$$
- $u_{c}(t)=$

## Dimensionierung

# Tags