---
tags:
  - Material/Substrate
aliases: 
material: <% tp.system.prompt("Material Komposition", "")%>
spec-resisitance: 
  - $\rho$
  - <% tp.system.prompt("Spezifischer Widerstand", "")%>
  - $10^{-8}\Omega m$
spec-conductance:
  - $\gamma$
  - <% tp.system.prompt("Spezifischer Leitwert", "")%>
  - $10^{8}\frac{S}{m}$
temperature-coeff:
  - $\alpha$
  - <% tp.system.prompt("Temperatur Koeffizient", "")%>,
  - $10^{-4}\frac{1}{K}$
---
