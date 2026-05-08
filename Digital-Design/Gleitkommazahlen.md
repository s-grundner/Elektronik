---
tags:
aliases:
  - Floatingpoint
  - IEEE-754
subject:
  - VL
  - Rechnerarchitektur
semester: SS26
created: 6th May 2026
professor:
release: false
title: Gleitkommazahlen
---

# Gleitkommazahlen

> [!warning] Probleme bei Festkommazahlen: keine ganz großen bzw. kleinen Zahlen darstellbar!
> 
> - Darstellbarer Wertebereich: $[−2^n, 2^n − 2^{-k} ]$
> - Kleinste von $0$ verschiedene Beträge: $\pm 2^{-k}$
> - Operationen sind nicht abgeschlossen
> 	- $2^{n-1} + 2^{n-1}$ ist nicht darstellbar, obwohl die Operanden darstellbar sind
> - Assoziativgesetz und Distributivgesetz gelten nicht, da bei Anwendung der Gesetze evtl. der darstellbare Zahlenbereich verlassen wird!
> 
> > [!example] Beispiel: $(2^{n-1} +2^{n-1}) − 2^{n-1} ≠ 2^{n-1} + (2^{n-1} − 2^{n-1})$

Gleitkommazahlen liefern abhilfe mit der Darstellung:

$$
(-1)^S \cdot M\cdot 10^{E}
$$

- $M$ ... Mantisse $1 \leq m < 10$
- $E$ ... Exponent

## Unterschiede Zwischen Gleitkomma und Festkommazahlen

**Festkommazahlen**

- im gesamten Wertebereich konstanter Abstand zwischen zwei benachbarten Zahlen

**Gleitkommazahlen**

- Abstand bei betragsmäßig kleinen Zahlen sehr klein
- Abstand wächst mit dem Exponenten an

## IEEE 754 Standard

> [!def] **D)** Der IEEE-754 Standard bietet ein Binär-Format für die Darstellung der Form
> 
> $$
> (-1)^S \cdot M\cdot 2^{E}
> $$

32-Bit Single Precision Floating Point (`float`)

|  $S$  | Exponent $E$ | Mantisse $M$ |
| :---: | :----------: | :----------: |
|  31   |    30:23     |     22:0     |
| 1-Bit |    8-Bit     |    23-bit    |

64-Bit Double Precision Floating Point (`double`)

| $S$ | Exponent $E$ | Mantisse $M$ |
| :-: | :----------: | :----------: |
| 63  |         |         |

### Dezimal zu Float

> [!example]- **Dezimal $\to$ Float)** Dezimalzahl $A=3.75_{10}$ in IEEE 754 Single Precision Float umwandlen
> 
> #### Umwandeln in Binär
> 
> $$
> 3.75_{10} \equiv 11.11_{2}
> $$
> 
> Ganze Zahl: $3_{10} \equiv 11_{2}$
> 
> $$
> \begin{array}{ccc|c}
> 3 / 2 & = & 1 & 1 \\
> 1 / 2 & = & 0 & 1
> \end{array} \Bigg\uparrow_{\text{LSB}}^{\text{MSB}}
> $$
> 
> Bruch Zahl: $0.75_{10} \equiv 0.11_{2}$
> 
> $$
> \begin{array}{ccc|c}
> 0.75 / 2 & = & 1.5 & 1 \\
> 0.5 / 2 & = & 1 & 1
> \end{array} \,\Bigg\uparrow_{\text{LSB}}^{\text{MSB}}
> $$
> 
> #### Sign Bit Ermitteln
> 
> Dezimalzahl ist Positiv $\implies S=0$
> 
> #### Exponent
> 
> - Zahl Normieren auf $1,\dots$
> 
>   $$
> 11.11 = 1.111 \cdot 2^1 \implies E=1
> $$
> 
> - Offset von $127$ Anwenden
> 
> $$
> E^{\mathrm{off}} =(1+127)_{10} = 128_{10} = 1000~0000_{2}
> $$
> 
> #### Mantisse Befüllen
> 
> Die $1$ vor dem Komma wird weggelassen
> 
> $$
> M = (1,)111 = 111~0000~0000~0000~0000~0000_{2}
> $$
> 
> #### Format Ausfüllen
> 
> $$
> \begin{align}
> &\begin{array}{\ell}
> S & E & M \\
> 0 & 1000~0000 & 111~0000~0000~0000~0000~0000_{2}
> \end{array} \\
> \hline
> &=\mathrm{40700000}_{16}
> \end{align}
> $$

