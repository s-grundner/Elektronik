---
tags:
  - Algorithmus/Sortieren
aliases:
  - Bubbel-Sort
created: 19th August 2023
complexity: $\mathcal{O}(n^{2})$
---

# Bubble Sort

> [!info] Complexity: `$=dv.current().complexity`

Algorithmus zum Aufsteigenden Sortieren:

- Vom ersten Element beginnend, werden zwei benachbarte Feldelemente miteinander verglichen. Ist das zweite kleiner, werden die beiden Elemente vertauscht.
- Der Vergleich und das eventuelle Vertauschen wird mit dem zweiten und dritten Element wiederholt.
- Dieser Vorgang wird bis zum letzten Element wiederholt. Dadurch ist nach diesem Durchlauf das größte Element an der letzten Stelle (es ist wie ein Bubble aufgestiegen).
- Die komplette Prozedur wird von vorne beginnend solange wiederholt bis bei einem kompletten Durchlauf keine Vertauschung mehr erfolgt.

> [!EXAMPLE] Beispiel:

```
 5   1   12   -5    2   12   14	// Vertauschen Element 0 und 1
 1   5   12   -5    2   12   14	// Vertauschen Element 2 und 3
 1   5   -5   12    2   12   14	// Vertauschen Element 3 und 4
 1   5   -5    2   12   12   14	// Bis zum Ende keine Vertauschung mehr, Beginn von Vorne  Vertauschen Element 1 und 2
 1  -5    5    2   12   12   14	// Vertauschen Element 2 und 3
 1  -5    2    5   12   12   14	//Bis zum Ende keine Vertauschung mehr, Beginn von Vorne Vertauschen Element 0 und 1
-5   1    2    5   12   12   14	//Bis zum Ende keine Vertauschung mehr, Beginn von Vorne - keinVertauschen - Fertig
```

Kennzeichen:

- Benötigt keinen weiteren Speicherplatz (nur zum Vertauschen, ist von der Feldgröße unabhängig).
- Ist ein kleines Element auf einem hohem Index, dann sind sehr viele Vertauschungen notwendig.
- Wenn ein Feld bereits sortiert ist, dann ist nur ein einmaliger Vergleichsdurchlauf notwendig.
- Laufzeit $O(n^2)$.
- Verbesserung: abwechselnd von unten nach oben und von oben nach unten. Damit kann das ungünstige Verhalten für einzeln zu verschiebende Felder verbessert werden (**Shaker Sort**).
- Internes Sortieren.
- Kann stabil oder instabil implementiert werden.

Implementierung in C:

```c
void bubble_sort(int arr[], int len) {
    int i, j, tmp;
    int completed;

    completed = 0;			// at the Begin: sorting not completed
    // Iteration over all Elements until no exchange anymore
    while (completed == 0){
        completed = 1;
        for(i = 0; i < len-1; i++) { // compare and exchange of Elements
            if( arr[i] > arr[i+1] ) {
                tmp = arr[i];
                arr[i] = arr[i+1];
                arr[i+1] = tmp;
                completed = 0;		// still exchange -> not finished
            }
        }
    }
}
```