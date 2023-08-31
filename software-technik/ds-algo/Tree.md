---
tags: []
aliases: []
subject: ["fsst"]
source: ["Anton Hofmann"]
created: 26th April 2022
---

# Trees

Roots (Wurzel): Hat keine 

## Binary Tree

Jeder Knoten hat maximal 2 Sub-knoten 

### Binary Search Tree

Jeder Knoten im Linken Teilbaum ist kleiner als seine Wurzel.  
Jeder Knoten im rechten Teilbaum ist größer als seine Wurzel.

> [!example] 
>
> ![binary_Search_tree](binary_Search_tree.svg)
>
> ``` c
> struct node {
> 	int data;
> 	struct node *next;
> 	struct node *last;
> }
> typedef struct node node_t;
> ```

### Durchqueren/Traversieren

#### Depth-First-Search DFS

Durch das Traversieren eines Binären Such Baumes mit depth first search, bekommt man eine Sortierte Liste zurück.

#### Breadth First Search BFS

---

# Tags