---
tags:
  - Statistik
  - Wahrscheinlichkeitstheorie
aliases:
  - Zufallsgröße
  - Verteilung einer Zufallsvariable
  - stetige Zufallsvariable
  - diskrete Zufallsvariable
subject:
  - KV
  - Wahrscheinlichkeitstheorie und stochastische Prozesse
created: 9th December 2025
title: Zufallsvariable
semester: WS25
professor:
  - Dmitry Efrosinin
release: true
---

# Zufallsvariable

Ein Merkmal $Z$, dessen numerische Werte die Ergebnisse eines Zufallsvorgangs sind, heißt Zufallsvariable oder Zufallsgröße.

> [!def] **D - Zufallsvariable)** 
> 
> Unter einer **Zufallsvariablen** versteht man einen Mechanismus, der für das Zustandekommen von zufälligen (also nicht vollständig vorhersehbaren) Zahlen verantwortlich ist. Zufallsvariable bezeichnen wir stets mit großen Buchstaben $X,Y,Z,\dots$
> 
> - Eine Zufallsvariable heißt **diskret**, wenn dabei nur diskrete (also durch Intervalle voneinander getrennte) Zahlen erzeugt werden.
> - Eine Zufallsvariable heißt **stetig**, wenn prinzipiell alle Zahlen aus einem Intervall auftreten können und keine dieser Zahlen mit positiver Wahrscheinlichkeit auftritt.

Dem Begriff einer Zufallsvariablen liegt die Vorstellung zu Grunde, dass die mit diesem Mechanismus erzeugten Werte $Z(\omega) \in \mathbb{R}$ dadurch entstehen, dass im Hintergrund ein mehr oder weniger komplexes Zufallsexperiment abläuft, von dessen Realisierungen $\omega\in\Omega$ nur das Merkmal $Z(\omega)\in\mathbb{R}$ beobachtet wird.

Bei einer **Zufallsvariablen** $Z$ handelt es sich somit um eine **Abbildung** $Z:\Omega \to \mathbb{R}$ wobei in vielen Fällen weder der Ereignisraum $\Omega$ noch das dieses Zufallsexperiment steuernde W-Maß $\mathbb{P}$ explizit bekannt sind.

Mit der folgenden Skizze wird diese Situation verdeutlicht. Man erkennt
- Das im Hintergrund ablaufende Zufallsexperiment
- Den Zufallsmechanismus $Z$, welcher jedem $\omega\in\Omega$ die *zufällige* Zahl $Z(\Omega)$ zuordnet
- Das Ereignis $\{ Z \in B \} = \{ \omega \in \Omega | Z(\omega) \in B \}$
- Die durch das W-Maß $\mathbb{P}$ auf $\Omega$ und die Zufallsvariable $Z$ bestimmte Verteilung $\mathbb{P}_{Z}$ auf $\mathbb{R}$.

![](../../_assets/Pasted%20image%2020260214012847.png)

> [!example]- Beispiele für **diskrete** Zufallsvariablen
> -	Das Beobachten der Augensumme beim Würfeln mit drei homogenen Würfeln;
> -	Das Feststellen der Anzahl der auftretenden Adler beim 10-maligen Werfen einer Münze;
> -	Das Beobachten der Anzahl der Farbwechsel beim Ziehen von verschieden gefärbten Kugeln aus einer Urne;
> -	Das Feststellen der Anzahl der fehlerhaften Stücke einer Stichprobe;
> -	Das Beobachten der Anzahl der Forderungen, die bei einer Bedienungsanlage eintreffen;
> -	Das Feststellen der Anzahl der in einem Zeitintervall von einer radioaktiven Substanz emittierten Teilchen;
> - Das Ermitteln der Anzahl der Fehlstellen in einem Stück Stoff oder in einem Streifen Blech.

> [!example]- Beispiele für **stetige** Zufallsvariablen
> -	Das Beobachten der Verweilzeit einer Forderung in einer Bedienungsanlage;
> -	Das Feststellen der Lebensdauer eines elektronischen Bauteils;
> -	Das Beobachten der Schlafdauer einer Testperson nach Einnahme eines Schlafmittels;
> -	Das Aufnehmen eines mit Messfehlern behafteten Messwerts.

## Verteilung einer Zufallsvariable

In der Stochastik ist man weniger an der Zufallsvariable $Z$ selbst (also an dem Mechanismus, der diese zufälligen Zahlen erzeugt) interessiert, sondern vielmehr daran, wie diese **verteilt** sind.

