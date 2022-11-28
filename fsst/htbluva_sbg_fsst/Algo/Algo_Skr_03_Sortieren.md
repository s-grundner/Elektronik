# 3 Sortieren

Sortieren ist eine grundlegende Technologie der Informatik. Effiziente Sortieralgorithmen werden auch eingesetzt um in großen Datenmengen schneller Suchen zu können.

Definitionen:

- **Internes Sortieren**: Daten werden in den Arbeitsspeicher (RAM) kopiert. Es kann wahlfrei auf die einzelnen Elemente zugegriffen werden.
- **Externes Sortieren**: Daten können nicht in den Arbeitsspeicher kopiert werden (zum Beispiel zu viel). Verarbeitung auf externer Quelle.
- **Vergleichendes Sortieren**: Verwendung eines Werts aus der Sortiermenge mit dem beim Sortieren verglichen wird ("Schlüssel").
- **Stabiles Sortieren**: Sortierung die einen zusammengesetzten Datensatz richtig sortiert. Beispiel: eine *alphabetisch sortierte* Personenliste wird *nach Geburtsdatum* neu sortiert,  dann bleibt die alphabetische Sortierung für Personen mit gleichem Geburtsdatum erhalten (bei stabilen Sortieralgorithmen). 
  Sortiert ergibt für sich für die Menge 2, 1, 1, 3 -> 1, 1, 2, 3. Ein stabiler Algorithmus garantiert, dass in beiden Sätzen der erste 1er der gleiche 1er ist.

## Selection Sort (2005)

Algorithmus zum aufsteigenden Sortieren:

- Suchen des kleinsten Elements im Feld.
- Vertauschen des ersten Feld-Elements mit dem gefundenen kleinsten Element.
- Wiederum Suchen des kleinsten Elements im Feld ohne das erste Element
- Vertauschen des ersten Elements dieser neuen Menge (ohne erstem Element) mit dem gefundenen kleinsten Element (zweitkleinstes Element).
- ...

Beispiel:

```
 5   1   12   -5    2   12   14	// kleinstes Element an Index 3
-5   1   12    5    2   12   14	// Vertauschen mit nullten Element, kleinstes Element des verbleibenden Felds an Index 1
-5   1   12    5    2   12   14	// Vertauschen mit sich selbst, kleinstes Element des verbleibenden Felds an Index 4
-5   1    2    5   12   12   14	// Vertauschen mit zweiten Element, kleinstes Element des verbleibenden Felds an Index 3
-5   1    2	   5   12   12   14	// Vertauschen mit sich selbst, kleinstes Element des verbleibenden Felds an Index 4
-5   1    2	   5   12   12   14	// Vertauschen mit sich selbst, kleinstes Element des verbleibenden Felds an Index 5
-5   1    2	   5   12   12   14	// Vertauschen mit sich selbst -> Feld sortiert
```

Kennzeichen:

- Benötigt keinen weiteren Speicherplatz (nur zum Vertauschen, ist von der Feldgröße unabhängig).
- Jedes Feld wir maximal einmal vertauscht.
- Laufzeit $O(n^2)$: das Feld wird in n-Schritten nach dem kleinsten Feld durchsucht und das wird n-mal gemacht.
- Wenn sich an der ersten Stelle des Feldes der größte Wert befindet, dann müssen sämtliche kleineren Werte "vorbeigetauscht" werden.
  Verbesserung: abwechselnd Maximum und Minimum suchen und an oberes beziehungsweise unteres Ende stellen.
- Schon fertig sortierte Felder werden nicht erkannt.
- Internes Sortieren, es werden Elemente an beliebigen Positionen miteinander verglichen.
- Kann stabil oder instabile implementiert werden.

Implementierung in C:

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

## Bubble Sort (2001)

Algorithmus zum Aufsteigenden Sortieren:

- Vom ersten Element beginnend, werden zwei benachbarte Feldelemente miteinander verglichen. Ist das zweite kleiner, werden die beiden Elemente vertauscht.
- Der Vergleich und das eventuelle Vertauschen wird mit dem zweiten und dritten Element wiederholt.
- Dieser Vorgang wird bis zum letzten Element wiederholt. Dadurch ist nach diesem Durchlauf das größte Element an der letzten Stelle (es ist wie ein Bubble aufgestiegen).
- Die komplette Prozedur wird von vorne beginnend solange wiederholt bis bei einem kompletten Durchlauf keine Vertauschung mehr erfolgt.

Beispiel:

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

## Insertion Sort (2000)

- Sortieren der ersten beiden Elemente des zu sortierenden Feldes in ein zweites, leeres Feld.
- Einfügen des 3ten Elements in die ersten beiden Elemente an die richtige Stelle. Eventuell ist ein Verschieben notwendig.
- Einfügen des 4ten Elements in die ersten drei Elemente an die richtige Stelle. Eventuell ist ein Verschieben notwendig.
- ...
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

## Merge Sort (2002)

