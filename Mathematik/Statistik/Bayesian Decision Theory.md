---
tags:
aliases:
  - MAP
  - Maximum a-Posteriori
subject:
  - VL
  - Machine Learning and Pattern Classification
semester: SS26
created: 10th June 2026
professor:
  - Gerhard Widmer
release: false
title: Bayesian Decision Theory
---

# Bayesian Decision Theory

> [!info] Übersicht
> 
> - Basics: Wahrscheinlichkeiten, PDF
> - Bayes Rule use in classification
> - Classification Taks is a **Cost minimzation** problem
> - Bayes Decision leads to optimal classification
> - Relation between Bayesian classification and decision Boundaries


## Klassifizierungsproblem mit Probabilistischer Herangehensweise

> [!question] [Klassifizierungsproblem](../../../Mathematik/Statistik/Classification.md), [Wahrscheinlichkeitstheorie Basics](../../../Mathematik/Statistik/index.md)

![invert_dark](assets/{NOTES}%20Machine%20Learning%20and%20Pattern%20Classification%20VL%202026-06-10%2011.42.44.excalidraw.svg)
%%[🖋 Edit in Excalidraw](assets/{NOTES}%20Machine%20Learning%20and%20Pattern%20Classification%20VL%202026-06-10%2011.42.44.excalidraw.md)%%

## Einfache Entscheidung: Maximum a-Posteriori (MAP)

- Das aus dem Bayesschen verfahren gewonne **Likelihood** muss in eine diskrete *Entscheidung* umgewandelt werden
- Es entsteht eine gewisse wahrscheinlichkeit, dass diese Entscheidung falsch ist

![invert_dark|800](../../../_assets/%7BNOTES%7D%20Machine%20Learning%20and%20Pattern%20Classification%20VL%202026-06-10%2021.57.58.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../../../_assets/%7BNOTES%7D%20Machine%20Learning%20and%20Pattern%20Classification%20VL%202026-06-10%2021.57.58.excalidraw.md)%%

## Allgemeiner Fall 

- Beliebige Anzahl an Klassen
- **loss function** um die entscheidungen zu gewichten
- Erlaube belibige *actions* nicht nur *predictions* (z.B: auch die ablehnung einer auswahl)

![invert_dark](../../../_assets/Excalidraw/%7BNOTES%7D%20Machine%20Learning%20and%20Pattern%20Classification%20VL%202026-06-12%2011.25.30.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../../../_assets/Excalidraw/%7BNOTES%7D%20Machine%20Learning%20and%20Pattern%20Classification%20VL%202026-06-12%2011.25.30.excalidraw.md)%%

## Von Wahrscheinlichkeiten zu Decision Boundaries

> [!example] Beispiel mit 2 Klassen
> 
> - Aktionen: $\alpha_{j} \equiv \text{Predict }\omega_{j}$
> 
> $$
> \boldsymbol{r} = \boldsymbol{\Lambda p} \iff \begin{align}
> R(\alpha_{1}|\boldsymbol{x}) = \lambda_{11}P(\omega_{1}|\boldsymbol{x}) + \lambda_{12}P(\omega_{2}|\boldsymbol{x}) \\
> R(\alpha_{2}|\boldsymbol{x}) = \lambda_{21}P(\omega_{1}|\boldsymbol{x}) + \lambda_{22}P(\omega_{2}|\boldsymbol{x}) \\
> \end{align}
> $$
> 
> - Auswahlkriterium: $\text{Choose } \alpha^{*} = \arg\min \boldsymbol{r}$
> - Wähle $\alpha_{1}$ wenn:
> 
> $$
> \begin{align}
> R(\alpha_{1}|\boldsymbol{x}) &< R(\alpha_{2}|\boldsymbol{x}) \\
> \lambda_{11}P(\omega_{1}|\boldsymbol{x}) + \lambda_{12}P(\omega_{2}|\boldsymbol{x}) &<  \lambda_{21}P(\omega_{1}|\boldsymbol{x}) + \lambda_{22}P(\omega_{2}|\boldsymbol{x}) \\
> (\lambda_{11} - \lambda_{21})P(\omega_{1}|\boldsymbol{x}) &< (\lambda_{22} - \lambda_{12})P(\omega_{2}|\boldsymbol{x}) \\
> \end{align}
> $$
> 
> - Erinnerung: Aus Bayes $\implies P(\omega_{i}|\boldsymbol{x}) = p(\boldsymbol{x}|\omega_{i})P(\omega_{i}) \frac{1}{p(\boldsymbol{x})}$  ($p(\boldsymbol{x})$ kürzt sich)
> 
> $$
> \begin{align}
> (\lambda_{11} - \lambda_{21})\cdot p(\boldsymbol{x}|\omega_{1})P(\omega_{1}) &< (\lambda_{22} - \lambda_{12})\cdot p(\boldsymbol{x}|\omega_{2})P(\omega_{2}) \\
> \end{align}
> $$


Schlussendlich:
![invert_dark](../../_assets/Excalidraw/Bayesian%20Decision%20Theory%202026-06-12%2016.34.38.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../../_assets/Excalidraw/Bayesian%20Decision%20Theory%202026-06-12%2016.34.38.excalidraw.md)%%


## Zusammenfassung

- decision / classification as a probabilistic inference task
- Bayes’ Rule and its components (prior, posterior, and likelihoods = class-conditional probabilities) loss (cost) and risk
- the optimal Bayes decision rule
- special case: minimum error classification
- likelihood ratios, decision regions, and decision boundaries
- that in (few) special cases, the decision boundaries can be analytically computed (in particular, when the class-conditional densities are Gaussian)

... and that Bayesian classification would be optimal if we knew the true underlying probabilities ...