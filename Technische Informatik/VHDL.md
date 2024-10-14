---
tags: 
aliases: 
keywords: 
subject:
  - Hardwaredesign
  - PR
semester: WS24
created: 14. Oktober 2024
professor:
---
 
# VHDL

## Entitiy / Architecture

Register und Kombinatorik trennen!

- **Kkombinatorik:**
- **Register:** nur `clk_i` und `reset_i` in der Sensitivity List

> [!warning] Niemals benötigt man `clk_i` und `reset_i` in einem kombinatorischen Prozess