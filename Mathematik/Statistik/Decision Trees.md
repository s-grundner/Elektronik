---
tags:
aliases:
  - ID3
subject:
  - VL
  - Machine Learning and Pattern Classification
semester: SS26
created: 14th June 2026
professor:
release: false
title: Decision Trees
---


# Decision Trees

> [!question] [Classifier](Classification.md) für diskrete Features

Baumstruktur:

- Pro Feature Typ eine Node.
- Von dieser Node, Branches je nach Feature Wert abzweigen.
- Blätter sind die Klassen
- Mehrere Feature-Nodes können in unterschiedlichen Branches auftreten

- Beispiel: Für jeden Trainings datenpunkt einen eigenen Branch erzeugen
	- Overfit
	- Extrem großer Baum

Wünschenswerte Eigenschaften

- Konsistent mit den Trainingsdaten
- Genereller Als das Traininsset
- Soll so **einfach wie möglich** sein

> [!hint] Doppelte Daten im Training haben keinen Auswirkung auf die baumstruktur

Kein Geschlossener Algorithmus um den einfachsten Baum zu erhalten möglich (NP-Complete Problem)

Probleme:

- Welches Features ist die Wurzel? = Welches feature unterscheidet die Klassen am besten
- Alle probieren, und schauen für welche werte welche klasse herauskommt.

![](../../_assets/Pasted%20image%2020260614124802.png)

- **Information Gain:** Jenes Feature auswählen, das die Klassen am unbalanciertesten einordnet.
- Empirische Klassenverteilung pro zweig: Basiert auf [Entropie](../../Netzwerktechnik/Informationstheorie/Informationsgehalt.md)

> [!def] **D)** **Information Gain**
> 
> The Information Gain of a feature $\boldsymbol{A}$ on a dataset $\mathcal{D}$ is the expected reduction of uncertainty (entropy) about the class labels, if we split $\mathcal{D}$ according to $A$:
> 
> $$
> IG_{\mathcal{D}} = E(\mathcal{D}) - \sum_{v_{i}\in A} \frac{\left| \mathcal{D}_{i} \right|}{\left| \mathcal{D} \right|} E(\mathcal{D}_{i})
> $$
> 
> where $\mathcal{D}_{i}$ is the subset of all examples in $\mathcal{D}$ that have value $v_{i}$ for feature $A$.

## ID3 Algorithmus


> [!def]  **D)** The ID3 Algorithm
> Start with root node containing all training examples: $\mathcal{D}_{\text {Root }}=\mathcal{D}$ ID3:
> 
> 1. If all examples $\mathcal{D}_N$ in current node $N$ belong to the same class $\omega$
> 	- $\implies$ make current node a leaf, label with class $\omega$, and EXIT
> 2. If no more features available for splitting in current node $N$
> 	- $\implies$ make current node a leaf, label with majority class in $N$, and EXIT
> 3. Calculate $I G_{\mathcal{D}_N}\left(A_i\right)$ for all features $A_i$
> 	- (i.e., try out all features for splitting)
> 4. Select feature $A=\arg \max _{A_i} I G\left(A_i\right)$ with max information gain (if $>0$ )
> 5. Create a branch + successor node $N_i$ for each value $v_i \in \operatorname{Val}(A)$
> 6. Split training examples $\mathcal{D}_N$ into subsets according to their value for feature $A$; assign each subset to its respective branch/subnode
> 7. For each subnode: recursively call ID3
> 

### Visualisierung der Decision Boundaries

![invert_dark|800](../../_assets/Pasted%20image%2020260614130958.png)

- Ein Generalisierter Baum hat große Rechtecke.
- Ein overfit würde jedes Sample in ein eigenes Rechteck rahmen


Problem: Bei komplexen Datensätzenversucht ID3 solange die Daten in die Rechtecke zu unterteilen, bis in jedem rechteck nur mehr die selben klassen sind. Man möchte jedoch den einfachst möglichen baum haben -> Pruning.

### Vor und Nachteile

Vorteile:

- Effizienter Algorithmus
- Schnelle Prediction
- Interpretierbares Klassifizierungsmodell
- Kann beliebig komplexe Decision Boundaries Annehmen (low [Bias](Classification.md#Bias-Varianz%20Tradeoff))

Nachteile:

- Blind to features that are relevant only in combination (because features are evaluated and split on individually, in isolation) $\implies$ may use irrelevant features for splitting
- High variance $\implies$ Can overfit easily

>[!success] Verbesserung: [Random Forest Classifier](Random%20Forest%20Classifier.md) (Horizontal Scaling)
> Man lernt $N$ Decision Trees. Zur Klassifizierung eines neuen objektes wird es durch *alle* Decision Trees klassifiziert. Man wählt dann aus allen ergebnissen z.B. die häufigste klasse.

## Pruning

Vereinfachen von Decision Trees:

- Pre-Pruning: Äste Reduzieren, bevor der Baum überhaubt steht
	- Baum komplexität im vorhinein einschränken
	- Bei jeder Node die daten in einem Rechteck ansehen und entscheiden, ob weiter gesplittet werden soll.
	- z.b. aufhören wenn nur mehr wenige samples einer Klasse vorhanden sind.
- Post Pruning: Äste im nachhinein Auflösen
	- Erst komplexen Baum konstruieren
	- Im nachhinein mit validation daten nodes mit blättern ersetzen
	- Fehler mit Trainingssatz steigt, aber baum wid simpler

