# 1 Einführung C

- Entwickelt ~1975 von Dennis Ritchie / Bell Laboratories als Nachfolger von B
- Eine der am weitesten verbreiteten Sprachen
- Implementierung vieler Unix-Betriebssysteme in C
- Viele Kompiler anderer Sprachen sind in C implementiert worden
- Viele Sprachen übernahmen Teile der Syntax
- Mehrfach standardisiert (ANSI-C ... C11, C18)
- Imperativ/Prozedural (= keine OOP)

## Anwendungsgebiete

- Systemnahe Programmierung
- Eingebettete Systeme

Merkmale:

- Portabilität (auf allen Systemen verfügbar)
- Effizienz
- Direkter Hardwarezugriff

## Compiler

K&R	(Kernighan and Ritchie)
C90
C95
C99
C11
C17

...

Für den Embedded-Bereich: Cross-Compiler (auf PC wird ein Programm für eine andere Laufzeitumgebung erstellt)

Frei erhältlich:

- GCC (8.1.0)

- Clang 12.0.0 (BSD-ähnlichen Lizenz)

Beispiel:

```
>gcc -c main.c
>gcc main.o -o test.exe
>test.exe
```

mit gcc und der Option -c wird die Datei main.c kompiliert. Es wird eine main.o (Objekt-Datei) erzeugt.

mit gcc ohne die -c Option wird der Linker aufgerufen. Damit werden sämtliche angeführte .o-Dateien (wenn's mehrere Dateien gibt ...) miteinander verlinkt und als test.exe (für Windows) erzeugt. In anderen (Linux ...) Betriebssystemen läuft das genau gleich.

## IDE

Als Anfänger empfiehlt sich eine einfache IDE (Entwicklungsumgebung). Mächtigere mögen zwar "schöner" oder "professioneller" wirken. Sie sind auf alle Fälle immer schwieriger zu bedienen und setzen voraus, dass man sich länger mit ihnen beschäftigt.

1. Code::Blocks - http://www.codeblocks.org/downloads

2. VisualStudio - https://www.visualstudio.com/de/downloads/

   Visual Studio ist eine IDE für C++, für einfache C-Projekte sind einige Einstellungen zu tätigen:

   C++ Projekt --> Konsolenapplikation

   - Datei als *.c speichern (Standard ist cpp)
   - -->Projekt --> ConsoleApplication1-Eigenschaftenseiten --> C/C++ --> Erweitert --> Kompilierungsart --> "Als C-Code kompilieren (/TC)"
   - --> Projekt --> ConsoleApplication1-Eigenschaftenseiten --> C/C++ --> Präprozessor --> Präprozessordefinitionen --> "_CRT_SECURE_NO_WARNINGS" einfügen
   - damit stdfx.h nicht eingebunden werden muss: --> Projekt --> ConsoleApplication1-Eigenschaftenseiten --> C/C++ --> Vorkompilierte Header --> Vorkompilierte Header nicht verwenden einstellen

3. QtCreator - http://download.qt.io/official_releases/online_installers/qt-unified-windows-x86-online.exe (Open Source)

4. Eclipse - https://www.eclipse.org/

5. CLion - https://www.jetbrains.com/clion/  (als Schüler freie Benutzung)

6. Visual Studio Code - ist genau genommen ein Editor, mit entsprechenden Plugins kann ein wenig unterstützt werden.

## Referenzen

- C von A bis Z, Jürgen Wolf

  http://openbook.rheinwerk-verlag.de/c_von_a_bis_z/

## Fragen

- Was bedeutet "C ist eine prozedureale Programmiersprache"?
- Wie kann in der Kommandozeile mittels gcc aus einem main.c eine test.exe erzeugt werden?