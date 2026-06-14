---
tags:
aliases:
  - Maximum Likelihood
subject:
  - VL
  - Machine Learning and Pattern Classification
semester: SS26
created: 12th June 2026
professor:
release: false
title: Density Estimation
---

# Density Estimation

- Discuss how to estimate (learn) the probabilities for a Bayesian classifier
- Introduce the concept of the likelihood of a model
- Discuss two approaches to probability (density) estimation: parametric and non-parametric
- Derive our first practical machine learning algorithms from this: two machine learning "classics"

> [!question] Ausgangspunkt: [Bayesian Decision Theory](Bayesian%20Decision%20Theory.md)
> Die Bayschen regeln für das Klassifizeirungsproblem würden eine **optimale** Aussage treffen wenn 
> - $P(\omega_{i})$ ... wahre unterliegende *priori* Klassenverteilung
> - $p(\boldsymbol{x}|\omega_{i})$ ... wahre Klassen bedingte Verteilung der Eigenenschaften (*likelihood*)

![invert_dark](../../_assets/Excalidraw/Density%20Estimation%202026-06-13%2016.43.36.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../../_assets/Excalidraw/Density%20Estimation%202026-06-13%2016.43.36.excalidraw.md)%%

## Parametric Density Estimation

1. The Likelihood Function
2. Maximum Likelihood (ML) Parameter Estimation
3. ML Estimates for Discrete Distributions
4. ML Estimates for Gaussian Density Functions
5. Our First Learning Algorithms: Single-Gaussian Classifier and Naı̈ve Bayes


![invert_dark](../../_assets/Excalidraw/Density%20Estimation%202026-06-12%2018.49.20.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../../_assets/Excalidraw/Density%20Estimation%202026-06-12%2018.49.20.excalidraw.md)%%

### Non Parametric Density Estimation

1. Nearest Neighbour Density Estimation
2. k-NN Density Estimation
3. Kernel Density Estimation

![invert_dark](../../_assets/Excalidraw/Density%20Estimation%202026-06-13%2016.42.01.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../../_assets/Excalidraw/Density%20Estimation%202026-06-13%2016.42.01.excalidraw.md)%%