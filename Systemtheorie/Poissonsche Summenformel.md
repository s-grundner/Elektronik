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

> [!question] Der Ausgangspunkt ist eine **aperiodeische Zeitfunktion** $f_{a}(t)$ und ihre Fouriertransformierte $F_{a}(j\omega)$.
> 
> **Ideale Abtastung**: Multiplikation von $f_{a}(t)$ mit der Delta-Impulsfolge $\delta_{T}(t)$ um ein zeitdiskretes Signal zu erhalten:
> $$f_{a}(t)\delta_{T}(t)=\sum_{n=-\infty}^{\infty}f_{a}(nT)\delta(t-nT)$$
> 
> **Im Frequenzbereich**: Faltung mit dem Spektrum der Delta-Impulsfolge. *(Aus dem Spektrum $F_{a}(j\omega)$ wird eine $\frac{2\pi}{T}$ Periodische Überlagerung)*
> $$f_{a}(t)\delta(t)\multimap \frac{1}{2\pi}\left[ F_{a}(j\omega)*\omega_{0}\delta_{\omega_{0}}(\omega) \right] = \frac{\omega_{0}}{2\pi}\sum_{k=-\infty}^{\infty} F_{a}(j\omega-jk\omega_{0})\tag{1}$$
>
> ![invert_dark|900](assets/DFT1.png)
> Aus der Korrespondenz $\delta(t-nT)\multimap e^{ -j\omega nT }$ folgt
> 
> $$\sum_{n=-\infty}^{\infty} f_{a}(nT)\delta(t-nT)\multimap \sum_{n=-\infty}^{\infty} f_{a}(nT)e^{ -j\omega nT }\tag{2}$$

Durch gleichsetzen der Beiden Fouriertransformierten in $(1)$ und $(2)$ folgt die Duale Poissonsche Summenformel

> [!def] **D2 - POIS)** Duale Poissonsche Summenformel 
> $$
> F_{\mathrm{d}}\left(e^{\mathrm{j} \omega T}\right)=\frac{1}{T} \sum_{k=-\infty}^{\infty} F_{\mathrm{a}}\left(\mathrm{j} \omega-\mathrm{j} k \omega_0\right)=\sum_{n=-\infty}^{\infty} f_{\mathrm{a}}(n T) e^{-\mathrm{j} \omega n T}
> $$

- $F_{\mathrm{d}}\left(e^{\mathrm{j} \omega T}\right)$ ist die Fourier-Transformierte einer durch ideale Abtastung gewonnenen zeitdiskreten Funktion
- $F_{\mathrm{d}}\left(e^{\mathrm{j} \omega T}\right)$ besitzt eine periodische Frequenzabhängigkeit, die über den Ausdruck $e^{j \omega T}$ gegeben ist $\Rightarrow e^{j \omega T}$ als Argument
- Aussage der dualen Poissonschen Summenformel: Eine mit der Rate $1 / T$ ideal abgetastete aperiodische Funktion $f_{\mathrm{a}}$ besitzt ein periodisches Spektrum. Dieses lässt sich durch eine unendliche Summe von gewichteten komplexen Exponentialfunktionen darstellen, wobei die Gewichtungskoeffizienten die Abtastwerte der Funktion sind.

Die Transformierte $F_{\mathrm{d}}$ ist eine Summenformel aus $e$-Funktionen gewichtet mit den funktionswerten der zeitdiskreten Funktion $f_{\mathrm{a}}(n T)$.

