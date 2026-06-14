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
title: Common Machine Learning Algorithms
---

# Common Machine Learning Algorithm

- Introduce some popular learning algorithms for classification
- Review their relative advantages and shortcomings
- Give you a deeper understanding of what the algorithms you are using in your experiments actually do

![](../../_assets/Excalidraw/Common%20Machine%20Learning%20Algorithms%202026-06-14%2014.47.40.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../../_assets/Excalidraw/Common%20Machine%20Learning%20Algorithms%202026-06-14%2014.47.40.excalidraw.md)%%

Simple Baseline Classifiers

- Class Frequency Classifier
- [Single Gaussian Classifier](Single%20Gaussian%20Classifier.md)
- [Naive Bayes Classifier](Naive%20Bayes%20Classifier.md)
- $k$-Nearest Neighbours

Häufig verwendet

- [Decision Trees](Decision%20Trees.md)
- Random Forest
	- ID3 Algorithmus
- Support Vektor Machines
- Feed Forward Neural Networks


> [!warning] Achtung bei Distanzbasierten[^1] Algorithmen: Daten müssen vorher normalisiert werden.

## Zusammenfassung

Remember: 

- That there are some simple baseline classifiers you should try first, and compare your more complex classifiers to: ZeroR, Naive Bayes, k-NN
- Decision trees, and how to learn and prune them
- Specifically, the general method of Reduced Error Pruning (iterative model simplification based on a validation set)
- Why and how combining trees to ensembles (forests) improves learning and robustness
- The basic concept of Support Vector Machines: linear discrimination in a more expressive space (no formulas)

[^1]: Man arbeitet mit einer Distanz [Metrik](../Algebra/Metrischer%20Raum.md): z.B: Euklidsche Distanz, Manhattan Distanz
