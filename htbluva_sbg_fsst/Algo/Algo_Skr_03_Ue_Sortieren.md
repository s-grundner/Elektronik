# 3 Sortieren - Übungen

## Bubble Sort für int/txt/struct-Array (2006)

Das folgende Programm soll:

- ein int-Array
- ein zweidimensionales Text-Array
- ein struct-Array (sortiert nach der Personalnummer)

mit folgenden Algorithmen sortieren:

- intBubbleSort(), txtBubbleSort(), structBubbleSort()
- qsort() - die C-Funktion aus der C-Library

Bringen Sie das folgende Programm zum Laufen:

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Type decl
// –-----------------------------------------------------------
typedef struct {
  int persnr;
  char name[80+1];
} TPERSON;

// Func-Decl.
// –-----------------------------------------------------------
void intPrint(int* a, int len);
void txtPrint(char txt[][80+1], int lines);
void structPrint(TPERSON* alle, int len);

void intBubbleSort(int* a, int len);
void txtBubbleSort(char txt[][80+1], int lines);
void structBubbleSort(TPERSON* alle, int len); // Sort by Name

// Func-Decl f. Lib-qsort
// –-----------------------------------------------------------
int comp_int(const void* pa, const void* pb);
int comp_txt(const void* pa, const void* pb);
int comp_struct_name(const void* pa, const void* pb);

int main(){
    // Array def.
    int arr[] = {7, 23, -9, 12, 3};
    char txt[][80+1] = {
      "wiese",
      "wald",
      "blume",
      "baum",
      "pilz"
    };

    TPERSON wir[] = {
      {34,  "zeppelin"},
      {134, "maier"},
      {3,   "mustermann"},
      {11,  "wiese"},
      {4,   "pilz"}
    };

#define BUBBLESORT
#ifdef BUBBLESORT
    printf("\nVOR dem Sortieren mit BUBBLESORT ...\n");
    intPrint(arr, sizeof(arr)/sizeof(arr[0]));
    txtPrint(txt, sizeof(txt)/sizeof(txt[0]));
    structPrint(wir, sizeof(wir)/sizeof(wir[0]));
	
    intBubbleSort(arr, sizeof(arr)/sizeof(arr[0]));
    txtBubbleSort(txt, sizeof(txt)/sizeof(txt[0]));
    structBubbleSort(wir, sizeof(wir)/sizeof(wir[0]));
	
    printf("\nNACH dem Sortieren mit BUBBLESORT...\n");
    intPrint(arr, sizeof(arr)/sizeof(arr[0]));
    txtPrint(txt, sizeof(txt)/sizeof(txt[0]));
    structPrint(wir, sizeof(wir)/sizeof(wir[0]));
#endif	
	
#ifdef QSORT
    printf("\nVOR dem Sortieren mit QSORT ...\n");
    intPrint(arr, sizeof(arr)/sizeof(arr[0]));
    txtPrint(txt, sizeof(txt)/sizeof(txt[0]));
    structPrint(wir, sizeof(wir)/sizeof(wir[0]));
	
    qsort(arr, sizeof(arr)/sizeof(arr[0]), sizeof(arr[0]), comp_int);
    qsort(txt, sizeof(txt)/sizeof(txt[0]), sizeof(txt[0]), comp_txt);
    qsort(wir, sizeof(wir)/sizeof(wir[0]), sizeof(wir[0]), comp_struct_name);
//    qsort(wir, sizeof(wir)/sizeof(wir[0]), sizeof(wir[0]), comp_struct_persnr);
	
    printf("\nNACH dem Sortieren mit QSORT...\n");
    intPrint(arr, sizeof(arr)/sizeof(arr[0]));
    txtPrint(txt, sizeof(txt)/sizeof(txt[0]));
    structPrint(wir, sizeof(wir)/sizeof(wir[0]));
#endif	

    return 0;
}

void intPrint(int* a, int len){
    int i;
    for(i=0; i < len;i++)
        printf("%3i, ", a[i]);
    printf("\n");
}

void txtPrint(char txt[][80+1], int lines) {

}

void structPrint(TPERSON* alle, int len) {

}

void intBubbleSort(int* a, int len) {
    int completed = 0;
    int i, h;
    while(completed == 0){
        completed = 1;
        for(i = 0; i < len-1; i++){
            if(a[i] > a[i+1]){
                h = a[i];
                a[i] = a[i+1];
                a[i+1] = h;
				
                completed = 0;
            }
        }
    }
}

void txtBubbleSort(char txt[][80+1], int lines){

}

void structBubbleSort(TPERSON* alle, int len){

}

// Vergleichsfunktionen f. qsort
// –-----------------------------------------------------------

