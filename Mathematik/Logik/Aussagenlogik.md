---
tags:
  - Mathe
  - Logik
aliases:
  - Aussagelogik
  - zweiwertige Logik
  - Tautologie
  - Kontradiktion
keywords:
  - Aussage
  - Wahrheitswert
  - Tautologie
  - Kontradiktion
subject:
  - VL
  - Mathematik 1
semester: WS23
created: 26. September 2023
professor:
  - Andreas Neubauer
def:
  - Def 1.1.
  - Def 1.4.
  - Bsp 1.2.
---
 

# Aussagenlogik

#todo Nummerierung Neubauer Skriptum auflösen

## Aussage

> [!def] **D1 - Aussage)**
> Eine *Aussage* ist ein sprachlicher Ausdruck, für den es einen Sinn hat zu fragen, ob es wahr oder falsch ist.  
> Sie soll stets entweder wahr oder falsch sein (*zweiwertige Logik*). (Anders als Unschärfe/Fuzzy-Logik)  
> Symbole für Aussagen sind: $A, B, C\dots$  

### Wahrheitswert einer Aussage

> [!def] **D2 - Wahrheitswert)**
> Der *Wahrheitswert* $|A|$ von $A$ ist definiert wie folgt:
> - $|A| = W$ genau dann, wenn $A$ *wahr* ist;
> - $|A| = F$ genau dann, wenn $A$ *falsch* ist.
> 
> Haben Aussagen $A$ und $B$ den gleichen Ausgangswert, so schreiben wir:  
> $A\equiv B$ oder $|A|=|B|$ $\quad\equiv\dots$ [äquivalent](Junktor.md#Äquivalenz)

Aussagenlogik gestattet es, durch aussagelogische Verknüpfungen (sogenannte [Junktoren](Junktor.md)) aus zwei Aussagen $A$ und $B$ neue, komplexere Aussagen zu bilden.

> [!example] Bsp 
> ✅Eine Aussage ist: *Wien liegt in der Schweiz*  
> ❌Keine Aussage ist: *Wie geht es dir*

## Tautologie und Kontradiktion

> [!def] **D - Tautologie und Kontradiktion**
> Eine Verknüpfung von Aussagen ([Junktion](Junktor.md)), die unabhängig von den Wahrheitswerten dieser Aussagen stets wahr (falsch) ist, heißt *Tautologie $T$ (Kontradiktion $K$)*
> - Tautologie $T$ $\to$ immer wahr: $|T| = W$
> - Kontradiktion $K$ $\to$ immer falsch: $|K| = F$
