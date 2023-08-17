# 2 Suchen in Feldern - Übungen

## Sequentielle Suche im Struktur-Array (2051)

- Es soll sequenziell in einem Array gesucht werden
- Das Array besteht aus Person-Strukturelementen bestehend aus einer Personalnummer und einem Namen
- Eine erste Suchfunktion sucht nach einem Namen wobei die Funktion iterativ implementiert werden soll.
- Eine zweite Suchfunktion sucht nach einer Personalnummer. Hier soll die Funktion rekursiv implementiert werden.

Vervollständigen Sie das Programm **main.c**:

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    int persnr;
    char name[80];
} TPERSON;

// F-decl
// ------------------------------------------------------------------------
TPERSON* mySearchName(TPERSON* key, TPERSON* a, int len) {
    // gesucht wird nach der Strukturkomponente name
    // wenn key->name im Array a vorhanden ist, wird
    // die Adresse des gefundenen Elementes in a zurückgegeben.
    // wenn nicht vorhanden, wird NULL zurückgegeben.
    // Algorithmus: sequentielle Suche (iterativ)

    return NULL;
}

TPERSON* mySearchPersonNrRek(TPERSON* key, TPERSON* a, int len) {
    // gesucht wird nach der Strukturkomponente persnr
    // wenn key->persnr im Array a vorhanden ist, wird
    // die Adresse des gefundenen Elementes in a zurückgegeben.
    // wenn nicht vorhanden, wird NULL zurückgegeben.
    // Algorithmus: sequentielle Suche (rekursiv)

    return NULL;
}


int main() {

    TPERSON name[5]={
        {1, "Singer"},
        {7, "Geher"},
        {3, "Bierer"},
        {2, "Maurer"},
        {4, "Ziegler"}
    };

    TPERSON* pgefunden;
    TPERSON search;
    int i;
    
// ---------------------------------------------------------------------
//ausgabe
    printf("PERSONS .................\n");
    for (i=0; i < 5; i++)
    {
        printf("%5d: <%s>\n", name[i].persnr, name[i].name);
    }
    printf("\n");

    printf("Enter Name to search: ");
    scanf("%s", search.name);

    pgefunden= mySearchName(&search, name, sizeof(name)/sizeof(name[0]));

    if (NULL==pgefunden) {
        printf("NOT FOUND: <%s> \n", search.name);
    }
    else {
        printf("FOUND: %-5d %s\n", pgefunden->persnr, pgefunden->name);
    }
// ---------------------------------------------------------------------
//ausgabe
    printf("\n\nPERSONS .................\n");
    for (i=0; i < 5; i++) {
        printf("%5d: <%s>\n", name[i].persnr, name[i].name);
    }
    printf("\n");

    printf("Enter PersNr to search: ");
    scanf("%i", & search.persnr);

    pgefunden= mySearchPersonNrRek(&search, name, sizeof(name)/sizeof(name[0]));

    if (pgefunden==NULL) {
        printf("NOT FOUND: Persnr= <%i> \n", search.persnr);
    }
    else {
        printf("FOUND: %-5d %s\n",pgefunden->persnr, pgefunden->name);
    }
    return 0;
}
```

## Binäre Suche im Integer Feld (2052)

- Es soll binär in einem Integer-Array gesucht werden
- Eine erste Funktion sucht binär mittels iterativer Lösung
- Eine zweite Funktion sucht binär mittels rekursiver Lösung

Beheben Sie die Fehler und vervollständigen Sie das Programm:

```c
#include <stdio.h>

// iterative Version
int iter_binsearch(int key, int* a; int l, int r){
    //????????????????????????
    return -1;
}

// rekursive Version
int rec_binsearch(int key, int* a; int l, int r){
    //???????????????????????????????
    return -1;
}

#define LEN 25

int main(){
    int arr[LEN]={1,18,25,70,900};
    int key=70;
    int idx;
	
    printf("\nint-Array ...\n ");
    for( i=0; i< LEN; i++)
        printf("%4i ", arr[i]);

    printf("\n1. recursive binary Search");
    printf("\n2. iterative binary Search\n");
    scanf("%i", &algo);
	
    if (algo== 1)
        idx= rec_binsearch(key, arr, 0, LEN-1);
    else
        idx= iter_binsearch(key, arr, 0, LEN-1);
	
    if (idx==-1)
        printf("\n%i not found\n" , key);
    else
        printf("\n%i found at index %i\n" , key, idx);	
    return 0;
}
```

## Binäre Suche in Struktur-Feld (2053)

- Es soll binär in einem Strukturen-Array gesucht werden
- Eine erste Funktion sucht binär nach dem Namen
- Eine zweite Funktion sucht binär nach der Personalnummer

Vervollständigen Sie das Programm:

```c
// structMyBsearch.c
// Name:

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    int persnr;
    char name[80];
} TPERSON;

// F-decl
// ------------------------------------------------------------------------
TPERSON* myBsearchName(TPERSON* key, TPERSON* a, int left, int right) {
    // gesucht wird nach der Strukturkomponente name
    // wenn key->name im Array a vorhanden ist, wird
    // die Adresse des gefundenen Elementes in a zurückgegeben.
    // wenn nicht vorhanden, wird NULL zurückgegeben.
    // Algorithmus: binäre Suche (iterativ)

    ?????????????????????????  
}

