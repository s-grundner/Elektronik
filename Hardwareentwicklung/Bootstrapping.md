---
tags: 
aliases: 
created: 7. Februar 2025
---

# Boostrapping bei Spannungsverstärkern

> Findet man in [SMPS](Stromversorgungseinheiten/{MOC}%20Schaltnetzteil.md), und Mehrstufingen Transistorverstärkern

![](assets/Pasted%20image%2020250207212041.png)

Die Abgebiltede Schaltung zeigt einen zweistufigen Verstärker mit sogenanntem **Bootstrapping**. Durch diese Maßnahme kann die Leerlaufverstärkung der Schaltung dramatisch erhöht werden. Kleinsignalmäßig betrachtet, wird das Potenzial zwischen $R_{3}$ und $R_{4}$ durch $C_{3}$ mit $U_{C}$ mitgehoben. Der Wirksame Kollektorwiderstand an $T_{1}$ wird dadurch vergrößert, ohne die Arbeitspunkteinstellung zu verändern. Entsprechend $A \approx -S\cdot R_{C}$ erhöht sich die Verstärkung.