```

## Bubble PtrSort (2007)

Allgemeine Aufgabenstellung:

Gegeben ist folgender Typ:

```c
typedef struct {
  int persnr;
  char name[80];
} TPERSON;
```

- Definieren Sie ein *anzahl* großes Array:
  `TPERSON wir[] = {{123, "Max Muster"}, {44, "Susi Wiese"}, {1, "Fritz Wald"}};`

- definieren Sie zusätzlich das Array `TPERSON** p;` (dynamische Größe möglich) bzw. `TPERSON *p[anzahl]`.

  das nach dem Einlesen der Daten folgenden Inhalt hat:
  ​	p[0] zeigt auf wir[0]
  ​	p[1] zeigt auf wir[1]
  ​	...

- Sortieren (mit qsort()) Sie nun nicht die Daten (im Array wir), sondern das Array p.
  Das Array wir bleibt also unverändert!!!

- Bei der sortierten Ausgabe verwenden Sie das Array p.

- Wenn mit dynamischer Speicherreservierung gearbeitet wird: free() nicht vergessen.

<img src="./bilder/ptrQsort.png" width="500">

> Wichtig: wenn Arrays mit großen Strukturen sortiert werden sollen, kann ein Sortieren von Zeigern auf das Feld schneller sein, da weniger Daten umkopiert werden müssen.

## myBubbleSort (2008)

Schreiben Sie eine Sortierfunktion *myBubbleSort()*, die beliebige Arrays sortieren kann. Verwenden Sie zum Umsortieren mit einer Hilfsvariable, die Funktionen memcpy(), malloc() und free(). Testen Sie Ihre Funktion mit dem folgenden Testprogramm:

```c
#define SIZE 5
int main(int argc, char *argv[]){
    int a[SIZE];
    int i;    
    TPERSON wir[SIZE]= {{23, "Geher"}, {3, "Singer"}, {23, "Bierer"},{-23, "Maurer"},{93, "Ziegler"}};
    srand(time(NULL));
    for (i=0; i < SIZE; i++)
        a[i]= rand()%100;
        
    myBubbleSort(a, SIZE, sizeof(a[0]), compare);
    
    printf("\nINT Array sortiert ************************************\n");
    for (i=0; i < SIZE; i++)
        printf("%d ", a[i]);
    printf("\n");

    myBubbleSort(wir, SIZE, sizeof(wir[0]), compare_persnr);
    
    printf("\nPERSON nach persnr sortieren  *************************\n");
    for (i=0; i < SIZE; i++)
        printf("%3d %s\n", wir[i].persnr, wir[i].name);
    printf("\n");                	
    return 0;
}
```

Die Vergleichsfunktionen sind so definiert:

`int compare(const void *pa1, const void *pa2);`

Die Funktion *myBubbleSort()*  ist folgendermaßen definiert:

`void myBubbleSort(void *arr, size_t numElem, size_t size, int (*compare)(const void *, const void *) );`

und die Vergleichsfunktion kann in der Funktion so aufgerufen werden:

`(*compare)(ptr, ptr+size)`

## Laufzeitanalyse mit clock() (2009)

Um die Zeitdauer von Programmteilen zu untersuchen, kann im einfachsten Fall ein interner Timer verwendet werden:

```c
// zeitmessung.c
//
#include <stdio.h>
#include <time.h>			// Library with Time-Functions

int main() {
    clock_t prgStart, prgEnd;
    int c;
  
    prgStart = clock();		// Ticks since Start of Program
    printf("Bitte geben Sie irgend etwas ein und beenden Sie mit '#'\n");
    printf("\n> ");

    while((c = getchar()) != '#')

    prgEnd=clock();			// Current Ticks

    // Zeit = (TicksAmEnde-TicksAmAnfang)   -- for converting into Seconds: Div durch CLOCKS_PER_SEC
    printf("\nDie Programmlaufzeit betrug %.2f Sekunden\n", (float)(prgEnd-prgStart) / CLOCKS_PER_SEC);
    return 0;
}
```

## Laufzeitanalyse von Sortieralgorithmen (2010)

Sie sollen unterschiedliche Sortieralgorithmen analysieren. Es soll ein Programm erstellt werden, mit dem drei verschiedene Zustände von Daten sortiert werden.

- Zuerst sollen Daten sortiert werden, bei denen das größte Element ganz am Anfang ist und absteigend das kleinste Element ganz am Ende. 
- Anschließend sollen Daten sortiert werden, die bereits in sortierter Form vorliegen.
- Im letzten Beispiel werden Daten sortiert, die mit Zufallsdaten belegt werden.

Die Anzahl der Elemente ist in einem solchen Fall natürlich auch entscheidend. Es werden dafür

- 10000,
- 100000 und
- 1000000 Elemente

verwendet, die nach den vorhandenen Zuständen sortiert werden sollen.

Es ist nur die Ausgabe des Programms von Interesse. Leiten Sie die Standardausgabe am Besten in eine Textdatei um, indem Sie im Programm noch vor der for-Schleife in der main()-Funktion Folgendes eingeben:

 

freopen("benchmark.txt","a+",stdout);



```c
#define MAX 10000

