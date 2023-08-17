# 5 Dynamische Datenstrukturen - Übungen

## Einfach verkettete Liste (c280)

Erstellen Sie eine einfach verkettete Liste ohne Listenkopf. Jedes Element der Liste kann eine Ganzzahl aufnehmen.

Knoten-Struktur:

```c
struct SNODE {
    int dta;
    struct SNODE *next;
};
typedef struct SNODE TNODE;
```

Die Verwendung der Liste soll so aussehen:

```c
TNODE *lst = crtListe(12);      // neue Liste erstellen
print(lst);

push(lst, 99);                  // neuer Listenknoten
print(lst);

push(lst, 37);                  // neuer Listenknoten
print(lst);

printf("Groesze: %i\n", size(lst));


printf("rmv: %i\n", rmv(lst, 2));
print(lst);

printf("Element an Stelle 0: %i\n", getElem(lst, 0));

printf("Neues Element 3 an Stelle 2: %i\n", insert(lst, 2, 3));
print(lst);

printf("Verschieben von 0 nach 2: %i\n", move(lst,0,2));
print(lst);
```

Die Knoten innerhalb der Liste können nur erreicht werden über Durchbewegen beginnend vom Listenbeginn. 

- Erstellen Sie eine Funktion zum Ermitteln der Anzahl der Elemente der Liste - `size(list)`
- Erstellen Sie eine Funktion zum Einfügen eines Elements an einer gegebenen Stelle - `insert(list, pos, val`)
- Erstellen Sie eine Funktion zum Löschen eines Elements an einer gegebenen Stelle - `rmv(list, pos)`
- Erstellen Sie eine Funktion zum Verschieben eines Elements von einer gegebenen Stelle an eine gegebene Stelle `move(list, from, to)`
- Erstellen Sie eine Funktion zum Sortieren der Liste `sort(list)`

### Einfach verkettete Liste - Quersumme

Traversieren Sie durch die einfach verkettete List und ermitteln dabei die Summe sämtlicher Daten-Elemente.

### Einfach verkettete Liste - Maximum

Traversieren Sie durch die einfach verkettete List und ermitteln den maximalen Wert der Daten-Elemente.

## Doppelt verkettete Liste (c283)

Erstellen Sie eine doppelt verkettete Liste für int-Elemente. Die Header-Datei:

```c
typedef int TYP;

typedef struct SNODE {
    TYP data;
    struct SNODE *next;
    struct SNODE *prev;
} TNODE;

typedef struct SHEADER {
    int size;
    TNODE *first;
    TNODE *last;
} THEADER;

THEADER *print(THEADER *lst);
THEADER *crt();
THEADER *add(THEADER *lst, TYP val);
THEADER *del(THEADER *lst, int pos);
THEADER *ins(THEADER *lst, int pos, TYP val);
THEADER *sort(THEADER *lst);
TNODE   *get(THEADER *lst, int pos);
THEADER *swap(THEADER *lst, int pos1, int pos2);
```

## Einfach verkettete Liste - MINISH (c281)

- Bringen Sie das Programm **minish** zum Laufen.

Es wird ein Programm minish (Minishell) entwickelt, das eine Historie von eingegebenen Befehlen in einer Liste speichert. Ein Listenknoten TNODE enthält einen String (das eingegebene Kommando). Als Listenkopf soll eine eigene Knotenstruktur THEADER dienen:

<img src="./bilder/ListMinish.png"/>

Header/Kopf:

```c
/* -- Ein Kopf-Knoten, der die Listenlaenge enthaelt */
typedef struct {
    int size;                 // Anzahl Elemente
    TNODE *first, *last;      // Zeiger auf erstes und letztes Element
} THEADER;
```

Knoten:

```c
/* -- TNODE Knoten */
typedef struct SList {
    char *dta;            // Kommando
    struct SList *next;   // Zeiger aufs naechste Element
} TNODE;
```

Grobentwurf von minish:

```c
#include "strlist.h"
...
int main() {
    THEADER* cmdList;
    cmdList = createList();
    
    printf(prompt);
    fgets(eingabe);        // Einlesen des Kommandos

    while (eingabe != "quit") {
        insertFirst(cmdList, eingabe);    // Kommando in Liste aufnehmen
        exec(eingabe);                    // Kommando ausfuehren
    }
    ...
}
```

