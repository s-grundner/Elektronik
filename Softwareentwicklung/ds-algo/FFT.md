---
tags:
  - Algorithmus
aliases:
  - Fast Fourier Transform
created: 26. Dezember 2023
source:
  - Laurenz Hölzl
  - Daniel Ch. v. Grüningen
---


# Fast Fourier Transform

> [!INFO] Trivia
> Die [Fourier Transformation](../../Mathe/mathe%20(4)/Fourier%20Transformation.md) ist eine Integraltransformation, welche 1822 von Jean Baptiste Fourier eingeführt wurde und genutzt wird, um das dis-krete Frequenzspektrum aperiodischer Signale zu ermitteln.
> Ihr gegenüber steht die [Fourier Reihe](../../Mathe/mathe%20(4)/Fourier%20Reihe.md), mit welcher sich das Spektrum periodischer [Funktionen](../../Mathe/Abbild.md) berechnen lässt.
> Sie ist in vielen Bereichen von Wissenschaft und Technik unerlässlich. Vor allem bei der Datenkomprimierung spielt sie eine große Rolle. Um sie von einem Computer ausführen zu lassen gibt es die [Diskrete Fourier Transformation](DFT.md) ([[DFT]]) und die Schnelle Fourier Transformation (FFT).

> [!HINT] FFT <=> [DFT](DFT.md)
> Eigentlich handelt es sich beim FFT-Algorithmus nur um eine Möglichkeit die [DFT](DFT.md) mit hoher Geschwindigkeit durchzuführen. James Cooley und John W. Tukey wiederentdeckten ihn im Jahr 1965.
> Wiederentdeckung deshalb, weil Carl Friedrich Gauß den Algorithmus in seiner ersten Form bereits 1805 entdeckte und verwendete, diese aber nie publizierte.
> Erst die durch diesen Algorithmus erreichte hohe Durchführungsgeschwindigkeit ermöglicht eine so breit gefächerte Anwendung.


![](assets/Pasted%20image%2020231227003845.png)