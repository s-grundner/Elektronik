---
tags:
  - Software-Engineering
aliases: 
keywords: 
subject:
  - VL
  - Softwareentwicklung 2
semester:
  - SS24
  - B2
created: 29. November 2022
professor:
---
 

# Unit-Test

Ein Unit-Test testet eine kleine Einheit (Unit), noch bevor sie in das gesamte Projekt eingebunden (integriert) wird. Die Idee ist, die Erfüllung der konkreten Anforderung zu Testen. Um keinen Einfluss von anderen Teilen der System-Software zu verspüren (im Guten wie im Schlechten) wird das Testen des Features in einer Eigens erstellten, sinnvoller Weise nach möglichst einfachen Umgebung erfolgen. 

Damit findet der Test möglichst unabhängig von anderen Komponenten ab. In vielen Entwicklungstools kann ein Unit-Test bereits während der Entwicklung mit integriert werden. Der große Vorteil gegenüber einem bloßen manuellen Testen ist, dass mit jeder späteren (auch kleinen) Änderung gleich eine ganze Reihe von Tests wieder gestartet werden kann. Der zweite große Vorteil ist, dass ein entsprechender Nachweis der Testung mitgeliefert werden kann.

- [QT_UnitTest](QT_UnitTest.md)
- [JUnit](JUnit.md)