Im Sinne des Information-Hiding wollen wir mittels **Datenkapselung** den Zugriff auf die tatsächlichen Knoten und Listenheader nur mittels **Zugriffsfunktionen** realisieren. D.h. wir bauen einen ADT (Abstrakten DatenTyp) namens TNODE. Als Prototypen wollen wir:

```c
// strlist.h
THEADER *createList(void);              // Erzeugen des Header-Elements
TNODE *insertFirst(THEADER *, char *);  // Einfuegen Kommando am Beginn der Liste
TNODE *insertLast(THEADER *, char *);   // Einfuegen Kommando am Ende der Liste
void deleteFirst(THEADER *);            // Loeschen des ersten Elements
void deleteLast(THEADER *);             // Loeschen des letzten Elements
void pr_List(THEADER *, FILE *);        // Ausgeben der Liste auf stream
void rm_List(THEADER *);                // Loeschen der gesamten Liste
char *get_entryList(THEADER *, int n);  // Das nte Element aus der Liste holen
```

Das Testprogramm minish.c:

```c
/*
 * Datei: minish.c
 * gcc minish.c strlist.c -o minish
 * Nutzt die verkettete Liste (strlist.h strlist.c)
 * Implementiert eine minishell
 */
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>
#include "strlist.h" 

enum BOOL {false,true};
typedef enum BOOL BOOLEAN;

char help[] =
    "\nMINISHELL::HELP\n \
    hi   ............. history\n \
    !#   ............. execute #th command\n \
    !save Filename ... save history list\n \
    !load Filename ... load history list from Filename\n \
    !do  ............. execute current history list\n \
    quit ............. quit MINISHELL\n\n";

char prompt[] = "\nminish-> ";

#define MAXCMD   128
char cmd[MAXCMD];           /* enthaelt eingelesenes Kommando */
THEADER *cmdList;           /* History Liste                  */
void do_history();

int main() {
    BOOLEAN end=false;

    /* --------------------------------------------
     * Liste zur Speicherung der Kommandos erzeugen
     * --------------------------------------------*/
    cmdList = createList();
    if (cmdList == (THEADER *) NULL) {
        fprintf(stderr, "Not enough memory\n");
        exit(1);
    }

    /* ----------------------
     * Logo und help ausgeben
     * ----------------------*/
    printf("\nMINISHELL:: (Hofmann Anton, ::Demo fuer verkettete Listen\n");
    printf(help);

    /* -------------------------------------------
     * Hauptschleife zur Verarbeitung der Eingaben
     * -------------------------------------------*/
    while (end == false){
        /* -- Prompt ausgeben und Kommando einlesen */
        printf(prompt);
        fgets(cmd, MAXCMD, stdin);
        cmd[strlen(cmd)-1] = '\0';

        /* -- Kommando verarbeiten */
        if (strcmp(cmd, "hi") == 0)        /* -- history ausgeben */
            pr_List(cmdList, stdout);

        else if (strcmp(cmd, "help") == 0) /* -- Hilfe ausgeben   */
            printf(help);

        else if (cmd[0] == '!')            /* -- Kommando aus history */
            do_history();

        else if (strcmp(cmd, "quit") == 0) { /* -- MINISHELL beenden  */
            rm_List(cmdList); /* Liste freigeben */
            end = true;
        }
        else {            /* -- Kommando in history eintragen u. ausfuehren */
            insertLast(cmdList, cmd);
            system(cmd);
        }
    }/* end_while */
}/*end_main*/

void do_history() {
    int number;
    FILE *fp;

    if (strncmp(cmd+1, "save", 4) == 0) {   /* -- SAVE history */
        fp = fopen(cmd + 6, "w");
        if (fp == (FILE *)NULL)
            perror(cmd + 6);
        else {
            pr_List(cmdList, fp);
            fclose(fp);
        }
    } else if (strncmp(cmd+1, "load", 4) == 0) { /* -- LOAD history list */
        fp = fopen(cmd + 6, "r");
        if (fp == (FILE *) NULL)
            perror(cmd + 6);
        else {
            rm_List(cmdList);     /* remove history list and build a new one from file */
            cmdList = createList();
            if (cmdList == (THEADER *)NULL)
                fprintf(stderr, "Not enough memory\n");
            else {
                while(fgets(cmd, MAXCMD, fp)) { 
                    cmd[strlen(cmd) - 1] = '\0';  /* loesche '\n'*/
                    insertLast(cmdList, cmd+7);
                }
            }
        }
    } else if (strncmp(cmd+1, "do", 2) == 0) {/* -- EXECUTE current hi list */  
        int i;
        char * cmdPtr;

        for (i = 1; cmdPtr = get_entryList(cmdList,i); i++) {
            printf("%s%s\n", prompt, cmdPtr);
            system(cmdPtr);
        }
    } else if (isdigit(cmd[1])) {       /* -- EXECUTE #th history command */
        number = atoi(cmd+1);
        system(get_entryList(cmdList, number));
    }
}/* end_do_history */
```

