# Module in C++

## Klassisches Header-Konzept

Um ein C++ Programm in mehrere Teile zu zerteilen, werden die Programm-Teile in einzelnen cpp-Dateien abgelegt. Diese Teile können Funktionen oder Klassen sein.

Soll ein Programm-Teil einen anderen Teil einbinden, muss für die Kompilierung lediglich der Kopf einer Funktion oder Klasse bekannt gemacht werden. Die Prototypen werden in einer Header-Datei abgelegt. Mit diesem Kopf prüft der Compiler ob der Aufruf syntaktisch korrekt erfolgt. Erst wenn der Linker alle verwendeten Teilen zu einer lauffähigen Applikation zusammenbindet, muss der Quellcode aus sämtlichen cpp-Dateien vorhanden sein.

Problematisch mit diesem Konzept ist, dass es eine Rolle spielen kann in welcher Reihenfolge Header-Dateien eingebunden werden. Zusätzlich können *Zirkel-Bezüge* (*Circular-Dependency*) zu Fehlern führen. Dabei bezieht sich ein Module auf ein anderes Modul, dass sich wiederum auf das erstere bezieht.

In größeren Projekten ist das Compilieren entsprechend Zeitaufwendig.

Dieses c/c++ Konzept kann seit C++20 durch Module ersetzt werden.

## Clang-Compiler

Nachdem für Windows kein Binary von gcc für C++20 verfügbar ist wird hier mit clang gearbeitet. Dazu gibts precompilierte Binaries:

https://llvm.org/builds/

