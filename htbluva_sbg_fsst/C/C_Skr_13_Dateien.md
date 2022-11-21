# 12 Dateizugriff

Grundsätzlicher Ablauf:

- Datei öffnen: dazu muss der Pfad/Name angegeben werden und auf welche Art auf die Datei zugegriffen werden soll (Schreiben, Lesen ...). Das Betriebssystem reserviert die Datei für das Programm.
- Datei bearbeiten: Lesen oder Schreiben
- Datei schließen: das Betriebssystem kann die Datei anderen Programmen zuteilen. Beim Schreibenden Zugriff auf die Datei werden die Daten zu diesen Zeitpunkt in die Datei geschrieben.

Grundsätzliche Dateitypen:

- Textdatei: Daten werden in die Datei ASCII kodiert. Das bedeutet die Zahl 5 steht in der Datei als "53". Primitve Texteditoren (notepad ...) interpretieren Dateien als ASCII-Kodiert und zeigen entsprechend den Text an.
- Binärdateien: Speichern Nummern direkt ab. Die Nummer 5 wird als 5 abgespeichert. Ein Texteditor interpretiert die Nummer 5 als ASCII-Kode und gibt dieses "Sonderzeichen" entsprechend aus - man erkennt nichts sinnvolles.

Zugriffsarten:

- Sequentiell: beim Lesen aus einer Datei wird ein Positionszeiger vom Dateianfang beginnend mit jedem Lesevorgang erhöht bis an das Ende der Datei. Die gleiche Stelle kann nicht zweimal gelesen werden.
- Wahlfrei: ein Positionszeiger kann an eine beliebige Stelle in der Datei gesetzt werden. Dort kann gelesen/geschrieben werden.

Sämtliche Ein-/Ausgaben aus einem Programm werden mittels Streams gepuffert übertragen. Das betrifft Bildschirm-, Tastatur und auch Dateizugriffe. Der Grund dafür ist die unterschiedliche Arbeitsgeschwindigkeit der beteiligten Komponenten die bei einem direkten Zugriff die Schnellere Komponente bremsen würde. Ein Vorteil der sich daraus ergibt ist, dass Aus- und Eingaben in ein Programm einfach umgeleitet werden können, indem die Zugriffe auf die entsprechenden Streams umkonfiguriert werden. Statt eines FILE*-Zeigers kann einfach der stream stdin zum Lesen von der Tastatur (anstatt von der Datei), stdout zum Schreiben in die Konsole bzw. stderr zum Schreiben eines Fehlers in die Konsole.

## Öffnen

```c
FILE* fopen(char* fname, char* mode);
```

- fname: Pfad-/Dateiname, z.B. "C:\\\\temp\\\\input.txt"
- mode: Art des Zugriffs: r für Lesen, w für Schreiben, a für Anhängen. t für Textdatei, b für Binärdatei. + für Schreib und Lesezugriff. z.B. "rt" - Lesen aus Textdatei.
- Rückgabewert: Zeiger auf Dateistruktur. Wenn Datei nicht gefunden wurde dann wird null zurückgegeben.

## Schließen

```c
fclose(FILE* fHandle);
```

- fHandle: FILE* Zeiger vom fopen.

## Textdateien

Ein Auszug von Funktionen:

### Schreiben

Ein Auszug von Funktionen zum Schreiben in eine Datei:

```c
int fprintf(FILE *f, char* controlStr, ...optParameter...);
```

Funktioniert gleich wie printf(). Zusätzlich wird die Datei mit **f** mit angegeben. Zurückgegeben wird die Anzahl der geschriebenen Zeichen oder wenn das Schreiben nicht erfolgreich war, dann -1.

###Lesen eines Zeichens

```c
int fgetc(FILE *f);
```

Liest ein Zeichen aus der Datei **f**. Wenn ein Fehler beim Lesen auftritt (EOF), dann wird -1 zurückgegeben.

### Lesen einer Zeichenkette

```c
char *fgets(char *s, int n, FILE *f);
```

Es werden entweder **n-1** Zeichen oder eine Zeile (bis '\n') aus der Datei **f** in die Zeichenkette **s**. Wenn **n** groß genug ist, dann steht am Ende '\\n' und der Terminator '\\0' in **s**. Sinnvollerweise wird **n** die Größe der Zeichenkette **s** sein (z.B. strlen(s)).

### Sonderfunktionen

Gelesen wird aus Dateien häufig bis zum Ende der Datei. Ob die aktuelle Leseposition am Ende einer Datei steht kann erkannt werden:

```c
while (feof(f) == 0) { 			// solange nicht Ende; f = Rueckgabewert von fOpen 
    ...
}
```



## Binärdateien

### Schreiben

```c
size_t fwrite(const void *ptr, size_t size, size_t n, FILE *stream);
```

Schreibt **n** Elemente der Größe **size** beginnend von **ptr** in die Datei **stream**. Zum Speichern eines einzelnen Integer-Werts: n = 1, size = 4, ptr = &intWert. Wenn ein Fehler aufgetreten ist, dann unterscheidet sich der Rückgabewert von **n**.

### Lesen

```c
size_t fread(void *ptr, size_t size, size_t n, FILE *stream);
```

Liest aus der Datei **stream** die nächsten **n** Elemente der Größe **size** und legt sie an der Adresse ptr ab. Die Funktion gibt die Anzahl der gelesenen Elemente zurück. Wenn sich die Anzahl von **n** unterscheidet, dann hat was nicht geklappt.

## Dateien mit wahlfreiem Zugriff

### Position Setzen

```c
int fseek(FILE *stream, long int offset, int origin);
```

Setzt den Zeiger (gilt für Lesen und Schreiben) in der Datei **stream** um **offset** Bytes von der durch **origin** gegebenen Positon. **origin** ist:

- SEEK_SET (0): Positionierung bezogen auf den Dateianfang
- SEEK_CUR (1): Positionierung bezogen auf die aktuelle Position
- SEEK_END (2): Positionierung bezogen auf das Dateiende nach vorne

Die Funktion gibt nicht 0 zurück wenn die Positionierung nicht geklappt hat (evtl. ausser Bereich).

### Position Lesen

```c
long int ftell(FILE *stream);
```

Gibt die aktuelle Position in der Datei **stream** zurück. Der Wert ist bezogen auf den Dateianfang in Bytes.

## Fragen

- Warum wird in eine Datei mittels Stream also gepuffert gelesen und geschrieben?
- Was für eine Bedeutung haben die Streams stdin, stderr und stdout?
- Wie lautet die grundsätzliche Abfolge beim Arbeiten mit Dateien?
- Erkläre den Unterschied zwischen einer Binär- und einer Textdatei?
- Wodurch unterscheidet sich ein sequentieller Zugriff von einem wahlfreiem Zugriff auf eine Datei?