TPERSON* myBsearchPersonNrRek(TPERSON* key, TPERSON* a, int left, int right){
    // gesucht wird nach der Strukturkomponente persnr
    // wenn key->persnr im Array a vorhanden ist, wird
    // die Adresse des gefundenen Elementes in a zurückgegeben.
    // wenn nicht vorhanden, wird NULL zurückgegeben.
    // Algorithmus: binäre Suche (rekursiv)
    ???????????????????????
}
// main
// --------------------------------------------------------------------
int main(){
    // WEIL die Arrays für die binäre Suche sortiert sein müssen,
    // verwenden wir 2 Arrays:
    TPERSON wirName[5]= {
      {23, "Bierer"},
      {23, "Geher"},
      {-23, "Maurer"},
      {3, "Singer"},
      {93, "Ziegler"}
    };

    TPERSON wirNummer[5]= {
      {-23, "Maurer"},
      {3, "Singer"},
      {23, "Geher"},
      {23, "Bierer"},
      {93, "Ziegler"}
    };

    TPERSON* pgefunden;
    TPERSON search;
    int i;

    //ausgabe
    printf("PERSONS sorted by Name .................\n");
    for (i=0; i < 5; i++){
        printf("%5d: <%s>\n", wirName[i].persnr, wirName[i].name);
    }
    printf("\n");
	
    printf("Enter Name to search: ");
    scanf("%s", search.name);

    pgefunden= myBsearchName(&search, wirName, 0, 4);

    if (NULL==pgefunden){
        printf("NOT FOUND: <%s> \n", search.name);
    }
    else{
        printf("FOUND: %-5d %s\n", pgefunden->persnr, pgefunden->name);
    }
// ---------------------------------------------------------------------
//ausgabe
    printf("\n\nPERSONS sorted by Persnr .................\n");
    for (i=0; i < 5; i++){
        printf("%5d: <%s>\n", wirNummer[i].persnr, wirNummer[i].name);
    }
    printf("\n");

    printf("Enter PersNr to search: ");
    scanf("%i", & search.persnr);

    pgefunden= myBsearchPersonNrRek(&search, wirNummer, 0, 4);

    if (NULL==pgefunden){
        printf("NOT FOUND: Persnr= <%i> \n", search.persnr);
    }
    else{
        printf("FOUND: %-5d %s\n",pgefunden->persnr, pgefunden->name);
    }
    return 0;
}
```

## Binäre Suche in Struktur-Feld mittels bsearch() (2054)

Lösen Sie das vorangegangene Beispiel unter Verwendung der C-Funktionen bsearch().

## Visuelle Darstellung von Suchverfahren - Sequenzielle Suche

Erweitern Sie den js-Worker-Code so, dass die HTML-Datei VisuellSuchenSeq.html funktioniert (für Chrome funktioniert der Web-Worker nur wenn die Seite von einem Server geladen wird. In Internetexplorer/Firefox funktioniert der Web-Worker auch lokal).

## Allgemeine Binäre Suche im Pointerfeld

Die Funktion soll unter folgenden Bedingungen funktionieren

- Aufruf mit `void *bsearch(const void *key, const void *base, int nitems, int size, int (*comp)(const void *, const void *))`
- Feld mit `void`-Pointern
- Binäre-Suche in diesem Feld, der Vergleich erfolgt mit einer mitgegebenen Funktion: `int (*comp)(const void*, const void*)`
    - die Funktion gibt 0 zurück wenn die beiden Pointer auf gleiche Inhalte zeigen
    - die Funktion gibt einen Wert kleiner Null zurück wenn der erste Pointer auf einen kleineren Wert als der zweite Pointer zeigt
    - umgekehrt, wenn Pointer Zwei auf einen kleineren Wert als Pointer Eins zeigt.

main.c für einen Test:

```c
#include <stdio.h>
#include <stdlib.h>

int comp(const void*, const void*);
void *binsearch(void *key, void *base, int nitems, int size, int (*comp)(const void *, const void *));

void print(int *arr, int size) {        // output
    for (int i=0; i<size; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

int main() {
    int arr[] = {1,3,5,7,9,11,13,15,17,19,21};
    int nitems = sizeof(arr) / sizeof(arr[0]);
    int size = sizeof(arr[0]);
    print(arr, nitems);

    int num = 7;
    int *ptr = binsearch(&num, arr, nitems, size, comp);
    printf("Search for: %d, Found: %p, %i\n", num, ptr, *ptr);
    print(arr, nitems);

    num = 1;
    ptr = binsearch(&num, arr, nitems, size, comp);
    printf("Search for: %d, Found: %p, %i\n", num, ptr, *ptr);
    print(arr, nitems);
    
    num = 21;
    ptr = binsearch(&num, arr, nitems, size, comp);
    printf("Search for: %d, Found: %p, %i\n", num, ptr, *ptr);
    return 0;
}

void *binsearch(void *key, void *base, int nitems, int size, int (*comp)(const void *, const void *)) {
    // ..............................
}

int comp(const void *a, const void *b) {    // for usage with int-Arrays
    return *(int*)a - *(int*)b;
}
```

## Visuelle Darstellung von Suchverfahren - Binäre Suche

Erweitern Sie den js-Worker-Code so, dass die HTML-Datei VisuellSuchenBin.html funktioniert.

Für die Entwicklung sehr komfortabel ist die Variante mit VSCode:

- in VSCode wird das Plugin `Live Server (Ritwick Dey)` installiert
- der Ordner mit der Sortier-Seite wird in VSCode geladen
- Zur Ausführung wird im Kontext-Menü der HTML-Datei `Open with Live Server` ausgeführt.
