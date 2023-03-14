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
> ![[Kippschalter-slew.png|500]]

# [[Schmitt Trigger]] Kippschaltung
Die Frequenz wird von durch folgende Parameter beeinflusst:
- RC-Glied im Rückkoppelbereich ($\uptau$);
- Schaltschwellen (Threshhold) des Schmitt Triggers ($U_{T}^{+} / U_{T}^{-}$)

Die [[Schmitt Trigger]] Kippschaltungen ist eine Astabile Kippstufe

> [!hint] Schaltung
> ![[ST-Kippschalter.png|300]]

## Herleitung
![[ST-Diag.png|500]]
> [!summary] Periodendauer $T$
> $T=(t_{3}-t_{2})+(t_{2}-t_{1})$
 

> [!summary] Ladedauer $t_L$
> $u_{c}(t)=U_{0}\cdot(1-e^{-\tfrac{t}{\uptau}})$


> [!summary] Entladedauer $t_E$
> $u_{c}(t)=U_{0}\cdot e^{-\tfrac{t}{\uptau}}$

### Entladen

![[herl_te.png]]

 > [!summary] $$t_{E} =\uptau\ln\left(\dfrac{U_T^+}{U_T^-}\right)$$


### Laden
![[Herl_tl.png]]

 > [!summary] $$t_L = \uptau\cdot\ln\left(\dfrac{U_0- U_T^+}{U_0-U_T^-}\right)$$

### $T$ berechnen

![[herl_T.png]]
 > [!summary] $$T = \uptau\ln\left(\frac{U_T^+}{U_T^-}\cdot\dfrac{U_0- U_T^+}{U_0-U_T^-}\right)$$

## Dimensionierung "Invertierenden [[Schmitt Trigger]]" als Taktgenerator
$$
\begin{align*}
&U_{a,min}=0V=U_{B}^{-} && U_{T}^{-}=2V && f =1kHz&&|&&\text{gesucht}\\
&U_{a,max}=15V=U_{B}^{+} && U_{T}^{+}=3V && T=10^{-3}s&&|&&\underbrace{R_{1}, R_{2}}_{U_{V}} , R_{3}, R_{4}\\
\\
\end{align*}
$$
![[invST-calc1.png]]
# Tags