---
tags:
aliases:
subject:
  - VL
  - Machine Learning and Pattern Classification
semester: SS26
created: 14th June 2026
professor:
release: false
title: Improving Learning Results
---

# Improving Learnign Results

- Input Optimierung
- Lernprozess optimieren
- Komplementäre Classifiers Kombinieren
- Post Processing

## Input Optimierung - Feature Selection

Motivation:

- Some classifiers are highly sensitive to irrelevant features (e.g., k-NN)
- Some classifiers are adversely affected by redundant (correlated) features (e.g., Naive Bayes)
- Irrelevant features increase the possibilities for the classifier to overfit I Fewer features ⇒ faster learning ⇒ shorter experiments

Goal:

- Reduce the set of features X to the minimum set needed
- Remove features that are uninformative or harmful
 
Possibilities:

- Manual feature selection (e.g., based on knowledge/intuition about the task) Automatic selection of informative features via simple statistical tests
- Automatic search for optimal feature subset, governed by cross-validation

## Classifiers Kombinieren

## Zusammenfassung

Remember:

- why feature selection/reduction or feature construction might be useful
- how to correctly split the data to obtain unbiased performance estimates after optimisation and model selection
- typical ensemble learning methods: Voting, Bagging, Stacking, Boosting
- the basic idea of post-processing classifiers’ predictions
- that applied machine learning is more than feeding data into a learning algorithm