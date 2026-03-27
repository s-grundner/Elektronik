---
tags:
  - Systeme/Zeitdiskret
aliases:
subject:
  - VL
  - Regelungstechnik
semester: SS26
created: 27th March 2026
professor:
release: false
title: Jordannormalform
---

# Jordannormalform

Für den Zietdiskreten Fall ist die Vorgehensweise zur [Jordannormalform](../../Mathematik/Algebra/Jordannormalform.md) weigehend gleich wie für Zeitkontinuierliche Systeme

### Fall 1: Einfache Eigenwerte

Für das System 

$$
\mathbf{z}_{k+1}=\lambda_i \mathbf{I} \mathbf{z}_k
$$

mit $\operatorname{dim}(\mathbf{z})=l$ folgt:

Das charakteristische Polynom ist $p(\lambda)=\left(\lambda-\lambda_i\right)^l$. Es gilt $k_i^a=k_i^g=l$. Die Lösung des Systems für den Anfangswert $\mathbf{z}(0)=\mathbf{z}_0$ lautet

$$
\mathbf{z}_k=\lambda_i^k \mathbf{z}_0 .
$$

### Fall 2: Vielfache Eigenwerte

Für das System

$$
\mathbf{z}_{k+1}=\left[\begin{array}{ccccc}
\lambda_i & 1 & 0 & \ldots & 0 \\
0 & \lambda_i & 1 & \ldots & 0 \\
\vdots & \vdots & \ddots & \ddots & \vdots \\
0 & 0 & \ldots & \lambda_i & 1 \\
0 & 0 & \ldots & 0 & \lambda_i
\end{array}\right] \mathbf{z}_k
$$

mit $\operatorname{dim}(\mathbf{z})=l$ folgt: Das charakteristische Polynom ist $p(\lambda)=\left(\lambda-\lambda_i\right)^l$. Es gilt $k_i^a=l, k_i^g=1$. Die Lösung des Systems für den Anfangswert $\mathbf{z}(0)=\mathbf{z}_0$ lautet

$$
\mathbf{z}_k=\left[\begin{array}{ccccc}
\lambda_i^k & \binom{k}{1} \lambda_i^{k-1} & \binom{k}{2} \lambda_i^{k-2} & \ldots & \binom{k}{l-1} \lambda_i^{k-l+1} \\
0 & \lambda_i^k & \binom{k}{1} \lambda_i^{k-1} & \ldots & \binom{k}{l-2} \lambda_i^{k-l+2} \\
\vdots & \vdots & \ddots & \ddots & \vdots \\
0 & 0 & \ldots & \lambda_i^k & \binom{k}{1} \lambda_i^{k-1} \\
0 & 0 & \ldots & 0 & \lambda_i^k
\end{array}\right] \mathbf{z}_0,
$$

wobei man $\binom{k}{l} \lambda_i^{k-l}=0$ für $k<l$ setzt.

### Konjugiert Komplexe Eigenwerten

Für das System

$$
\mathbf{z}_{k+1}=\left[\begin{array}{cc}
\alpha_i & \beta_i \\
-\beta_i & \alpha_i
\end{array}\right] \mathbf{z}_k
$$

mit $\operatorname{dim}(\mathbf{z})=2$ folgt: Das charakteristische Polynom ist $p(\lambda)=\left(\lambda-\alpha_i\right)^2+\beta_i{ }^2$. Es gilt $k_i^a=k_i^g=1$ für die Eigenwerte $\lambda_{i, 1}=\alpha_i+\mathrm{j} \beta_i, \lambda_{i, 2}=\alpha_i-\mathrm{j} \beta_i$. Die Lösung des Systems für den Anfangswert $\mathbf{z}(0)=\mathbf{z}_0$ lautet

$$
\mathbf{z}_k=r^k\left[\begin{array}{rr}
\cos (k \phi) & \sin (k \phi) \\
-\sin (k \phi) & \cos (k \phi)
\end{array}\right] \mathbf{z}_0
$$

mit

$$
r=\sqrt{\alpha_i^2+\beta_i^2} \quad \text { und } \quad \phi=\arg \left(\alpha_i+\mathrm{j} \beta_i\right) .
$$


Auch mehrfache komplexe Eigenwerte können analog behandelt werden. Beispielhaft betrachte man das System

$$
\mathbf{z}_{k+1}=\left[\begin{array}{rcrr}
\alpha_i & \beta_i & 1 & 0 \\
-\beta_i & \alpha_i & 0 & 1 \\
0 & 0 & \alpha_i & \beta_i \\
0 & 0 & -\beta_i & \alpha_i
\end{array}\right] \mathbf{z}_k,
$$

dessen Transitionsmatrix durch

$$
\boldsymbol{\Phi}(k)=r^k\left[\begin{array}{cc}
{\left[\begin{array}{rr}
\cos (k \phi) & \sin (k \phi) \\
-\sin (k \phi) & \cos (k \phi)
\end{array}\right]} & \frac{k}{r}\left[\begin{array}{rr}
\cos ((k-1) \phi) & \sin ((k-1) \phi) \\
-\sin ((k-1) \phi) & \cos ((k-1) \phi)
\end{array}\right] \\
{\left[\begin{array}{ll}
0 & 0 \\
0 & 0
\end{array}\right]} & {\left[\begin{array}{rr}
\cos (k \phi) & \sin (k \phi) \\
-\sin (k \phi) & \cos (k \phi)
\end{array}\right]}
\end{array}\right]
$$

gegeben ist.