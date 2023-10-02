---
tags:
  - Mathe
  - Logik
aliases:
  - Junktoren
  - Junktion
  - Konjunktion
  - Disjunktion
  - Implikation
  - Äquivalenz
  - konjunktiv
  - disjunktiv
  - impliziert
  - äquivalent
keywords:
  - Negation
  - Konjunktion
  - Disjunktion
  - Implikation
  - Äquivalenz
  - Wahrheitstabelle
subject:
  - Mathematik1
semester: 1
created: 26. September 2023
professor: Andreas Neubauer
ref:
  - Def 1.3.
---
 

# Junktoren

---

> [!ABSTRACT] Definition 1.3 [^1] - Seien $A$ und $B$ Aussagen, dann heißen: 

| $\neg A$             | lies: nicht $A$          | die *Negation* von $A$            |
| -------------------- | ------------------------ | --------------------------------- |
| $A\wedge B$          | lies: $A$ und $B$        | die *Konjunktion* von $A$ und $B$ |
| $A\vee B$            | lies: $A$ oder $B$       | die *Disjunktion* von $A$ und $B$ |
| $A\implies B$     | lies: $A$ impliziert $B$ | die *Implikation* von $A$ und $B$ |
| $A\Leftrightarrow B$ | lies: $A$ äquivalent $B$ | die *Äquivalenz* von $A$ und $B$  |

> Diese Aussagen sind definiert durch folgende *Wahrheitstabelle*:

| $A$ | $B$ |  I  | $\neg A$ | $A\wedge B$ | $A\vee B$ | $A\Rightarrow B$ | $A\Leftrightarrow B$ |
|:---:|:---:|:---:|:--------:|:-----------:|:---------:|:----------------:|:--------------------:|
| $W$ | $W$ |  I  |   $F$    |     $W$     |    $W$    |       $W$        |         $W$          |
| $W$ | $F$ |  I  |   $F$    |     $F$     |    $W$    |       $F$        |         $F$          |
| $F$ | $W$ |  I  |   $W$    |     $F$     |    $W$    |       $W$        |         $F$          |
| $F$ | $F$ |  I  |   $W$    |     $F$     |    $F$    |       $W$        |         $W$          |

---

## Disjunktion $\vee$

Wie die Tabelle aus der obigen Definition zeigt, ist $A \vee B$ genau dann *wahr*, wenn wenigstens eine der beiden Aussagen $A,B$ *wahr* ist.  
Die *Disjunktion* $\vee$ entspricht also dem nichtauschließenden (exclusive) *Oder*.

## Implikation $\implies$

Bei der Implikation $A\implies B$ nennt man $A$ die *Prämisse* und $B$ die *Konklusion*.  
Die Implikation ist laut Wahrheitstabelle genau dann *falsch*, wenn $A$ *wahr* und $B$ *falsch* ist.

> [!INFO] Es kann aus *wahr* nicht *falsch* folgen
> - $A$ ist hinreichend für $B$
> - $B$ ist notwendig für $A$

## Äquivalenz $\Leftrightarrow$

$A \Leftrightarrow B$ entspricht in der Umgangssprache: $A$ ist genau dann *wahr*, 
