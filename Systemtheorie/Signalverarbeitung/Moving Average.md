---
tags:
  - Baugruppe/Filter/Digital
aliases:
  - Gleitende Mittelwertbildung
  - Gleitender Mittelwert
keywords: 
subject:
  - VL
  - Signalverarbeitung
semester: SS25
created: 9th April 2025
professor:
  - Mario Huemer
release: false
title: Moving Average
---

# Gleitende Mittelwertbildung

Dieses System berechnet den $n$-ten Abtastwert der Ausgangsfolge aus dem Mittelwert von $x[n],x[n-1], \dots ,x[n-M]$. Es handelt sich um ein [BIBO](Stabilität%20und%20Beschränktheit.md) stabiles und [kausales](Kausalität.md) [LTI-System](../Zeitdiskret/LTI-Systeme.md).

*Ausgangssignal:*

$$y[n] = \frac{1}{M+1}\sum_{k=0}^{M}x[n-k]$$

*Impulsantwort:*

$$h[n] = \frac{1}{M+1}\sum_{k=0}^{M}\delta[n-k] = \begin{cases} \frac{1}{M+1} & \text{für } 0 \leq n < M \\ 0 & \text{sonst} \end{cases}$$

| ![invert_dark](../../_assets/MovingAvgSignal.png) | ![invert_dark](../../_assets/MovingAvgImpulseResponse.png) |
| :-----------------------------------------------: | :--------------------------------------------------------: |
|          Veranschaulichung der Operation          |                       Impulsantwort                        |

- Der rote Mittelwert ist der Ausgang $y[n_{0}]$
- Der blaue Mittelwert ist der Ausgang $y[n_{1}]$

## Code

```c
#define WINDOW_SIZE 4
int movingAverage(int newSample) {
	static int samples[WINDOW_SIZE];
	int i, result = 0;
	
	for(i = WINDOW_SIZE - 1; i>0; i--){
		samples[i] = samples[i-1];
	}
	
	samples[0] = newSample;
	for(i = 0; i < WINDOW_SIZE; i++){
		result = result + samples[i];
	}
	
	result = result / WINDOW_SIZE;
	return result;
}
```