---
tags:
aliases:
  - Classifier
  - Learning Algorithm
subject:
  - VL
  - Machine Learning and Pattern Classification
semester: SS26
created: 22nd May 2026
professor:
  - Gerhard Widmer
release: false
title: Classification
---


# Classification

> [!cite] Assumptions
> 
> The aspects of the world relevant for our task are encoded by a fixed set $\mathcal{X}$ of $d$ features $\implies$ the world for the classifier is a $d$-dimensional feature space $\boldsymbol{X}$
> 
> - The world $\boldsymbol{X}$ is governed by a fixed (but unknown) probability distribution $p(\boldsymbol{X}, \Omega)$ over features and classes
> - As training data, we obtain a set $\mathcal{D}$ of example cases that have been drawn from this world according to the underlying distribution $p$
> - The training examples $\mathbf{x} \in \mathcal{D}$ have been *labelled* with *class labels* $\omega_{i} \in\Omega$ by some external expert entity.
> - The training examples have been drawn *independently* and all come from the same distribution $p$ ($\iff$ i.i.d)
> - The distribution $p(\boldsymbol{X}, \Omega)$ will not change over time (or between training and application time) - it is *stationary*

## Learning

- We choose a *learning algorithm* $L$ with an associated *model class* $\mathcal{C}$
	- $\mathcal{C}$: The set of *models* = classifiers = decision boundary function that $L$ can learn / represent (= Funcitonspace)
- For a given training set $\mathcal{D}$, $L$ returns a **classifier** (model, decision function) $c \in \mathcal{C}$

> [!def] **D)**  A **Learning Algorithm** $L$ is a function $L:\mathcal{S} \mapsto \mathcal{C}$, where $\mathcal{S}$ is the set of all possible subsets of $\boldsymbol{X}$
> 
> -  [Power Set](../Algebra/Potenzmenge.md): $\mathcal{S} = \mathcal{P}(\boldsymbol{X})$
> - i.e. all possible training set in this world

Depending on the operation of the learning algorithm, there are specific settings / parameters called [Hyper-Parameters](Hyper-Parameter%20Tuning.md) which can be adjusted to increase the performance of a classifier.

> [!def] **D)** A **Classifier** $c$ is a function $c: \boldsymbol{X} \mapsto \Omega$

Classification

- At prediction time, the classifier $c$ is applied to new cases, and predicts  a *class label* $\omega_{i} \in \Omega$ for each new case.
	- assumed to come from the same distribution $p(\boldsymbol{X}, \Omega)$ as the training data $\mathcal{D}$

![invert_dark|700](../../_assets/Excalidraw/Classification%202026-05-23%2013.30.56.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../../_assets/Excalidraw/Classification%202026-05-23%2013.30.56.excalidraw.md)%%

## Classifiers

1. Categorical Classifier
	- Predict a single class label $\omega_{i} \in \Omega$ from a Feature $\mathbf{x} \in\boldsymbol{X}$
2. Probabilistic Classifiers
	- Outputs which class is most likely to fit.
	- Classification via regression
	- needs an additional criterion to make class decision from the probabilities (e.g. $\operatorname{argmax}$)

## Evaluation

### Recall and Precision

$$
\begin{align}
\text{predicted class} \\
\text{true class~}
\begin{array}{c|cc}
 & p & n\\
\hline
p & \color{red} TP & \color{blue} FN \\
n & \color{blue} FP & \color{red} TN
\end{array}
\end{align}
$$

- $P= {\color{red}TP} + {\color{blue}FN}$ ... total number of $p$ examples
- $PP= {\color{red}TP} + {\color{blue}FP}$ ... total number of $p$ predictions

**Recall:** proportion of $p$ *instances* that are correctly recognised

$$
Rec = \frac{TP}{TP + FN} = \frac{TP}{P}
$$

**Precision:** proportion of $p$ *predictions* that are correct

$$
Prec = \frac{TP}{TP + FP} = \frac{TP}{PP}
$$

> [!warning] Problem: Precision can be artificially maximized
> 
> Suppose the test set contains 100 real door events. Model A predicts only **10** door events: 10 correct, 0 wrong
> 
> |Metric|Value|
> |---|---|
> |Precision|10/(10+0)=1.0|
> |Recall|10/100=0.1|
> 
> The model appears excellent if you look only at precision. But it missed **90% of all doors**. For an audio-event detector this is usually undesirable because it barely detects anything.

### F1

Harmonic Mean of Precision and Recall.

$$
\mathrm{F 1} = 2 \cdot \frac{Rec \cdot Prec}{Rec + Prec}
$$

If one of the two scores are small, it pulls down the whole F1 score (vergleiche Parallelschaltung von Widerständen)