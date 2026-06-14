---
tags:
aliases:
subject:
  - VL
  - Machine Learning and Pattern Classification
semester: SS26
created: 13th June 2026
professor:
release: false
title: Naive Bayes Classifier
---

# Naive Bayes Classifier

> [!question] [Classifier](Classification.md)

---

>[!success] Annahme: Features sind unabhängig verteilt:
> Gemeinsame Verteilung wird zum Produkt aller einzelnen verteilung.
> 
> - [Multiplikationsregel](Unbedingte%20Wahrscheinlichkeit.md#Multiplikationsregel)
> - [Bedingte Verteilungsdichte](Wahrscheinlichkeitsverteilungsdichte.md#Bedingte%20Verteilungsdichte)



Die Kovarianzmatrix ist nun eine Diagonalmatrix mit nur noch den Varianzen auf der Diagonalen

Reduktion von $d\times d$ auf $d$ ML-Schätzungsparameter

> [!def] **D)** Naive Bayes Classifier
> 
> **Given:**
> 
> - Training set $\mathcal{D}=\left\{\left(\boldsymbol{x}_i, y_i\right)\right\}$ with $\boldsymbol{x}_i \in \boldsymbol{X}$ and $y_i \in \Omega=\left\{\omega_k\right\}$
> - Loss function $\lambda$ (might be the zero-one loss).
> 
> **Learning Algorithm:**
> - Assume that in each class $\omega_k$, all individual features are pairwise independent
> - For each class $\omega_k$ and each feature $j$, estimate the parameters of the single feature distribution $p\left(x_j \mid \omega_k\right)$ via [Maximum Likelihood](Density%20Estimation.md).
> 
> **Classification of a new instance $\boldsymbol{x}$ :**
> 
> $$
> \omega^*=\arg \min _i R_\lambda\left(\alpha_i \mid \boldsymbol{x}\right)
> $$
> where
> $$
> P\left(\omega_k \mid \boldsymbol{x}\right)=\frac{P\left(\omega_k\right) \prod_i p\left(x_i \mid \omega_k\right)}{p(\boldsymbol{x})}
> $$

- Minimierung des Bedingten Risiko: [Bayesian Decision Theory](Bayesian%20Decision%20Theory.md)