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
- Laden: $u_{c}(t)=U_{0}\cdot(1-e^{\dfrac{-t}{\uptau}})$
- Entladen: $u_{c}(t)=U_{0}\cdot e^{\dfrac{-t}{\uptau}}$

### Entladen
![[herl_te.png]]

### Laden
![[Herl_tl.png]]

### $T$ berechnen
![[herl_T.png]]

## Dimensionierung "Invertierenden Schmitttrigger" als Taktgenerator
$$U_{a,min}=0V=U_{B}^{-}$$ U_{T}^{-}=2V\qquad f =1kHz$$

# Tags