Windows snapshot builds -> Windows installer (64-bit)
([Windows installer (64-bit)](https://prereleases.llvm.org/win-snapshots/LLVM-12.0.0-6923b0a7-win64.exe) [(.sig)](https://prereleases.llvm.org/win-snapshots/LLVM-12.0.0-6923b0a7-win64.exe.sig),  based on Git commit [6923b0a7](https://github.com/llvm/llvm-project/commit/6923b0a7) (28 August 2020).)

## Module-Einführungsbeispiel

Im folgenden Beispiel werden zwei Zahlen addiert. Die verwendete Funktion wird in einem Modul *math.cppm* zur Verfügung gestellt (die Erweiterung cppm wird von *Clang* definiert):

```c++
// math.cppm
export module math;            // Modul-Deklaration

export int add(int a, int b){  // Export der add-Funktion
  return a + b;
} 
```

Verwendung:

```c++
// main.cpp
#include <iostream>

import math;									// Import des Moduls math

int main(){
   std::cout << add(2000, 20);					// Verwendung der Funktion add
}
```

*** für diese Beispiele ist ein neuer C++20-Compiler notwendig ***

Vorteil der Module:

- Die Reihenfolge von mehreren Import ist unerheblich.
- Der Compiler bindet lediglich diejenigen Teile ein, die wirklich benötigt werden.

Je nach Framework sind auch die klassischen Bibliotheken als Module verfügbar.

### Compilen

https://clang.llvm.org/docs/Modules.html

Für das vorangegangene Beispiel:

```
clang++ -std=c++20 -fmodules-ts -c math.cpp -Xclang -emit-module-interface -o math.pcm
clang++ -std=c++20 -fmodules-ts -fprebuilt-module-path=. main.cpp math.pcm -o math.exe
```

- Option -fmodules-ts: damit werden Module enabled.
- Im ersten Schritt wird aus dem Modul eine pcm-Datei **PreCompiled Module** generiert
- Im zweiten Schritt wird das Hauptprogramm compiliert und die notwendigen vorcompilierten Module dazugelinkt.

## 2tes Beispiel

(https://vector-of-bool.github.io/2019/03/10/modules-1.html)

* Implementierung in ein einzelnes Modul (z.B. speech.cppm):

  ```c++
  // speech.cppm
  export module speech;
  
  export const char* get_phrase_en() {
    return "Hello, world!";
  }
  
  export const char* get_phrase_es() {
    return "¡Hola Mundo!";
  }
  ```

  damit kann in einer main.cpp:

  ```c++
  // main.cpp
  import speech;
  #include <iostream>	// klassische Header-Files
  
  int main() {
    std::cout << get_phrase_en() << '\n';
  }
  ```

  Make:

  ```
  clang++ -std=c++20 -fmodules-ts --precompile speech.cppm -o speech.pcm && clang++ -std=c++20 -fmodules-ts -c speech.pcm -o speech.o && clang++ -std=c++20 -fmodules-ts -fprebuilt-module-path=. speech.o main.cpp -o speech.exe
  ```

### Module Partions are not yet Supported :-)

* der Code im vorhergehenden Beispiel ist gigantisch, daher wird er gesplittet:

  ```c++
  // speech.cppm
  export module speech;
  
  export import :english;		// english wird als Teil von speech exportiert
  export import :spanish;
  ```

  ```c++
  // speech_english.cppm
  export module speech:english;	// exportieren als Partition von speech
  
  export const char* get_phrase_en() {
  	return "Hello, world!";
  }
  ```

  ```c++
  // speech_spanish.cppm
  export module speech:spanish;
  
  export const char* get_phrase_es() {
  	return "¡Hola Mundo!";
  }
  ```

  ```c++
  // main.cpp
  import speech;		// nur speech wird importiert
  
  import <iostream>;
  import <cstdlib>;
  
  int main() {
    if (std::rand() % 2) {
      std::cout << get_phrase_en() << '\n';
    } else {
      std::cout << get_phrase_es() << '\n';
    }
  }
  ```

  Teile von Modulen werden als **Partitionen** bezeichnet.

* das gezeigte Aufteilen kann auch anders erreicht werden (nur als Ausschnitt):

  ```c++
  // speech.cpp
  export module speech;
  
  export import speech.english;		// speech.english wird durchgereicht
  export import speech.spanish;
  ```

  ```c++
  // speech_english.cpp
  export module speech.english;	// speech.english wird exportiert
  
  export const char* get_phrase_en() {
  	return "Hello, world!";
  }
  ```

  ```c++
  // main.cpp
  import speech;
  
  import <iostream>;
  import <cstdlib>;
  
  int main() {
    if (std::rand() % 2) {
      std::cout << get_phrase_en() << '\n';
    } else {
      std::cout << get_phrase_es() << '\n';
    }
  }
  ```

* Modul-Implementierungs-Variante

  ```c++
  // speech.cpp
  export module speech;
  
  import :english;
  import :spanish;
  
  export const char* get_phrase_en();
  export const char* get_phrase_es();
  ```

  ```c++
  // speech_english.cpp
  module speech:english;
  
  const char* get_phrase_en() {
  	return "Hello, world!";
  }
  ```

  ```c++
  // speech_spanish.cpp
  module speech:spanish;
  
  const char* get_phrase_es() {
      return "¡Hola Mundo!";
  }
  ```

  Hier wird in der Implementierung **kein export** vor die Funktion gesetzt, sie wird damit nicht exportiert und ist eine **reine Implementierung**. In *speech.cpp* ist dadurch der *export* der Funktionen notwendig.

  Zweite Variante:

  ```c++
  // speech.cpp
  export module speech;
  
  export const char* get_phrase_en();
  export const char* get_phrase_es();
  ```

  ```c++
  // speech_impl.cpp
  module speech;
  
  const char* get_phrase_en() {
    return "Hello, world!";
  }
  
  const char* get_phrase_es() {
    return "¡Hola Mundo!";
  }
  ```



### Übersetzen

https://gcc.gnu.org/wiki/cxx-modules

```
clang++ -std=c++20 -fmodules-ts --precompile math.cppm -o math.pcm
clang++ -std=c++20 -fmodules-ts -c math.pcm -o math.o
clang++ -std=c++20 -fmodules-ts -fprebuilt-module-path=. math.o main.cpp -o math
```

- -fmodules-ts



CB 20.3

msys2.

- im Terminal `pacman -Syu` für ein Update, am Ende des Updates Fenster schließen und neues Terminal aufmachen (msys2, 64Bit ..) und erneut update ausführen
- CLANG installieren: `pacman -S mingw-w64-x86_64-clang`
  https://www.youtube.com/watch?v=uyDBoogrHww
- GCC installieren: `pacman --needed -S mingw-w64-x86_64-gcc`
  `pacman --needed -S git mingw-w64-x86_64-gcc base-devel`
  https://www.youtube.com/watch?v=pb6Yb819pF0