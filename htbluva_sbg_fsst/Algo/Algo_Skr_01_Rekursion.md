# 1 Rekursion

**Iteration:** mehrmaliges/wiederholtes Ausführen einer Aktion.

#### Beispiel:

	Pizzaessen():
	vom Ersten bis zum letzten Stück:
		schneide ein Stück ab und esse ihn auf
	ENDE

Iterationen werden in Programmiersprachen durch for, while, do-while o.ä. implementiert.

**Rekursion:** mehrmalige Ausführung einer Aktion durch *Selbstaufrufen*.

Beispiel:

	Pizzaessen():
	wenn Teller leer: ENDE
	sonst:
		schneide ein Stück ab und esse ihn auf
		Pizzaessen()

Wir Menschen denken "eher Rekursiv", häufig lassen sich Probleme anschaulich rekursiv lösen. Eine Rekursion vereinfacht ein komplexes Problem mit jedem Schritt. Nachteil: in den meisten Fällen ist eine iterative Lösung effizienter. Eine rekursive Lösung benötigt durch die vielmalige Funktionsaufrufe mehr Speicher (Stack).

Grundsätzlich gilt:

- eine rekursive Lösung benötigt eine geeignete Abbruchbedingung
- jedes iterativ lösbare Problem lässt sich auch rekursiv lösen und umgekehrt (nicht immer trivial).
  

![Rekursion](./bilder/Rekursion.png)


## Fragen

- Welche beiden grundsätzlichen Ansätze gibt es um sich wiederholende Probleme zu lösen?
- Welche Bedingungen müssen erfüllt sein damit eine iterative Lösung rekursiv gelöst werden kann?
- Beschreibe den Vor-/Nachteile einer rekursiven Problemlösung gegenüber einer iterativen Problemlösung.
- Was benötigt eine rekursive Lösung immer (und warum)?
- Was hat der Stack mit einer rekursiven Problemlösung zu tun?

