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
> ![500](hwe/assets/Kippschalter-slew.png)

# [Schmitt Trigger](hwe/Schmitt%20Trigger.md) Kippschaltung
Die Frequenz wird von durch folgende Parameter beeinflusst:
- RC-Glied im Rückkoppelbereich ($\uptau$);
- Schaltschwellen (Threshhold) des Schmitt Triggers ($U_{T}^{+} / U_{T}^{-}$)

Die [Schmitt Trigger](hwe/Schmitt%20Trigger.md) Kippschaltungen ist eine Astabile Kippstufe

> [!hint] Schaltung
> ![300](hwe/assets/ST-Kippschalter.png)

## Herleitung
![500](hwe/assets/ST-Diag.png)
> [!summary] Periodendauer $T$
> $T=(t_{3}-t_{2})+(t_{2}-t_{1})$
 

> [!summary] Ladedauer $t_L$
> $u_{c}(t)=U_{0}\cdot(1-e^{-\tfrac{t}{\uptau}})$


> [!summary] Entladedauer $t_E$
> $u_{c}(t)=U_{0}\cdot e^{-\tfrac{t}{\uptau}}$

### Entladen

![herl_te](hwe/assets/herl_te.png)

 > [!summary] $$t_{E} =\uptau\ln\left(\dfrac{U_T^+}{U_T^-}\right)$$


### Laden
![Herl_tl](hwe/assets/Herl_tl.png)

 > [!summary] $$t_L = \uptau\cdot\ln\left(\dfrac{U_0- U_T^+}{U_0-U_T^-}\right)$$

### $T$ berechnen

![herl_T](hwe/assets/herl_T.png)
 > [!summary] $$T = \uptau\ln\left(\frac{U_T^+}{U_T^-}\cdot\dfrac{U_0- U_T^+}{U_0-U_T^-}\right)$$

## Dimensionierung "Invertierenden [Schmitt Trigger](hwe/Schmitt%20Trigger.md)" als Taktgenerator
$$
\begin{align*}
&U_{a,min}=0V=U_{B}^{-} && U_{T}^{-}=2V && f =1kHz&&|&&\text{gesucht}\\
&U_{a,max}=15V=U_{B}^{+} && U_{T}^{+}=3V && T=10^{-3}s&&|&&\underbrace{R_{1}, R_{2}}_{U_{V}} , R_{3}, R_{4}\\
\\
\end{align*}
$$
![invST-calc1](hwe/assets/invST-calc1.png)
# Tags