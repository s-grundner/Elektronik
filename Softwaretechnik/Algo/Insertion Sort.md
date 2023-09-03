---
tags: ["Sortieren", "Algorithmus"]
aliases: ["Insertion-Sort"]
created: 19th August 2023
---

# Insertion Sort

- Sortieren der ersten beiden Elemente des zu sortierenden Feldes in ein zweites, leeres Feld.
- Einfügen des 3ten Elements in die ersten beiden Elemente an die richtige Stelle. Eventuell ist ein Verschieben notwendig.
- Einfügen des 4ten Elements in die ersten drei Elemente an die richtige Stelle. Eventuell ist ein Verschieben notwendig.
- …
- Ein einmaliger Durchlauf genügt für eine Sortierung

Implementierung in C:

```c
void insSort(int *arr, int len) {
    if (arr[1] < arr[0]) {
        int temp = arr[0];
        arr[0] = arr[1];
        arr[1] = temp;
    }

    int pos = 2;
    for (pos = 2; pos < len; pos++) {
        int j;
        for (j = 0; (j < pos) && (arr[pos] >= arr[j]); j++);
        // insert-Methode fügt Element arr[pos] in das pos grosze Feld an Stelle j ein:
        insert(arr, pos, arr[pos], j);
    }
}
```

Kennzeichen:

- Speicher für ein zweites Feld erforderlich, kann auch im gleichen Feld erfolgen (siehe Beispiel)
- Verschieben kann sehr ineffizient sein
- Laufzeit: $O(n^2)$ im schlechtesten Fall. Im besten Fall (alles schon sortiert) ist dieser Algorithmus sehr effizient, nach $O(n)$ ist er fertig.
- Stabiles Sortierverfahren