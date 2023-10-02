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
  - Mathematik1
semester: 1
created: 26. September 2023
professor: Andreas Neubauer
ref:
  - Def 1.1.
  - Def 1.4.
  - Bsp 1.2.
---
 

# Aussagenlogik

> [!INFO]  
>  ![Axiom](Axiom.md)

Dazu benötigen wir einige Begriffe und Symbole:

## Aussage

> [!abstract] Definition 1.1 - Aussage [^1]  
> Eine *Aussage* ist ein sprachlicher Ausdruck, für den es einen Sinn hat zu fragen, ob es wahr oder falsch ist.  
> Sie soll stets entweder wahr oder falsch sein (*zweiwertige Logik*). (Anders als Unschärfe/Fuzzy-Logik)  
> Symbole für Aussagen sind: $A, B, C\dots$  

### Wahrheitswert einer Aussage

> [!ABSTRACT] ff. Definition 1.1 - Wahrheitswert [^1]  
> Der *Wahrheitswert* $|A|$ von $A$ ist definiert wie folgt:
> - $|A| = W$ genau dann, wenn $A$ *wahr* ist;
> - $|A| = F$ genau dann, wenn $A$ *falsch* ist.
> 
> Haben Aussagen $A$ und $B$ den gleichen Ausgangswert, so schreiben wir:  
> $A\equiv B$ oder $|A|=|B|$ $\quad\equiv\dots$ [äquivalent](Junktor.md)

Aussagenlogik gestattet es, durch aussagelogische Verknüpfungen (sogenannte [Junktoren](Junktor.md)) aus zwei Aussagen $A$ und $B$ neue, komplexere Aussagen zu bilden.

> [!EXAMPLE] Beispiel 1.2 [^2]  
> ✅Eine Aussage ist: *Wien liegt in der Schweiz*  
> ❌Keine Aussage ist: *Wie geht es dir*

## Tautologie und Kontradiktion

> [!ABSTRACT] Definition 1.4 [^3] - Tautologie und Kontradiktion  
> Eine Verknüpfung von Aussagen ([Junktion](Junktor.md)), die unabhängig von den Wahrheitswerten dieser Aussagen stets wahr (falsch) ist, heißt *Tautologie $T$ (Kontradiktion $K$)*
> - Tautologie $T$ $\to$ immer wahr: $|T| = W$
> - Kontradiktion $K$ $\to$ immer falsch: $|K| = F$

[^1]: Definition 1.1 - [Skriptum - Andreas Neubauer](../xEDU/JKU/Mathe/mathematik.pdf), [S. 5]  
[^2]: Beispiel 1.2 - [Skriptum - Andreas Neubauer](../xEDU/JKU/Mathe/mathematik.pdf), [S. 5]
[^3]: Definition 1.4 - [Skriptum - Andreas Neubauer](../xEDU/JKU/Mathe/mathematik.pdf), [S. 6]