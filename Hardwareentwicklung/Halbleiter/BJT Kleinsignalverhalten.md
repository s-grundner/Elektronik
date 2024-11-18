---
tags: 
aliases:
  - Kleinsignalverhalten
  - KSESB
keywords: 
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 18. November 2024
professor:
---
 
# Kleinsignalverhalten von BJT

Beim Kleinsignalverhalten von BJT wird die Transistorgleichung am Arbeitspunkt linearisiert.

![](assets/Pasted%20image%2020241118022427.png)


![](assets/Pasted%20image%2020241118024435.png)

![](assets/Pasted%20image%2020241118024512.png)

$$
\begin{aligned}
\left.\frac{\partial I_{\mathrm{B}}}{\partial U_{\mathrm{BE}}}\right|_{\mathrm{AP}}=\frac{1}{r_{\mathrm{BE}}} \approx \frac{\Delta I_{\mathrm{B}}}{\Delta U_{\mathrm{BE}}}
\end{aligned}
\qquad
\begin{aligned}
\left.\frac{\partial I_{\mathrm{C}}}{\partial U_{\mathrm{BE}}}\right|_{\mathrm{AP}}=S \approx \frac{\Delta I_{\mathrm{C}}}{\Delta U_{\mathrm{BE}}}
\end{aligned}
\qquad
\begin{aligned}
\left.\frac{\partial I_{\mathrm{C}}}{\partial U_{\mathrm{CE}}}\right|_{\mathrm{AP}}=g_{\mathrm{EA}} \approx \frac{\Delta I_{\mathrm{C}}}{\Delta U_{\mathrm{CE}}}
\end{aligned}
$$

Diese Kleinsignal-Größen heißen:

$r_{B E}\dots$ Basis-Emitter-Kleinsignalwiderstand in $\Omega$
$S\dots$ Steilheit in S (Siemens)
$g_{E A}\dots$ Early-Leitwert in S

Die Kleinsignal-Stromverstärkung $\beta=\frac{\partial I_C}{\partial I_B}$ ist wegen der fast linearen Stromsteuerkennlinie näherungsweise gleich der Gleichstromverstärkung $\beta \approx B$. In Datenblättern wird $B$ oft $h_{21}$ oder $h_{F E}$ genannt. Dabei bedeutet $h$ Element der Hybridmatrix, $F$ Betrieb in Vorwärtsrichtung (forward) und E Emitterschaltung (eine der Grundschaltungen, wird später erklärt). Die Kleinsignalspannungen und -ströme werden im Folgenden klein geschrieben

$$
\Delta U_{\mathrm{BE}}=u_{\mathrm{BE}} \quad \Delta I_{\mathrm{B}}=i_{\mathrm{B}} \quad \Delta U_{\mathrm{CE}}=u_{\mathrm{CE}} \quad \Delta I_{\mathrm{C}}=i_{\mathrm{C}}
$$

und werden durch folgende Zusammenhänge im KSESB miteinander verknüpft:

$$
u_{\mathrm{BE}}=r_{\mathrm{BE}} i_{\mathrm{B}} \quad i_{\mathrm{C}}^{\prime} \approx S u_{\mathrm{BE}}=\beta i_{\mathrm{B}} \quad i_{\mathrm{C}}^{\prime \prime}=g_{\mathrm{EA}} u_{\mathrm{CE}} \quad i_{\mathrm{C}}=i_{\mathrm{C}}^{\prime}+i_{\mathrm{C}}^{\prime \prime} \quad i_{\mathrm{E}}=i_{\mathrm{B}}+i_{\mathrm{C}}
$$