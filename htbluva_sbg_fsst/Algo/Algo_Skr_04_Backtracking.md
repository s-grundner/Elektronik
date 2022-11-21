# 4 Backtracking

Backtracking ist ein Problemlösungsverfahren nach dem *Trial-and-Error* (Versuch-und-Irrtum) Prinzip. Auf dem Weg zur Lösung wird ein möglicher Versuch angenommen und verfolgt bis er sich als richtig herausstellt oder ansonsten wird der Versuch zurückgenommen und ein alternativer Versuch unternommen.

In vielen Fällen wird Backtracking rekursiv implementiert.

Wenn es eine Lösung gibt, dann wird diese mittels Backtracking immer gefunden. Wird keine Lösung gefunden, dann gibt es keine Lösung. Es wird nicht automatisch eine optimale Lösung gefunden.

Der ganz große Vorteil von Backtracking ist, dass keine spezielle Lösungsstrategie ermittelt werden muss. Durch einfaches Versuchen kann eine Lösung gefunden werden. Der Vorteil wird durch die hohe Geschwindigkeit von modernen Rechensystemen unterstützt. Durch zusätzliches Berücksichtigen von Detailkenntnissen kann der Algorithmus eine wesentlich höhere Effizienz erreichen.

Wird die Lösung ohne gut durchdachte Lösungsstrategien gesucht, also einfach nur durch Probieren sämtlicher Möglichkeiten, dann wird diese Lösungs-Art als *Lösen durch rohe Gewalt* bzw. *Brute Force* bezeichnet.

## Beispiel Labyrinth (2103)

Gegeben ist ein Labyrinth mit einer Start- und einer End-Position auf einem 2 dimensionalen Raster.

1. Auf dem Raster gibt es begehbare Felder und nicht begehbare Felder (Mauer)

2. Vom aktuellen Punkt (Startpunkt) aus wird ein Schritt in eines der 4 möglichen Nachbarfelder versucht zu begehen.

3. Ist das Ziel erreicht, dann Ende.

4. Ist der Schritt möglich (keine Kollision mit einer Mauer), dann wird der Schritt beibehalten und der Algorithmus wiederholt sich beginnend mit Pkt. 1 (Selbstaufruf -> Rekursion).

5. Ist der Schritt nicht möglich und es wurden schon sämtliche andere Richtungen vom aktuellen Punkt versucht, dann wird das Feld als nicht zielführend markiert, der Schritt rückgängig gemacht und eine andere Option geprüft.


Beispielhafte Implementierung des rekursiven Algorithmus in C:

```c
int findWay(int y, int x, int zy, int zx, int arr[MAXY][MAXX]) {
    if ((arr[y][x] != 0) || (y < 0) || (y >= MAXY) || (x < 0) || (x >= MAXX)) return 1;   // Mauer, Feld schon begangen oder Feldrand
    arr[y][x] = 2;												// Markierung: Feld schon begangen
    if ((y == zy) && (x == zx)) return 0;    // Ziel
    if (findWay(y + 1, x, zy, zx, arr) == 0) return 0;
    if (findWay(y, x + 1, zy, zx, arr) == 0) return 0;
    if (findWay(y - 1, x, zy, zx, arr) == 0) return 0;
    if (findWay(y, x - 1, zy, zx, arr) == 0) return 0;
    arr[y][x] = 3;												// Markierung: dieses Feld führt nicht zum Ziel
    return 1;	// Suche vom aktuellen Feld aus nicht erfolgreich
}
```

y, x		aktuelle Position im Labyrinth
zy, zx	Position des Ziels im Labyrinth
arr		Labyrinth: 0-freies Feld, 1-Mauer, 2-Feld wurde bereits begangen, 3-von diesem Feld aus kein Ziel erreichbar (schon versucht)

Beispiel:

Weg von linker/oberer Ecke nach rechter/unterer Ecke, #=Mauer, @=Sackgasse, o=Lösung

```
______________________________________________________________
|oooo#@@@@@@@#@@@#@@@@@@@@@@@@#@@@#@@#@@#@@@@@@@@@#@@@@@#   #|
|   ooo#@@@@@@#@@@@##@@@@#@#@#@@@@#@@#@@#@@#@#@@@@@@#@@#@####|
|#  ##oo##@##@@@#@#@@@@#@@@@@@@@@@@@@@@@@@@@##@@@##@@@##@@@#@|
|      oo#@@@@@@#@@#@##@@@@@@@@#@@@@@@@#@@@@@@@@#@@@@@@##@#@@|
|  #    ooooo#ooo#@#@@@@#@@@@@#@@@@@@@@@@@@@@#@@#@@@#@@@@@@@@|
|      #    ooo#oooo#@@#@@@@@@@@@@@@@@@##@#@@@@@@@##@@@@@@#@@|
|   #         #    oooooo#@@@@@@@@#@#@ooooooooooo#@@@@#@@@@@@|
|     # #      ##       ooooooooooooooo#    #   oooooooo#@@@@|
|    ##    ##   #         ##  ##     ##    #       #   oo##@@|
|#  ##   #   #    # #               #  ### #      #     oo#@@|
|     #           #               # ##  #   #  #    #    ooo@|
|           # #   #         #   #             #            o#|
|   #    # #  ##                            ##     #       oo|
| ## #  #  #     #  # #        #        # ##  #     # # # ooo|
|    #        #               #    #  #          ###      o#@|
|#    # #     #       #      # #      #  #     ##         oo#|
|         # #             #   #             # #  #  #     #oo|
|#     # # # #   #  # ##               #        #    #  #   o|
|  #                   ##   #        # ###  #   # ##    ##  o|
| # #               #      #              #         #        |
|____________________________________________________________|
```

## Referenzen

- Erklärung und Beispiele:

  [https://www.ethz.ch/content/dam/ethz/special-interest/dual/educeth-dam/documents/Unterrichtsmaterialien/informatik/B%C3%A4ume%20und%20Backtracking%20(Leitprogramm)/Backtracking.pdf](https://www.ethz.ch/content/dam/ethz/special-interest/dual/educeth-dam/documents/Unterrichtsmaterialien/informatik/B%C3%A4ume%20und%20Backtracking%20(Leitprogramm)/Backtracking.pdf)


## Fragen

- Was versteht man unter Trial-and-Error (im Zusammenhang mit Backtracking)?
- Kann mittels Backtracking *immer* eine Lösung gefunden werden?
- Kann mittels Backtracking immer eine *optimale* Lösung gefunden werden?
- Was ist der große Vorteil von Backtracking (muss ein mathematischer Lösungsansatz entwickelt werden)?