// Array containing numbers beginning with high down to low numbers
int test_array[MAX];

void init_test_array(int elements) {
    int i,j;
    for(i = elements-1, j = 0; i >= 0; i--, j++)
        test_array[j] = i;
}

// Already sorted Array
void init_test_array2(int elements) {
    int i;
    for(i = 0; i < elements; i++)
        test_array[i] = i;
}

// Array containing (pseude-)random numbers
void init_test_array3(int elements) {
    int i;
    for(i = 0; i < elements; i++)
        test_array[i] = rand();
}
```

Folgende Tabelle soll ausgegeben werden:

| Anzahl  | Datenzustand | Selection | Bubble | myQsort | C-qsort |
| ------- | ------------ | --------- | ------ | ------- | ------- |
| 10000   | aufsteigend  |           |        |         |         |
| 10000   | absteigend   |           |        |         |         |
| 10000   | sortiert     |           |        |         |         |
| 100000  | aufsteigend  |           |        |         |         |
| 100000  | absteigend   |           |        |         |         |
| 100000  | sortiert     |           |        |         |         |
| 1000000 | aufsteigend  |           |        |         |         |
| 1000000 | absteigend   |           |        |         |         |
| 1000000 | sortiert     |           |        |         |         |

Mithilfe dieser Analyse können Sie sich ein detaillierteres Bild von der Effizienz der einzelnen Algorithmen machen. Natürlich sollten Sie diese Laufzeitmessung nicht allzu genau nehmen. Für eine exaktere und genauere Messung sollten Sie auf jeden Fall einen Profiler einsetzen. Denn das Programm zur Laufzeitmessung ist während der Ausführung sicherlich nicht das einzige Programm, welches gerade auf Ihrem System läuft.

## Laufzeitanalyse mit Profiler

Für kleinere Programme können Sie eine Laufzeitmessung mit der Funktion clock() vornehmen. Für größere und umfangreiche Projekte ist diese Funktion aber weniger geeignet. Bei solch speziellen Fällen sollten Sie extra Programme einsetzen, die für diese geschrieben wurden, so genannte Profiler.

Ein Profiler ist ein eigenständiges Programm, welches Sie zur Laufzeitanalyse verwenden können. Der Vorteil dieses Werkzeugs ist, dass Sie mit ihm auch einzelne Funktionen analysieren können. So lässt sich schnell herausfinden, welcher Teil des Quellcodes mehr Zeit als gewöhnlich beansprucht. Ein Profiler ist ebenfalls ein Standardwerkzeug für Codetuning-Freaks.

Bei den kommerziellen Entwicklungsumgebungen ist der Profiler im Normalfall mit dabei. Es gibt aber auch einen kostenlosen Kommandozeilen-Profiler, den GNU-Profiler gprof, der für alle gängigen Systeme erhältlich ist.

- Als Erstes benötigen Sie einen fehlerfreien Quellcode, den Sie analysieren wollen. Dann müssen Sie den Quellcode mit dem Compilerschalter -pg übersetzen:
  `gcc -pg programmname.c`

-  Jetzt befindet sich im Verzeichnis eine Datei namens "a.out" (unter Windows/MS-DOS "a.exe"). Diese Datei ist die ausführbare Datei für Ihren Quellcode.

- Starten Sie jetzt das ausführbare Programm "a.out" ("a.exe").
  `./a.out`

  Nun werden die Profiling-Informationen in die Datei "gmon.out" geschrieben, die sich jetzt ebenfalls im Verzeichnis befindet.

- Nach Programmende können Sie gprof zur Auswertung der Datei"gmon.out" aufrufen. Die Ausgabe, welche häufig etwas länger ist, leiten Sie am besten in eine Datei um:
  `gprof ./a.out > test_prof.txt`

  bzw. (gprof a.exe > test_prof.txt). Die Textdatei "test_prof.txt" können Sie jetzt mit einem Editor Ihrer Wahl öffnen. Diese Datei beinhaltet wiederum zwei Dateien. Der erste Teil nennt

  - die verbrauchte Rechenzeit der Funktionen
  - die Anzahl der Aufrufe von Funktionen

  Im zweiten Teil befindet sich die Verteilung der Rechenzeit von Funktionen, auf die von ihnen aufgerufenen Unterfunktionen. Mehr zum Werkzeug gprof erfahren Sie in der entsprechenden Dokumentation.

## Visuelle Darstellung von Sortierverfahren

Erweitern Sie die js-Codes der einzelnen Sortieralgorithmen so, dass die HTML-Datei VisuellSort.html funktioniert.

Für die Entwicklung sehr komfortabel ist die Variante mit VSCode:

- in VSCode wird das Plugin `Live Server (Ritwick Dey)` installiert
- der Ordner mit der Sortier-Seite wird in VSCode geladen
- Zur Ausführung wird im Kontext-Menü der HTML-Datei `Open with Live Server` ausgeführt.