> [!hint] Also mit welchen Wahrscheinlichkeiten die Zahlen $Z(\omega)$, welche durch diesen Mechanismus Z erzeugt werden, auftreten.

> [!def] **D - Verteilung)**
> Unter der **Verteilung** der Zufallsvariablen $Z$ versteht man eine Abbildung $\mathbb{P}_{Z}$, welche jeder (vernünftigen) Menge $B \subseteq \mathbb{R}$ die Wahrscheinlichkeit
> 
> $$
> \mathbb{P}_{Z}(B) = \mathbb{P}(\{ Z \in B \}) = \mathbb{P}(\{ \omega \in \Omega | Z(\omega) \in B \})
> $$
> 
> zuordnet. Die Zahl $\mathbb{P}_{Z}(B)$ gibt somit an, mit welcher Wahrscheinlichkeit durch den Mechanismus $Z$ ein Wert aus der Menge $B$ erzeugt wird. Ist die Zufallsvariable $Z$ diskret bzw stetig, so nennt man auch die Verteilung $\mathbb{P}_{Z}$ **diskret** bzw. **stetig**.


> [!satz] **S)** Die Verteilung einer Zufallsvariable $Z$ ist ein W-Maß auf $\mathbb{R}$, es gilt also
> 1. $\mathbb{P}_{Z}(\mathbb{R}) = 1$
> 2. für alle Mengen $B\subseteq \mathbb{R}$ ist $\mathbb{P}_{Z}(B)\geq 0$
> 3. für endlich oder abzählbar unendlich viele paarweise disjunkte Mengen $B_{1},\ldots,B_{n},\ldots \subseteq \mathbb{R}$ gilt
> 
> $$
> \mathbb{P}_{Z}(B_{1} \cup \ldots \cup B_{n} \cup \ldots) = \mathbb{P}_{Z}(B_{1}) + \ldots + \mathbb{P}_{Z}(B_{n}) + \ldots
> $$

## Verteilungsdichten diskreter Zufallsvariablen

![Verteilungsdichten diskreter Zufallsvariablen](Wahrscheinlichkeitsverteilung.md#Verteilungsdichten%20diskreter%20Zufallsvariablen)

## Unabhängige Zufallsvariable

> [!def] **D)** $X, Y, Z_1, Z_2, \ldots$ seien Zufallsvariablen auf einem beliebigen W-Raum $(\Omega, \mathbb{P})$.
> 
> 1. Die beiden Zufallsvariablen $X$ und $Y$ heißen **unabhängig**, falls für alle $A, B \subseteq \mathbb{R}$
> 
> $$
> \mathbb{P}(\{X \in A\} \cap\{Y \in B\})=\mathbb{P}(\{X \in A\}) \cdot \mathbb{P}(\{Y \in B\})
> $$
> 
> 2. Die Zufallsvariablen $Z_1, Z_2, \ldots$ heißen **paarweise unabhängig**, falls für alle $i \neq k$ und alle $A, B \subseteq \mathbb{R}$
> 
> $$
> \mathbb{P}(\{Z_i \in A\} \cap\{Z_k \in B\})=\mathbb{P}(\{Z_i \in A\}) \cdot \mathbb{P}(\{Z_k \in B\})
> $$
> 
> 3. Die Zufallsvariablen $Z_1, Z_2, \ldots$ heißen **vollständig unabhängig**, falls für jede Auswahl von $k \in \mathbb{N}$ *paarweise verschiedenen* Zufallsvariablen $Z_{i_1}, Z_{i_2}, \ldots, Z_{i_k}$ und alle $A_1, A_2, \ldots, A_k \subseteq \mathbb{R}$
> 
> $$
> \mathbb{P}(\{Z_{i_1} \in A_1\} \cap\{Z_{i_2} \in A_2\} \cap \ldots \cap\{Z_{i_k} \in A_k\})=\mathbb{P}(\{Z_{i_1} \in A_1\}) \cdot \mathbb{P}(\{Z_{i_2} \in A_2\}) \ldots \mathbb{P}(\{Z_{i_k} \in A_k\})
> $$

Man kann feststellen, dass zwei Zufallsvariablen unabhängig sind, indem man prüft,

- ob die Bedingte Verteilungsdichte gleich der Marginalverteilungsdichte ist

> [!question] Siehe: [Bedingte Verteilungsdichte](Wahrscheinlichkeitsverteilung.md#Bedingte%20Verteilungsdichte)

- oder ob die [Kovarianz](Kovarianz.md) $\operatorname{Cov}(X,Y) = 0$ ist.

![](Kovarianz.md#^UNCORRELATED)