Ergänzen Sie minish.h, minish.c, strlist.h, strlist.h um obiges minish.c zum Laufen zu bekommen.

## Erweiterung MINISH

Erweitern Sie das MINISHELL-Programm mit folgendem Befehl    `!sort  ........... sorts the list\n \`

Beschreibung:
Wenn der Benutzer `!sort` eingibt, soll die Liste der Befehle sortiert werden. Der Anwender kann dies dann durch Eingabe des Befehles `hi` kontrollieren.

Hinweis:
Auszug der Header-Datei für den Listen-Modul: _strlist.h_

```c
// -----------------------------------------------------
// MAB: sortList
// -----------------------------------------------------
extern void sortList(THEADER*);
```

Hinweis:
Beim Sortieren der Liste genügt es, wenn bei zwei zu vergleichenden Listenknoten die dta-Komponenten  (sind ja char*) ausgetauscht werden (die verbindenden Zeiger können belassen werden).

Hinweis:
Der Sortieralgorithmus wird lesbarer, wenn Sie für den Zugriff auf z.B. zwei benachbarte Listenknoten eine  **lokale** Hilfsfunktion schreiben.

```c
static TNODE* get_NodeList(THEADER* aList, int number){
      ????????????
}
```

## Einfach verkettete Liste - STACK (c284 list, c288 array)

- Erstellen Sie **stack.h/stack.c** unter Verwendung der einfach verketteten Liste. Der Stack soll int-Werte speichern.

  Funktionen: `createstack()`, `push()`, `pop()`, `top()`, `deleteStack()`

- Erstellen Sie ein Testprogramm zum Testen Ihrer Funktionen.

## Doppelt verkettete Liste - QUEUE (c289)

- Erstellen Sie **queue.h/queue.c** unter Verwendung

  der doppelt verketteten Liste. Die Queue (FIFO) soll

  int-Werte speichern. 

  ```c
  typedef struct SNODE {
      int dta;
      struct SNODE *prev;
      struct SNODE *next;
  } TNODE;
  
  typedef struct SHDR {
      int size;
      TNODE *first;
      TNODE *last;
  } THDR;
  ```

  Funktionen: 

  ```c
  THDR *init();
  void push(THDR *buf, int val);
  int pop(THDR *buf);
  ```

  pop entnimmt ein Element aus der Queue.

- Erstellen Sie ein kleines Testprogramm zum Testen Ihrer Funktionen.

  ```c
  THDR *buf = init();
  push(buf, 1);
  push(buf, 2);
  push(buf, 3);
  push(buf, 4);
  push(buf, 5);
  push(buf, 6);
  
  printf("%i ", pop(buf));
  push(buf, 7);
  printf("%i ", pop(buf));
  push(buf, 8);
  printf("%i ", pop(buf));
  push(buf, 9);
  printf("%i ", pop(buf));
  push(buf, 10);
  printf("%i ", pop(buf));
  push(buf, 11);
  printf("%i ", pop(buf));
  
  while (buf->size != 0)
      printf("%i ", pop(buf));
  ```

## Binärer Suchbaum (c285)

Erzeugen Sie für einen binären Suchbaum:

- Eine Struktur `TNODE` für einen Baum-Knoten der eine Nummer aufnehmen kann (`data`, `right`, `left`)
- Eine Funktion `insert` für das Einfügen eines Knotens im Baum (sortiert, keine Berücksichtigung von doppelten Werten)
- Erzeugen Sie die Traversierfunktionen `inorder`, `postorder` und `preorder` welche die Werte in die Konsole ausgeben
- Erzeugen Sie eine Löschen-Funktion `remove` um einen Wert aus dem Baum zu löschen
