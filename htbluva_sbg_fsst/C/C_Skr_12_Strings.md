# 11 Zeichenketten/Strings

- In C gibt's keinen Datentyp String, eine Zeichenkette wird durch eine Folge (also Felder) von Zeichen (char) realisiert - eine Zeichenkette.
- Um das Ende einer Zeichenkette erkennen zu können wurde das Zeichen '\0' (EOS = End Of String) vereinbart. Diese Terminierung muss in der Feld-Länge berücksichtigt werden. Um eine 5 Zeichen lange Zeichenkette zu speichern wird ein Feld mit 6 Zeichen benötigt.
- Mittels string.h stehen eine Vielzahl von hilfreichen Funktionen für die Arbeit mit Zeichenketten zur Verfügung.
- Werden Funktionen Zeichenketten als Parameter mitgegeben, dann wird eigentlich ein Zeiger auf das erste Zeichen übergeben. Die Größe des Felds kann im Inneren der Funktion nicht geprüft werden. Um sichere Funktionen zu schreiben wird daher die Länge des Feldes als Parameter mitgegeben.
- Character/Zeichen sind in C ASCII kodiert, benötigen also 1 Byte im Speicher.

## Definition

```c
char str[10];											// 10 Zeichen reserviert, Inhalt undefiniert
char str[10] = "Servus!";								 // 10 Zeichen reserviert, initialisiert
char str[10] = {'S', 'e', 'r', 'v', 'u', 's', '!', '\0'};	 // 10 Zeichen reserviert, initialisiert
char str[3] = "Hagen";									 // 3 Zeichen reserviert, initialisiert mit "Hag", kein '\0'!
char str[] = "Hagen";									 // 6 Zeichen reserviert, initialisiert
char *str = "Hagen";									 // 6 Zeichen reserviert, initialisiert und konstant
char *str; str = "Hagen";								 // 6 Zeichen reserviert, initialisiert und konstant
```

Konstant bedeutet die Zeichen können zur Laufzeit nicht verändert werden. Werden Zeiger angelegt, dann wird ja damit nicht zwangsläufig Speicherplatz dort reserviert, wo der Zeiger hinzeigt. Mit `char *str = "Hagen"` wird ein Zeiger angelegt. Zusätzlich wird dabei ein konstantes Zeichenfeld (mit Inhalt *Hagen*) auf welches der Zeiger zeigt. Der Inhalt kann daher nicht verändert werden. Der Zeiger selbst kann allerdings seinen Wert (die Adresse) verändern und damit auch auf andere Zeichenketten zeigen.

Werden Zeichenketten als Felder definiert `char str[...]`, dann kann der Inhalt des Felds verändert werden, eine Zuweisung `str1 = str2` funktioniert allerdings nicht.

C prüft eine Zeichenkette nicht auf eine abschließende '\0', allergings benötigen String-Funktionen wie printf() diese Terminierung:

```c
char str[3] = "Hallo";
printf(str);
```

Gibt in der Konsole "Hal" aus und anschließend soviele Zeichen bis im Speicher das nächste '\0'-Zeichen kommt.

## String-Funktionen

Für das Arbeiten mit Zeichenketten gibt es eine Vielzahl von hilfreichen Funktionen die mit **string.h** eingebunden werden können:

`char *strcpy(s,ct)`           Zeichenkette **ct** in Vektor **s** kopieren, inklusive **'\0'**; liefert **s.**
`char *strncpy(s,ct,n)`     höchstens **n** Zeichen aus **ct** in **s** kopieren; liefert **s**. Mit **'\0'** auffüllen, wenn **ct** 
                                                  weniger als **n** Zeichen hat.
`char *strcat(s,ct)`           Zeichenkette **ct** hinten an die Zeichenkette **s** anfügen; liefert **s**.
`char *strncat(s,ct,n)`     höchstens **n** Zeichen von **ct** hinten an die Zeichenkette **s** anfügen und **s** 
                                                  mit **'\0'** abschließen; liefert **s**.
`int strcmp(cs,ct)`              Zeichenketten **cs** und **ct** vergleichen; liefert \<0 wenn **cs<ct**, 0 wenn **cs==ct**,
                                                  oder >0, wenn **cs>ct.**
`int strncmp(cs,ct,n)`       höchstens **n** Zeichen von **cs** mit der Zeichenkette **ct** vergleichen; liefert \<0 
                                                  wenn **cs<ct**, 0 wenn **cs==ct**, oder >0 wenn **cs>ct**.
