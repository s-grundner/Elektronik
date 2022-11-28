# 5.1 Hash-Tabellen / Assoziative Listen - Übungen

## Einführung (c286)

Erstellen Sie eine Hash-Tabelle zum Abspeichern von **Schlüssel**/**Wert**-Paaren. Die Tabelle (Array) ist 20 Elemente groß mit den Elementen `struct DataItem`:

```c
#define SIZE 20

typedef struct DataItem {
    int data;
    int key;
} TDTAITM;

TDTAITM* hashArray[SIZE];
```

Als Hash-Funktion wird verwendet: `key % SIZE`. Wenn der entsprechende Platz schon belegt ist, wird der nächste freie Platz belegt. Erstellen Sie die Funktionen `insert` und `search`

**main**:

```c
int main() {
    dummyItem = (TDTAITM*) malloc(sizeof(TDTAITM));
    dummyItem->data = -1;
    dummyItem->key = -1;

    printf("%i Elemente grosze Tabelle mit (key/value)\n", SIZE);
    insert(1, 20);
    insert(2, 70);
    insert(42, 80);
    insert(4, 25);
    insert(12, 44);
    insert(14, 32);
    insert(17, 11);
    insert(13, 78);
    insert(37, 97);

    display();

    int num = 37;
    printf("\nSuchen nach %i\n", num);
    item = search(num);

    if(item != NULL) {
        printf("Element %i found, value = %d\n", num, item->data);
    } else {
        printf("Element %i not found\n", num);
    }

    printf("\nLoeschen von Element %i\n", num);
    delete(item);

    printf("Suchen nach %i\n", num);
    item = search(num);

    if(item != NULL) {
        printf("Element %i found, value = %d\n", num, item->data);
    } else {
        printf("Element %i not found\n", num);
    }
}
```

**delete**, **display**:

```c
TDTAITM* delete(TDTAITM* item) {
    int key = item->key;

    //get the hash
    int hashIndex = hashCode(key);

    //move in array until an empty
    while(hashArray[hashIndex] != NULL) {

        if(hashArray[hashIndex]->key == key) {
            TDTAITM* temp = hashArray[hashIndex];

            //assign a dummy item at deleted position
            hashArray[hashIndex] = dummyItem;
            return temp;
        }

        //go to next cell
        ++hashIndex;

        //wrap around the table
        hashIndex %= SIZE;
    }

    return NULL;
}

void display() {
    int i = 0;

    for(i = 0; i<SIZE; i++) {

        if(hashArray[i] != NULL)
            printf(" (%d,%d)",hashArray[i]->key,hashArray[i]->data);
        else
            printf(" ~~ ");
    }

    printf("\n");
}
```

Bei der Ausführung wird damit erzeugt:

```
20 Elemente grosze Tabelle mit (key/value)
 ~~  (1,20) (2,70) (42,80) (4,25) ~~  ~~  ~~  ~~  ~~  ~~  ~~  (12,44) (13,78) (14,32) ~~  ~~  (17,11) (37,97) ~~

Suchen nach 37
Element 37 found, value = 97

Loeschen von Element 37
Suchen nach 37
Element 37 not found
```

## Ortsverzeichnis

Erstellen Sie eine Hash-Tabelle zum Speichern von Österreichischen Orten mit Ihrer Postleitzahl. Es gibt (aktuell!) mehr als 2500 unterschiedliche Postleitzahlen. Wird die letzte Stelle weggelassen wird eine relativ große Verteilung sämtlicher Werte von 100-999 erreicht. Als einfache Hash-Funktion kann daher verwendet werden:

```c++
int hash = plz / 10 - 100;
```

Zum Abspeichern wird ein Array verwendet mit einer Größe von 899 Elementen. Jedes Element enthält eine nicht sortierte, verkettete Liste.

Als Listen-Element kann angelegt werden:

```c++
typedef struct postOrt{
   char ort[MAXLEN];
   unsigned int plz;
   struct postOrt *next;
} TPLZ;
```

- Erstellen Sie die Hash-Funktion:

  ```c++
  int hashFkt(int plz);
  ```

- Erstellen Sie eine Funktion zum Einfügen eines Orts:

  ```c++
  TPLZ *insert(TPLZ *plzTab, int plz, char *ort);
  ```

- Erstellen Sie eine Funktion zum Ermitteln eines Ortsnamen:

  ```c++
  char *get(TPLZ *plzTab, int plz);
  ```

- Erstellen Sie eine Funktion zur Ausgabe eines Verzeichnisses:

  ```c++
  void ausgabe(TPLZ *, int plzVon, int plzBis);
  ```

  Ausgabe (7561-7563):

  ```
  PLZ 	Ort
  -------------------------------------------------------
  7561	Heiligenkreuz im Lafnitztal
  7562	Eltendorf
  7563	Koenigsdorf
  ```

- Erzeugen Sie eine komplette Liste. Untersuchen Sie wieviele Arrayelemente nicht belegt sind.
  Quelle: <https://www.post.at/geschaeftlich_werben_produkte_und_services_adressen_postlexikon.php>

## PLZ-Assoc (c287)

Beispiel für eine eigene assoziative Liste in C (keine Fehlerbehandlung (Array Voll ...!):

```c
#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int size;
    void **keys;
    void **values;
} hash_t;

hash_t *hash_new (int size) {
    hash_t *h = calloc(1, sizeof (hash_t));
    h->keys = calloc(size, sizeof (void *));
    h->values = calloc(size, sizeof (void *));
    h->size = size;
    return h;
}

int hash_index (hash_t *h, void *key) { 	// Hash-Funktion
    int i = (int) key % h->size;			// index % size
    while (h->keys[i] && h->keys[i] != key)
        i = (i + 1) % h->size;				// Ueberlauf -> von Vorne
    return i;
}

void hash_insert (hash_t *h, void *key, void *value) {
    int i = hash_index(h, key);
    h->keys[i] = key;
    h->values[i] = value;
}

void *hash_lookup (hash_t *h, void *key) {	// Suche nach key
    int i = hash_index(h, key);
    return h->values[i];
}

int main () {
    hash_t *h = hash_new(15);				// Neue Liste
    hash_insert(h, "Hello", "World");		// Elemente einfuegen
    hash_insert(h, "a", "b");
    printf("hello => %s\n", hash_lookup(h, "Hello")); // vorh. Element Suchen
    printf("herp => %s\n", hash_lookup(h, "herp"));   // nicht vorh.
    printf("a => %s\n", hash_lookup(h, "a"));
    return 0;
}
```

Tip: calloc = malloc mit Initialisierung auf 0