- Zerteilen eines Feldes x[0] ..  x[n-1] in zwei Teilfelder x[0] .. x[m-1] und x[m] .. x[n-1].
- Die Teilfelder werden sortiert → y[0] .. y[m-1] und z[0] .. z[n-m-1].
- Mischen der Teilfelder. Im ersten Schritt wird das kleinste Element ermittelt: x[0] = Min(y[0], z[0]), z.B. y[0]. Dann das zweit kleinste: x[1] = Min(y[1], z[0]) und so fort.
- Rekursiv kann die Teilung bis zu einem 1 großen Feld zerlegt werden.

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

- Das zu sortierende Feld kann beliebig aufgeteilt und sortiert werden, daher ist der Algorithmus zum Sortieren großer Datenmengen geeignet (einfach mittels Rekursion).
- Prinzip: Teile und Herrsche (Divide and Conquer)
- Der Mischvorgang benötigt den doppelten Speicherplatz.
- Durch die Teilung kann die Aufgabe parallelisiert werden
- Laufzeit: $O(n\cdot log_2(n))$, allgemein gilt: $log_2(n) < n$. Praktisch kann ein vermehrter Speicherzugriff höhere Laufzeiten zur Folge haben.
- Stabiles Sortierverfahren

## Quick Sort (2003)

Ein sehr häufig verwendeter Sortieralgorithmus ist der Quick-Sort (1960 C.A.R. Hoare). Der zusätzliche Speicherbedarf und der Aufwand für das Mischen beim Merge-Sort wird beim Quick-Sort vermieden. Hier wird das Feld ebenfalls in zwei Teile zerlegt und für beide Teile der Algorithmus angewandt - am Einfachsten lässt sich Quick-Sort daher rekursiv implementieren:

```c
int partition(int* array, int l, int r);

void quick_sort(int* array, int left, int right) {
    int p;

    if(left < right) {
        p = partition(array, left, right);
        quick_sort(array, left, p-1);
        quick_sort(array, p+1, right);
    }
}
```

durch `quick_sort(arr, 0, n-1);`  wird das n-Elemente große Feld arr sortiert. Die Funktion `partition(int* array, int l, int r)`  liefert einen Teilungspunkt im Feld und ordnet das Feld array dabei so um, sodass gilt:

-  array[left] .. array[p-1] sind kleiner als array[p]
-  array[p+1] .. array[right] sind größer als array[p]

 Wie gut der Algorithmus funktioniert hängt sehr stark von der partition-Funktion ab. Eine mögliche (einfache) Implementierung wird im Folgenden dargestellt:

1. Wahl eines *Pivot*-Elements (Vergleichselement, key) `k = array[left]`
2. Setzen eines Linken und Rechten Zeigers `l = array[left+1]` , `r = array[right]`
3. Verschieben des linken Zeigers nach Rechts bis gilt l > k und des rechten Zeigers nach Links bis gilt r < k.
4. Weitermachen nur wenn linker Zeiger noch Links vom rechten Zeiger.
5. Vertauschen der Elemente l und r
6. Wiederholen von 2 beginnend
7. Nun Vertauschen von k und l

Beispiel:

```
10   7  16   4   9  18  -3   8  12
 k   l                           r      key = 10, --> l nach rechts und r nach links

10   7  16   4   9  18  -3   8  12
 k       l                   r          l > key und r < key --> Elemente bei l und r vertauschen

10   7   8   4   9  18  -3  16  12
 k       l                   r          8 und 16 vertauscht --> l nach rechts und r nach links

10   7   8   4   9  18  -3  16  12
 k                   l   r              l > key und r < key --> Elemente bei l und r vertauschen

10   7   8   4   9  -3  18  16  12
 k                   l   r              -3 und 18 vertauscht --> l nach rechts und r nach links

10   7   8   4   9  -3  18  16  12
 k                      lr              l == r --> key mit (l-1) tauschen, ist die fin. Pos.
__________________________________                                               
-3   7   8   4   9  10  18  16  12
 k   l           r                      --> Neubeg. mit Seite links von einsortierten Elem. (10)

-3   7   8   4   9  10  18  16  12
 k  lr                                  l == r --> key auf (l-1) setzen, das ist die fin. Pos.
__________________________________
-3   7   8   4   9  10  18  16  12
     k   l       r                      --> Neubeg. mit Seite rechts von einsort. Elem. (-3)

-3   7   8   4   9  10  18  16  12
     k   l   r                          l > key und r < key --> Elemente bei l und r vertauschen

-3   7   4   8   9  10  18  16  12
     k   l   r                          4 und 8 vertauscht --> l nach rechts und r nach links

-3   7   4   8   9  10  18  16  12
     k      lr                          l == r --> key auf (l-1) setzen, das ist die fin. Pos.

-3   4   7   8   9  10  18  16  12
     k      lr                                 

...
```

Implementierung eines Suchschritts in C:

