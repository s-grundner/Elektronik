
# Single Gaussian Classifier

> [!question] [Classifier](Classification.md)

---

> [!def] **D)** The Single-Gaussian Bayes Classifier
> 
> **Given:**
> 
> - Training set $\mathcal{D}=\left\{\left(\boldsymbol{x}_i, y_i\right)\right\}$ with $\boldsymbol{x}_i \in \boldsymbol{X}$ and class labels $y_i \in \Omega=\left\{\omega_j\right\}$
> - Loss function $\lambda$ (might be the zero-one loss).
> 
> **Learning Algorithm:**
> 
> - Estimate prior class probabilities $P\left(\omega_i\right)$ from $\mathcal{D}$ via counting (relative frequencies)
> - Assume instances follow a *joint* normal distribution within each class $\omega_j$
> - For each class $\omega_j$, estimate the parameters of the distribution $p\left(\boldsymbol{x} \mid \omega_j\right)$ using [Maximum Likelihood](Density%20Estimation.md) as
> 
> $$
> \hat{\boldsymbol{\mu}}_j=\frac{1}{M} \sum_{\boldsymbol{x}_i \in \omega_j} \boldsymbol{x}_i \quad \hat{\boldsymbol{\Sigma}}_j=\frac{1}{M} \sum_i\left(\boldsymbol{x}_i-\hat{\boldsymbol{\mu}}_j\right)\left(\boldsymbol{x}_i-\hat{\boldsymbol{\mu}}_j\right)^T
> $$
> 
> 
> **Classification of a new instance $\boldsymbol{x}$ :**
> 
> $$
> \omega^*=\arg \min _j R_\lambda\left(\alpha_j \mid \boldsymbol{x}\right)
> $$
> where
> $$
> P\left(\omega_k \mid \boldsymbol{x}\right)=\frac{p\left(\boldsymbol{x} \mid \boldsymbol{\mu}_k, \boldsymbol{\Sigma}_k\right) P\left(\omega_k\right)}{p(\boldsymbol{x})}
> $$

- Minimierung des Bedingten Risiko: [Bayesian Decision Theory](Bayesian%20Decision%20Theory.md)

Problem: Für den Single Gaussian Classifier muss man über alle Features die *gemeinsame* (joint) Verteilung mit [Maximum Likelihood](Density%20Estimation.md) schätzen.

- Aufwändiger Prozess mit vielen Parametern
- Einfachere Variante: [Naive Bayes Classifier](Naive%20Bayes%20Classifier.md)