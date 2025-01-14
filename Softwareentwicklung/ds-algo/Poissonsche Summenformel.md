---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Signale und Systeme
semester: WS24
created: 7. Januar 2025
professor:
---
 
# Poissonsche Summenformel

$$
\sum_{n=-\infty}^{\infty} f(t-n T)=\frac{1}{T} \sum_{k=-\infty}^{\infty} F\left(\mathrm{j} k \omega_0\right) e^{\mathrm{j} k \omega_0 t}
$$

- Eine $T$-periodische Funktion $f_T(t)$ kann durch eine unendliche Summe von komplexen Exponentialfunktionen mit den Frequenzen $k \omega_0$ dargestellt werden, wobei gilt: $\omega_0=2 \pi / T$.
- Komplexe Fourier-Reihe: Anwendung der Poissonschen Summenformel auf die periodische Funktion $f_T(t)$ :

$$
f_T(t)=\sum_{k=-\infty}^{\infty} F_k \mathrm{e}^{\mathrm{j} k \omega_0 t}
$$

mit den Fourier-Koeffizienten

$$
F_k=\frac{1}{T} F\left(\mathrm{j} k \omega_0\right)
$$
## Duale Poissonsche Summenformel

$$
F_{\mathrm{d}}\left(e^{\mathrm{j} \omega T}\right)=\frac{1}{T} \sum_{k=-\infty}^{\infty} F_{\mathrm{a}}\left(\mathrm{j} \omega-\mathrm{j} k \omega_0\right)=\sum_{n=-\infty}^{\infty} f_{\mathrm{a}}(n T) e^{-\mathrm{j} \omega n T}
$$

- $F_{\mathrm{d}}\left(e^{\mathrm{j} \omega T}\right)$ ist die Fourier-Transformierte einer durch ideale Abtastung gewonnenen zeitdiskreten Funktion
- $F_{\mathrm{d}}\left(e^{\mathrm{j} \omega T}\right)$ besitzt eine periodische Frequenzabhängigkeit, die über den Ausdruck $e^{j \omega T}$ gegeben ist $\Rightarrow e^{j \omega T}$ als Argument
- Aussage der dualen Poissonschen Summenformel: Eine mit der Rate $1 / T$ ideal abgetastete aperiodische Funktion $f_{\mathrm{a}}$ besitzt ein periodisches Spektrum. Dieses lässt sich durch eine unendliche Summe von gewichteten komplexen Exponentialfunktionen darstellen, wobei die Gewichtungskoeffizienten die Abtastwerte der Funktion sind.

Die Transformierte $F_{\mathrm{d}}$ ist eine Summenformel aus $e$-Funktionen gewichtet mit den funktionswerten der zeitdiskreten Funktion $f_{\mathrm{a}}(n T)$.

