---
tags: 
aliases:
  - Cardic
keywords: 
subject:
  - VL
  - Signalverarbeitung
semester: SS25
created: 2nd April 2025
professor: 
release: false
title: Digitaler Filter
---

# Digitale Filter

> [!question] [Filter](Filter.md)

---

## Lineare Digitalfilter

> [!hint] Stabile und kausale [Zeitdiskrete LTI-Systeme](Zeitdiskrete%20LTI-Systeme.md),
> welche sich durch rationale Überrtagungsfunktionen mit reellen Koeffizienten beschreiben lassen, spielen dabei die wichtigste rolle $\to$ **lineare Digitalfilter**

Also Filter mit einer Übertragungsfunktion der Form

$$
H(z) = \frac{b_{0} + b_{1}z^{-1} + b_{2}z^{-2} + \cdots + b_{N}z^{-N}}{1 + a_{1}z^{-1} + a_{2}z^{-2} + \cdots + a_{M}z^{-M}}
$$

Sind alle Koeffizienten $a_{i}=0$, so handelt es sich um ein FIR- / nicht rekursives System, mit 

$$ H(z) = b_{0} + b_{1}z^{-1} + \cdots + b_{N}z^{-N} $$

> [!question] Ziel:
> Aufgabe des Filterentwurfs ist es, die **Ordnung** und die **Koeffizienten** der Filterübertragungsfunktion zu einem *vorgegebenen Zielfrequenzgang* zu bestimmen.

Die Verzögerung eines LTI-Systems wird durch die [Gruppenlaufzeit](zeitdiskrete%20Gruppenlaufzeit.md#^GRLZ) charakterisiert.

### Filterentwurf

- [FIR-Filter](FIR-Filter.md)
- [[IIR-Filter]]

## Adaptive Filter

- Verändern ihre eigenschaften über Zeit. Werden an die Samples angepasst. **Zeitvariantes System**

![invert_dark|600](assets/Pasted%20image%2020250305101059.png)
    
- $s[k]$ = nutzsignal
- $x'[k]$ = rauschsignal
- $y[k]$ = überlagertes signal

Cardic: Algorithmus zur auswertung von Elementarsignale (iterativ: nur durch addition und multiplikation)