`char *strchr(cs,c)`            liefert Zeiger auf das erste **c** in **cs** oder **NULL**, falls nicht vorhanden.
`char *strrchr(cs,c)`          liefert Zeiger auf das letzte **c** in **cs**, oder **NULL**, falls nicht vorhanden,
`size_t strspn(cs,ct)`        liefert Anzahl der Zeichen am Anfang von **cs**, die sämtlich in **ct** vorkommen.
`size_t strcspn(cs,ct)`      liefert Anzahl der Zeichen am Anfang von **cs**, die sämtlich in *nicht* **ct** vorkommen.
`char *strpbrk(cs,ct)`        liefert Zeiger auf die Position in **cs**, an der irgendein Zeichen aus **ct** erstmals
                                                   vorkommt, oder **NULL**, falls keines vorkommt.
`char *strstr(cs,ct)`          liefert Zeiger auf erste Kopie von **ct** in **cs** oder **NULL**, falls nicht vorhanden.
`size_t strlen(cs)`              liefert Länge von **cs** (ohne **'\0'**).
`char *strerror(n)`              liefert Zeiger auf Zeichenkette, die in der Implementierung für Fehler **n** definiert ist.
`char *strtok(s,ct)`            **strtok** durchsucht **s** nach Zeichenfolgen, die durch Zeichen aus **ct** begrenzt sind
`void *memcpy(void \*str1, const void \*str2, size_t n)`	kopiert n Zeichen von str2 nach str1 (ohne Berücksichtigung von \0)

str**n**cpy ist strcpy gegenüber zu bevorzugen, dabei kann sichergestellt werden, dass die Länge der Zielzeichenkette nicht überschritten wird. Gleiches gilt für strcat und strcmp.

### Beispiel Zeichenketten Aufteilen

Um eine Zeichenkette in Teile aufzuspalten ist strtok() sehr hilfreich:

```c
char *strtok(char *s, const char* delim);
```

Die Zeichenkette **s** wird nach sämtlichen Einzelzeichen in **delim** (delimiter = Begrenzer) durchsucht und an deren Stelle aufgespalten. Mit jedem Aufruf wird der jeweils folgende Teilstring geliefert. Dazu wird im zu durchsuchenden Zeichenkette sämtliche Zeichen aus **delim** durch '\0' Zeichen ersetzt. Dazu ein Beispiel:

```c
char str[] = "Hallo, wie geht's?";
char *token;

token = strtok(str, " ,");	// liefert "Hallo\0" weil von Beistrich gefolgt.
token = strtok(NULL, " ,");	// liefert "\0" weil von Leerzeichen gefolgt.
token = strtok(NULL, " ,");	// liefert "wie\0" weil von Leerzeichen gefolgt.
token = strtok(NULL, " ,");	// liefert "geht's?\0" weil es am Ende steht.
token = strtok(NULL, " ,");	// liefert NULL weil die Zeichenkette zu Ende ist.
```

Für die erste Verwendung muss als Parameter die zu zerteilende Zeichenkette mitgegeben werden. Für jede weitere Verwendung muss statt der Zeichenkette NULL mitgegeben werden.

Detail: strtok() merkt sich die letzte Position in der Zeichenkette in der Funktion mittels statischer Variable. Daher dürfen keine Verschränkten Aufrufe dieser Funktion erfolgen.

## Funktionsparameter Zeichenkette

Zeichenketten können an Funktionen übergeben werden:

```c
void print1(char *str);
void print2(char str[]);
void print3(char str[10]);
```

Alle drei Formen sind gleichwertig und übernehmen in die Funktion jeweils einen Zeiger auf das erste Zeichen. Ein Aufruf von strlen(str) in den einzelnen Funktionen liefert immer die Länge des mitgegebenen Zeichenkette bis zum nächsten EOS (auch wenn das über die Länge von str hinausgehen sollte). Ein sizeof(str) liefert immer 4 - die Größe einer Zeigervariable.

Da Zeichenketten Zeiger sind, können sie auch innerhalb der Funktion verändert werden (Call-by-Reference). Um diese Änderung zu unterbinden kann der Zeiger als (const char)-Typ definiert werden:

```c
void change(const char *str);
```

Damit unterbindet der Kompiler ein Verändern der str-Variable. Wenn diese Funktion aufgerufen wird, darf man davon ausgehen, dass die Variable nicht verändert wird.

## Fragen

- Wie werden Strings in C aufgebaut?
- Wie sind die Zeichen einer Zeichenkette kodiert?
- Was ist ein EOS und wofür wird es verwendet?
- Wie lange muss eine Zeichenkette sein um das Wort "Wie" zu speichern?
- Wie kann der verfügbare Speicherplatz einer an eine Funktion übergebenen Zeichenkette ermittelt werden? 
