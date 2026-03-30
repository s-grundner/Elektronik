---
tags: []
aliases:
created: 9th January 2024
title: Y-Diagramm
---

# Y-Diagramm

![invert_dark|700](../_assets/Pasted%20image%2020260325150550.png)

## Systemebene

> [!question] [Systemtheorie](../Systemtheorie/index.md)

Funktionale Einheiten, die miteinander kommunizieren.

![invert_dark|500](../_assets/Pasted%20image%2020260325151619.png)

## Algorithmus Ebene

> [!question] [Algorithmus](../Softwareentwicklung/DSA/Algorithmen/index.md)

Die Funktionen einzelner Blöcke werden durch Algorithmen in einer Hardware- oder System- Beschreibungssprache modelliert

```c
int dgl(int x, int y, int u, int dx, int a) {
	int x1, y1, u1;
	do {
		x1 = x + dx;
		u1 = u - 3*x*u*dx - 3*y*dx;
		y1 = y + u*dx;
		x = x1; u = u1; y = y1;
	} while (x1 <= a);
	return y;
}
```

## Register Transfer Ebene

> [!question] [Hardwarebeschreibungssprache](HDL/Hardwarebeschreibungssprache.md)

Darstellung der Funktionalen Einheiten durch Datenpfad- und Kontrollpfad (Daten werden von Register zu Register transferiert und verarbeitet

![invert_dark|500](../_assets/Pasted%20image%2020260325152003.png)

## Logik Ebene

Schaltung wird durch Boolesche Signale, Boolesche Gatter, und Flipflops modelliert.

![invert_dark|600](../_assets/Pasted%20image%2020260325152342.png)

## Transistor Ebene

Realisierung Boolescher Elemente durch Transistoren

![invert_dark|400](../_assets/Pasted%20image%2020260325152458.png)

## Layout Ebene

Realisierung von Transistoren durch dotierte Bereiche und isolierende Schichten auf dem IC

![invert_dark|500](../_assets/Pasted%20image%2020260325152614.png)