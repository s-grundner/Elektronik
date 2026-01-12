---
tags: 
aliases:
  - Entkopplungskondensator
  - decoupling
created: 19th August 2023
---

# Abblockkondensator

> [!INFO] Resonanzverlauf  
> ![500](../_assets/EMV_impedanz.png)


Da die [Impedanz](../Elektrotechnik/Impedanz.md) eines Kondensators bis zur Resonanzfrequenz sinkt, können HF-Störungen auf Versorgungsleitungen mit Gleichsignalen oder NF-Signalen durch einen Parallelgeschalteten [Kondensator](../Elektrotechnik/Kapazität.md) (Kurzschluss-geblockt) werden.  
![300](../_assets/AbblockCap.png)  
Für das NF-Signal: [Kapazität](../Elektrotechnik/Kapazität.md) ist ein Leerlauf  
Für die HF-Störung: [Kapazität](../Elektrotechnik/Kapazität.md) ist ein Kurzschluss

- Die HF Störung kann nicht in die Schaltungsteil eindringen bzw diesen verlassen.
- Störungen werden reflektiert, nicht absorbiert
	- [Reflexionsfaktor](../HF-Technik/Reflexionsfaktor.md) im Kurzschluss: $r_{KS}=-1$
	- ggf. gibt es Probleme mit Resonanzen innerhalb der Schaltung
- Versorgungsleitungen kurz halten (siehe 4-Pol [Kondensator](../Elektrotechnik/Kapazität.md) [a])
- 3-Leiter Anordnung mit 3 Kondensatoren zum KS gleich und Gegentaktsignalen [b])

# Tags

[EMV](Elektromagnetische%20Verträglichkeit.md)