---
tags: 
aliases: 
keywords: []
subject:
  - Softwareentwicklung1
semester: 1
created: 9. Oktober 2023
professor:
---
 

# EBNF (Erweiterte Backus Naur Form)

| Metazeichen | Bedeutung             | Beispiel     | beschreibt |
| ----------- | --------------------- | ------------ | ---------- |
| $=$         | trennt Regelseiten    | $A=xyz.$     |            |
| $.$         | schließen Regeln ab   |              |            |
| $\mid$      | trennt Alternativen   | $x\mid y$    | $x,y$      |
| $()$        | klammert Alternativen | $(x\mid y)z$ | $xz,xy$    |
| $[]$        | wahlweises Vorkommen  | $[x]y$       | $y,xy$     |
| $\{\}$      | $0\dots n$-maliges                      |              |            |
