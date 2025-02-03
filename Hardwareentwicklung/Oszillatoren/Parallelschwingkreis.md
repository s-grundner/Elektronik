---
tags:
  - Baugruppe/Oszillator
aliases: 
keywords: 
subject:
  - VL
  - Elektrotechnik
semester: SS24
created: 8. April 2024
professor: 
cited:
---
 

# Parallelschwingkreis

Beispiel nicht elementarer SK:

technischer Parallelschwingkreis


![invert_dark](ParallelSK.png)


Admittanz 

$$
\begin{aligned}
\underline{Y} & =\frac{1}{R_P}+\mathrm{j} \omega C+\frac{1}{R_L+\mathrm{j} \omega L} \\
& =\frac{1}{R_P}+\frac{R_L}{R_L^2+(\omega L)^2}+\mathrm{j}\left(\omega C-\frac{\omega L}{R_L^2+(\omega L)^2}\right)
\end{aligned}
$$

Daraus lässt sich mit $\operatorname{Im}\left(\underline{Y}\left(\omega_{\mathrm{r}}\right)\right)=0$ die Resonanzfrequenz berechnen
$$
\omega_{\mathrm{r}}=\frac{1}{\sqrt{L C}} \sqrt{1-\frac{R_L^2 C}{L}}
$$

![[assets/Parallelschwingkreis 2025-01-14 10.49.42.excalidraw]]