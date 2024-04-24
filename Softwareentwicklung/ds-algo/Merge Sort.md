---
tags:
  - Algorithmus/Sortieren
aliases:
  - Merge-Sort
created: 19th August 2023
complexity: $\mathcal{O}(n\cdot\log(n))$
---

# Merge Sort

> [!info] Complexity: `$=dv.current().complexity`

- Zerteilen eines Feldes x[0] .. x[n-1] in zwei Teilfelder x[0] .. x[m-1] und x[m] .. x[n-1].
- Die Teilfelder werden sortiert → y[0] .. y[m-1] und z[0] .. z[n-m-1].
- Mischen der Teilfelder. Im ersten Schritt wird das kleinste Element ermittelt: x[0] = Min(y[0], z[0]), z.B. y[0]. Dann das zweit kleinste: x[1] = Min(y[1], z[0]) und so fort.
- [Rekursiv](Rekursion.md) kann die Teilung bis zu einem 1 großen Feld zerlegt werden.

Implementierung des Mischens (Merge) in JavaScript:

```javascript
// Bedingung: von2 = bis1+1 !!!, a ist das zu sortierende/mischende Feld
function merge(von1, bis1, von2, bis2) {
    var arr = new Array(bis2-von1+1);
    var j = 0;	// Zaehler Feld1
    var k = 0;	// Zaehler Feld2
    for (var i = 0; i <= (bis2-von1); i++) {
        if (j > (bis1-von1)) {
            arr[i] = a[von2 + k]; k++;
        } else if (k > bis2-von2) {
            arr[i] = a[von1 + j]; j++;
        } else if (a[von1 + j] < a[von2 + k]) {
            arr[i] = a[von1 + j]; j++;
        } else {
            arr[i] = a[von2 + k]; k++;
        }
    }
    for (var i = 0; i <= (bis2-von1); i++) {
        a[von1 + i] = arr[i];
    }
}
```

Kennzeichen:

- Das zu sortierende Feld kann beliebig aufgeteilt und sortiert werden, daher ist der Algorithmus zum Sortieren großer Datenmengen geeignet (einfach mittels [Rekursion](Rekursion.md)).
- Prinzip: Teile und Herrsche (Divide and Conquer)
- Der Mischvorgang benötigt den doppelten Speicherplatz.
- Durch die Teilung kann die Aufgabe parallelisiert werden
- Laufzeit: $O(n\cdot log_2(n))$, allgemein gilt: $log_2(n) < n$. Praktisch kann ein vermehrter Speicherzugriff höhere Laufzeiten zur Folge haben.
- Stabiles Sortierverfahren