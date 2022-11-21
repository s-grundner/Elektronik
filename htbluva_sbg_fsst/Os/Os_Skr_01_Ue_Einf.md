# 1 Os Windows Tools - Übungen

Windows: Liste aller laufenden Prozesse:

```
> tasklist
...
```

bzw. filtern mit Pipe

```
> tasklist | find "chrome"
chrome.exe                    8928 Console                    4       153.964 K
chrome.exe                   14888 Console                    4         6.472 K
chrome.exe                   13812 Console                    4         8.736 K
chrome.exe                    6920 Console                    4       197.228 K
chrome.exe                    3436 Console                    4        40.148 K
chrome.exe                   12264 Console                    4        67.896 K
chrome.exe                   14936 Console                    4        31.756 K
chrome.exe                    5840 Console                    4        36.792 K
chrome.exe                   13288 Console                    4        45.440 K
chrome.exe                    6756 Console                    4       132.264 K
chrome.exe                     812 Console                    4        40.948 K
chrome.exe                     696 Console                    4        50.208 K
chrome.exe                    8092 Console                    4        38.820 K
chrome.exe                    6788 Console                    4        36.128 K
chrome.exe                    5456 Console                    4        36.204 K
chrome.exe                    7260 Console                    4        36.936 K
chrome.exe                    9040 Console                    4        75.324 K
chrome.exe                    8044 Console                    4        59.416 K
chrome.exe                   14572 Console                    4        73.580 K
chrome.exe                   11680 Console                    4        20.828 K
```

Für Information betreffend beteiligten dlls:

```
> tasklist /m chrome*

Abbildname                     PID Module
========================= ======== ============================================
chrome.exe                    8928 chrome_elf.dll, chrome.dll
chrome.exe                   14888 chrome_elf.dll
chrome.exe                   13812 chrome_elf.dll, chrome_watcher.dll
chrome.exe                    6920 chrome_elf.dll, chrome_child.dll
chrome.exe                    3436 chrome_elf.dll, chrome_child.dll
chrome.exe                   12264 chrome_elf.dll, chrome_child.dll
chrome.exe                   14936 chrome_elf.dll, chrome_child.dll
chrome.exe                    5840 chrome_elf.dll, chrome_child.dll
chrome.exe                   13288 chrome_elf.dll, chrome_child.dll
chrome.exe                    6756 chrome_elf.dll, chrome_child.dll
chrome.exe                     812 chrome_elf.dll, chrome_child.dll
chrome.exe                     696 chrome_elf.dll, chrome_child.dll
chrome.exe                    8092 chrome_elf.dll, chrome_child.dll
chrome.exe                    6788 chrome_elf.dll, chrome_child.dll
chrome.exe                    5456 chrome_elf.dll, chrome_child.dll
chrome.exe                    7260 chrome_elf.dll, chrome_child.dll
chrome.exe                    9040 chrome_elf.dll, chrome_child.dll
chrome.exe                    8044 chrome_elf.dll, chrome_child.dll
chrome.exe                   14572 chrome_elf.dll, chrome_child.dll
chrome.exe                   12728 chrome_elf.dll, chrome_child.dll
```

Beenden von Prozessen mittels Name:

```
> taskkill /f /im notepad.exe
ERFOLGREICH: Der Prozess "notepad.exe" mit PID 13152 wurde beendet.
```

Beenden von Prozessen mittels PID:

```
> tasklist | find "notepad"
notepad.exe                  15136 Console                    4        13.976 K

> taskkill /pid 15136
ERFOLGREICH: Ein Beendigungssignal wurde an den Prozess mit der PID 15136 geschickt.
```

## Prozessmonitor

Von den Microsoft-Systeminternals:

https://download.sysinternals.com/files/ProcessMonitor.zip

Beschreibung:

 https://www.heise.de/select/ct/2016/20/1475141035373311 bzw.  https://docs.microsoft.com/de-at/sysinternals/downloads/procmon?redirectedfrom=MSDN 

Mit diesem Tool kann gezeigt werden wie ein Thread in einem Prozess gestartet oder beendet wird (zusätzlich zu jeder Menge Registry-Zugriffen). Dabei ist es sinnvoll einen geeigneten Filter zu konfigurieren, ansonsten ist die Datenmenge enorm groß.

Beispiel:

```
#include <iostream>
#include <thread>

static void func() {
    std::thread::id this_id = std::this_thread::get_id();
    for (int i = 1; i > 0; i++)
        std::cout << "Thread-Id: " << this_id << "PID: " << ::getpid() << std::endl;
}

int main() {
    std::thread t(func);

    t.join(); // Main wartet auf Ende des func-Threads

    return 0;
}
```

## Speicherlayout C-Programm

Für folgendes C-Programm wird ein Speicherauszug erstellt:

```c
#include <stdio.h>

int global_uninitialized;
int global_initialized = 4711;

void uboot(void) {}

int main(void) {
    int local;
    printf("%p\n%p\n%p\n%p\n",
        &global_uninitialized,
        &global_initialized,
        &uboot,
        &local);
    return 0;
}
```

Die Ausführung liefert:

```
0000000000407970
0000000000403010
0000000000401550
000000000061FE1C
```

Mit den folgenden Anweisungen kann das Speicherlayout eines C-Programms (mittels gcc) ermittelt werden:

```
gcc main.c -o main.exe
nm main.exe -r -n
```

und das liefert uns (Auszug):

```
0000000000408000	i	.idata$2
0000000000407988	B	__bss_end__
0000000000407980	B	__native_startup_lock
0000000000407978	B	__native_startup_state
0000000000407970	B	global_uninitialized                <----- B=BSS
0000000000407968	B	__mingw_winmain_hInstance
0000000000407960	B	__mingw_winmain_lpCmdLine
0000000000407960	b	.bss
0000000000403020	d	.data
0000000000403010	D	global_initialized                  <----- D=DATA
0000000000403010	d	.data
0000000000403010	d	.data
0000000000403000	D	__mingw_winmain_nShowCmd
0000000000403000	D	__data_start__
0000000000403000	d	.data
0000000000401650	T	__main
00000000004015e0	T	__do_global_ctors
00000000004015a0	T	__do_global_dtors
00000000004015a0	t	.text
0000000000401552	T	main                                <----- T=TEXT
0000000000401550	T	uboot                               <----- T=TEXT
0000000000401550	t	.text
0000000000401540	T	__gcc_deregister_frame
0000000000401530	T	__gcc_register_frame
0000000000401530	t	.text
0000000000401510	T	atexit
00000000004014fc	t	.l_end
00000000004014e4	t	.l_start
00000000004014e0	T	mainCRTStartup
00000000004014cc	t	.l_endw
00000000004014b4	t	.l_startw
00000000004014b0	T	WinMainCRTStartup
0000000000401180	t	__tmainCRTStartup
0000000000401130	t	pre_cpp_init
0000000000401010	t	pre_c_init
```

Warum ist `local` nicht zu finden (beachten Sie die Adresse)? 

Diese Variable ist eine lokale und landet damit im Stack-Speicherbereich. Dieser wird erst bei der Ausführung des Programms angelegt und kann vorab nicht bestimmt werden.