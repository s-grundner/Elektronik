---
tags:
aliases:
  - Classifier
subject:
  - VL
  - Machine Learning and Pattern Classification
semester: SS26
created: 13th June 2026
professor:
  - Gerhard Widmer
release: false
title: Classifier Evaluation
---


# Classification

- Take an abstract look at the classification learning task
- Discuss need and methods for empirical classifier evaluation
- Introduce the central problem in machine learning: overfitting avoidance and model selection
- Take a look at some common classifier evaluation measures
- Briefly think about cost-sensitive learning


> [!cite] Assumptions
> 
> The aspects of the world relevant for our task are encoded by a fixed set $\mathcal{X}$ of $d$ features $\implies$ the world for the classifier is a $d$-dimensional feature space $\boldsymbol{X}$
> 
> - The world $\boldsymbol{X}$ is governed by a fixed (but unknown) probability distribution $p(\boldsymbol{X}, \Omega)$ over features and classes
> - As training data, we obtain a set $\mathcal{D}$ of example cases that have been drawn from this world according to the underlying distribution $p$
> - The training examples $\mathbf{x} \in \mathcal{D}$ have been *labelled* with *class labels* $\omega_{i} \in\Omega$ by some external expert entity.
> - The training examples have been drawn *independently* and all come from the same distribution $p$ ($\iff$ i.i.d)
> - The distribution $p(\boldsymbol{X}, \Omega)$ will not change over time (or between training and application time) - it is *stationary*

![invert_dark|800](../../_assets/{NOTES}%20Machine%20Learning%20and%20Pattern%20Classification%20VL%202026-06-10%2017.08.36.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../../_assets/klassifizierungsproblem.md)%%

## Learning

- We choose a *learning algorithm* $L$ with an associated *model class* $\mathcal{C}$
	- $\mathcal{C}$: The set of *models* = classifiers = decision boundary function that $L$ can learn / represent (= Funcitonspace)
- For a given training set $\mathcal{D}$, $L$ returns a **classifier** (model, decision function) $c \in \mathcal{C}$

> [!def] **D)**  A **Learning Algorithm** $L$ is a function $L:\mathcal{S} \mapsto \mathcal{C}$, where $\mathcal{S}$ is the set of all possible subsets of $\boldsymbol{X}$
> 
> -  [Power Set](../Algebra/Potenzmenge.md): $\mathcal{S} = \mathcal{P}(\boldsymbol{X})$
> - i.e. all possible training set in this world

- [Common Machine Learning Algorithms](Common%20Machine%20Learning%20Algorithms.md)

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

## Evaluierung

![invert_dark|1000](../../_assets/Excalidraw/Classification%202026-06-13%2015.08.24.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../../_assets/Excalidraw/Classification%202026-06-13%2015.08.24.excalidraw.md)%%

## Overfitting und Model-Komplexität


![invert_dark|500](../../_assets/Excalidraw/Classification%202026-06-13%2023.19.40.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../../_assets/Excalidraw/Classification%202026-06-13%2023.19.40.excalidraw.md)%%

### Bias

> [!info] **Bias** = Fehler wahrscheinlichkeiten, die durch die Einschränkung des Modells hervorommt.
> 
> Ziel
> 
> - Overfitting Vermeiden
> - Den Learning Algorithmus zwingen zu generalisieren
>
> Herangehensweise
> 
> - **Hardconstraints:** Anzahl der Modellparameter fixieren: z.B: nur lineares Modell erlauben
> - **Softconstraints:** Hohe komplexität mit Kosten gewichten, sodass nur im notfall das Modell komplex werden würde.
>

- High Bias Algorithmem:
	- [Naive Bayes Classifier](Naive%20Bayes%20Classifier.md)
	- Support Vector Machines

### Varianz

Im gegenzug

> [!info] **Varianz** = Fehler wahrscheinlichkeit, die durch hohe komplexität der Modells hervorgerufen wird.
> 
> Ein komplexes modell für einen expressiven Datensatz könnte die *tatsächliche* Decision boundary liefern. 
> Jedoch sehr Sensitiv bzgl den Trainingsdaten. Mit einer geringen Anzahl oder abweichungen in den Trainingsdaten steigt die Wahrscheinlichkeit, dass ein fehler durch eine Abweichung der komplexen decision boundary entsteht.
> 
> Viele Modelle könnten die trainingsdaten einfach zufällig fitten.
> 
> ![invert_dark|500](../../_assets/Excalidraw/Classification%202026-06-14%2000.02.27.excalidraw.svg)
> %%[🖋 Edit in Excalidraw](../../_assets/Excalidraw/Classification%202026-06-14%2000.02.27.excalidraw.md)%%
> *Welches der obigen Decisionboundaries ist die echte?*

High Variance Algorithmen:

- k-NN (Nearest Neighbours)
- Decision Trees

### Bias-Varianz Tradeoff

> [!hint] Tradeoff zwischen **Bias** und **Varianz**
>
> - Beschränkung auf einfache Modelle:
> 	- ✅ Overfitting vermeiden
> 	- ❌ Wahrscheinlichkeit für Bias-Fehler steigt
>- Komplexität im Modell erlaubem:
>	- ✅ Bias fehler-wslk. reduzieren
>	- ❌ Fehler möglichkeit, dass das komplexe modell garnicht das *echte* ist.
> 

## Zusammenfassung

Zu erinnern

- general classification scenario
- different procedures for estimating a classifier’s expected accuracy
- need for looking at the baseline (class distribution)
- bias-variance trade-off
- need for model selection
- different evaluation measures for classifiers
- basic ideas of ROC space and classifier selection
- simple approaches to cost-sensitive learning