```c
int partition(int* array, int l, int r) {
    int i, j, t, key;

    /* Schluessel - 1.Element */
    key = array[l];
    i=l+1;
    j=r;

    /* Schleife fuer Elemente von links und rechts */
    for(;;) {
        /* Elemente bis zum ersten der rechten Haelfte durchlaufen */
        while( array[i] <= key && i < r )
            i++;

        /* Elemente bis zum ersten der linken Seite durchlaufen */
        while( array[j] >= key && j > l )
            j--;

        /* Abbruch:  */
        if (i >= j) break;

        /* beide vertauschen */
        t = array[i];
        array[i] = array[j];
        array[j] = t;
    }

    /* letztes Element der rechten Haelfte mit dem ersten Element vertauschen */
    t = array[j];
    array[j] = array[l];
    array[l] = t;

    return j;
}
```

Kennzeichen:

- Zu sortierendes Feld wird durch den Algorithmus in kleinere Bereiche geteilt. Daher ist Quick-Sort für große Datenmengen geeignet.
- Prinzip Teile und Herrsche (Divide and Conquer)
- Mischen (Merge) wird hier vermieden. Die Zerlegung erfolgt anhand von Pivot-Elementen (Key)
- Laufzeit im Mittel $O(n\cdot log(n))$ (wenn die Partitionierung zwei annähernd gleich große Teile erzeugt) und im schlechtesten Fall $O(n^2)$. Die Laufzeit hängt sehr stark von der Wahl des Pivot-Element (key) ab. Beispiel: wenn als Pivot-Element das erste Teilelement gewählt wird und das Feld bereits sortiert ist, dann muss die Partitionierung n mal durchlaufen werden.
- Instabiles Sortierverfahren

## C-Standard-Bibliotheksfunktion qsort

In der C-Standard-Bibliothek wird die Funktion qsort (Quick Sort) angeboten. Da diese beliebige Felder sortieren können soll wird mittels void-Zeiger gearbeitet. Um zwei abstrakte Elemente miteinander vergleichen zu können ist der Funktion eine Vergleichsfunktion zu übergeben:

```c
void qsort( void * array, size_t elementCount, size_t size, int (*compare)(const void *, const void *) );
```

- array: Zeiger auf das erste Element des zu sortierenden Arrays
- elementCount: Anzahl der Elemente im Array 
- size: Größe eines einzelnen Elementes (in Bytes)
- compare: Vergleichsfunktion, um zwei Elemente miteinander zu vergleichen. 

Die Vergleichsfunktion (Parameter compare) muss zwei Aufrufparameter haben, die beiden Werte die verglichen werden sollen und als Rückgabewert einen Integer. Der Integer muss einen Wert kleiner Null, wenn der erste Parameter größer als der zweite Parameter ist, er muss einen Wert größer Null, wenn der erste Parameter kleiner als der zweite Parameter ist und er muss Null annehmen, wenn die Werte der beiden Parameter gleich sind.

Beispiel:

```c
int compare(const void * a, const void * b) {
    return ( *(int*)a - *(int*)b );
}
```

für numerische Integer-Felder. Im Funktionsaufruf:

```c
... qsort(......., compare);
```

## Sortierung über Referenzen

Es gibt häufig die Forderung ein Array zu sortieren in welchem die Elemente große Strukturen sind. Der Zeitbedarf von Sortieralgorithmen ist maßgeblich durch den Zeitaufwand durch eine Verschiebung (kopieren) der Elemente im Feld geprägt. Wenn anstatt der Strukturen lediglich ein Zeiger auf die Elemente verändert wird kann der Zeitaufwand eventuell deutlich verringert werden.

## Laufzeitbewertung

Die Laufzeit von Algorithmen kann nicht eindeutig bestimmt werden. Sie hängt von vielen allgemeinen Faktoren (Hardware, Betriebssystem, Software ...) als auch von den speziellen Eigenheiten der Startwerte ab. Sortieren eines schon fast fertig sortierten Felds kann zum Beispiel sehr viel schneller ablaufen als ein vollständig durchmischtes Feld. Um die Laufzeit unterschiedlicher Algorithmen trotzdem vergleichen zu können wird ihr Zeitverhalten in Abhängigkeit der Anzahl der Elemente betrachtet. Zum Beispiel ist für den oben erwähnten Selection-Sort ersichtlich, dass sich die Sortierzeit mit dem Quadrat der Anzahl der Elemente verändern wird. Dargestellt wird das mittels der **O-Notation** (O für Ordnung): der Selection-Sort hat ein Laufzeitverhalten **$O(n^2)$**, sprich sie hat ein Verhalten *in der Ordnung von $n^2$*.

## Referenzen

- C-Bibliotheksfunktion qsort:

  https://www.tutorialspoint.com/c_standard_library/c_function_qsort.htm

- Viele Sortieralgorithmen mit JS Implementierung:

  http://khan4019.github.io/front-end-Interview-Questions/sort.html

## Fragen

- Welche Such-Algorithmen kennen Sie?
- Wodurch unterscheiden sich die unterschiedlichen Sortieralgorithmen?
- Wie kann die Sortierdauer unterschiedlicher Algorithmen verglichen werden?
- Wie kann die Sortierung von Struktur-Feldern beschleunigt werden?

