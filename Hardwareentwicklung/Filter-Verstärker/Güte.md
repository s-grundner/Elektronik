---
tags: []
aliases: ["Q-Faktor"]
subject: ["hwe"]
source: ["Siegbert Schrempf", "Michael Offenhuber"]
created: 29th November 2022
---

# Güte

Beschreibt, wie stark das Resonanzverhalten ausgeprägt ist.

- Güte vom [Kondensator](../../Elektrotechnik/Kapazität.md): dünnes [Dielektrikum](../../Physik/Konstanten/Dielektrikum.md) $\to$ hohe Güte
- Güte der [Spule](../../Elektrotechnik/Induktivität.md): geringer Serienwiderstand $\to$ hohe Güte

> [!hint] Bauelement mit der geringsten Güte dominiert die Gesamtgüte.
> Gute Dielektrika sind in Echt leichter zu realisieren als ein geringer Serienwiderstand in einem Draht.
> Spulen beeinflussen daher die Güte am meisten und werden deshalb vermieden, wo es möglich ist.

## Güte in Schwingkreisen

| [Serienschwingkreis](../Oszillatoren/Serienschwingkreis.md) | [Parallelschwingkreis](../Oszillatoren/Parallelschwingkreis.md) |
| :---: | :---: |
| $Q=\frac{\omega_r L}{R}=\frac{1}{R} \sqrt{\frac{L}{C}}$ | $Q=\frac{1}{\omega_{\mathrm{r}} L G}=\frac{1}{G} \sqrt{\frac{C}{L}}$ |
| $Q=\frac{1}{\omega_{\mathrm{r}} C R}=\frac{1}{R} \sqrt{\frac{L}{C}}$ | $Q=\frac{\omega_{\mathrm{r}} C}{G}=\frac{1}{G} \sqrt{\frac{C}{L}}$ |

- Für hohe Güte muss beim *Serienschwingkreis* der Widerstand $R$ möglichst *klein* sein 
- Für hohe Güte muss beim *Parallelschwingkreis* der Widerstand $R$ möglichst *groß* sein