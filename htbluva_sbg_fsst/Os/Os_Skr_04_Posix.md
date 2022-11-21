# 4 Os - POSIX

Um Programme nicht für jedes Betriebssystem komplett neu entwickeln zu müssen wurde schon Früh, gewisse häufig notwendige Funktionen als Anwenderschnittstellen (**A**pplication **P**rogramming **I**nterface) , in ähnlicher Form von verschiedenen Betriebssystemen angeboten. Daraus wurde in Folge eine vom IEEE (und in Folge von ISO und IEC) standardisierte Schnittstelle die unter dem Namen **POSIX** (Portable Operating System Interface) (https://publications.opengroup.org/g101).

Gerade im UNIX-Bereich halten sich sehr viele Derivate an (zumindest ältere Formen) den Standard.

Der Standard setzt sich aus vier Teilen zusammen:

- **Basis-Definitions**: Erklärung des Standards
- **System-Interface**: Header-Dateien für C und Systemaufrufe (https://pubs.opengroup.org/onlinepubs/9699919799/idx/functions.html)
- **Hilfsprogramme und Kommandozeile (Shell & Utilities)**: Liste der verfügbaren Systemprogramme und ein Interpreter für die Kommandozeile
- **Erläuterungen (Rationale)**: Details

Zu einem guten Teil sind viele Linux-OS POSIX kompatibel. 

In *MS-Windows NT*  wurde eine entsprechende Kompatibilität angestrebt, wohl vor allem, weil die US-Regierung für Software im offiziellen Einsatz POSIX-Kompatibilität forderte. Für neuere Versionen, kann mittels *Cygwin*, eine POSIX-kompatible Runtime-Umgebung installiert werden. Für Windows 10 wird mittlerweile von MS ein *Windows Subsystem für Linux (WSL)* angeboten, um mittels entsprechender Images, Kompatibilität zu Linux anzubieten.

## Signale

In C können laut ANSI-Standard Signale in einer Anwendung reagiert werden:

Hier wird auf das Signal **SIGINT** mittels der Funktion **sigfunc** reagiert:

```c
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <windows.h>  // windows-sleep

int rec = 0;

void sigfunc(int sig) {
    rec = 1;
    if (sig == SIGINT) printf("SIGINT wurde ausgeloest\n");
}

int main() {
    signal(SIGINT, sigfunc);

    while (rec == 0)
        Sleep(1000);

    return 0;
}

```

lt. ANSI-Standard gibt es folgende Signale:

| Name    | Beschreibung                                                 |
| ------- | ------------------------------------------------------------ |
| SIGABRT | signalisiert, dass sich das Programm abnormal beendet hat (abort()) |
| SIGFPE  | wird angezeigt bei einer Division durch 0 oder einem Überlauf einer Zahl |
| SIGILL  | wird angezeigt, wenn ein illegaler Hardware-Befehl ausgeführt wird |
| SIGINT  | wird an alle Prozesse geschickt, wenn die Tastenkombination (Strg) + (C) gedrückt wurde |
| SIGSEGV | es wurde versucht, auf eine unerlaubte Speicherstelle zu schreiben oder diese zu lesen |
| SIGTERM | Beendigung eines Programms                                   |

Der ANSI-Standard definiert das - Windows setzt das jedoch nicht um. SIGINT wird etwa nicht an alle Prozesse geschickt.

In Windows gibt es noch einige weitere Signale (Ausgabe mit `kill -l`)

Eine weitere Möglichkeit: Ignorieren von Signalen:

```c
signal(SIGINT, SIG_IGN);
```

Auslösen von Signalen (hier SIGINT):

```c
#include <signal.h>
...
raise(SIGINT);
```

