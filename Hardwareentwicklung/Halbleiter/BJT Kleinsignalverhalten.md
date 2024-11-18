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

## Eingangskennnlinie

![400](assets/Pasted%20image%2020241118022635.png)

$$
\begin{array}

\end{array}

\begin{aligned}[c]
\left.\frac{\partial I_{\mathrm{B}}}{\partial U_{\mathrm{BE}}}\right|_{\mathrm{AP}}&=\frac{1}{r_{\mathrm{BE}}} \approx \frac{\Delta I_{\mathrm{B}}}{\Delta U_{\mathrm{BE}}} \\ \\

\Rightarrow r_{\mathrm{BE}} & =\left.\frac{\partial U_{\mathrm{BE}}}{\partial I_{\mathrm{B}}}\right|_{\mathrm{AP}} \\
& =\underbrace{\left.\frac{\partial U_{\mathrm{BE}}}{\partial I_{\mathrm{C}}}\right|_{\mathrm{AP}}}_{\frac{1}{S}} \cdot\underbrace{\left.\frac{\partial I_{\mathrm{C}}}{\partial I_{\mathrm{B}}}\right|_{\mathrm{AP}}}_{\approx B}
\\ \\
&\boxed{ r_{\mathrm{BE}}\approx\frac{B}{S}}
\end{aligned}

\begin{aligned}[c]
\left.\frac{\partial I_{\mathrm{C}}}{\partial U_{\mathrm{CE}}}\right|_{\mathrm{AP}} & =g_{\mathrm{EA}} \approx \frac{\Delta I_{\mathrm{C}}}{\Delta U_{\mathrm{CE}}} \\
& =\frac{I_{\mathrm{C}, 0}}{U_{\mathrm{CE}, 0}+U_{\mathrm{EA}}}
\\ \\
&\boxed{g_{\mathrm{EA}}\approx\frac{I_{\mathrm{C}, 0}}{U_{\mathrm{CE}, 0}+U_{\mathrm{EA}}}}
\end{aligned}
$$

## Transferkennlinie

![400](assets/Pasted%20image%2020241118022652.png)

$$
\begin{aligned}
\left.\frac{\partial I_{\mathrm{C}}}{\partial U_{\mathrm{BE}}}\right|_{\mathrm{AP}} & =S \approx \frac{\Delta I_{\mathrm{C}}}{\Delta U_{\mathrm{BE}}} \\
& =\frac{1}{U_{\mathrm{T}}} \underbrace{I_{\mathrm{S}} e^{\frac{U_{\mathrm{BE}, 0}}{U_{\mathrm{T}}}}}_{\approx I_{\mathrm{C}, 0}} \approx \frac{I_{\mathrm{C}, 0}}{U_{\mathrm{T}}}
\end{aligned}
$$

$$
\boxed{S\approx\frac{I_{\mathrm{C}, 0}}{U_{\mathrm{T}}}}
$$

## Ausgangskennlinie

![400](assets/Pasted%20image%2020241118022711.png)


$$

$$
