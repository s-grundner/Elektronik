Objektorientierung - Assoziationen

- Multiplizität: Mengenverhältnisse
- Navigierbarkeit: Welche Klasse kann auf welche Klasse zugreifen?
- Rollen: Welche Rolle spielt eine Klasse für die Andere?

## Multiplizität

- 0..1 kein oder Ein
- 1 genau Eins
- \* beliebig viele
- 1..\* 1 oder mehrere

Im UML wird obige Bezeichnung beim Ziel notiert:

- Einem Objekt der Quellklasse ist immer genau ein Objekt der Zielklasse zugeordnet, dann kommt 1 zur Zielklasse
- Einem Objekt der Quellklasse sind beliebig viele Objekte der Zielklasse zugeordnet, dann kommt * zur Zielklasse

## Navigierbarkeit

- Eine Objekt Quellklasse kann auf ein Objekt der Zielklasse zugreifen, dann wird das mit einer Pfeilspitze bei der Zielklasse dargestellt.

  Beispiel: Einer von vielen Angestellten (Objekt der Klasse Angestellter) kann Sagen in welcher Abteilung er sich befindet, etwa weil er bei der Rückgabe seiner Ausweisdaten (leseId) die Abteilung angibt -> Pfeilspitze zur Abteilung.

- Ein Objekt einer Quellklasse kann nicht auf ein Objekt der Zielklasse zugreifen, das wird mit einem Kreuz dargestellt.

  Beispiel: Gleiches Beispiel wie gerade eben, nur der Angestellte hat keine Funktion wie leseId, daher weiß er nicht in welcher Abteilung er sich befindet -> Kreuz bei der Abteilung.

## Rollen





informatikzentrale.de/assoziationen.html