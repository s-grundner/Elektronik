---
tags:
  - Compiler
aliases: 
keywords: []
subject:
  - Softwareentwicklung1
semester: 1
created: 9. Oktober 2023
professor:
---
 

# EBNF (Erweiterte Backus Naur Form)

| Metazeichen | Bedeutung                    | Beispiel     | beschreibt                   |                   |
| ----------- | ---------------------------- | ------------ | ---------------------------- | ----------------- |
| $=$         | trennt Regelseiten           | $A=xyz.$     |                              |                   |
| $.$         | schließen Regeln ab          |              |                              |                   |
| $\mid$      | trennt Alternativen          | $x\mid y$    | $x,y$                        | oder              |
| $()$        | klammert Alternativen        | $(x\mid y)z$ | $xz,xy$                      | Gruppierung       |
| $[]$        | wahlweises Vorkommen         | $[x]y$       | $y,xy$                       | Optional 0 oder 1 |
| $\{\}$      | $0\dots n$-maliges Vorkommen | $\{x\}y$     | $y,x y,x x y, x x x x \dots$ | Iteration $0-\ast$    |
