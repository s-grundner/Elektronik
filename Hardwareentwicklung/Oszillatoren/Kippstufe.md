---
tags:
  - Baugruppen/Oszillator
aliases:
  - astabil
  - Kippschaltung
  - astabiler Multivibrator
subject:
  - hwe
source:
  - Siegbert Schrempf
created: 3rd January 2023
---

# Kippstufen

- Taktfrequenz ist stark von Bauteiltoleranzen abhängig.
- Verwendbar bis etwa 1MHz
- Hochwertige Bauteile (Toleranzen, Temperaturdrift) für R und C
- Als Buffer sollte ein weiteres Gatter hinter dem Oszillator nachgeschaltet werden.
- Nachschalten eines T-FF zur Taktsymmetrierung.

> [!WARNING] Kippschaltungen sind durch die Steig-/Fallzeit der Flanken begrenzt (Slew):  
> ![500](../assets/Kippschalter-slew.png)

# Baugruppen

## [BJT](../Halbleiter/Bipolartransistor.md)-Kippstufe

![](assets/Pasted%20image%2020230925152818.png)

$$
\begin{align}
t_{1} & =\ln 2 \cdot R_{2}\cdot C_{1}\\
t_{2} &= \ln 2\cdot R_{3}\cdot C_{2}
\end{align}
$$

## [NE555 als astabile Kippstufe / astabiler Multivibrator](NE555.md#NE555%20als%20astabile%20Kippstufe%20/%20astabiler%20Multivibrator)

## Schmitt Trigger Kippstufe

Die Frequenz wird von durch folgende Parameter beeinflusst:
- RC-Glied im Rückkoppelbereich ($\uptau$);
- Schaltschwellen (Threshhold) des Schmitt Triggers ($U_{T}^{+} / U_{T}^{-}$)

Die [Schmitt Trigger](../Schmitt%20Trigger.md) Kippschaltungen ist eine Astabile Kippstufe

> [!hint] Schaltung  
> ![300](../assets/ST-Kippschalter.png)

| Formeln      |     |
| ------------ | --- |
| Ladedauer    | $t_L = \uptau\cdot\ln\left(\dfrac{U_0U_T^+}{U_0-U_T^-}\right)$    |
| Entladedauer | $t_{E} =\uptau\ln\left(\dfrac{U_T^+}{U_T^-}\right)$    |

### Herleitung

| ![500](../assets/ST-Diag.png) |                                                 | 
| ----------------------------- | ----------------------------------------------- |
| Periodendauer $T$             | $T=(t_{3}-t_{2})+(t_{2}-t_{1})$                 |
| Ladedauer $t_L$               | $u_{c}(t)=U_{0}\cdot(1-e^{-\tfrac{t}{\uptau}})$ |
| Entladedauer $t_E$            | $u_{c}(t)=U_{0}\cdot e^{-\tfrac{t}{\uptau}}$    |

> [!SUMMARY] Entladen
> ![herl_te](../assets/herl_te.png)

> [!SUMMARY] Laden
> ![Herl_tl](../assets/Herl_tl.png)

> [!SUMMARY] $T$ berechnen
> ![herl_T|550](../assets/herl_T.png)

> [!EXAMPLE] Dimensionierung "Invertierenden [Schmitt Trigger](../Schmitt%20Trigger.md)" als Taktgenerator
> $$
> \begin{align*}
> &U_{a,min}=0V=U_{B}^{-} && U_{T}^{-}=2V && f =1kHz&&|&&\text{gesucht}\\
> &U_{a,max}=15V=U_{B}^{+} && U_{T}^{+}=3V && T=10^{-3}s&&|&&\underbrace{R_{1}, R_{2}}_{U_{V}} , R_{3}, R_{4}\\
> \\
> \end{align*}
> $$
> ![invST-calc1](../assets/invST-calc1.png)



# Tags