### Floatingpoint zu Dezimal


> [!example]- **Floating $\to$ Dezimal)** Single Precission IEEE 754 Zahl $B=\mathrm{3de00000}_{16}$ in Dezimalzahl umwandeln
> 
> #### In Binär umwandeln
> 
> $$
> \begin{align}
> B &= \mathrm{3de00000}_{16} \\
> &= 0011~1101~1110~0000~0000~0000~0000~0000_{2} \\
> \end{align}
> $$
> 
> #### Extrahieren von $S$, $E$, $M$
> 
> $$
> \begin{array}{lll}
> S & E^{\mathrm{off}} & M \\
> 0_{2} & 01111011_{2} & 11000000000000000000000_{2} \\ \hline
>  & 123_{10} & (1.)110\dots0_{2}
> \end{array}
> $$
> 
> - Offset Entfernen
> 
> $$
> E = 123 - 127 = -4
> $$
> 
> - Mantisse $1.$ Anfügen und in Dezimal umwandeln:
> 
> $$
> M = 1.11_{2} = 1 \cdot 2^0+ 1\cdot2^{-1} + 1\cdot 2^{-2}=1.75
> $$
> 
> #### In Gleitkomma Modell einsetzen
> 
> $$
> (-1)^S \cdot M\cdot 2^E = 1.75\cdot 2^{-4} = 0.109375
> $$

### Multiplikation

Multiplikation $C = A\cdot B$ im Floatingpoint format

$$
\begin{array}{lll}
\text{Operand} & \text{Dezimal} & \text{FP in Hex} & (S,E^{\text{ofs}},M)\\
A = & 3.75_{10} & \mathrm{40700000} & (0,128,1.111)\\
B = & 0.1093375_{10} & \mathrm{3de00000} & (0,124,1.11)
\end{array}
$$

$$
\begin{align}
C &= (-1)^{S_{C}}\cdot M_{C}\cdot 2^{E_{C}} \\
&= \left[ (-1)^{S_{A}}\cdot M_{A}\cdot 2^{E_{A}} \right] \cdot \left[(-1)^{S_{B}}\cdot M_{B}\cdot 2^{E_{B}} \right]  \\
&= (-1)^{S_{A}\oplus S_{B}} \cdot M_{A}M_{B} \cdot 2^{E_{A} + E_{B}}
\end{align}
$$

#### Sign Bit ermitteln

- Zwei Positive Zahlen multipliziert $\to$ Positiv
- Zwei Negative Zahlen multipliziert $\to$ Positiv
- Eine Positive und eine Negative Zahl multipliziert $\to$ Negativ

Formal: $S_{C} = S_{A} \oplus S_{B}$ ([XOR](Grundgatter.md))

#### Exponenten Berechnen

- $E_{A}^\mathrm{off} = 128$
- $E_{B}^\mathrm{off} = 124$

Beim Addieren der Offset Zahlen einmal den Offset Abziehen

$$
\begin{align}
E_{C}^\mathrm{off} &= E_{A}^\mathrm{off} +  E_{B}^\mathrm{off} - 127 \\
&=128 +123 - 127 \\
&= 124_{10} = 1111100_{2}
\end{align}
$$

#### Mantisse Berechnen


$$
M_{C} = M_{A}\cdot M_{B}
$$

### Addition

