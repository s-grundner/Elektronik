---
tags:
  - Algebra
aliases:
  - Binär
keywords: 
subject:
  - VL
  - Technische Informatik
semester: WS23
created: 15th May 2025
professor:
  - Timm Ostermann
draft: true
title: Dualsystem
release: false
---

# Dualsystem

## Darstellung negativer Zahlen

1. Signed Magnitude
2. Komplement Darstellung
	1. Einser- / r-1-Komplement
	2. Zweiter- / r-2-Komplement

### Signed Magnitude

> [!def] Vorzeichen-Wert System Darstellung / Signed Magnitude
> $$N=(s,a_{n-1}a_{n-2}\dots a_{1}a_{0},a_{-1}a_{-2}\dots a_{-m})_{r}$$

### Komplement Darstellung  

- 2er Komplement schwieriger zu bilden aber leichter zu rechnen (einfach Übertrag entfernen).
- 1er Komplement leichter zu bilden, schwieriger zu rechnen

| Dezmial | 2er Komplement | 1er Komplement  | Signed-Magnitude |
| ------- | -------------- | --------------- | ---------------- |
| $-8$    | $1000$         | -               | -                |
| $-7$    | $1001$         | $1000$          | $1111$           |
| $-6$    | $1010$         | $1001$          | $1110$           |
| $-5$    | $1011$         | $1010$          | $1101$           |
| $-4$    | $1100$         | $1011$          | $1100$           |
| $-3$    | $1101$         | $1100$          | $1011$           |
| $-2$    | $1110$         | $1101$          | $1010$           |
| $-1$    | $1111$         | $1110$          | $1001$           |
| $0$     | $0000$         | $0000$ / $1111$ | $0000$ / $1111$  |
| $1$     | $0001$         | $0001$          | $0001$           |
| $1$     | $0010$         | $0010$          | $0010$           |
| $3$     | $0011$         | $0011$          | $0011$           |
| $4$     | $0100$         | $0100$          | $0100$           |
| $5$     | $0101$         | $0101$          | $0101$           |
| $6$     | $0110$         | $0110$          | $0110$           |
| $7$     | $0111$         | $0111$          | $0111$           |

#### 1er/r-1 Komplement (1K)

> [!def] **1K)** 1er Komplement
> $$\overline{N_{r-1}}=r^{n}-1-N_{r}$$

> [!INFO] Jede $1$ zu $0$, jede $0$ zur $1$

#### 2er/r Komplement (2K)

> [!def] **2K)** 2er-Komplement
> $$\overline{N_{r}}=r^{n}-N_{r}$$

> [!INFO] Jede $1$ zu $0$, jede $0$ zur $1$ UND $+1$

>[!EXAMPLE] $9.5_{10}-4_{10}$
>
> $$
> \begin{align}
> 9.5_{10} &\hat{=} 1001.1_{2} \\ \\
> 4_{10} &\hat{=}0100_{2} \\
> &\downarrow \\
> r-1:-4_{10}&\hat{=}1011_{1K} \\
> &\downarrow \\
> r: -4_{10}&\hat{=}1100_{2K} \\ \\
> &1001.1 \\
> +&\underline{1100} \\
1&0101.1 \hat{=} 5.5
> \end{align}
> $$


## Rechnen im Dualsystem
### Add & Shift 

![invert_dark](assets/addShift.png)



