---
tags: ["Sortieren", "Algorithmus"]
aliases: ["Selection-Sort"]
created: 19th August 2023
---

# Selection Sort

Algorithmus zum aufsteigenden Sortieren:

- Suchen des kleinsten Elements im Feld.
- Vertauschen des ersten Feld-Elements mit dem gefundenen kleinsten Element.
- Wiederum Suchen des kleinsten Elements im Feld ohne das erste Element
- Vertauschen des ersten Elements dieser neuen Menge (ohne erstem Element) mit dem gefundenen kleinsten Element (zweitkleinstes Element).
- …

> [!EXAMPLE] Beispiel:
>
> ```txt
>  5   1   12   -5    2   12   14   // kleinstes Element an Index 3
> -5   1   12    5    2   12   14   // Vertauschen mit nullten Element, kleinstes Element des verbleibenden Felds an Index 1
> -5   1   12    5    2   12   14   // Vertauschen mit sich selbst, kleinstes Element des verbleibenden Felds an Index 4
> -5   1    2    5   12   12   14   // Vertauschen mit zweiten Element, kleinstes Element des verbleibenden Felds an Index 3
> -5   1    2    5   12   12   14   // Vertauschen mit sich selbst, kleinstes Element des verbleibenden Felds an Index 4
> -5   1    2    5   12   12   14   // Vertauschen mit sich selbst, kleinstes Element des verbleibenden Felds an Index 5
> -5   1    2    5   12   12   14   // Vertauschen mit sich selbst -> Feld sortiert
> ```

Kennzeichen:

- Benötigt keinen weiteren Speicherplatz (nur zum Vertauschen, ist von der Feldgröße unabhängig).
- Jedes Feld wir maximal einmal vertauscht.
- Laufzeit $O(n^2)$: das Feld wird in n-Schritten nach dem kleinsten Feld durchsucht und das wird n-mal gemacht.
- Wenn sich an der ersten Stelle des Feldes der größte Wert befindet, dann müssen sämtliche kleineren Werte "vorbeigetauscht" werden.  
  Verbesserung: abwechselnd Maximum und Minimum suchen und an oberes beziehungsweise unteres Ende stellen.
- Schon fertig sortierte Felder werden nicht erkannt.
- Internes Sortieren, es werden Elemente an beliebigen Positionen miteinander verglichen.
- Kann stabil oder instabile implementiert werden.

## Implementierung in C

```c
void selectionSort(int arr[], int len) {
    int i, j, minIndex, tmp;     
    for (i = 0; i < len-1; i++) {		// the minumum is set as the i-th Arrayelement
        minIndex = i;
        for (j = i + 1; j < len; j++)	// Starting behind sorted section
            if (arr[j] < arr[minIndex]) minIndex = j;	// stable: <; not stable: <=
        if (minIndex != i) {			// Exchange
          tmp = arr[i];
          arr[i] = arr[minIndex];
          arr[minIndex] = tmp;
        }
    }
}
```