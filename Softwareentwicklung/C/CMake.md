## CMake

Um aus einem Source-Projekt ein ausführbares Modul zu erzeugen sind mehrere Schritte notwendig. Viele Entwicklungsumgebungen gehen dabei unterschiedliche Wege. Eine moderne und sehr flexible Variante ist *CMake*. Damit wird nicht direkt das ausführbare Modul erzeugt sondern im ersten Schritt eine Konfiguration für die Compilierung erzeugt. In *CLion* wird *CMake* verwendet. Ansonsten kann CMake auch direkt installiert werden.

- Konfigurationsdatei `CMakeLists.txt`.

  ```
  project(HalloWelt C)
  
  set(CMAKE_C_STANDARD 11)
  
  add_executable(app main.c)
  ```

- Beispiel-Source `main.c`:

  ```c
  #include <stdio.h>
  int main() {
     printf("Hallo Welt!");
     return 0;
  }
  ```

- Beide Dateien werden gemeinsam in einem Verzeichnis, hier `c:/cm/` abgelegt. `cmake.exe` muss erreichbar sein. Eventuell ist das mit CLion verfügbar (*C:/Program Files/JetBrains/CLion 2020.1.2/bin/cmake/win/bin\*)

  ```
  c:\cm> mkdir build
  c:\cm> cd build
  c:\cm\build> cmake .. -G "MinGW Makefiles"
  c:\cm\build> cmake --build .
  ```

  Um die (vielen) erstellten Zwischenschritte nicht direkt im Src-Verzeichnis abzulegen, wird ein *build*-Verzeichnis erstellt. Aus diesem Verzeichnis wird *CMake* gestartet mit dem Verzeichnis, in welchem die Konfiguration *CMakeLists.txt* abgelegt ist (hier das übergeordnete Verzeichnis ..). Der zweite Parameter gibt an was erzeugt werden soll. Mit *MinGW Makefiles* wird ein *[Makefile](Makefile.md)* erstellt, mittels welchem dann ein *Make* gestartet werden kann.

Ref.: <https://riptutorial.com/de/cmake>

[Makefile](Makefile.md)