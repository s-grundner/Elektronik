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
keywords:
  - Negation
  - Konjunktion
  - Disjunktion
  - Implikation
  - Äquivalenz
  - Wahrheitstabelle
subject:
  - Mathematik 1
  - VL
semester: WS23
created: 26. September 2023
professor:
  - Andreas Neubauer
---
 

# Junktoren

> [!def] **D1 - JUNK)** Seien $A$ und $B$ [Aussagen](Aussagenlogik.md) ([Literale](Aussagenlogik.md)), dann heißen: 
>
> | $\neg A$      | lies: nicht $A$          | die *Negation* von $A$            |
> | ------------- | ------------------------ | --------------------------------- |
> | $A\wedge B$   | lies: $A$ und $B$        | die *Konjunktion* von $A$ und $B$ |
> | $A\vee B$     | lies: $A$ oder $B$       | die *Disjunktion* von $A$ und $B$ |
> | $A\implies B$ | lies: $A$ impliziert $B$ | die *Implikation* von $A$ und $B$ |
> | $A\iff B$     | lies: $A$ äquivalent $B$ | die *Äquivalenz* von $A$ und $B$  |
> | $A\oplus B$   | lies: $A$ kontra $B$     | die *Kontra-* oder *Antivalenz* vom $A$ und $B$                                   |

Diese Aussagen sind definiert durch folgende *Wahrheitstabelle*:

| $A$ | $B$ |     | $\neg A$ | $A\wedge B$ | $A\vee B$ | $A\Rightarrow B$ | $A\Leftrightarrow B$ |
|:---:|:---:|:---:|:--------:|:-----------:|:---------:|:----------------:|:--------------------:|
| $W$ | $W$ |     |   $F$    |     $W$     |    $W$    |       $W$        |         $W$          |
| $W$ | $F$ |     |   $F$    |     $F$     |    $W$    |       $F$        |         $F$          |
| $F$ | $W$ |     |   $W$    |     $F$     |    $W$    |       $W$        |         $F$          |
| $F$ | $F$ |     |   $W$    |     $F$     |    $F$    |       $W$        |         $W$          |

---

## Konjuktion

> [!def] $\wedge$

## Disjunktion

> [!def] $\vee$

Wie die Tabelle aus der obigen Definition zeigt, ist $A \vee B$ genau dann *wahr*, wenn wenigstens eine der beiden Aussagen $A,B$ *wahr* ist.

> [!hint] [Ansteuerlogik](../../Digitaltechnik/Ansteuerlogik.md)
> Die *Disjunktion* $\vee$ entspricht also dem nicht-ausschließenden (non-exclusive) **ODER**.

## Implikation

> [!def] $\implies$

Bei der Implikation $A\implies B$ nennt man $A$ die *Prämisse* und $B$ die *Konklusion*.  
Die Implikation ist laut Wahrheitstabelle genau dann *falsch*, wenn $A$ *wahr* und $B$ *falsch* ist.

> [!hint] Es kann aus *wahr* nicht *falsch* folgen
> - $A$ ist hinreichend für $B$
> - $B$ ist notwendig für $A$

## Äquivalenz

> [!def] $\iff$ 

$A \iff B$ entspricht in der Umgangssprache: $A$ ist genau dann *wahr*, wenn $B$ *wahr* ist.

> [!hint] $A\iff B$: $A$ ist notwendig und hinreichend für $B$

Die Symbole $A = B$, $A \equiv B$ und $A \iff B$ haben unterschiedliche Bedeutungen in Mathematik und Logik:

1. **$A = B$ (Gleichheit):**  
   - Dies bedeutet, dass $A$ und $B$ exakt identisch sind.  
   - Beispiel: $2 + 2 = 4$.

2. **$A \equiv B$ (Äquivalenz/Kongruenz):**  
   - Die Aussagen $A$ und $B$ sind logisch äquivalent. D.h. deren *Wahrheitswert* ist gleich.
   - In der Zahlentheorie wird $A \equiv B \mod m$ verwendet, um auszudrücken, dass $A$ und $B$ bezüglich einer bestimmten Modulo-Basis kongruent sind (d.h., ihre Differenz ist durch $m$ teilbar).  
   - Beispiel in der Modulo-Rechnung: $10 \equiv 4 \mod 6$ (weil $10 - 4 = 6$ durch $6$ teilbar ist).

3. **$A \iff B$ (Logische Äquivalenz/Zweifache Implikation):**  
   - Dies bedeutet „wenn und nur wenn“: $A$ ist genau dann wahr, wenn $B$ wahr ist (und umgekehrt).  
   - Es ist eine bidirektionale Implikation: $(A \Rightarrow B)$ und $(B \Rightarrow A)$ müssen beide gelten.  
   - Beispiel: $x > 0 \iff x^2 > 0$ für alle reellen Zahlen $x$ (außer $x = 0$).

## Klammern bei Logischen Operatoren

> [!SUMMARY] Um bei der Verknüpfung mehrerer logischer Aussagen Klammern zu sparen, vereinbaren wir:
> - $\neg$ bindet stärker als $\wedge, \vee,\implies$ und $\iff$
> - $\wedge$ und $\vee$ binden stärker als $\implies$ und $\iff$
>
> > [!EXAMPLE] Wir schreiben demnach  
> > - $\neg A\wedge B$ statt $(\neg A)\wedge B$  
> > - $A\wedge B\implies C$ statt $(A\wedge B)\implies C$



---

https://www.youtube.com/watch?v=FG-Uaulcw_g
